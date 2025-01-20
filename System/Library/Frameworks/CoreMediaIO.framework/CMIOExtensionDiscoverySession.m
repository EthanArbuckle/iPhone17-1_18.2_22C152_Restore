@interface CMIOExtensionDiscoverySession
+ (id)sharedInstance;
- (CMIOExtensionDiscoverySession)initWithQueue:(id)a3;
- (NSArray)devices;
- (id)copyProviderBundleID;
- (void)_invalidateProvider:(id)a3;
- (void)completeRegistrationForBundleID:(id)a3 token:(unint64_t)a4;
- (void)dealloc;
- (void)postDeviceChangeNotification;
- (void)provider:(id)a3 availableDevicesChanged:(id)a4;
- (void)provider:(id)a3 didFailWithError:(id)a4;
- (void)provider:(id)a3 propertiesChanged:(id)a4;
- (void)providerHasBeenInvalidated:(id)a3;
- (void)setUpRegistration;
@end

@implementation CMIOExtensionDiscoverySession

uint64_t __47__CMIOExtensionDiscoverySession_initWithQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUpRegistration];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_6);
  }
  return (id)_discoverySession;
}

- (NSArray)devices
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__CMIOExtensionDiscoverySession_devices__block_invoke;
  v6[3] = &unk_26517CAE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(queue, v6);
  v4 = (NSArray *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __50__CMIOExtensionDiscoverySession_setUpRegistration__block_invoke_25()
{
  v0 = CMIOLog();
  if (v0)
  {
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __50__CMIOExtensionDiscoverySession_setUpRegistration__block_invoke_25_cold_1();
    }
  }
}

void __50__CMIOExtensionDiscoverySession_setUpRegistration__block_invoke_25_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x22u);
}

uint64_t __47__CMIOExtensionDiscoverySession_sharedInstance__block_invoke()
{
  v0 = [CMIOExtensionDiscoverySession alloc];
  os_log_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t result = [(CMIOExtensionDiscoverySession *)v0 initWithQueue:dispatch_queue_create("com.apple.coremediaio.extension.discoverysession", v1)];
  _discoverySession = result;
  return result;
}

- (CMIOExtensionDiscoverySession)initWithQueue:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CMIOExtensionDiscoverySession;
  v4 = [(CMIOExtensionDiscoverySession *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)a3;
    v4->_providersByBundleIdentifier = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v5->_extensionEventPublisher = (OS_xpc_event_publisher *)xpc_event_publisher_create();
    queue = v5->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__CMIOExtensionDiscoverySession_initWithQueue___block_invoke;
    block[3] = &unk_26517BF28;
    block[4] = v5;
    dispatch_async(queue, block);
  }
  return v5;
}

- (void)setUpRegistration
{
}

uint64_t __40__CMIOExtensionDiscoverySession_devices__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  os_log_type_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "allValues", 0);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_msgSend(v7, "devices"), "count")) {
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", objc_msgSend(v7, "devices"));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionDiscoverySession;
  [(CMIOExtensionDiscoverySession *)&v3 dealloc];
}

- (void)postDeviceChangeNotification
{
}

uint64_t __61__CMIOExtensionDiscoverySession_postDeviceChangeNotification__block_invoke()
{
  v0 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  return [v0 postNotificationName:@"CMIOExtensionDevicesChangedNotification" object:0];
}

- (void)_invalidateProvider:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 bundleID];
    if (v4)
    {
      uint64_t v5 = v4;
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      [(NSMutableDictionary *)self->_providersByBundleIdentifier removeObjectForKey:v5];
      [(CMIOExtensionDiscoverySession *)self postDeviceChangeNotification];
    }
  }
}

- (id)copyProviderBundleID
{
  return @"NA";
}

- (void)provider:(id)a3 didFailWithError:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v7 = CMIOLog();
  if (v7)
  {
    long long v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
      __int16 v13 = 1024;
      int v14 = 117;
      __int16 v15 = 2080;
      v16 = "-[CMIOExtensionDiscoverySession provider:didFailWithError:]";
      __int16 v17 = 2080;
      v18 = "-[CMIOExtensionDiscoverySession provider:didFailWithError:]";
      __int16 v19 = 2112;
      id v20 = a3;
      __int16 v21 = 2112;
      id v22 = a4;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s  %s %@ %@", buf, 0x3Au);
    }
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__CMIOExtensionDiscoverySession_provider_didFailWithError___block_invoke;
  v10[3] = &unk_26517BF78;
  v10[4] = self;
  v10[5] = a3;
  dispatch_async(queue, v10);
}

