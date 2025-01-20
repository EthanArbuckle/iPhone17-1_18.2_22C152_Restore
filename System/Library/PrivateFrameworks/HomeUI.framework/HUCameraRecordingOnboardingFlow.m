@interface HUCameraRecordingOnboardingFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HFUserItem)userItem;
- (HMHome)home;
- (HUCameraRecordingOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4;
- (HUConfigurationViewController)initialViewController;
- (NAFuture)onboardingFuture;
- (NSString)description;
- (id)_determineInitialViewController;
- (id)processUserInput:(id)a3;
- (void)_setThisUserDismissedCameraOnboardingAndReminder;
- (void)setHome:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setShouldAbortAllOnboarding:(BOOL)a3;
- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3;
- (void)setUserItem:(id)a3;
@end

@implementation HUCameraRecordingOnboardingFlow

- (HUCameraRecordingOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUCameraRecordingOnboardingFlow;
  v8 = [(HUCameraRecordingOnboardingFlow *)&v22 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    id v10 = objc_alloc(MEMORY[0x1E4F69710]);
    home = v9->_home;
    v12 = [(HMHome *)home currentUser];
    uint64_t v13 = [v10 initWithHome:home user:v12 nameStyle:0];
    userItem = v9->_userItem;
    v9->_userItem = (HFUserItem *)v13;

    objc_initWeak(&location, v9);
    v15 = [(id)objc_opt_class() needsOnboardingForHome:v7 options:v6];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__HUCameraRecordingOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v19[3] = &unk_1E6386D40;
    objc_copyWeak(&v20, &location);
    uint64_t v16 = [v15 flatMap:v19];
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __61__HUCameraRecordingOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__HUCameraRecordingOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6386D18;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v5 = v3;
  id v9 = v5;
  id v6 = [v4 futureWithBlock:v8];

  objc_destroyWeak(&v10);

  return v6;
}

void __61__HUCameraRecordingOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) BOOLValue])
  {
    v4 = [WeakRetained _determineInitialViewController];
    [WeakRetained setInitialViewController:v4];
  }
  id v5 = [WeakRetained initialViewController];

  if (!v5) {
    [v6 finishWithNoResult];
  }
}

- (void)_setThisUserDismissedCameraOnboardingAndReminder
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"HUHomeFeatureOnboardingKey_CameraRecording_DismissReminderBanner";
  v6[1] = @"HUHomeFeatureOnboardingKey_CameraRecording_FinishedOnboarding";
  v7[0] = MEMORY[0x1E4F1CC38];
  v7[1] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v4 = [(HUCameraRecordingOnboardingFlow *)self home];
  id v5 = +[HUHomeFeatureOnboardingUtilities home:v4 processHomeFeatureOnboarderResults:v3];
}

- (id)_determineInitialViewController
{
  id v3 = [(HUCameraRecordingOnboardingFlow *)self home];
  int v4 = objc_msgSend(v3, "hf_cameraRecordingHasBeenOnboarded");

  id v5 = [(HUCameraRecordingOnboardingFlow *)self userItem];
  char v6 = [v5 hasDismissedCameraRecordingOnboarding];

  id v7 = [(HUCameraRecordingOnboardingFlow *)self home];
  int v8 = objc_msgSend(v7, "hf_currentUserIsOwner");

  id v9 = [(HUCameraRecordingOnboardingFlow *)self home];
  id v10 = [v9 residentDevices];
  uint64_t v11 = [v10 count];

  v12 = [(HUCameraRecordingOnboardingFlow *)self home];
  int v13 = objc_msgSend(v12, "hf_hasCameraRecordingResident");

  v14 = [(HUCameraRecordingOnboardingFlow *)self home];
  int v15 = objc_msgSend(v14, "hf_hasSecureRecordingCameras");

  uint64_t v16 = [(HUCameraRecordingOnboardingFlow *)self home];
  v17 = objc_msgSend(v16, "hf_allCameraProfiles");
  uint64_t v18 = [v17 count];

  v19 = 0;
  if (v18 && (v6 & 1) == 0)
  {
    [(HUCameraRecordingOnboardingFlow *)self _setThisUserDismissedCameraOnboardingAndReminder];
    id v20 = [HUCameraRecordingIntroViewController alloc];
    v21 = [(HUCameraRecordingOnboardingFlow *)self home];
    uint64_t v22 = 3;
    if (v11) {
      uint64_t v22 = 4;
    }
    if (v15) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 1;
    }
    if (v15 && v11 && ((v13 ^ 1) & 1) == 0)
    {
      if (v4)
      {
        if (v8) {
          uint64_t v23 = 5;
        }
        else {
          uint64_t v23 = 6;
        }
      }
      else if (v8)
      {
        uint64_t v23 = 2;
      }
      else
      {
        uint64_t v23 = 0;
      }
    }
    v19 = [(HUCameraRecordingIntroViewController *)v20 initWithIntroVariant:v23 home:v21];
  }

  return v19;
}

