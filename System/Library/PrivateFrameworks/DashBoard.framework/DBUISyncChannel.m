@interface DBUISyncChannel
- (CARSession)session;
- (CARSessionChannel)sessionChannel;
- (DBUISyncChannel)initWithSession:(id)a3;
- (NSMutableDictionary)observers;
- (NSTimer)reconnectTimer;
- (NSXPCConnection)connection;
- (void)_startConnection;
- (void)_stopConnection;
- (void)addObserver:(id)a3 forDisplayID:(id)a4;
- (void)channel:(id)a3 didReceiveMessage:(id)a4;
- (void)didCloseChannel:(id)a3;
- (void)didOpenChannel:(id)a3;
- (void)didSendMessageForChannel:(id)a3;
- (void)removeObserver:(id)a3 forDisplayID:(id)a4;
- (void)sendPayload:(id)a3 forDisplayID:(id)a4 description:(id)a5;
- (void)setConnection:(id)a3;
- (void)setObservers:(id)a3;
- (void)setReconnectTimer:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionChannel:(id)a3;
@end

@implementation DBUISyncChannel

- (DBUISyncChannel)initWithSession:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DBUISyncChannel;
  v5 = [(DBUISyncChannel *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_session, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    observers = v6->_observers;
    v6->_observers = v7;

    id v9 = objc_alloc(MEMORY[0x263F30E40]);
    uint64_t v10 = *MEMORY[0x263F01548];
    v11 = [NSNumber numberWithInt:12];
    uint64_t v12 = [v9 initWithSession:v4 channelType:v10 channelID:@"7DED4F02-38A6-4CBA-8731-4B9BA40CB044" withoutReply:1 qualityOfService:v11 streamPriority:&unk_26E17EDF8];
    sessionChannel = v6->_sessionChannel;
    v6->_sessionChannel = (CARSessionChannel *)v12;

    [(CARSessionChannel *)v6->_sessionChannel setChannelDelegate:v6];
  }

  return v6;
}

- (void)addObserver:(id)a3 forDisplayID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = DBLogForCategory(0x12uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(DBUISyncChannel *)self sessionChannel];
    int v18 = 138412546;
    id v19 = v7;
    __int16 v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Registering observer for %@: %@", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v10 = [(DBUISyncChannel *)self observers];
  v11 = [v10 objectForKey:v7];

  if (!v11)
  {
    id v12 = objc_alloc(MEMORY[0x263F30E18]);
    v11 = (void *)[v12 initWithProtocol:&unk_26E2216D8 callbackQueue:MEMORY[0x263EF83A0]];
    v13 = [(DBUISyncChannel *)self observers];
    [v13 setObject:v11 forKey:v7];
  }
  [v11 registerObserver:v6];
  v14 = [(DBUISyncChannel *)self sessionChannel];
  char v15 = [v14 isOpened];

  if (v15)
  {
    v16 = DBLogForCategory(0x12uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(DBUISyncChannel *)self sessionChannel];
      int v18 = 138412290;
      id v19 = v17;
      _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_DEFAULT, "Channel is already opened: %@", (uint8_t *)&v18, 0xCu);
    }
    [v6 didOpen:self];
  }
  else
  {
    [(DBUISyncChannel *)self _startConnection];
  }
}

- (void)removeObserver:(id)a3 forDisplayID:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = DBLogForCategory(0x12uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(DBUISyncChannel *)self sessionChannel];
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Unregistering observer for %@: %@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v10 = [(DBUISyncChannel *)self observers];
  v11 = [v10 objectForKey:v6];

  [v11 unregisterObserver:v7];
  if (([v11 hasObservers] & 1) == 0)
  {
    id v12 = [(DBUISyncChannel *)self observers];
    [v12 removeObjectForKey:v6];
  }
  v13 = [(DBUISyncChannel *)self observers];
  v14 = [v13 allKeys];
  uint64_t v15 = [v14 count];

  if (!v15) {
    [(DBUISyncChannel *)self _stopConnection];
  }
}

- (void)sendPayload:(id)a3 forDisplayID:(id)a4 description:(id)a5
{
  v17[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v16[0] = @"displayUUID";
  v16[1] = @"data";
  v17[0] = a4;
  v17[1] = a3;
  id v9 = NSDictionary;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 dictionaryWithObjects:v17 forKeys:v16 count:2];

  int v15 = 0;
  v13 = (void *)MEMORY[0x230F8C8D0](v12, 0, &v15);
  if (v13)
  {
    v14 = [(DBUISyncChannel *)self sessionChannel];
    [v14 sendChannelMessage:v13 withDescription:v8];
  }
  else
  {
    v14 = DBLogForCategory(0x12uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[DBUISyncChannel sendPayload:forDisplayID:description:](&v15, v14);
    }
  }
}

