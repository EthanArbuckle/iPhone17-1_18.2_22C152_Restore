@interface BuddyMigrationSourceFinished
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)shouldAllowStartOver;
- (BuddyMigrationSourceFinished)init;
- (BuddyMiscState)miscState;
- (NSString)internalStatistics;
- (void)continueTapped:(id)a3;
- (void)setInternalStatistics:(id)a3;
- (void)setMiscState:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyMigrationSourceFinished

- (BuddyMigrationSourceFinished)init
{
  SEL v9 = a2;
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"MIGRATION_SOURCE_TRANSFER_COMPLETE_TITLE" value:&stru_1002B4E18 table:@"Migration"];
  v5 = +[UIImage imageNamed:@"Checkmark"];
  id location = 0;
  v8.receiver = self;
  v8.super_class = (Class)BuddyMigrationSourceFinished;
  id location = [(BuddyMigrationSourceFinished *)&v8 initWithTitle:v4 detailText:&stru_1002B4E18 icon:v5];
  objc_storeStrong(&location, location);

  v6 = (BuddyMigrationSourceFinished *)location;
  objc_storeStrong(&location, 0);
  return v6;
}

- (void)viewDidLoad
{
  v19 = self;
  SEL v18 = a2;
  v17.receiver = self;
  v17.super_class = (Class)BuddyMigrationSourceFinished;
  [(BuddyMigrationSourceFinished *)&v17 viewDidLoad];
  id v2 = [(BuddyMigrationSourceFinished *)v19 headerView];
  [v2 setIconInheritsTint:1];

  id v3 = [(BuddyMigrationSourceFinished *)v19 navigationItem];
  [v3 setHidesBackButton:1];

  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MIGRATION_SOURCE_TRANSFER_COMPLETE_DETAIL"];
  id location = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"Migration"];

  char v14 = 0;
  BOOL v6 = 0;
  if (os_variant_has_internal_ui())
  {
    v15 = [(BuddyMigrationSourceFinished *)v19 internalStatistics];
    char v14 = 1;
    BOOL v6 = v15 != 0;
  }
  if (v14) {

  }
  if (v6)
  {
    v7 = [(BuddyMigrationSourceFinished *)v19 internalStatistics];
    objc_super v8 = +[NSString stringWithFormat:@"%@\n\n%@", location, v7];
    id v9 = location;
    id location = v8;
  }
  id v10 = [(BuddyMigrationSourceFinished *)v19 headerView];
  [v10 setDetailText:location];

  v11 = v19;
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [(NSBundle *)v12 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Migration"];
  [(BuddyWelcomeController *)v11 addBoldButton:v13 action:"continueTapped:"];

  objc_storeStrong(&location, 0);
}

- (void)continueTapped:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyMigrationSourceFinished *)v7 miscState];
  v4 = [(BuddyMiscState *)v3 migrationLockscreenController];
  [(BuddyMigrationLockscreenController *)v4 deactivate];

  id v5 = [(BuddyWelcomeController *)v7 delegate];
  [(BFFFlowItemDelegate *)v5 flowItemDone:v7];

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 0;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (NSString)internalStatistics
{
  return self->_internalStatistics;
}

- (void)setInternalStatistics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end