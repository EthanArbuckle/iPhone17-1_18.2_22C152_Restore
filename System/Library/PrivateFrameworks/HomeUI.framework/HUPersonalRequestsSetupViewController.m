@interface HUPersonalRequestsSetupViewController
+ (id)_bulletImageWithSystemName:(id)a3 color:(id)a4;
- (BOOL)_allPersonalRequestsDevicesSupportVoiceRecognition;
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HULocationDevice)locationDevice;
- (HUPersonalRequestsDevicesModuleController)prDevicesModuleController;
- (HUPersonalRequestsEditorItemManager)prEditorItemManager;
- (HUPersonalRequestsSetupViewController)initWithHome:(id)a3;
- (HUPersonalRequestsSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (HUPersonalRequestsSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (NSArray)supportedVoiceRecognitionLanguages;
- (OBLinkTrayButton)customizeButton;
- (OBTrayButton)usePRButton;
- (id)hu_preloadContent;
- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4;
- (unint64_t)_numberOfDevicesSupportingVR;
- (void)_customizePersonalRequests:(id)a3;
- (void)_dontUsePersonalRequests:(id)a3;
- (void)_setupPersonalRequestsItemInfrastructure;
- (void)_turnOnAllPersonalRequests:(id)a3;
- (void)setCustomizeButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setLocationDevice:(id)a3;
- (void)setPrDevicesModuleController:(id)a3;
- (void)setPrEditorItemManager:(id)a3;
- (void)setSupportedVoiceRecognitionLanguages:(id)a3;
- (void)setUsePRButton:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUPersonalRequestsSetupViewController

- (HUPersonalRequestsSetupViewController)initWithHome:(id)a3
{
  id v5 = a3;
  v6 = _HULocalizedStringWithDefaultValue(@"HUPersonalRequestsSetup_Title", @"HUPersonalRequestsSetup_Title", 1);
  v9.receiver = self;
  v9.super_class = (Class)HUPersonalRequestsSetupViewController;
  v7 = [(HUPersonalRequestsSetupViewController *)&v9 initWithTitle:v6 detailText:0 icon:0 contentLayout:2];

  if (v7) {
    objc_storeStrong((id *)&v7->_home, a3);
  }

  return v7;
}

- (HUPersonalRequestsSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  objc_super v9 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPersonalRequestsSetupViewController.m", 61, @"%s is unavailable; use %@ instead",
    "-[HUPersonalRequestsSetupViewController initWithTitle:detailText:symbolName:contentLayout:]",
    v9);

  return 0;
}

- (HUPersonalRequestsSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  objc_super v9 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPersonalRequestsSetupViewController.m", 66, @"%s is unavailable; use %@ instead",
    "-[HUPersonalRequestsSetupViewController initWithTitle:detailText:icon:contentLayout:]",
    v9);

  return 0;
}

+ (id)_bulletImageWithSystemName:(id)a3 color:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F42A80];
  v6 = (void *)MEMORY[0x1E4F428B8];
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [v6 systemWhiteColor];
  v10 = [MEMORY[0x1E4F42A98] configurationWithPointSize:22.0];
  v11 = objc_msgSend(v5, "hu_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:", v8, v7, v9, v10, 40.0, 40.0, 10.0);

  return v11;
}

- (void)_setupPersonalRequestsItemInfrastructure
{
  id v4 = objc_alloc(MEMORY[0x1E4F69710]);
  id v5 = [(HUPersonalRequestsSetupViewController *)self home];
  v6 = [(HUPersonalRequestsSetupViewController *)self home];
  id v7 = [v6 currentUser];
  id v15 = (id)[v4 initWithHome:v5 user:v7 nameStyle:0];

  id v8 = [[HUPersonalRequestsEditorItemManager alloc] initWithDelegate:self userItem:v15 onlyShowDeviceSwitches:0];
  [(HUPersonalRequestsSetupViewController *)self setPrEditorItemManager:v8];

  objc_super v9 = [HUPersonalRequestsDevicesModuleController alloc];
  v10 = [(HUPersonalRequestsSetupViewController *)self prEditorItemManager];
  v11 = [v10 prDevicesModule];
  v12 = [(HUPersonalRequestsDevicesModuleController *)v9 initWithModule:v11 host:self];
  [(HUPersonalRequestsSetupViewController *)self setPrDevicesModuleController:v12];

  v13 = [(HUPersonalRequestsSetupViewController *)self prEditorItemManager];
  id v14 = (id)[v13 reloadAndUpdateAllItemsFromSenderSelector:a2];
}

