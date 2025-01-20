@interface CFNPerformanceDiagnosticRuntimeIssuesLogHandle
@end

@implementation CFNPerformanceDiagnosticRuntimeIssuesLogHandle

os_log_t ____CFNPerformanceDiagnosticRuntimeIssuesLogHandle_block_invoke()
{
  os_log_t result = os_log_create("com.apple.runtime-issues", "CFNetwork Performance Diagnostic");
  __CFNPerformanceDiagnosticRuntimeIssuesLogHandle::logger = (uint64_t)result;
  return result;
}

@end