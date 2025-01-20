@interface DIDropInSession
+ (BOOL)supportsSecureCoding;
+ (id)stringForDropInSessionState:(unint64_t)a3;
+ (id)stringForDropInSessionStateReason:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUplinkMuted;
- (BOOL)needsInitialUplinkMuteStatus;
- (DIDropInRequest)request;
- (DIDropInSession)init;
- (DIDropInSession)initWithCoder:(id)a3;
- (DIDropInSession)initWithNullableRequest:(id)a3;
- (DIDropInSessionDelegate)delegate;
- (DIXPCConnectionManager)connectionManager;
- (NSArray)participants;
- (NSDate)sessionEndDate;
- (NSDate)sessionStartTimeoutDate;
- (NSRecursiveLock)lock;
- (NSUUID)identifier;
- (id)description;
- (unint64_t)state;
- (unint64_t)stateReason;
- (void)cancelWithCompletionHandler:(id)a3;
- (void)cancelWithError:(id)a3 completionHandler:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)endWithCompletionHandler:(id)a3;
- (void)failWithError:(id)a3;
- (void)setConnectionManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setNeedsInitialUplinkMuteStatus:(BOOL)a3;
- (void)setParticipants:(id)a3;
- (void)setSessionEndDate:(id)a3;
- (void)setSessionStartTimeoutDate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateReason:(unint64_t)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)updateUplinkMuteStatus:(BOOL)a3;
- (void)updateWithSession:(id)a3;
@end

@implementation DIDropInSession

- (DIDropInSession)init
{
  return [(DIDropInSession *)self initWithNullableRequest:0];
}

- (DIDropInSession)initWithNullableRequest:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DIDropInSession;
  v6 = [(DIDropInSession *)&v15 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    lock = v6->_lock;
    v6->_lock = (NSRecursiveLock *)v7;

    v6->_needsInitialUplinkMuteStatus = 1;
    v6->_state = 2;
    v6->_stateReason = 0;
    uint64_t v9 = objc_opt_new();
    participants = v6->_participants;
    v6->_participants = (NSArray *)v9;

    uint64_t v11 = objc_opt_new();
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v11;

    objc_storeStrong((id *)&v6->_request, a3);
    v13 = [v5 connectionManager];
    objc_storeWeak((id *)&v6->_connectionManager, v13);
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  id v5 = DILogHandleDropInSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    uint64_t v7 = &stru_26FF62CC0;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Delegate set to %@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DIDropInSession *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int v6 = [(DIDropInSession *)self identifier];
      uint64_t v7 = [(DIDropInSession *)v5 identifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  objc_super v15 = NSString;
  uint64_t v14 = objc_opt_class();
  v3 = [(DIDropInSession *)self identifier];
  id v4 = +[DIDropInSession stringForDropInSessionState:[(DIDropInSession *)self state]];
  id v5 = +[DIDropInSession stringForDropInSessionStateReason:[(DIDropInSession *)self stateReason]];
  int v6 = [(DIDropInSession *)self sessionStartTimeoutDate];
  uint64_t v7 = [(DIDropInSession *)self sessionEndDate];
  char v8 = [(DIDropInSession *)self request];
  id v9 = [(DIDropInSession *)self participants];
  uint64_t v10 = [(DIDropInSession *)self connectionManager];
  uint64_t v11 = [(DIDropInSession *)self delegate];
  v12 = [v15 stringWithFormat:@"<%@: %p> Identifier = %@, State = %@, State Reason = %@, StartTimeout = %@, EndDate = %@, Request = %@, Participants = %@, Connection Manager = %p, Delegate = %@", v14, self, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = DILogHandleDropInSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = +[DIDropInSession stringForDropInSessionState:a3];
    *(_DWORD *)buf = 138412802;
    v22 = &stru_26FF62CC0;
    __int16 v23 = 2112;
    v24 = v6;
    __int16 v25 = 2112;
    v26 = self;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Updating state to %@ for session %@", buf, 0x20u);
  }
  uint64_t v7 = [(DIDropInSession *)self lock];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __28__DIDropInSession_setState___block_invoke;
  v20[3] = &unk_2652FC7A8;
  v20[4] = self;
  v20[5] = a3;
  objc_msgSend(v7, "di_synchronize:", v20);

  char v8 = [(DIDropInSession *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(DIDropInSession *)self connectionManager];
    uint64_t v11 = [v10 manager];
    v12 = [v11 clientQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __28__DIDropInSession_setState___block_invoke_2;
    v19[3] = &unk_2652FC7A8;
    v19[4] = self;
    v19[5] = a3;
    +[DIUtilities onQueue:v12 block:v19];
  }
  v13 = [(DIDropInSession *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    objc_super v15 = [(DIDropInSession *)self connectionManager];
    v16 = [v15 manager];
    v17 = [v16 clientQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __28__DIDropInSession_setState___block_invoke_32;
    v18[3] = &unk_2652FC7A8;
    v18[4] = self;
    v18[5] = a3;
    +[DIUtilities onQueue:v17 block:v18];
  }
}

uint64_t __28__DIDropInSession_setState___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) = *(void *)(result + 40);
  return result;
}

void __28__DIDropInSession_setState___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = DILogHandleDropInSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = +[DIDropInSession stringForDropInSessionState:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = &stru_26FF62CC0;
    __int16 v8 = 2112;
    char v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_24D00D000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Updating state to %@ for session %@", (uint8_t *)&v6, 0x20u);
  }
  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 session:*(void *)(a1 + 32) didUpdateState:*(void *)(a1 + 40)];
}

