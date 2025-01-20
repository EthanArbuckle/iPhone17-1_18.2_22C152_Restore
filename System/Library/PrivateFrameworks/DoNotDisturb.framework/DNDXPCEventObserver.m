@interface DNDXPCEventObserver
+ (void)_registerEventHandler:(id)a3 forStream:(const char *)a4;
+ (void)_subscribeToStream:(const char *)a3 clientIdentifier:(const char *)a4;
+ (void)_unsubscribeFromStream:(const char *)a3 clientIdentifier:(const char *)a4;
+ (void)setFocusConfigurationStreamEventHandler:(id)a3;
+ (void)subscribeToFocusConfigurationStreamWithIdentifier:(const char *)a3;
+ (void)unsubscribeFromFocusConfigurationStreamWithIdentifier:(const char *)a3;
@end

@implementation DNDXPCEventObserver

+ (void)setFocusConfigurationStreamEventHandler:(id)a3
{
  id v3 = a3;
  atomic_exchange(_hasRegisteredFocusConfigurationHandler, 1u);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__DNDXPCEventObserver_setFocusConfigurationStreamEventHandler___block_invoke;
  v6[3] = &unk_1E59117E0;
  id v7 = v3;
  uint64_t v4 = DNDFocusConfigurationEventStream;
  id v5 = v3;
  +[DNDXPCEventObserver _registerEventHandler:v6 forStream:v4];
}

uint64_t __63__DNDXPCEventObserver_setFocusConfigurationStreamEventHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_get_string(xdict, (const char *)DNDFocusConfigurationEventBundleIdentifierKey);
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

+ (void)subscribeToFocusConfigurationStreamWithIdentifier:(const char *)a3
{
}

+ (void)unsubscribeFromFocusConfigurationStreamWithIdentifier:(const char *)a3
{
}

+ (void)_registerEventHandler:(id)a3 forStream:(const char *)a4
{
  id v5 = a3;
  Serial = BSDispatchQueueCreateSerial();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__DNDXPCEventObserver__registerEventHandler_forStream___block_invoke;
  v8[3] = &unk_1E5911808;
  id v9 = v5;
  v10 = a4;
  id v7 = v5;
  xpc_set_event_stream_handler(a4, Serial, v8);
}

void __55__DNDXPCEventObserver__registerEventHandler_forStream___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = DNDLogXPCEventObserver;
  if (os_log_type_enabled((os_log_t)DNDLogXPCEventObserver, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v11 = 136315138;
    uint64_t v12 = v5;
    _os_log_impl(&dword_19CC2C000, v4, OS_LOG_TYPE_INFO, "Received XPC event for %s", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v6 = MEMORY[0x19F3A0770](v3);
  if (v6 == MEMORY[0x1E4F14590])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = (const _xpc_type_s *)v6;
    v8 = (const _xpc_type_s *)MEMORY[0x1E4F145A8];
    id v9 = (void *)DNDLogXPCEventObserver;
    BOOL v10 = os_log_type_enabled((os_log_t)DNDLogXPCEventObserver, OS_LOG_TYPE_ERROR);
    if (v7 == v8)
    {
      if (v10) {
        __55__DNDXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_1(v9, v3);
      }
    }
    else if (v10)
    {
      __55__DNDXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_2(v9, v7);
    }
  }
}

+ (void)_subscribeToStream:(const char *)a3 clientIdentifier:(const char *)a4
{
  id v4 = xpc_dictionary_create(0, 0, 0);
  xpc_set_event();
}

+ (void)_unsubscribeFromStream:(const char *)a3 clientIdentifier:(const char *)a4
{
}

void __55__DNDXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (const char *)*MEMORY[0x1E4F14530];
  id v4 = a1;
  int v5 = 136315138;
  string = xpc_dictionary_get_string(a2, v3);
  _os_log_error_impl(&dword_19CC2C000, v4, OS_LOG_TYPE_ERROR, "XPC events subscriber received error: %s", (uint8_t *)&v5, 0xCu);
}

void __55__DNDXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_2(void *a1, const _xpc_type_s *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  int v4 = 136315138;
  name = xpc_type_get_name(a2);
  _os_log_error_impl(&dword_19CC2C000, v3, OS_LOG_TYPE_ERROR, "XPC events subscriber received event of unexpected type %s", (uint8_t *)&v4, 0xCu);
}

@end