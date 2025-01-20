@interface BuddyMigrationBaseDisconnectController
- (BuddyMigrationBaseDisconnectController)initWithConnectionType:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation BuddyMigrationBaseDisconnectController

- (BuddyMigrationBaseDisconnectController)initWithConnectionType:(int64_t)a3
{
  id location = self;
  SEL v14 = a2;
  int64_t v13 = a3;
  v3 = +[NSBundle mainBundle];
  id v12 = [(NSBundle *)v3 localizedStringForKey:@"MIGRATION_DISCONNECT_TITLE_WIRELESS" value:&stru_1002B4E18 table:@"Migration"];

  if (v13 == 1)
  {
    v4 = +[NSBundle mainBundle];
    v5 = [(NSBundle *)v4 localizedStringForKey:@"MIGRATION_DISCONNECT_TITLE_WIRED" value:&stru_1002B4E18 table:@"Migration"];
    id v6 = v12;
    id v12 = v5;
  }
  id v7 = location;
  v8 = +[UIImage imageNamed:@"Alert Icon"];
  id location = 0;
  v11.receiver = v7;
  v11.super_class = (Class)BuddyMigrationBaseDisconnectController;
  id location = [(BuddyMigrationBaseDisconnectController *)&v11 initWithTitle:v12 detailText:0 icon:v8];
  objc_storeStrong(&location, location);

  v9 = (BuddyMigrationBaseDisconnectController *)location;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
  return v9;
}

- (void)viewDidLoad
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMigrationBaseDisconnectController;
  [(BuddyMigrationBaseDisconnectController *)&v6 viewDidLoad];
  id v2 = [(BuddyMigrationBaseDisconnectController *)v8 headerView];
  [v2 setIconInheritsTint:1];

  v3 = +[UIColor redColor];
  id v4 = [(BuddyMigrationBaseDisconnectController *)v8 headerView];
  [v4 setTintColor:v3];

  id v5 = [(BuddyMigrationBaseDisconnectController *)v8 navigationItem];
  [v5 setHidesBackButton:1];
}

@end