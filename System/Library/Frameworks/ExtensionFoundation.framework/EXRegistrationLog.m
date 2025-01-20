@interface EXRegistrationLog
@end

@implementation EXRegistrationLog

uint64_t ___EXRegistrationLog_block_invoke()
{
  _EXRegistrationLog_log = (uint64_t)os_log_create("com.apple.extensionkit", "registration");

  return MEMORY[0x1F41817F8]();
}

@end