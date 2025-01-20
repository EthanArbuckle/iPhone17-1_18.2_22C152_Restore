@interface CBFilter
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (CBFilter)init;
- (id)copyPropertyForKey:(id)a3;
- (id)filterEvent:(id)a3;
- (id)filterEvents:(id)a3;
- (void)dealloc;
- (void)registerNotificationBlock:(id)a3;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)sendNotificationForKey:(id)a3 andValue:(id)a4;
- (void)unregisterNotificationBlock;
- (void)unscheduleWithDispatchQueue:(id)a3;
@end

@implementation CBFilter

- (id)copyPropertyForKey:(id)a3
{
  return 0;
}

- (CBFilter)init
{
  v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)CBFilter;
  v13 = [(CBFilter *)&v11 init];
  if (!v13) {
    return v13;
  }
  dispatch_queue_t v2 = dispatch_queue_create("CBFilter", 0);
  v13->_queue = (OS_dispatch_queue *)v2;
  if (v13->_queue) {
    return v13;
  }
  v10 = 0;
  if (v13->_logHandle)
  {
    logHandle = v13->_logHandle;
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
  v10 = logHandle;
  char v9 = 16;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    log = v10;
    os_log_type_t type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_error_impl(&dword_1BA438000, log, type, "failed to create dispatch queue", v8, 2u);
  }

  v13 = 0;
  return 0;
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  v13 = self;
  SEL v12 = a2;
  id v11 = a3;
  if (self->_queue)
  {
    [(CBFilter *)v13 unscheduleWithDispatchQueue:v11];
    queue = v13->_queue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    v7 = __38__CBFilter_scheduleWithDispatchQueue___block_invoke;
    v8 = &unk_1E62196A0;
    char v9 = v13;
    id v10 = v11;
    dispatch_sync(queue, &block);
  }
}

void __38__CBFilter_scheduleWithDispatchQueue___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24)) {
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  }
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 40);
  dispatch_retain(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
}

- (void)unscheduleWithDispatchQueue:(id)a3
{
  v13 = self;
  SEL v12 = a2;
  id v11 = a3;
  if (self->_queue)
  {
    queue = v13->_queue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    v7 = __40__CBFilter_unscheduleWithDispatchQueue___block_invoke;
    v8 = &unk_1E62196A0;
    char v9 = v13;
    id v10 = v11;
    dispatch_sync(queue, &block);
  }
}

void __40__CBFilter_unscheduleWithDispatchQueue___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    if (*(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 24))
    {
      dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
      *(void *)(*(void *)(a1 + 32) + 24) = 0;
    }
  }
}

- (void)registerNotificationBlock:(id)a3
{
  v13 = self;
  SEL v12 = a2;
  id v11 = a3;
  [(CBFilter *)self unregisterNotificationBlock];
  if (v13->_queue)
  {
    queue = v13->_queue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    v7 = __38__CBFilter_registerNotificationBlock___block_invoke;
    v8 = &unk_1E621A380;
    id v10 = v11;
    char v9 = v13;
    dispatch_sync(queue, &block);
  }
}

const void **__38__CBFilter_registerNotificationBlock___block_invoke(const void **result)
{
  v1 = result;
  if (result[5])
  {
    result = (const void **)_Block_copy(result[5]);
    *((void *)v1[4] + 4) = result;
  }
  return result;
}

- (void)unregisterNotificationBlock
{
  id v10 = self;
  SEL v9 = a2;
  if (self->_queue)
  {
    queue = v10->_queue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v4 = -1073741824;
    int v5 = 0;
    int v6 = __39__CBFilter_unregisterNotificationBlock__block_invoke;
    v7 = &unk_1E6218FE0;
    v8 = v10;
    dispatch_sync(queue, &block);
  }
}

void __39__CBFilter_unregisterNotificationBlock__block_invoke(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  v8 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    int v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    int v4 = inited;
  }
  v8 = v4;
  char v7 = 2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    log = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_debug_impl(&dword_1BA438000, log, type, (const char *)&unk_1BA61B929, v6, 2u);
  }
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    _Block_release(*(const void **)(*(void *)(a1 + 32) + 32));
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
}

- (void)dealloc
{
  int v4 = (dispatch_object_t *)self;
  SEL v3 = a2;
  if (self->_queue)
  {
    dispatch_release(v4[2]);
    v4[2] = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBFilter;
  [(CBFilter *)&v2 dealloc];
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23 = self;
  SEL v22 = a2;
  id v21 = a3;
  id v20 = a4;
  if (self->_notificationQueue && v23->_notificationBlock)
  {
    os_log_t v19 = 0;
    if (v23->_logHandle)
    {
      logHandle = v23->_logHandle;
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
    os_log_t v19 = logHandle;
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)v21);
      _os_log_debug_impl(&dword_1BA438000, v19, v18, "send notification for key = %@", v24, 0xCu);
    }
    v17 = 0;
    v17 = _Block_copy(v23->_notificationBlock);
    if (v17)
    {
      id v4 = v20;
      id v5 = v21;
      notificationQueue = v23->_notificationQueue;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v10 = -1073741824;
      int v11 = 0;
      SEL v12 = __44__CBFilter_sendNotificationForKey_andValue___block_invoke;
      v13 = &unk_1E6219A38;
      id v14 = v21;
      v16 = v17;
      id v15 = v20;
      dispatch_async(notificationQueue, &block);
    }
  }
}

void __44__CBFilter_sendNotificationForKey_andValue___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    _Block_release(*(const void **)(a1 + 48));
  }
}

- (id)filterEvent:(id)a3
{
  return a3;
}

- (id)filterEvents:(id)a3
{
  return a3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

@end