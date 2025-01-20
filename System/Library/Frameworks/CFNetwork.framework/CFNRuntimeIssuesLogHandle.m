@interface CFNRuntimeIssuesLogHandle
@end

@implementation CFNRuntimeIssuesLogHandle

os_log_t ____CFNRuntimeIssuesLogHandle_block_invoke()
{
  os_log_t result = os_log_create("com.apple.runtime-issues", "CFNetwork");
  __CFNRuntimeIssuesLogHandle::logger = (uint64_t)result;
  return result;
}

@end