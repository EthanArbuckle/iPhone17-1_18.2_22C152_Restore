@interface BuddyMigrationLockscreenDisconnectController
- (BOOL)_canShowWhileLocked;
@end

@implementation BuddyMigrationLockscreenDisconnectController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end