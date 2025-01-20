@interface BuddyAwaitUserConfigurationController
+ (BOOL)controllerNeedsToRun;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BuddyAwaitUserConfigurationViewController)awaitUserConfigurationViewController;
- (MCProfileConnection)managedConfiguration;
- (id)viewController;
- (unint64_t)allowedTerminationSources;
- (void)controllerDone;
- (void)setAwaitUserConfigurationViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)startFlowItem:(BOOL)a3;
@end

@implementation BuddyAwaitUserConfigurationController

+ (BOOL)controllerNeedsToRun
{
  return +[DMCMultiUserModeUtilities inSharediPadUserSession] & 1;
}

- (id)viewController
{
  v13 = self;
  v12[1] = (id)a2;
  if (+[DMCMultiUserModeUtilities awaitUserConfigurationEnabled])
  {
    v2 = [(BuddyAwaitUserConfigurationController *)v13 awaitUserConfigurationViewController];

    if (!v2)
    {
      v3 = [(BuddyAwaitUserConfigurationController *)v13 managedConfiguration];
      v12[0] = [(MCProfileConnection *)v3 cloudConfigurationDetails];

      id v11 = [v12[0] objectForKeyedSubscript:kMCCCOrganizationNameKey];
      v4 = [BuddyAwaitUserConfigurationViewController alloc];
      v5 = +[NSBundle mainBundle];
      v6 = [(NSBundle *)v5 localizedStringForKey:@"CLOUD_CONFIG_GETTING_CONFIGURATION_DESCRIPTION_%@" value:&stru_1002B4E18 table:@"Localizable"];
      v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v11);
      id location = [(BuddyAwaitUserConfigurationViewController *)v4 initWithSpinnerText:v7];

      [location setAwaitUserConfigurationController:v13];
      [(BuddyAwaitUserConfigurationController *)v13 setAwaitUserConfigurationViewController:location];
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v11, 0);
      objc_storeStrong(v12, 0);
    }
    v14 = [(BuddyAwaitUserConfigurationController *)v13 awaitUserConfigurationViewController];
  }
  else
  {
    v14 = 0;
  }
  v8 = v14;

  return v8;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (void)setDelegate:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_delegate, location[0]);
  objc_storeStrong(location, 0);
}

- (void)startFlowItem:(BOOL)a3
{
}

- (void)controllerDone
{
  v2 = [(BuddyAwaitUserConfigurationController *)self delegate];
  [(BFFFlowItemDelegate *)v2 flowItemDone:self nextItemClass:objc_opt_class()];
}

- (unint64_t)allowedTerminationSources
{
  return 2;
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (BuddyAwaitUserConfigurationViewController)awaitUserConfigurationViewController
{
  return self->_awaitUserConfigurationViewController;
}

- (void)setAwaitUserConfigurationViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end