- (NSString)description
{
  return (NSString *)@"Multi User Camera Recording Setup";
}

- (id)processUserInput:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [v5 objectForKeyedSubscript:@"HUCameraRecordingOnboardingKey_UserInput"];
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v34 = self;
    __int16 v35 = 2112;
    v36 = v8;
    __int16 v37 = 2112;
    id v38 = v5;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);
  }
  if ([v6 integerValue] == 1)
  {
    id v9 = [(HUCameraRecordingOnboardingFlow *)self onboardingFuture];
    [(HUSimpleItemModuleTableViewController *)v9 finishWithNoResult];
  }
  else
  {
    if (![v6 integerValue])
    {
      int v15 = [(HUCameraRecordingOnboardingFlow *)self home];
      uint64_t v16 = objc_msgSend(v15, "hf_allCameraProfilesSupportingRecording");

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __52__HUCameraRecordingOnboardingFlow_processUserInput___block_invoke;
      aBlock[3] = &unk_1E6387A08;
      id v32 = v16;
      id v9 = v16;
      v17 = _Block_copy(aBlock);
      uint64_t v18 = [[HUSimpleItemModuleTableViewController alloc] initWithTableViewStyle:2 moduleCreator:v17 moduleControllerBuilder:&__block_literal_global_48];
      v19 = [HUCameraRecordingSetupViewController alloc];
      id v20 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingSetup_Title", @"HUCameraRecordingSetup_Title", 1);
      v21 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingSetup_Detail", @"HUCameraRecordingSetup_Detail", 1);
      uint64_t v22 = [(HUCameraRecordingOnboardingFlow *)self home];
      v14 = [(HUCameraRecordingSetupViewController *)v19 initWithTitle:v20 detailText:v21 icon:0 itemTableViewController:v18 home:v22];

      goto LABEL_14;
    }
    if ([v6 integerValue] == 2)
    {
      id v9 = [[HUSimpleItemModuleTableViewController alloc] initWithTableViewStyle:2 moduleCreator:&__block_literal_global_25_0 moduleControllerBuilder:&__block_literal_global_28_0];
      id v10 = [HUCameraRecordingPermissionsViewController alloc];
      uint64_t v11 = _HULocalizedStringWithDefaultValue(@"HUCameraPermissionsSettingsHeader_Title", @"HUCameraPermissionsSettingsHeader_Title", 1);
      v12 = _HULocalizedStringWithDefaultValue(@"HUCameraPermissionsSettingsHeader_Body", @"HUCameraPermissionsSettingsHeader_Body", 1);
      int v13 = [(HUCameraRecordingOnboardingFlow *)self home];
      v14 = [(HUCameraRecordingPermissionsViewController *)v10 initWithTitle:v11 detailText:v12 icon:0 itemTableViewController:v9 home:v13];

      goto LABEL_14;
    }
    id v23 = objc_alloc(MEMORY[0x1E4F69710]);
    v24 = [(HUCameraRecordingOnboardingFlow *)self home];
    v25 = [(HUCameraRecordingOnboardingFlow *)self home];
    v26 = [v25 currentUser];
    id v9 = (HUSimpleItemModuleTableViewController *)[v23 initWithHome:v24 user:v26 nameStyle:0];

    if ([(HUSimpleItemModuleTableViewController *)v9 hasDismissedCameraRecordingOnboarding])
    {
      v27 = [NSNumber numberWithBool:1];
      [v5 setObject:v27 forKeyedSubscript:@"HUHomeFeatureOnboardingKey_CameraRecording_DismissReminderBanner"];
    }
    else
    {
      [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"HUHomeFeatureOnboardingKey_CameraRecording_DismissReminderBanner"];
    }
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = [NSString stringWithUTF8String:"-[HUCameraRecordingOnboardingFlow processUserInput:]"];
    [v28 handleFailureInFunction:v29, @"HUCameraRecordingOnboardingFlow.m", 190, @"We should have handled all cases! results: %@", v5 file lineNumber description];
  }
  v14 = 0;
