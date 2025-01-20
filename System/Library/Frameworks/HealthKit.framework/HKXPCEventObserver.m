@interface HKXPCEventObserver
+ (void)_registerEventHandler:(id)a3 forStream:(const char *)a4;
+ (void)_subscribeToStream:(const char *)a3 clientIdentifier:(const char *)a4;
+ (void)_unsubscribeFromStream:(const char *)a3 clientIdentifier:(const char *)a4;
+ (void)setAuthorizationStreamEventHandler:(id)a3;
+ (void)subscribeToAuthorizationStreamWithIdentifier:(const char *)a3;
+ (void)unsubscribeFromAuthorizationStreamWithIdentifier:(const char *)a3;
@end

@implementation HKXPCEventObserver

+ (void)setAuthorizationStreamEventHandler:(id)a3
{
  id v5 = a3;
  if (atomic_exchange(_hasRegisteredAuthorizationHandler, 1u))
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKXPCEventObserver.m" lineNumber:30 description:@"This method can only be called once during the lifetime of a process"];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HKXPCEventObserver_setAuthorizationStreamEventHandler___block_invoke;
  v9[3] = &unk_1E58C67E8;
  id v10 = v5;
  uint64_t v7 = HKAuthorizationEventStream;
  id v8 = v5;
  +[HKXPCEventObserver _registerEventHandler:v9 forStream:v7];
}

uint64_t __57__HKXPCEventObserver_setAuthorizationStreamEventHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_get_string(xdict, (const char *)HKAuthorizationEventBundleIdentifierKey);
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

+ (void)subscribeToAuthorizationStreamWithIdentifier:(const char *)a3
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)_hasRegisteredAuthorizationHandler);
  if ((v4 & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"HKXPCEventObserver.m" lineNumber:42 description:@"This method may not be called until a handler block is registered"];
  }
  uint64_t v8 = HKAuthorizationEventStream;

  +[HKXPCEventObserver _subscribeToStream:v8 clientIdentifier:a3];
}

+ (void)unsubscribeFromAuthorizationStreamWithIdentifier:(const char *)a3
{
}

+ (void)_registerEventHandler:(id)a3 forStream:(const char *)a4
{
  id v6 = a3;
  uint64_t v7 = HKCreateSerialDispatchQueue(a1, @"eventQueue");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke;
  v9[3] = &unk_1E58C6810;
  id v10 = v6;
  v11 = a4;
  id v8 = v6;
  xpc_set_event_stream_handler(a4, v7, v9);
}

void __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  unsigned __int8 v4 = HKLogInfrastructure();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    id v6 = HKLogInfrastructure();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v15 = 136315138;
      uint64_t v16 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_INFO, "Received XPC event for %s", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v8 = MEMORY[0x19F396520](v3);
  if (v8 != MEMORY[0x1E4F14590])
  {
    v9 = (const _xpc_type_s *)v8;
    id v10 = (const _xpc_type_s *)MEMORY[0x1E4F145A8];
    _HKInitializeLogging();
    reply = HKLogInfrastructure();
    BOOL v12 = os_log_type_enabled(reply, OS_LOG_TYPE_ERROR);
    if (v9 == v10)
    {
      if (v12) {
        __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_2(v3);
      }
    }
    else if (v12)
    {
      __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_3(v9);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (!xpc_dictionary_get_BOOL(v3, (const char *)HKXPCEventSendToClientKey))
  {
    reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      xpc_dictionary_send_reply();
    }
    else
    {
      v13 = (void *)MEMORY[0x19F3964C0](v3);
      _HKInitializeLogging();
      v14 = HKLogInfrastructure();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_1((uint64_t)v13, v14);
      }

      free(v13);
    }
    goto LABEL_18;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_19:
}

+ (void)_subscribeToStream:(const char *)a3 clientIdentifier:(const char *)a4
{
  id v4 = xpc_dictionary_create(0, 0, 0);
  xpc_set_event();
}

+ (void)_unsubscribeFromStream:(const char *)a3 clientIdentifier:(const char *)a4
{
}

void __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Failed to create reply for XPC event: %s", (uint8_t *)&v2, 0xCu);
}

void __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_2(void *a1)
{
  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E4F14530]);
  OUTLINED_FUNCTION_0_4(&dword_19C023000, v1, v2, "XPC events subscriber received error: %s", v3, v4, v5, v6, 2u);
}

void __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_3(const _xpc_type_s *a1)
{
  xpc_type_get_name(a1);
  OUTLINED_FUNCTION_0_4(&dword_19C023000, v1, v2, "XPC events subscriber received event of unexpected type %s", v3, v4, v5, v6, 2u);
}

@end