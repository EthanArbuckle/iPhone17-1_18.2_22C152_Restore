@interface BuddyMigrationTargetLockscreenErrorController
- (BOOL)_canShowWhileLocked;
- (void)loadView;
@end

@implementation BuddyMigrationTargetLockscreenErrorController

- (void)loadView
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMigrationTargetLockscreenErrorController;
  [(BuddyMigrationTargetErrorController *)&v3 setAllowInteraction:0];
  v2.receiver = v5;
  v2.super_class = (Class)BuddyMigrationTargetLockscreenErrorController;
  [(BuddyMigrationTargetErrorController *)&v2 loadView];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end