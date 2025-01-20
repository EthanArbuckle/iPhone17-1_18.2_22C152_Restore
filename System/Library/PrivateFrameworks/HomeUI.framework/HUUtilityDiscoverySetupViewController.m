@interface HUUtilityDiscoverySetupViewController
- (BOOL)errorFetchingUtilities;
- (BOOL)needsToWaitForPreload;
- (BOOL)singleUtilityMode;
- (BOOL)tafEnabledForSelectedUtility;
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityConfigurationHelper)config;
- (HUUtilityDiscoverySetupViewController)initWithHome:(id)a3 allUtilities:(id)a4;
- (HUUtilityDiscoverySetupViewController)initWithHome:(id)a3 onboardingContext:(id)a4;
- (NSArray)fields;
- (NSArray)foundUtilities;
- (NSDictionary)selectedUtilityInfo;
- (NSLayoutConstraint)providerTableViewHeightConstraint;
- (NSString)selectedUtilityID;
- (OBBoldTrayButton)continueOnboardingButton;
- (OBLinkTrayButton)accountLoginButton;
- (UIEdgeInsets)contentInsets;
- (UITableView)providerSelectionTableView;
- (_TtC6HomeUI24UtilityOnboardingContext)onboardingContext;
- (id)_checkTAF:(id)a3;
- (id)_fetchUtilityConfig;
- (id)_fetchUtilityConfigAndCheckTAF;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_buttonAction;
- (void)_cancelUtilityOnboarding:(id)a3;
- (void)_continueOnboarding:(id)a3;
- (void)_hideSpinner;
- (void)_loginWithAccount:(id)a3;
- (void)_showSpinner;
- (void)_startOAuthLogin:(id)a3;
- (void)setAccountLoginButton:(id)a3;
- (void)setConfig:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setContinueOnboardingButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorFetchingUtilities:(BOOL)a3;
- (void)setFields:(id)a3;
- (void)setFoundUtilities:(id)a3;
- (void)setHome:(id)a3;
- (void)setOnboardingContext:(id)a3;
- (void)setProviderSelectionTableView:(id)a3;
- (void)setProviderTableViewHeightConstraint:(id)a3;
- (void)setSelectedUtilityID:(id)a3;
- (void)setSelectedUtilityInfo:(id)a3;
- (void)setSingleUtilityMode:(BOOL)a3;
- (void)setTafEnabledForSelectedUtility:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation HUUtilityDiscoverySetupViewController

- (HUUtilityDiscoverySetupViewController)initWithHome:(id)a3 allUtilities:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 count];
  v10 = _HULocalizedStringWithDefaultValue(@"HUUtilityDiscoverySetup_Title", @"HUUtilityDiscoverySetup_Title", 1);
  if (v9 == 1) {
    v11 = @"HUUtilityDiscoverySetup_Detail_SingleUtility";
  }
  else {
    v11 = @"HUUtilityDiscoverySetup_Detail_MultipleUtilities";
  }
  v12 = _HULocalizedStringWithDefaultValue(v11, v11, 1);
  v13 = HUImageNamed(@"Onboarding-HomeUtilityLogo");
  if ([MEMORY[0x1E4F69758] isAnIPad]) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 3;
  }
  v17.receiver = self;
  v17.super_class = (Class)HUUtilityDiscoverySetupViewController;
  v15 = [(HUUtilityDiscoverySetupViewController *)&v17 initWithTitle:v10 detailText:v12 icon:v13 contentLayout:v14];

  if (v15)
  {
    if (!v8 || ![v8 count]) {
      [v15 setErrorFetchingUtilities:1];
    }
    objc_storeStrong((id *)v15 + 150, a3);
    *(_OWORD *)(v15 + 1288) = 0u;
    *(_OWORD *)(v15 + 1304) = 0u;
    objc_storeStrong((id *)v15 + 157, a4);
  }

  return (HUUtilityDiscoverySetupViewController *)v15;
}

- (HUUtilityDiscoverySetupViewController)initWithHome:(id)a3 onboardingContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [HUUtilityDiscoverySetupViewController alloc];
  uint64_t v9 = [v6 allUtilities];
  v10 = [(HUUtilityDiscoverySetupViewController *)v8 initWithHome:v7 allUtilities:v9];

  objc_storeWeak((id *)&v10->_onboardingContext, v6);
  v11 = [v6 allUtilities];
  uint64_t v12 = [v11 count];

  if (v12 == 1)
  {
    v10->_singleUtilityMode = 1;
    v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      v18 = "-[HUUtilityDiscoverySetupViewController initWithHome:onboardingContext:]";
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%s Single utility mode", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    uint64_t v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v6 allUtilities];
      int v17 = 136315394;
      v18 = "-[HUUtilityDiscoverySetupViewController initWithHome:onboardingContext:]";
      __int16 v19 = 2048;
      uint64_t v20 = [v15 count];
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%s NOT single utility mode. Count = %lu", (uint8_t *)&v17, 0x16u);
    }
    v10->_singleUtilityMode = 0;
  }

  return v10;
}

