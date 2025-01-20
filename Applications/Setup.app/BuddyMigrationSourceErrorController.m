@interface BuddyMigrationSourceErrorController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)allowInteraction;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)shouldAllowStartOver;
- (BuddyMigrationSourceErrorController)initWithError:(id)a3;
- (BuddyMiscState)miscState;
- (id)initForInsufficientSpace;
- (void)continueTapped:(id)a3;
- (void)loadView;
- (void)setAllowInteraction:(BOOL)a3;
- (void)setMiscState:(id)a3;
@end

@implementation BuddyMigrationSourceErrorController

- (BuddyMigrationSourceErrorController)initWithError:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v8;
  id v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyMigrationSourceErrorController;
  id v8 = [(BuddyMigrationBaseErrorController *)&v6 initWithError:location[0]];
  objc_storeStrong(&v8, v8);
  if (v8) {
    *((unsigned char *)v8 + 24) = 1;
  }
  v4 = (BuddyMigrationSourceErrorController *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (id)initForInsufficientSpace
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMigrationSourceErrorController;
  id location = [(BuddyMigrationBaseErrorController *)&v4 initForInsufficientSpace];
  objc_storeStrong(&location, location);
  if (location) {
    *((unsigned char *)location + 24) = 1;
  }
  id v2 = location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)loadView
{
  v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)BuddyMigrationSourceErrorController;
  [(BuddyMigrationSourceErrorController *)&v11 loadView];
  id v2 = [(BuddyMigrationSourceErrorController *)v13 headerView];
  id v3 = [(BuddyMigrationBaseErrorController *)v13 error];
  id v4 = +[BuddyMigrationError titleForError:v3];
  [v2 setTitle:v4];

  id v5 = [(BuddyMigrationSourceErrorController *)v13 headerView];
  objc_super v6 = [(BuddyMigrationBaseErrorController *)v13 error];
  id v7 = +[BuddyMigrationError detailTextForErrorOnSource:v6];
  [v5 setDetailText:v7];

  if ([(BuddyMigrationSourceErrorController *)v13 allowInteraction])
  {
    id v8 = v13;
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [(NSBundle *)v9 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Migration"];
    [(BuddyWelcomeController *)v8 addBoldButton:v10 action:"continueTapped:"];
  }
}

- (void)continueTapped:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyMigrationSourceErrorController *)v7 miscState];
  id v4 = [(BuddyMiscState *)v3 migrationLockscreenController];
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

- (BOOL)controllerAllowsNavigatingBack
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

- (BOOL)allowInteraction
{
  return self->_allowInteraction;
}

- (void)setAllowInteraction:(BOOL)a3
{
  self->_allowInteraction = a3;
}

- (void).cxx_destruct
{
}

@end