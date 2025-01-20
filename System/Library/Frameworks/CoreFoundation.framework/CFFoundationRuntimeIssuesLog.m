@interface CFFoundationRuntimeIssuesLog
@end

@implementation CFFoundationRuntimeIssuesLog

os_log_t ___CFFoundationRuntimeIssuesLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.runtime-issues", "Foundation");
  _CFFoundationRuntimeIssuesLog_logger = (uint64_t)result;
  return result;
}

@end