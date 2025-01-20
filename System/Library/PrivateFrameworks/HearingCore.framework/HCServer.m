@interface HCServer
- (AXHeardServerDelegate)delegate;
- (AXHeardServerMessageDelegate)messageDelegate;
- (BOOL)deadConnection;
- (BOOL)isConnected;
- (HCServer)init;
- (OS_dispatch_queue)connectionQueue;
- (OS_xpc_object)xpcConnection;
- (id)setupServerIfNecessary;
- (void)dealloc;
- (void)handleMessageError:(id)a3 destructive:(BOOL)a4;
- (void)handleMessageWithPayload:(id)a3 forIdentifier:(unint64_t)a4;
- (void)handleReply:(id)a3;
- (void)resetConnection;
- (void)sendMessageWithPayload:(id)a3 andIdentifier:(unint64_t)a4;
- (void)sendSynchronousMessageWithPayload:(id)a3 andIdentifier:(unint64_t)a4;
- (void)setConnectionQueue:(id)a3;
- (void)setDeadConnection:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMessageDelegate:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)shouldRestartOnInterruption:(id)a3;
- (void)startServerAndBoostPriority;
- (void)terminateConnectionAndNotify:(BOOL)a3;
@end

@implementation HCServer

- (HCServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)HCServer;
  v2 = [(HCServer *)&v6 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("heard_xpc_queue", v3);

    [(HCServer *)v2 setConnectionQueue:v4];
  }
  return v2;
}

- (void)dealloc
{
  [(HCServer *)self terminateConnectionAndNotify:1];
  v3.receiver = self;
  v3.super_class = (Class)HCServer;
  [(HCServer *)&v3 dealloc];
}

- (void)terminateConnectionAndNotify:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  HAInitializeLogging();
  v5 = [NSString stringWithFormat:@"Connection terminated: %@", self];
  objc_super v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HCServer terminateConnectionAndNotify:]", 45, v5];
  v7 = (void *)HAEngineeringLog;
  if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v14 = [v8 UTF8String];
    _os_log_impl(&dword_1B8AF3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v10 = [(HCServer *)self connectionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HCServer_terminateConnectionAndNotify___block_invoke;
  block[3] = &unk_1E6191AD0;
  block[4] = self;
  BOOL v12 = a3;
  dispatch_async(v10, block);
}

void __41__HCServer_terminateConnectionAndNotify___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setXpcConnection:0];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) delegate];
    if (v2)
    {
      objc_super v3 = (void *)v2;
      dispatch_queue_t v4 = [*(id *)(a1 + 32) delegate];
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        id v6 = [*(id *)(a1 + 32) delegate];
        [v6 hearingServerDidDie:*(void *)(a1 + 32)];
      }
    }
  }
}

- (void)resetConnection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  HAInitializeLogging();
  objc_super v3 = [NSString stringWithFormat:@"Connection reset: %@", self];
  dispatch_queue_t v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HCServer resetConnection]", 58, v3];
  char v5 = (void *)HAEngineeringLog;
  if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_1B8AF3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(HCServer *)self terminateConnectionAndNotify:1];
}

- (void)shouldRestartOnInterruption:(id)a3
{
}

- (BOOL)isConnected
{
  uint64_t v2 = [(HCServer *)self xpcConnection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)handleReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1BA9C7120]();
  if (v5 == MEMORY[0x1E4F145A8])
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __24__HCServer_handleReply___block_invoke;
    v22[3] = &unk_1E6191AF8;
    v22[4] = self;
    uint64_t v9 = MEMORY[0x1BA9C6EC0](v22);
    uint64_t v10 = (void *)v9;
    if (v4 == (id)MEMORY[0x1E4F14520])
    {
      v11 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __24__HCServer_handleReply___block_invoke_14;
      block[3] = &unk_1E6191B70;
      block[4] = self;
      id v21 = v10;
      dispatch_async(v11, block);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
    }
    if (v4 == (id)MEMORY[0x1E4F14528])
    {
      BOOL v12 = HCLogHearingXPC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[HCServer handleReply:](v12);
      }

      [(HCServer *)self setDeadConnection:1];
    }
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"Error in client connection event handler: %s", xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]));
    [(HCServer *)self handleMessageError:v13 destructive:1];
  }
  else if (v5 == MEMORY[0x1E4F14590])
  {
    id v19 = 0;
    id v6 = [MEMORY[0x1E4F483B0] dictionaryFromXPCMessage:v4 error:&v19];
    id v7 = v19;
    if (v7) {
      goto LABEL_4;
    }
    uint64_t v14 = [v6 objectForKey:@"axha_payload"];
    if (!v14) {
      goto LABEL_4;
    }
    uint64_t v15 = (void *)v14;
    v16 = [v6 objectForKey:@"axha_messageID"];
    uint64_t v17 = [v16 unsignedLongLongValue];

    if (v17)
    {
      id v8 = [v6 objectForKey:@"axha_payload"];
      v18 = [v6 objectForKey:@"axha_messageID"];
      -[HCServer handleMessageWithPayload:forIdentifier:](self, "handleMessageWithPayload:forIdentifier:", v8, [v18 unsignedLongLongValue]);
    }
    else
    {
LABEL_4:
      id v8 = [NSString stringWithFormat:@"Malformed message: %@", v6];
      [(HCServer *)self handleMessageError:v8 destructive:0];
    }
  }
}

