@interface BuddyEDUAccountConfigurationSyncController
+ (BOOL)controllerNeedsToRun;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startFlowItem:(BOOL)a3;
@end

@implementation BuddyEDUAccountConfigurationSyncController

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

+ (BOOL)controllerNeedsToRun
{
  id v2 = +[BYPreferencesController buddyPreferences];
  id v3 = [v2 objectForKey:BYBuddyDoneKey];
  unsigned __int8 v4 = [v3 BOOLValue];

  unsigned __int8 v5 = +[BYManagedAppleIDBootstrap isMultiUser];
  BOOL v6 = 0;
  if (v5)
  {
    unsigned __int8 v7 = +[BYManagedAppleIDBootstrap isManagedAppleIDSignedIn];
    BOOL v6 = 0;
    if (v7)
    {
      unsigned __int8 v8 = +[BuddyAppleIDPasswordChangeController controllerNeedsToRun];
      BOOL v6 = 1;
      if ((v8 & 1) == 0) {
        return !(v4 & 1);
      }
    }
  }
  return v6;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[BYManagedAppleIDBootstrap sharedManager];
  unsigned __int8 v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  unsigned __int8 v7 = sub_100048828;
  unsigned __int8 v8 = &unk_1002B0D70;
  id v9 = location[0];
  [v3 writeAccountConfigurationIfNeededWithCompletion:&v4];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)startFlowItem:(BOOL)a3
{
  id v3 = [(BuddyEDUAccountConfigurationSyncController *)self delegate];
  [(BFFFlowItemDelegate *)v3 flowItemDone:self nextItemClass:objc_opt_class()];
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end