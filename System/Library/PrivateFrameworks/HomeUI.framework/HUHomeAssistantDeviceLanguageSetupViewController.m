@interface HUHomeAssistantDeviceLanguageSetupViewController
- (BOOL)maxNumberOfVoicesReached;
- (BOOL)needsToWaitForPreload;
- (BOOL)shouldSetMultiUserIsEnabled;
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeAssistantDeviceLanguageSetupViewController)initWithHome:(id)a3;
- (HUPersonalRequestsEditorItemManager)prEditorItemManager;
- (NSArray)homeAssistantDevicesHavingLanguageMismatch;
- (NSArray)supportedVoiceRecognitionLanguages;
- (NSString)continueButtonString;
- (NSString)customizeButtonString;
- (NSString)detailsString;
- (NSString)titleString;
- (OBLinkTrayButton)customizeButton;
- (OBTrayButton)continueButton;
- (SEL)continueSelector;
- (SEL)customizeSelector;
- (id)hu_preloadContent;
- (void)_cancelLanguageSetup;
- (void)_cancelLanguageSetupWithoutWarningUser;
- (void)_changeLanguage;
- (void)_checkForiCloudSiriEnabledAndCompleteSetup;
- (void)_completeLanguageSetup;
- (void)_setupPersonalRequestsItemInfrastructure;
- (void)_turnOffPersonalRequests;
- (void)setContinueButton:(id)a3;
- (void)setContinueButtonString:(id)a3;
- (void)setContinueSelector:(SEL)a3;
- (void)setCustomizeButton:(id)a3;
- (void)setCustomizeButtonString:(id)a3;
- (void)setCustomizeSelector:(SEL)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailsString:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomeAssistantDevicesHavingLanguageMismatch:(id)a3;
- (void)setMaxNumberOfVoicesReached:(BOOL)a3;
- (void)setPrEditorItemManager:(id)a3;
- (void)setShouldSetMultiUserIsEnabled:(BOOL)a3;
- (void)setSupportedVoiceRecognitionLanguages:(id)a3;
- (void)setTitleString:(id)a3;
- (void)userTappedCancelFromWarning;
- (void)userTappedContinueFromWarning;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUHomeAssistantDeviceLanguageSetupViewController

- (HUHomeAssistantDeviceLanguageSetupViewController)initWithHome:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = _HULocalizedStringWithDefaultValue(@"HULanguageCanRecognizeMultipleVoices_Title", @"HULanguageCanRecognizeMultipleVoices_Title", 1);
  v8 = _HULocalizedStringWithDefaultValue(@"HULanguageCanRecognizeMultipleVoices_Title", @"HULanguageCanRecognizeMultipleVoices_Title", 1);

  v9 = HUImageNamed(@"Onboarding-MediaAccessoryLanguage");
  v20.receiver = self;
  v20.super_class = (Class)HUHomeAssistantDeviceLanguageSetupViewController;
  v10 = [(HUImageOBWelcomeController *)&v20 initWithTitle:v8 detailText:&stru_1F18F92B8 icon:0 contentImage:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_home, a3);
    [(HUHomeAssistantDeviceLanguageSetupViewController *)v10 _setupPersonalRequestsItemInfrastructure];
    uint64_t v11 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
    supportedVoiceRecognitionLanguages = v10->_supportedVoiceRecognitionLanguages;
    v10->_supportedVoiceRecognitionLanguages = (NSArray *)v11;

    v13 = v10->_supportedVoiceRecognitionLanguages;
    v14 = HFLogForCategory();
    v15 = v14;
    if (v13)
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_7:

        goto LABEL_8;
      }
      NSStringFromSelector(a2);
      v16 = (HUHomeAssistantDeviceLanguageSetupViewController *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [(NSArray *)v10->_supportedVoiceRecognitionLanguages count];
      v18 = v10->_supportedVoiceRecognitionLanguages;
      *(_DWORD *)buf = 138413058;
      v22 = v10;
      __int16 v23 = 2112;
      v24 = v16;
      __int16 v25 = 2048;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@: %lu Supported voice recognition languages are %@", buf, 0x2Au);
    }
    else
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      NSStringFromSelector(a2);
      v16 = (HUHomeAssistantDeviceLanguageSetupViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_error_impl(&dword_1BE345000, v15, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", buf, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

- (id)hu_preloadContent
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
  char v5 = objc_msgSend(v4, "hf_hasHomePods");

  id v6 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
  int v7 = objc_msgSend(v6, "hf_hasRMVCapableAppleTV");

  if ((v5 & 1) == 0 && !v7)
  {
    v8 = (void *)MEMORY[0x1E4F7A0D8];
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = 48;
LABEL_10:
    uint64_t v17 = objc_msgSend(v9, "hf_errorWithCode:", v10);
    v18 = [v8 futureWithError:v17];

    goto LABEL_12;
  }
  uint64_t v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSStringFromSelector(a2);
    v13 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
    *(_DWORD *)buf = 138413058;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    v28 = v12;
    __int16 v29 = 2048;
    uint64_t v30 = objc_msgSend(v13, "hf_numberOfHomePods");
    __int16 v31 = 1024;
    int v32 = v7;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Determining which screen variant for %lu HomePods. hasRMVCapableAppleTV = %{BOOL}d", buf, 0x26u);
  }
  if ((v7 & 1) == 0
    && (([MEMORY[0x1E4F69758] isAMac] & 1) != 0
     || [MEMORY[0x1E4F69758] isAVisionPro]))
  {
    v14 = _HULocalizedStringWithDefaultValue(@"HULanguageNeedsiOSDevice_Title", @"HULanguageNeedsiOSDevice_Title", 1);
    [(HUHomeAssistantDeviceLanguageSetupViewController *)self setTitleString:v14];

    v15 = _HULocalizedStringWithDefaultValue(@"HULanguageNeedsiOSDevice_Detail", @"HULanguageNeedsiOSDevice_Detail", 1);
    [(HUHomeAssistantDeviceLanguageSetupViewController *)self setDetailsString:v15];

    v16 = _HULocalizedStringWithDefaultValue(@"HULanguageContinueWithoutVoiceRecognition_Button_Title", @"HULanguageContinueWithoutVoiceRecognition_Button_Title", 1);
    [(HUHomeAssistantDeviceLanguageSetupViewController *)self setContinueButtonString:v16];

    [(HUHomeAssistantDeviceLanguageSetupViewController *)self setContinueSelector:sel__cancelLanguageSetup];
    v8 = (void *)MEMORY[0x1E4F7A0D8];
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = 47;
    goto LABEL_10;
  }
  v19 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
  objc_super v20 = +[HUHomeFeatureOnboardingUtilities atLeastOneHomePodHasLanguageSettingsForHomeFuture:v19];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__HUHomeAssistantDeviceLanguageSetupViewController_hu_preloadContent__block_invoke;
  v22[3] = &unk_1E6386928;
  char v23 = v7;
  char v24 = v5;
  v22[4] = self;
  v22[5] = a2;
  v18 = [v20 flatMap:v22];

LABEL_12:

  return v18;
}

