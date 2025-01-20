@interface DELogging
+ (id)fwHandle;
@end

@implementation DELogging

+ (id)fwHandle
{
  if (fwHandle_onceToken != -1) {
    dispatch_once(&fwHandle_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)fwHandle_handle;
  return v2;
}

uint64_t __21__DELogging_fwHandle__block_invoke()
{
  fwHandle_handle = (uint64_t)os_log_create("com.apple.diagnosticextensions", "Framework");
  return MEMORY[0x1F41817F8]();
}

@end