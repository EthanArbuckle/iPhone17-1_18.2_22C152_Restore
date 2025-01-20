@interface CSSpeechUaapXPCClient
- (CSSpeechUaapXPCClient)init;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (void)_handleConnectionError:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)registerDatapackUpdate;
- (void)registerMultilingualUaapApp:(id)a3 withAssetFiles:(id)a4 completion:(id)a5;
- (void)registerUaapApp:(id)a3 forLocale:(id)a4 withAssetFiles:(id)a5 completion:(id)a6;
- (void)registerUaapApp:(id)a3 withAssetFiles:(id)a4 completion:(id)a5;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSSpeechUaapXPCClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setConnection:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)dealloc
{
  [(CSSpeechUaapXPCClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSSpeechUaapXPCClient;
  [(CSSpeechUaapXPCClient *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (connection)
  {
    v4 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[CSSpeechUaapXPCClient invalidate]";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s Invalidating CSSpeechUaapXPCClient", (uint8_t *)&v6, 0xCu);
      connection = self->_connection;
    }
    xpc_connection_cancel(connection);
    v5 = self->_connection;
    self->_connection = 0;
  }
}

- (void)registerDatapackUpdate
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = "messageType";
  xpc_object_t values = xpc_uint64_create(4uLL);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  xpc_connection_send_message(self->_connection, v3);
}

- (void)registerMultilingualUaapApp:(id)a3 withAssetFiles:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  xpc_object_t empty = xpc_dictionary_create_empty();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __79__CSSpeechUaapXPCClient_registerMultilingualUaapApp_withAssetFiles_completion___block_invoke;
  v23[3] = &unk_1E658AE10;
  id v12 = empty;
  id v24 = v12;
  [v9 enumerateKeysAndObjectsUsingBlock:v23];
  *(_OWORD *)keys = xmmword_1E658AE30;
  id v13 = v8;
  values[0] = xpc_string_create((const char *)[v13 UTF8String]);
  id v14 = v12;
  values[1] = v14;
  *(_OWORD *)v26 = xmmword_1E658AE40;
  v25[0] = xpc_uint64_create(3uLL);
  v25[1] = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  xpc_object_t v15 = xpc_dictionary_create((const char *const *)v26, v25, 2uLL);
  connection = self->_connection;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __79__CSSpeechUaapXPCClient_registerMultilingualUaapApp_withAssetFiles_completion___block_invoke_3;
  v21[3] = &unk_1E658CF78;
  id v18 = v10;
  id v22 = v18;
  xpc_connection_send_message_with_reply(connection, v15, queue, v21);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)
}

void __79__CSSpeechUaapXPCClient_registerMultilingualUaapApp_withAssetFiles_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  xpc_object_t empty = xpc_array_create_empty();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__CSSpeechUaapXPCClient_registerMultilingualUaapApp_withAssetFiles_completion___block_invoke_2;
  v12[3] = &unk_1E658ADD0;
  id v13 = empty;
  id v8 = empty;
  [v5 enumerateObjectsUsingBlock:v12];

  id v9 = *(void **)(a1 + 32);
  id v10 = v6;
  v11 = (const char *)[v10 UTF8String];

  xpc_dictionary_set_value(v9, v11, v8);
}

void __79__CSSpeechUaapXPCClient_registerMultilingualUaapApp_withAssetFiles_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  string = (void *)xpc_dictionary_get_string(v3, "errorDomain");
  if (string)
  {
    int64_t int64 = xpc_dictionary_get_int64(v3, "errorCode");
    id v6 = xpc_dictionary_get_string(v3, "errorMessage");
    v7 = (void *)MEMORY[0x1E4F28C58];
    id v8 = [NSString stringWithUTF8String:string];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    id v9 = [NSString stringWithUTF8String:v6];
    v13[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    string = [v7 errorWithDomain:v8 code:int64 userInfo:v10];
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, string);
  }
}

void __79__CSSpeechUaapXPCClient_registerMultilingualUaapApp_withAssetFiles_completion___block_invoke_2(uint64_t a1, id a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = xpc_string_create((const char *)[a2 UTF8String]);
  xpc_array_append_value(v2, v3);
}

- (void)registerUaapApp:(id)a3 forLocale:(id)a4 withAssetFiles:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  xpc_object_t empty = xpc_array_create_empty();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __77__CSSpeechUaapXPCClient_registerUaapApp_forLocale_withAssetFiles_completion___block_invoke;
  v27[3] = &unk_1E658ADD0;
  id v15 = empty;
  id v28 = v15;
  [v12 enumerateObjectsUsingBlock:v27];
  *(_OWORD *)keys = xmmword_1E658ADF0;
  v33 = "locale";
  id v16 = v10;
  values[0] = xpc_string_create((const char *)[v16 UTF8String]);
  id v17 = v15;
  values[1] = v17;
  id v18 = v11;
  xpc_object_t values[2] = xpc_string_create((const char *)[v18 UTF8String]);
  *(_OWORD *)v30 = xmmword_1E658AE40;
  v29[0] = xpc_uint64_create(2uLL);
  v29[1] = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  xpc_object_t v19 = xpc_dictionary_create((const char *const *)v30, v29, 2uLL);
  connection = self->_connection;
  queue = self->_queue;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  xpc_object_t v25[2] = __77__CSSpeechUaapXPCClient_registerUaapApp_forLocale_withAssetFiles_completion___block_invoke_2;
  v25[3] = &unk_1E658CF78;
  id v22 = v13;
  id v26 = v22;
  xpc_connection_send_message_with_reply(connection, v19, queue, v25);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 2; j != -1; --j)
}

