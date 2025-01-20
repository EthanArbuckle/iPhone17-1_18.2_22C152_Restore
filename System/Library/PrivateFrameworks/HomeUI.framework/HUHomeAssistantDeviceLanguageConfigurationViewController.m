@interface HUHomeAssistantDeviceLanguageConfigurationViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeAssistantDeviceLanguageConfigurationViewController)initWithSupportedVoiceRecognitionLanguages:(id)a3 languageMismatchedHomeAssistantDevices:(id)a4;
- (NAFuture)changeLanguageFuture;
- (NSArray)languageMismatchedHomeAssistantDevices;
- (NSArray)supportedVoiceRecognitionLanguages;
- (NSLayoutConstraint)heightAnchor;
- (NSTimer)changeLanguageTimer;
- (OBLinkTrayButton)cancelButton;
- (OBTrayButton)changeLanguageButton;
- (UIActivityIndicatorView)spinner;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_configureTitleDescriptionContentViewForCell:(id)a3;
- (id)hu_preloadContent;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)selectedLanguageIndex;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelLanguageChange;
- (void)_changeLanguage;
- (void)_hideSpinner;
- (void)_showSpinner;
- (void)dealloc;
- (void)loadView;
- (void)setCancelButton:(id)a3;
- (void)setChangeLanguageButton:(id)a3;
- (void)setChangeLanguageFuture:(id)a3;
- (void)setChangeLanguageTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeightAnchor:(id)a3;
- (void)setLanguageMismatchedHomeAssistantDevices:(id)a3;
- (void)setSelectedLanguageIndex:(int64_t)a3;
- (void)setSpinner:(id)a3;
- (void)setSupportedVoiceRecognitionLanguages:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUHomeAssistantDeviceLanguageConfigurationViewController

- (HUHomeAssistantDeviceLanguageConfigurationViewController)initWithSupportedVoiceRecognitionLanguages:(id)a3 languageMismatchedHomeAssistantDevices:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 count])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = NSStringFromSelector(a2);
    [v14 handleFailureInMethod:a2, self, @"HUHomeAssistantDeviceLanguageConfigurationViewController.m", 47, @"%@:%@ Should NOT be called with no supported languages", self, v15 object file lineNumber description];
  }
  if (![v9 count])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = NSStringFromSelector(a2);
    [v16 handleFailureInMethod:a2, self, @"HUHomeAssistantDeviceLanguageConfigurationViewController.m", 48, @"%@:%@ Should NOT be called with no HomePods in a mismatched state", self, v17 object file lineNumber description];
  }
  v10 = _HULocalizedStringWithDefaultValue(@"HULanguageChooseSiriLanguage_Title", @"HULanguageChooseSiriLanguage_Title", 1);
  v11 = _HULocalizedStringWithDefaultValue(@"HULanguageChooseSiriLanguage_Detail", @"HULanguageChooseSiriLanguage_Detail", 1);
  v18.receiver = self;
  v18.super_class = (Class)HUHomeAssistantDeviceLanguageConfigurationViewController;
  v12 = [(OBTableWelcomeController *)&v18 initWithTitle:v10 detailText:v11 icon:0];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_supportedVoiceRecognitionLanguages, a3);
    objc_storeStrong((id *)&v12->_languageMismatchedHomeAssistantDevices, a4);
    v12->_selectedLanguageIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (void)dealloc
{
  v3 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)HUHomeAssistantDeviceLanguageConfigurationViewController;
  [(HUHomeAssistantDeviceLanguageConfigurationViewController *)&v4 dealloc];
}

