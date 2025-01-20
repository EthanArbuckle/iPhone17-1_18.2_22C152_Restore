@interface GCDaemonSettings
@end

@implementation GCDaemonSettings

void __29___GCDaemonSettings_instance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)instance_sharedInstance_1;
  instance_sharedInstance_1 = (uint64_t)v1;
}

@end