- (void)_continueOnboarding:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  v5 = [(HUUtilityDiscoverySetupViewController *)self config];

  if (!v5)
  {
    __int16 v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412546;
      v23 = self;
      __int16 v24 = 2080;
      v25 = "-[HUUtilityDiscoverySetupViewController _continueOnboarding:]";
      _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%@: Configuration is nil  %s", (uint8_t *)&v22, 0x16u);
    }

    uint64_t v20 = [NSNumber numberWithUnsignedInteger:7];
    [v4 setObject:v20 forKeyedSubscript:@"HUUtilityDiscoveryOnboardingKey_UserInput"];

    v18 = HFLogForCategory();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
LABEL_13:
    int v22 = 138412802;
    v23 = self;
    __int16 v24 = 2080;
    v25 = "-[HUUtilityDiscoverySetupViewController _continueOnboarding:]";
    __int16 v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@ Finished %s with results  %@", (uint8_t *)&v22, 0x20u);
LABEL_14:

    uint64_t v21 = [(HUUtilityDiscoverySetupViewController *)self delegate];
    [v21 viewController:self didFinishWithConfigurationResults:v4];

    goto LABEL_18;
  }
  id v6 = [(HUUtilityDiscoverySetupViewController *)self config];
  id v7 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
  [v7 setConfig:v6];

  id v8 = [(HUUtilityDiscoverySetupViewController *)self selectedUtilityInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"utilityID"];
  v10 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
  [v10 setUtilityID:v9];

  objc_opt_class();
  v11 = [(HUUtilityDiscoverySetupViewController *)self selectedUtilityInfo];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"logo"];
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  v15 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
  [v15 setUtilityLogo:v14];

  LODWORD(v15) = [(HUUtilityDiscoverySetupViewController *)self tafEnabledForSelectedUtility];
  v16 = HFLogForCategory();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      int v22 = 138412546;
      v23 = self;
      __int16 v24 = 2080;
      v25 = "-[HUUtilityDiscoverySetupViewController _continueOnboarding:]";
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@: Continue onboarding with TAF  %s", (uint8_t *)&v22, 0x16u);
    }

    [v4 setObject:&unk_1F19B4748 forKeyedSubscript:@"HUUtilityDiscoveryOnboardingKey_UserInput"];
    v18 = HFLogForCategory();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v17)
  {
    int v22 = 138412546;
    v23 = self;
    __int16 v24 = 2080;
    v25 = "-[HUUtilityDiscoverySetupViewController _continueOnboarding:]";
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@: Continue onboarding with OAuth  %s", (uint8_t *)&v22, 0x16u);
  }

  [(HUUtilityDiscoverySetupViewController *)self _startOAuthLogin:v4];
LABEL_18:
}

- (void)_loginWithAccount:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    BOOL v17 = self;
    __int16 v18 = 2080;
    __int16 v19 = "-[HUUtilityDiscoverySetupViewController _loginWithAccount:]";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped button", (uint8_t *)&v16, 0x16u);
  }

  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [(HUUtilityDiscoverySetupViewController *)self config];
  id v7 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
  [v7 setConfig:v6];

  id v8 = [(HUUtilityDiscoverySetupViewController *)self selectedUtilityID];
  uint64_t v9 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
  [v9 setUtilityID:v8];

  objc_opt_class();
  v10 = [(HUUtilityDiscoverySetupViewController *)self selectedUtilityInfo];
  v11 = [v10 objectForKeyedSubscript:@"logo"];
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  id v14 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
  [v14 setUtilityLogo:v13];

  v15 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
  [v15 setOnboardingMethod:2];

  [(HUUtilityDiscoverySetupViewController *)self _startOAuthLogin:v5];
}

- (void)_cancelUtilityOnboarding:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    __int16 v12 = 2080;
    id v13 = "-[HUUtilityDiscoverySetupViewController _cancelUtilityOnboarding:]";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped button", buf, 0x16u);
  }

  v5 = [(HUUtilityDiscoverySetupViewController *)self selectedUtilityID];
  +[HUHomeEnergyAnalyticsHelper sendUtilityOnboardingCancelledEventWithUtilityID:v5 sourceViewController:0];

  id v6 = [(HUUtilityDiscoverySetupViewController *)self delegate];
  id v8 = @"HUUtilityDiscoveryOnboardingKey_UserInput";
  uint64_t v9 = &unk_1F19B4760;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v6 viewController:self didFinishWithConfigurationResults:v7];
}

- (id)_fetchUtilityConfig
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUUtilityDiscoverySetupViewController *)self selectedUtilityID];
  if (v3
    && (v4 = (void *)v3,
        [(HUUtilityDiscoverySetupViewController *)self selectedUtilityID],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        v6))
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__HUUtilityDiscoverySetupViewController__fetchUtilityConfig__block_invoke;
    v13[3] = &unk_1E6385108;
    v13[4] = self;
    id v7 = [MEMORY[0x1E4F7A0D8] futureWithBlock:v13];
    id v8 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    uint64_t v9 = [v7 reschedule:v8];
  }
  else
  {
    v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "%@: Selected utility ID is empty", buf, 0xCu);
    }

    v11 = (void *)MEMORY[0x1E4F7A0D8];
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "na_genericError");
    uint64_t v9 = [v11 futureWithError:v7];
  }

  return v9;
}

