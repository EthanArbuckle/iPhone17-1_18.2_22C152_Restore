@interface BrightnessSystemClientInternal
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)setSyncProperty:(id)a3 forKey:(id)a4;
- (BrightnessSystemClientInternal)init;
- (id)copyPropertyForKey:(id)a3;
- (void)addKeyToClientProperties:(id)a3;
- (void)addPropertiesForNotification:(id)a3;
- (void)addPropertyForNotification:(id)a3;
- (void)dealloc;
- (void)registerNotificationBlock:(id)a3;
- (void)registerNotificationBlock:(id)a3 forProperties:(id)a4;
- (void)removeKeyFromClientProperties:(id)a3;
- (void)removePropertiesFromNotification:(id)a3;
- (void)removePropertyFromNotification:(id)a3;
- (void)stopXpcService;
@end

@implementation BrightnessSystemClientInternal

uint64_t __53__BrightnessSystemClientInternal_setProperty_forKey___block_invoke(void *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "clientSetPropertyWithKey:property:", a1[5], a1[6], a1, a1);
}

CFTypeRef __53__BrightnessSystemClientInternal_copyPropertyForKey___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  CFTypeRef result = (CFTypeRef)[a3 code];
  if (!result)
  {
    CFTypeRef result = (CFTypeRef)[a2 objectAtIndex:0];
    if (result)
    {
      CFTypeRef result = CFRetain(result);
      CFTypeRef v4 = result;
    }
    else
    {
      CFTypeRef v4 = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v4;
  }
  return result;
}

- (id)copyPropertyForKey:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v45 = self;
  SEL v44 = a2;
  id v43 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  int v38 = 1375731712;
  int v39 = 48;
  v40 = __Block_byref_object_copy__1;
  v41 = __Block_byref_object_dispose__1;
  uint64_t v42 = 0;
  objc_sync_enter(self);
  if (v45->_remote)
  {
    id v34 = (id)[v43 copy];
    if (v45->_useSynchronousRemote)
    {
      dispatch_block_t v33 = 0;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v26 = -1073741824;
      int v27 = 0;
      v28 = __53__BrightnessSystemClientInternal_copyPropertyForKey___block_invoke;
      v29 = &unk_1E6219300;
      v30 = v45;
      id v31 = v34;
      v32 = &v36;
      dispatch_block_t v33 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &block);
      dispatch_sync((dispatch_queue_t)v45->_serialQueue, v33);
      if (v33) {
        _Block_release(v33);
      }
    }
    else
    {
      [(NSCondition *)v45->copyPropertyForKeyWaitCondition lock];
      v45->copyPropertyForKeyCompleted = 0;
      [(NSCondition *)v45->copyPropertyForKeyWaitCondition unlock];
      id remote = v45->_remote;
      uint64_t v18 = MEMORY[0x1E4F143A8];
      int v19 = -1073741824;
      int v20 = 0;
      v21 = __53__BrightnessSystemClientInternal_copyPropertyForKey___block_invoke_3;
      v22 = &unk_1E6219328;
      v24 = &v36;
      v23 = v45;
      objc_msgSend(remote, "clientCopyPropertyWithKey:reply:", v34);
      [(NSCondition *)v45->copyPropertyForKeyWaitCondition lock];
      while (!v45->copyPropertyForKeyCompleted)
      {
        id v17 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:10.0];
        char v16 = 0;
        char v16 = ![(NSCondition *)v45->copyPropertyForKeyWaitCondition waitUntilDate:v17];

        if (v16)
        {
          os_log_t oslog = 0;
          if (v45->_logHandle)
          {
            logHandle = v45->_logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t inited = init_default_corebrightness_log();
            }
            logHandle = inited;
          }
          os_log_t oslog = logHandle;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
          {
            log = oslog;
            os_log_type_t v9 = type;
            __os_log_helper_16_0_0(v13);
            _os_log_impl(&dword_1BA438000, log, v9, "copyPropertyForKeyWaitCondition waitUntilDate timeout", v13, 2u);
          }
          break;
        }
      }
      v45->copyPropertyForKeyCompleted = 0;
      [(NSCondition *)v45->copyPropertyForKeyWaitCondition unlock];
    }

    int v35 = 0;
  }
  else
  {
    v46 = 0;
    int v35 = 1;
  }
  objc_sync_exit(self);
  if (!v35)
  {
    if ([v43 isEqual:@"DisplayBrightness"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v45->_logHandle)
        {
          v7 = v45->_logHandle;
        }
        else
        {
          uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          v7 = v6;
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v5 = objc_opt_class();
          __os_log_helper_16_2_1_8_64((uint64_t)v47, v5);
          _os_log_impl(&dword_1BA438000, v7, OS_LOG_TYPE_DEFAULT, "Value of the key, \"kCBDisplayBrightnessKey\", is NOT a dictionary class (is a \"%@\" object)", v47, 0xCu);
        }
      }
    }
    if (v37[5] == *MEMORY[0x1E4F1D260])
    {
      CFRelease((CFTypeRef)v37[5]);
      v37[5] = 0;
    }
    v46 = (void *)v37[5];
    int v35 = 1;
  }
  _Block_object_dispose(&v36, 8);
  return v46;
}

