@interface EXSignpostLog
@end

@implementation EXSignpostLog

uint64_t ___EXSignpostLog_block_invoke()
{
  _EXSignpostLog_log = (uint64_t)os_log_create("com.apple.extensionkit", "signpost");

  return MEMORY[0x1F41817F8]();
}

@end