@interface IOGCFastPathProxyServer
- (IOGCFastPathProxyServer)init;
- (IOGCFastPathProxyServer)initWithServerName:(id)a3;
- (void)activate;
- (void)invalidate;
@end

@implementation IOGCFastPathProxyServer

- (IOGCFastPathProxyServer)initWithServerName:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)IOGCFastPathProxyServer;
  id v3 = a3;
  id v4 = [(IOGCFastPathProxyServer *)&v14 init];
  dispatch_queue_t v5 = dispatch_queue_create("IOGCFastPathProxyServer", 0);
  v6 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v5;

  id v7 = v3;
  v8 = (const char *)objc_msgSend(v7, "UTF8String", v14.receiver, v14.super_class);

  xpc_connection_t mach_service = xpc_connection_create_mach_service(v8, *((dispatch_queue_t *)v4 + 1), 1uLL);
  v10 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = mach_service;

  v11 = (_xpc_connection_s *)*((void *)v4 + 2);
  if (v11)
  {
    xpc_connection_set_event_handler(v11, &__block_literal_global_60);
    v12 = (IOGCFastPathProxyServer *)v4;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __46__IOGCFastPathProxyServer_initWithServerName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x21052D670]();
  if (v3 == &_xpc_type_connection)
  {
    dispatch_queue_t v5 = _os_activity_create(&dword_20AD04000, "Incoming Connection", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v15.opaque[0] = 0;
    v15.opaque[1] = 0;
    os_activity_scope_enter(v5, &v15);
    v13 = _gc_log_iokit();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v2;
      _os_log_impl(&dword_20AD04000, v13, OS_LOG_TYPE_INFO, "Accepting connection '%@' to fast path proxy.", buf, 0xCu);
    }

    objc_super v14 = +[_IOGCFastPathProxyClient withIncomingConnection:]((uint64_t)_IOGCFastPathProxyClient, v2);
    if (!v14) {
      xpc_connection_cancel((xpc_connection_t)v2);
    }

    os_activity_scope_leave(&v15);
  }
  else
  {
    BOOL v4 = v3 == &_xpc_type_error;
    dispatch_queue_t v5 = _gc_log_iokit();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v6) {
        __46__IOGCFastPathProxyServer_initWithServerName___block_invoke_cold_1((uint64_t)v2, v5, v7, v8, v9, v10, v11, v12);
      }
    }
    else if (v6)
    {
      __46__IOGCFastPathProxyServer_initWithServerName___block_invoke_cold_2((uint64_t)v2, v5, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (IOGCFastPathProxyServer)init
{
  return 0;
}

- (void)activate
{
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __46__IOGCFastPathProxyServer_initWithServerName___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__IOGCFastPathProxyServer_initWithServerName___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end