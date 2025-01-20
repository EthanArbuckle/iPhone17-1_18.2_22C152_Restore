@interface NEProviderServer
+ (NEProviderServer)sharedServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NEExtensionProviderContext)firstContext;
- (void)generateProviderEndpointInfoInMessage:(id)a3 extensionPoint:(id)a4;
- (void)removeProviderContext:(id)a3;
- (void)start;
@end

@implementation NEProviderServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contexts, 0);

  objc_storeStrong((id *)&self->_listeners, 0);
}

- (void)removeProviderContext:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_contexts removeObject:v5];
  objc_sync_exit(v4);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      v22 = "Got a non-provider listener";
      v23 = v16;
      uint32_t v24 = 2;
LABEL_16:
      _os_log_error_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&buf, v24);
    }
LABEL_19:
    BOOL v21 = 0;
    goto LABEL_20;
  }
  if (v8) {
    v9 = (NSString *)v8[7];
  }
  else {
    v9 = 0;
  }
  v10 = NSClassFromString(v9);
  if (!v10)
  {
    v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (v8) {
        uint64_t v25 = v8[7];
      }
      else {
        uint64_t v25 = 0;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v25;
      v22 = "Failed to create a Class from %@";
      v23 = v16;
      uint32_t v24 = 12;
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  id v11 = [v10 alloc];
  id v12 = v7;
  if (!v11
    || (v29.receiver = v11,
        v29.super_class = (Class)NEExtensionProviderContext,
        (v13 = [(NEProviderServer *)&v29 init]) == 0))
  {

    v26 = ne_log_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      if (v8) {
        uint64_t v28 = v8[7];
      }
      else {
        uint64_t v28 = 0;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v28;
      _os_log_error_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_ERROR, "Failed to instantiate a %@ object", (uint8_t *)&buf, 0xCu);
    }

    v16 = 0;
    goto LABEL_19;
  }
  v14 = [(id)objc_opt_class() _extensionAuxiliaryHostProtocol];
  [v12 setRemoteObjectInterface:v14];

  v15 = [(id)objc_opt_class() _extensionAuxiliaryVendorProtocol];
  [v12 setExportedInterface:v15];

  [v12 setExportedObject:v13];
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v31 = __49__NEExtensionProviderContext_initWithConnection___block_invoke;
  v32 = &unk_1E59932C0;
  v16 = v13;
  v33 = v16;
  [v12 setInvalidationHandler:&buf];
  [v12 resume];
  objc_storeStrong((id *)&v16[8].isa, a4);

  v17 = self;
  objc_sync_enter(v17);
  contexts = v17->_contexts;
  if (!contexts)
  {
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v20 = v17->_contexts;
    v17->_contexts = v19;

    contexts = v17->_contexts;
  }
  [(NSMutableArray *)contexts addObject:v16];
  objc_sync_exit(v17);

  BOOL v21 = 1;
LABEL_20:

  return v21;
}

- (void)start
{
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __25__NEProviderServer_start__block_invoke;
  handler[3] = &unk_1E5993170;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.networkextension.provider.matching", MEMORY[0x1E4F14428], handler);
}

void __25__NEProviderServer_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, "extension-point");
  if (string && (id v5 = string, *string))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v3);
    id v7 = *(void **)(a1 + 32);
    v8 = [NSString stringWithUTF8String:v5];
    [v7 generateProviderEndpointInfoInMessage:reply extensionPoint:v8];

    xpc_dictionary_send_reply();
  }
  else
  {
    v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      id v11 = "com.apple.networkextension.provider.matching";
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "Received a %s event without an extension point", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (NEExtensionProviderContext)firstContext
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableArray *)v2->_contexts firstObject];
  objc_sync_exit(v2);

  return (NEExtensionProviderContext *)v3;
}

- (void)generateProviderEndpointInfoInMessage:(id)a3 extensionPoint:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  xpc_object_t xdict = a3;
  id v6 = a4;
  id v7 = v6;
  if (!self) {
    goto LABEL_20;
  }
  if (([v6 isEqualToString:@"com.apple.networkextension.filter-data"] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.networkextension.app-proxy"] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.networkextension.packet-tunnel"] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.networkextension.dns-proxy"] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.networkextension.filter-packet"] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.networkextension.app-push"] & 1) != 0)
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    if (![(NSMutableArray *)self->_listeners count]) {
      goto LABEL_10;
    }
    listeners = self->_listeners;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __49__NEProviderServer_getListenerForExtensionPoint___block_invoke;
    uint32_t v24 = &unk_1E5993148;
    id v11 = v9;
    uint64_t v25 = v11;
    uint64_t v12 = [(NSMutableArray *)listeners indexOfObjectPassingTest:&v21];

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      self = [(NSMutableArray *)self->_listeners objectAtIndexedSubscript:v12];
    }
    else
    {
LABEL_10:
      v13 = [NEProviderXPCListener alloc];
      id v11 = v9;
      if (v13
        && (v26.receiver = v13,
            v26.super_class = (Class)NEProviderXPCListener,
            (v14 = [(NEProviderServer *)&v26 initWithServiceName:&stru_1EF054CB8]) != 0))
      {
        v15 = v14;
        objc_storeStrong((id *)&v14[2]._listeners, v9);

        [(NEProviderServer *)v15 setDelegate:self];
        [(NEProviderServer *)v15 resume];
        v16 = self->_listeners;
        if (!v16)
        {
          v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v18 = self->_listeners;
          self->_listeners = v17;

          v16 = self->_listeners;
        }
        -[NSMutableArray addObject:](v16, "addObject:", v15, xdict, v21, v22, v23, v24);
        self = v15;
      }
      else
      {

        self = 0;
      }
    }
  }
  else
  {
    id v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v26.receiver) = 138412290;
      *(id *)((char *)&v26.receiver + 4) = v7;
      _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "Failed to create a listener, extension point is not supported: %@", (uint8_t *)&v26, 0xCu);
    }
    self = 0;
  }

  if (self)
  {
    id v7 = [(NEProviderServer *)self endpoint];
    v19 = [v7 _endpoint];
    xpc_dictionary_set_value(xdict, "listener-endpoint", v19);

LABEL_20:
  }
}

uint64_t __49__NEProviderServer_getListenerForExtensionPoint___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v2 = *(void **)(a2 + 56);
  }
  else {
    v2 = 0;
  }
  return [v2 isEqualToString:*(void *)(a1 + 32)];
}

+ (NEProviderServer)sharedServer
{
  if (sharedServer_onceToken != -1) {
    dispatch_once(&sharedServer_onceToken, &__block_literal_global_25514);
  }
  v2 = (void *)sharedServer_g_server;

  return (NEProviderServer *)v2;
}

uint64_t __32__NEProviderServer_sharedServer__block_invoke()
{
  v0 = objc_alloc_init(NEProviderServer);
  uint64_t v1 = sharedServer_g_server;
  sharedServer_g_server = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end