- (void)stopXpcService
{
  self->_id remote = 0;
  objc_sync_exit(self);
}

- (BrightnessSystemClientInternal)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v26 = self;
  SEL v25 = a2;
  v24.receiver = self;
  v24.super_class = (Class)BrightnessSystemClientInternal;
  int v26 = [(BrightnessSystemClientInternal *)&v24 init];
  if (!v26) {
    return v26;
  }
  os_log_t v2 = os_log_create("com.apple.CoreBrightness.BSCI", "default");
  v26->_logHandle = (OS_os_log *)v2;
  if (!v26->_logHandle)
  {
    v23 = 0;
    int v19 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v23 = v19;
    char v22 = 16;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      log = v23;
      os_log_type_t type = v22;
      __os_log_helper_16_0_0(v21);
      _os_log_error_impl(&dword_1BA438000, log, type, "failed to create log handle", v21, 2u);
    }
  }
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.backlightd" options:0];
  v26->_connection = (NSXPCConnection *)v3;
  CFTypeRef v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  int v20 = dispatch_queue_create("com.apple.CoreBrightness.BSCI NSXPC", v4);
  if (v20)
  {
    [(NSXPCConnection *)v26->_connection _setQueue:v20];
    dispatch_release(v20);
  }
  v26->copyPropertyForKeyCompleted = 0;
  uint64_t v5 = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
  v26->copyPropertyForKeyWaitCondition = v5;
  v26->_useSynchronousRemote = 0;
  if (_os_feature_enabled_impl()) {
    v26->_useSynchronousRemote = 1;
  }
  if (v26->_logHandle)
  {
    logHandle = v26->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v28, v26->_useSynchronousRemote);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "use_synchronous_remote=%d", v28, 8u);
  }
  if (!v26->_connection) {
    goto LABEL_30;
  }
  uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F141D690];
  [(NSXPCConnection *)v26->_connection setRemoteObjectInterface:v6];
  -[NSXPCConnection setInvalidationHandler:](v26->_connection, "setInvalidationHandler:");
  -[NSXPCConnection setInterruptionHandler:](v26->_connection, "setInterruptionHandler:");
  if (!v26->_useSynchronousRemote)
  {
    uint64_t v10 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v26->_connection, "remoteObjectProxyWithErrorHandler:");
    v26->_id remote = (id)v10;
    goto LABEL_25;
  }
  v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.CoreBrightness.BSCI serial", v7);
  v26->_serialQueue = (OS_dispatch_queue *)v8;
  if (!v26->_serialQueue)
  {
LABEL_30:

    return 0;
  }
  uint64_t v9 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v26->_connection, "synchronousRemoteObjectProxyWithErrorHandler:");
  v26->_id remote = (id)v9;
LABEL_25:
  if (!v26->_remote) {
    goto LABEL_30;
  }
  id v11 = v26->_remote;
  v12 = objc_alloc_init(BrightnessSystemClientExportedObj);
  v26->exportedObj = v12;
  if (!v26->exportedObj) {
    goto LABEL_30;
  }
  [(BrightnessSystemClientExportedObj *)v26->exportedObj setTarget:v26];
  uint64_t v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F141C100];
  [(NSXPCConnection *)v26->_connection setExportedInterface:v13];
  [(NSXPCConnection *)v26->_connection setExportedObject:v26->exportedObj];
  [(NSXPCConnection *)v26->_connection resume];
  return v26;
}

