@interface MXDebugPlatform
+ (id)sharedInstance;
- (MXDebugPlatform)init;
- (NSMutableDictionary)sysdiagnoseBlockRegistry;
- (OS_dispatch_queue)sysdiagnoseBlockQueue;
- (OS_os_log)logger;
- (void)dealloc;
- (void)executeSysdiagnoseBlocks;
- (void)installSysdiagnoseBlock:(id)a3 blockToRun:(id)a4;
- (void)simulateCrash:(const char *)a3;
@end

@implementation MXDebugPlatform

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1) {
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_58);
  }
  return (id)sharedInstance_sSharedInstance_7;
}

MXDebugPlatform *__33__MXDebugPlatform_sharedInstance__block_invoke()
{
  result = objc_alloc_init(MXDebugPlatform);
  sharedInstance_sSharedInstance_7 = (uint64_t)result;
  return result;
}

- (MXDebugPlatform)init
{
  v6.receiver = self;
  v6.super_class = (Class)MXDebugPlatform;
  v2 = [(MXDebugPlatform *)&v6 init];
  if (v2)
  {
    CFDictionaryValueCallBacks v5 = *(CFDictionaryValueCallBacks *)byte_1EE5E6460;
    v2->_logger = (OS_os_log *)MXGetSessionLog();
    v2->_sysdiagnoseBlockRegistry = (NSMutableDictionary *)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], &v5);
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_sysdiagnoseBlockQueue = (OS_dispatch_queue *)dispatch_queue_create("MXSysdiagnoseBlockRegistryQueue", v3);
    os_state_add_handler();
  }
  return v2;
}

uint64_t __23__MXDebugPlatform_init__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) == 3) {
    [+[MXDebugPlatform sharedInstance] executeSysdiagnoseBlocks];
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_sysdiagnoseBlockQueue);
  self->_sysdiagnoseBlockQueue = 0;

  self->_sysdiagnoseBlockRegistry = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXDebugPlatform;
  [(MXDebugPlatform *)&v3 dealloc];
}

- (void)executeSysdiagnoseBlocks
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v3 = [(MXDebugPlatform *)self sysdiagnoseBlockRegistry];
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(NSMutableDictionary *)[(MXDebugPlatform *)self sysdiagnoseBlockRegistry] objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v8)
        {
          (*(void (**)(void))(v8 + 16))();
        }
        else
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)installSysdiagnoseBlock:(id)a3 blockToRun:(id)a4
{
  v7 = [(MXDebugPlatform *)self sysdiagnoseBlockQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__MXDebugPlatform_installSysdiagnoseBlock_blockToRun___block_invoke;
  v8[3] = &unk_1E57CAE48;
  v8[5] = a3;
  v8[6] = a4;
  v8[4] = self;
  MXDispatchSync((uint64_t)"-[MXDebugPlatform installSysdiagnoseBlock:blockToRun:]", (uint64_t)"MXDebugPlatform.m", 200, 0, 0, v7, (uint64_t)v8);
}

uint64_t __54__MXDebugPlatform_installSysdiagnoseBlock_blockToRun___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  objc_super v3 = (void *)[*(id *)(a1 + 32) sysdiagnoseBlockRegistry];
  if (v2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 setObject:v4 forKey:v5];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 removeObjectForKey:v7];
  }
}

- (void)simulateCrash:(const char *)a3
{
  uint64_t v4 = [(MXDebugPlatform *)self logger];
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_FAULT)) {
    -[MXDebugPlatform simulateCrash:]((uint64_t)a3, v4);
  }
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)sysdiagnoseBlockQueue
{
  return self->_sysdiagnoseBlockQueue;
}

- (NSMutableDictionary)sysdiagnoseBlockRegistry
{
  return self->_sysdiagnoseBlockRegistry;
}

- (void)simulateCrash:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_194CDF000, a2, OS_LOG_TYPE_FAULT, "%s (This is not a crash)", (uint8_t *)&v2, 0xCu);
}

@end