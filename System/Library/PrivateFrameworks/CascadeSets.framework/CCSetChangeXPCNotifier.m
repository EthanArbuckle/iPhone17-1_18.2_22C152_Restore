@interface CCSetChangeXPCNotifier
+ (id)sharedInstance;
- (CCSetChangeXPCNotifier)init;
- (void)_handlePublisherAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5;
- (void)notifyChangeToSet:(id)a3;
@end

@implementation CCSetChangeXPCNotifier

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CCSetChangeXPCNotifier_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_0 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_0, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_0;

  return v2;
}

void __40__CCSetChangeXPCNotifier_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x24C5B1100]();
  objc_opt_class();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = v1;
}

- (CCSetChangeXPCNotifier)init
{
  v14.receiver = self;
  v14.super_class = (Class)CCSetChangeXPCNotifier;
  v2 = [(CCSetChangeXPCNotifier *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    tokens = v2->_tokens;
    v2->_tokens = (NSMutableArray *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cascade.setChange.xpc.notifier", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_249B92000, v8, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCNotifier setting up XPC event publisher", (uint8_t *)buf, 2u);
    }

    uint64_t v9 = xpc_event_publisher_create();
    publisher = v2->_publisher;
    v2->_publisher = (OS_xpc_event_publisher *)v9;

    objc_initWeak(buf, v2);
    objc_copyWeak(&v12, buf);
    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();
    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __30__CCSetChangeXPCNotifier_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  dispatch_queue_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handlePublisherAction:a2 token:a3 descriptor:v7];
}

void __30__CCSetChangeXPCNotifier_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = xpc_strerror();
  v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __30__CCSetChangeXPCNotifier_init__block_invoke_2_cold_1(a2, v3, v4);
  }
}

- (void)_handlePublisherAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 == 2)
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_249B92000, v11, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCNotifier _handlePublisherAction: initial barrier", (uint8_t *)&v17, 2u);
    }
  }
  else if (a3 == 1)
  {
    id v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [NSNumber numberWithUnsignedLongLong:a4];
      int v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_249B92000, v12, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCNotifier removing listener with token: %@", (uint8_t *)&v17, 0xCu);
    }
    tokens = self->_tokens;
    v15 = [NSNumber numberWithUnsignedLongLong:a4];
    LOBYTE(tokens) = [(NSMutableArray *)tokens containsObject:v15];

    if (tokens)
    {
      v16 = self->_tokens;
      v11 = [NSNumber numberWithUnsignedLongLong:a4];
      [(NSMutableArray *)v16 removeObject:v11];
    }
    else
    {
      v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CCSetChangeXPCNotifier _handlePublisherAction:token:descriptor:](a4, v11);
      }
    }
  }
  else
  {
    if (a3) {
      return;
    }
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [NSNumber numberWithUnsignedLongLong:a4];
      int v17 = 138412290;
      v18 = v9;
      _os_log_impl(&dword_249B92000, v8, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCNotifier adding listener with token: %@", (uint8_t *)&v17, 0xCu);
    }
    v10 = self->_tokens;
    v11 = [NSNumber numberWithUnsignedLongLong:a4];
    [(NSMutableArray *)v10 addObject:v11];
  }
}

- (void)notifyChangeToSet:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__CCSetChangeXPCNotifier_notifyChangeToSet___block_invoke;
  v7[3] = &unk_265279EE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __44__CCSetChangeXPCNotifier_notifyChangeToSet___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v4 = 67109376;
    long long v14 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "toXPCDictionary", v14, (void)v15);
        v10 = __biome_log_for_category();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249B92000, v10, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCNotifier firing xpc_event", buf, 2u);
        }

        [v8 unsignedLongValue];
        int v11 = xpc_event_publisher_fire();
        id v12 = __biome_log_for_category();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = *__error();
          *(_DWORD *)buf = v14;
          int v20 = v11;
          __int16 v21 = 1024;
          int v22 = v13;
          _os_log_impl(&dword_249B92000, v12, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCNotifier firing xpc_event returned %d with errno %d", buf, 0xEu);
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_publisher, 0);
}

void __30__CCSetChangeXPCNotifier_init__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSNumber numberWithInt:a1];
  uint64_t v6 = [NSString stringWithUTF8String:a2];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_249B92000, a3, OS_LOG_TYPE_ERROR, "CCSetChangeXPCNotifier XPC event publisher error: %@ %@", (uint8_t *)&v7, 0x16u);
}

- (void)_handlePublisherAction:(uint64_t)a1 token:(NSObject *)a2 descriptor:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Unknown token to remove: %@", (uint8_t *)&v4, 0xCu);
}

@end