LABEL_14:

  return v14;
}

id __52__HUCameraRecordingOnboardingFlow_processUserInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [HUCameraRecordingSettingsModule alloc];
  char v6 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
  id v7 = [(HUCameraRecordingSettingsModule *)v5 initWithItemUpdater:v4 cameraProfiles:v6 displayStyle:1];

  v10[0] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

HUCameraSettingsModuleController *__52__HUCameraRecordingOnboardingFlow_processUserInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HUCameraSettingsModuleController alloc] initWithModule:v2];

  return v3;
}

id __52__HUCameraRecordingOnboardingFlow_processUserInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a2;
  char v6 = [[HUCameraPermissionsSettingsModule alloc] initWithItemUpdater:v4 home:v5 displayStyle:1];

  v9[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

HUCameraSettingsModuleController *__52__HUCameraRecordingOnboardingFlow_processUserInput___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HUCameraSettingsModuleController alloc] initWithModule:v2];

  return v3;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v6 = a3;
  char v7 = objc_msgSend(v6, "hf_hasSecureRecordingCameras");
  int v8 = (void *)MEMORY[0x1E4F7A0D8];
  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__HUCameraRecordingOnboardingFlow_needsOnboardingForHome_options___block_invoke;
    v11[3] = &unk_1E6387A70;
    id v12 = v6;
    id v13 = a1;
    SEL v14 = a2;
    char v15 = 1;
    id v9 = [v8 futureWithBlock:v11];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
  }

  return v9;
}

void __66__HUCameraRecordingOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F69710];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = *(void **)(a1 + 32);
  char v7 = [v6 currentUser];
  int v8 = (void *)[v5 initWithHome:v6 user:v7 nameStyle:0];

  int v9 = [v8 hasDismissedCameraRecordingOnboarding];
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v13 = (void *)v12;
    uint64_t v14 = *(void *)(a1 + 32);
    char v15 = @"Can";
    int v16 = *(unsigned __int8 *)(a1 + 56);
    int v18 = 138413826;
    if (v9) {
      char v15 = @"Cannot";
    }
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    id v23 = v15;
    __int16 v24 = 2112;
    v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v14;
    __int16 v28 = 1024;
    int v29 = v9 ^ 1;
    __int16 v30 = 1024;
    int v31 = v16;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: %@ show because: user(%@) in home(%@):\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\thasSecureRecordingCameras = %{BOOL}d", (uint8_t *)&v18, 0x40u);
  }
  v17 = [NSNumber numberWithBool:v9 ^ 1u];
  [v4 finishWithResult:v17];
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NAFuture)onboardingFuture
{
  return self->_onboardingFuture;
}

- (void)setOnboardingFuture:(id)a3
{
}

- (HUConfigurationViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
}

- (BOOL)shouldAbortThisOnboardingFlowGroup
{
  return self->_shouldAbortThisOnboardingFlowGroup;
}

- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3
{
  self->_shouldAbortThisOnboardingFlowGroup = a3;
}

- (BOOL)shouldAbortAllOnboarding
{
  return self->_shouldAbortAllOnboarding;
}

- (void)setShouldAbortAllOnboarding:(BOOL)a3
{
  self->_shouldAbortAllOnboarding = a3;
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (void)setUserItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userItem, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end