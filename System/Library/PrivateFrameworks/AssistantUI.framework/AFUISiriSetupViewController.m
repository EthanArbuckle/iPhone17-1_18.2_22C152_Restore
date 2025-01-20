@interface AFUISiriSetupViewController
- (AFUISiriSetupViewController)init;
- (AFUISiriSetupViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)isVisible;
- (BOOL)lastTimeShown;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (UIStatusBar)_statusBar;
- (UIView)siriSetupView;
- (unint64_t)supportedInterfaceOrientations;
- (void)_continueTapped:(id)a3;
- (void)_continueWithLanguageCode:(id)a3 commitLanguageCodeToPreferences:(BOOL)a4;
- (void)_fetchEnablementConfiguration;
- (void)_laterTapped:(id)a3;
- (void)_presentDataSharingOptInViewController;
- (void)_setLoadingEnablementConfiguration:(BOOL)a3;
- (void)_setStatusBar:(id)a3;
- (void)aboutSelectedInTurnOnSiriView:(id)a3;
- (void)animatedAppearanceWithFactory:(id)a3 completion:(id)a4;
- (void)animatedDisappearanceWithFactory:(id)a3 completion:(id)a4;
- (void)loadView;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastTimeShown:(BOOL)a3;
- (void)setSiriSetupView:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3;
- (void)siriDataSharingOptInViewControllerDidDismissFromPresenter:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4;
@end

@implementation AFUISiriSetupViewController

- (AFUISiriSetupViewController)init
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)AFUISiriSetupViewController;
  v2 = [(AFUISiriSetupViewController *)&v29 init];
  v3 = v2;
  if (v2)
  {
    if (!v2->_contentView)
    {
      id v4 = objc_alloc(MEMORY[0x263F82E00]);
      uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      contentView = v3->_contentView;
      v3->_contentView = (UIView *)v5;

      [(UIView *)v3->_contentView setAutoresizingMask:18];
    }
    if (!v3->_setupView)
    {
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2050000000;
      v7 = (void *)getVTUITurnOnSiriViewClass_softClass;
      uint64_t v38 = getVTUITurnOnSiriViewClass_softClass;
      if (!getVTUITurnOnSiriViewClass_softClass)
      {
        uint64_t v30 = MEMORY[0x263EF8330];
        uint64_t v31 = 3221225472;
        v32 = __getVTUITurnOnSiriViewClass_block_invoke;
        v33 = &unk_264691928;
        v34 = &v35;
        __getVTUITurnOnSiriViewClass_block_invoke((uint64_t)&v30);
        v7 = (void *)v36[3];
      }
      v8 = v7;
      _Block_object_dispose(&v35, 8);
      id v9 = [v8 alloc];
      uint64_t v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      setupView = v3->_setupView;
      v3->_setupView = (VTUITurnOnSiriView *)v10;

      [(VTUITurnOnSiriView *)v3->_setupView setStateViewDelegate:v3];
      [(VTUITurnOnSiriView *)v3->_setupView setAutoresizingMask:18];
      v12 = [(VTUITurnOnSiriView *)v3->_setupView continueButton];

      if (v12)
      {
        v13 = [(VTUITurnOnSiriView *)v3->_setupView continueButton];
        [v13 addTarget:v3 action:sel__continueTapped_ forControlEvents:64];
      }
      else
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v13 = [(VTUITurnOnSiriView *)v3->_setupView continueButtons];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v26;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v13);
              }
              [*(id *)(*((void *)&v25 + 1) + 8 * v16++) addTarget:v3 action:sel__continueTapped_ forControlEvents:64];
            }
            while (v14 != v16);
            uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v39 count:16];
          }
          while (v14);
        }
      }

      v17 = [(VTUITurnOnSiriView *)v3->_setupView laterButton];
      [v17 addTarget:v3 action:sel__laterTapped_ forControlEvents:64];

      [(UIView *)v3->_contentView addSubview:v3->_setupView];
      v18 = v3->_contentView;
      v19 = [MEMORY[0x263F825C8] systemBackgroundColor];
      [(UIView *)v18 setBackgroundColor:v19];

      [(AFUISiriSetupViewController *)v3 setSiriSetupView:v3->_setupView];
    }
    if (!v3->_dataSharingOptInPresenter)
    {
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2050000000;
      v20 = (void *)getVTUISiriDataSharingOptInPresenterClass_softClass;
      uint64_t v38 = getVTUISiriDataSharingOptInPresenterClass_softClass;
      if (!getVTUISiriDataSharingOptInPresenterClass_softClass)
      {
        uint64_t v30 = MEMORY[0x263EF8330];
        uint64_t v31 = 3221225472;
        v32 = __getVTUISiriDataSharingOptInPresenterClass_block_invoke;
        v33 = &unk_264691928;
        v34 = &v35;
        __getVTUISiriDataSharingOptInPresenterClass_block_invoke((uint64_t)&v30);
        v20 = (void *)v36[3];
      }
      v21 = v20;
      _Block_object_dispose(&v35, 8);
      v22 = (VTUISiriDataSharingOptInPresenter *)objc_alloc_init(v21);
      dataSharingOptInPresenter = v3->_dataSharingOptInPresenter;
      v3->_dataSharingOptInPresenter = v22;

      [(VTUISiriDataSharingOptInPresenter *)v3->_dataSharingOptInPresenter setPresentationDelegate:v3];
      [(VTUISiriDataSharingOptInPresenter *)v3->_dataSharingOptInPresenter setSourceOfChange:7];
    }
    [(AFUISiriSetupViewController *)v3 _fetchEnablementConfiguration];
  }
  return v3;
}