void __60__HUUtilityDiscoverySetupViewController__fetchUtilityConfig__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: IN FUTURE", buf, 0xCu);
  }

  uint64_t v6 = [*(id *)(a1 + 32) selectedUtilityID];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__HUUtilityDiscoverySetupViewController__fetchUtilityConfig__block_invoke_106;
  v8[3] = &unk_1E638C1C0;
  objc_copyWeak(&v10, &location);
  id v7 = v3;
  id v9 = v7;
  +[HUHomeEnergyManagerHelper utilityInformation:v6 completionHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__HUUtilityDiscoverySetupViewController__fetchUtilityConfig__block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = HFLogForCategory();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      int v10 = 138412546;
      id v11 = WeakRetained;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: completion error (%@)", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    if (v9)
    {
      int v10 = 138412290;
      id v11 = WeakRetained;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: utility configuration fetched", (uint8_t *)&v10, 0xCu);
    }

    [WeakRetained setConfig:v5];
    [*(id *)(a1 + 32) finishWithResult:v5];
  }
}

- (id)_fetchUtilityConfigAndCheckTAF
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUUtilityDiscoverySetupViewController *)self selectedUtilityID];
  if (v3
    && (v4 = (void *)v3,
        [(HUUtilityDiscoverySetupViewController *)self selectedUtilityID],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        v6))
  {
    id v7 = [(HUUtilityDiscoverySetupViewController *)self _fetchUtilityConfig];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__HUUtilityDiscoverySetupViewController__fetchUtilityConfigAndCheckTAF__block_invoke;
    v14[3] = &unk_1E638C1E8;
    v14[4] = self;
    id v8 = [v7 flatMap:v14];
    BOOL v9 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    int v10 = [v8 reschedule:v9];
  }
  else
  {
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = self;
      _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "%@: Selected utility ID is empty", buf, 0xCu);
    }

    __int16 v12 = (void *)MEMORY[0x1E4F7A0D8];
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "na_genericError");
    int v10 = [v12 futureWithError:v7];
  }

  return v10;
}

id __71__HUUtilityDiscoverySetupViewController__fetchUtilityConfigAndCheckTAF__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__HUUtilityDiscoverySetupViewController__fetchUtilityConfigAndCheckTAF__block_invoke_2;
  v8[3] = &unk_1E6385D90;
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 futureWithBlock:v8];

  return v6;
}

void __71__HUUtilityDiscoverySetupViewController__fetchUtilityConfigAndCheckTAF__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v5;
    __int16 v12 = 2080;
    id v13 = "-[HUUtilityDiscoverySetupViewController _fetchUtilityConfigAndCheckTAF]_block_invoke_2";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: IN TAF FUTURE  %s", buf, 0x16u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__HUUtilityDiscoverySetupViewController__fetchUtilityConfigAndCheckTAF__block_invoke_110;
  v8[3] = &unk_1E63865B8;
  uint64_t v6 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v7 = v3;
  [v6 isTAFEnabledWithCompletionHandler:v8];
}

void __71__HUUtilityDiscoverySetupViewController__fetchUtilityConfigAndCheckTAF__block_invoke_110(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    uint64_t v11 = "-[HUUtilityDiscoverySetupViewController _fetchUtilityConfigAndCheckTAF]_block_invoke";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: COMPLETION HANDLER  %s", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = [NSNumber numberWithBool:a2];
  [v6 finishWithResult:v7];
}

- (id)_checkTAF:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F7A0D8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HUUtilityDiscoverySetupViewController__checkTAF___block_invoke;
  v9[3] = &unk_1E6385D90;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 futureWithBlock:v9];

  return v7;
}

void __51__HUUtilityDiscoverySetupViewController__checkTAF___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v5;
    __int16 v12 = 2080;
    id v13 = "-[HUUtilityDiscoverySetupViewController _checkTAF:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: IN TAF FUTURE  %s", buf, 0x16u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__HUUtilityDiscoverySetupViewController__checkTAF___block_invoke_113;
  v8[3] = &unk_1E63865B8;
  id v6 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v7 = v3;
  [v6 isTAFEnabledWithCompletionHandler:v8];
}

void __51__HUUtilityDiscoverySetupViewController__checkTAF___block_invoke_113(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    uint64_t v11 = "-[HUUtilityDiscoverySetupViewController _checkTAF:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: COMPLETION HANDLER  %s", (uint8_t *)&v8, 0x16u);
  }

  id v6 = *(void **)(a1 + 40);
  id v7 = [NSNumber numberWithBool:a2];
  [v6 finishWithResult:v7];
}

- (BOOL)needsToWaitForPreload
{
  return 1;
}

