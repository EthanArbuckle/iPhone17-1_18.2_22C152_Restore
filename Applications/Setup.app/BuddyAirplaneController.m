@interface BuddyAirplaneController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerAllowsNavigatingBack;
- (BuddyAirplaneController)init;
- (void)_turnOffAirplaneModeTapped;
@end

@implementation BuddyAirplaneController

- (BuddyAirplaneController)init
{
  id location = self;
  v13[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  v13[0] = [(NSBundle *)v2 localizedStringForKey:@"ACTIVATION_REQUIRED" value:&stru_1002B4E18 table:@"Localizable"];

  v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ACTIVATION_AIRPLANE"];
  id v12 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];

  id v5 = location;
  id location = 0;
  v11.receiver = v5;
  v11.super_class = (Class)BuddyAirplaneController;
  id location = [(BuddyAirplaneController *)&v11 initWithTitle:v13[0] detailText:v12 icon:0];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v6 = location;
    v7 = +[NSBundle mainBundle];
    v8 = [(NSBundle *)v7 localizedStringForKey:@"TURN_OFF_AIRPLANE_MODE" value:&stru_1002B4E18 table:@"Localizable"];
    [v6 addBoldButton:v8 action:"_turnOffAirplaneModeTapped"];
  }
  v9 = (BuddyAirplaneController *)location;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&location, 0);
  return v9;
}

- (void)_turnOffAirplaneModeTapped
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)RadiosPreferences);
  [location[0] setAirplaneMode:0];
  v2 = [(BuddyWelcomeController *)v4 delegate];
  [(BFFFlowItemDelegate *)v2 flowItemDone:v4];

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

@end