- (void)_changeLanguage
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v70 = self;
    __int16 v71 = 2112;
    *(void *)v72 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  objc_super v4 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self languageMismatchedHomeAssistantDevices];
  v5 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self supportedVoiceRecognitionLanguages];
  v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", -[HUHomeAssistantDeviceLanguageConfigurationViewController selectedLanguageIndex](self, "selectedLanguageIndex"));

  v50 = [MEMORY[0x1E4F1CA48] array];
  [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self _showSpinner];
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v4 count];
    *(_DWORD *)buf = 138413058;
    v70 = self;
    __int16 v71 = 2112;
    *(void *)v72 = v8;
    *(_WORD *)&v72[8] = 2112;
    *(void *)&v72[10] = v6;
    __int16 v73 = 2048;
    uint64_t v74 = v9;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@: Must change Siri language to [%@] for %lu HomePods", buf, 0x2Au);
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v4;
  uint64_t v55 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v65;
    uint64_t v49 = *MEMORY[0x1E4F67FC0];
    *(void *)&long long v10 = 138412546;
    long long v48 = v10;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v65 != v54) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        objc_opt_class();
        id v13 = v12;
        if (objc_opt_isKindOfClass()) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
        id v15 = v14;

        v16 = [MEMORY[0x1E4F4E680] voiceInfoForSessionLanguageCode:v6];
        v17 = HFLogForCategory();
        objc_super v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v19 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138413058;
            v70 = self;
            __int16 v71 = 2112;
            *(void *)v72 = v19;
            *(_WORD *)&v72[8] = 2112;
            *(void *)&v72[10] = v6;
            __int16 v73 = 2112;
            uint64_t v74 = (uint64_t)v15;
            _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@: Changing Siri language to [%@] for [%@]", buf, 0x2Au);
          }
          objc_super v18 = [objc_alloc(MEMORY[0x1E4F69598]) initWithRecognitionLanguage:v6 outputVoice:v16 defaultVoiceForRecognitionLanguage:1];
          if (v18 && objc_msgSend(v15, "hf_isReachable"))
          {
            v20 = [MEMORY[0x1E4F691A0] sharedDispatcher];
            v21 = [v20 homeManager];
            int v22 = [v21 hasOptedToHH2];

            if (v22
              || ([v15 accessory],
                  v28 = objc_claimAutoreleasedReturnValue(),
                  int v29 = objc_msgSend(v28, "hf_isSiriEndpoint"),
                  v28,
                  v29))
            {
              v30 = objc_msgSend(v15, "hf_siriLanguageOptionsManager");
              v23 = [v30 updateSelectedLanguageOption:v18];
            }
            else
            {
              v31 = objc_msgSend(v15, "hf_home");
              v32 = objc_msgSend(v15, "hf_backingAccessory");
              v30 = objc_msgSend(v31, "hf_mediaSystemForAccessory:", v32);

              if (v30) {
                objc_msgSend(v30, "hf_settingsAdapterManager");
              }
              else {
              v33 = objc_msgSend(v15, "hf_settingsAdapterManager");
              }
              v34 = objc_msgSend(v33, "adapterForIdentifier:", v49, v48);
              objc_opt_class();
              id v35 = v34;
              if (objc_opt_isKindOfClass()) {
                v36 = v35;
              }
              else {
                v36 = 0;
              }
              id v37 = v36;

              v23 = [v37 updateSelectedLanguageOption:v18];
            }
            v61[0] = MEMORY[0x1E4F143A8];
            v61[1] = 3221225472;
            v61[2] = __75__HUHomeAssistantDeviceLanguageConfigurationViewController__changeLanguage__block_invoke;
            v61[3] = &unk_1E6386978;
            SEL v63 = a2;
            id v62 = v15;
            id v38 = (id)[v23 addFailureBlock:v61];
            objc_msgSend(v50, "na_safeAddObject:", v23);
          }
          else
          {
            v23 = HFLogForCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v24 = (HUHomeAssistantDeviceLanguageConfigurationViewController *)objc_claimAutoreleasedReturnValue();
              int v25 = objc_msgSend(v15, "hf_isReachable");
              v26 = objc_msgSend(v15, "hf_displayName");
              *(_DWORD *)buf = 138412802;
              v70 = v24;
              __int16 v71 = 1024;
              *(_DWORD *)v72 = v25;
              *(_WORD *)&v72[4] = 2112;
              *(void *)&v72[6] = v26;
              _os_log_error_impl(&dword_1BE345000, v23, OS_LOG_TYPE_ERROR, "%@ Controller is reachable? %{BOOL}d. Language change failed for [%@]", buf, 0x1Cu);
            }
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v27 = (HUHomeAssistantDeviceLanguageConfigurationViewController *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v48;
          v70 = v27;
          __int16 v71 = 2112;
          *(void *)v72 = v6;
          _os_log_error_impl(&dword_1BE345000, v18, OS_LOG_TYPE_ERROR, "%@ AFVoiceInfo voiceInfoForSessionLanguageCode could not find voice info for %@ - this should NOT happen.", buf, 0x16u);
        }
      }
      uint64_t v55 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
    }
    while (v55);
  }

  v39 = [MEMORY[0x1E4F7A0D8] chainFutures:v50];
  v40 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v41 = [v39 reschedule:v40];
  [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self setChangeLanguageFuture:v41];

  v42 = (void *)[v50 count];
  objc_initWeak((id *)buf, self);
  v43 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageFuture];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __75__HUHomeAssistantDeviceLanguageConfigurationViewController__changeLanguage__block_invoke_24;
  v58[3] = &unk_1E6389780;
  objc_copyWeak(v60, (id *)buf);
  v60[1] = (id)a2;
  id v44 = v6;
  id v59 = v44;
  v60[2] = v42;
  id v45 = (id)[v43 addCompletionBlock:v58];

  v46 = (void *)MEMORY[0x1E4F1CB00];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __75__HUHomeAssistantDeviceLanguageConfigurationViewController__changeLanguage__block_invoke_29;
  v56[3] = &unk_1E6389EE0;
  objc_copyWeak(&v57, (id *)buf);
  v47 = [v46 scheduledTimerWithTimeInterval:0 repeats:v56 block:240.0];
  [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self setChangeLanguageTimer:v47];

  objc_destroyWeak(&v57);
  objc_destroyWeak(v60);
  objc_destroyWeak((id *)buf);
}