id __69__HUHomeAssistantDeviceLanguageSetupViewController_hu_preloadContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v98 = a2;
  v3 = [*(id *)(a1 + 32) home];
  int v4 = objc_msgSend(v3, "hf_currentUserIsOwner");

  if (v4) {
    [*(id *)(a1 + 32) setShouldSetMultiUserIsEnabled:1];
  }
  if (*(unsigned char *)(a1 + 48) || v98 || !*(unsigned char *)(a1 + 49))
  {
    char v5 = [*(id *)(a1 + 32) supportedVoiceRecognitionLanguages];
    id v6 = [*(id *)(a1 + 32) home];
    int v7 = +[HUHomeFeatureOnboardingUtilities analyzeHomeAssistantDevicesForSupportedVoiceRecognitionLanguages:v5 home:v6];

    v8 = [v7 objectForKeyedSubscript:@"supportingLanguages"];
    v9 = [v7 objectForKeyedSubscript:@"languageMismatch"];
    [*(id *)(a1 + 32) setHomeAssistantDevicesHavingLanguageMismatch:v9];

    uint64_t v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
      v13 = [*(id *)(a1 + 32) home];
      uint64_t v14 = objc_msgSend(v13, "hf_numberOfHomePods");
      uint64_t v15 = [v8 count];
      v16 = [*(id *)(a1 + 32) homeAssistantDevicesHavingLanguageMismatch];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2048;
      v101 = (uint64_t (*)(uint64_t, uint64_t))v14;
      *(_WORD *)v102 = 2048;
      *(void *)&v102[2] = v15;
      *(_WORD *)&v102[10] = 2048;
      *(void *)&v102[12] = [v16 count];
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: HomePod language analysis: %lu HomePods: %lu on supported voice recognition languages / %lu not.", buf, 0x34u);
    }
    [*(id *)(a1 + 32) setMaxNumberOfVoicesReached:0];
    if ([*(id *)(a1 + 32) maxNumberOfVoicesReached])
    {
      uint64_t v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        v19 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v19;
        _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: Maximum voice profiles reached", buf, 0x16u);
      }
      objc_super v20 = _HULocalizedStringWithDefaultValue(@"HULanguageCannotRecognizeAdditionalVoices_Title", @"HULanguageCannotRecognizeAdditionalVoices_Title", 1);
      v22 = *(void **)(a1 + 32);
      v21 = (id *)(a1 + 32);
      [v22 setTitleString:v20];

      char v23 = _HULocalizedStringWithDefaultValue(@"HULanguageCannotRecognizeAdditionalVoices_Detail", @"HULanguageCannotRecognizeAdditionalVoices_Detail", 1);
      [*v21 setDetailsString:v23];

      char v24 = _HULocalizedStringWithDefaultValue(@"HULanguageContinueWithoutVoiceRecognition_Button_Title", @"HULanguageContinueWithoutVoiceRecognition_Button_Title", 1);
      [*v21 setContinueButtonString:v24];

      [*v21 setContinueSelector:sel__cancelLanguageSetup];
      __int16 v25 = (void *)MEMORY[0x1E4F7A0D8];
      uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 44);
      __int16 v27 = [v25 futureWithError:v26];

      goto LABEL_33;
    }
    v28 = [*(id *)(a1 + 32) supportedVoiceRecognitionLanguages];
    uint64_t v29 = [v28 count];

    uint64_t v30 = HFLogForCategory();
    __int16 v31 = v30;
    if (!v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v95 = *(void *)(a1 + 32);
        v96 = NSStringFromSelector(*(SEL *)(a1 + 40));
        objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 45);
        v97 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v95;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v96;
        *(_WORD *)&buf[22] = 2112;
        v101 = v97;
        _os_log_error_impl(&dword_1BE345000, v31, OS_LOG_TYPE_ERROR, "%@:%@: NO Supporting voice recognition languages. Finishing with Error %@", buf, 0x20u);
      }
      v67 = (void *)MEMORY[0x1E4F7A0D8];
      v68 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 45);
      __int16 v27 = [v67 futureWithError:v68];

      goto LABEL_33;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = *(void *)(a1 + 32);
      uint64_t v33 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v34 = [v8 count];
      v35 = [*(id *)(a1 + 32) home];
      int v36 = objc_msgSend(v35, "hf_currentUserIsAdministrator");
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v32;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2048;
      v101 = (uint64_t (*)(uint64_t, uint64_t))v34;
      *(_WORD *)v102 = 1024;
      *(_DWORD *)&v102[2] = v36;
      _os_log_impl(&dword_1BE345000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@: %lu HomePods on supported voice recognition languages & user is admin?: %{BOOL}d", buf, 0x26u);
    }
    if (!*(unsigned char *)(a1 + 48))
    {
      if (*(unsigned char *)(a1 + 49))
      {
        if (![v8 count])
        {
          v37 = [*(id *)(a1 + 32) home];
          char v38 = objc_msgSend(v37, "hf_currentUserIsAdministrator");

          if ((v38 & 1) == 0)
          {
            v84 = HFLogForCategory();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v85 = *(void *)(a1 + 32);
              v86 = NSStringFromSelector(*(SEL *)(a1 + 40));
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v85;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v86;
              _os_log_impl(&dword_1BE345000, v84, OS_LOG_TYPE_DEFAULT, "%@:%@: NO Supporting voice recognition languages for HomePods AND Current User is NOT an Admin ", buf, 0x16u);
            }
            v87 = _HULocalizedStringWithDefaultValue(@"HULanguageCannotRecognizeMultipleVoices_Title", @"HULanguageCannotRecognizeMultipleVoices_Title", 1);
            v89 = *(void **)(a1 + 32);
            v88 = (id *)(a1 + 32);
            [v89 setTitleString:v87];

            v90 = _HULocalizedStringWithDefaultValue(@"HULanguageCannotRecognizeMultipleVoices_Detail", @"HULanguageCannotRecognizeMultipleVoices_Detail", 1);
            [*v88 setDetailsString:v90];

            v91 = _HULocalizedStringWithDefaultValue(@"HULanguageCannotRecognizeMultipleVoices_Title", @"HULanguageCannotRecognizeMultipleVoices_Title", 1);
            [*v88 setTitleString:v91];

            v92 = _HULocalizedStringWithDefaultValue(@"HULanguageCannotRecognizeMultipleVoices_Detail", @"HULanguageCannotRecognizeMultipleVoices_Detail", 1);
            [*v88 setDetailsString:v92];

            v93 = _HULocalizedStringWithDefaultValue(@"HULanguageContinueWithoutVoiceRecognition_Button_Title", @"HULanguageContinueWithoutVoiceRecognition_Button_Title", 1);
            [*v88 setContinueButtonString:v93];

            [*v88 setContinueSelector:sel__cancelLanguageSetup];
            v94 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 43);
            if (v94)
            {
              __int16 v27 = [MEMORY[0x1E4F7A0D8] futureWithError:v94];

              goto LABEL_33;
            }
LABEL_21:
            __int16 v27 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_33:

            goto LABEL_34;
          }
        }
      }
      if (!*(unsigned char *)(a1 + 48))
      {
        if (*(unsigned char *)(a1 + 49))
        {
          if (![v8 count])
          {
            v70 = [*(id *)(a1 + 32) home];
            int v71 = objc_msgSend(v70, "hf_currentUserIsAdministrator");

            if (v71)
            {
              v72 = HFLogForCategory();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v73 = *(void *)(a1 + 32);
                v74 = NSStringFromSelector(*(SEL *)(a1 + 40));
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v73;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v74;
                _os_log_impl(&dword_1BE345000, v72, OS_LOG_TYPE_DEFAULT, "%@:%@: NO RMV Capable AppleTVs, NO Supporting voice recognition languages for HomePods AND Current User is an Admin ", buf, 0x16u);
              }
              v75 = _HULocalizedStringWithDefaultValue(@"HULanguageCannotRecognizeMultipleVoices_Title", @"HULanguageCannotRecognizeMultipleVoices_Title", 1);
              v77 = *(void **)(a1 + 32);
              v76 = (id *)(a1 + 32);
              [v77 setTitleString:v75];

              v78 = _HULocalizedStringWithDefaultValue(@"HULanguageCannotRecognizeMultipleVoices_Detail", @"HULanguageCannotRecognizeMultipleVoices_Detail", 1);
              [*v76 setDetailsString:v78];

              v79 = _HULocalizedStringWithDefaultValue(@"HULanguageCannotRecognizeMultipleVoices_Title", @"HULanguageCannotRecognizeMultipleVoices_Title", 1);
              [*v76 setTitleString:v79];

              v80 = _HULocalizedStringWithDefaultValue(@"HULanguageCannotRecognizeMultipleVoices_Detail", @"HULanguageCannotRecognizeMultipleVoices_Detail", 1);
              [*v76 setDetailsString:v80];

              v81 = _HULocalizedStringWithDefaultValue(@"HULanguageContinueWithoutVoiceRecognition_Button_Title", @"HULanguageContinueWithoutVoiceRecognition_Button_Title", 1);
              [*v76 setContinueButtonString:v81];

              [*v76 setContinueSelector:sel__cancelLanguageSetup];
              v82 = _HULocalizedStringWithDefaultValue(@"HULanguageChangeLanguageButton_Title", @"HULanguageChangeLanguageButton_Title", 1);
              [*v76 setCustomizeButtonString:v82];

              v83 = _HULocalizedStringWithDefaultValue(@"HULanguageChangeLanguageButton_Title", @"HULanguageChangeLanguageButton_Title", 1);
              [*v76 setCustomizeButtonString:v83];

              [*v76 setCustomizeSelector:sel__changeLanguage];
              goto LABEL_21;
            }
          }
        }
      }
    }
    v39 = HFLogForCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = *(void *)(a1 + 32);
      v41 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v40;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v41;
      _os_log_impl(&dword_1BE345000, v39, OS_LOG_TYPE_DEFAULT, "%@:%@: At least ONE HomePod supports voice recognition languages OR RMV Capable AppleTV exists!", buf, 0x16u);
    }
    v42 = _HULocalizedStringWithDefaultValue(@"HULanguageCanRecognizeMultipleVoices_Title", @"HULanguageCanRecognizeMultipleVoices_Title", 1);
    [*(id *)(a1 + 32) setTitleString:v42];

    v43 = _HULocalizedStringWithDefaultValue(@"HULanguageCanRecognizeMultipleVoices_Detail", @"HULanguageCanRecognizeMultipleVoices_Detail", 1);
    [*(id *)(a1 + 32) setDetailsString:v43];

    v44 = _HULocalizedStringWithDefaultValue(@"HULanguageCanRecognizeMultipleVoices_Title", @"HULanguageCanRecognizeMultipleVoices_Title", 1);
    [*(id *)(a1 + 32) setTitleString:v44];

    v45 = _HULocalizedStringWithDefaultValue(@"HULanguageCanRecognizeMultipleVoices_Detail", @"HULanguageCanRecognizeMultipleVoices_Detail", 1);
    [*(id *)(a1 + 32) setDetailsString:v45];

    v46 = _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
    [*(id *)(a1 + 32) setContinueButtonString:v46];

    [*(id *)(a1 + 32) setContinueSelector:sel__checkForiCloudSiriEnabledAndCompleteSetup];
    v47 = _HULocalizedStringWithDefaultValue(@"HULanguageDontRecognizeVoiceButton_Title", @"HULanguageDontRecognizeVoiceButton_Title", 1);
    [*(id *)(a1 + 32) setCustomizeButtonString:v47];

    [*(id *)(a1 + 32) setCustomizeSelector:sel__cancelLanguageSetup];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v101 = __Block_byref_object_copy__2;
    *(void *)v102 = __Block_byref_object_dispose__2;
    *(void *)&v102[8] = _HULocalizedStringWithDefaultValue(@"HULanguageCanRecognizeMultipleVoicesAirplay_UnknownDevice", @"HULanguageCanRecognizeMultipleVoicesAirplay_UnknownDevice", 1);
    v48 = +[HULocationDeviceManager sharedInstance];
    v49 = [v48 activeLocationDeviceFuture];
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __69__HUHomeAssistantDeviceLanguageSetupViewController_hu_preloadContent__block_invoke_65;
    v99[3] = &unk_1E6386900;
    v99[4] = buf;
    id v50 = (id)[v49 addCompletionBlock:v99];

    v51 = HULocalizedModelString(@"HULanguageCanRecognizeMultipleVoices_FinePrint");
    v52 = [v51 stringByAppendingString:@" "];
    v53 = [v52 stringByAppendingString:*(void *)(*(void *)&buf[8] + 40)];

    v54 = [*(id *)(a1 + 32) buttonTray];
    [v54 addCaptionText:v53];

    _Block_object_dispose(buf, 8);
    goto LABEL_21;
  }
  v55 = [*(id *)(a1 + 32) home];
  unint64_t v56 = objc_msgSend(v55, "hf_numberOfHomePods");

  if (v56 <= 1) {
    v57 = @"HULanguageNeedsSettingsSync_Detail_Single";
  }
  else {
    v57 = @"HULanguageNeedsSettingsSync_Detail_Multiple";
  }
  v58 = HFLogForCategory();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v59 = *(void *)(a1 + 32);
    v60 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v59;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v60;
    _os_log_impl(&dword_1BE345000, v58, OS_LOG_TYPE_DEFAULT, "%@:%@: No HomePods have language settings yet, skipping Voice ID onboarding...", buf, 0x16u);
  }
  v61 = _HULocalizedStringWithDefaultValue(@"HULanguageNeedsSettingsSync_Title", @"HULanguageNeedsSettingsSync_Title", 1);
  v63 = *(void **)(a1 + 32);
  v62 = (id *)(a1 + 32);
  [v63 setTitleString:v61];

  v64 = _HULocalizedStringWithDefaultValue(v57, v57, 1);
  [*v62 setDetailsString:v64];

  v65 = _HULocalizedStringWithDefaultValue(@"HULanguageNeedsSettingsSync_ContinueButton", @"HULanguageNeedsSettingsSync_ContinueButton", 1);
  [*v62 setContinueButtonString:v65];

  [*v62 setContinueSelector:sel__cancelLanguageSetup];
  v66 = (void *)MEMORY[0x1E4F7A0D8];
  int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 49);
  __int16 v27 = [v66 futureWithError:v7];
