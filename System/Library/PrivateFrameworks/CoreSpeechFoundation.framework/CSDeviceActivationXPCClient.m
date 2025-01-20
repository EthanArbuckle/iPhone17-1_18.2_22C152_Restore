@interface CSDeviceActivationXPCClient
- (CSDeviceActivationXPCClient)init;
- (CSDeviceActivationXPCClient)initWithMachServiceName:(const char *)a3;
- (OS_xpc_object)xpcConnection;
- (id)_decodeError:(id)a3;
- (void)_handleListenerError:(id)a3;
- (void)_handleListenerEvent:(id)a3;
- (void)_sendMessage:(id)a3 connection:(id)a4 completion:(id)a5;
- (void)connect;
- (void)dealloc;
- (void)notifyActivationEvent:(id)a3 completion:(id)a4;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSDeviceActivationXPCClient

- (void).cxx_destruct
{
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (id)_decodeError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    string = (void *)xpc_dictionary_get_string(v3, "resultErrorDomain");
    if (string)
    {
      int64_t int64 = xpc_dictionary_get_int64(v4, "resultErrorCode");
      v7 = (void *)MEMORY[0x1E4F28C58];
      v8 = [NSString stringWithUTF8String:string];
      string = [v7 errorWithDomain:v8 code:int64 userInfo:0];
    }
  }
  else
  {
    string = 0;
  }

  return string;
}

- (void)_sendMessage:(id)a3 connection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (_xpc_connection_s *)a4;
  id v10 = a5;
  v11 = (void (**)(void, void, void))v10;
  if (v8 && v9)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__CSDeviceActivationXPCClient__sendMessage_connection_completion___block_invoke;
    v13[3] = &unk_1E6201218;
    v13[4] = self;
    id v14 = v10;
    xpc_connection_send_message_with_reply(v9, v8, 0, v13);
  }
  else if (v10)
  {
    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:1252 userInfo:0];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v12);
  }
}

void __66__CSDeviceActivationXPCClient__sendMessage_connection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v8 = v3;
    BOOL v4 = xpc_dictionary_get_BOOL(v3, "result");
    v5 = [*(id *)(a1 + 32) _decodeError:v8];
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, BOOL, void *))(v6 + 16))(v6, v4, v5);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (!v7) {
      goto LABEL_7;
    }
    id v8 = 0;
    v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:1251 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v5);
  }

  id v3 = v8;
LABEL_7:
}

- (void)notifyActivationEvent:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[CSDeviceActivationXPCClient notifyActivationEvent:completion:]";
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__CSDeviceActivationXPCClient_notifyActivationEvent_completion___block_invoke;
  v13[3] = &unk_1E62011D8;
  id v9 = v7;
  id v14 = v9;
  id v10 = (void *)MEMORY[0x1BA9E7570](v13);
  *(_OWORD *)buf = xmmword_1E62011F8;
  values[0] = xpc_int64_create(2);
  values[1] = [v6 xpcObject];
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)buf, values, 2uLL);
  [(CSDeviceActivationXPCClient *)self _sendMessage:v11 connection:self->_xpcConnection completion:v10];

  for (uint64_t i = 1; i != -1; --i)
}

uint64_t __64__CSDeviceActivationXPCClient_notifyActivationEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_handleListenerError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3)
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v15 = 136315394;
    v16 = "-[CSDeviceActivationXPCClient _handleListenerError:]";
    __int16 v17 = 2050;
    uint64_t v18 = 0;
    xpc_object_t v11 = "%s cannot handle error : error = %{public}p";
    goto LABEL_17;
  }
  v5 = (void *)MEMORY[0x1E4F14528];
  if (v3 != (id)MEMORY[0x1E4F14528] && v3 != (id)MEMORY[0x1E4F14520])
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14530]);
    v13 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v15 = 136315394;
    v16 = "-[CSDeviceActivationXPCClient _handleListenerError:]";
    __int16 v17 = 2082;
    uint64_t v18 = (uint64_t)string;
    xpc_object_t v11 = "%s connection error: %{public}s";
LABEL_17:
    _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0x16u);
    goto LABEL_15;
  }
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    v16 = "-[CSDeviceActivationXPCClient _handleListenerError:]";
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Listener connection disconnected", (uint8_t *)&v15, 0xCu);
  }
  if (v4 == v5)
  {
    id v8 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      uint64_t v10 = xpc_connection_copy_invalidation_reason();
      int v15 = 136315394;
      v16 = "-[CSDeviceActivationXPCClient _handleListenerError:]";
      __int16 v17 = 2080;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s XPC Connection Invalidated for reason: %s", (uint8_t *)&v15, 0x16u);
    }
  }
LABEL_15:
}

- (void)_handleListenerEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (MEMORY[0x1BA9E7EA0](v4) == MEMORY[0x1E4F145A8])
    {
      [(CSDeviceActivationXPCClient *)self _handleListenerError:v5];
      goto LABEL_9;
    }
    uint64_t v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      v12 = "-[CSDeviceActivationXPCClient _handleListenerEvent:]";
      id v7 = "%s ignore unknown types of message ";
      id v8 = v6;
      uint32_t v9 = 12;
LABEL_7:
      _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, v9);
    }
  }
  else
  {
    uint64_t v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "-[CSDeviceActivationXPCClient _handleListenerEvent:]";
      __int16 v13 = 2050;
      uint64_t v14 = 0;
      id v7 = "%s cannot handle event : event = %{public}p";
      id v8 = v10;
      uint32_t v9 = 22;
      goto LABEL_7;
    }
  }
LABEL_9:
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    id v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[CSDeviceActivationXPCClient dealloc]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s disconnect activationXPCClient", buf, 0xCu);
      xpcConnection = self->_xpcConnection;
    }
    xpc_connection_cancel(xpcConnection);
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CSDeviceActivationXPCClient;
  [(CSDeviceActivationXPCClient *)&v6 dealloc];
}

- (void)connect
{
  objc_initWeak(&location, self);
  xpcConnection = self->_xpcConnection;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__CSDeviceActivationXPCClient_connect__block_invoke;
  v4[3] = &unk_1E62011B0;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(xpcConnection, v4);
  xpc_connection_activate(self->_xpcConnection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __38__CSDeviceActivationXPCClient_connect__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleListenerEvent:v3];
}

- (CSDeviceActivationXPCClient)init
{
  return [(CSDeviceActivationXPCClient *)self initWithMachServiceName:"com.apple.corespeech.corespeechd.activation.xpc"];
}

- (CSDeviceActivationXPCClient)initWithMachServiceName:(const char *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)CSDeviceActivationXPCClient;
  id v4 = [(CSDeviceActivationXPCClient *)&v9 init];
  if (v4)
  {
    CSLogInitIfNeededWithSubsystemType(0);
    xpc_connection_t mach_service = xpc_connection_create_mach_service(a3, 0, 0);
    xpcConnection = v4->_xpcConnection;
    v4->_xpcConnection = mach_service;

    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v11 = "-[CSDeviceActivationXPCClient initWithMachServiceName:]";
      __int16 v12 = 2080;
      __int16 v13 = a3;
      _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s machServiceName : %s", buf, 0x16u);
    }
  }
  return v4;
}

@end