void __75__HUHomeAssistantDeviceLanguageConfigurationViewController__changeLanguage__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    objc_super v4 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
    int v5 = 138412546;
    v6 = v3;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_error_impl(&dword_1BE345000, v2, OS_LOG_TYPE_ERROR, "%@ Language change failed for %@", (uint8_t *)&v5, 0x16u);
  }
}

void __75__HUHomeAssistantDeviceLanguageConfigurationViewController__changeLanguage__block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _hideSpinner];
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    id v20 = WeakRetained;
    __int16 v21 = 2112;
    int v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = v8;
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@: Finished changing Siri language to [%@] for %lu HomePods", buf, 0x2Au);
  }
  if (v4)
  {
    long long v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138413314;
      id v20 = WeakRetained;
      __int16 v21 = 2112;
      int v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "%@:%@: Changing Siri language to [%@] for %lu HomePods, FAILED: %@", buf, 0x34u);
    }
  }
  v11 = [WeakRetained delegate];
  v17[0] = @"HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput";
  v17[1] = @"HULanguageOnboardingKey_SetupLanguage_AssistantDevice_IntendedLanguage";
  uint64_t v12 = *(void *)(a1 + 32);
  v18[0] = &unk_1F19B42E0;
  v18[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v11 viewController:WeakRetained didFinishWithConfigurationResults:v13];
}

void __75__HUHomeAssistantDeviceLanguageConfigurationViewController__changeLanguage__block_invoke_29(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained changeLanguageFuture];
  char v3 = [v2 isFinished];

  if ((v3 & 1) == 0)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v7 = 0;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "FAILED to change some HomePod languages due to timeout", v7, 2u);
    }

    int v5 = [WeakRetained changeLanguageFuture];
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "na_timeoutError");
    [v5 finishWithError:v6];
  }
}

- (void)_cancelLanguageChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v11 = self;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v6 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self delegate];
  uint64_t v8 = @"HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput";
  uint64_t v9 = &unk_1F19B42F8;
  __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v6 viewController:self didFinishWithConfigurationResults:v7];
}

- (void)_hideSpinner
{
  char v3 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self spinner];

  if (v3)
  {
    id v4 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self spinner];
    [v4 removeFromSuperview];

    [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self setSpinner:0];
    int v5 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self view];
    [v5 setNeedsLayout];
  }
  v6 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageButton];
  [v6 setHidden:0];

  id v7 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self cancelButton];
  [v7 setHidden:0];
}

