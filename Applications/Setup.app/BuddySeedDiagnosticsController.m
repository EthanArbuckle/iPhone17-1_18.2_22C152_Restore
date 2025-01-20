@interface BuddySeedDiagnosticsController
- (BOOL)shouldAutoEnable;
- (BuddySeedDiagnosticsController)init;
- (void)setShouldAutoEnable:(BOOL)a3;
@end

@implementation BuddySeedDiagnosticsController

- (BuddySeedDiagnosticsController)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddySeedDiagnosticsController;
  id location = [(BuddyDiagnosticsController *)&v4 init];
  objc_storeStrong(&location, location);
  if (location) {
    [location setImposeSeedPolicy:1];
  }
  v2 = (BuddySeedDiagnosticsController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)setShouldAutoEnable:(BOOL)a3
{
}

- (BOOL)shouldAutoEnable
{
  return [(BuddyDiagnosticsController *)self isSeedBuild];
}

@end