- (void)_startConnection
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v3 = [a1 sessionChannel];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "Failed to open channel: %@", v4, 0xCu);
}

void __35__DBUISyncChannel__startConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startConnection];
}

- (void)_stopConnection
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = DBLogForCategory(0x12uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(DBUISyncChannel *)self sessionChannel];
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Stopping channel: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = [(DBUISyncChannel *)self sessionChannel];
  [v5 closeChannel];

  id v6 = [(DBUISyncChannel *)self reconnectTimer];
  [v6 invalidate];

  [(DBUISyncChannel *)self setReconnectTimer:0];
}

- (void)didSendMessageForChannel:(id)a3
{
  id v3 = a3;
  id v4 = DBLogForCategory(0x12uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[DBUISyncChannel didSendMessageForChannel:]();
  }
}

- (void)channel:(id)a3 didReceiveMessage:(id)a4
{
  int v15 = 0;
  id v5 = a4;
  objc_opt_class();
  id v6 = (void *)OPACKDecodeData();

  id v7 = v6;
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8)
  {
    uint64_t v9 = [v8 objectForKey:@"displayUUID"];
    id v10 = [v8 objectForKey:@"data"];
    id v11 = DBLogForCategory(0x12uLL);
    id v12 = v11;
    if (v9 && v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[DBUISyncChannel channel:didReceiveMessage:]();
      }

      v13 = [(DBUISyncChannel *)self observers];
      id v12 = [v13 objectForKey:v9];

      if (v12)
      {
        [v12 clusterController:self didReceivePayload:v10];
      }
      else
      {
        v14 = DBLogForCategory(0x12uLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[DBUISyncChannel channel:didReceiveMessage:]();
        }
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[DBUISyncChannel channel:didReceiveMessage:].cold.4();
    }
  }
  else
  {
    uint64_t v9 = DBLogForCategory(0x12uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DBUISyncChannel channel:didReceiveMessage:](&v15, v9);
    }
  }
}

- (void)didOpenChannel:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DBLogForCategory(0x12uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Did open channel: %@", buf, 0xCu);
  }

  id v6 = [(DBUISyncChannel *)self observers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__DBUISyncChannel_didOpenChannel___block_invoke;
  v7[3] = &unk_2649B6E48;
  v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __34__DBUISyncChannel_didOpenChannel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 didOpen:*(void *)(a1 + 32)];
}

- (void)didCloseChannel:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DBLogForCategory(0x12uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Did close channel: %@", buf, 0xCu);
  }

  id v6 = [(DBUISyncChannel *)self observers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__DBUISyncChannel_didCloseChannel___block_invoke;
  v7[3] = &unk_2649B6E48;
  v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __35__DBUISyncChannel_didCloseChannel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 didClose:*(void *)(a1 + 32)];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CARSessionChannel)sessionChannel
{
  return self->_sessionChannel;
}

- (void)setSessionChannel:(id)a3
{
}

- (CARSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (CARSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (NSTimer)reconnectTimer
{
  return self->_reconnectTimer;
}

- (void)setReconnectTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reconnectTimer, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_sessionChannel, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)sendPayload:(int *)a1 forDisplayID:(NSObject *)a2 description:.cold.1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "Unable to package payload: %d", (uint8_t *)v3, 8u);
}

- (void)didSendMessageForChannel:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_22D6F0000, v0, OS_LOG_TYPE_DEBUG, "Channel %@ successfully sent message", v1, 0xCu);
}

- (void)channel:(int *)a1 didReceiveMessage:(NSObject *)a2 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "Error parsing message: %d", (uint8_t *)v3, 8u);
}

- (void)channel:didReceiveMessage:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_22D6F0000, v0, OS_LOG_TYPE_DEBUG, "No observers registered for %@", v1, 0xCu);
}

- (void)channel:didReceiveMessage:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_22D6F0000, v1, OS_LOG_TYPE_DEBUG, "Channel for %@ received message: %@", v2, 0x16u);
}

- (void)channel:didReceiveMessage:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_22D6F0000, v0, OS_LOG_TYPE_ERROR, "Received message without displayID or data: %@", v1, 0xCu);
}

@end