- (void)_showSpinner
{
  char v3 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self spinner];

  if (v3)
  {
    id v4 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self spinner];
    [v4 removeFromSuperview];

    [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self setSpinner:0];
  }
  int v5 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageButton];
  [v5 setHidden:1];

  v6 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self cancelButton];
  [v6 setHidden:1];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self setSpinner:v7];

  uint64_t v8 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self spinner];
  [v8 sizeToFit];

  uint64_t v9 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self spinner];
  [v9 startAnimating];

  long long v10 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self spinner];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self view];
  [v15 bounds];
  double v17 = v16 * 0.5;
  objc_super v18 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self spinner];
  [v18 bounds];
  double v20 = v17 - v19 * 0.5;

  __int16 v21 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self buttonTray];
  [v21 frame];
  double v23 = v22;
  uint64_t v24 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageButton];
  [v24 frame];
  double v26 = v23 + v25;
  __int16 v27 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageButton];
  [v27 frame];
  double v28 = v26 + CGRectGetHeight(v34) * 0.5;

  uint64_t v29 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self spinner];
  objc_msgSend(v29, "setFrame:", v20, v28, v12, v14);

  v30 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self view];
  v31 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self spinner];
  [v30 addSubview:v31];

  id v32 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self view];
  [v32 setNeedsLayout];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)loadView
{
  v27.receiver = self;
  v27.super_class = (Class)HUHomeAssistantDeviceLanguageConfigurationViewController;
  [(OBTableWelcomeController *)&v27 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4F42E98]);
  id v4 = objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  int v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setDelegate:self];

  id v7 = [(OBTableWelcomeController *)self tableView];
  [v7 setDataSource:self];

  uint64_t v8 = [(OBTableWelcomeController *)self tableView];
  [v8 setAllowsSelectionDuringEditing:1];

  uint64_t v9 = [(OBTableWelcomeController *)self tableView];
  [v9 setAllowsMultipleSelection:0];

  double v10 = *MEMORY[0x1E4F43D18];
  double v11 = [(OBTableWelcomeController *)self tableView];
  [v11 setRowHeight:v10];

  double v12 = [(OBTableWelcomeController *)self tableView];
  [v12 setAlwaysBounceVertical:0];

  double v13 = [(OBTableWelcomeController *)self tableView];
  double v14 = [v13 heightAnchor];
  uint64_t v15 = [(OBTableWelcomeController *)self tableView];
  [v15 contentSize];
  double v17 = [v14 constraintEqualToConstant:v16];
  [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self setHeightAnchor:v17];

  objc_super v18 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self heightAnchor];
  [v18 setActive:1];

  double v19 = [(OBTableWelcomeController *)self tableView];
  [v19 separatorInset];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = [(OBTableWelcomeController *)self tableView];
  objc_msgSend(v26, "setSeparatorInset:", v21, v23, v25, 28.0);
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self view];
  [v3 layoutIfNeeded];

  id v4 = [(OBTableWelcomeController *)self tableView];
  [v4 contentSize];
  double v6 = v5;
  id v7 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self heightAnchor];
  [v7 setConstant:v6];

  uint64_t v8 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v9 = [(OBTableWelcomeController *)self tableView];
  [v9 setBackgroundColor:v8];

  v10.receiver = self;
  v10.super_class = (Class)HUHomeAssistantDeviceLanguageConfigurationViewController;
  [(OBTableWelcomeController *)&v10 viewDidLayoutSubviews];
}