uint64_t __59__CMIOExtensionDiscoverySession_provider_didFailWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateProvider:*(void *)(a1 + 40)];
}

- (void)providerHasBeenInvalidated:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMIOLog();
  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      long long v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
      __int16 v11 = 1024;
      int v12 = 125;
      __int16 v13 = 2080;
      int v14 = "-[CMIOExtensionDiscoverySession providerHasBeenInvalidated:]";
      __int16 v15 = 2080;
      v16 = "-[CMIOExtensionDiscoverySession providerHasBeenInvalidated:]";
      __int16 v17 = 2112;
      id v18 = a3;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s  %s %@", buf, 0x30u);
    }
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__CMIOExtensionDiscoverySession_providerHasBeenInvalidated___block_invoke;
  v8[3] = &unk_26517BF78;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(queue, v8);
}

uint64_t __60__CMIOExtensionDiscoverySession_providerHasBeenInvalidated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateProvider:*(void *)(a1 + 40)];
}

- (void)provider:(id)a3 propertiesChanged:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMIOLog();
  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316162;
      long long v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
      __int16 v9 = 1024;
      int v10 = 133;
      __int16 v11 = 2080;
      int v12 = "-[CMIOExtensionDiscoverySession provider:propertiesChanged:]";
      __int16 v13 = 2080;
      int v14 = "-[CMIOExtensionDiscoverySession provider:propertiesChanged:]";
      __int16 v15 = 2112;
      id v16 = a4;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s  %s %@", (uint8_t *)&v7, 0x30u);
    }
  }
}

- (void)provider:(id)a3 availableDevicesChanged:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = CMIOLog();
  if (v6)
  {
    int v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      __int16 v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
      __int16 v10 = 1024;
      int v11 = 139;
      __int16 v12 = 2080;
      __int16 v13 = "-[CMIOExtensionDiscoverySession provider:availableDevicesChanged:]";
      __int16 v14 = 2080;
      __int16 v15 = "-[CMIOExtensionDiscoverySession provider:availableDevicesChanged:]";
      __int16 v16 = 2112;
      id v17 = a4;
      _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s  %s %@", (uint8_t *)&v8, 0x30u);
    }
  }
  [(CMIOExtensionDiscoverySession *)self postDeviceChangeNotification];
}

- (void)completeRegistrationForBundleID:(id)a3 token:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMIOLog();
  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
      __int16 v11 = 1024;
      int v12 = 161;
      __int16 v13 = 2080;
      __int16 v14 = "-[CMIOExtensionDiscoverySession completeRegistrationForBundleID:token:]";
      __int16 v15 = 2114;
      id v16 = a3;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Register for bundleID %{public}@", buf, 0x26u);
    }
  }
  id v7 = a3;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_event_publisher_fire_with_reply();
  xpc_release(v8);
}

void __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke(void *a1, xpc_object_t xdict)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  value = (_xpc_endpoint_s *)xpc_dictionary_get_value(xdict, "endpoint");
  uuid = xpc_dictionary_get_uuid(xdict, "mach-o-uuid");
  uint64_t v6 = CMIOLog();
  if (v6)
  {
    id v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
      uint64_t v9 = a1[4];
      *(_DWORD *)buf = 136316418;
      id v22 = v8;
      __int16 v23 = 1024;
      int v24 = 168;
      __int16 v25 = 2080;
      v26 = "-[CMIOExtensionDiscoverySession completeRegistrationForBundleID:token:]_block_invoke";
      __int16 v27 = 2114;
      uint64_t v28 = v9;
      __int16 v29 = 2048;
      v30 = value;
      __int16 v31 = 2048;
      v32 = uuid;
      _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Receive registration for bundleID %{public}@ endpoint %p uuidBytes %p", buf, 0x3Au);
    }
  }
  if (value && MEMORY[0x245679950](value) == MEMORY[0x263EF8718])
  {
    __int16 v13 = xpc_connection_create_from_endpoint(value);
    xpc_connection_set_target_queue(v13, *(dispatch_queue_t *)(a1[5] + 16));
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_17;
    handler[3] = &unk_26517CB38;
    uint64_t v14 = a1[5];
    handler[4] = a1[4];
    handler[5] = v13;
    uint64_t v15 = a1[6];
    handler[6] = v14;
    handler[7] = v15;
    xpc_connection_set_event_handler(v13, handler);
    xpc_connection_resume(v13);
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v16, "MessageType", 0x19uLL);
    uint64_t v17 = a1[5];
    uint64_t v18 = *(NSObject **)(v17 + 16);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_2;
    v19[3] = &unk_26517CB60;
    v19[4] = a1[4];
    v19[5] = v13;
    v19[6] = value;
    v19[7] = v17;
    xpc_connection_send_message_with_reply(v13, v16, v18, v19);
    xpc_release(v16);
    xpc_release(v13);
  }
  else
  {
    __int16 v10 = CMIOLog();
    if (v10)
    {
      __int16 v11 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
        *(_DWORD *)buf = 136315650;
        id v22 = v12;
        __int16 v23 = 1024;
        int v24 = 170;
        __int16 v25 = 2080;
        v26 = "-[CMIOExtensionDiscoverySession completeRegistrationForBundleID:token:]_block_invoke";
        _os_log_impl(&dword_2432B6000, v11, OS_LOG_TYPE_DEFAULT, "%s:%d:%s returning early because a valid endpoint was not provided", buf, 0x1Cu);
      }
    }
  }
}

