@interface TVRIntentExtensionDeviceManager
+ (id)sharedInstance;
- (NSMapTable)identifierToHandlerMapping;
- (NSMutableDictionary)attemptedConnectionDict;
- (NSMutableSet)cachedDevices;
- (TVRIntentExtensionDeviceManager)init;
- (double)defaultTimeout;
- (id)_cachedDeviceForIdentifier:(id)a3;
- (void)_disconnectDeviceWithID:(id)a3;
- (void)dealloc;
- (void)device:(id)a3 disconnectedForReason:(int64_t)a4 error:(id)a5;
- (void)deviceConnected:(id)a3;
- (void)resolveDeviceWithIdentifier:(id)a3 handler:(id)a4;
- (void)setAttemptedConnectionDict:(id)a3;
- (void)setCachedDevices:(id)a3;
- (void)setDefaultTimeout:(double)a3;
- (void)setIdentifierToHandlerMapping:(id)a3;
@end

@implementation TVRIntentExtensionDeviceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

void __49__TVRIntentExtensionDeviceManager_sharedInstance__block_invoke(id a1)
{
  sharedInstance_sharedInstance = objc_alloc_init(TVRIntentExtensionDeviceManager);

  _objc_release_x1();
}

- (TVRIntentExtensionDeviceManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)TVRIntentExtensionDeviceManager;
  v2 = [(TVRIntentExtensionDeviceManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_defaultTimeout = 8.0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    attemptedConnectionDict = v3->_attemptedConnectionDict;
    v3->_attemptedConnectionDict = v4;

    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    cachedDevices = v3->_cachedDevices;
    v3->_cachedDevices = v6;

    uint64_t v8 = +[NSMapTable mapTableWithKeyOptions:0x10000 valueOptions:0x10000];
    identifierToHandlerMapping = v3->_identifierToHandlerMapping;
    v3->_identifierToHandlerMapping = (NSMapTable *)v8;
  }
  return v3;
}

- (void)dealloc
{
  v3 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[TVRIntentExtensionDeviceManager dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_cachedDevices;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v9 setDelegate:0];
        [v9 disconnectWithType:0];
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)TVRIntentExtensionDeviceManager;
  [(TVRIntentExtensionDeviceManager *)&v10 dealloc];
}

- (void)resolveDeviceWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __71__TVRIntentExtensionDeviceManager_resolveDeviceWithIdentifier_handler___block_invoke;
    block[3] = &unk_100010578;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    uint64_t v8 = TVRCMakeError();
    v9 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[TVRIntentExtensionDeviceManager resolveDeviceWithIdentifier:handler:]((uint64_t)v8, v9);
    }

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v8);
  }
}

void __71__TVRIntentExtensionDeviceManager_resolveDeviceWithIdentifier_handler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  v3 = v2;
  if (v2 && [v2 connectionState] == (id)2)
  {
    v4 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v11 = 138543618;
      id v12 = v3;
      __int16 v13 = 2114;
      uint64_t v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found connected device=%{public}@,  identifier=%{public}@", (uint8_t *)&v11, 0x16u);
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:"_disconnectDeviceWithID:" object:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) performSelector:"_disconnectDeviceWithID:" withObject:*(void *)(a1 + 40) afterDelay:*(double *)(*(void *)(a1 + 32) + 8)];
  }
  else
  {
    id v6 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 40);
      int v11 = 138543362;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No existing device with identifier=%{public}@. Starting search for device...", (uint8_t *)&v11, 0xCu);
    }

    if (v3) {
      [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v3];
    }
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 32);
    id v9 = objc_retainBlock(*(id *)(a1 + 48));
    [v8 setObject:v9 forKey:*(void *)(a1 + 40)];

    id v10 = [objc_alloc((Class)TVRCDevice) initWithDeviceIdentifier:*(void *)(a1 + 40)];
    [v10 setDelegate:*(void *)(a1 + 32)];
    [v10 connect];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v10 forKey:*(void *)(a1 + 40)];
  }
}

