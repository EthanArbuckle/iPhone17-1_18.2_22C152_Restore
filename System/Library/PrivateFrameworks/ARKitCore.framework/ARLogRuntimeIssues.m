@interface ARLogRuntimeIssues
@end

@implementation ARLogRuntimeIssues

void ___ARLogRuntimeIssues_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "RuntimeIssues");
  v1 = (void *)_ARLogRuntimeIssues_logObj;
  _ARLogRuntimeIssues_logObj = (uint64_t)v0;
}

void ___ARLogRuntimeIssues_block_invoke_0()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "RuntimeIssues");
  v1 = (void *)_ARLogRuntimeIssues_logObj_0;
  _ARLogRuntimeIssues_logObj_0 = (uint64_t)v0;
}

@end