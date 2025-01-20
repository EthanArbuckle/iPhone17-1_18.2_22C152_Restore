@interface CGPerspectiveOSLog
@end

@implementation CGPerspectiveOSLog

os_log_t ____CGPerspectiveOSLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.re", "CGPerspectiveContext");
  __CGPerspectiveOSLog_log = (uint64_t)result;
  return result;
}

@end