- (void)registerNotificationBlock:(id)a3 forProperties:(id)a4
{
  objc_sync_enter(self);
  if (self->_remote)
  {
    [(BrightnessSystemClientInternal *)self registerNotificationBlock:0];
    if (self->_clientProperties)
    {

      self->_clientProperties = 0;
    }
    if (a4) {
      self->_clientProperties = (NSMutableArray *)[a4 mutableCopy];
    }
    if (self->_clientProperties)
    {
      [self->_remote registerNotificationForProperties:self->_clientProperties];
    }
    else
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1C978]);
      [self->_remote registerNotificationForProperties:v4];
    }
    -[BrightnessSystemClientInternal registerNotificationBlock:](self, "registerNotificationBlock:", a3, v4);
  }
  objc_sync_exit(self);
}

- (void)registerNotificationBlock:(id)a3
{
  v12 = self;
  SEL v11 = a2;
  id v10 = a3;
  uint64_t v9 = 0;
  if (_COREBRIGHTNESS_LOG_DEFAULT) {
    uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
  }
  else {
    uint64_t inited = init_default_corebrightness_log();
  }
  uint64_t v9 = inited;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "Register notification block", v7, 2u);
  }
  obj = v12;
  objc_sync_enter(v12);
  [(BrightnessSystemClientExportedObj *)v12->exportedObj registerNotificationBlock:v10];
  objc_sync_exit(obj);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  SEL v25 = self;
  SEL v24 = a2;
  id v23 = a3;
  id v22 = a4;
  objc_sync_enter(self);
  if (v25->_remote)
  {
    id v20 = (id)[v22 copy];
    id v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v23, 0);
    if ([v22 isEqual:@"DisplayMode"])
    {
      os_log_t v18 = 0;
      if (v25->_logHandle)
      {
        logHandle = v25->_logHandle;
      }
      else
      {
        uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v5;
      }
      os_log_t v18 = logHandle;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v27, (uint64_t)v23);
        _os_log_impl(&dword_1BA438000, v18, v17, "[Display Mode] %@", v27, 0xCu);
      }
    }
    if (v25->_useSynchronousRemote)
    {
      dispatch_block_t v16 = 0;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v9 = -1073741824;
      int v10 = 0;
      SEL v11 = __53__BrightnessSystemClientInternal_setProperty_forKey___block_invoke;
      v12 = &unk_1E62192B0;
      uint64_t v13 = v25;
      id v14 = v20;
      id v15 = v19;
      dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &block);
      dispatch_sync((dispatch_queue_t)v25->_serialQueue, v16);
      if (v16) {
        _Block_release(v16);
      }
    }
    else
    {
      [v25->_remote clientSetPropertyWithKey:v20 property:v19];
    }

    int v21 = 0;
  }
  else
  {
    char v26 = 0;
    int v21 = 1;
  }
  objc_sync_exit(self);
  if (!v21) {
    char v26 = 1;
  }
  return v26 & 1;
}

uint64_t __53__BrightnessSystemClientInternal_copyPropertyForKey___block_invoke(void *a1)
{
  v12 = a1;
  SEL v11 = a1;
  os_log_t v2 = *(void **)(a1[4] + 16);
  uint64_t v3 = a1[5];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  os_log_type_t v8 = __53__BrightnessSystemClientInternal_copyPropertyForKey___block_invoke_2;
  int v9 = &unk_1E62192D8;
  uint64_t v10 = a1[6];
  return objc_msgSend(v2, "clientCopyPropertyWithKey:reply:", v3);
}

- (void)dealloc
{
  v12 = self;
  SEL v11 = a2;
  uint64_t v10 = 0;
  if (self->_logHandle)
  {
    logHandle = v12->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  uint64_t v10 = logHandle;
  char v9 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v10;
    os_log_type_t type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_debug_impl(&dword_1BA438000, log, type, "BSCI dealloc", v8, 2u);
  }
  if (v12->_logHandle)
  {

    v12->_logHandle = 0;
  }
  obj = v12;
  objc_sync_enter(v12);
  [(BrightnessSystemClientInternal *)v12 registerNotificationBlock:0];
  if (v12->_clientProperties)
  {

    v12->_clientProperties = 0;
  }
  if (v12->_connection) {

  }
  if (v12->exportedObj)
  {

    v12->exportedObj = 0;
  }
  if (v12->_useSynchronousRemote) {

  }
  objc_sync_exit(obj);
  v7.receiver = v12;
  v7.super_class = (Class)BrightnessSystemClientInternal;
  [(BrightnessSystemClientInternal *)&v7 dealloc];
}

