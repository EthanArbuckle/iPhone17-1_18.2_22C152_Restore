@interface IPXPCEventStateUpdateStreamSubscriber
- (IPXPCEventStateUpdateStreamSubscriber)initWithToken:(unint64_t)a3;
- (IPXPCEventStateUpdateStreamSubscriberDelegate)delegate;
- (unint64_t)token;
- (void)beginHandshake;
- (void)sendOrEnqueueUpdateMessage:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IPXPCEventStateUpdateStreamSubscriber

- (IPXPCEventStateUpdateStreamSubscriber)initWithToken:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IPXPCEventStateUpdateStreamSubscriber;
  v4 = [(IPXPCEventStateUpdateStreamSubscriber *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_token = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    queuedMessages = v5->_queuedMessages;
    v5->_queuedMessages = v6;
  }
  return v5;
}

- (void)beginHandshake
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  keys = (char *)[@"type" UTF8String];
  xpc_object_t values = xpc_uint64_create(0xFFFFFFFFFFFFFFFFLL);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  v4 = _IPServerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t token = self->_token;
    *(_DWORD *)buf = 134217984;
    unint64_t v11 = token;
    _os_log_impl(&dword_252AA9000, v4, OS_LOG_TYPE_DEFAULT, "beginning handshake for subscriber %llu", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__IPXPCEventStateUpdateStreamSubscriber_beginHandshake__block_invoke;
  v7[3] = &unk_26538F8B8;
  v7[4] = self;
  [WeakRetained subscriber:self firePayload:v3 withReply:v7];
}

void __55__IPXPCEventStateUpdateStreamSubscriber_beginHandshake__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = _IPServerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)IPXPCCopyDescription((uint64_t)v3);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_252AA9000, v4, OS_LOG_TYPE_DEFAULT, "ping reply! %@", buf, 0xCu);
  }
  *(_OWORD *)buf = 0u;
  long long v26 = 0u;
  xpc_dictionary_get_audit_token();
  uint64_t v6 = xpc_copy_entitlement_for_token();
  v7 = (void *)v6;
  if (v6 && MEMORY[0x2533C83D0](v6) == MEMORY[0x263EF86E0] && xpc_BOOL_get_value(v7))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
          uint64_t v15 = *(void *)(a1 + 32);
          v16 = objc_msgSend(v13, "XPCDictionaryRepresentation", (void)v20);
          [WeakRetained subscriber:v15 firePayload:v16];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(id *)(v17 + 8);
    *(void *)(v17 + 8) = 0;
  }
  else
  {
    v19 = _IPServerLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __55__IPXPCEventStateUpdateStreamSubscriber_beginHandshake__block_invoke_cold_1(a1, v19);
    }

    id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v18 subscriberFailedHandshake:*(void *)(a1 + 32)];
  }
}

- (void)sendOrEnqueueUpdateMessage:(id)a3
{
  if (self->_completedHandshake)
  {
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = [v4 XPCDictionaryRepresentation];

    [WeakRetained subscriber:self firePayload:v5];
  }
  else
  {
    queuedMessages = self->_queuedMessages;
    id WeakRetained = a3;
    -[NSMutableArray addObject:](queuedMessages, "addObject:");
  }
}

- (unint64_t)token
{
  return self->_token;
}

- (IPXPCEventStateUpdateStreamSubscriberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IPXPCEventStateUpdateStreamSubscriberDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queuedMessages, 0);
}

void __55__IPXPCEventStateUpdateStreamSubscriber_beginHandshake__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_252AA9000, a2, OS_LOG_TYPE_ERROR, "event subscriber with token %llu is NOT entitled", (uint8_t *)&v3, 0xCu);
}

@end