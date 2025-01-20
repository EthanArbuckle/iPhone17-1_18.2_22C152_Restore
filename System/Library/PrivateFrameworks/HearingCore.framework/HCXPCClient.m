@interface HCXPCClient
+ (HCXPCClient)clientWithConnection:(id)a3;
- (BOOL)sendMessage:(id)a3 errorBlock:(id)a4;
- (BOOL)wantsUpdatesForIdentifier:(unint64_t)a3;
- (HCXPCClient)initWithConnection:(id)a3;
- (OS_dispatch_queue)xpcQueue;
- (OS_xpc_object)xpcConnection;
- (id)description;
- (int)pid;
- (unint64_t)requestedUpdates;
- (void)dealloc;
- (void)setRequestedUpdates:(unint64_t)a3;
- (void)setWantsUpdates:(BOOL)a3 forIdentifier:(unint64_t)a4;
- (void)setXpcConnection:(id)a3;
- (void)setXpcQueue:(id)a3;
- (void)teardownConnection;
@end

@implementation HCXPCClient

+ (HCXPCClient)clientWithConnection:(id)a3
{
  id v3 = a3;
  v4 = [[HCXPCClient alloc] initWithConnection:v3];

  return v4;
}

- (HCXPCClient)initWithConnection:(id)a3
{
  v4 = (_xpc_connection_s *)a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)HCXPCClient;
    self = [(HCXPCClient *)&v14 init];
    if (self)
    {
      id v5 = [NSString alloc];
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      v8 = [MEMORY[0x1E4F29128] UUID];
      v9 = [v8 UUIDString];
      v10 = (void *)[v5 initWithFormat:@"%@.%@.%@-%p", @"com.apple.accessibility.heard", v7, v9, v4];

      id v11 = v10;
      v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
      xpc_connection_set_target_queue(v4, v12);
      [(HCXPCClient *)self setXpcQueue:v12];
      [(HCXPCClient *)self setXpcConnection:v4];
    }
  }

  return self;
}

- (void)dealloc
{
  [(HCXPCClient *)self setXpcConnection:0];
  [(HCXPCClient *)self setXpcQueue:0];
  v3.receiver = self;
  v3.super_class = (Class)HCXPCClient;
  [(HCXPCClient *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = [(HCXPCClient *)self xpcConnection];
  if (v3)
  {
    v4 = [(HCXPCClient *)self xpcConnection];
    uint64_t pid = xpc_connection_get_pid(v4);
  }
  else
  {
    uint64_t pid = 0xFFFFFFFFLL;
  }

  v6 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HCXPCClient;
  v7 = [(HCXPCClient *)&v10 description];
  v8 = [v6 stringWithFormat:@"%@ [%d]", v7, pid];

  return v8;
}

- (int)pid
{
  objc_super v3 = [(HCXPCClient *)self xpcConnection];
  if (v3)
  {
    v4 = [(HCXPCClient *)self xpcConnection];
    pid_t pid = xpc_connection_get_pid(v4);
  }
  else
  {
    pid_t pid = -1;
  }

  return pid;
}

- (void)teardownConnection
{
  [(HCXPCClient *)self setXpcConnection:0];
  [(HCXPCClient *)self setXpcQueue:0];
}

- (void)setWantsUpdates:(BOOL)a3 forIdentifier:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(HCXPCClient *)self requestedUpdates];
  if (v5)
  {
    if ((v7 & a4) != a4)
    {
      v8 = HCLogHearingXPC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = messageIdentifierDescription(a4);
        int v13 = 138412546;
        objc_super v14 = self;
        __int16 v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_1B8AF3000, v8, OS_LOG_TYPE_DEFAULT, "Client %@ wants update for: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    unint64_t v10 = [(HCXPCClient *)self requestedUpdates] | a4;
  }
  else
  {
    if ((v7 & a4) == a4)
    {
      id v11 = HCLogHearingXPC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = messageIdentifierDescription(a4);
        int v13 = 138412546;
        objc_super v14 = self;
        __int16 v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_1B8AF3000, v11, OS_LOG_TYPE_DEFAULT, "Client %@ doesn't want update for: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    unint64_t v10 = [(HCXPCClient *)self requestedUpdates] & ~a4;
  }
  [(HCXPCClient *)self setRequestedUpdates:v10];
}

- (BOOL)wantsUpdatesForIdentifier:(unint64_t)a3
{
  return (a3 & ~[(HCXPCClient *)self requestedUpdates]) == 0;
}

- (BOOL)sendMessage:(id)a3 errorBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HCXPCClient *)self xpcQueue];

  if (v8)
  {
    v9 = [(HCXPCClient *)self xpcQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__HCXPCClient_sendMessage_errorBlock___block_invoke;
    block[3] = &unk_1E6191AA8;
    block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v9, block);
  }
  return 1;
}

void __38__HCXPCClient_sendMessage_errorBlock___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) xpcConnection];

  if (!v2)
  {
    id v8 = 0;
    goto LABEL_17;
  }
  objc_super v3 = (void *)MEMORY[0x1E4F483B0];
  v4 = [*(id *)(a1 + 40) payload];
  BOOL v5 = [*(id *)(a1 + 40) xpcMessage];
  id v26 = 0;
  id v6 = (void *)[v3 copyXPCMessageFromDictionary:v4 inReplyToXPCMessage:v5 error:&v26];
  id v7 = v26;

  if (v6)
  {
    id v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F483B0];
    unint64_t v10 = [*(id *)(a1 + 40) payload];
    id v25 = v7;
    id v6 = (void *)[v9 copyXPCMessageFromDictionary:v10 inReplyToXPCMessage:0 error:&v25];
    id v8 = v25;

    if (!v6)
    {
      uint64_t v15 = 0;
      id v13 = NSString;
      BOOL v14 = 1;
      goto LABEL_10;
    }
  }
  uint64_t v11 = MEMORY[0x1BA9C7120](v6);
  uint64_t v12 = MEMORY[0x1E4F14590];
  if (v11 != MEMORY[0x1E4F14590])
  {
    id v13 = NSString;
    BOOL v14 = MEMORY[0x1BA9C7120](v6) == v12;
    uint64_t v15 = 1;
LABEL_10:
    uint64_t v17 = [*(id *)(a1 + 32) xpcConnection];
    [v13 stringWithFormat:@"Not sending %d, %d, %d = %@ ==== %@", v15, v14, v17 != 0, v8, *(void *)(a1 + 40)];
    v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

    HAInitializeLogging();
    v18 = [NSString stringWithFormat:@"%@", v16];
    v19 = [NSString stringWithFormat:@"%s:%d %@", "-[HCXPCClient sendMessage:errorBlock:]_block_invoke", 107, v18];
    v20 = (void *)HAEngineeringLog;
    if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v19;
      v22 = v20;
      uint64_t v23 = [v21 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v28 = v23;
      _os_log_impl(&dword_1B8AF3000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"Send message error", @"%@", v16);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_14;
  }
  v16 = [*(id *)(a1 + 32) xpcConnection];
  xpc_connection_send_message(v16, v6);
LABEL_14:

  if (v8)
  {
    uint64_t v24 = *(void *)(a1 + 48);
    if (v24) {
      (*(void (**)(uint64_t, id))(v24 + 16))(v24, v8);
    }
  }
LABEL_17:
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)setXpcQueue:(id)a3
{
}

- (unint64_t)requestedUpdates
{
  return self->_requestedUpdates;
}

- (void)setRequestedUpdates:(unint64_t)a3
{
  self->_requestedUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end