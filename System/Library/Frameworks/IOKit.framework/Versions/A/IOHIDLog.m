@interface IOHIDLog
@end

@implementation IOHIDLog

os_log_t ___IOHIDLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.iohid", "default");
  _IOHIDLog_log = (uint64_t)result;
  return result;
}

@end