- (id)_configureTitleDescriptionContentViewForCell:(id)a3
{
  id v4 = a3;
  double v5 = [v4 contentView];
  double v6 = [v5 subviews];
  if ([v6 count])
  {
    id v7 = [v4 contentView];
    uint64_t v8 = [v7 subviews];
    uint64_t v9 = [v8 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v9 = 0;
  }

  objc_opt_class();
  objc_super v10 = v9;
  if (objc_opt_isKindOfClass()) {
    double v11 = v10;
  }
  else {
    double v11 = 0;
  }
  double v12 = v11;

  double v13 = v10;
  if (!v12)
  {
    double v14 = [HUTitleDescriptionContentView alloc];
    double v13 = -[HUTitleDescriptionContentView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HUTitleDescriptionContentView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v15 = [v4 contentView];
    [v15 addSubview:v13];

    double v16 = [(HUTitleDescriptionContentView *)v13 leadingAnchor];
    double v17 = [v4 contentView];
    objc_super v18 = [v17 leadingAnchor];
    double v19 = [(OBTableWelcomeController *)self tableView];
    [v19 separatorInset];
    double v21 = [v16 constraintEqualToAnchor:v18 constant:v20];
    [v21 setActive:1];

    double v22 = [(HUTitleDescriptionContentView *)v13 topAnchor];
    double v23 = [v4 contentView];
    double v24 = [v23 topAnchor];
    double v25 = [v22 constraintEqualToAnchor:v24 constant:5.0];
    [v25 setActive:1];

    double v26 = [(HUTitleDescriptionContentView *)v13 bottomAnchor];
    objc_super v27 = [v4 contentView];
    double v28 = [v27 bottomAnchor];
    uint64_t v29 = [v26 constraintEqualToAnchor:v28 constant:-5.0];
    [v29 setActive:1];

    v30 = [(HUTitleDescriptionContentView *)v13 trailingAnchor];
    v31 = [v4 contentView];
    id v32 = [v31 trailingAnchor];
    v33 = [v30 constraintEqualToAnchor:v32];
    [v33 setActive:1];
  }

  return v13;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self supportedVoiceRecognitionLanguages];
  int64_t v5 = [v4 count] + 1;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = NSString;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA20];
  id v9 = a3;
  objc_super v10 = [v8 currentLocale];
  double v11 = [v10 languageCode];
  double v12 = [MEMORY[0x1E4F1CA20] currentLocale];
  double v13 = [v12 countryCode];
  double v14 = [v7 stringWithFormat:@"%@-%@", v11, v13];

  uint64_t v15 = [v9 dequeueReusableCellWithIdentifier:@"language_code_cell_identifier"];

  if (!v15) {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:0 reuseIdentifier:@"language_code_cell_identifier"];
  }
  [v15 setSelectionStyle:0];
  if ([v6 row])
  {
    double v16 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self supportedVoiceRecognitionLanguages];
    double v17 = objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v6, "row") - 1);

    objc_super v18 = [MEMORY[0x1E4F4E4C8] sharedInstance];
    double v19 = [v18 localizedNameForSiriLanguage:v17 inDisplayLanguage:0];

    double v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v29 = v17;
      __int16 v30 = 2112;
      v31 = v19;
      __int16 v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "languageCode = %@ localizedLanguageName = %@ localeString = %@", buf, 0x20u);
    }

    if ([v17 isEqualToString:v14])
    {
      -[HUHomeAssistantDeviceLanguageConfigurationViewController setSelectedLanguageIndex:](self, "setSelectedLanguageIndex:", [v6 row] - 1);
      [v15 setAccessoryType:3];
      double v21 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageButton];
      [v21 setEnabled:1];
    }
    else
    {
      [v15 setAccessoryType:0];
    }
    double v26 = [v15 textLabel];
    [v26 setText:v19];
  }
  else
  {
    double v22 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self _configureTitleDescriptionContentViewForCell:v15];
    double v23 = _HULocalizedStringWithDefaultValue(@"HULanguageSupportedLangugages_TableHeader_Title", @"HULanguageSupportedLangugages_TableHeader_Title", 1);
    [v22 setTitleText:v23];

    double v24 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
    [v22 setTitleFont:v24];

    double v25 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [v22 setTitleTextColor:v25];
  }

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([v6 row] >= 1)
  {
    int64_t v7 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self selectedLanguageIndex]+ 1;
    uint64_t v8 = [v12 cellForRowAtIndexPath:v6];
    [v8 setAccessoryType:3];
    -[HUHomeAssistantDeviceLanguageConfigurationViewController setSelectedLanguageIndex:](self, "setSelectedLanguageIndex:", [v6 row] - 1);
    id v9 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageButton];
    [v9 setEnabled:1];

    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 != [v6 row])
    {
      objc_super v10 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 inSection:0];
      double v11 = [v12 cellForRowAtIndexPath:v10];

      [v11 setAccessoryType:0];
    }
  }
}

- (void)viewDidLoad
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)HUHomeAssistantDeviceLanguageConfigurationViewController;
  [(OBTableWelcomeController *)&v50 viewDidLoad];
  [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self setModalInPresentation:1];
  id v4 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self headerView];
  int64_t v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5C78];

  id v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self setChangeLanguageButton:v6];

  int64_t v7 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v8 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageButton];
  [v8 setEnabled:0];

  id v9 = _HULocalizedStringWithDefaultValue(@"HULanguageChangeLanguage_Button_Title", @"HULanguageChangeLanguage_Button_Title", 1);
  objc_super v10 = _HULocalizedStringWithDefaultValue(@"HULanguageKeepUsingCurrentHomePodLanguages_Button_Title", @"HULanguageKeepUsingCurrentHomePodLanguages_Button_Title", 1);
  double v11 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self languageMismatchedHomeAssistantDevices];
  unint64_t v12 = [v11 count];

  if (v12 < 2)
  {
    double v14 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self languageMismatchedHomeAssistantDevices];
    uint64_t v15 = [v14 count];

    if (v15 != 1) {
      goto LABEL_16;
    }
    objc_opt_class();
    double v16 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self languageMismatchedHomeAssistantDevices];
    double v13 = [v16 firstObject];
    if (objc_opt_isKindOfClass()) {
      double v17 = v13;
    }
    else {
      double v17 = 0;
    }
    id v18 = v17;

    if (v18)
    {
      double v19 = objc_msgSend(v18, "hf_siriLanguageOptionsManager");
      double v20 = [v19 selectedLanguageOption];

      if (!v20)
      {
        double v21 = objc_msgSend(v18, "hf_settingsAdapterManager");
        double v22 = [v21 adapterForIdentifier:*MEMORY[0x1E4F67FC0]];
        objc_opt_class();
        id v23 = v22;
        if (objc_opt_isKindOfClass()) {
          double v24 = v23;
        }
        else {
          double v24 = 0;
        }
        id v25 = v24;

        double v20 = [v25 selectedLanguageOption];
      }
      double v26 = [v20 localizedRecognitionLanguage];
      uint64_t v33 = HULocalizedStringWithFormat(@"HULanguageKeepUsingHomePodLanguage_Button_Title", @"%@", v27, v28, v29, v30, v31, v32, (uint64_t)v26);

      objc_super v10 = (void *)v33;
    }
    else
    {
      double v13 = 0;
    }
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HULanguageChangeAllSiriLanguages_Button_Title", @"HULanguageChangeAllSiriLanguages_Button_Title", 1);
    id v9 = v13 = v9;
  }

