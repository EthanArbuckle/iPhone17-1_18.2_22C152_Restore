@interface HUNaturalLightingSetupViewController
+ (id)moduleControllerInHome:(id)a3;
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUNaturalLightingSetupModule)module;
- (HUNaturalLightingSetupViewController)initWithHome:(id)a3;
- (OBTrayButton)useWithLightsButton;
- (id)_markAllAccessoriesAsOnboarded;
- (id)hu_preloadContent;
- (void)_activateNaturalLighting:(id)a3;
- (void)_doNotActivateNaturalLighting:(id)a3;
- (void)_updateButtonWithNumberOfLightsSelected:(unint64_t)a3;
- (void)naturalLanguageSetupModule:(id)a3 didUpdateSelectedItems:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setModule:(id)a3;
- (void)setUseWithLightsButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUNaturalLightingSetupViewController

- (HUNaturalLightingSetupViewController)initWithHome:(id)a3
{
  id v5 = a3;
  v6 = _HULocalizedStringWithDefaultValue(@"HUNaturalLigthingSetup_Title", @"HUNaturalLigthingSetup_Title", 1);
  v7 = _HULocalizedStringWithDefaultValue(@"HUNaturalLightingSetup_Detail", @"HUNaturalLightingSetup_Detail", 1);
  v8 = +[HUNaturalLightingSetupViewController moduleControllerInHome:v5];
  v12.receiver = self;
  v12.super_class = (Class)HUNaturalLightingSetupViewController;
  v9 = [(HUItemTableOBWelcomeController *)&v12 initWithTitle:v6 detailText:v7 icon:0 contentLayout:2 itemTableViewController:v8];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_home, a3);
  }

  return v10;
}

- (id)hu_preloadContent
{
  v3 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  v4 = objc_msgSend(v3, "hu_preloadContent");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HUNaturalLightingSetupViewController_hu_preloadContent__block_invoke;
  v7[3] = &unk_1E638E118;
  v7[4] = self;
  id v5 = [v4 flatMap:v7];

  return v5;
}

uint64_t __57__HUNaturalLightingSetupViewController_hu_preloadContent__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) itemTableViewController];
  v3 = [v2 itemManager];
  v4 = [v3 itemModules];
  id v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_180);
  [*(id *)(a1 + 32) setModule:v5];

  v6 = *(void **)(a1 + 32);
  v7 = [v6 module];
  [v7 setDelegate:v6];

  v8 = (void *)MEMORY[0x1E4F7A0D8];

  return [v8 futureWithNoResult];
}

uint64_t __57__HUNaturalLightingSetupViewController_hu_preloadContent__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)naturalLanguageSetupModule:(id)a3 didUpdateSelectedItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__HUNaturalLightingSetupViewController_naturalLanguageSetupModule_didUpdateSelectedItems___block_invoke;
  v10[3] = &unk_1E63882F0;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 performBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __90__HUNaturalLightingSetupViewController_naturalLanguageSetupModule_didUpdateSelectedItems___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained itemTableViewController];
  v3 = [v2 itemManager];
  v4 = [v3 allDisplayedItems];
  id v5 = objc_msgSend(v4, "na_setByIntersectingWithSet:", *(void *)(a1 + 32));

  objc_msgSend(WeakRetained, "_updateButtonWithNumberOfLightsSelected:", objc_msgSend(v5, "count"));
}

- (void)_activateNaturalLighting:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v9 = (HUNaturalLightingSetupViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v9;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: Setting Up Natural Lighting", buf, 0xCu);
  }
  v10 = [(HUNaturalLightingSetupViewController *)self useWithLightsButton];
  id v11 = [v10 activityIndicator];
  [v11 startAnimating];

  [v5 setEnabled:0];
  id v12 = [(HUNaturalLightingSetupViewController *)self module];
  v13 = [v12 commitSelectedItems];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__HUNaturalLightingSetupViewController__activateNaturalLighting___block_invoke;
  v20[3] = &unk_1E6387DC8;
  v20[4] = self;
  v14 = [v13 addSuccessBlock:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__HUNaturalLightingSetupViewController__activateNaturalLighting___block_invoke_13;
  v17[3] = &unk_1E6385A20;
  id v18 = v5;
  v19 = self;
  id v15 = v5;
  id v16 = (id)[v14 addFailureBlock:v17];
}