LABEL_34:

  return v27;
}

void __69__HUHomeAssistantDeviceLanguageSetupViewController_hu_preloadContent__block_invoke_65(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!a3)
  {
    id v17 = v5;
    id v6 = [v5 name];

    id v5 = v17;
    if (v6)
    {
      int v7 = [v17 name];
      uint64_t v14 = HULocalizedStringWithFormat(@"HULanguageCanRecognizeMultipleVoicesAirplay", @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
      v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      id v5 = v17;
    }
  }
}

- (BOOL)needsToWaitForPreload
{
  v2 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
  char v3 = objc_msgSend(v2, "hf_hasRMVCapableAppleTV");

  return (v3 & 1) != 0
      || ([MEMORY[0x1E4F69758] isAMac] & 1) == 0
      && ([MEMORY[0x1E4F69758] isAVisionPro] & 1) == 0;
}

- (void)_cancelLanguageSetup
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = self;
    __int16 v34 = 2112;
    v35 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  if (![(HUHomeAssistantDeviceLanguageSetupViewController *)self maxNumberOfVoicesReached]
    && ([MEMORY[0x1E4F69758] isAMac] & 1) == 0
    && ([MEMORY[0x1E4F69758] isAVisionPro] & 1) == 0)
  {
    id v6 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
    int v7 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self supportedVoiceRecognitionLanguages];
    BOOL v8 = +[HUHomeFeatureOnboardingUtilities home:v6 hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:v7];

    if (v8)
    {
      uint64_t v9 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
      if (objc_msgSend(v9, "hf_currentUserIsAdministrator"))
      {

LABEL_10:
        uint64_t v12 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self prEditorItemManager];
        uint64_t v13 = [v12 prDevicesModule];
        uint64_t v14 = [v13 personalRequestsDevices];
        BOOL v15 = [v14 count] != 0;

        goto LABEL_12;
      }
      uint64_t v10 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
      int v11 = objc_msgSend(v10, "hf_currentUserIsOwner");

      if (v11) {
        goto LABEL_10;
      }
    }
  }
  BOOL v15 = 0;