void __28__DIDropInSession_setState___block_invoke_32(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = DILogHandleDropInSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = +[DIDropInSession stringForDropInSessionState:*(void *)(a1 + 40)];
    uint64_t v4 = *(void **)(a1 + 32);
    int v6 = 138413058;
    uint64_t v7 = &stru_26FF62CC0;
    __int16 v8 = 2112;
    char v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = [v4 stateReason];
    _os_log_impl(&dword_24D00D000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Updating state to %@ for session %@ with reason %lu", (uint8_t *)&v6, 0x2Au);
  }
  id v5 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v5, "session:didUpdateState:reason:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "stateReason"));
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(DIDropInSession *)self connectionManager];
  int v6 = [v5 manager];
  uint64_t v7 = [v6 clientContext];

  __int16 v8 = [(DIDropInSession *)self connectionManager];
  char v9 = [v8 manager];
  __int16 v10 = [v9 connection];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46__DIDropInSession_startWithCompletionHandler___block_invoke;
  v17[3] = &unk_2652FC7F8;
  v17[4] = self;
  id v11 = v4;
  id v18 = v11;
  __int16 v12 = [v10 remoteObjectProxyWithErrorHandler:v17];
  uint64_t v13 = [(DIDropInSession *)self request];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__DIDropInSession_startWithCompletionHandler___block_invoke_2;
  v15[3] = &unk_2652FC820;
  v15[4] = self;
  id v16 = v11;
  id v14 = v11;
  [v12 startSessionWithContext:v7 request:v13 completionHandler:v15];
}

void __46__DIDropInSession_startWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = DILogHandleDropInSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    objc_super v15 = &stru_26FF62CC0;
    __int16 v16 = 2112;
    id v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_impl(&dword_24D00D000, v4, OS_LOG_TYPE_ERROR, "%@Failed to start Session Error = %@, Session = %@", buf, 0x20u);
  }

  int v6 = [*(id *)(a1 + 32) connectionManager];
  uint64_t v7 = [v6 manager];
  __int16 v8 = [v7 clientQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__DIDropInSession_startWithCompletionHandler___block_invoke_33;
  v11[3] = &unk_2652FC7D0;
  id v9 = *(id *)(a1 + 40);
  id v12 = v3;
  id v13 = v9;
  id v10 = v3;
  +[DIUtilities onQueue:v8 block:v11];
}

