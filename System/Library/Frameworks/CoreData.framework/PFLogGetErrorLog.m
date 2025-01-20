@interface PFLogGetErrorLog
@end

@implementation PFLogGetErrorLog

os_log_t ___PFLogGetErrorLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.coredata", "error");
  __pflogFaultLog = (uint64_t)result;
  return result;
}

@end