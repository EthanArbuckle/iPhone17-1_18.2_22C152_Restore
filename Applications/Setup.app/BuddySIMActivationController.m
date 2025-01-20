@interface BuddySIMActivationController
+ (BOOL)hiddenFromMultiUser;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerNeedsToRun;
- (BYRunState)runState;
- (BuddyMiscState)miscState;
- (CoreTelephonyClient)telephonyClient;
- (ProximitySetupController)proximitySetupController;
- (TSSIMSetupFlow)setupFlow;
- (id)viewController;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSetupFlow:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)updateSourceProxCardState:(BOOL)a3;
@end

@implementation BuddySIMActivationController

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

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddySIMActivationController *)self runState];
  unsigned __int8 v3 = [(BYRunState *)v2 hasCompletedInitialRun];
  char v8 = 0;
  char v6 = 0;
  BOOL v4 = 0;
  if ((v3 & 1) == 0)
  {
    v9 = [(BuddySIMActivationController *)self miscState];
    char v8 = 1;
    v7 = [(BuddyMiscState *)v9 activationPlanRequest];
    char v6 = 1;
    BOOL v4 = v7 != 0;
  }
  BOOL v11 = v4;
  if (v6) {

  }
  if (v8) {
  return v11;
  }
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = (id)_BYLoggingFacility();
  os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v3 = v21;
    os_log_type_t v4 = v20;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Adding cellular plan...", buf, 2u);
  }
  objc_storeStrong(&v21, 0);
  id v5 = objc_alloc((Class)CoreTelephonyClient);
  char v6 = &_dispatch_main_q;
  id v7 = [v5 initWithQueue:v6];
  [(BuddySIMActivationController *)v23 setTelephonyClient:v7];

  objc_initWeak(&from, v23);
  char v8 = [(BuddySIMActivationController *)v23 telephonyClient];
  v9 = [(BuddySIMActivationController *)v23 miscState];
  v10 = [(BuddyMiscState *)v9 activationPlanRequest];
  BOOL v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  v14 = sub_1001F81D0;
  v15 = &unk_1002B4D60;
  objc_copyWeak(v17, &from);
  id v16 = location[0];
  [(CoreTelephonyClient *)v8 addPlanWith:v10 completionHandler:&v11];

  objc_storeStrong(&v16, 0);
  objc_destroyWeak(v17);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  v2 = [(BuddySIMActivationController *)self setupFlow];
  id v3 = [(TSSIMSetupFlow *)v2 rootViewController];

  return v3;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id v16 = self;
  v15[2] = (id)a2;
  v15[1] = (id)a3;
  id v3 = [(BuddySIMActivationController *)self viewController];
  v15[0] = [v3 navigationController];

  id v4 = [v15[0] viewControllers];
  id v5 = [(BuddySIMActivationController *)v16 viewController];
  char v6 = [v4 indexOfObject:v5];

  v14 = v6;
  id v7 = [v15[0] viewControllers];
  id v8 = v6;
  id v9 = [v15[0] viewControllers];
  id v18 = v8;
  v17 = (char *)((unsigned char *)[v9 count] - v14);
  id v19 = v8;
  os_log_type_t v20 = v17;
  v10 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v8, v17, v8, v17);
  id location = [v7 objectsAtIndexes:v10];

  BOOL v11 = [(BuddySIMActivationController *)v16 delegate];
  [(BFFFlowItemDelegate *)v11 removeViewControllersOnNextPush:location];

  int v12 = [(BuddySIMActivationController *)v16 delegate];
  [(BFFFlowItemDelegate *)v12 flowItemDone:v16];

  objc_storeStrong(&location, 0);
  objc_storeStrong(v15, 0);
}

- (void)updateSourceProxCardState:(BOOL)a3
{
  id v3 = [(BuddySIMActivationController *)self proximitySetupController];
  [(ProximitySetupController *)v3 setSourceProxCardVisibliityForSIMSetupExternalAuthentication:a3];
}

- (BFFFlowItemDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (TSSIMSetupFlow)setupFlow
{
  return self->_setupFlow;
}

- (void)setSetupFlow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end