void __65__HUNaturalLightingSetupViewController__activateNaturalLighting___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = (id)[*(id *)(a1 + 32) _markAllAccessoriesAsOnboarded];
  v3 = [*(id *)(a1 + 32) useWithLightsButton];
  v4 = [v3 activityIndicator];
  [v4 stopAnimating];

  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v6 = *(void *)(a1 + 32);
  v8 = @"HUNaturalLightingOnboardingKey_UserInput";
  v9[0] = &unk_1F19B4A30;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v5 viewController:v6 didFinishWithConfigurationResults:v7];
}

void __65__HUNaturalLightingSetupViewController__activateNaturalLighting___block_invoke_13(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setEnabled:1];
  id v5 = [*(id *)(a1 + 40) useWithLightsButton];
  uint64_t v6 = [v5 activityIndicator];
  [v6 stopAnimating];

  id v7 = [MEMORY[0x1E4F69110] sharedHandler];
  [v7 handleError:v4];
}

- (void)_doNotActivateNaturalLighting:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  id v7 = [(HUNaturalLightingSetupViewController *)self _markAllAccessoriesAsOnboarded];
  v8 = [(HUNaturalLightingSetupViewController *)self delegate];
  v10 = @"HUNaturalLightingOnboardingKey_UserInput";
  id v11 = &unk_1F19B4A48;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v8 viewController:self didFinishWithConfigurationResults:v9];
}

- (void)viewDidLoad
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)HUNaturalLightingSetupViewController;
  [(HUItemTableOBWelcomeController *)&v19 viewDidLoad];
  id v4 = [(HUNaturalLightingSetupViewController *)self headerView];
  id v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5DB8];

  uint64_t v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUNaturalLightingSetupViewController *)self setUseWithLightsButton:v6];

  id v7 = [(HUNaturalLightingSetupViewController *)self useWithLightsButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(HUNaturalLightingSetupViewController *)self useWithLightsButton];
  [v8 addTarget:self action:sel__activateNaturalLighting_ forControlEvents:64];

  id v9 = [(HUNaturalLightingSetupViewController *)self useWithLightsButton];
  [v9 setAccessibilityIdentifier:@"Home.OnboardingView.NaturalLighting.SetUp.UseWithLightsButton"];

  v10 = [(HUNaturalLightingSetupViewController *)self buttonTray];
  id v11 = [(HUNaturalLightingSetupViewController *)self useWithLightsButton];
  [v10 addButton:v11];

  id v12 = [(HUNaturalLightingSetupViewController *)self module];
  v13 = [v12 selectedItems];
  -[HUNaturalLightingSetupViewController _updateButtonWithNumberOfLightsSelected:](self, "_updateButtonWithNumberOfLightsSelected:", [v13 count]);

  __int16 v14 = [MEMORY[0x1E4F83AB8] linkButton];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v15 = _HULocalizedStringWithDefaultValue(@"HUNaturalLightingTitle_NotNowButton", @"HUNaturalLightingTitle_NotNowButton", 1);
  [v14 setTitle:v15 forState:0];

  [v14 setAccessibilityIdentifier:@"Home.OnboardingView.NaturalLighting.SetUp.NotNowButton"];
  [v14 addTarget:self action:sel__doNotActivateNaturalLighting_ forControlEvents:64];
  uint64_t v16 = [(HUNaturalLightingSetupViewController *)self buttonTray];
  [v16 addButton:v14];

  [(HUNaturalLightingSetupViewController *)self setModalInPresentation:1];
  v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v21 = self;
    __int16 v22 = 2112;
    __int16 v23 = v18;
    _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: NLSVC", buf, 0x16u);
  }
}

- (void)_updateButtonWithNumberOfLightsSelected:(unint64_t)a3
{
  HULocalizedStringWithFormat(@"HUNaturalLightingSetup_UseLightsButton", @"%lu", a3, v3, v4, v5, v6, v7, a3);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUNaturalLightingSetup_UseLightsButtonSingular", @"HUNaturalLightingSetup_UseLightsButtonSingular", 1);

    id v13 = (id)v10;
  }
  id v11 = [(HUNaturalLightingSetupViewController *)self useWithLightsButton];
  [v11 setTitle:v13 forState:0];

  id v12 = [(HUNaturalLightingSetupViewController *)self useWithLightsButton];
  [v12 setEnabled:a3 != 0];
}

