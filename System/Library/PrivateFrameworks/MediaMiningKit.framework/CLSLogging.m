@interface CLSLogging
+ (id)sharedLogging;
- (OS_os_log)loggingConnection;
@end

@implementation CLSLogging

- (void).cxx_destruct
{
}

- (OS_os_log)loggingConnection
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

+ (id)sharedLogging
{
  if (sharedLogging_onceToken != -1) {
    dispatch_once(&sharedLogging_onceToken, &__block_literal_global_1415);
  }
  v2 = (void *)sharedLogging_sharedLogging;
  return v2;
}

uint64_t __27__CLSLogging_sharedLogging__block_invoke()
{
  v0 = objc_alloc_init(CLSLogging);
  v1 = (void *)sharedLogging_sharedLogging;
  sharedLogging_sharedLogging = (uint64_t)v0;

  *(void *)(sharedLogging_sharedLogging + 8) = os_log_create("com.apple.mediaminingkit", "default");
  return MEMORY[0x1F41817F8]();
}

@end