- (void)viewDidLoad
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v76.receiver = self;
  v76.super_class = (Class)HUUtilityDiscoverySetupViewController;
  [(OBBaseWelcomeController *)&v76 viewDidLoad];
  id v3 = [(HUUtilityDiscoverySetupViewController *)self headerView];
  id v4 = [v3 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v4 withIDDictionary:&unk_1F19B5CC8];

  if ([(HUUtilityDiscoverySetupViewController *)self errorFetchingUtilities])
  {
    uint64_t v5 = [(HUUtilityDiscoverySetupViewController *)self headerView];
    id v6 = _HULocalizedStringWithDefaultValue(@"HUUtilityOnboarding_CannotOnboard_Title", @"HUUtilityOnboarding_CannotOnboard_Title", 1);
    [v5 setTitle:v6];

    id v7 = [(HUUtilityDiscoverySetupViewController *)self headerView];
    int v8 = _HULocalizedStringWithDefaultValue(@"HUUtilityOnboarding_CannotOnboard_Detail", @"HUUtilityOnboarding_CannotOnboard_Detail", 1);
    [v7 setDetailText:v8];

    uint64_t v9 = [MEMORY[0x1E4F83A80] boldButton];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    __int16 v10 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
    [v9 setTitle:v10 forState:0];

    [v9 setAccessibilityIdentifier:@"Home.OnboardingView.Utility.SetUp.DoneButton"];
    [v9 addTarget:self action:sel__cancelUtilityOnboarding_ forControlEvents:64];
    uint64_t v11 = [(HUUtilityDiscoverySetupViewController *)self buttonTray];
    [v11 addButton:v9];

    uint64_t v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v79 = self;
      __int16 v80 = 2080;
      v81 = "-[HUUtilityDiscoverySetupViewController viewDidLoad]";
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%s: ERROR fetching utilities HUUtilityDiscoverySetupViewController. Presenting error view.", buf, 0x16u);
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F83A80] boldButton];
    [(HUUtilityDiscoverySetupViewController *)self setContinueOnboardingButton:v13];

    uint64_t v14 = [(HUUtilityDiscoverySetupViewController *)self continueOnboardingButton];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v15 = [(HUUtilityDiscoverySetupViewController *)self continueOnboardingButton];
    uint64_t v16 = _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
    [v15 setTitle:v16 forState:0];

    uint64_t v17 = [(HUUtilityDiscoverySetupViewController *)self continueOnboardingButton];
    [v17 setAccessibilityIdentifier:@"Home.OnboardingView.Utility.SetUp.ContinueButton"];

    __int16 v18 = [MEMORY[0x1E4F83AB8] linkButton];
    [(HUUtilityDiscoverySetupViewController *)self setAccountLoginButton:v18];

    __int16 v19 = [(HUUtilityDiscoverySetupViewController *)self accountLoginButton];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v20 = [(HUUtilityDiscoverySetupViewController *)self accountLoginButton];
    uint64_t v21 = _HULocalizedStringWithDefaultValue(@"HUUtilityOnboarding_AccountLogin_Button", @"HUUtilityOnboarding_AccountLogin_Button", 1);
    [v20 setTitle:v21 forState:0];

    int v22 = [(HUUtilityDiscoverySetupViewController *)self accountLoginButton];
    [v22 setAccessibilityIdentifier:@"Home.OnboardingView.Utility.SetUp.UseUtilityAccountButton"];

    v23 = [(HUUtilityDiscoverySetupViewController *)self continueOnboardingButton];
    [v23 addTarget:self action:sel__continueOnboarding_ forControlEvents:64];

    __int16 v24 = [(HUUtilityDiscoverySetupViewController *)self accountLoginButton];
    [v24 addTarget:self action:sel__loginWithAccount_ forControlEvents:64];

    v25 = [(HUUtilityDiscoverySetupViewController *)self buttonTray];
    __int16 v26 = [(HUUtilityDiscoverySetupViewController *)self continueOnboardingButton];
    [v25 addButton:v26];

    v27 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
    uint64_t v28 = [v27 allUtilities];
    v29 = [v28 objectAtIndexedSubscript:0];
    v30 = [v29 objectForKeyedSubscript:@"utilityID"];
    [(HUUtilityDiscoverySetupViewController *)self setSelectedUtilityID:v30];

    v31 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
    v32 = [v31 allUtilities];
    v33 = [v32 objectAtIndexedSubscript:0];
    [(HUUtilityDiscoverySetupViewController *)self setSelectedUtilityInfo:v33];

    [(HUUtilityDiscoverySetupViewController *)self _buttonAction];
    id v34 = objc_alloc(MEMORY[0x1E4F42E98]);
    v35 = (UITableView *)objc_msgSend(v34, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    providerSelectionTableView = self->_providerSelectionTableView;
    self->_providerSelectionTableView = v35;

    v37 = HFLogForCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = [(HUUtilityDiscoverySetupViewController *)self view];
      v39 = [(HUUtilityDiscoverySetupViewController *)self contentView];
      v40 = [(HUUtilityDiscoverySetupViewController *)self providerSelectionTableView];
      *(_DWORD *)buf = 138413314;
      v79 = self;
      __int16 v80 = 2080;
      v81 = "-[HUUtilityDiscoverySetupViewController viewDidLoad]";
      __int16 v82 = 2112;
      v83 = v38;
      __int16 v84 = 2112;
      v85 = v39;
      __int16 v86 = 2112;
      v87 = v40;
      _os_log_impl(&dword_1BE345000, v37, OS_LOG_TYPE_DEFAULT, "%@:%s: HUUtilityDiscoverySetupViewController\n self.view: %@\n self.contentView: %@\n self.tableView: %@", buf, 0x34u);
    }
    [(UITableView *)self->_providerSelectionTableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITableView *)self->_providerSelectionTableView setAllowsSelection:[(HUUtilityDiscoverySetupViewController *)self singleUtilityMode] ^ 1];
    [(UITableView *)self->_providerSelectionTableView setScrollEnabled:0];
    [(UITableView *)self->_providerSelectionTableView setDelegate:self];
    [(UITableView *)self->_providerSelectionTableView setDataSource:self];
    v41 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITableView *)self->_providerSelectionTableView setBackgroundColor:v41];

    [(UITableView *)self->_providerSelectionTableView registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];
    v42 = [(HUUtilityDiscoverySetupViewController *)self contentView];
    [v42 addSubview:self->_providerSelectionTableView];

    v43 = [(UITableView *)self->_providerSelectionTableView heightAnchor];
    v44 = [v43 constraintEqualToConstant:1.0];
    providerTableViewHeightConstraint = self->_providerTableViewHeightConstraint;
    self->_providerTableViewHeightConstraint = v44;

    v64 = (void *)MEMORY[0x1E4F28DC8];
    v75 = [(HUUtilityDiscoverySetupViewController *)self providerSelectionTableView];
    v73 = [v75 leadingAnchor];
    v74 = [(HUUtilityDiscoverySetupViewController *)self contentView];
    v72 = [v74 leadingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v77[0] = v71;
    v70 = [(HUUtilityDiscoverySetupViewController *)self providerSelectionTableView];
    v68 = [v70 trailingAnchor];
    v69 = [(HUUtilityDiscoverySetupViewController *)self contentView];
    v67 = [v69 trailingAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v77[1] = v66;
    v65 = [(HUUtilityDiscoverySetupViewController *)self providerSelectionTableView];
    v62 = [v65 topAnchor];
    v63 = [(HUUtilityDiscoverySetupViewController *)self contentView];
    v61 = [v63 topAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v77[2] = v60;
    v59 = [(HUUtilityDiscoverySetupViewController *)self providerSelectionTableView];
    v57 = [v59 bottomAnchor];
    v58 = [(HUUtilityDiscoverySetupViewController *)self contentView];
    v46 = [v58 bottomAnchor];
    v47 = [v57 constraintEqualToAnchor:v46];
    v77[3] = v47;
    v48 = [(HUUtilityDiscoverySetupViewController *)self providerSelectionTableView];
    v49 = [v48 centerXAnchor];
    v50 = [(HUUtilityDiscoverySetupViewController *)self contentView];
    v51 = [v50 centerXAnchor];
    v52 = [v49 constraintEqualToAnchor:v51];
    v77[4] = v52;
    v53 = [(HUUtilityDiscoverySetupViewController *)self providerTableViewHeightConstraint];
    v77[5] = v53;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:6];
    [v64 activateConstraints:v54];

    uint64_t v9 = [(HUUtilityDiscoverySetupViewController *)self contentView];
    [v9 setClipsToBounds:1];
  }

  v55 = HFLogForCategory();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v79 = self;
    __int16 v80 = 2080;
    v81 = "-[HUUtilityDiscoverySetupViewController viewDidLoad]";
    _os_log_impl(&dword_1BE345000, v55, OS_LOG_TYPE_DEFAULT, "%@:%s: presented: HUUtilityDiscoverySetupViewController", buf, 0x16u);
  }

  v56 = [(HUUtilityDiscoverySetupViewController *)self foundUtilities];
  +[HUHomeEnergyAnalyticsHelper sendUtilityIntroAndSelectionSheetViewEventWithNumOfUtilities:](HUHomeEnergyAnalyticsHelper, "sendUtilityIntroAndSelectionSheetViewEventWithNumOfUtilities:", [v56 count]);
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HUUtilityDiscoverySetupViewController;
  [(HUUtilityDiscoverySetupViewController *)&v4 viewWillLayoutSubviews];
  id v3 = [(HUUtilityDiscoverySetupViewController *)self view];
  [v3 setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
  id v3 = [(HUUtilityDiscoverySetupViewController *)self providerSelectionTableView];
  [v3 contentSize];
  double v5 = v4;
  id v6 = [(HUUtilityDiscoverySetupViewController *)self providerTableViewHeightConstraint];
  [v6 setConstant:v5];

  v7.receiver = self;
  v7.super_class = (Class)HUUtilityDiscoverySetupViewController;
  [(HUUtilityDiscoverySetupViewController *)&v7 updateViewConstraints];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [(HUUtilityDiscoverySetupViewController *)self view];
    id v6 = [(HUUtilityDiscoverySetupViewController *)self contentView];
    objc_super v7 = [(HUUtilityDiscoverySetupViewController *)self providerSelectionTableView];
    int v8 = 138413314;
    uint64_t v9 = self;
    __int16 v10 = 2080;
    uint64_t v11 = "-[HUUtilityDiscoverySetupViewController viewDidAppear:]";
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s: HUUtilityDiscoverySetupViewController\nself.view:%@\nself.contentView: %@\nself.tableView: %@", (uint8_t *)&v8, 0x34u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)HUUtilityDiscoverySetupViewController;
  [(HUUtilityDiscoverySetupViewController *)&v6 viewWillDisappear:a3];
  if ([(HUUtilityDiscoverySetupViewController *)self isMovingFromParentViewController])
  {
    double v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int v8 = self;
      __int16 v9 = 2080;
      __int16 v10 = "-[HUUtilityDiscoverySetupViewController viewWillDisappear:]";
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped BACK button", buf, 0x16u);
    }

    double v5 = [(HUUtilityDiscoverySetupViewController *)self delegate];
    [v5 viewControllerDidGoBack:self];
  }
}

