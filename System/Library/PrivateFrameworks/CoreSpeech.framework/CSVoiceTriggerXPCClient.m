@interface CSVoiceTriggerXPCClient
- (CSVoiceTriggerXPCClient)init;
- (CSVoiceTriggerXPCClientDelegate)delegate;
- (OS_xpc_object)xpcConnection;
- (id)fetchVoiceTriggerStats;
- (void)_handleListenerDisconnectedError:(id)a3;
- (void)_handleListenerError:(id)a3;
- (void)_handleListenerEvent:(id)a3;
- (void)_sendMessage:(id)a3 connection:(id)a4 completion:(id)a5;
- (void)connect;
- (void)dealloc;
- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 timestamp:(double)a5;
- (void)notifyVoiceTriggeredSiriSessionCancelled;
- (void)setDelegate:(id)a3;
- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4;
- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSVoiceTriggerXPCClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setDelegate:(id)a3
{
}

- (CSVoiceTriggerXPCClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSVoiceTriggerXPCClientDelegate *)WeakRetained;
}

- (void)_sendMessage:(id)a3 connection:(id)a4 completion:(id)a5
{
  id v7 = a3;
  v8 = (_xpc_connection_s *)a4;
  id v9 = a5;
  v10 = v9;
  if (v7 && v8)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __62__CSVoiceTriggerXPCClient__sendMessage_connection_completion___block_invoke;
    handler[3] = &unk_1E658CF78;
    id v12 = v9;
    xpc_connection_send_message_with_reply(v8, v7, 0, handler);
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

void __62__CSVoiceTriggerXPCClient__sendMessage_connection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3) {
    BOOL v4 = xpc_dictionary_get_BOOL(v3, "result");
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, void))(v5 + 16))(v5, v4, 0);
  }
}

- (id)fetchVoiceTriggerStats
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = "type";
  xpc_object_t values = xpc_int64_create(5);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v18 = xmmword_1E658CF60;
  v17[0] = xpc_int64_create(2);
  id v4 = v3;
  v17[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v18, v17, 2uLL);
  xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(self->_xpcConnection, v5);
  id v7 = v6;
  if (v6)
  {
    if (xpc_dictionary_get_BOOL(v6, "result"))
    {
      v8 = xpc_dictionary_get_dictionary(v7, "triggerStats");
      if (v8)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v10 = objc_msgSend(v9, "_cs_initWithXPCObject:", v8);
      }
      else
      {
        v10 = 0;
      }

      goto LABEL_10;
    }
    v11 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      v16 = "-[CSVoiceTriggerXPCClient fetchVoiceTriggerStats]";
      _os_log_error_impl(&dword_1C9338000, v11, OS_LOG_TYPE_ERROR, "%s ERR: failed to get response !", (uint8_t *)&v15, 0xCu);
    }
  }
  v10 = 0;
LABEL_10:
  id v12 = v10;

  for (uint64_t i = 1; i != -1; --i)
  return v12;
}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)keys = xmmword_1E658CF48;
  v16 = "bypassTimeout";
  values[0] = xpc_int64_create(4);
  values[1] = xpc_BOOL_create(a3);
  values[2] = xpc_double_create(a4);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  *(_OWORD *)v13 = xmmword_1E658CF60;
  v12[0] = xpc_int64_create(2);
  id v8 = v7;
  v12[1] = v8;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)v13, v12, 2uLL);
  -[CSVoiceTriggerXPCClient _sendMessage:connection:completion:](self, "_sendMessage:connection:completion:", v9, self->_xpcConnection, 0, v12[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 2; j != -1; --j)
}

