@interface CommunicationsFilterBlockList
+ (id)sharedInstance;
- (BOOL)_connect;
- (BOOL)_disconnect;
- (BOOL)isItemInList:(id)a3;
- (CommunicationsFilterBlockList)init;
- (id)_sendSynchronousXPCRequest:(id)a3;
- (id)copyAllItems;
- (void)_disconnected;
- (void)_sendXPCRequest:(id)a3 completionBlock:(id)a4;
- (void)addItemForAllServices:(id)a3;
- (void)copyAllItems;
- (void)dealloc;
- (void)removeItemForAllServices:(id)a3;
@end

@implementation CommunicationsFilterBlockList

CommunicationsFilterBlockList *__47__CommunicationsFilterBlockList_sharedInstance__block_invoke()
{
  result = objc_alloc_init(CommunicationsFilterBlockList);
  sharedInstance_sInstance = (uint64_t)result;
  return result;
}

- (CommunicationsFilterBlockList)init
{
  v4.receiver = self;
  v4.super_class = (Class)CommunicationsFilterBlockList;
  v2 = [(CommunicationsFilterBlockList *)&v4 init];
  if (v2)
  {
    v2->_cache = objc_alloc_init(CommunicationsFilterBlockListCache);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.cmfblocklist", 0);
  }
  return v2;
}

- (BOOL)_connect
{
  connection = self->_connection;
  if (!connection)
  {
    objc_super v4 = CMFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2129DC000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to CMFSync Agent", buf, 2u);
    }
    self->_connection = (OS_xpc_object *)IMXPCCreateConnectionForServiceWithQueue();
    IMXPCConfigureConnection();
    connection = self->_connection;
  }
  return connection != 0;
}

- (BOOL)isItemInList:(id)a3
{
  int64_t v5 = -[CommunicationsFilterBlockListCache cachedResponseForItem:](self->_cache, "cachedResponseForItem:");
  v6 = CMFDefaultLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == -1)
  {
    if (v7)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2129DC000, v6, OS_LOG_TYPE_DEFAULT, "Item not in the cache.", v15, 2u);
    }
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, (const char *)CMFXPCEventCode, 3);
    uint64_t v13 = [a3 dictionaryRepresentation];
    IMInsertDictionariesToXPCDictionary();
    id v10 = -[CommunicationsFilterBlockList _sendSynchronousXPCRequest:](self, "_sendSynchronousXPCRequest:", v9, v13, 0);
    xpc_release(v9);
    uint64_t v8 = [v10 objectForKey:CMFDictionaryResultKey];
    if (v8)
    {
      v11 = (void *)v8;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[CommunicationsFilterBlockListCache setResponse:forItem:](self->_cache, "setResponse:forItem:", [v11 BOOLValue], a3);
        LOBYTE(v8) = [v11 BOOLValue];
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2129DC000, v6, OS_LOG_TYPE_DEFAULT, "Item in the cache.", buf, 2u);
    }
    LOBYTE(v8) = v5 == 1;
  }
  return v8;
}

+ (id)sharedInstance
{
  if (sharedInstance_creation != -1) {
    dispatch_once(&sharedInstance_creation, &__block_literal_global_0);
  }
  return (id)sharedInstance_sInstance;
}

uint64_t __65__CommunicationsFilterBlockList__sendXPCRequest_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) _connect])
  {
    uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F4A808] code:-1 userInfo:0];
    int64_t v5 = 0;
    goto LABEL_21;
  }
  xpc_object_t v2 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), *(xpc_object_t *)(a1 + 40));
  uint64_t v3 = MEMORY[0x21668A160]();
  if (v3 == MEMORY[0x263EF8720])
  {
    if (v2 == (xpc_object_t)MEMORY[0x263EF86A8])
    {
      v12 = CMFDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __65__CommunicationsFilterBlockList__sendXPCRequest_completionBlock___block_invoke_cold_1();
      }
    }
    else if (v2 == (xpc_object_t)MEMORY[0x263EF86A0])
    {
      v6 = CMFDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __65__CommunicationsFilterBlockList__sendXPCRequest_completionBlock___block_invoke_cold_2();
      }
    }
    uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F4A808] code:-1 userInfo:0];
  }
  else
  {
    if (v3 == MEMORY[0x263EF8708])
    {
      BOOL v7 = CMFDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v14 = 134217984;
        uint64_t v15 = v8;
        _os_log_impl(&dword_2129DC000, v7, OS_LOG_TYPE_DEFAULT, "Result back for request (%p)", (uint8_t *)&v14, 0xCu);
      }
      uint64_t v4 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
      int64_t v5 = (void *)IMGetXPCDictionaryFromDictionary();
      xpc_object_t v9 = CMFDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v5 allKeys];
        int v14 = 138412290;
        uint64_t v15 = v10;
        _os_log_impl(&dword_2129DC000, v9, OS_LOG_TYPE_DEFAULT, "Response: %@", (uint8_t *)&v14, 0xCu);
      }
      v11 = CMFDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134217984;
        uint64_t v15 = v4;
        _os_log_impl(&dword_2129DC000, v11, OS_LOG_TYPE_DEFAULT, "Error: %p", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_20;
    }
    uint64_t v4 = 0;
  }
  int64_t v5 = 0;
LABEL_20:
  xpc_release(v2);
LABEL_21:
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *, uint64_t))(result + 16))(result, v5, v4);
  }
  return result;
}