- (void)_buttonAction
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v8 = self;
    __int16 v9 = 2080;
    __int16 v10 = "-[HUUtilityDiscoverySetupViewController _buttonAction]";
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s IN Menu action", buf, 0x16u);
  }

  double v4 = [(HUUtilityDiscoverySetupViewController *)self _fetchUtilityConfigAndCheckTAF];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HUUtilityDiscoverySetupViewController__buttonAction__block_invoke;
  v6[3] = &unk_1E638C210;
  v6[4] = self;
  id v5 = (id)[v4 addCompletionBlock:v6];
}

void __54__HUUtilityDiscoverySetupViewController__buttonAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = HFLogForCategory();
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v18;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "%@: completion error (%@)", buf, 0x16u);
    }

    __int16 v9 = [*(id *)(a1 + 32) delegate];
    uint64_t v10 = *(void *)(a1 + 32);
    __int16 v19 = @"HUUtilityDiscoveryOnboardingKey_UserInput";
    uint64_t v20 = &unk_1F19B4778;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    [v9 viewController:v10 didFinishWithConfigurationResults:v11];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v12;
      __int16 v23 = 1024;
      LODWORD(v24) = [v5 BOOLValue];
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: utility configuration fetched. TAF result %{BOOL}d", buf, 0x12u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setTafEnabledForSelectedUtility:", objc_msgSend(v5, "BOOLValue"));
    int v13 = [v5 BOOLValue];
    __int16 v9 = HFLogForCategory();
    BOOL v14 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v14)
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v15;
        _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@: Showing Login with Password button.", buf, 0xCu);
      }

      __int16 v9 = [*(id *)(a1 + 32) buttonTray];
      __int16 v16 = [*(id *)(a1 + 32) accountLoginButton];
      [v9 addButton:v16];
    }
    else if (v14)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v17;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@: Login with Password button NOT shown. Continue button will be used for OAuth.", buf, 0xCu);
    }
  }
}

