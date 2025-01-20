@interface IOGCFastPathProxyClient
@end

@implementation IOGCFastPathProxyClient

void __55___IOGCFastPathProxyClient_initWithIncomingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x21052D670]();
  if (v4 == &_xpc_type_dictionary)
  {
    v10 = _gc_log_iokit();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v3;
      _os_log_impl(&dword_20AD04000, v10, OS_LOG_TYPE_DEFAULT, "Client received message: %@", buf, 0xCu);
    }

    *(_OWORD *)buf = 0u;
    long long v27 = 0u;
    xpc_dictionary_get_audit_token();
    v11 = *(void **)(a1 + 32);
    if (*(void *)buf == v11[3]
      && *(void *)&buf[8] == v11[4]
      && (void)v27 == v11[5]
      && *((void *)&v27 + 1) == v11[6])
    {
      -[_IOGCFastPathProxyClient handleMessage:]((uint64_t)v11, v3);
      goto LABEL_21;
    }
    v5 = _gc_log_iokit();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    __int16 v25 = 0;
    v6 = "Bad audit token.";
    v7 = (uint8_t *)&v25;
    v8 = v5;
    uint32_t v9 = 2;
    goto LABEL_19;
  }
  if (v4 != &_xpc_type_error)
  {
    v5 = _gc_log_iokit();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_20:

      xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(a1 + 32) + 16));
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v3;
    v6 = "Client received unknown event: %@";
    v7 = buf;
    v8 = v5;
    uint32_t v9 = 12;
LABEL_19:
    _os_log_impl(&dword_20AD04000, v8, OS_LOG_TYPE_DEFAULT, v6, v7, v9);
    goto LABEL_20;
  }
  v15 = _gc_log_iokit();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v3 == &_xpc_error_connection_invalid)
  {
    if (v16) {
      __55___IOGCFastPathProxyClient_initWithIncomingConnection___block_invoke_cold_1(v15);
    }

    xpc_connection_set_event_handler(*(xpc_connection_t *)(*(void *)(a1 + 32) + 16), &__block_literal_global_19);
    xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(a1 + 32) + 16));
    uint64_t v23 = *(void *)(a1 + 32);
    v24 = *(void **)(v23 + 16);
    *(void *)(v23 + 16) = 0;
  }
  else
  {
    if (v16) {
      __55___IOGCFastPathProxyClient_initWithIncomingConnection___block_invoke_cold_2((uint64_t)v3, v15, v17, v18, v19, v20, v21, v22);
    }
  }
LABEL_21:
}

uint64_t __42___IOGCFastPathProxyClient_handleMessage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  v5 = +[NSNull null];
  string_ptr = xpc_string_get_string_ptr(v4);

  v7 = +[NSString stringWithUTF8String:string_ptr];
  [v3 setObject:v5 forKey:v7];

  return 1;
}

void __42___IOGCFastPathProxyClient_handleMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), (const char *)[v6 UTF8String], objc_msgSend(v5, "unsignedLongLongValue"));
  }
}

void __55___IOGCFastPathProxyClient_initWithIncomingConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20AD04000, log, OS_LOG_TYPE_ERROR, "Client invalidated!", v1, 2u);
}

void __55___IOGCFastPathProxyClient_initWithIncomingConnection___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end