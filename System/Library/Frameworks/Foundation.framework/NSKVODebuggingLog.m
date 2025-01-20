@interface NSKVODebuggingLog
@end

@implementation NSKVODebuggingLog

os_log_t ___NSKVODebuggingLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.Foundation", "KVODebugging");
  qword_1EB1ED910 = (uint64_t)result;
  return result;
}

@end