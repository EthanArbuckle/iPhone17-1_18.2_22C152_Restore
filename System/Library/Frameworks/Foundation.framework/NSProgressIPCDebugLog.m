@interface NSProgressIPCDebugLog
@end

@implementation NSProgressIPCDebugLog

os_log_t ___NSProgressIPCDebugLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.foundation.progress", "ipc");
  _MergedGlobals_25_1 = (uint64_t)result;
  return result;
}

@end