uint64_t __46__DIDropInSession_startWithCompletionHandler___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __46__DIDropInSession_startWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [*(id *)(a1 + 32) setStateReason:0];
    [*(id *)(a1 + 32) setState:6];
    uint64_t v5 = DILogHandleDropInSession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v21 = &stru_26FF62CC0;
      __int16 v22 = 2112;
      id v23 = v4;
      __int16 v24 = 2112;
      uint64_t v25 = v6;
      uint64_t v7 = "%@Failed to start Error = %@, Session = %@";
      __int16 v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 32;
LABEL_6:
      _os_log_impl(&dword_24D00D000, v8, v9, v7, buf, v10);
    }
  }
  else
  {
    uint64_t v5 = DILogHandleDropInSession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v21 = &stru_26FF62CC0;
      __int16 v22 = 2112;
      id v23 = v11;
      uint64_t v7 = "%@Started Session %@";
      __int16 v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 22;
      goto LABEL_6;
    }
  }

  id v12 = [*(id *)(a1 + 32) connectionManager];
  id v13 = [v12 manager];
  id v14 = [v13 clientQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46__DIDropInSession_startWithCompletionHandler___block_invoke_35;
  v17[3] = &unk_2652FC7D0;
  id v15 = *(id *)(a1 + 40);
  id v18 = v4;
  id v19 = v15;
  id v16 = v4;
  +[DIUtilities onQueue:v14 block:v17];
}

uint64_t __46__DIDropInSession_startWithCompletionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)endWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DIDropInSession *)self connectionManager];
  uint64_t v6 = [v5 manager];
  uint64_t v7 = [v6 clientContext];

  __int16 v8 = [(DIDropInSession *)self connectionManager];
  os_log_type_t v9 = [v8 manager];
  uint32_t v10 = [v9 connection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__DIDropInSession_endWithCompletionHandler___block_invoke;
  v16[3] = &unk_2652FC7F8;
  v16[4] = self;
  id v11 = v4;
  id v17 = v11;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__DIDropInSession_endWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_2652FC7F8;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 endSessionWithContext:v7 session:self completionHandler:v14];
}

void __44__DIDropInSession_endWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = DILogHandleDropInSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = &stru_26FF62CC0;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_24D00D000, v4, OS_LOG_TYPE_ERROR, "%@Failed to End Session %@", buf, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) connectionManager];
  uint64_t v6 = [v5 manager];
  uint64_t v7 = [v6 clientQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__DIDropInSession_endWithCompletionHandler___block_invoke_37;
  v10[3] = &unk_2652FC7D0;
  id v8 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  +[DIUtilities onQueue:v7 block:v10];
}

uint64_t __44__DIDropInSession_endWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __44__DIDropInSession_endWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connectionManager];
  uint64_t v5 = [v4 manager];
  uint64_t v6 = [v5 clientQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__DIDropInSession_endWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_2652FC7D0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  +[DIUtilities onQueue:v6 block:v9];
}

uint64_t __44__DIDropInSession_endWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)cancelWithCompletionHandler:(id)a3
{
}

- (void)cancelWithError:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DIDropInSession *)self connectionManager];
  id v9 = [v8 manager];
  id v10 = [v9 clientContext];

  id v11 = [(DIDropInSession *)self connectionManager];
  id v12 = [v11 manager];
  id v13 = [v12 connection];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __53__DIDropInSession_cancelWithError_completionHandler___block_invoke;
  v19[3] = &unk_2652FC7F8;
  v19[4] = self;
  id v14 = v6;
  id v20 = v14;
  __int16 v15 = [v13 remoteObjectProxyWithErrorHandler:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __53__DIDropInSession_cancelWithError_completionHandler___block_invoke_2;
  v17[3] = &unk_2652FC7F8;
  void v17[4] = self;
  id v18 = v14;
  id v16 = v14;
  [v15 cancelSessionWithContext:v10 session:self error:v7 completionHandler:v17];
}