void __77__CSSpeechUaapXPCClient_registerUaapApp_forLocale_withAssetFiles_completion___block_invoke(uint64_t a1, id a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = xpc_string_create((const char *)[a2 UTF8String]);
  xpc_array_append_value(v2, v3);
}

void __77__CSSpeechUaapXPCClient_registerUaapApp_forLocale_withAssetFiles_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  string = (void *)xpc_dictionary_get_string(v3, "errorDomain");
  if (string)
  {
    int64_t int64 = xpc_dictionary_get_int64(v3, "errorCode");
    id v6 = xpc_dictionary_get_string(v3, "errorMessage");
    v7 = (void *)MEMORY[0x1E4F28C58];
    id v8 = [NSString stringWithUTF8String:string];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    id v9 = [NSString stringWithUTF8String:v6];
    v13[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    string = [v7 errorWithDomain:v8 code:int64 userInfo:v10];
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, string);
  }
}

- (void)registerUaapApp:(id)a3 withAssetFiles:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  xpc_object_t empty = xpc_array_create_empty();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__CSSpeechUaapXPCClient_registerUaapApp_withAssetFiles_completion___block_invoke;
  v23[3] = &unk_1E658ADD0;
  id v12 = empty;
  id v24 = v12;
  [v9 enumerateObjectsUsingBlock:v23];
  *(_OWORD *)keys = xmmword_1E658AE30;
  id v13 = v8;
  values[0] = xpc_string_create((const char *)[v13 UTF8String]);
  id v14 = v12;
  values[1] = v14;
  *(_OWORD *)id v26 = xmmword_1E658AE40;
  v25[0] = xpc_uint64_create(1uLL);
  v25[1] = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  xpc_object_t v15 = xpc_dictionary_create((const char *const *)v26, v25, 2uLL);
  connection = self->_connection;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__CSSpeechUaapXPCClient_registerUaapApp_withAssetFiles_completion___block_invoke_2;
  v21[3] = &unk_1E658CF78;
  id v18 = v10;
  id v22 = v18;
  xpc_connection_send_message_with_reply(connection, v15, queue, v21);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)
}

void __67__CSSpeechUaapXPCClient_registerUaapApp_withAssetFiles_completion___block_invoke(uint64_t a1, id a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = xpc_string_create((const char *)[a2 UTF8String]);
  xpc_array_append_value(v2, v3);
}

void __67__CSSpeechUaapXPCClient_registerUaapApp_withAssetFiles_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  string = (void *)xpc_dictionary_get_string(v3, "errorDomain");
  if (string)
  {
    int64_t int64 = xpc_dictionary_get_int64(v3, "errorCode");
    id v6 = xpc_dictionary_get_string(v3, "errorMessage");
    v7 = (void *)MEMORY[0x1E4F28C58];
    id v8 = [NSString stringWithUTF8String:string];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    id v9 = [NSString stringWithUTF8String:v6];
    v13[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    string = [v7 errorWithDomain:v8 code:int64 userInfo:v10];
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, string);
  }
}

- (void)_handleConnectionError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = (id)MEMORY[0x1E4F14528];
    id v5 = *MEMORY[0x1E4F5D180];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR);
    if (v3 == v4 || v3 == (id)MEMORY[0x1E4F14520])
    {
      if (v6)
      {
        int v10 = 136315138;
        uint64_t v11 = "-[CSSpeechUaapXPCClient _handleConnectionError:]";
        _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s CSSpeechUaapXPCClient listener disconnected", (uint8_t *)&v10, 0xCu);
      }
    }
    else if (v6)
    {
      id v8 = (const char *)*MEMORY[0x1E4F14530];
      id v9 = v5;
      int v10 = 136315394;
      uint64_t v11 = "-[CSSpeechUaapXPCClient _handleConnectionError:]";
      __int16 v12 = 2080;
      string = xpc_dictionary_get_string(v3, v8);
      _os_log_error_impl(&dword_1C9338000, v9, OS_LOG_TYPE_ERROR, "%s CSSpeechUaapXPCConnection error: %s", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (CSSpeechUaapXPCClient)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSSpeechUaapXPCClient;
  id v2 = [(CSSpeechUaapXPCClient *)&v12 init];
  if (v2)
  {
    CSLogInitIfNeeded();
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.corespeech.corespeechd.uaapservice", 0, 0);
    id v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = mach_service;

    dispatch_queue_t v5 = dispatch_queue_create("CSSpeechUaapXPCClient", 0);
    BOOL v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    xpc_connection_set_target_queue(*((xpc_connection_t *)v2 + 1), *((dispatch_queue_t *)v2 + 2));
    objc_initWeak(&location, v2);
    v7 = (_xpc_connection_s *)*((void *)v2 + 1);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __29__CSSpeechUaapXPCClient_init__block_invoke;
    v9[3] = &unk_1E658CEF0;
    objc_copyWeak(&v10, &location);
    xpc_connection_set_event_handler(v7, v9);
    xpc_connection_activate(*((xpc_connection_t *)v2 + 1));
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return (CSSpeechUaapXPCClient *)v2;
}

void __29__CSSpeechUaapXPCClient_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (MEMORY[0x1CB785960](v3) == MEMORY[0x1E4F145A8])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [WeakRetained _handleConnectionError:v4];

      goto LABEL_9;
    }
    dispatch_queue_t v5 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[CSSpeechUaapXPCClient init]_block_invoke";
      BOOL v6 = "%s CSSpeechUaapXPCClient got an event it can't handle";
LABEL_7:
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    dispatch_queue_t v5 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[CSSpeechUaapXPCClient init]_block_invoke";
      BOOL v6 = "%s CSSpeechUaapXPCClient received an empty connection event";
      goto LABEL_7;
    }
  }
LABEL_9:
}

@end