LABEL_12:
  v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v30 = v15;
    __int16 v31 = NSStringFromSelector(a2);
    BOOL v28 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self maxNumberOfVoicesReached];
    uint64_t v17 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
    uint64_t v18 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self supportedVoiceRecognitionLanguages];
    uint64_t v29 = (void *)v17;
    BOOL v19 = +[HUHomeFeatureOnboardingUtilities home:v17 hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:v18];
    objc_super v20 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
    char v21 = objc_msgSend(v20, "hf_currentUserIsAdministrator");
    if (v21)
    {
      int v22 = 1;
    }
    else
    {
      __int16 v27 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
      int v22 = objc_msgSend(v27, "hf_currentUserIsOwner");
    }
    char v23 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self prEditorItemManager];
    char v24 = [v23 prDevicesModule];
    __int16 v25 = [v24 personalRequestsDevices];
    uint64_t v26 = [v25 count];
    *(_DWORD *)buf = 138413570;
    uint64_t v33 = self;
    __int16 v34 = 2112;
    v35 = v31;
    __int16 v36 = 1024;
    BOOL v37 = v28;
    __int16 v38 = 1024;
    BOOL v39 = v19;
    __int16 v40 = 1024;
    int v41 = v22;
    __int16 v42 = 2048;
    uint64_t v43 = v26;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: maxNumberOfVoicesReached = %{BOOL}d home:hasSomeHomePodsOnSupportedVoiceRecognitionLanguages = %{BOOL}d currentUserIsAdministrator/Owner = %{BOOL}d personalRequestsDevices = %lu", buf, 0x32u);

    if ((v21 & 1) == 0) {
    BOOL v15 = v30;
    }
  }

  if (v15) {
    +[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOffPersonalRequestsFrom:self];
  }
  else {
    [(HUHomeAssistantDeviceLanguageSetupViewController *)self _cancelLanguageSetupWithoutWarningUser];
  }
}