- (void)_fetchEnablementConfiguration
{
  v3 = (AFEnablementFlowConfigurationProvider *)objc_alloc_init(MEMORY[0x263F28500]);
  enablementConfigurationProvider = self->_enablementConfigurationProvider;
  self->_enablementConfigurationProvider = v3;

  uint64_t v5 = [MEMORY[0x263F285A0] sharedPreferences];
  v6 = [MEMORY[0x263EFF960] currentLocale];
  v7 = [v6 localeIdentifier];
  v8 = [v5 allSiriLanguageCodesForSystemLanguageCode:v7 isGoodFit:0];

  [(AFUISiriSetupViewController *)self _setLoadingEnablementConfiguration:1];
  objc_initWeak(&location, self);
  id v9 = self->_enablementConfigurationProvider;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__AFUISiriSetupViewController__fetchEnablementConfiguration__block_invoke;
  v10[3] = &unk_264692F00;
  objc_copyWeak(&v11, &location);
  [(AFEnablementFlowConfigurationProvider *)v9 configurationForEnablementFlow:5 recognitionLanguageCodes:v8 completion:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__AFUISiriSetupViewController__fetchEnablementConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a2;
  uint64_t v5 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[AFUISiriSetupViewController _fetchEnablementConfiguration]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 127, a2);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__AFUISiriSetupViewController__fetchEnablementConfiguration__block_invoke_9;
    block[3] = &unk_2646919D8;
    objc_copyWeak(&v9, v5);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v9);
  }
}

void __60__AFUISiriSetupViewController__fetchEnablementConfiguration__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setLoadingEnablementConfiguration:0];
}

- (void)_setLoadingEnablementConfiguration:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(VTUITurnOnSiriView *)self->_setupView continueButton];
  [v5 setEnabled:!v3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(VTUITurnOnSiriView *)self->_setupView continueButtons];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setEnabled:!v3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  self->_isLoadingEnablementConfiguration = v3;
}

- (void)loadView
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AFUISiriSetupViewController;
  [(AFUISiriSetupViewController *)&v7 viewWillAppear:a3];
  id v4 = [(AFUISiriSetupViewController *)self navigationController];
  uint64_t v5 = [v4 navigationBar];

  [v5 _setHidesShadow:1];
  v6 = objc_opt_new();
  [v5 setBackgroundImage:v6 forBarMetrics:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AFUISiriSetupViewController;
  [(AFUISiriSetupViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AFUISiriSetupViewController;
  [(AFUISiriSetupViewController *)&v4 viewDidAppear:a3];
  [(AFUISiriSetupViewController *)self setVisible:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AFUISiriSetupViewController;
  [(AFUISiriSetupViewController *)&v7 viewDidDisappear:a3];
  [(AFUISiriSetupViewController *)self setVisible:0];
  objc_super v4 = [(AFUISiriSetupViewController *)self siriSetupView];
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v6[0] = *MEMORY[0x263F000D0];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v4 setTransform:v6];
}

- (void)animatedAppearanceWithFactory:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = (void *)MEMORY[0x263F29D20];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__AFUISiriSetupViewController_animatedAppearanceWithFactory_completion___block_invoke;
  v11[3] = &unk_264691A50;
  v11[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__AFUISiriSetupViewController_animatedAppearanceWithFactory_completion___block_invoke_2;
  v9[3] = &unk_264691D48;
  id v10 = v6;
  id v8 = v6;
  [v7 animateWithFactory:a3 actions:v11 completion:v9];
}

void __72__AFUISiriSetupViewController_animatedAppearanceWithFactory_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 updateHomeGestureSharingForSiriSetup:0];
  }
}

