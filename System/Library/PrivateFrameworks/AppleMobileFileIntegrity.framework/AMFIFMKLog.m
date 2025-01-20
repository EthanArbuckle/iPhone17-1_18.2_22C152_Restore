@interface AMFIFMKLog
+ (id)generic;
@end

@implementation AMFIFMKLog

+ (id)generic
{
  if (generic_sLogInit != -1) {
    dispatch_once(&generic_sLogInit, &__block_literal_global);
  }
  v2 = (void *)generic_sLog;
  return v2;
}

uint64_t __21__AMFIFMKLog_generic__block_invoke()
{
  generic_sLog = (uint64_t)os_log_create("com.apple.MobileFileIntegrity.framework", "default");
  return MEMORY[0x270F9A758]();
}

@end