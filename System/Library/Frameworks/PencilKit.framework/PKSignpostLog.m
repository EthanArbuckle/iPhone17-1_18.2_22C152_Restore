@interface PKSignpostLog
@end

@implementation PKSignpostLog

void ___PKSignpostLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.pencilkit", "signposts");
  v1 = (void *)_PKSignpostLog____PKSignpostLog;
  _PKSignpostLog____PKSignpostLog = (uint64_t)v0;
}

@end