@interface GSSDefaultLog
@end

@implementation GSSDefaultLog

void __GSSDefaultLog_block_invoke(id a1)
{
  GSSDefaultLog_sLog = (uint64_t)os_log_create("com.apple.GroupSessionService", "Security");

  _objc_release_x1();
}

@end