void __53__DIDropInSession_cancelWithError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = DILogHandleDropInSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = &stru_26FF62CC0;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_24D00D000, v4, OS_LOG_TYPE_ERROR, "%@Failed to cancel session %@", buf, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) connectionManager];
  id v6 = [v5 manager];
  id v7 = [v6 clientQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__DIDropInSession_cancelWithError_completionHandler___block_invoke_38;
  v10[3] = &unk_2652FC7D0;
  id v8 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  +[DIUtilities onQueue:v7 block:v10];
}

uint64_t __53__DIDropInSession_cancelWithError_completionHandler___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __53__DIDropInSession_cancelWithError_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connectionManager];
  uint64_t v5 = [v4 manager];
  id v6 = [v5 clientQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__DIDropInSession_cancelWithError_completionHandler___block_invoke_3;
  v9[3] = &unk_2652FC7D0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  +[DIUtilities onQueue:v6 block:v9];
}

uint64_t __53__DIDropInSession_cancelWithError_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)isUplinkMuted
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = DILogHandleDropInSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = &stru_26FF62CC0;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_DEFAULT, "%@Getting uplink muted", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [(DIDropInSession *)self lock];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__DIDropInSession_isUplinkMuted__block_invoke;
  v7[3] = &unk_2652FC898;
  v7[4] = self;
  v7[5] = &buf;
  objc_msgSend(v4, "di_synchronize:", v7);

  char v5 = *(unsigned char *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v5;
}

void __32__DIDropInSession_isUplinkMuted__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) needsInitialUplinkMuteStatus])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v2 = [*(id *)(a1 + 32) connectionManager];
    id v3 = [v2 manager];
    id v4 = [v3 connection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __32__DIDropInSession_isUplinkMuted__block_invoke_2;
    v12[3] = &unk_2652FC848;
    v12[4] = *(void *)(a1 + 40);
    char v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v12];
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    id v8 = __32__DIDropInSession_isUplinkMuted__block_invoke_39;
    uint64_t v9 = &unk_2652FC870;
    objc_copyWeak(&v11, &location);
    uint64_t v10 = *(void *)(a1 + 40);
    [v5 getUplinkMutedForCurrentSessionWithCompletionHandler:&v6];

    if ((objc_msgSend(*(id *)(a1 + 32), "needsInitialUplinkMuteStatus", v6, v7, v8, v9) & 1) == 0) {
      *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  }
}

void __32__DIDropInSession_isUplinkMuted__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  id v4 = DILogHandleDropInSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412546;
    uint64_t v6 = &stru_26FF62CC0;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_24D00D000, v4, OS_LOG_TYPE_ERROR, "%@Failed to get uplink muted for current session %@", (uint8_t *)&v5, 0x16u);
  }
}

void __32__DIDropInSession_isUplinkMuted__block_invoke_39(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v7 = WeakRetained;
  if (v5)
  {
    id v8 = DILogHandleDropInSession();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412546;
      uint64_t v10 = &stru_26FF62CC0;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_24D00D000, v8, OS_LOG_TYPE_ERROR, "%@Failed to get uplink muted for current session %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    [WeakRetained setNeedsInitialUplinkMuteStatus:0];
  }
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = DILogHandleDropInSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v13 = &stru_26FF62CC0;
    __int16 v14 = 1024;
    BOOL v15 = v3;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Setting uplink muted to %d", buf, 0x12u);
  }

  uint64_t v6 = [(DIDropInSession *)self connectionManager];
  __int16 v7 = [v6 manager];
  id v8 = [v7 connection];
  int v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__DIDropInSession_setUplinkMuted___block_invoke_41;
  v10[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  BOOL v11 = v3;
  [v9 setUplinkMutedForCurrentSession:v3 completionHandler:v10];
}

void __34__DIDropInSession_setUplinkMuted___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = DILogHandleDropInSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412546;
    id v5 = &stru_26FF62CC0;
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_ERROR, "%@Failed to set uplink muted %@", (uint8_t *)&v4, 0x16u);
  }
}