uint64_t __72__AFUISiriSetupViewController_animatedAppearanceWithFactory_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)animatedDisappearanceWithFactory:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = (void *)MEMORY[0x263F29D20];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__AFUISiriSetupViewController_animatedDisappearanceWithFactory_completion___block_invoke;
  v11[3] = &unk_264691A50;
  v11[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__AFUISiriSetupViewController_animatedDisappearanceWithFactory_completion___block_invoke_3;
  v9[3] = &unk_264691D48;
  id v10 = v6;
  id v8 = v6;
  [v7 animateWithFactory:a3 actions:v11 completion:v9];
}

void __75__AFUISiriSetupViewController_animatedDisappearanceWithFactory_completion___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) siriSetupView];
  v2 = (void *)MEMORY[0x263F82E00];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__AFUISiriSetupViewController_animatedDisappearanceWithFactory_completion___block_invoke_2;
  v4[3] = &unk_264691A50;
  id v5 = v1;
  id v3 = v1;
  [v2 animateWithDuration:v4 animations:0.5];
}

uint64_t __75__AFUISiriSetupViewController_animatedDisappearanceWithFactory_completion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v5];
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 32) frame];
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", 0.0, 0.0);
}

uint64_t __75__AFUISiriSetupViewController_animatedDisappearanceWithFactory_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setLastTimeShown:(BOOL)a3
{
  self->_lastTimeShown = a3;
  if (a3) {
    [(VTUITurnOnSiriView *)self->_setupView prepareForLastTimeShown];
  }
}

- (void)_continueTapped:(id)a3
{
  id v4 = a3;
  ADClientAddValueForScalarKey();
  id v5 = [(VTUITurnOnSiriView *)self->_setupView continueButtons];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    objc_super v7 = [(VTUITurnOnSiriView *)self->_setupView languageSelectionOfContinueButton:v4];
    selectedRecognitionLanguageCode = self->_selectedRecognitionLanguageCode;
    self->_selectedRecognitionLanguageCode = v7;
  }
  uint64_t v9 = self->_selectedRecognitionLanguageCode;
  if (!v9)
  {
    id v10 = [MEMORY[0x263F285A0] sharedPreferences];
    long long v11 = [v10 bestSupportedLanguageCodeForLanguageCode:0];
    long long v12 = self->_selectedRecognitionLanguageCode;
    self->_selectedRecognitionLanguageCode = v11;

    uint64_t v9 = self->_selectedRecognitionLanguageCode;
  }
  if ([(AFEnablementConfiguration *)self->_enablementConfiguration requiresVoiceSelectionForRecognitionLanguage:v9])
  {
    long long v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v14 = [v13 assistantUILocalizedStringFromSystemLanguageForKey:@"ASSISTANT_ENABLE_DONE" table:@"Localizable"];
    if ([(VTUISiriDataSharingOptInPresenter *)self->_dataSharingOptInPresenter shouldShowSiriDataSharingOptInView])
    {
      uint64_t v15 = [v13 assistantUILocalizedStringFromSystemLanguageForKey:@"ASSISTANT_ENABLE_NEXT" table:@"Localizable"];

      long long v14 = (void *)v15;
    }
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v14 style:0 target:0 action:0];
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v17 = (void *)getVTUIVoiceSelectionViewControllerClass_softClass;
    uint64_t v27 = getVTUIVoiceSelectionViewControllerClass_softClass;
    if (!getVTUIVoiceSelectionViewControllerClass_softClass)
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __getVTUIVoiceSelectionViewControllerClass_block_invoke;
      v23[3] = &unk_264691928;
      v23[4] = &v24;
      __getVTUIVoiceSelectionViewControllerClass_block_invoke((uint64_t)v23);
      v17 = (void *)v25[3];
    }
    v18 = v17;
    _Block_object_dispose(&v24, 8);
    v19 = objc_msgSend([v18 alloc], "initWithRecognitionLanguage:allowsRandomSelection:barButtonItemForContinue:customVoicePreviewer:delegate:", self->_selectedRecognitionLanguageCode, -[AFEnablementConfiguration voiceSelectionAllowsRandomSelection](self->_enablementConfiguration, "voiceSelectionAllowsRandomSelection"), v16, 0, self);
    v20 = [v19 navigationItem];
    [v20 setRightBarButtonItem:v16];

    v21 = [v19 navigationItem];
    [v21 setHidesBackButton:1];

    v22 = [(AFUISiriSetupViewController *)self navigationController];
    [v22 pushViewController:v19 animated:1];
  }
  else
  {
    [(AFUISiriSetupViewController *)self _continueWithLanguageCode:self->_selectedRecognitionLanguageCode commitLanguageCodeToPreferences:1];
  }
}