void __38__BrightnessSystemClientInternal_init__block_invoke(uint64_t a1)
{
  uint64_t v9 = a1;
  uint64_t v8 = a1;
  objc_super v7 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    id v4 = inited;
  }
  objc_super v7 = v4;
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    log = v7;
    os_log_type_t type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_impl(&dword_1BA438000, log, type, "Connection invalidated!", v5, 2u);
  }
}

void __38__BrightnessSystemClientInternal_init__block_invoke_66(uint64_t a1)
{
  uint64_t v18 = a1;
  uint64_t v17 = a1;
  dispatch_block_t v16 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    os_log_type_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_type_t v6 = inited;
  }
  dispatch_block_t v16 = v6;
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    log = v16;
    os_log_type_t type = v15;
    __os_log_helper_16_0_0(v14);
    _os_log_impl(&dword_1BA438000, log, type, "Connection interrupted!", v14, 2u);
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 49))
  {
    global_queue = dispatch_get_global_queue(25, 0);
    uint64_t block = MEMORY[0x1E4F143A8];
    int v9 = -1073741824;
    int v10 = 0;
    SEL v11 = __38__BrightnessSystemClientInternal_init__block_invoke_67;
    v12 = &unk_1E6218FE0;
    uint64_t v13 = *(void *)(a1 + 32);
    dispatch_async(global_queue, &block);
  }
  else
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    [*(id *)(*(void *)(a1 + 32) + 16) reconnect];
    if (*(void *)(*(void *)(a1 + 32) + 32)) {
      [*(id *)(*(void *)(a1 + 32) + 16) registerNotificationForProperties:*(void *)(*(void *)(a1 + 32) + 32)];
    }
    objc_sync_exit(obj);
  }
}

uint64_t __38__BrightnessSystemClientInternal_init__block_invoke_67(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(*(void *)(a1 + 32) + 16) reconnect];
  if (*(void *)(*(void *)(a1 + 32) + 32)) {
    [*(id *)(*(void *)(a1 + 32) + 16) registerNotificationForProperties:*(void *)(*(void *)(a1 + 32) + 32)];
  }
  return objc_sync_exit(obj);
}

void __38__BrightnessSystemClientInternal_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    uint64_t v3 = inited;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v5, a2);
    _os_log_error_impl(&dword_1BA438000, v3, OS_LOG_TYPE_ERROR, "_connection synchronousRemoteObjectProxyWithErrorHandler error: %{public}@", v5, 0xCu);
  }
}

void __38__BrightnessSystemClientInternal_init__block_invoke_70(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 40) lock];
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  [*(id *)(*(void *)(a1 + 32) + 40) signal];
  [*(id *)(*(void *)(a1 + 32) + 40) unlock];
  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    uint64_t v3 = inited;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v6, a2);
    _os_log_error_impl(&dword_1BA438000, v3, OS_LOG_TYPE_ERROR, "_connection remoteObjectProxyWithErrorHandler error: %{public}@", v6, 0xCu);
  }
}

- (BOOL)setSyncProperty:(id)a3 forKey:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = self;
  SEL v35 = a2;
  id v34 = a3;
  id v33 = a4;
  char v32 = 0;
  uint64_t v25 = 0;
  char v26 = &v25;
  int v27 = 1375731712;
  int v28 = 48;
  uint64_t v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  uint64_t v31 = 0;
  objc_sync_enter(self);
  if (v36->_remote)
  {
    id v23 = (id)[v33 copy];
    id v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v34, 0);
    if (v36->_useSynchronousRemote)
    {
      dispatch_block_t v21 = 0;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v13 = -1073741824;
      int v14 = 0;
      os_log_type_t v15 = __57__BrightnessSystemClientInternal_setSyncProperty_forKey___block_invoke;
      dispatch_block_t v16 = &unk_1E6219008;
      uint64_t v17 = v36;
      id v18 = v23;
      id v19 = v22;
      id v20 = &v25;
      dispatch_block_t v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &block);
      if (v21)
      {
        dispatch_sync((dispatch_queue_t)v36->_serialQueue, v21);
        _Block_release(v21);
      }
    }
    else
    {
      os_log_t oslog = 0;
      os_log_t oslog = (os_log_t)v36->_logHandle;
      os_log_type_t type = OS_LOG_TYPE_FAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
      {
        log = oslog;
        os_log_type_t v6 = type;
        __os_log_helper_16_0_0(v9);
        _os_log_fault_impl(&dword_1BA438000, log, v6, "non-sycnhronous remote unsupported for set sycn property", v9, 2u);
      }
    }

    int v24 = 0;
  }
  else
  {
    char v37 = v32 & 1;
    int v24 = 1;
  }
  objc_sync_exit(self);
  if (!v24)
  {
    if (v26[5] == *MEMORY[0x1E4F1D260])
    {

      v26[5] = 0;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v32 = [(id)v26[5] BOOLValue] & 1;
      }
      else
      {
        logHandle = v36->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_FAULT))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v38, v26[5]);
          _os_log_fault_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_FAULT, "unexpected result from setProperty (sync): %@", v38, 0xCu);
        }
      }
    }
    char v37 = v32 & 1;
    int v24 = 1;
  }
  _Block_object_dispose(&v25, 8);
  return v37 & 1;
}