void __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_17(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x245679950](a2) == MEMORY[0x263EF8720])
  {
    uint64_t v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_17_cold_1();
    }
    if (a2 == MEMORY[0x263EF86A8])
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "_invalidateProvider:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 24), "objectForKeyedSubscript:", *(void *)(a1 + 32)));
    }
    else if (a2 == MEMORY[0x263EF86A0])
    {
      objc_msgSend(*(id *)(a1 + 48), "_invalidateProvider:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 24), "objectForKeyedSubscript:", *(void *)(a1 + 32)));
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(NSObject **)(v5 + 16);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_18;
      block[3] = &unk_26517CB10;
      uint64_t v7 = *(void *)(a1 + 32);
      block[4] = v5;
      void block[5] = v7;
      block[6] = *(void *)(a1 + 56);
      dispatch_async(v6, block);
    }
  }
}

uint64_t __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeRegistrationForBundleID:*(void *)(a1 + 40) token:*(void *)(a1 + 48)];
}

void __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x245679950](a2);
  if (v3 == MEMORY[0x263EF8720])
  {
    __int16 v11 = CMIOLog();
    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_2_cold_1();
    }
  }
  else if (v3 == MEMORY[0x263EF8708])
  {
    uint64_t v4 = CMIOLog();
    if (v4)
    {
      uint64_t v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
        uint64_t v7 = a1[4];
        uint64_t v8 = a1[5];
        int v12 = 136316162;
        __int16 v13 = v6;
        __int16 v14 = 1024;
        int v15 = 206;
        __int16 v16 = 2080;
        uint64_t v17 = "-[CMIOExtensionDiscoverySession completeRegistrationForBundleID:token:]_block_invoke";
        __int16 v18 = 2114;
        uint64_t v19 = v7;
        __int16 v20 = 2048;
        uint64_t v21 = v8;
        _os_log_impl(&dword_2432B6000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Complete Registration for %{public}@ (%p) ", (uint8_t *)&v12, 0x30u);
      }
    }
    uint64_t v9 = [[CMIOExtensionSessionProvider alloc] initWithEndpoint:a1[6] delegate:a1[7]];
    if (v9)
    {
      __int16 v10 = v9;
      [(CMIOExtensionSessionProvider *)v9 setBundleID:a1[4]];
      [*(id *)(a1[7] + 24) setObject:v10 forKeyedSubscript:a1[4]];
    }
  }
}

void __50__CMIOExtensionDiscoverySession_setUpRegistration__block_invoke(uint64_t a1, int a2, uint64_t a3, xpc_object_t xdict)
{
  if (!a2)
  {
    string = xpc_dictionary_get_string(xdict, "CMIOExtensionBundleIdentifier");
    if (string && *string)
    {
      id v8 = (id)[[NSString alloc] initWithCString:string encoding:4];
      [*(id *)(a1 + 32) completeRegistrationForBundleID:v8 token:a3];
    }
    else
    {
      uint64_t v7 = CMIOLog();
      if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __50__CMIOExtensionDiscoverySession_setUpRegistration__block_invoke_cold_1();
      }
    }
  }
}

void __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_17_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x3Au);
}

void __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_2_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x30u);
}

void __50__CMIOExtensionDiscoverySession_setUpRegistration__block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

@end