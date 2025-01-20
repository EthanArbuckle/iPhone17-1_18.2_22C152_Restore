@interface BuddyActivationFailureController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BOOL)isEphemeral;
- (BuddyActivationFailureController)init;
- (BuddyActivationState)activationState;
- (id)restartActivation;
- (void)_otherOptionsTapped:(id)a3;
- (void)_tryAgainTapped:(id)a3;
- (void)setActivationState:(id)a3;
- (void)setRestartActivation:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyActivationFailureController

- (BuddyActivationFailureController)init
{
  SEL v8 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"ACTIVATION_ERROR_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyActivationFailureController;
  id location = [(BuddyActivationFailureController *)&v7 initWithTitle:v4 detailText:0 icon:0];
  objc_storeStrong(&location, location);

  v5 = (BuddyActivationFailureController *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewDidLoad
{
  v33 = self;
  SEL v32 = a2;
  v31.receiver = self;
  v31.super_class = (Class)BuddyActivationFailureController;
  [(BuddyActivationFailureController *)&v31 viewDidLoad];
  id location = 0;
  v2 = [(BuddyActivationFailureController *)v33 activationState];
  v3 = [(BuddyActivationState *)v2 error];
  unsigned __int8 v4 = [(BuddyActivationError *)v3 isConnectionFailure];

  if (v4)
  {
    v5 = [(BuddyActivationFailureController *)v33 activationState];
    v6 = [(BuddyActivationState *)v5 error];
    unsigned __int8 v7 = [(BuddyActivationError *)v6 isCellular];

    if (v7) {
      objc_storeStrong(&location, @"ACTIVATION_ERROR_DETAIL_CONNECTION_FAILURE_CELLULAR_WIFI");
    }
    else {
      objc_storeStrong(&location, @"ACTIVATION_ERROR_DETAIL_CONNECTION_FAILURE_WIRELESS");
    }
  }
  else
  {
    SEL v8 = [(BuddyActivationFailureController *)v33 activationState];
    v9 = [(BuddyActivationState *)v8 error];
    unsigned __int8 v10 = [(BuddyActivationError *)v9 isCellular];

    if (v10) {
      objc_storeStrong(&location, @"ACTIVATION_ERROR_DETAIL_OTHER_CELLULAR_WIFI");
    }
    else {
      objc_storeStrong(&location, @"ACTIVATION_ERROR_DETAIL_OTHER_WIRELESS");
    }
  }
  v11 = [(BuddyActivationFailureController *)v33 activationState];
  v12 = [(BuddyActivationState *)v11 error];
  unsigned __int8 v13 = [(BuddyActivationError *)v12 isCellular];

  if (v13)
  {
    id v14 = [(BuddyActivationFailureController *)v33 navigationItem];
    [v14 setHidesBackButton:1];
  }
  id v15 = [(BuddyActivationFailureController *)v33 headerView];
  v16 = +[NSBundle mainBundle];
  id v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:location];
  id v18 = (id)SFLocalizableWAPIStringKeyForKey();
  v19 = [(NSBundle *)v16 localizedStringForKey:v18 value:&stru_1002B4E18 table:@"Localizable"];
  [v15 setDetailText:v19];

  id v20 = [(BuddyActivationFailureController *)v33 headerView];
  v21 = +[UIImage imageNamed:@"Alert Icon"];
  v22 = +[UIColor redColor];
  id v23 = [(UIImage *)v21 _flatImageWithColor:v22];
  [v20 setIcon:v23 accessibilityLabel:0];

  v24 = v33;
  v25 = +[NSBundle mainBundle];
  v26 = [(NSBundle *)v25 localizedStringForKey:@"TRY_AGAIN" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v24 addBoldButton:v26 action:"_tryAgainTapped:"];

  v27 = v33;
  v28 = +[NSBundle mainBundle];
  v29 = [(NSBundle *)v28 localizedStringForKey:@"OTHER_OPTIONS" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v27 addLinkButton:v29 action:"_otherOptionsTapped:"];

  objc_storeStrong(&location, 0);
}

- (void)_tryAgainTapped:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyActivationFailureController *)v6 restartActivation];

  if (v3)
  {
    unsigned __int8 v4 = (void (**)(void))[(BuddyActivationFailureController *)v6 restartActivation];
    v4[2](v4);
  }
  objc_storeStrong(location, 0);
}

- (void)_otherOptionsTapped:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyWelcomeController *)v5 delegate];
  [(BFFFlowItemDelegate *)v3 flowItemDone:v5];

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyActivationFailureController *)self activationState];
  id v3 = [(BuddyActivationState *)v2 error];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isEphemeral
{
  return 1;
}

- (id)restartActivation
{
  return self->_restartActivation;
}

- (void)setRestartActivation:(id)a3
{
}

- (BuddyActivationState)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end