- (id)_markAllAccessoriesAsOnboarded
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke;
  v6[3] = &unk_1E6385108;
  v6[4] = self;
  uint64_t v3 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
  uint64_t v4 = [v2 futureWithBlock:v6 scheduler:v3];

  return v4;
}

void __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) module];
  uint64_t v5 = [v4 allItems];
  uint64_t v6 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_60_2);

  uint64_t v7 = (void *)MEMORY[0x1E4F7A0D8];
  v8 = [v6 allObjects];
  id v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_111);
  uint64_t v10 = [v7 combineAllFutures:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke_5;
  v13[3] = &unk_1E63850B8;
  id v14 = v3;
  id v11 = v3;
  id v12 = (id)[v10 addCompletionBlock:v13];
}

id __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F19E4798]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v6 = [v4 homeKitObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v8 = [v4 homeKitObject];
  if (isKindOfClass)
  {
    [v5 addObject:v8];
  }
  else
  {
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) == 0) {
      goto LABEL_9;
    }
    v8 = [v4 homeKitObject];
    uint64_t v10 = [v8 accessory];
    [v5 addObject:v10];
  }
LABEL_9:

  return v5;
}

id __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke_4;
  v7[3] = &unk_1E6385090;
  id v8 = v2;
  id v4 = v2;
  uint64_t v5 = [v3 futureWithErrorOnlyHandlerAdapterBlock:v7];

  return v5;
}

uint64_t __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setHasOnboardedForNaturalLightingWithCompletion:a2];
}

uint64_t __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

+ (id)moduleControllerInHome:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [HUSimpleItemModuleTableViewController alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__HUNaturalLightingSetupViewController_moduleControllerInHome___block_invoke;
  v11[3] = &unk_1E6387A08;
  id v12 = v5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HUNaturalLightingSetupViewController_moduleControllerInHome___block_invoke_4;
  v10[3] = &__block_descriptor_48_e46___HUItemModuleController_16__0__HFItemModule_8l;
  void v10[4] = a2;
  v10[5] = a1;
  id v7 = v5;
  id v8 = [(HUSimpleItemModuleTableViewController *)v6 initWithTableViewStyle:1 moduleCreator:v11 moduleControllerBuilder:v10];

  return v8;
}

id __63__HUNaturalLightingSetupViewController_moduleControllerInHome___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[HUNaturalLightingSetupModule alloc] initWithHome:*(void *)(a1 + 32) itemUpdater:v4];

  [(HUNaturalLightingSetupModule *)v5 setDefaultSelectedValue:MEMORY[0x1E4F1CC38]];
  [(HUNaturalLightingSetupModule *)v5 setFilter:&__block_literal_global_118_1];
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

uint64_t __63__HUNaturalLightingSetupViewController_moduleControllerInHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (HFForceNaturalLightingOnboarding())
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = [v2 services];
    uint64_t v3 = objc_msgSend(v4, "na_any:", &__block_literal_global_121_1);
  }
  return v3;
}

uint64_t __63__HUNaturalLightingSetupViewController_moduleControllerInHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 accessory];
  uint64_t v3 = [v2 hasOnboardedForNaturalLighting] ^ 1;

  return v3;
}

HUNaturalLightingSetupModuleController *__63__HUNaturalLightingSetupViewController_moduleControllerInHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[HUNaturalLightingSetupModuleController alloc] initWithModule:v3];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"HUNaturalLightingSetupViewController.m", 206, @"HUNaturalLightingSetupViewController was given unknown item module: %@", v3 object file lineNumber description];

    id v4 = 0;
  }

  return v4;
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

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (OBTrayButton)useWithLightsButton
{
  return self->_useWithLightsButton;
}

- (void)setUseWithLightsButton:(id)a3
{
}

- (HUNaturalLightingSetupModule)module
{
  return self->_module;
}

- (void)setModule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_module, 0);
  objc_storeStrong((id *)&self->_useWithLightsButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end