@interface CSIndexDelegateConnection
+ (id)sharedConnectionForUser:(unsigned int)a3;
- (id)indexForID:(id)a3;
- (id)indexForProtectionClass:(id)a3;
- (void)handleError:(id)a3;
- (void)handleReply:(id)a3;
@end

@implementation CSIndexDelegateConnection

+ (id)sharedConnectionForUser:(unsigned int)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CSIndexDelegateConnection_sharedConnectionForUser___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  unsigned int v6 = a3;
  if (sharedConnectionForUser__onceToken_35 != -1) {
    dispatch_once(&sharedConnectionForUser__onceToken_35, block);
  }
  v3 = (void *)sharedConnectionForUser__sCSIndexDelegateConnection;

  return v3;
}

uint64_t __53__CSIndexDelegateConnection_sharedConnectionForUser___block_invoke(uint64_t a1)
{
  v2 = [CSIndexDelegateConnection alloc];
  uint64_t v3 = [(CSXPCConnection *)v2 initWithMachServiceName:sDelegateConnectionName];
  v4 = (void *)sharedConnectionForUser__sCSIndexDelegateConnection;
  sharedConnectionForUser__sCSIndexDelegateConnection = v3;

  [(id)sharedConnectionForUser__sCSIndexDelegateConnection _setUser:*(unsigned int *)(a1 + 32)];
  [(id)sharedConnectionForUser__sCSIndexDelegateConnection setNonLaunching:1];
  uint64_t v5 = sPrivateDaemon;
  unsigned int v6 = (void *)sharedConnectionForUser__sCSIndexDelegateConnection;

  return [v6 setPrivateDaemon:v5];
}

- (id)indexForID:(id)a3
{
  id v3 = a3;
  id v4 = (id)sIndexMap;
  objc_sync_enter(v4);
  uint64_t v5 = [(id)sIndexMap objectForKey:v3];
  objc_sync_exit(v4);

  if (v5)
  {
    unsigned int v6 = [v5 indexDelegate];

    if (!v6)
    {

      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)indexForProtectionClass:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v3 = CSSanitizeProtectionClass(v15);
  id v4 = (id)sIndexMap;
  objc_sync_enter(v4);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)sIndexMap;
  id v6 = (id)[v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = [(id)sIndexMap objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        v10 = [v9 indexDelegate];
        BOOL v11 = v10 == 0;

        if (!v11)
        {
          v12 = [v9 protectionClass];
          v13 = CSSanitizeProtectionClass(v12);

          if (v13 == v3)
          {
            v13 = v3;
LABEL_15:
            id v6 = v9;

            goto LABEL_16;
          }
          if (v13 && [v3 isEqualToString:v13]) {
            goto LABEL_15;
          }
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  objc_sync_exit(v4);

  return v6;
}

- (void)handleError:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  val = self;
  v28.receiver = self;
  v28.super_class = (Class)CSIndexDelegateConnection;
  [(CSIndexConnection *)&v28 handleError:v4];
  if (v4 == (id)MEMORY[0x1E4F14520])
  {
    id obj = (id)sIndexMap;
    objc_sync_enter(obj);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = (id)sIndexMap;
    id v6 = 0;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v25;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend((id)sIndexMap, "objectForKey:", *(void *)(*((void *)&v24 + 1) + 8 * v9), obj);
          BOOL v11 = v10;
          if (v10)
          {
            v12 = [v10 indexDelegate];
            BOOL v13 = v12 == 0;

            if (!v13)
            {
              if (!v6) {
                id v6 = objc_opt_new();
              }
              v14 = [v11 indexID];
              [v6 addObject:v14];
            }
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }

    objc_sync_exit(obj);
    if ([v6 count])
    {
      int out_token = 0;
      id location = 0;
      objc_initWeak(&location, val);
      id v15 = [(CSXPCConnection *)val queue];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __41__CSIndexDelegateConnection_handleError___block_invoke;
      handler[3] = &unk_1E5549A18;
      objc_copyWeak(&v21, &location);
      id v20 = v6;
      notify_register_dispatch("com.apple.spotlight.IndexAgent.awake", &out_token, v15, handler);

      long long v16 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[CSIndexDelegateConnection handleError:](&out_token, v16);
      }

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

void __41__CSIndexDelegateConnection_handleError___block_invoke(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __41__CSIndexDelegateConnection_handleError___block_invoke_cold_1(a2, v5);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = objc_msgSend(WeakRetained, "indexForID:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        [v11 _delegateCheckIn:@"index-agent-awake"];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  notify_cancel(a2);
}

- (void)handleReply:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "command");
  if (string)
  {
    id v6 = string;
    uint64_t v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CSIndexDelegateConnection handleReply:]();
    }

    if (!strcmp(v6, "perform-job"))
    {
      if (xpc_dictionary_get_uint64(v4, "id"))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInt:", xpc_dictionary_get_uint64(v4, "id"));
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        [(CSIndexDelegateConnection *)self indexForID:v12];
      }
      else
      {
        id v12 = +[CSXPCConnection copyNSStringForKey:"pc" fromXPCDictionary:v4];
        [(CSIndexDelegateConnection *)self indexForProtectionClass:v12];
      uint64_t v8 = };

      if (v8)
      {
        uint64_t v13 = xpc_dictionary_get_value(v4, "j");
        if (v13)
        {
          uint64_t v10 = (void *)v13;
          long long v14 = [[CSIndexJob alloc] initWithXPCDict:v13];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __41__CSIndexDelegateConnection_handleReply___block_invoke;
          v15[3] = &unk_1E5549A40;
          id v16 = v4;
          [v8 performIndexJob:v14 protectionClass:0 acknowledgementHandler:v15];

          goto LABEL_8;
        }
      }
    }
  }
  uint64_t v8 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v10 = reply;
  if (v8 && reply)
  {
    BOOL v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSIndexErrorDomain" code:-1 userInfo:0];
    csindex_xpc_dictionary_encode_status_with_error(v10, v11);

    xpc_connection_send_message((xpc_connection_t)v8, v10);
  }
LABEL_8:
}

void __41__CSIndexDelegateConnection_handleReply___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  id v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  id v5 = reply;
  if (v3) {
    BOOL v6 = reply == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    csindex_xpc_dictionary_encode_status_with_error(reply, v7);
    xpc_connection_send_message(v3, v5);
  }
}

- (void)handleError:(int *)a1 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "### notify awake start %d", (uint8_t *)v3, 8u);
}

void __41__CSIndexDelegateConnection_handleError___block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "### notify awake end %d", (uint8_t *)v2, 8u);
}

- (void)handleReply:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "reply command: %s", v2, v3, v4, v5, v6);
}

@end