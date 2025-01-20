@interface BuddySIMTransferController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)hiddenFromMultiUser;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BuddyMiscState)miscState;
- (ProximitySetupController)proximitySetupController;
- (TSSIMSetupFlow)setupFlow;
- (id)viewController;
- (void)_endProximityIfApplicable;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSetupFlow:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)updateSourceProxCardState:(BOOL)a3;
@end

@implementation BuddySIMTransferController

+ (BOOL)controllerNeedsToRun
{
  return (BYSetupAssistantHasCompletedInitialRun() ^ 1) & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddySIMTransferController *)v12 proximitySetupController];
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1001759C0;
  v8 = &unk_1002B1668;
  v9 = v12;
  id v10 = location[0];
  [(ProximitySetupController *)v3 waitForIntent:&v4];

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_endProximityIfApplicable
{
  v9 = self;
  v8[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_100176390;
  v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
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

- (id)viewController
{
  v2 = [(BuddySIMTransferController *)self setupFlow];
  id v3 = [(TSSIMSetupFlow *)v2 rootViewController];

  return v3;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  [(BuddySIMTransferController *)self _endProximityIfApplicable];
  id v3 = [(BuddySIMTransferController *)self delegate];
  [(BFFFlowItemDelegate *)v3 flowItemDone:self];
}

- (void)updateSourceProxCardState:(BOOL)a3
{
  id v3 = [(BuddySIMTransferController *)self proximitySetupController];
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

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (TSSIMSetupFlow)setupFlow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSetupFlow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end