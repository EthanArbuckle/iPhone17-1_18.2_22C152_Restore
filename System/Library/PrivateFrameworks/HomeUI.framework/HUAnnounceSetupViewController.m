@interface HUAnnounceSetupViewController
- (Class)onboardingFlowClass;
- (HUAnnounceSetupViewController)initWithHome:(id)a3 step:(unint64_t)a4;
- (HUConfigurationViewControllerDelegate)delegate;
- (unint64_t)step;
- (void)continuePressed:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUAnnounceSetupViewController

- (HUAnnounceSetupViewController)initWithHome:(id)a3 step:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    v7 = _HULocalizedStringWithDefaultValue(@"HUOnboardingAnnounceAccessControl_Title", @"HUOnboardingAnnounceAccessControl_Title", 1);
    v8 = @"HUOnboardingAnnounceAccessControl_Detail";
    uint64_t v9 = 3;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v7 = _HULocalizedStringWithDefaultValue(@"HUOnboardingAnnounceNotifications_Title", @"HUOnboardingAnnounceNotifications_Title", 1);
    v8 = @"HUOnboardingAnnounceNotifications_Detail";
    uint64_t v9 = 2;
LABEL_5:
    v10 = _HULocalizedStringWithDefaultValue(v8, v8, 1);
    goto LABEL_7;
  }
  v7 = 0;
  v10 = 0;
  uint64_t v9 = 2;
LABEL_7:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HUAnnounceSetupViewController_initWithHome_step___block_invoke_3;
  aBlock[3] = &unk_1E6387FE8;
  id v19 = v6;
  uint64_t v20 = v9;
  id v11 = v6;
  v12 = _Block_copy(aBlock);
  v13 = [[HUSimpleItemModuleTableViewController alloc] initWithTableViewStyle:1 moduleCreator:v12 moduleControllerBuilder:&__block_literal_global_16_2];
  v17.receiver = self;
  v17.super_class = (Class)HUAnnounceSetupViewController;
  v14 = [(HUItemTableOBWelcomeController *)&v17 initWithTitle:v7 detailText:v10 icon:0 contentLayout:2 itemTableViewController:v13];
  v15 = v14;
  if (v14) {
    v14->_step = a4;
  }

  return v15;
}

id __51__HUAnnounceSetupViewController_initWithHome_step___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HUAnnounceSettingsItemModule alloc] initWithItemUpdater:v4 home:*(void *)(a1 + 32) settingsContext:*(void *)(a1 + 40)];

  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

HUAnnounceSettingsItemModuleController *__51__HUAnnounceSetupViewController_initWithHome_step___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(HUItemModuleController *)[HUAnnounceSettingsItemModuleController alloc] initWithModule:v2];

  return v3;
}

- (void)continuePressed:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(HUAnnounceSetupViewController *)self delegate];
  v7 = @"announceSetupStep";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUAnnounceSetupViewController step](self, "step"));
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 viewController:self didFinishWithConfigurationResults:v6];
}

- (void)viewDidLoad
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)HUAnnounceSetupViewController;
  [(HUItemTableOBWelcomeController *)&v11 viewDidLoad];
  id v4 = [(HUAnnounceSetupViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5D90];

  id v6 = [MEMORY[0x1E4F83A80] boldButton];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = _HULocalizedStringWithDefaultValue(@"HUOnboardingAnnounce_ContinueButton", @"HUOnboardingAnnounce_ContinueButton", 1);
  [v6 setTitle:v7 forState:0];

  [v6 setAccessibilityIdentifier:@"Home.OnboardingView.AnnounceSetUp.ContinueButton"];
  [v6 addTarget:self action:sel_continuePressed_ forControlEvents:64];
  v8 = [(HUAnnounceSetupViewController *)self buttonTray];
  [v8 addButton:v6];

  [(HUAnnounceSetupViewController *)self setModalInPresentation:1];
  uint64_t v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: ATVC", buf, 0x16u);
  }
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (HUConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)step
{
  return self->_step;
}

- (void).cxx_destruct
{
}

@end