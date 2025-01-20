@interface CDPDXPCEventObserver
+ (id)sharedObserver;
- (void)_setupDarwinListener;
- (void)_setupDistributedListener;
- (void)registerListener:(id)a3;
- (void)start;
@end

@implementation CDPDXPCEventObserver

+ (id)sharedObserver
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CDPDXPCEventObserver_sharedObserver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, block);
  }
  v2 = (void *)sharedObserver_observer;
  return v2;
}

uint64_t __38__CDPDXPCEventObserver_sharedObserver__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedObserver_observer;
  sharedObserver_observer = (uint64_t)v1;

  *(void *)(sharedObserver_observer + 8) = [MEMORY[0x263EFF980] array];
  return MEMORY[0x270F9A758]();
}

- (void)registerListener:(id)a3
{
}

- (void)start
{
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_218640000, v3, OS_LOG_TYPE_DEFAULT, "Starting to listen for XPC events...", v4, 2u);
  }

  [(CDPDXPCEventObserver *)self _setupDarwinListener];
  [(CDPDXPCEventObserver *)self _setupDistributedListener];
}

- (void)_setupDarwinListener
{
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke;
  handler[3] = &unk_264330700;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x263EF83A0], handler);
}

void __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86C8]);
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = (uint64_t)string;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Darwin XPC event stream handler called: %s", buf, 0xCu);
  }

  int out_token = -1;
  if (notify_register_check(string, &out_token))
  {
    v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_cold_3((uint64_t)string, v5);
    }
LABEL_6:

    return;
  }
  if (out_token == -1)
  {
    v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_cold_1((uint64_t)string, v5);
    }
    goto LABEL_6;
  }
  uint64_t state64 = 0;
  if (notify_get_state(out_token, &state64))
  {
    v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_cold_2(v6);
    }
  }
  else
  {
    if (out_token != -1) {
      notify_cancel(out_token);
    }
    v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = state64;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "XPC event value is: %llu", buf, 0xCu);
    }

    v8 = *(void **)(*(void *)(a1 + 32) + 8);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_2;
    v9[3] = &__block_descriptor_48_e15_v32__0_8Q16_B24l;
    v9[4] = string;
    v9[5] = state64;
    [v8 enumerateObjectsUsingBlock:v9];
  }
}

void __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_2_cold_1();
  }

  if (objc_opt_respondsToSelector()) {
    [v3 eventReceived:*(void *)(a1 + 32) eventValue:*(void *)(a1 + 40)];
  }
}

- (void)_setupDistributedListener
{
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __49__CDPDXPCEventObserver__setupDistributedListener__block_invoke;
  handler[3] = &unk_264330700;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", MEMORY[0x263EF83A0], handler);
}

void __49__CDPDXPCEventObserver__setupDistributedListener__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = (const char *)*MEMORY[0x263EF86C8];
  id v4 = a2;
  string = xpc_dictionary_get_string(v4, v3);
  v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = string;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Distributed XPC event stream handler called: %s", buf, 0xCu);
  }

  v7 = xpc_dictionary_get_value(v4, "UserInfo");

  if (v7) {
    v8 = (char *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    v8 = 0;
  }
  v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "User Info: %@", buf, 0xCu);
  }

  v10 = *(void **)(*(void *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__CDPDXPCEventObserver__setupDistributedListener__block_invoke_8;
  v12[3] = &unk_264330728;
  uint64_t v13 = v8;
  uint64_t v14 = string;
  v11 = v8;
  [v10 enumerateObjectsUsingBlock:v12];
}

void __49__CDPDXPCEventObserver__setupDistributedListener__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __49__CDPDXPCEventObserver__setupDistributedListener__block_invoke_8_cold_1();
  }

  if (objc_opt_respondsToSelector()) {
    [v3 eventReceived:*(void *)(a1 + 40) eventInfo:*(void *)(a1 + 32)];
  }
}

- (void).cxx_destruct
{
}

void __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Cannot get the state using invalid token for event - %s", (uint8_t *)&v2, 0xCu);
}

void __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "Error during notify_get_state for token", v1, 2u);
}

void __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Error during notify_register_check for event - %s", (uint8_t *)&v2, 0xCu);
}

void __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_4(&dword_218640000, v0, v1, "Notifying listener %@ of %s");
}

void __49__CDPDXPCEventObserver__setupDistributedListener__block_invoke_8_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_4(&dword_218640000, v0, v1, "Notifying listener %@ of %s");
}

@end