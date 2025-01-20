@interface NSRuntimeIssuesLog
@end

@implementation NSRuntimeIssuesLog

os_log_t ___NSRuntimeIssuesLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.runtime-issues", "Foundation");
  qword_1EB1ED5D0 = (uint64_t)result;
  return result;
}

@end