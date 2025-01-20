@interface HUAnnounceTitleViewController
- (BOOL)_limitToNonScrollingContentHeight;
- (Class)onboardingFlowClass;
- (HUAnnounceTitleViewController)initWithHome:(id)a3;
- (HUConfigurationViewControllerDelegate)delegate;
- (UIImageView)contentImageView;
- (void)continuePressed:(id)a3;
- (void)setContentImageView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUAnnounceTitleViewController

- (HUAnnounceTitleViewController)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = _HULocalizedStringWithDefaultValue(@"HUOnboardingAnnounce_Title", @"HUOnboardingAnnounce_Title", 1);
  v6 = HULocalizedSiriTriggerPhrase(v4);

  v13 = HULocalizedStringWithFormat(@"HUOnboardingAnnounce_Detail", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);

  v14 = HUImageNamed(@"Onboarding-Announce");
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v14];
  [v15 setContentMode:1];
  v19.receiver = self;
  v19.super_class = (Class)HUAnnounceTitleViewController;
  v16 = [(HUCenterFillOBWelcomeController *)&v19 initWithTitle:v5 detailText:v13 icon:0 contentView:v15];
  v17 = v16;
  if (v16) {
    [(HUAnnounceTitleViewController *)v16 setContentImageView:v15];
  }

  return v17;
}

- (void)viewDidLoad
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)HUAnnounceTitleViewController;
  [(HUCenterFillOBWelcomeController *)&v11 viewDidLoad];
  id v4 = [(HUAnnounceTitleViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5E30];

  v6 = [MEMORY[0x1E4F83A80] boldButton];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = _HULocalizedStringWithDefaultValue(@"HUOnboardingAnnounce_ContinueButton", @"HUOnboardingAnnounce_ContinueButton", 1);
  [v6 setTitle:v7 forState:0];

  [v6 setAccessibilityIdentifier:@"Home.OnboardingView.Announce.ContinueButton"];
  [v6 addTarget:self action:sel_continuePressed_ forControlEvents:64];
  uint64_t v8 = [(HUAnnounceTitleViewController *)self buttonTray];
  [v8 addButton:v6];

  [(HUAnnounceTitleViewController *)self setModalInPresentation:1];
  [(HUAnnounceTitleViewController *)self updateViewConstraints];
  uint64_t v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: ATVC", buf, 0x16u);
  }
}

- (void)continuePressed:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(HUAnnounceTitleViewController *)self delegate];
  v6 = @"announceSetupStep";
  v7[0] = &unk_1F19B4AF0;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v4 viewController:self didFinishWithConfigurationResults:v5];
}

- (BOOL)_limitToNonScrollingContentHeight
{
  return 1;
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

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void)setContentImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentImageView, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end