- (void)_continueWithLanguageCode:(id)a3 commitLanguageCodeToPreferences:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v4)
  {
    objc_super v7 = [MEMORY[0x263F285A0] sharedPreferences];
    [v7 setLanguageCode:v6];
  }
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[AFUISiriSetupViewController _continueWithLanguageCode:commitLanguageCodeToPreferences:]";
    _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s Enabling assistant and starting Siri", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v9 = [MEMORY[0x263F285A0] sharedPreferences];
  [v9 setAssistantIsEnabled:1];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  id v10 = (void *)getBYFlowSkipControllerClass_softClass;
  uint64_t v23 = getBYFlowSkipControllerClass_softClass;
  if (!getBYFlowSkipControllerClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    long long v25 = __getBYFlowSkipControllerClass_block_invoke;
    uint64_t v26 = &unk_264691928;
    uint64_t v27 = &v20;
    __getBYFlowSkipControllerClass_block_invoke((uint64_t)&buf);
    id v10 = (void *)v21[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v20, 8);
  long long v12 = objc_msgSend(v11, "sharedInstance", v20);
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  long long v13 = (void *)getBYFlowSkipIdentifierSiriSymbolLoc_ptr;
  uint64_t v23 = getBYFlowSkipIdentifierSiriSymbolLoc_ptr;
  if (!getBYFlowSkipIdentifierSiriSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    long long v25 = __getBYFlowSkipIdentifierSiriSymbolLoc_block_invoke;
    uint64_t v26 = &unk_264691928;
    uint64_t v27 = &v20;
    long long v14 = (void *)SetupAssistantLibrary();
    uint64_t v15 = dlsym(v14, "BYFlowSkipIdentifierSiri");
    *(void *)(v27[1] + 24) = v15;
    getBYFlowSkipIdentifierSiriSymbolLoc_ptr = *(void *)(v27[1] + 24);
    long long v13 = (void *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v13) {
    -[AFUISiriSetupViewController _continueWithLanguageCode:commitLanguageCodeToPreferences:]();
  }
  objc_msgSend(v12, "didCompleteFlow:", *v13, v20);

  if ([(VTUISiriDataSharingOptInPresenter *)self->_dataSharingOptInPresenter shouldShowSiriDataSharingOptInView])
  {
    [(AFUISiriSetupViewController *)self _presentDataSharingOptInViewController];
  }
  else
  {
    uint64_t v16 = [(AFUISiriSetupViewController *)self delegate];
    [v16 openSiriRequestedBySiriSetupViewController:self];
  }
  v17 = [(AFUISiriSetupViewController *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    v19 = [(AFUISiriSetupViewController *)self delegate];
    [v19 updateHomeGestureSharingForSiriSetup:1];
  }
}

- (void)_laterTapped:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[AFUISiriSetupViewController _laterTapped:]";
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s Later Tapped, dismissing", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [(AFUISiriSetupViewController *)self delegate];
  [v6 dismissSiriSetupViewController:self];

  if (self->_lastTimeShown)
  {
    objc_super v7 = [(AFUISiriSetupViewController *)self delegate];
    [v7 disableSiriActivationRequestedBySiriSetupViewController:self];
  }
}

- (void)aboutSelectedInTurnOnSiriView:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[AFUISiriSetupViewController aboutSelectedInTurnOnSiriView:]";
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s About Selected, showing siri privacy splash page", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v6 = (void *)getOBPrivacyPresenterClass_softClass;
  uint64_t v15 = getOBPrivacyPresenterClass_softClass;
  if (!getOBPrivacyPresenterClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v17 = __getOBPrivacyPresenterClass_block_invoke;
    char v18 = &unk_264691928;
    v19 = &v12;
    __getOBPrivacyPresenterClass_block_invoke((uint64_t)&buf);
    id v6 = (void *)v13[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);
  int v8 = objc_msgSend(v7, "presenterForPrivacySplashWithIdentifer:", @"com.apple.onboarding.siri", v12);
  [v8 setPresentingViewController:self];
  uint64_t v9 = [MEMORY[0x263F82670] currentDevice];
  BOOL v10 = [v9 userInterfaceIdiom] == 1;

  if (v10) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 7;
  }
  [v8 setModalPresentationStyle:v11];
  [v8 present];
}

