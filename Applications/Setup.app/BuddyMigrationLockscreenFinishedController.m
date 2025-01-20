@interface BuddyMigrationLockscreenFinishedController
- (BOOL)_canShowWhileLocked;
- (BuddyMigrationLockscreenFinishedController)init;
- (void)viewDidLoad;
@end

@implementation BuddyMigrationLockscreenFinishedController

- (BuddyMigrationLockscreenFinishedController)init
{
  id location = self;
  v11[1] = (id)a2;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v11[0] = [(NSBundle *)v2 localizedStringForKey:@"MIGRATION_SOURCE_TRANSFER_COMPLETE_TITLE" value:&stru_1002B4E18 table:@"Migration"];

  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MIGRATION_SOURCE_TRANSFER_COMPLETE_DETAIL"];
  id v10 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Migration"];

  id v5 = location;
  v6 = +[UIImage imageNamed:@"Checkmark"];
  id location = 0;
  v9.receiver = v5;
  v9.super_class = (Class)BuddyMigrationLockscreenFinishedController;
  id location = [(BuddyMigrationLockscreenFinishedController *)&v9 initWithTitle:v11[0] detailText:v10 icon:v6];
  objc_storeStrong(&location, location);

  v7 = (BuddyMigrationLockscreenFinishedController *)location;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMigrationLockscreenFinishedController;
  [(BuddyMigrationLockscreenFinishedController *)&v4 viewDidLoad];
  id v2 = [(BuddyMigrationLockscreenFinishedController *)v6 headerView];
  [v2 setIconInheritsTint:1];

  id v3 = [(BuddyMigrationLockscreenFinishedController *)v6 navigationItem];
  [v3 setHidesBackButton:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end