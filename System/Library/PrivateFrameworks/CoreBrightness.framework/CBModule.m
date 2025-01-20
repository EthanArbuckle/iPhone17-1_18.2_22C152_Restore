@interface CBModule
- (CBModule)initWithQueue:(id)a3;
- (void)dealloc;
- (void)registerNotificationBlock:(id)a3;
- (void)sendNotificationForKey:(id)a3 withValue:(id)a4;
- (void)unregisterNotificationBlock;
@end

@implementation CBModule

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->_notificationBlock) {
    (*((void (**)(void))self->_notificationBlock + 2))();
  }
}

- (CBModule)initWithQueue:(id)a3
{
  v7 = self;
  SEL v6 = a2;
  id v5 = a3;
  if (!a3) {
    return 0;
  }
  v4.receiver = v7;
  v4.super_class = (Class)CBModule;
  v7 = [(CBModule *)&v4 init];
  if (v7)
  {
    *((void *)v7 + 3) = v5;
    dispatch_retain(*((dispatch_object_t *)v7 + 3));
  }
  return (CBModule *)v7;
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }
  if (v4->_queue)
  {
    dispatch_release((dispatch_object_t)v4->_queue);
    v4->_queue = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBModule;
  [(CBModule *)&v2 dealloc];
}

- (void)registerNotificationBlock:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(CBModule *)self unregisterNotificationBlock];
  if (a3) {
    self->_notificationBlock = _Block_copy(a3);
  }
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v7, (uint64_t)self->_notificationBlock);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "notificationBlock = %p", v7, 0xCu);
  }
}

- (void)unregisterNotificationBlock
{
  v10 = self;
  SEL v9 = a2;
  if (self->_notificationBlock)
  {
    uint64_t v8 = 0;
    if (v10->_logHandle)
    {
      logHandle = v10->_logHandle;
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
    uint64_t v8 = logHandle;
    char v7 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v8;
      os_log_type_t type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_debug_impl(&dword_1BA438000, log, type, (const char *)&unk_1BA61B929, v6, 2u);
    }
    _Block_release(v10->_notificationBlock);
    v10->_notificationBlock = 0;
  }
}

@end