uint64_t __57__BrightnessSystemClientInternal_setSyncProperty_forKey___block_invoke(void *a1)
{
  int v13 = a1;
  v12 = a1;
  os_log_t v2 = *(void **)(a1[4] + 16);
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __57__BrightnessSystemClientInternal_setSyncProperty_forKey___block_invoke_2;
  int v10 = &unk_1E62192D8;
  uint64_t v11 = a1[7];
  return objc_msgSend(v2, "clientSetSYNCPropertyWithKey:property:reply:", v3, v4);
}

uint64_t __57__BrightnessSystemClientInternal_setSyncProperty_forKey___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = [a3 code];
  if (!result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", 0), "copy");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

uint64_t __53__BrightnessSystemClientInternal_copyPropertyForKey___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  if (![a3 code])
  {
    int v7 = (const void *)[a2 objectAtIndex:0];
    if (v7) {
      CFTypeRef v4 = CFRetain(v7);
    }
    else {
      CFTypeRef v4 = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v4;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "lock", v4);
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  [*(id *)(*(void *)(a1 + 32) + 40) signal];
  return [*(id *)(*(void *)(a1 + 32) + 40) unlock];
}

- (void)addPropertiesForNotification:(id)a3
{
  v12 = self;
  SEL v11 = a2;
  id v10 = a3;
  if (a3)
  {
    id obj = v12;
    objc_sync_enter(v12);
    uint64_t v4 = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    int v7 = __63__BrightnessSystemClientInternal_addPropertiesForNotification___block_invoke;
    int v8 = &unk_1E62191C8;
    int v9 = v12;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:");
    [v12->_remote registerNotificationForProperties:v12->_clientProperties];
    objc_sync_exit(obj);
  }
}

uint64_t __63__BrightnessSystemClientInternal_addPropertiesForNotification___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addKeyToClientProperties:a2];
  }
  return result;
}

- (void)removePropertiesFromNotification:(id)a3
{
  v12 = self;
  SEL v11 = a2;
  id v10 = a3;
  if (a3)
  {
    id obj = v12;
    objc_sync_enter(v12);
    uint64_t v4 = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    int v7 = __67__BrightnessSystemClientInternal_removePropertiesFromNotification___block_invoke;
    int v8 = &unk_1E62191C8;
    int v9 = v12;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:");
    [v12->_remote registerNotificationForProperties:v12->_clientProperties];
    objc_sync_exit(obj);
  }
}

uint64_t __67__BrightnessSystemClientInternal_removePropertiesFromNotification___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) removeKeyFromClientProperties:a2];
  }
  return result;
}

- (void)addPropertyForNotification:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    [(BrightnessSystemClientInternal *)self addKeyToClientProperties:a3];
    [self->_remote registerNotificationForProperties:self->_clientProperties];
    objc_sync_exit(self);
  }
}

- (void)removePropertyFromNotification:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    [(BrightnessSystemClientInternal *)self removeKeyFromClientProperties:a3];
    [self->_remote registerNotificationForProperties:self->_clientProperties];
    objc_sync_exit(self);
  }
}

- (void)addKeyToClientProperties:(id)a3
{
  if (!self->_clientProperties) {
    self->_clientProperties = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  if (([(NSMutableArray *)self->_clientProperties containsObject:a3] & 1) == 0) {
    [(NSMutableArray *)self->_clientProperties addObject:a3];
  }
  objc_sync_exit(self);
}

- (void)removeKeyFromClientProperties:(id)a3
{
  if ([(NSMutableArray *)self->_clientProperties containsObject:a3]) {
    [(NSMutableArray *)self->_clientProperties removeObject:a3];
  }
  objc_sync_exit(self);
}

@end