- (void)_customizePersonalRequests:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  id v7 = [(HUPersonalRequestsSetupViewController *)self delegate];
  id v8 = [(HUPersonalRequestsSetupViewController *)self locationDevice];
  v11[1] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:2];
  [v7 viewController:self didFinishWithConfigurationResults:v9];
}

- (void)_dontUsePersonalRequests:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v8 = (HUPersonalRequestsSetupViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: Turning off all Personal Requests devices", buf, 0xCu);
  }
  objc_super v9 = [(HUPersonalRequestsSetupViewController *)self prDevicesModuleController];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = (id)[v9 setPersonalRequestsDevices:v10];

  v12 = [(HUPersonalRequestsSetupViewController *)self delegate];
  __int16 v14 = @"HUPersonalRequestsOnboardingKey_UserInput";
  id v15 = &unk_1F19B3C80;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v12 viewController:self didFinishWithConfigurationResults:v13];
}

- (void)_turnOnAllPersonalRequests:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    __int16 v18 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    objc_super v9 = (HUPersonalRequestsSetupViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v9;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: Turning on Personal Requests for all multi-user capable devices", buf, 0xCu);
  }
  uint64_t v10 = [(HUPersonalRequestsSetupViewController *)self prDevicesModuleController];
  id v11 = [v10 turnOnPersonalRequestsForAllMultiUserCapableDevices];

  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__HUPersonalRequestsSetupViewController__turnOnAllPersonalRequests___block_invoke;
  v13[3] = &unk_1E63874A0;
  objc_copyWeak(&v14, (id *)buf);
  id v12 = (id)[v11 addSuccessBlock:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __68__HUPersonalRequestsSetupViewController__turnOnAllPersonalRequests___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v4 = @"HUPersonalRequestsOnboardingKey_UserInput";
  v5[0] = &unk_1F19B3C98;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 viewController:WeakRetained didFinishWithConfigurationResults:v3];
}

- (BOOL)_allPersonalRequestsDevicesSupportVoiceRecognition
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [(HUPersonalRequestsSetupViewController *)self home];
  uint64_t v5 = objc_msgSend(v4, "hf_numberOfHomePods");

  v6 = [(HUPersonalRequestsSetupViewController *)self home];
  id v7 = objc_msgSend(v6, "hf_siriEndPointAccessories");
  uint64_t v8 = [v7 count] + v5;

  unint64_t v9 = [(HUPersonalRequestsSetupViewController *)self _numberOfDevicesSupportingVR];
  if (v9 != v8)
  {
    uint64_t v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromSelector(a2);
      int v13 = 138412546;
      id v14 = self;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: NO: Not all HomePods and Siri endpoints are on the supported Voice Recognition language", (uint8_t *)&v13, 0x16u);
    }
  }
  return v9 == v8;
}

- (unint64_t)_numberOfDevicesSupportingVR
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = [(HUPersonalRequestsSetupViewController *)self home];
  uint64_t v5 = objc_msgSend(v4, "hf_homePods");
  char v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_42);

  id v7 = [(HUPersonalRequestsSetupViewController *)self home];
  uint64_t v8 = objc_msgSend(v7, "hf_siriEndPointAccessories");
  int v9 = objc_msgSend(v8, "na_any:", &__block_literal_global_25);

  if ((v6 & 1) != 0 || v9)
  {
    __int16 v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = NSStringFromSelector(a2);
      int v20 = 138412546;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@: NO: Some HomePods do NOT support voice recognition", (uint8_t *)&v20, 0x16u);
    }
    return 0;
  }
  else
  {
    uint64_t v10 = [(HUPersonalRequestsSetupViewController *)self home];
    id v11 = [(HUPersonalRequestsSetupViewController *)self supportedVoiceRecognitionLanguages];
    id v12 = +[HUHomeFeatureOnboardingUtilities home:v10 createMultiUserLanguageToHomePodsMapping:v11];

    int v13 = [MEMORY[0x1E4F4E538] sharedPreferences];
    id v14 = [v13 languageCode];

    __int16 v15 = [v12 objectForKeyedSubscript:v14];
    unint64_t v16 = [v15 count];

    return v16;
  }
}

uint64_t __69__HUPersonalRequestsSetupViewController__numberOfDevicesSupportingVR__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsMultiUser] ^ 1;
}

uint64_t __69__HUPersonalRequestsSetupViewController__numberOfDevicesSupportingVR__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 supportsMultiUser] ^ 1;
}

