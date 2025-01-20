@interface CSDefaultLog
@end

@implementation CSDefaultLog

os_log_t ___CSDefaultLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.coreservices", "default");
  _CSDefaultLog_log = (uint64_t)result;
  return result;
}

@end