@interface BuddyManagedSIMController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerNeedsToRun;
- (BYRunState)runState;
- (BuddyActivationRecord)activationRecord;
- (BuddyNetworkProvider)networkProvider;
- (MCProfileConnection)managedConfiguration;
- (TSSIMSetupFlow)setupFlow;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setActivationRecord:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSetupFlow:(id)a3;
@end

@implementation BuddyManagedSIMController

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSIMSetup;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyManagedSIMController *)self runState];
  unsigned __int8 v3 = [(BYRunState *)v2 hasCompletedInitialRun];

  if (v3) {
    return BYIsRunningInStoreDemoMode() & 1;
  }
  v4 = [(BuddyManagedSIMController *)self managedConfiguration];
  unsigned __int8 v5 = [(MCProfileConnection *)v4 activationRecordIndicatesCloudConfigurationIsAvailable];
  char v8 = 0;
  unsigned __int8 v6 = 1;
  if ((v5 & 1) == 0)
  {
    v9 = [(BuddyManagedSIMController *)self activationRecord];
    char v8 = 1;
    unsigned __int8 v6 = [(BuddyActivationRecord *)v9 impliesDemod];
  }
  BOOL v11 = v6 & 1;
  if (v8) {

  }
  return v11;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v24 = 0;
  char v22 = 0;
  unsigned __int8 v3 = 1;
  if ((BYIsRunningInStoreDemoMode() & 1) == 0)
  {
    id v23 = [(BuddyManagedSIMController *)v26 activationRecord];
    char v22 = 1;
    unsigned __int8 v3 = [v23 impliesDemod];
  }
  if (v22) {

  }
  if (v3) {
    char v24 = 1;
  }
  id v4 = sub_10011F3AC();
  id v5 = sub_10011F4C4();
  v27[0] = v5;
  v28[0] = &off_1002C1718;
  id v6 = sub_10011F5D0();
  v27[1] = v6;
  v7 = +[NSNumber numberWithBool:v24 & 1];
  v28[1] = v7;
  id v8 = sub_10011F6DC();
  v27[2] = v8;
  v9 = [(BuddyManagedSIMController *)v26 networkProvider];
  v10 = +[NSNumber numberWithInt:![(BuddyNetworkProvider *)v9 connectedOverWiFiAndNetworkReachable]];
  v28[2] = v10;
  BOOL v11 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
  id v12 = [v4 flowWithOptions:v11];
  [(BuddyManagedSIMController *)v26 setSetupFlow:v12];

  v13 = [(BuddyManagedSIMController *)v26 setupFlow];
  LOBYTE(v5) = v13 == 0;

  if (v5)
  {
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    int v21 = 1;
  }
  else
  {
    v14 = [(BuddyManagedSIMController *)v26 setupFlow];
    v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_10011F7E8;
    v19 = &unk_1002B26A8;
    id v20 = location[0];
    [(TSSIMSetupFlow *)v14 firstViewController:&v15];

    objc_storeStrong(&v20, 0);
    int v21 = 0;
  }
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (BuddyActivationRecord)activationRecord
{
  return self->_activationRecord;
}

- (void)setActivationRecord:(id)a3
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