id __60__CommunicationsFilterBlockList__sendSynchronousXPCRequest___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (id)_sendSynchronousXPCRequest:(id)a3
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000;
  xpc_object_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__CommunicationsFilterBlockList__sendSynchronousXPCRequest___block_invoke;
  v5[3] = &unk_2641977D8;
  v5[4] = &v6;
  self->_retries = 0;
  [(CommunicationsFilterBlockList *)self _sendXPCRequest:a3 completionBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_sendXPCRequest:(id)a3 completionBlock:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CommunicationsFilterBlockList__sendXPCRequest_completionBlock___block_invoke;
  block[3] = &unk_264197800;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(queue, block);
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  self->_queue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CommunicationsFilterBlockList;
  [(CommunicationsFilterBlockList *)&v3 dealloc];
}

- (void)addItemForAllServices:(id)a3
{
  uint64_t v5 = [a3 dictionaryRepresentation];
  if (v5)
  {
    uint64_t v6 = v5;
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, (const char *)CMFXPCEventCode, 0);
    IMInsertDictionariesToXPCDictionary();
    -[CommunicationsFilterBlockList _sendSynchronousXPCRequest:](self, "_sendSynchronousXPCRequest:", v7, v6, 0);
    xpc_release(v7);
    cache = self->_cache;
    [(CommunicationsFilterBlockListCache *)cache removeItemFromCache:a3];
  }
  else
  {
    xpc_object_t v9 = CMFDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[CommunicationsFilterBlockList addItemForAllServices:]();
    }
  }
}

- (void)removeItemForAllServices:(id)a3
{
  uint64_t v5 = [a3 dictionaryRepresentation];
  if (v5)
  {
    uint64_t v6 = v5;
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, (const char *)CMFXPCEventCode, 1);
    IMInsertDictionariesToXPCDictionary();
    -[CommunicationsFilterBlockList _sendSynchronousXPCRequest:](self, "_sendSynchronousXPCRequest:", v7, v6, 0);
    xpc_release(v7);
    cache = self->_cache;
    [(CommunicationsFilterBlockListCache *)cache removeItemFromCache:a3];
  }
  else
  {
    xpc_object_t v9 = CMFDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[CommunicationsFilterBlockList removeItemForAllServices:]();
    }
  }
}

- (id)copyAllItems
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, (const char *)CMFXPCEventCode, 2);
  id v4 = [(CommunicationsFilterBlockList *)self _sendSynchronousXPCRequest:v3];
  xpc_release(v3);
  uint64_t v5 = [v4 objectForKey:CMFDictionaryResultKey];
  if (v5 && (uint64_t v6 = (void *)v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    xpc_object_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = [[CommunicationFilterItem alloc] initWithDictionaryRepresentation:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          if (v12)
          {
            uint64_t v13 = v12;
            [v7 addObject:v12];
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  else
  {
    int v14 = CMFDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CommunicationsFilterBlockList copyAllItems]();
    }
    return 0;
  }
  return v7;
}

uint64_t __41__CommunicationsFilterBlockList__connect__block_invoke(uint64_t a1)
{
  xpc_object_t v2 = CMFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2129DC000, v2, OS_LOG_TYPE_DEFAULT, "com.apple.cmfsyncagent", v4, 2u);
  }
  return [*(id *)(a1 + 32) _disconnected];
}

- (BOOL)_disconnect
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CommunicationsFilterBlockList__disconnect__block_invoke;
  block[3] = &unk_264197828;
  block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

void __44__CommunicationsFilterBlockList__disconnect__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    xpc_object_t v2 = CMFDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)xpc_object_t v3 = 0;
      _os_log_impl(&dword_2129DC000, v2, OS_LOG_TYPE_DEFAULT, "Forcing a disconnect, terminating connection", v3, 2u);
    }
    xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8));
    xpc_release(*(xpc_object_t *)(*(void *)(a1 + 32) + 8));
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
  }
}

- (void)_disconnected
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CommunicationsFilterBlockList__disconnected__block_invoke;
  block[3] = &unk_264197828;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__CommunicationsFilterBlockList__disconnected__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    xpc_object_t v2 = CMFDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)xpc_object_t v3 = 0;
      _os_log_impl(&dword_2129DC000, v2, OS_LOG_TYPE_DEFAULT, "Clearing out _connection, we're disconnected", v3, 2u);
    }
    xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8));
    xpc_release(*(xpc_object_t *)(*(void *)(a1 + 32) + 8));
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
  }
}

- (void)addItemForAllServices:.cold.1()
{
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_2129DC000, v0, OS_LOG_TYPE_FAULT, "Client is requesting to add an invalid item to the block list - will not notify server of any changes", v1, 2u);
}

- (void)removeItemForAllServices:.cold.1()
{
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_2129DC000, v0, OS_LOG_TYPE_FAULT, "Client is requesting to remove an invalid item from the block list - will not notify server of any changes", v1, 2u);
}

- (void)copyAllItems
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2129DC000, v0, v1, "XPC service didn't give us an array", v2, v3, v4, v5, v6);
}

void __65__CommunicationsFilterBlockList__sendXPCRequest_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2129DC000, v0, v1, "Received an XPC_ERROR_CONNECTION_INVALID error.", v2, v3, v4, v5, v6);
}

void __65__CommunicationsFilterBlockList__sendXPCRequest_completionBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2129DC000, v0, v1, "Received an XPC_ERROR_CONNECTION_INTERRUPTED error.", v2, v3, v4, v5, v6);
}

@end