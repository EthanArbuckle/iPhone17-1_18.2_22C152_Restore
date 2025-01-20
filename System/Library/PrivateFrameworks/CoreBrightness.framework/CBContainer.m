@interface CBContainer
- (void)dealloc;
- (void)registerNotificationBlock:(id)a3;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)unregisterNotificationBlock;
- (void)unscheduleWithDispatchQueue:(id)a3;
@end

@implementation CBContainer

- (void)scheduleWithDispatchQueue:(id)a3
{
  v13 = self;
  SEL v12 = a2;
  id v11 = a3;
  if (self->_queue)
  {
    [(CBContainer *)v13 unscheduleWithDispatchQueue:v11];
    queue = v13->_queue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    v7 = __41__CBContainer_scheduleWithDispatchQueue___block_invoke;
    v8 = &unk_1E62196A0;
    v9 = v13;
    id v10 = v11;
    dispatch_sync(queue, &block);
  }
}

void __41__CBContainer_scheduleWithDispatchQueue___block_invoke(uint64_t a1)
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
    v7 = __43__CBContainer_unscheduleWithDispatchQueue___block_invoke;
    v8 = &unk_1E62196A0;
    v9 = v13;
    id v10 = v11;
    dispatch_sync(queue, &block);
  }
}

void __43__CBContainer_unscheduleWithDispatchQueue___block_invoke(uint64_t a1)
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
  [(CBContainer *)self unregisterNotificationBlock];
  if (v13->_queue)
  {
    queue = v13->_queue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    v7 = __41__CBContainer_registerNotificationBlock___block_invoke;
    v8 = &unk_1E621A380;
    id v10 = v11;
    v9 = v13;
    dispatch_sync(queue, &block);
  }
}

void __41__CBContainer_registerNotificationBlock___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40)) {
    *(void *)(*(void *)(a1 + 32) + 32) = _Block_copy(*(const void **)(a1 + 40));
  }
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    v2 = inited;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v4, *(void *)(*(void *)(a1 + 32) + 32));
    _os_log_debug_impl(&dword_1BA438000, v2, OS_LOG_TYPE_DEBUG, "notificationBlock = %p", v4, 0xCu);
  }
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
    int v6 = __42__CBContainer_unregisterNotificationBlock__block_invoke;
    v7 = &unk_1E6218FE0;
    v8 = v10;
    dispatch_sync(queue, &block);
  }
}

void __42__CBContainer_unregisterNotificationBlock__block_invoke(uint64_t a1)
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
  int v4 = self;
  SEL v3 = a2;
  if (self->_queue)
  {
    dispatch_release((dispatch_object_t)v4->_queue);
    v4->_queue = 0;
  }
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBContainer;
  [(CBContainer *)&v2 dealloc];
}

@end