@interface BuddyProximityExistingAppleIDController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BOOL)shouldAllowStartOver;
- (BYAnalyticsManager)analyticsManager;
- (BuddyProximityExistingAppleIDController)init;
- (ProximitySetupController)proximitySetupController;
- (void)_resetTapped:(id)a3;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyProximityExistingAppleIDController

- (BuddyProximityExistingAppleIDController)init
{
  SEL v10 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"PROXIMITY_EXISTING_APPLEID_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"PROXIMITY_EXISTING_APPLEID_DETAIL" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v9.receiver = self;
  v9.super_class = (Class)BuddyProximityExistingAppleIDController;
  id location = [(BuddyProximityExistingAppleIDController *)&v9 initWithTitle:v4 detailText:v6 symbolName:@"exclamationmark.triangle" contentLayout:2];
  objc_storeStrong(&location, location);

  v7 = (BuddyProximityExistingAppleIDController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  objc_super v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyProximityExistingAppleIDController;
  [(BuddyProximityExistingAppleIDController *)&v7 viewDidLoad];
  v2 = v9;
  v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ERASE_DEVICE"];
  v5 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v2 addBoldButton:v5 action:"_resetTapped:"];

  id v6 = [(BuddyProximityExistingAppleIDController *)v9 navigationItem];
  [v6 setHidesBackButton:1];
}

- (void)_resetTapped:(id)a3
{
  objc_super v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyProximityExistingAppleIDController *)v9 view];
  id v4 = [v3 window];
  id v5 = [(BuddyProximityExistingAppleIDController *)v9 navigationController];
  id v6 = [(BuddyProximityExistingAppleIDController *)v9 proximitySetupController];
  objc_super v7 = [(BuddyProximityExistingAppleIDController *)v9 analyticsManager];
  +[BuddyEraseAlertController eraseWithWindow:v4 navigationController:v5 proximitySetupController:v6 analyticsManager:v7];

  objc_storeStrong(location, 0);
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BOOL)controllerNeedsToRun
{
  v19 = self;
  SEL v18 = a2;
  v2 = [(BuddyProximityExistingAppleIDController *)self proximitySetupController];
  id v3 = [(ProximitySetupController *)v2 information];
  char v16 = 0;
  char v4 = 1;
  if (v3)
  {
    id v17 = [(BuddyProximityExistingAppleIDController *)v19 proximitySetupController];
    char v16 = 1;
    char v4 = [v17 hasConnection] ^ 1;
  }
  if (v16) {

  }
  if (v4)
  {
    char v20 = 0;
  }
  else
  {
    id v5 = +[ACAccountStore defaultStore];
    id v6 = [v5 aa_primaryAppleAccount];
    id location = [v6 username];

    char v13 = 0;
    char v11 = 0;
    char v9 = 0;
    char v7 = 0;
    if (location)
    {
      v14 = [(BuddyProximityExistingAppleIDController *)v19 proximitySetupController];
      char v13 = 1;
      v12 = [(ProximitySetupController *)v14 information];
      char v11 = 1;
      id v10 = [(SASProximityInformation *)v12 appleID];
      char v9 = 1;
      char v7 = [v10 isEqualToString:location] ^ 1;
    }
    char v20 = v7 & 1;
    if (v9) {

    }
    if (v11) {
    if (v13)
    }

    objc_storeStrong(&location, 0);
  }
  return v20 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  char v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = dispatch_get_global_queue(25, 0);
  char v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = sub_100190FD4;
  SEL v8 = &unk_1002B0D20;
  char v9 = v11;
  dispatch_async(v3, &v4);

  if (location[0]) {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
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

- (void).cxx_destruct
{
}

@end