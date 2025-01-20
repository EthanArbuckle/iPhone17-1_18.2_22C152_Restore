@interface CFMethodSignatureROMLog
@end

@implementation CFMethodSignatureROMLog

os_log_t ___CFMethodSignatureROMLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.foundation", "MethodSignatureROM");
  _CFMethodSignatureROMLog_logger = (uint64_t)result;
  return result;
}

@end