- (id)hu_preloadContent
{
  id v4 = [(HUPersonalRequestsSetupViewController *)self home];
  if (objc_msgSend(v4, "hf_atleastOneMediaAccessorySupportingJustSiri"))
  {
    uint64_t v5 = [(HUPersonalRequestsSetupViewController *)self home];
    if ([v5 siriPhraseOptions] == 2)
    {
      BOOL v6 = 1;
    }
    else
    {
      id v7 = [(HUPersonalRequestsSetupViewController *)self home];
      BOOL v6 = [v7 siriPhraseOptions] == 3;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  uint64_t v8 = HUSiriLocalizedString(@"HUPersonalRequestsSetup_CalendarBulletText");
  int v9 = objc_opt_class();
  uint64_t v10 = [MEMORY[0x1E4F428B8] systemRedColor];
  id v11 = [v9 _bulletImageWithSystemName:@"calendar" color:v10];
  [(HUPersonalRequestsSetupViewController *)self addBulletedListItemWithTitle:&stru_1F18F92B8 description:v8 image:v11];

  id v12 = HUSiriLocalizedString(@"HUPersonalRequestsSetup_MessagesBulletText_HEY_SIRI");
  if (v6)
  {
    uint64_t v13 = HUSiriLocalizedString(@"HUPersonalRequestsSetup_MessagesBulletText_JUST_SIRI");

    id v12 = (void *)v13;
  }
  id v14 = objc_opt_class();
  __int16 v15 = [MEMORY[0x1E4F428B8] systemGreenColor];
  unint64_t v16 = [v14 _bulletImageWithSystemName:@"message.fill" color:v15];
  [(HUPersonalRequestsSetupViewController *)self addBulletedListItemWithTitle:&stru_1F18F92B8 description:v12 image:v16];

  uint64_t v17 = HUSiriLocalizedString(@"HUPersonalRequestsSetup_RemindersBulletText");
  __int16 v18 = objc_opt_class();
  uint64_t v19 = [MEMORY[0x1E4F428B8] systemYellowColor];
  int v20 = [v18 _bulletImageWithSystemName:@"list.bullet" color:v19];
  [(HUPersonalRequestsSetupViewController *)self addBulletedListItemWithTitle:&stru_1F18F92B8 description:v17 image:v20];

  v21 = HUSiriLocalizedString(@"HUPersonalRequestsSetup_PersonalUpdateBulletText_HEY_SIRI");
  if (v6)
  {
    uint64_t v22 = HUSiriLocalizedString(@"HUPersonalRequestsSetup_PersonalUpdateBulletText_JUST_SIRI");

    v21 = (void *)v22;
  }
  v23 = objc_opt_class();
  uint64_t v24 = [MEMORY[0x1E4F428B8] systemIndigoColor];
  v25 = [v23 _bulletImageWithSystemName:@"heart.text.square.fill" color:v24];
  [(HUPersonalRequestsSetupViewController *)self addBulletedListItemWithTitle:&stru_1F18F92B8 description:v21 image:v25];

  objc_initWeak(location, self);
  v26 = [MEMORY[0x1E4F7A0D8] futureWithCompletionHandlerAdapterBlock:&__block_literal_global_64];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_2;
  v34[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v34[4] = a2;
  id v27 = (id)[v26 addFailureBlock:v34];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_66;
  v33[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v33[4] = a2;
  id v28 = (id)[v26 addSuccessBlock:v33];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_69;
  v31[3] = &unk_1E63876A0;
  objc_copyWeak(v32, location);
  v32[1] = (id)a2;
  v29 = [v26 flatMap:v31];
  objc_destroyWeak(v32);

  objc_destroyWeak(location);

  return v29;
}

uint64_t __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguagesWithCompletion:a2];
}

void __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages %@", (uint8_t *)&v6, 0x16u);
  }
}

void __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_66(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@ fetchSupportedVoiceRecognitionLanguagesWithCompletion returned %@", (uint8_t *)&v6, 0x16u);
  }
}

id __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSupportedVoiceRecognitionLanguages:v3];
  uint64_t v5 = +[HULocationDeviceManager sharedInstance];
  int v6 = [v5 activeLocationDeviceFuture];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_2_71;
  v12[3] = &unk_1E6387650;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v7 = [v6 flatMap:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_3;
  v11[3] = &unk_1E6387678;
  uint64_t v8 = *(void *)(a1 + 40);
  v11[4] = WeakRetained;
  v11[5] = v8;
  id v9 = [v7 recover:v11];

  objc_destroyWeak(&v13);

  return v9;
}

