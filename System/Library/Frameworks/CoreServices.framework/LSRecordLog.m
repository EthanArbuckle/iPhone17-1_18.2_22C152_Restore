@interface LSRecordLog
@end

@implementation LSRecordLog

void ___LSRecordLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "record");
  v1 = (void *)_LSRecordLog_log;
  _LSRecordLog_log = (uint64_t)v0;
}

@end