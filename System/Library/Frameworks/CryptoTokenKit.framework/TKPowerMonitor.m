@interface TKPowerMonitor
+ (id)defaultMonitor;
- (BOOL)awaken;
- (TKPowerMonitor)init;
- (unsigned)kernelPort;
- (void)init;
- (void)setAwaken:(BOOL)a3;
- (void)setKernelPort:(unsigned int)a3;
@end

@implementation TKPowerMonitor

- (TKPowerMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)TKPowerMonitor;
  v2 = [(TKPowerMonitor *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_awaken = 1;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ctk.pmon", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = TK_LOG_token_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TKPowerMonitor init]();
    }
  }
  return v3;
}

+ (id)defaultMonitor
{
  if (defaultMonitor_onceToken != -1) {
    dispatch_once(&defaultMonitor_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)defaultMonitor_monitor;

  return v2;
}

uint64_t __32__TKPowerMonitor_defaultMonitor__block_invoke()
{
  defaultMonitor_monitor = objc_alloc_init(TKPowerMonitor);

  return MEMORY[0x1F41817F8]();
}

- (unsigned)kernelPort
{
  return self->_kernelPort;
}

- (void)setKernelPort:(unsigned int)a3
{
  self->_kernelPort = a3;
}

- (BOOL)awaken
{
  return self->_awaken;
}

- (void)setAwaken:(BOOL)a3
{
  self->_awaken = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "port for pm notifications registered", v2, v3, v4, v5, v6);
}

@end