id __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_2_71(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setLocationDevice:v3];

  uint64_t v5 = [WeakRetained locationDevice];
  int v6 = [v5 name];
  id v13 = HULocalizedStringWithFormat(@"HUPersonalRequestsSetup_Detail", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);

  id v14 = [WeakRetained locationDevice];
  __int16 v15 = [v14 name];
  uint64_t v22 = HULocalizedStringWithFormat(@"HUPersonalRequestsSetup_Detail", @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);

  v23 = [WeakRetained home];
  uint64_t v24 = objc_msgSend(v23, "hf_numberOfHomePods");

  v25 = [WeakRetained home];
  v26 = objc_msgSend(v25, "hf_siriEndPointAccessories");
  unint64_t v27 = [v26 count] + v24;

  int v28 = [WeakRetained _allPersonalRequestsDevicesSupportVoiceRecognition];
  if (v27 >= 2 && [WeakRetained _numberOfDevicesSupportingVR])
  {
    if (v28)
    {
      v29 = _HULocalizedStringWithDefaultValue(@"HUPersonalRequestsSetup_UsePersonalRequests_EveryHomePod_Button", @"HUPersonalRequestsSetup_UsePersonalRequests_EveryHomePod_Button", 1);
      v30 = _HULocalizedStringWithDefaultValue(@"HUPersonalRequestsSetup_UsePersonalRequests_EveryAccessory_Button", @"HUPersonalRequestsSetup_UsePersonalRequests_EveryAccessory_Button", 1);
    }
    else
    {
      v39 = _HULocalizedStringWithDefaultValue(@"HUPersonalRequestsSetup_UsePersonalRequests_EverySupportedHomePod_Button", @"HUPersonalRequestsSetup_UsePersonalRequests_EverySupportedHomePod_Button", 1);
      v30 = _HULocalizedStringWithDefaultValue(@"HUPersonalRequestsSetup_UsePersonalRequests_EverySupportedAccessory_Button", @"HUPersonalRequestsSetup_UsePersonalRequests_EverySupportedAccessory_Button", 1);

      v40 = [WeakRetained locationDevice];
      v41 = [v40 name];
      v42 = [WeakRetained locationDevice];
      v43 = [v42 name];
      v50 = HULocalizedStringWithFormat(@"HUPersonalRequestsSetup_Detail_WithSomeUnsupportedHomePods", @"%@%@", v44, v45, v46, v47, v48, v49, (uint64_t)v41);

      v29 = [WeakRetained locationDevice];
      v51 = [v29 name];
      v52 = [WeakRetained locationDevice];
      v64 = [v52 name];
      uint64_t v22 = HULocalizedStringWithFormat(@"HUPersonalRequestsSetup_Detail_WithSomeUnsupportedSiriEnabledAccessories", @"%@%@", v53, v54, v55, v56, v57, v58, (uint64_t)v51);
    }
    v31 = [WeakRetained usePRButton];
    [v31 setTitle:v30 forState:0];
  }
  else
  {
    if (v28) {
      goto LABEL_10;
    }
    v30 = [WeakRetained locationDevice];
    v31 = [v30 name];
    uint64_t v38 = HULocalizedStringWithFormat(@"HUPersonalRequestsSetup_Detail_UnsupportedLocale", @"%@", v32, v33, v34, v35, v36, v37, (uint64_t)v31);

    uint64_t v22 = (void *)v38;
  }

LABEL_10:
  v59 = [WeakRetained headerView];
  [v59 setDetailText:v22];

  v60 = [WeakRetained buttonTray];
  v61 = _HULocalizedStringWithDefaultValue(@"HUPersonalRequestsSetup_FinePrint", @"HUPersonalRequestsSetup_FinePrint", 1);
  [v60 setCaptionText:v61];

  v62 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v62;
}

id __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "%@:%@ Location Device future failed with %@", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v5;
}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  return [(UIViewController *)self hu_performPresentationRequest:a4];
}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return [(UIViewController *)self hu_performDismissalRequest:a4];
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return 0;
}