- (void)_startOAuthLogin:(id)a3
{
  id v4 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 7;
  [(HUUtilityDiscoverySetupViewController *)self _showSpinner];
  id v5 = [_TtC6HomeUI17OAuthLoginManager alloc];
  id v6 = [(HUUtilityDiscoverySetupViewController *)self config];
  objc_super v7 = [v6 OAuthURL];
  int v8 = [(OAuthLoginManager *)v5 initWithAuthURL:v7 presentingContext:self];

  __int16 v9 = (void *)MEMORY[0x1E4F7A0D8];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke;
  v24[3] = &unk_1E6385D90;
  uint64_t v10 = v8;
  uint64_t v25 = v10;
  __int16 v26 = self;
  uint64_t v11 = [v9 futureWithBlock:v24];
  uint64_t v12 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  int v13 = [v11 reschedule:v12];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_179;
  v21[3] = &unk_1E638C288;
  v21[4] = self;
  __int16 v23 = v27;
  id v14 = v4;
  id v22 = v14;
  uint64_t v15 = [v13 flatMap:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_185;
  v18[3] = &unk_1E638C2B0;
  v18[4] = self;
  id v16 = v14;
  id v19 = v16;
  uint64_t v20 = v27;
  id v17 = (id)[v15 recover:v18];

  _Block_object_dispose(v27, 8);
}

void __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_2;
  v7[3] = &unk_1E638C238;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  [v5 startAuthenticationWithPresentationContext:v4 completion:v7];
}

void __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      id v14 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke_2";
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%s Found OAuth error", (uint8_t *)&v11, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    if (v8)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412802;
      uint64_t v12 = v10;
      __int16 v13 = 2080;
      id v14 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%s Found authCode: %@", (uint8_t *)&v11, 0x20u);
    }

    [*(id *)(a1 + 40) finishWithResult:v5];
  }
}