uint64_t __24__HCServer_handleReply___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = HCLogHearingXPC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B8AF3000, v3, OS_LOG_TYPE_DEFAULT, "Restarting connection", v6, 2u);
    }

    return [*(id *)(a1 + 32) resetConnection];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 terminateConnectionAndNotify:0];
  }
}

void __24__HCServer_handleReply___block_invoke_14(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __24__HCServer_handleReply___block_invoke_2;
  v2[3] = &unk_1E6191B48;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 shouldRestartOnInterruption:v2];
}

void __24__HCServer_handleReply___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) connectionQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__HCServer_handleReply___block_invoke_3;
  v6[3] = &unk_1E6191B20;
  id v7 = *(id *)(a1 + 40);
  char v8 = a2;
  dispatch_async(v4, v6);

  uint64_t v5 = HCLogHearingXPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __24__HCServer_handleReply___block_invoke_2_cold_1(a2, v5);
  }
}

uint64_t __24__HCServer_handleReply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)setupServerIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(HCServer *)self connectionQueue];
  mach_service = [(HCServer *)self xpcConnection];
  if (!mach_service)
  {
    if ([(HCServer *)self deadConnection])
    {
      mach_service = 0;
    }
    else
    {
      mach_service = xpc_connection_create_mach_service((const char *)[@"com.apple.accessibility.heard" UTF8String], v3, 0);
      xpc_connection_set_target_queue(mach_service, v3);
      objc_initWeak(&location, self);
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      uint64_t v9 = __34__HCServer_setupServerIfNecessary__block_invoke;
      uint64_t v10 = &unk_1E6191B98;
      objc_copyWeak(&v11, &location);
      xpc_connection_set_event_handler(mach_service, &v7);
      xpc_connection_activate(mach_service);
      -[HCServer setXpcConnection:](self, "setXpcConnection:", mach_service, v7, v8, v9, v10);
      uint64_t v5 = HCLogHearingXPC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = self;
        _os_log_impl(&dword_1B8AF3000, v5, OS_LOG_TYPE_DEFAULT, "Set new xpc connection: %@", buf, 0xCu);
      }

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }

  return mach_service;
}

void __34__HCServer_setupServerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleReply:v3];
}

- (void)sendSynchronousMessageWithPayload:(id)a3 andIdentifier:(unint64_t)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F483B0];
  id v6 = +[HCUtilities messagePayloadFromDictionary:a3 andIdentifier:a4];
  id v13 = 0;
  uint64_t v7 = (void *)[v5 copyXPCMessageFromDictionary:v6 inReplyToXPCMessage:0 error:&v13];
  id v8 = v13;

  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (!v9)
  {
    uint64_t v10 = [(HCServer *)self connectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__HCServer_sendSynchronousMessageWithPayload_andIdentifier___block_invoke;
    block[3] = &unk_1E6191BC0;
    block[4] = self;
    id v12 = v7;
    dispatch_async(v10, block);
  }
}

void __60__HCServer_sendSynchronousMessageWithPayload_andIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) setupServerIfNecessary];
  if (v2)
  {
    id v4 = v2;
    xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, *(xpc_object_t *)(a1 + 40));
    [*(id *)(a1 + 32) handleReply:v3];

    uint64_t v2 = v4;
  }
}

- (void)sendMessageWithPayload:(id)a3 andIdentifier:(unint64_t)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F483B0];
  id v6 = +[HCUtilities messagePayloadFromDictionary:a3 andIdentifier:a4];
  id v13 = 0;
  uint64_t v7 = (void *)[v5 copyXPCMessageFromDictionary:v6 inReplyToXPCMessage:0 error:&v13];
  id v8 = v13;

  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (!v9)
  {
    uint64_t v10 = [(HCServer *)self connectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__HCServer_sendMessageWithPayload_andIdentifier___block_invoke;
    block[3] = &unk_1E6191BC0;
    block[4] = self;
    id v12 = v7;
    dispatch_async(v10, block);
  }
}

void __49__HCServer_sendMessageWithPayload_andIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) setupServerIfNecessary];
  if (v2)
  {
    xpc_object_t v3 = v2;
    xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));
    uint64_t v2 = v3;
  }
}

- (void)startServerAndBoostPriority
{
}

- (void)handleMessageWithPayload:(id)a3 forIdentifier:(unint64_t)a4
{
  id v9 = a3;
  id v6 = [(HCServer *)self messageDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(HCServer *)self messageDelegate];
    [v8 handleMessageWithPayload:v9 forIdentifier:a4];
  }
}

- (void)handleMessageError:(id)a3 destructive:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(HCServer *)self messageDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(HCServer *)self messageDelegate];
    [v8 handleMessageError:v9 destructive:v4];
  }
}

- (AXHeardServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXHeardServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXHeardServerMessageDelegate)messageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageDelegate);
  return (AXHeardServerMessageDelegate *)WeakRetained;
}

- (void)setMessageDelegate:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (BOOL)deadConnection
{
  return self->_deadConnection;
}

- (void)setDeadConnection:(BOOL)a3
{
  self->_deadConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_destroyWeak((id *)&self->_messageDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)handleReply:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B8AF3000, log, OS_LOG_TYPE_ERROR, "Connection dead, restarting connection", v1, 2u);
}

void __24__HCServer_handleReply___block_invoke_2_cold_1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_error_impl(&dword_1B8AF3000, a2, OS_LOG_TYPE_ERROR, "Connection interrupted, restarting: %d", (uint8_t *)v2, 8u);
}

@end