- (void)_presentDataSharingOptInViewController
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[AFUISiriSetupViewController _presentDataSharingOptInViewController]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #siriDataSharingOptIn: Displaying DataSharingOptIn", (uint8_t *)&v8, 0xCu);
  }
  id v4 = [(VTUISiriDataSharingOptInPresenter *)self->_dataSharingOptInPresenter dataSharingOptInTextWelcomeControllerForViewStyle:0];
  dataSharingOptInViewController = self->_dataSharingOptInViewController;
  self->_dataSharingOptInViewController = v4;

  id v6 = [(OBWelcomeController *)self->_dataSharingOptInViewController navigationItem];
  [v6 setHidesBackButton:1];

  id v7 = [(AFUISiriSetupViewController *)self navigationController];
  [v7 pushViewController:self->_dataSharingOptInViewController animated:1];
}

- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3
{
}

- (void)siriDataSharingOptInViewControllerDidDismissFromPresenter:(id)a3
{
  id v4 = [(AFUISiriSetupViewController *)self delegate];
  [v4 openSiriRequestedBySiriSetupViewController:self];

  dataSharingOptInViewController = self->_dataSharingOptInViewController;
  self->_dataSharingOptInViewController = 0;

  dataSharingOptInPresenter = self->_dataSharingOptInPresenter;
  self->_dataSharingOptInPresenter = 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (SiriUIIsAllOrientationsSupported()) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v4 = [(AFUISiriSetupViewController *)self view];
  [v4 layoutSubviews];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", a3);
  char v5 = [v4 assistantIsEnabled];

  if ((v5 & 1) == 0)
  {
    id v6 = [(AFUISiriSetupViewController *)self delegate];
    [v6 dismissSiriSetupViewController:self];
  }
  int v8 = [(AFEnablementConfiguration *)self->_enablementConfiguration completionLoggingBlock];
  id v7 = [MEMORY[0x263F285A0] sharedPreferences];
  v8[2](v8, [v7 assistantIsEnabled]);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return !self->_isLoadingEnablementConfiguration;
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4
{
  char v5 = (void *)MEMORY[0x263F285A0];
  id v6 = a4;
  id v7 = [v5 sharedPreferences];
  [v7 setLanguageCode:self->_selectedRecognitionLanguageCode outputVoice:v6];

  selectedRecognitionLanguageCode = self->_selectedRecognitionLanguageCode;

  [(AFUISiriSetupViewController *)self _continueWithLanguageCode:selectedRecognitionLanguageCode commitLanguageCodeToPreferences:0];
}

- (BOOL)_canShowWhileLocked
{
  return MEMORY[0x270F72808](self, a2);
}

- (AFUISiriSetupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUISiriSetupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)lastTimeShown
{
  return self->_lastTimeShown;
}

- (UIView)siriSetupView
{
  return self->_siriSetupView;
}

- (void)setSiriSetupView:(id)a3
{
}

- (UIStatusBar)_statusBar
{
  return self->_statusBar;
}

- (void)_setStatusBar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_siriSetupView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enablementConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_enablementConfiguration, 0);
  objc_storeStrong((id *)&self->_dataSharingOptInViewController, 0);
  objc_storeStrong((id *)&self->_dataSharingOptInPresenter, 0);
  objc_storeStrong((id *)&self->_setupView, 0);
  objc_storeStrong((id *)&self->_selectedRecognitionLanguageCode, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)_continueWithLanguageCode:commitLanguageCodeToPreferences:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getBYFlowSkipIdentifierSiri(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriSetupViewController.m", 41, @"%s", dlerror());

  __break(1u);
}

@end