- (void)viewDidLoad
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)HUPersonalRequestsSetupViewController;
  [(OBBaseWelcomeController *)&v27 viewDidLoad];
  id v4 = [(HUPersonalRequestsSetupViewController *)self headerView];
  uint64_t v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5AE8];

  int v6 = [(HUPersonalRequestsSetupViewController *)self home];
  unint64_t v7 = objc_msgSend(v6, "hf_numberOfHomePods");

  uint64_t v8 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUPersonalRequestsSetupViewController *)self setUsePRButton:v8];

  int v9 = [(HUPersonalRequestsSetupViewController *)self usePRButton];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUPersonalRequestsSetup_UsePersonalRequestsButton", @"HUPersonalRequestsSetup_UsePersonalRequestsButton", 1);
  __int16 v11 = [(HUPersonalRequestsSetupViewController *)self usePRButton];
  [v11 setTitle:v10 forState:0];

  uint64_t v12 = [(HUPersonalRequestsSetupViewController *)self usePRButton];
  [v12 setAccessibilityIdentifier:@"Home.OnboardingView.PersonalRequests.SetUp.UsePersonalRequestsButton"];

  __int16 v13 = [(HUPersonalRequestsSetupViewController *)self usePRButton];
  [v13 addTarget:self action:sel__turnOnAllPersonalRequests_ forControlEvents:64];

  id v14 = [(HUPersonalRequestsSetupViewController *)self buttonTray];
  uint64_t v15 = [(HUPersonalRequestsSetupViewController *)self usePRButton];
  [v14 addButton:v15];

  uint64_t v16 = [MEMORY[0x1E4F83AB8] linkButton];
  [(HUPersonalRequestsSetupViewController *)self setCustomizeButton:v16];

  uint64_t v17 = [(HUPersonalRequestsSetupViewController *)self customizeButton];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v18 = [(HUPersonalRequestsSetupViewController *)self customizeButton];
  if (v7 < 2)
  {
    uint64_t v22 = _HULocalizedStringWithDefaultValue(@"HUPersonalRequestsCustomize_DoNotUseButton", @"HUPersonalRequestsCustomize_DoNotUseButton", 1);
    [v18 setTitle:v22 forState:0];

    uint64_t v20 = [(HUPersonalRequestsSetupViewController *)self customizeButton];
    [v20 setAccessibilityIdentifier:@"Home.OnboardingView.PersonalRequests.SetUp.DoNotUseLinkButton"];
    uint64_t v21 = &selRef__dontUsePersonalRequests_;
  }
  else
  {
    uint64_t v19 = _HULocalizedStringWithDefaultValue(@"HUPersonalRequestsSetup_CustomizeButton", @"HUPersonalRequestsSetup_CustomizeButton", 1);
    [v18 setTitle:v19 forState:0];

    uint64_t v20 = [(HUPersonalRequestsSetupViewController *)self customizeButton];
    [v20 setAccessibilityIdentifier:@"Home.OnboardingView.PersonalRequests.SetUp.CustomizeLinkButton"];
    uint64_t v21 = &selRef__customizePersonalRequests_;
  }

  v23 = [(HUPersonalRequestsSetupViewController *)self customizeButton];
  [v23 addTarget:self action:*v21 forControlEvents:64];

  uint64_t v24 = [(HUPersonalRequestsSetupViewController *)self buttonTray];
  [v24 addButton:self->_customizeButton];

  [(HUPersonalRequestsSetupViewController *)self setModalInPresentation:1];
  [(HUPersonalRequestsSetupViewController *)self _setupPersonalRequestsItemInfrastructure];
  v25 = HFLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v29 = self;
    __int16 v30 = 2112;
    v31 = v26;
    _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: PRSVC", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUPersonalRequestsSetupViewController;
  [(HUPersonalRequestsSetupViewController *)&v8 viewWillDisappear:a3];
  if ([(HUPersonalRequestsSetupViewController *)self isMovingFromParentViewController])
  {
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    unint64_t v7 = [(HUPersonalRequestsSetupViewController *)self delegate];
    [v7 viewControllerDidGoBack:self];
  }
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

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (OBTrayButton)usePRButton
{
  return self->_usePRButton;
}

- (void)setUsePRButton:(id)a3
{
}

- (OBLinkTrayButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
}

- (HULocationDevice)locationDevice
{
  return self->_locationDevice;
}

- (void)setLocationDevice:(id)a3
{
}

- (NSArray)supportedVoiceRecognitionLanguages
{
  return self->_supportedVoiceRecognitionLanguages;
}

- (void)setSupportedVoiceRecognitionLanguages:(id)a3
{
}

- (HUPersonalRequestsEditorItemManager)prEditorItemManager
{
  return self->_prEditorItemManager;
}

- (void)setPrEditorItemManager:(id)a3
{
}

- (HUPersonalRequestsDevicesModuleController)prDevicesModuleController
{
  return self->_prDevicesModuleController;
}

- (void)setPrDevicesModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prDevicesModuleController, 0);
  objc_storeStrong((id *)&self->_prEditorItemManager, 0);
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, 0);
  objc_storeStrong((id *)&self->_locationDevice, 0);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_usePRButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end