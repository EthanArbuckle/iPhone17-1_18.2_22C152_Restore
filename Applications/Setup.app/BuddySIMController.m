@interface BuddySIMController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)hiddenFromMultiUser;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BuddySIMController)init;
- (ProximitySetupController)proximitySetupController;
- (TSSetupAssistantSIMSetupFlow)setupFlow;
- (id)viewController;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSetupFlow:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)updateSourceProxCardState:(BOOL)a3;
@end

@implementation BuddySIMController

- (BuddySIMController)init
{
  SEL v9 = a2;
  id location = 0;
  v8.receiver = self;
  v8.super_class = (Class)BuddySIMController;
  v2 = [(BuddySIMController *)&v8 init];
  id location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
  {
    id v3 = objc_alloc_init((Class)sub_100157F50());
    [location setSetupFlow:v3];

    id v4 = location;
    id v5 = [location setupFlow];
    [v5 setDelegate:v4];
  }
  v6 = (BuddySIMController *)location;
  objc_storeStrong(&location, 0);
  return v6;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSIMSetup;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (BOOL)controllerNeedsToRun
{
  return (BYSetupAssistantHasCompletedInitialRun() & 1) == 0;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  v14 = sub_100158278;
  v15 = &unk_1002B2070;
  id v16 = location[0];
  id v17 = objc_retainBlock(&v11);
  id v3 = sub_100157F50();
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1001582F8;
  objc_super v8 = &unk_1002B3B38;
  id v10 = v17;
  SEL v9 = v19;
  [v3 needsToRun:&v4];
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  v2 = [(BuddySIMController *)self setupFlow];
  id v3 = [(TSSetupAssistantSIMSetupFlow *)v2 rootViewController];

  return v3;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, BYSetupAssistantDidCompleteSIMSetupNotification, 0, 0, 1u);
  id v4 = [(BuddySIMController *)self delegate];
  [(BFFFlowItemDelegate *)v4 flowItemDone:self];
}

- (void)updateSourceProxCardState:(BOOL)a3
{
  id v3 = [(BuddySIMController *)self proximitySetupController];
  [(ProximitySetupController *)v3 setSourceProxCardVisibliityForSIMSetupExternalAuthentication:a3];
}

- (BFFFlowItemDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (TSSetupAssistantSIMSetupFlow)setupFlow
{
  return (TSSetupAssistantSIMSetupFlow *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSetupFlow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end