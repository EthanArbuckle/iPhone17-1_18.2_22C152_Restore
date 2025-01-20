@interface HUUtilityOnboardingConnectionViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityOnboardingConnectionTableViewController)tableView;
- (HUUtilityOnboardingConnectionViewController)initWithContext:(id)a3;
- (NSTimer)autoDismissTimer;
- (_TtC6HomeUI24UtilityOnboardingContext)onboardingContext;
- (id)hu_preloadContent;
- (void)_startAutoDismissTimer;
- (void)sendNotification;
- (void)setAutoDismissTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOnboardingContext:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUUtilityOnboardingConnectionViewController

- (HUUtilityOnboardingConnectionViewController)initWithContext:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [HUUtilityOnboardingConnectionItemManager alloc];
  v21[0] = @"utilityName";
  v6 = [v4 config];
  v7 = [v6 name];
  v21[1] = @"homeName";
  v22[0] = v7;
  v8 = [v4 home];
  v9 = [v8 name];
  v22[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v11 = [(HUUtilityOnboardingConnectionItemManager *)v5 initWithDelegate:self data:v10];

  v12 = [[HUUtilityOnboardingConnectionTableViewController alloc] initWithData:0 withItemManager:v11 tableViewStyle:1];
  [(HUUtilityOnboardingConnectionViewController *)self setTableView:v12];

  v13 = _HULocalizedStringWithDefaultValue(@"HUUtilityDiscoveryUtilityConnection_Title", @"HUUtilityDiscoveryUtilityConnection_Title", 1);
  v14 = [(HUUtilityOnboardingConnectionViewController *)self tableView];
  v20.receiver = self;
  v20.super_class = (Class)HUUtilityOnboardingConnectionViewController;
  v15 = [(HUItemTableOBWelcomeController *)&v20 initWithTitle:v13 detailText:0 icon:0 contentLayout:2 itemTableViewController:v14];

  [(HUUtilityOnboardingConnectionViewController *)v15 setOnboardingContext:v4];
  v16 = [v4 utilityID];
  uint64_t v17 = [v4 onboardingMethod];
  uint64_t v18 = [v4 didAttemptPasswordlessMethod];

  +[HUHomeEnergyAnalyticsHelper sendUtilityOnboardingCompletedEventWithUtilityID:v16 onboardingMethod:v17 didAttemptPasswordless:v18];
  return v15;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HUUtilityOnboardingConnectionViewController;
  [(HUItemTableOBWelcomeController *)&v10 viewDidLoad];
  v3 = [(OBBaseWelcomeController *)self navigationItem];
  [v3 setHidesBackButton:1 animated:0];

  id v4 = [(HUUtilityOnboardingConnectionViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5D18];

  v6 = [(HUUtilityOnboardingConnectionViewController *)self onboardingContext];
  v7 = [(HUUtilityOnboardingConnectionViewController *)self headerView];
  [v6 updateIconWithHeaderView:v7 axID:@"Home.OnboardingView.Utility.SubscriptionInfo.Icon"];

  v8 = [(HUUtilityOnboardingConnectionViewController *)self tableView];
  v9 = [v8 tableView];
  [v9 setAllowsSelection:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUUtilityOnboardingConnectionViewController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  [(HUUtilityOnboardingConnectionViewController *)self _startAutoDismissTimer];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUUtilityOnboardingConnectionViewController;
  [(HUUtilityOnboardingConnectionViewController *)&v4 viewDidDisappear:a3];
  [(HUUtilityOnboardingConnectionViewController *)self sendNotification];
}

- (void)sendNotification
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    __int16 v12 = 2080;
    v13 = "-[HUUtilityOnboardingConnectionViewController sendNotification]";
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s Sending onboarding notification", buf, 0x16u);
  }

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v5 = [(HUUtilityOnboardingConnectionViewController *)self onboardingContext];
  v6 = [v5 home];
  v9 = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v4 postNotificationName:@"CompletedUtilityOnboarding" object:0 userInfo:v7];
}

- (void)_startAutoDismissTimer
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__HUUtilityOnboardingConnectionViewController__startAutoDismissTimer__block_invoke;
  v4[3] = &unk_1E638CFE0;
  v4[4] = self;
  v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v4 block:2.0];
  [(HUUtilityOnboardingConnectionViewController *)self setAutoDismissTimer:v3];
}

void __69__HUUtilityOnboardingConnectionViewController__startAutoDismissTimer__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  v5 = @"HUUtilityDiscoveryOnboardingKey_UserInput";
  v6[0] = &unk_1F19B4820;
  objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 viewController:v3 didFinishWithConfigurationResults:v4];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC6HomeUI24UtilityOnboardingContext)onboardingContext
{
  return self->_onboardingContext;
}

- (void)setOnboardingContext:(id)a3
{
}

- (HUUtilityOnboardingConnectionTableViewController)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSTimer)autoDismissTimer
{
  return self->_autoDismissTimer;
}

- (void)setAutoDismissTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoDismissTimer, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_onboardingContext, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end