id __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_179(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F7A0D8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_2_180;
  v15[3] = &unk_1E6385D90;
  v15[4] = *(void *)(a1 + 32);
  id v16 = v3;
  id v5 = v3;
  id v6 = [v4 futureWithBlock:v15];
  objc_super v7 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  BOOL v8 = [v6 reschedule:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_182;
  v13[3] = &unk_1E638C260;
  v13[4] = *(void *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v14 = v12;
  uint64_t v10 = [v8 addSuccessBlock:v13];

  return v10;
}

void __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_2_180(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) continueOnboardingButton];
  [v4 setEnabled:0];

  id v5 = [*(id *)(a1 + 32) accountLoginButton];
  [v5 setEnabled:0];

  id v6 = [*(id *)(a1 + 32) onboardingContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_3;
  v9[3] = &unk_1E6385A20;
  uint64_t v7 = *(void *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v8 = v3;
  [v6 createAccessTokenWithAuthCode:v7 completionHandler:v9];
}

void __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(const char **)(a1 + 32);
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "%@: Error generating tokens %@", (uint8_t *)&v8, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 32);
      int v8 = 136315394;
      id v9 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%s(%@) ---: Generated tokens", (uint8_t *)&v8, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

void __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_182(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _hideSpinner];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  v2 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [*(id *)(a1 + 40) setObject:v2 forKeyedSubscript:@"HUUtilityDiscoveryOnboardingKey_UserInput"];

  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2080;
    __int16 v10 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@ Finished %s with results  %@", (uint8_t *)&v7, 0x20u);
  }

  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 viewController:*(void *)(a1 + 32) didFinishWithConfigurationResults:*(void *)(a1 + 40)];
}

id __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_185(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    int v20 = 138412546;
    uint64_t v21 = v18;
    __int16 v22 = 2112;
    __int16 v23 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "%@: Future failed (%@)", (uint8_t *)&v20, 0x16u);
  }

  [*(id *)(a1 + 32) _hideSpinner];
  uint64_t v5 = [v3 domain];
  if ([v5 isEqual:*MEMORY[0x1E4F18A90]])
  {
    uint64_t v6 = [v3 code];

    if (v6 == 1)
    {
      int v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v20 = 138412546;
        uint64_t v21 = v8;
        __int16 v22 = 2080;
        __int16 v23 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke";
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%s User canceled OAuth session", (uint8_t *)&v20, 0x16u);
      }

      __int16 v9 = [*(id *)(a1 + 32) continueOnboardingButton];
      [v9 setEnabled:1];

      __int16 v10 = [*(id *)(a1 + 32) accountLoginButton];
      [v10 setEnabled:1];
      goto LABEL_14;
    }
  }
  else
  {
  }
  __int16 v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    int v20 = 138412546;
    uint64_t v21 = v19;
    __int16 v22 = 2080;
    __int16 v23 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke";
    _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "%@:%s In failure block. Found error during OAuth session", (uint8_t *)&v20, 0x16u);
  }

  [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:@"HUUtilityDiscoveryOnboardingKey_Error"];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 7;
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:@"HUUtilityDiscoveryOnboardingKey_UserInput"];

  uint64_t v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    int v20 = 138412802;
    uint64_t v21 = v14;
    __int16 v22 = 2080;
    __int16 v23 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke";
    __int16 v24 = 2112;
    uint64_t v25 = v15;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@ Finished %s with results  %@", (uint8_t *)&v20, 0x20u);
  }

  __int16 v10 = [*(id *)(a1 + 32) delegate];
  [v10 viewController:*(void *)(a1 + 32) didFinishWithConfigurationResults:*(void *)(a1 + 40)];
LABEL_14:

  id v16 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v16;
}

- (void)_showSpinner
{
  id v8 = (id)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v8];
  uint64_t v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  uint64_t v5 = [(HUUtilityDiscoverySetupViewController *)self continueOnboardingButton];
  [v5 setEnabled:0];

  uint64_t v6 = [(HUUtilityDiscoverySetupViewController *)self accountLoginButton];
  [v6 setEnabled:0];

  int v7 = [(OBBaseWelcomeController *)self navigationItem];
  [v7 setHidesBackButton:1];

  [v8 startAnimating];
}

