@interface NSXPCLongMessageLog
@end

@implementation NSXPCLongMessageLog

os_log_t ___NSXPCLongMessageLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.Foundation", "xpc.exceptions");
  qword_1EB1ED5E0 = (uint64_t)result;
  return result;
}

@end