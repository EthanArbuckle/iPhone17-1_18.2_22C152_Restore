@interface CFRuntimeIssuesLog
@end

@implementation CFRuntimeIssuesLog

os_log_t ___CFRuntimeIssuesLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.runtime-issues", "CoreFoundation");
  _CFRuntimeIssuesLog_logger = (uint64_t)result;
  return result;
}

@end