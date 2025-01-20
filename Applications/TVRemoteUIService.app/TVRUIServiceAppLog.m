@interface TVRUIServiceAppLog
@end

@implementation TVRUIServiceAppLog

void ___TVRUIServiceAppLog_block_invoke(id a1)
{
  _TVRUIServiceAppLog_log = (uint64_t)os_log_create("com.apple.TVRemoteUIService", "App");

  _objc_release_x1();
}

@end