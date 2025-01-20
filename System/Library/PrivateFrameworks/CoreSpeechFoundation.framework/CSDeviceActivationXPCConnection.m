@interface CSDeviceActivationXPCConnection
- (CSDeviceActivateXPCConnectionDelegate)delegate;
- (CSDeviceActivationXPCConnection)initWithConnection:(id)a3;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (void)_handleActivateEventMesssage:(id)a3 client:(id)a4;
- (void)_handleClientError:(id)a3 client:(id)a4;
- (void)_handleClientEvent:(id)a3;
- (void)_handleClientMessage:(id)a3 client:(id)a4;
- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6;
- (void)activateConnection;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSDeviceActivationXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setConnection:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (CSDeviceActivateXPCConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSDeviceActivateXPCConnectionDelegate *)WeakRetained;
}

- (void)_handleActivateEventMesssage:(id)a3 client:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = xpc_dictionary_get_dictionary(v6, "event");
  if (v8)
  {
    v9 = [[CSDeviceActivationEvent alloc] initWithXPCObject:v8];
    v10 = +[CSDeviceActivationEventNotificationHandler sharedInstance];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__CSDeviceActivationXPCConnection__handleActivateEventMesssage_client___block_invoke;
    v12[3] = &unk_1E61FFAD8;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    [v10 notifyActivationEvent:v9 completion:v12];
  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSDeviceActivationXPCConnection _handleActivateEventMesssage:client:]";
      _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s Cannot handle activateEventMessage since event is nil", buf, 0xCu);
    }
    [(CSDeviceActivationXPCConnection *)self _sendReply:v6 client:v7 result:0 error:0];
  }
}

uint64_t __71__CSDeviceActivationXPCConnection__handleActivateEventMesssage_client___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _sendReply:*(void *)(a1 + 40) client:*(void *)(a1 + 48) result:a2 error:a3];
}

- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6
{
  connection = (_xpc_connection_s *)a4;
  id v9 = a6;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  v11 = reply;
  if (reply)
  {
    xpc_dictionary_set_BOOL(reply, "result", a5);
    if (v9)
    {
      id v12 = [v9 domain];
      xpc_dictionary_set_string(v11, "resultErrorDomain", (const char *)[v12 UTF8String]);

      xpc_dictionary_set_int64(v11, "resultErrorCode", [v9 code]);
    }
    xpc_connection_send_message(connection, v11);
  }
}

- (void)_handleClientError:(id)a3 client:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (char *)a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (v6 == (id)MEMORY[0x1E4F14528] || v6 == (id)MEMORY[0x1E4F14520])
    {
      v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315394;
        v20 = "-[CSDeviceActivationXPCConnection _handleClientError:client:]";
        __int16 v21 = 2050;
        v22 = v8;
        _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Client %{public}p connection disconnected, noticing xpc listener", (uint8_t *)&v19, 0x16u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        id v12 = WeakRetained;
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        char v14 = objc_opt_respondsToSelector();

        if (v14)
        {
          id v15 = objc_loadWeakRetained((id *)&self->_delegate);
          [v15 CSActivationXPCConnectionReceivedClientError:self clientError:v6 client:v8];
        }
      }
    }
    else
    {
      string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1E4F14530]);
      uint64_t v17 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136315394;
        v20 = "-[CSDeviceActivationXPCConnection _handleClientError:client:]";
        __int16 v21 = 2082;
        v22 = string;
        _os_log_error_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_ERROR, "%s connection error: %{public}s", (uint8_t *)&v19, 0x16u);
      }
    }
  }
}

- (void)_handleClientMessage:(id)a3 client:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    uint64_t v11 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v16 = 136315650;
    uint64_t v17 = "-[CSDeviceActivationXPCConnection _handleClientMessage:client:]";
    __int16 v18 = 2050;
    int64_t v19 = (int64_t)v6;
    __int16 v20 = 2050;
    __int16 v21 = v8;
    id v12 = "%s message = %{public}p, client = %{public}p, cannot handle message";
    id v13 = v11;
    uint32_t v14 = 32;
LABEL_12:
    _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, v14);
    goto LABEL_10;
  }
  int64_t int64 = xpc_dictionary_get_int64(v6, "type");
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[CSDeviceActivationXPCConnection _handleClientMessage:client:]";
    __int16 v18 = 2050;
    int64_t v19 = int64;
    _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Message type = %{public}lld", (uint8_t *)&v16, 0x16u);
  }
  if (int64 != 2)
  {
    uint64_t v15 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v16 = 136315138;
    uint64_t v17 = "-[CSDeviceActivationXPCConnection _handleClientMessage:client:]";
    id v12 = "%s Cannot handle wrong message type";
    id v13 = v15;
    uint32_t v14 = 12;
    goto LABEL_12;
  }
  [(CSDeviceActivationXPCConnection *)self _handleActivateEventMesssage:v6 client:v8];
LABEL_10:
}

- (void)_handleClientEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4 && self->_connection)
  {
    uint64_t v6 = MEMORY[0x1BA9E7EA0](v4);
    if (v6 == MEMORY[0x1E4F14590])
    {
      [(CSDeviceActivationXPCConnection *)self _handleClientMessage:v5 client:self->_connection];
      goto LABEL_12;
    }
    if (v6 == MEMORY[0x1E4F145A8])
    {
      [(CSDeviceActivationXPCConnection *)self _handleClientError:v5 client:self->_connection];
      goto LABEL_12;
    }
    uint64_t v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      uint32_t v14 = "-[CSDeviceActivationXPCConnection _handleClientEvent:]";
      v8 = "%s ignore unknown types of message";
      id v9 = v7;
      uint32_t v10 = 12;
LABEL_9:
      _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    uint64_t v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      connection = self->_connection;
      int v13 = 136315650;
      uint32_t v14 = "-[CSDeviceActivationXPCConnection _handleClientEvent:]";
      __int16 v15 = 2050;
      int v16 = v5;
      __int16 v17 = 2050;
      __int16 v18 = connection;
      v8 = "%s event = %{public}p client = %{public}p cannot handle event";
      id v9 = v11;
      uint32_t v10 = 32;
      goto LABEL_9;
    }
  }
LABEL_12:
}

- (void)activateConnection
{
  objc_initWeak(&location, self);
  connection = self->_connection;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__CSDeviceActivationXPCConnection_activateConnection__block_invoke;
  v4[3] = &unk_1E62011B0;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(connection, v4);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__CSDeviceActivationXPCConnection_activateConnection__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleClientEvent:v3];
}

- (CSDeviceActivationXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSDeviceActivationXPCConnection;
  uint64_t v6 = [(CSDeviceActivationXPCConnection *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    dispatch_queue_t v8 = dispatch_queue_create("corespeechd xpc connection client queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    uint32_t v10 = v7->_queue;
    uint64_t v11 = dispatch_get_global_queue(33, 0);
    dispatch_set_target_queue(v10, v11);

    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)v7->_queue);
  }

  return v7;
}

@end