void __34__DIDropInSession_setUplinkMuted___block_invoke_41(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v4 = DILogHandleDropInSession();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = *(unsigned __int8 *)(a1 + 32);
      int v11 = 138412546;
      id v12 = &stru_26FF62CC0;
      __int16 v13 = 1024;
      int v14 = v6;
      id v7 = "%@Failed to set uplink muted to %d";
      uint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_24D00D000, v8, v9, v7, (uint8_t *)&v11, 0x12u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(unsigned __int8 *)(a1 + 32);
    int v11 = 138412546;
    id v12 = &stru_26FF62CC0;
    __int16 v13 = 1024;
    int v14 = v10;
    id v7 = "%@Uplink muted set to %d";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }
}

- (NSArray)participants
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy_;
  int v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  BOOL v3 = [(DIDropInSession *)self lock];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__DIDropInSession_participants__block_invoke;
  v6[3] = &unk_2652FC900;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "di_synchronize:", v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

uint64_t __31__DIDropInSession_participants__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  return MEMORY[0x270F9A758]();
}

- (void)setParticipants:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000;
  __int16 v24 = __Block_byref_object_copy_;
  uint64_t v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v5 = [(DIDropInSession *)self lock];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __35__DIDropInSession_setParticipants___block_invoke;
  v20[3] = &unk_2652FC900;
  v20[4] = self;
  v20[5] = &v21;
  objc_msgSend(v5, "di_synchronize:", v20);

  int v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
  if ([(id)v22[5] isEqualToSet:v6])
  {
    uint64_t v7 = DILogHandleDropInSession();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v28 = &stru_26FF62CC0;
      _os_log_impl(&dword_24D00D000, v7, OS_LOG_TYPE_INFO, "%@No changes in participant list", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = [(DIDropInSession *)self lock];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __35__DIDropInSession_setParticipants___block_invoke_43;
    v18[3] = &unk_2652FC928;
    v18[4] = self;
    id v9 = v4;
    id v19 = v9;
    objc_msgSend(v8, "di_synchronize:", v18);

    int v10 = [(DIDropInSession *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(DIDropInSession *)self connectionManager];
      __int16 v13 = [v12 manager];
      int v14 = [v13 clientQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __35__DIDropInSession_setParticipants___block_invoke_2;
      v15[3] = &unk_2652FC928;
      id v16 = v9;
      uint64_t v17 = self;
      +[DIUtilities onQueue:v14 block:v15];
    }
  }

  _Block_object_dispose(&v21, 8);
}

uint64_t __35__DIDropInSession_setParticipants___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x263EFFA08] setWithArray:*(void *)(*(void *)(a1 + 32) + 16)];
  return MEMORY[0x270F9A758]();
}

uint64_t __35__DIDropInSession_setParticipants___block_invoke_43(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = [*(id *)(a1 + 40) copy];
  return MEMORY[0x270F9A758]();
}

void __35__DIDropInSession_setParticipants___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = DILogHandleDropInSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412802;
    uint64_t v7 = &stru_26FF62CC0;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_24D00D000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Updating participants to %@ for session %@", (uint8_t *)&v6, 0x20u);
  }

  id v5 = [*(id *)(a1 + 40) delegate];
  [v5 session:*(void *)(a1 + 40) didUpdateParticipants:*(void *)(a1 + 32)];
}

- (NSDate)sessionStartTimeoutDate
{
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  __int16 v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(DIDropInSession *)self lock];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__DIDropInSession_sessionStartTimeoutDate__block_invoke;
  v6[3] = &unk_2652FC900;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "di_synchronize:", v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

void __42__DIDropInSession_sessionStartTimeoutDate__block_invoke(uint64_t a1)
{
}

