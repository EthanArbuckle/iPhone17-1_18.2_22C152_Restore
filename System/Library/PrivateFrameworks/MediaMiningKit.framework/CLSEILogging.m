@interface CLSEILogging
+ (id)sharedLogging;
- (OS_os_log)loggingConnection;
@end

@implementation CLSEILogging

- (void).cxx_destruct
{
}

- (OS_os_log)loggingConnection
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

+ (id)sharedLogging
{
  if (sharedLogging_onceToken_2067 != -1) {
    dispatch_once(&sharedLogging_onceToken_2067, &__block_literal_global_2068);
  }
  v2 = (void *)sharedLogging_sharedLogging_2069;
  return v2;
}

uint64_t __29__CLSEILogging_sharedLogging__block_invoke()
{
  v0 = objc_alloc_init(CLSEILogging);
  v1 = (void *)sharedLogging_sharedLogging_2069;
  sharedLogging_sharedLogging_2069 = (uint64_t)v0;

  *(void *)(sharedLogging_sharedLogging_2069 + 8) = os_log_create("com.apple.photos.mediamining.eventsingest", "default");
  return MEMORY[0x1F41817F8]();
}

@end