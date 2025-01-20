void sub_240572BCC(uint64_t a1)
{
  int v2;
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[2];
  __int16 v18;
  __int16 v19;
  uint64_t vars8;

  v2 = *(_DWORD *)(a1 + 64);
  if (v2 != 3)
  {
    if (v2 == 1)
    {
      v16 = [*(id *)(a1 + 32) accountType];
      v3 = [v16 identifier];
      if ([v3 isEqualToString:*MEMORY[0x263EFAE58]])
      {
        v4 = objc_msgSend(*(id *)(a1 + 32), "aa_isAccountClass:", *MEMORY[0x263F25618]);

        if (!v4) {
          return;
        }
        if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        v19 = 0;
        v5 = MEMORY[0x263EF8438];
        v6 = "[BluetoothUserAccountPlugin] Primary Apple Account added";
        v7 = (uint8_t *)&v19;
        goto LABEL_18;
      }
      goto LABEL_11;
    }
    v9 = [*(id *)(a1 + 32) accountType];
    v10 = [v9 identifier];
    v11 = [v10 isEqualToString:*MEMORY[0x263EFAF00]];

    if (!v11) {
      return;
    }
    v12 = [MEMORY[0x263F290F0] sharedInstance];
    v13 = [v12 securityLevelForAccount:*(void *)(a1 + 32)];
    v14 = [MEMORY[0x263F290F0] sharedInstance];
    v15 = [v14 securityLevelForAccount:*(void *)(a1 + 48)];

    if (v13 == v15) {
      return;
    }
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
LABEL_19:
      [*(id *)(a1 + 56) accountModified];
      return;
    }
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x263EF8438];
    v6 = "[BluetoothUserAccountPlugin] IDMS account security level changed, signaling primaryAccountModified";
    v7 = buf;
LABEL_18:
    _os_log_impl(&dword_240571000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    goto LABEL_19;
  }
  v16 = [*(id *)(a1 + 40) accountType];
  v3 = [v16 identifier];
  if ([v3 isEqualToString:*MEMORY[0x263EFAE58]])
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "aa_isAccountClass:", *MEMORY[0x263F25618]);

    if (!v8) {
      return;
    }
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v18 = 0;
    v5 = MEMORY[0x263EF8438];
    v6 = "[BluetoothUserAccountPlugin] Primary Apple Account deleted";
    v7 = (uint8_t *)&v18;
    goto LABEL_18;
  }
LABEL_11:
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}