@interface SCHelperExecCopyBacktrace
@end

@implementation SCHelperExecCopyBacktrace

char *___SCHelperExecCopyBacktrace_block_invoke()
{
  result = getenv("ENABLE_SCHELPER_BACKTRACES");
  if (result) {
    _SCHelperExecCopyBacktrace_loggingEnabled = 1;
  }
  return result;
}

@end