- (void)_cancelLanguageSetupWithoutWarningUser
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    BOOL v19 = self;
    __int16 v20 = 2112;
    char v21 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Cancelling (really)", buf, 0x16u);
  }
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  v16 = @"HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput";
  uint64_t v17 = &unk_1F19B3B78;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  BOOL v8 = [v6 dictionaryWithDictionary:v7];

  uint64_t v9 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
  int v10 = objc_msgSend(v9, "hf_currentUserIsOwner");

  if (v10)
  {
    int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[HUHomeAssistantDeviceLanguageSetupViewController shouldSetMultiUserIsEnabled](self, "shouldSetMultiUserIsEnabled"));
    [v8 setObject:v11 forKeyedSubscript:@"HUMultiUserKey_SetIsEnabled"];

    uint64_t v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      BOOL v19 = self;
      __int16 v20 = 2112;
      char v21 = v13;
      uint64_t v14 = "%@:%@: Turning ON MU Setting since the current user is the Home owner";
LABEL_8:
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      BOOL v19 = self;
      __int16 v20 = 2112;
      char v21 = v13;
      uint64_t v14 = "%@:%@: NOT Turning ON MU Setting since the current user is NOT the Home owner";
      goto LABEL_8;
    }
  }

  BOOL v15 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self delegate];
  [v15 viewController:self didFinishWithConfigurationResults:v8];
}