- (void)setSessionStartTimeoutDate:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000;
  __int16 v24 = __Block_byref_object_copy_;
  uint64_t v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v5 = DILogHandleDropInSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    v28 = &stru_26FF62CC0;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_INFO, "%@Update session start timeout date: %@", buf, 0x16u);
  }

  int v6 = [(DIDropInSession *)self lock];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __46__DIDropInSession_setSessionStartTimeoutDate___block_invoke;
  v20[3] = &unk_2652FC900;
  v20[4] = self;
  v20[5] = &v21;
  objc_msgSend(v6, "di_synchronize:", v20);

  if ([(id)v22[5] isEqualToDate:v4])
  {
    uint64_t v7 = DILogHandleDropInSession();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v28 = &stru_26FF62CC0;
      _os_log_impl(&dword_24D00D000, v7, OS_LOG_TYPE_INFO, "%@No changes to start timeout date", buf, 0xCu);
    }
  }
  else
  {
    __int16 v8 = [(DIDropInSession *)self lock];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __46__DIDropInSession_setSessionStartTimeoutDate___block_invoke_46;
    v18[3] = &unk_2652FC928;
    v18[4] = self;
    id v9 = v4;
    id v19 = v9;
    objc_msgSend(v8, "di_synchronize:", v18);

    __int16 v10 = [(DIDropInSession *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(DIDropInSession *)self connectionManager];
      __int16 v13 = [v12 manager];
      int v14 = [v13 clientQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __46__DIDropInSession_setSessionStartTimeoutDate___block_invoke_2;
      v15[3] = &unk_2652FC928;
      id v16 = v9;
      uint64_t v17 = self;
      +[DIUtilities onQueue:v14 block:v15];
    }
  }
  _Block_object_dispose(&v21, 8);
}

uint64_t __46__DIDropInSession_setSessionStartTimeoutDate___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) sessionStartTimeoutDate];
  return MEMORY[0x270F9A758]();
}

void __46__DIDropInSession_setSessionStartTimeoutDate___block_invoke_46(uint64_t a1)
{
}

void __46__DIDropInSession_setSessionStartTimeoutDate___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = DILogHandleDropInSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412802;
    uint64_t v7 = &stru_26FF62CC0;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_24D00D000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Updating sessionStartTimeoutDate to %@ for session %@", (uint8_t *)&v6, 0x20u);
  }

  id v5 = [*(id *)(a1 + 40) delegate];
  [v5 session:*(void *)(a1 + 40) didUpdateSessionStartTimeoutDate:*(void *)(a1 + 32)];
}

- (NSDate)sessionEndDate
{
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  __int16 v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(DIDropInSession *)self lock];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__DIDropInSession_sessionEndDate__block_invoke;
  v6[3] = &unk_2652FC900;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "di_synchronize:", v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

void __33__DIDropInSession_sessionEndDate__block_invoke(uint64_t a1)
{
}

- (void)setSessionEndDate:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000;
  __int16 v24 = __Block_byref_object_copy_;
  uint64_t v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v5 = DILogHandleDropInSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    v28 = &stru_26FF62CC0;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_INFO, "%@Update session end date: %@", buf, 0x16u);
  }

  int v6 = [(DIDropInSession *)self lock];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __37__DIDropInSession_setSessionEndDate___block_invoke;
  v20[3] = &unk_2652FC900;
  v20[4] = self;
  v20[5] = &v21;
  objc_msgSend(v6, "di_synchronize:", v20);

  if ([(id)v22[5] isEqualToDate:v4])
  {
    uint64_t v7 = DILogHandleDropInSession();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v28 = &stru_26FF62CC0;
      _os_log_impl(&dword_24D00D000, v7, OS_LOG_TYPE_INFO, "%@No changes to end date", buf, 0xCu);
    }
  }
  else
  {
    __int16 v8 = [(DIDropInSession *)self lock];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __37__DIDropInSession_setSessionEndDate___block_invoke_49;
    v18[3] = &unk_2652FC928;
    v18[4] = self;
    id v9 = v4;
    id v19 = v9;
    objc_msgSend(v8, "di_synchronize:", v18);

    __int16 v10 = [(DIDropInSession *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(DIDropInSession *)self connectionManager];
      __int16 v13 = [v12 manager];
      int v14 = [v13 clientQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __37__DIDropInSession_setSessionEndDate___block_invoke_2;
      v15[3] = &unk_2652FC928;
      id v16 = v9;
      uint64_t v17 = self;
      +[DIUtilities onQueue:v14 block:v15];
    }
  }
  _Block_object_dispose(&v21, 8);
}