- (void)notifyVoiceTriggeredSiriSessionCancelled
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = "type";
  xpc_object_t values = xpc_int64_create(2);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)id v8 = xmmword_1E658CF60;
  v7[0] = xpc_int64_create(2);
  id v4 = v3;
  v7[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v8, v7, 2uLL);
  -[CSVoiceTriggerXPCClient _sendMessage:connection:completion:](self, "_sendMessage:connection:completion:", v5, self->_xpcConnection, 0, v7[0]);

  for (uint64_t i = 1; i != -1; --i)
}

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)keys = xmmword_1E658CF30;
  v16 = "bypassTimeout";
  values[0] = xpc_int64_create(1);
  values[1] = xpc_BOOL_create(a3);
  values[2] = xpc_double_create(a4);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  *(_OWORD *)v13 = xmmword_1E658CF60;
  v12[0] = xpc_int64_create(2);
  id v8 = v7;
  v12[1] = v8;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)v13, v12, 2uLL);
  -[CSVoiceTriggerXPCClient _sendMessage:connection:completion:](self, "_sendMessage:connection:completion:", v9, self->_xpcConnection, 0, v12[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 2; j != -1; --j)
}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 timestamp:(double)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  *(_OWORD *)keys = xmmword_1E658CF10;
  long long v19 = *(_OWORD *)&off_1E658CF20;
  values[0] = xpc_int64_create(3);
  values[1] = xpc_BOOL_create(a3);
  id v9 = v8;
  values[2] = xpc_string_create((const char *)[v9 UTF8String]);
  xpc_object_t values[3] = xpc_double_create(a5);
  xpc_object_t v10 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  *(_OWORD *)v16 = xmmword_1E658CF60;
  v15[0] = xpc_int64_create(2);
  id v11 = v10;
  v15[1] = v11;
  xpc_object_t v12 = xpc_dictionary_create((const char *const *)v16, v15, 2uLL);
  -[CSVoiceTriggerXPCClient _sendMessage:connection:completion:](self, "_sendMessage:connection:completion:", v12, self->_xpcConnection, 0, v15[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 3; j != -1; --j)
}

- (void)_handleListenerDisconnectedError:(id)a3
{
  id v4 = [(CSVoiceTriggerXPCClient *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained voiceTriggerXPCClient:self didDisconnect:1];
  }
}

- (void)_handleListenerError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = v4;
  if (!v4)
  {
    xpc_object_t v10 = *MEMORY[0x1E4F5D180];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v12 = 136315394;
    v13 = "-[CSVoiceTriggerXPCClient _handleListenerError:]";
    __int16 v14 = 2050;
    int v15 = 0;
    id v8 = "%s cannot handle error : error = %{public}p";
    goto LABEL_15;
  }
  if (v4 != (id)MEMORY[0x1E4F14528] && v4 != (id)MEMORY[0x1E4F14520])
  {
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
    xpc_object_t v10 = *MEMORY[0x1E4F5D180];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v12 = 136315394;
    v13 = "-[CSVoiceTriggerXPCClient _handleListenerError:]";
    __int16 v14 = 2082;
    int v15 = string;
    id v8 = "%s connection error: %{public}s";
LABEL_15:
    _os_log_error_impl(&dword_1C9338000, v10, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, 0x16u);
    goto LABEL_13;
  }
  xpc_object_t v7 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[CSVoiceTriggerXPCClient _handleListenerError:]";
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Listener connection disconnected", (uint8_t *)&v12, 0xCu);
  }
  [(CSVoiceTriggerXPCClient *)self _handleListenerDisconnectedError:v5];
LABEL_13:
}

- (void)_handleListenerEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    if (MEMORY[0x1CB785960](v4) == MEMORY[0x1E4F145A8])
    {
      [(CSVoiceTriggerXPCClient *)self _handleListenerError:v5];
      goto LABEL_9;
    }
    xpc_object_t v6 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      int v12 = "-[CSVoiceTriggerXPCClient _handleListenerEvent:]";
      xpc_object_t v7 = "%s ignore unknown types of message ";
      id v8 = v6;
      uint32_t v9 = 12;
LABEL_7:
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, v9);
    }
  }
  else
  {
    xpc_object_t v10 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      int v12 = "-[CSVoiceTriggerXPCClient _handleListenerEvent:]";
      __int16 v13 = 2050;
      uint64_t v14 = 0;
      xpc_object_t v7 = "%s cannot handle event : event = %{public}p";
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
    id v4 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[CSVoiceTriggerXPCClient dealloc]";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s disconnect VoiceTriggerXPCClient", buf, 0xCu);
      xpcConnection = self->_xpcConnection;
    }
    xpc_connection_cancel(xpcConnection);
    char v5 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CSVoiceTriggerXPCClient;
  [(CSVoiceTriggerXPCClient *)&v6 dealloc];
}

- (void)connect
{
  objc_initWeak(&location, self);
  xpcConnection = self->_xpcConnection;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__CSVoiceTriggerXPCClient_connect__block_invoke;
  v4[3] = &unk_1E658CEF0;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(xpcConnection, v4);
  xpc_connection_activate(self->_xpcConnection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __34__CSVoiceTriggerXPCClient_connect__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleListenerEvent:v3];
}

- (CSVoiceTriggerXPCClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSVoiceTriggerXPCClient;
  v2 = [(CSVoiceTriggerXPCClient *)&v6 init];
  if (v2)
  {
    CSLogInitIfNeeded();
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.corespeech.voicetriggerservice", 0, 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = mach_service;
  }
  return v2;
}

@end