- (void)_checkForiCloudSiriEnabledAndCompleteSetup
{
  int v4 = +[HUHomeFeatureOnboardingUtilities checkSiriForiCloudEnabledPromptingUser:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__HUHomeAssistantDeviceLanguageSetupViewController__checkForiCloudSiriEnabledAndCompleteSetup__block_invoke;
  v8[3] = &unk_1E6386950;
  v8[4] = self;
  id v5 = (id)[v4 addSuccessBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__HUHomeAssistantDeviceLanguageSetupViewController__checkForiCloudSiriEnabledAndCompleteSetup__block_invoke_2;
  v7[3] = &unk_1E6386978;
  v7[4] = self;
  v7[5] = a2;
  id v6 = (id)[v4 addFailureBlock:v7];
}

uint64_t __94__HUHomeAssistantDeviceLanguageSetupViewController__checkForiCloudSiriEnabledAndCompleteSetup__block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 BOOLValue];
  int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    return [v4 _completeLanguageSetup];
  }
  else
  {
    return [v4 _cancelLanguageSetupWithoutWarningUser];
  }
}

void __94__HUHomeAssistantDeviceLanguageSetupViewController__checkForiCloudSiriEnabledAndCompleteSetup__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v8 = 138412802;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      int v11 = v6;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: There was an error enabling iCloud for Siri: %@", (uint8_t *)&v8, 0x20u);
    }
    int v7 = [MEMORY[0x1E4F69110] sharedHandler];
    [v7 handleError:v3];
  }
}

- (void)_completeLanguageSetup
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    char v21 = self;
    __int16 v22 = 2112;
    char v23 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v18 = @"HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput";
  BOOL v19 = &unk_1F19B3B90;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  int v8 = [v6 dictionaryWithDictionary:v7];

  uint64_t v9 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
  int v10 = objc_msgSend(v9, "hf_currentUserIsOwner");

  if (v10)
  {
    int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[HUHomeAssistantDeviceLanguageSetupViewController shouldSetMultiUserIsEnabled](self, "shouldSetMultiUserIsEnabled"));
    [v8 setObject:v11 forKeyedSubscript:@"HUMultiUserKey_SetIsEnabled"];

    __int16 v12 = HFLogForCategory();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    char v21 = self;
    __int16 v22 = 2112;
    char v23 = v13;
    uint64_t v14 = "%@:%@: Turning ON MU Setting since the current user is the Home owner";
  }
  else
  {
    __int16 v12 = HFLogForCategory();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    char v21 = self;
    __int16 v22 = 2112;
    char v23 = v13;
    uint64_t v14 = "%@:%@: NOT Turning ON MU Setting since the current user is NOT the Home owner";
  }
  _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);

