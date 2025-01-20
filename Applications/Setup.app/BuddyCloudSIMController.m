@interface BuddyCloudSIMController
+ (BOOL)hiddenFromMultiUser;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerNeedsToRun;
- (BYRunState)runState;
- (BuddyMiscState)miscState;
- (BuddySetupMethod)setupMethod;
- (ProximitySetupController)proximitySetupController;
- (TSSIMSetupFlow)setupFlow;
- (id)viewController;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSetupFlow:(id)a3;
- (void)setSetupMethod:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)updateSourceProxCardState:(BOOL)a3;
@end

@implementation BuddyCloudSIMController

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSIMSetup;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyCloudSIMController *)self runState];
  unsigned __int8 v3 = [(BYRunState *)v2 hasCompletedInitialRun];

  if ((v3 & 1) == 0) {
    return 1;
  }
  v4 = [(BuddyCloudSIMController *)self miscState];
  BOOL v7 = [(BuddyMiscState *)v4 launchedToShowSIMSetupAfterRestore];

  return v7;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyCloudSIMController *)v32 setupMethod];
  char v29 = 0;
  BOOL v4 = 1;
  if ((id)[(BuddySetupMethod *)v3 dataTransferMethod] != (id)1)
  {
    id v30 = [(BuddyCloudSIMController *)v32 setupMethod];
    char v29 = 1;
    BOOL v4 = [v30 dataTransferMethod] == (id)2;
  }
  if (v29) {

  }
  if (v4)
  {
    id v5 = +[CTCellularPlanManager sharedManager];
    id v28 = [v5 planItemsShouldUpdate:1];

    if (![v28 count]) {
      CFPreferencesSetAppValue(@"ShouldShowSIMSetupInRestoreMiniBuddy", kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    }
    if (location[0]) {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    }
    int v27 = 1;
    objc_storeStrong(&v28, 0);
  }
  else
  {
    uint64_t v26 = 0;
    v6 = [(BuddyCloudSIMController *)v32 proximitySetupController];
    unsigned __int8 v7 = [(ProximitySetupController *)v6 hasAppliedSettings];

    if (v7)
    {
      v8 = [(BuddyCloudSIMController *)v32 proximitySetupController];
      unsigned __int8 v9 = [(ProximitySetupController *)v8 hasConnection];

      if (v9) {
        uint64_t v26 = 3;
      }
      else {
        uint64_t v26 = 2;
      }
    }
    else
    {
      uint64_t v26 = 1;
    }
    id v10 = sub_1000C291C();
    id v11 = sub_1000C2A34();
    v33[0] = v11;
    v34[0] = &off_1002C1700;
    id v12 = sub_1000C2B40();
    v33[1] = v12;
    v13 = +[NSNumber numberWithUnsignedInteger:v26];
    v34[1] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    id v15 = [v10 flowWithOptions:v14];
    [(BuddyCloudSIMController *)v32 setSetupFlow:v15];

    v16 = [(BuddyCloudSIMController *)v32 setupFlow];
    LOBYTE(v11) = v16 == 0;

    if (v11)
    {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
      int v27 = 1;
    }
    else
    {
      v17 = v32;
      v18 = [(BuddyCloudSIMController *)v32 setupFlow];
      [(TSSIMSetupFlow *)v18 setDelegate:v17];

      v19 = [(BuddyCloudSIMController *)v32 setupFlow];
      v20 = _NSConcreteStackBlock;
      int v21 = -1073741824;
      int v22 = 0;
      v23 = sub_1000C2C4C;
      v24 = &unk_1002B26A8;
      id v25 = location[0];
      [(TSSIMSetupFlow *)v19 firstViewController:&v20];

      objc_storeStrong(&v25, 0);
      int v27 = 0;
    }
  }
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  v2 = [(BuddyCloudSIMController *)self setupFlow];
  id v3 = [(TSSIMSetupFlow *)v2 rootViewController];

  return v3;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id v3 = [(BuddyCloudSIMController *)self delegate];
  [(BFFFlowItemDelegate *)v3 flowItemDone:self];
}

- (void)updateSourceProxCardState:(BOOL)a3
{
  id v3 = [(BuddyCloudSIMController *)self proximitySetupController];
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

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
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