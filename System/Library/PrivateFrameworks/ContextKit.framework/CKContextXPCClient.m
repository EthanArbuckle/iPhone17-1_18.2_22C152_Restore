@interface CKContextXPCClient
+ (id)invalidateAndGetNewXpcConnection;
+ (id)isXPCConnectionError:(id)a3;
+ (id)newXpcConnection;
+ (id)xpcConnection;
+ (void)initialize;
+ (void)invalidateXpcConnection;
+ (void)registerForServiceUpdateNotifications:(id)a3;
@end

@implementation CKContextXPCClient

+ (id)xpcConnection
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)_connection;
  v4 = v3;
  if (v3
    && ([v3 invalidationHandler], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = (id)_connection;
    v7 = (void *)[v2 newXpcConnection];
    v8 = (void *)_connection;
    _connection = (uint64_t)v7;

    id v9 = v7;
    v4 = v9;
  }
  objc_sync_exit(v2);

  [v6 invalidate];
  return v4;
}

+ (void)initialize
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not register configuration update handler; status=%u",
    (uint8_t *)v1,
    8u);
}

void __32__CKContextXPCClient_initialize__block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = @"com.apple.contextkit.configurationChanged";
    _os_log_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Received %@", buf, 0xCu);
  }
  +[CKContextXPCClient invalidateXpcConnection];
  v0 = dispatch_get_global_queue(17, 0);
  id obj = (id)kUpdateNotificationListeners;
  objc_sync_enter(obj);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = (id)kUpdateNotificationListeners;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v10;
    uint64_t v4 = MEMORY[0x1E4F143A8];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v1);
        }
        objc_initWeak((id *)buf, *(id *)(*((void *)&v9 + 1) + 8 * v5));
        block[0] = v4;
        block[1] = 3221225472;
        block[2] = __32__CKContextXPCClient_initialize__block_invoke_4;
        block[3] = &unk_1E5B489B0;
        objc_copyWeak(&v8, (id *)buf);
        dispatch_async(v0, block);
        objc_destroyWeak(&v8);
        objc_destroyWeak((id *)buf);
        ++v5;
      }
      while (v2 != v5);
      uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v2);
  }

  objc_sync_exit(obj);
}

void __32__CKContextXPCClient_initialize__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didReceiveCKContextServiceUpdateNotification];
}

+ (void)registerForServiceUpdateNotifications:(id)a3
{
  id v4 = a3;
  id v3 = (id)kUpdateNotificationListeners;
  objc_sync_enter(v3);
  [(id)kUpdateNotificationListeners addObject:v4];
  objc_sync_exit(v3);
}

+ (id)invalidateAndGetNewXpcConnection
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)_connection;
  id v4 = (void *)[v2 newXpcConnection];
  uint64_t v5 = (void *)_connection;
  _connection = (uint64_t)v4;

  id v6 = v4;
  if (v3 == v6)
  {
    id v7 = v3;
    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    [v3 invalidate];
    id v7 = v6;
  }

  return v7;
}

+ (void)invalidateXpcConnection
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (void *)_connection;
  _connection = 0;
  id v4 = v3;

  objc_sync_exit(v2);
  [v4 invalidate];
}

+ (id)newXpcConnection
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.siri.context.service"];
  id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF825EB8];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  long long v9 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel_ancestorsForTopics_withReply_ argumentIndex:0 ofReply:1];

  long long v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  long long v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v4 setClasses:v12 forSelector:sel_findCategorizationsForRequest_withReply_ argumentIndex:0 ofReply:0];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
  [v4 setClasses:v16 forSelector:sel_findCategorizationsForRequest_withReply_ argumentIndex:0 ofReply:1];

  v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v17 forSelector:sel_findCategorizationsForRequest_withReply_ argumentIndex:1 ofReply:1];

  [v3 setRemoteObjectInterface:v4];
  objc_initWeak(&location, v3);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __38__CKContextXPCClient_newXpcConnection__block_invoke;
  v19[3] = &unk_1E5B489D8;
  objc_copyWeak(v20, &location);
  v20[1] = a1;
  [v3 setInvalidationHandler:v19];
  [v3 resume];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "New XPC Connection: %@", buf, 0xCu);
  }
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  return v3;
}

void __38__CKContextXPCClient_newXpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = *(id *)(a1 + 40);
    objc_sync_enter(v3);
    if ((id)_connection == v4)
    {
      _connection = 0;
    }
    objc_sync_exit(v3);

    id WeakRetained = v4;
  }
}

+ (id)isXPCConnectionError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_11;
  }
  uint64_t v5 = [v3 code];
  if (v5 == 4099)
  {
    int v6 = 1;
  }
  else
  {
    if (v5 != 4097)
    {
LABEL_11:
      uint64_t v11 = 0;
      goto LABEL_16;
    }
    int v6 = 0;
  }
  uint64_t v7 = [v4 domain];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (!v8) {
    goto LABEL_11;
  }
  BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v9) {
      +[CKContextXPCClient isXPCConnectionError:]((uint64_t)v4);
    }
    uint64_t v10 = +[CKContextXPCClient invalidateAndGetNewXpcConnection];
  }
  else
  {
    if (v9) {
      +[CKContextXPCClient isXPCConnectionError:]((uint64_t)v4);
    }
    uint64_t v10 = +[CKContextXPCClient xpcConnection];
  }
  uint64_t v11 = (void *)v10;
LABEL_16:

  return v11;
}

+ (void)isXPCConnectionError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "XPC connection invalid, establishing new connection: %@", (uint8_t *)&v1, 0xCu);
}

+ (void)isXPCConnectionError:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "XPC connection interrupted, trying again: %@", (uint8_t *)&v1, 0xCu);
}

@end