LABEL_9:
  BOOL v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    char v21 = self;
    __int16 v22 = 2112;
    char v23 = v16;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@: Now finishing HomePod language mismatch onboarding flow", buf, 0x16u);
  }
  uint64_t v17 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self delegate];
  [v17 viewController:self didFinishWithConfigurationResults:v8];
}

- (void)_changeLanguage
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    int v20 = 138412546;
    char v21 = self;
    __int16 v22 = 2112;
    char v23 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v20, 0x16u);
  }
  id v6 = objc_opt_new();
  [v6 setObject:&unk_1F19B3BA8 forKey:@"HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput"];
  int v7 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self supportedVoiceRecognitionLanguages];
  int v8 = (void *)[v7 copy];
  [v6 setObject:v8 forKey:@"HULanguageOnboardingKey_SupportedLanguageInfo"];

  uint64_t v9 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
  LODWORD(v8) = objc_msgSend(v9, "hf_currentUserIsOwner");

  if (v8)
  {
    int v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HUHomeAssistantDeviceLanguageSetupViewController shouldSetMultiUserIsEnabled](self, "shouldSetMultiUserIsEnabled"));
    [v6 setObject:v10 forKeyedSubscript:@"HUMultiUserKey_SetIsEnabled"];

    int v11 = HFLogForCategory();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    __int16 v12 = NSStringFromSelector(a2);
    int v20 = 138412546;
    char v21 = self;
    __int16 v22 = 2112;
    char v23 = v12;
    id v13 = "%@:%@: Turning ON MU Setting since the current user is the Home owner";
  }
  else
  {
    int v11 = HFLogForCategory();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    __int16 v12 = NSStringFromSelector(a2);
    int v20 = 138412546;
    char v21 = self;
    __int16 v22 = 2112;
    char v23 = v12;
    id v13 = "%@:%@: NOT Turning ON MU Setting since the current user is NOT the Home owner";
  }
  _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, 0x16u);

LABEL_9:
  uint64_t v14 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self homeAssistantDevicesHavingLanguageMismatch];

  if (v14)
  {
    BOOL v15 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self homeAssistantDevicesHavingLanguageMismatch];
    [v6 setObject:v15 forKey:@"HULanguageOnboardingKey_LanguageMismatchedHomeAssistantDevices"];
  }
  v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = NSStringFromSelector(a2);
    int v20 = 138412802;
    char v21 = self;
    __int16 v22 = 2112;
    char v23 = v17;
    __int16 v24 = 2112;
    __int16 v25 = v6;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: Now transitioning to Language configuration for HomePod with results [%@]", (uint8_t *)&v20, 0x20u);
  }
  uint64_t v18 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self delegate];
  BOOL v19 = (void *)[v6 copy];
  [v18 viewController:self didFinishWithConfigurationResults:v19];
}

- (void)_setupPersonalRequestsItemInfrastructure
{
  id v4 = objc_alloc(MEMORY[0x1E4F69710]);
  uint64_t v5 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
  id v6 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self home];
  int v7 = [v6 currentUser];
  id v11 = (id)[v4 initWithHome:v5 user:v7 nameStyle:0];

  int v8 = [[HUPersonalRequestsEditorItemManager alloc] initWithDelegate:0 userItem:v11 onlyShowDeviceSwitches:1];
  [(HUHomeAssistantDeviceLanguageSetupViewController *)self setPrEditorItemManager:v8];

  uint64_t v9 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self prEditorItemManager];
  id v10 = (id)[v9 reloadAndUpdateAllItemsFromSenderSelector:a2];
}

- (void)userTappedContinueFromWarning
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    int v6 = 138412546;
    int v7 = self;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v6, 0x16u);
  }
  [(HUHomeAssistantDeviceLanguageSetupViewController *)self _turnOffPersonalRequests];
  [(HUHomeAssistantDeviceLanguageSetupViewController *)self _cancelLanguageSetupWithoutWarningUser];
}

- (void)userTappedCancelFromWarning
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    int v6 = 138412546;
    int v7 = self;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_turnOffPersonalRequests
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: Turning off all Personal Requests devices", (uint8_t *)&v8, 0xCu);
  }
  int v6 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self prEditorItemManager];
  int v7 = [v6 prDevicesModule];
  [v7 setPersonalRequestsDevices:MEMORY[0x1E4F1CBF0]];
}