LABEL_16:
  uint64_t v34 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageButton];
  [v34 setTitle:v9 forState:0];

  id v35 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageButton];
  [v35 setAccessibilityIdentifier:@"Home.Onboarding.LanguageSetUp.Configuration.ChangeLanguageButton"];

  v36 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageButton];
  [v36 addTarget:self action:sel__changeLanguage forControlEvents:64];

  id v37 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self buttonTray];
  id v38 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self changeLanguageButton];
  [v37 addButton:v38];

  v39 = [MEMORY[0x1E4F83AB8] linkButton];
  [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self setCancelButton:v39];

  v40 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self cancelButton];
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];

  v41 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self cancelButton];
  [v41 setTitle:v10 forState:0];

  v42 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self cancelButton];
  [v42 setAccessibilityIdentifier:@"Home.Onboarding.Configuration.LanguageSetUp.CancelButton"];

  v43 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self cancelButton];
  [v43 addTarget:self action:sel__cancelLanguageChange forControlEvents:64];

  id v44 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self buttonTray];
  id v45 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self cancelButton];
  [v44 addButton:v45];

  v46 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self buttonTray];
  v47 = HULocalizedModelString(@"HULanguageCanRecognizeMultipleVoices_FinePrint");
  [v46 setCaptionText:v47];

  long long v48 = HFLogForCategory();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v49 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v52 = self;
    __int16 v53 = 2112;
    uint64_t v54 = v49;
    _os_log_impl(&dword_1BE345000, v48, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HADLCVC", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUHomeAssistantDeviceLanguageConfigurationViewController;
  [(HUHomeAssistantDeviceLanguageConfigurationViewController *)&v8 viewWillDisappear:a3];
  if ([(HUHomeAssistantDeviceLanguageConfigurationViewController *)self isMovingFromParentViewController])
  {
    int64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      objc_super v10 = self;
      __int16 v11 = 2112;
      unint64_t v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    int64_t v7 = [(HUHomeAssistantDeviceLanguageConfigurationViewController *)self delegate];
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

- (OBTrayButton)changeLanguageButton
{
  return self->_changeLanguageButton;
}

- (void)setChangeLanguageButton:(id)a3
{
}

- (OBLinkTrayButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (NSArray)supportedVoiceRecognitionLanguages
{
  return self->_supportedVoiceRecognitionLanguages;
}

- (void)setSupportedVoiceRecognitionLanguages:(id)a3
{
}

- (NSArray)languageMismatchedHomeAssistantDevices
{
  return self->_languageMismatchedHomeAssistantDevices;
}

- (void)setLanguageMismatchedHomeAssistantDevices:(id)a3
{
}

- (int64_t)selectedLanguageIndex
{
  return self->_selectedLanguageIndex;
}

- (void)setSelectedLanguageIndex:(int64_t)a3
{
  self->_selectedLanguageIndex = a3;
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (NAFuture)changeLanguageFuture
{
  return self->_changeLanguageFuture;
}

- (void)setChangeLanguageFuture:(id)a3
{
}

- (NSTimer)changeLanguageTimer
{
  return self->_changeLanguageTimer;
}

- (void)setChangeLanguageTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeLanguageTimer, 0);
  objc_storeStrong((id *)&self->_changeLanguageFuture, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_languageMismatchedHomeAssistantDevices, 0);
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_changeLanguageButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end