- (void)_hideSpinner
{
  objc_opt_class();
  id v3 = [(OBBaseWelcomeController *)self navigationItem];
  uint64_t v4 = [v3 rightBarButtonItem];
  uint64_t v5 = [v4 customView];
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v11 = v6;

  int v7 = [(OBBaseWelcomeController *)self navigationItem];
  [v7 setRightBarButtonItem:0];

  id v8 = [(HUUtilityDiscoverySetupViewController *)self continueOnboardingButton];
  [v8 setEnabled:1];

  __int16 v9 = [(HUUtilityDiscoverySetupViewController *)self accountLoginButton];
  [v9 setEnabled:1];

  __int16 v10 = [(OBBaseWelcomeController *)self navigationItem];
  [v10 setHidesBackButton:0];

  [v11 stopAnimating];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell"];
  id v8 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
  __int16 v9 = [v8 allUtilities];
  __int16 v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  id v11 = [v10 objectForKeyedSubscript:@"longName"];
  uint64_t v12 = [v10 objectForKeyedSubscript:@"name"];
  uint64_t v13 = [v7 defaultContentConfiguration];
  [v13 setText:v12];
  if (([v12 isEqualToString:v11] & 1) == 0)
  {
    [v13 setSecondaryText:v11];
    uint64_t v14 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    uint64_t v15 = [v13 secondaryTextProperties];
    [v15 setColor:v14];
  }
  objc_opt_class();
  id v16 = [v10 objectForKeyedSubscript:@"logo"];
  if (objc_opt_isKindOfClass()) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  if (v18)
  {
    [v13 setImage:v18];
    uint64_t v19 = [v13 image];
    [v19 setAccessibilityIdentifier:@"Home.OnboardingView.Utility.Logo"];

    int v20 = [v13 imageProperties];
    objc_msgSend(v20, "setMaximumSize:", 37.0, 37.0);

    uint64_t v21 = [v13 imageProperties];
    [v21 setCornerRadius:8.325];

    double v22 = *MEMORY[0x1E4F43BA0];
    __int16 v23 = [v13 imageProperties];
    objc_msgSend(v23, "setReservedLayoutSize:", 37.0, v22);
  }
  [v7 setContentConfiguration:v13];
  __int16 v24 = HFLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    uint64_t v28 = self;
    _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "%@ Finished set up of cell", (uint8_t *)&v27, 0xCu);
  }

  uint64_t v25 = [MEMORY[0x1E4F428B8] tertiarySystemFillColor];
  [v7 setBackgroundColor:v25];

  if (!self->_singleUtilityMode && ![v6 row]) {
    [v7 setAccessoryType:3];
  }
  [v7 setAccessibilityIdentifier:@"Home.OnboardingView.Utility.Setup.Cell"];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
  uint64_t v5 = [v4 allUtilities];
  int64_t v6 = [v5 count];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = self;
    __int16 v33 = 2080;
    id v34 = "-[HUUtilityDiscoverySetupViewController tableView:didSelectRowAtIndexPath:]";
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s SELECTED ROW", buf, 0x16u);
  }

  uint64_t v25 = [v6 cellForRowAtIndexPath:v7];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  __int16 v9 = [v6 indexPathsForVisibleRows];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
        objc_opt_class();
        uint64_t v15 = [v6 cellForRowAtIndexPath:v14];
        if (objc_opt_isKindOfClass()) {
          id v16 = v15;
        }
        else {
          id v16 = 0;
        }
        id v17 = v16;

        [v17 setAccessoryType:0];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  [v25 setAccessoryType:3];
  id v18 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
  uint64_t v19 = [v18 allUtilities];
  int v20 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  uint64_t v21 = [v20 objectForKeyedSubscript:@"utilityID"];
  [(HUUtilityDiscoverySetupViewController *)self setSelectedUtilityID:v21];

  double v22 = [(HUUtilityDiscoverySetupViewController *)self onboardingContext];
  __int16 v23 = [v22 allUtilities];
  __int16 v24 = objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  [(HUUtilityDiscoverySetupViewController *)self setSelectedUtilityInfo:v24];

  [(HUUtilityDiscoverySetupViewController *)self _buttonAction];
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v3 = [(HUUtilityDiscoverySetupViewController *)self view];
  uint64_t v4 = [v3 window];

  return v4;
}

- (HUConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (_TtC6HomeUI24UtilityOnboardingContext)onboardingContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_onboardingContext);

  return (_TtC6HomeUI24UtilityOnboardingContext *)WeakRetained;
}

- (void)setOnboardingContext:(id)a3
{
}

- (OBBoldTrayButton)continueOnboardingButton
{
  return self->_continueOnboardingButton;
}

- (void)setContinueOnboardingButton:(id)a3
{
}

- (OBLinkTrayButton)accountLoginButton
{
  return self->_accountLoginButton;
}

- (void)setAccountLoginButton:(id)a3
{
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UITableView)providerSelectionTableView
{
  return self->_providerSelectionTableView;
}

- (void)setProviderSelectionTableView:(id)a3
{
}

- (NSLayoutConstraint)providerTableViewHeightConstraint
{
  return self->_providerTableViewHeightConstraint;
}

- (void)setProviderTableViewHeightConstraint:(id)a3
{
}

- (HUUtilityConfigurationHelper)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (NSArray)foundUtilities
{
  return self->_foundUtilities;
}

- (void)setFoundUtilities:(id)a3
{
}

- (NSString)selectedUtilityID
{
  return self->_selectedUtilityID;
}

- (void)setSelectedUtilityID:(id)a3
{
}

- (NSDictionary)selectedUtilityInfo
{
  return self->_selectedUtilityInfo;
}

- (void)setSelectedUtilityInfo:(id)a3
{
}

- (NSArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
}

- (BOOL)tafEnabledForSelectedUtility
{
  return self->_tafEnabledForSelectedUtility;
}

- (void)setTafEnabledForSelectedUtility:(BOOL)a3
{
  self->_tafEnabledForSelectedUtility = a3;
}

- (BOOL)errorFetchingUtilities
{
  return self->_errorFetchingUtilities;
}

- (void)setErrorFetchingUtilities:(BOOL)a3
{
  self->_errorFetchingUtilities = a3;
}

- (BOOL)singleUtilityMode
{
  return self->_singleUtilityMode;
}

- (void)setSingleUtilityMode:(BOOL)a3
{
  self->_singleUtilityMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_selectedUtilityInfo, 0);
  objc_storeStrong((id *)&self->_selectedUtilityID, 0);
  objc_storeStrong((id *)&self->_foundUtilities, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_providerTableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_providerSelectionTableView, 0);
  objc_storeStrong((id *)&self->_accountLoginButton, 0);
  objc_storeStrong((id *)&self->_continueOnboardingButton, 0);
  objc_destroyWeak((id *)&self->_onboardingContext);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end