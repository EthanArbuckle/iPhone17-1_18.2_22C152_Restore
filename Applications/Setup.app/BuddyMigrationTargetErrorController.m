@interface BuddyMigrationTargetErrorController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)allowInteraction;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)forceErase;
- (BOOL)shouldAllowStartOver;
- (BYAnalyticsManager)analyticsManager;
- (BuddyMigrationTargetErrorController)initWithError:(id)a3;
- (BuddyMiscState)miscState;
- (ProximitySetupController)proximitySetupController;
- (id)initForInsufficientSpace;
- (void)loadView;
- (void)resetTapped:(id)a3;
- (void)setAllowInteraction:(BOOL)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setForceErase:(BOOL)a3;
- (void)setMiscState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)startOverTapped:(id)a3;
@end

@implementation BuddyMigrationTargetErrorController

- (BuddyMigrationTargetErrorController)initWithError:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v8;
  id v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyMigrationTargetErrorController;
  id v8 = [(BuddyMigrationBaseErrorController *)&v6 initWithError:location[0]];
  objc_storeStrong(&v8, v8);
  if (v8) {
    *((unsigned char *)v8 + 25) = 1;
  }
  v4 = (BuddyMigrationTargetErrorController *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (id)initForInsufficientSpace
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMigrationTargetErrorController;
  id location = [(BuddyMigrationBaseErrorController *)&v4 initForInsufficientSpace];
  objc_storeStrong(&location, location);
  if (location) {
    *((unsigned char *)location + 25) = 1;
  }
  id v2 = location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)loadView
{
  v14 = self;
  SEL v13 = a2;
  v12.receiver = self;
  v12.super_class = (Class)BuddyMigrationTargetErrorController;
  [(BuddyMigrationTargetErrorController *)&v12 loadView];
  id v2 = [(BuddyMigrationTargetErrorController *)v14 headerView];
  id v3 = [(BuddyMigrationBaseErrorController *)v14 error];
  id v4 = +[BuddyMigrationError titleForError:v3];
  [v2 setTitle:v4];

  id v5 = [(BuddyMigrationTargetErrorController *)v14 headerView];
  objc_super v6 = [(BuddyMigrationBaseErrorController *)v14 error];
  id v7 = +[BuddyMigrationError detailTextForErrorOnTarget:v6 requiresErase:[(BuddyMigrationTargetErrorController *)v14 forceErase]];
  [v5 setDetailText:v7];

  if ([(BuddyMigrationTargetErrorController *)v14 allowInteraction])
  {
    if ([(BuddyMigrationTargetErrorController *)v14 forceErase])
    {
      id v8 = v14;
      v9 = +[NSBundle mainBundle];
      v10 = [(NSBundle *)v9 localizedStringForKey:@"RESET" value:&stru_1002B4E18 table:@"Localizable"];
      [(BuddyWelcomeController *)v8 addBoldButton:v10 action:"resetTapped:"];
    }
    else
    {
      v11 = v14;
      v9 = +[NSBundle mainBundle];
      v10 = [(NSBundle *)v9 localizedStringForKey:@"MIGRATION_ERROR_SET_UP_MANUALLY" value:&stru_1002B4E18 table:@"Migration"];
      [(BuddyWelcomeController *)v11 addBoldButton:v10 action:"startOverTapped:"];
    }
  }
}

- (void)resetTapped:(id)a3
{
  objc_super v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyMigrationTargetErrorController *)v12 miscState];
  id v4 = [(BuddyMiscState *)v3 migrationLockscreenController];
  [(BuddyMigrationLockscreenController *)v4 deactivate];

  id v5 = [(BuddyMigrationTargetErrorController *)v12 view];
  id v6 = [v5 window];
  id v7 = [(BuddyMigrationTargetErrorController *)v12 navigationController];
  id v8 = [(BuddyMigrationTargetErrorController *)v12 proximitySetupController];
  v9 = [(BuddyMigrationTargetErrorController *)v12 analyticsManager];
  v10 = +[BuddyEraseAlertController alertControllerWithWindow:v6 navigationController:v7 proximitySetupController:v8 analyticsManager:v9];

  [(BuddyMigrationTargetErrorController *)v12 presentViewController:v10 animated:1 completion:0];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)startOverTapped:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyMigrationTargetErrorController *)v8 miscState];
  id v4 = [(BuddyMiscState *)v3 migrationLockscreenController];
  [(BuddyMigrationLockscreenController *)v4 deactivate];

  id v5 = [(BuddyWelcomeController *)v8 delegate];
  id v6 = [(BFFFlowItemDelegate *)v5 popToBuddyControllerWithClass:objc_opt_class() animated:1];

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
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

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BOOL)forceErase
{
  return self->_forceErase;
}

- (void)setForceErase:(BOOL)a3
{
  self->_forceErase = a3;
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