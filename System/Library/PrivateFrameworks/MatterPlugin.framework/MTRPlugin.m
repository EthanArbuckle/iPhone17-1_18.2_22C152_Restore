@interface MTRPlugin
+ (id)sharedInstance;
- (BOOL)start;
- (BOOL)stop;
- (MTRPlugin)init;
@end

@implementation MTRPlugin

+ (id)sharedInstance
{
  if (sharedInstance_creation_0 != -1) {
    dispatch_once(&sharedInstance_creation_0, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sInstance_0;
  return v2;
}

uint64_t __27__MTRPlugin_sharedInstance__block_invoke()
{
  sharedInstance_sInstance_0 = objc_alloc_init(MTRPlugin);
  return MEMORY[0x270F9A758]();
}

- (MTRPlugin)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRPlugin;
  v2 = [(MTRPlugin *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (BOOL)start
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Starting MTRPlugin: %p", (uint8_t *)&v4, 0xCu);
  }
  return 1;
}

- (BOOL)stop
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "*** IGNORING Stopping MTRPlugin: %p", (uint8_t *)&v4, 0xCu);
  }
  return 1;
}

@end