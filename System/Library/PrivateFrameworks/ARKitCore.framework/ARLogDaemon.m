@interface ARLogDaemon
@end

@implementation ARLogDaemon

void ___ARLogDaemon_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "Daemon");
  v1 = (void *)_ARLogDaemon_logObj;
  _ARLogDaemon_logObj = (uint64_t)v0;
}

@end