uint64_t __37__DIDropInSession_setSessionEndDate___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) sessionEndDate];
  return MEMORY[0x270F9A758]();
}

void __37__DIDropInSession_setSessionEndDate___block_invoke_49(uint64_t a1)
{
}

void __37__DIDropInSession_setSessionEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = DILogHandleDropInSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412802;
    uint64_t v7 = &stru_26FF62CC0;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_24D00D000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Updating sessionEndDate to %@ for session %@", (uint8_t *)&v6, 0x20u);
  }

  id v5 = [*(id *)(a1 + 40) delegate];
  [v5 session:*(void *)(a1 + 40) didUpdateSessionEndDate:*(void *)(a1 + 32)];
}

+ (id)stringForDropInSessionState:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    uint64_t v3 = @"Unknown";
  }
  else {
    uint64_t v3 = off_2652FC990[a3 - 1];
  }
  return (id)[NSString stringWithFormat:@"(%lu) %@", a3, v3];
}

+ (id)stringForDropInSessionStateReason:(unint64_t)a3
{
  if (a3 > 6) {
    uint64_t v3 = @"Unknown";
  }
  else {
    uint64_t v3 = off_2652FC9C8[a3];
  }
  return (id)[NSString stringWithFormat:@"(%lu) %@", a3, v3];
}

- (void)updateWithSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DIDropInSession *)self lock];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__DIDropInSession_updateWithSession___block_invoke;
  v7[3] = &unk_2652FC928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "di_synchronize:", v7);
}

void __37__DIDropInSession_updateWithSession___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setStateReason:", objc_msgSend(*(id *)(a1 + 40), "stateReason"));
  objc_msgSend(*(id *)(a1 + 32), "setState:", objc_msgSend(*(id *)(a1 + 40), "state"));
  id v2 = [*(id *)(a1 + 40) participants];
  [*(id *)(a1 + 32) setParticipants:v2];

  uint64_t v3 = [*(id *)(a1 + 40) sessionStartTimeoutDate];
  [*(id *)(a1 + 32) setSessionStartTimeoutDate:v3];

  id v4 = [*(id *)(a1 + 40) sessionEndDate];
  [*(id *)(a1 + 32) setSessionEndDate:v4];
}

- (void)failWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DILogHandleDropInSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412802;
    uint64_t v15 = &stru_26FF62CC0;
    __int16 v16 = 2112;
    id v17 = v4;
    __int16 v18 = 2112;
    id v19 = self;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_ERROR, "%@Session failed with error %@. Session = %@", buf, 0x20u);
  }

  id v6 = [(DIDropInSession *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(DIDropInSession *)self connectionManager];
    uint64_t v9 = [v8 manager];
    __int16 v10 = [v9 clientQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __33__DIDropInSession_failWithError___block_invoke;
    v11[3] = &unk_2652FC928;
    id v12 = v4;
    __int16 v13 = self;
    +[DIUtilities onQueue:v10 block:v11];
  }
}

void __33__DIDropInSession_failWithError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = DILogHandleDropInSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412802;
    char v7 = &stru_26FF62CC0;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_24D00D000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Session failed with error %@. Session = %@", (uint8_t *)&v6, 0x20u);
  }

  id v5 = [*(id *)(a1 + 40) delegate];
  [v5 session:*(void *)(a1 + 40) didFailWithError:*(void *)(a1 + 32)];
}