- (void)viewDidLoad
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)HUHomeAssistantDeviceLanguageSetupViewController;
  [(HUImageOBWelcomeController *)&v32 viewDidLoad];
  [(HUHomeAssistantDeviceLanguageSetupViewController *)self setModalInPresentation:1];
  id v4 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self headerView];
  uint64_t v5 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self titleString];
  [v4 setTitle:v5];

  int v6 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self headerView];
  int v7 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self detailsString];
  [v6 setDetailText:v7];

  int v8 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self headerView];
  uint64_t v9 = [v8 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v9 withIDDictionary:&unk_1F19B5AC0];

  uint64_t v10 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self continueButtonString];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    __int16 v12 = [MEMORY[0x1E4F83A80] boldButton];
    [(HUHomeAssistantDeviceLanguageSetupViewController *)self setContinueButton:v12];

    id v13 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self continueButton];
    uint64_t v14 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self continueButtonString];
    [v13 setTitle:v14 forState:0];

    BOOL v15 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self continueButton];
    [v15 setAccessibilityIdentifier:@"Home.OnboardingView.LanguageSetUp.ContinueButton"];

    v16 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self continueButton];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v17 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self continueButton];
    objc_msgSend(v17, "addTarget:action:forControlEvents:", self, -[HUHomeAssistantDeviceLanguageSetupViewController continueSelector](self, "continueSelector"), 64);

    uint64_t v18 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self buttonTray];
    BOOL v19 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self continueButton];
    [v18 addButton:v19];
  }
  int v20 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self customizeButtonString];
  uint64_t v21 = [v20 length];

  if (v21)
  {
    __int16 v22 = [MEMORY[0x1E4F83AB8] linkButton];
    [(HUHomeAssistantDeviceLanguageSetupViewController *)self setCustomizeButton:v22];

    char v23 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self customizeButton];
    __int16 v24 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self customizeButtonString];
    [v23 setTitle:v24 forState:0];

    __int16 v25 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self customizeButton];
    [v25 setAccessibilityIdentifier:@"Home.OnboardingView.LanguageSetUp.CustomizeButton"];

    uint64_t v26 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self customizeButton];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

    __int16 v27 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self customizeButton];
    objc_msgSend(v27, "addTarget:action:forControlEvents:", self, -[HUHomeAssistantDeviceLanguageSetupViewController customizeSelector](self, "customizeSelector"), 64);

    BOOL v28 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self buttonTray];
    uint64_t v29 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self customizeButton];
    [v28 addButton:v29];
  }
  BOOL v30 = HFLogForCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v31 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    __int16 v34 = self;
    __int16 v35 = 2112;
    __int16 v36 = v31;
    _os_log_impl(&dword_1BE345000, v30, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HADLSVC", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUHomeAssistantDeviceLanguageSetupViewController;
  [(HUHomeAssistantDeviceLanguageSetupViewController *)&v8 viewWillDisappear:a3];
  if ([(HUHomeAssistantDeviceLanguageSetupViewController *)self isMovingFromParentViewController])
  {
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      __int16 v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    int v7 = [(HUHomeAssistantDeviceLanguageSetupViewController *)self delegate];
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

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (OBLinkTrayButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
}

- (HUPersonalRequestsEditorItemManager)prEditorItemManager
{
  return self->_prEditorItemManager;
}

- (void)setPrEditorItemManager:(id)a3
{
}

- (NSArray)supportedVoiceRecognitionLanguages
{
  return self->_supportedVoiceRecognitionLanguages;
}

- (void)setSupportedVoiceRecognitionLanguages:(id)a3
{
}

- (NSArray)homeAssistantDevicesHavingLanguageMismatch
{
  return self->_homeAssistantDevicesHavingLanguageMismatch;
}

- (void)setHomeAssistantDevicesHavingLanguageMismatch:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (BOOL)maxNumberOfVoicesReached
{
  return self->_maxNumberOfVoicesReached;
}

- (void)setMaxNumberOfVoicesReached:(BOOL)a3
{
  self->_maxNumberOfVoicesReached = a3;
}

- (BOOL)shouldSetMultiUserIsEnabled
{
  return self->_shouldSetMultiUserIsEnabled;
}

- (void)setShouldSetMultiUserIsEnabled:(BOOL)a3
{
  self->_shouldSetMultiUserIsEnabled = a3;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  self->_titleString = (NSString *)a3;
}

- (NSString)detailsString
{
  return self->_detailsString;
}

- (void)setDetailsString:(id)a3
{
  self->_detailsString = (NSString *)a3;
}

- (NSString)continueButtonString
{
  return self->_continueButtonString;
}

- (void)setContinueButtonString:(id)a3
{
  self->_continueButtonString = (NSString *)a3;
}

- (SEL)continueSelector
{
  if (self->_continueSelector) {
    return self->_continueSelector;
  }
  else {
    return 0;
  }
}

- (void)setContinueSelector:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_continueSelector = v3;
}

- (NSString)customizeButtonString
{
  return self->_customizeButtonString;
}

- (void)setCustomizeButtonString:(id)a3
{
  self->_customizeButtonString = (NSString *)a3;
}

- (SEL)customizeSelector
{
  if (self->_customizeSelector) {
    return self->_customizeSelector;
  }
  else {
    return 0;
  }
}

- (void)setCustomizeSelector:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_customizeSelector = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_homeAssistantDevicesHavingLanguageMismatch, 0);
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, 0);
  objc_storeStrong((id *)&self->_prEditorItemManager, 0);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end