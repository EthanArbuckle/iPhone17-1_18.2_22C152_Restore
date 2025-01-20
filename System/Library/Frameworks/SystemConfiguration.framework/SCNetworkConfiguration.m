@interface SCNetworkConfiguration
@end

@implementation SCNetworkConfiguration

void __avoid_SCNetworkConfiguration_deadlock_block_invoke()
{
  __wait_for_PreferencesMonitor();
}

@end