- (void)updateUplinkMuteStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = DILogHandleDropInSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v17 = &stru_26FF62CC0;
    __int16 v18 = 1024;
    BOOL v19 = v3;
    __int16 v20 = 2112;
    uint64_t v21 = self;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Update uplink mute status %d. Session = %@", buf, 0x1Cu);
  }

  int v6 = [(DIDropInSession *)self lock];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__DIDropInSession_updateUplinkMuteStatus___block_invoke;
  v14[3] = &unk_2652FC950;
  v14[4] = self;
  BOOL v15 = v3;
  objc_msgSend(v6, "di_synchronize:", v14);

  char v7 = [(DIDropInSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(DIDropInSession *)self connectionManager];
    __int16 v10 = [v9 manager];
    uint64_t v11 = [v10 clientQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__DIDropInSession_updateUplinkMuteStatus___block_invoke_2;
    v12[3] = &unk_2652FC950;
    BOOL v13 = v3;
    v12[4] = self;
    +[DIUtilities onQueue:v11 block:v12];
  }
}

uint64_t __42__DIDropInSession_updateUplinkMuteStatus___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) setNeedsInitialUplinkMuteStatus:0];
}

void __42__DIDropInSession_updateUplinkMuteStatus___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = DILogHandleDropInSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    char v7 = &stru_26FF62CC0;
    __int16 v8 = 1024;
    int v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_24D00D000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Update uplink mute status %d. Session = %@", (uint8_t *)&v6, 0x1Cu);
  }

  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 session:*(void *)(a1 + 32) didUpdateUplinkMuteStatus:*(unsigned __int8 *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DIDropInSession *)self identifier];
  [v4 encodeObject:v5 forKey:@"Identifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DIDropInSession state](self, "state"), @"State");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIDropInSession stateReason](self, "stateReason"), @"StateReason");
  int v6 = [(DIDropInSession *)self participants];
  [v4 encodeObject:v6 forKey:@"Participants"];

  char v7 = [(DIDropInSession *)self sessionStartTimeoutDate];
  [v4 encodeObject:v7 forKey:@"StartTimeoutDate"];

  id v8 = [(DIDropInSession *)self sessionEndDate];
  [v4 encodeObject:v8 forKey:@"EndDate"];
}

- (DIDropInSession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DIDropInSession *)self init];
  if (!v5)
  {
LABEL_11:
    char v7 = v5;
    goto LABEL_12;
  }
  int v6 = self;
  char v7 = [v4 decodeObjectOfClass:v6 forKey:@"Identifier"];

  if (v7)
  {
    objc_storeStrong((id *)&v5->_identifier, v7);
    v5->_state = [v4 decodeIntegerForKey:@"State"];
    v5->_stateReason = [v4 decodeIntegerForKey:@"StateReason"];
    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    __int16 v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Participants"];
    uint64_t v12 = (void *)v11;
    if (v11) {
      BOOL v13 = (void *)v11;
    }
    else {
      BOOL v13 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&v5->_participants, v13);

    int v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StartTimeoutDate"];
    if (v14) {
      objc_storeStrong((id *)&v5->_sessionStartTimeoutDate, v14);
    }
    BOOL v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EndDate"];
    if (v15) {
      objc_storeStrong((id *)&v5->_sessionEndDate, v15);
    }

    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

- (DIDropInSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DIDropInSessionDelegate *)WeakRetained;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (DIDropInRequest)request
{
  return self->_request;
}

- (DIXPCConnectionManager)connectionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionManager);
  return (DIXPCConnectionManager *)WeakRetained;
}

- (void)setConnectionManager:(id)a3
{
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (BOOL)needsInitialUplinkMuteStatus
{
  return self->_needsInitialUplinkMuteStatus;
}

- (void)setNeedsInitialUplinkMuteStatus:(BOOL)a3
{
  self->_needsInitialUplinkMuteStatus = a3;
}

- (unint64_t)stateReason
{
  return self->_stateReason;
}

- (void)setStateReason:(unint64_t)a3
{
  self->_stateReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartTimeoutDate, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end