@interface BKHIDEventProcessorRegistry
+ (id)sharedInstance;
- (BKHIDEventProcessorRegistry)init;
- (id)eventProcessorOfClass:(Class)a3;
- (void)addEventProcessor:(id)a3;
@end

@implementation BKHIDEventProcessorRegistry

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__BKHIDEventProcessorRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_shared;

  return v2;
}

- (id)eventProcessorOfClass:(Class)a3
{
  v4 = NSStringFromClass(a3);
  v5 = [(NSMutableDictionary *)self->_eventProcessorsByClassName objectForKeyedSubscript:v4];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)addEventProcessor:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"eventProcessor"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(a2);
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      v19 = v10;
      __int16 v20 = 2114;
      v21 = v12;
      __int16 v22 = 2048;
      v23 = self;
      __int16 v24 = 2114;
      v25 = @"BKHIDEventProcessorRegistry.m";
      __int16 v26 = 1024;
      int v27 = 36;
      __int16 v28 = 2114;
      v29 = v9;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFE00CA8);
  }
  id v17 = v5;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [(NSMutableDictionary *)self->_eventProcessorsByClassName objectForKeyedSubscript:v7];

  if (v8)
  {
    v13 = [NSString stringWithFormat:@"Cannot replace an existing event processor"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(a2);
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138544642;
      v19 = v14;
      __int16 v20 = 2114;
      v21 = v16;
      __int16 v22 = 2048;
      v23 = self;
      __int16 v24 = 2114;
      v25 = @"BKHIDEventProcessorRegistry.m";
      __int16 v26 = 1024;
      int v27 = 39;
      __int16 v28 = 2114;
      v29 = v13;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFE00D94);
  }
  [(NSMutableDictionary *)self->_eventProcessorsByClassName setObject:v17 forKeyedSubscript:v7];
}

- (BKHIDEventProcessorRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKHIDEventProcessorRegistry;
  v2 = [(BKHIDEventProcessorRegistry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    eventProcessorsByClassName = v2->_eventProcessorsByClassName;
    v2->_eventProcessorsByClassName = (NSMutableDictionary *)v3;
  }
  return v2;
}

uint64_t __45__BKHIDEventProcessorRegistry_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_shared = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

@end