- (id)_cachedDeviceForIdentifier:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_cachedDevices;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsIdentifier:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_disconnectDeviceWithID:(id)a3
{
  id v4 = (char *)a3;
  uint64_t v5 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    v16 = "-[TVRIntentExtensionDeviceManager _disconnectDeviceWithID:]";
    __int16 v17 = 2114;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s, identifier=%{public}@", (uint8_t *)&v15, 0x16u);
  }

  id v6 = [(TVRIntentExtensionDeviceManager *)self _cachedDeviceForIdentifier:v4];
  uint64_t v7 = _TVRIntentExtensionLog();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      v16 = v4;
      __int16 v17 = 2114;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found cached device with identifier=%{public}@,  device=%{public}@. Calling disconnect with type [TVRCDisconnectTypeUserInititated] on the device...", (uint8_t *)&v15, 0x16u);
    }

    [v6 setDelegate:0];
    [v6 disconnectWithType:0];
    [(NSMutableSet *)self->_cachedDevices removeObject:v6];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[TVRIntentExtensionDeviceManager _disconnectDeviceWithID:]((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  [(NSMapTable *)self->_identifierToHandlerMapping removeObjectForKey:v4];
}

- (void)deviceConnected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    v19 = "-[TVRIntentExtensionDeviceManager deviceConnected:]";
    __int16 v20 = 2114;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s, device=%{public}@", (uint8_t *)&v18, 0x16u);
  }

  id v6 = [v4 identifier];
  uint64_t v7 = [(NSMapTable *)self->_identifierToHandlerMapping objectForKey:v6];
  [(NSMutableSet *)self->_cachedDevices addObject:v4];
  attemptedConnectionDict = self->_attemptedConnectionDict;
  uint64_t v9 = [v4 identifier];
  [(NSMutableDictionary *)attemptedConnectionDict removeObjectForKey:v9];

  uint64_t v10 = _TVRIntentExtensionLog();
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      v19 = (const char *)v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling handler for device=%{public}@", (uint8_t *)&v18, 0xCu);
    }

    ((void (**)(void, id, void))v7)[2](v7, v4, 0);
    [(NSMapTable *)self->_identifierToHandlerMapping removeObjectForKey:v6];
    [(TVRIntentExtensionDeviceManager *)self performSelector:"_disconnectDeviceWithID:" withObject:v6 afterDelay:self->_defaultTimeout];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TVRIntentExtensionDeviceManager deviceConnected:]((uint64_t)v4, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (void)device:(id)a3 disconnectedForReason:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315906;
    v26 = "-[TVRIntentExtensionDeviceManager device:disconnectedForReason:error:]";
    __int16 v27 = 2114;
    id v28 = v8;
    __int16 v29 = 2048;
    int64_t v30 = a4;
    __int16 v31 = 2114;
    id v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s, device=%{public}@, reason=%ld, error=%{public}@", (uint8_t *)&v25, 0x2Au);
  }

  identifierToHandlerMapping = self->_identifierToHandlerMapping;
  uint64_t v12 = [v8 identifier];
  uint64_t v13 = [(NSMapTable *)identifierToHandlerMapping objectForKey:v12];

  uint64_t v14 = _TVRIntentExtensionLog();
  uint64_t v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138543618;
      v26 = (const char *)v8;
      __int16 v27 = 2114;
      id v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Calling handler for device=%{public}@, error=%{public}@", (uint8_t *)&v25, 0x16u);
    }

    ((void (**)(void, void, id))v13)[2](v13, 0, v9);
    uint64_t v16 = self->_identifierToHandlerMapping;
    uint64_t v15 = [v8 identifier];
    [(NSMapTable *)v16 removeObjectForKey:v15];
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    -[TVRIntentExtensionDeviceManager deviceConnected:]((uint64_t)v8, v15, v17, v18, v19, v20, v21, v22);
  }

  v23 = [v8 identifier];
  v24 = [(TVRIntentExtensionDeviceManager *)self _cachedDeviceForIdentifier:v23];

  if (v24) {
    [(NSMutableSet *)self->_cachedDevices removeObject:v24];
  }
}

- (double)defaultTimeout
{
  return self->_defaultTimeout;
}

- (void)setDefaultTimeout:(double)a3
{
  self->_defaultTimeout = a3;
}

- (NSMutableSet)cachedDevices
{
  return self->_cachedDevices;
}

- (void)setCachedDevices:(id)a3
{
}

- (NSMutableDictionary)attemptedConnectionDict
{
  return self->_attemptedConnectionDict;
}

- (void)setAttemptedConnectionDict:(id)a3
{
}

- (NSMapTable)identifierToHandlerMapping
{
  return self->_identifierToHandlerMapping;
}

- (void)setIdentifierToHandlerMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToHandlerMapping, 0);
  objc_storeStrong((id *)&self->_attemptedConnectionDict, 0);

  objc_storeStrong((id *)&self->_cachedDevices, 0);
}

- (void)resolveDeviceWithIdentifier:(uint64_t)a1 handler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  v3 = "-[TVRIntentExtensionDeviceManager resolveDeviceWithIdentifier:handler:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid identifier passed into %s, error=%{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)_disconnectDeviceWithID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, a2, a3, "No cached device found with identifier=%{public}@", a5, a6, a7, a8, 2u);
}

- (void)deviceConnected:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, a2, a3, "No handler found for device=%{public}@", a5, a6, a7, a8, 2u);
}

@end