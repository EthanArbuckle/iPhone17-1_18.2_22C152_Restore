@interface SFDefaultBrowserServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (id)_makeDefaultBrowserInformationViewController;
- (id)_makeDefaultBrowserSelectionViewController;
- (void)_commitDefaultBrowser:(id)a3 browserChoiceResult:(int64_t)a4 defaultBrowserBundleIdentifier:(id)a5;
- (void)_hostApplicationDidEnterBackground;
- (void)_hostApplicationWillEnterForeground;
- (void)_postNotification:(id)a3;
- (void)_showConnectionErrorAlert;
- (void)_showListOfAvailableBrowsers;
- (void)_updateDefaultBrowserWithRecord:(id)a3;
- (void)didChangeDefaultBrowserWithBundleIdentifier:(id)a3 browserChoiceResult:(int64_t)a4;
- (void)didCommitDefaultBrowserChoice:(int64_t)a3;
- (void)prepareForDisplayWithCompletionHandler:(id)a3;
@end

@implementation SFDefaultBrowserServiceViewController

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC17418];
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC707E0];
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  id v5 = objc_alloc(MEMORY[0x1E4FB19E8]);
  v6 = [(SFDefaultBrowserServiceViewController *)self _makeDefaultBrowserInformationViewController];
  v7 = (UINavigationController *)[v5 initWithRootViewController:v6];
  navigationController = self->_navigationController;
  self->_navigationController = v7;

  v9 = [(UINavigationController *)self->_navigationController view];
  v10 = [(SFDefaultBrowserServiceViewController *)self view];
  [v10 bounds];
  objc_msgSend(v9, "setFrame:");

  [v9 setAutoresizingMask:18];
  [(SFDefaultBrowserServiceViewController *)self addChildViewController:self->_navigationController];
  v11 = [(SFDefaultBrowserServiceViewController *)self view];
  [v11 addSubview:v9];

  [(UINavigationController *)self->_navigationController didMoveToParentViewController:self];
  v4[2](v4, 1);
  objc_initWeak(&location, self);
  v12 = [SFDefaultBrowserListView alloc];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __80__SFDefaultBrowserServiceViewController_prepareForDisplayWithCompletionHandler___block_invoke;
  v18 = &unk_1E5C73A00;
  objc_copyWeak(&v19, &location);
  v13 = [(SFDefaultBrowserListView *)v12 initWithCompletionHandler:&v15];
  browserListView = self->_browserListView;
  self->_browserListView = v13;

  -[SFDefaultBrowserListView setDelegate:](self->_browserListView, "setDelegate:", self, v15, v16, v17, v18);
  [(SFDefaultBrowserListView *)self->_browserListView setUserCohort:self->_userCohort];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __80__SFDefaultBrowserServiceViewController_prepareForDisplayWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((a2 & 1) == 0)
  {
    id v4 = WeakRetained;
    [WeakRetained _showConnectionErrorAlert];
    id WeakRetained = v4;
  }
}

- (void)_hostApplicationDidEnterBackground
{
  [(SFDefaultBrowserListView *)self->_browserListView hostApplicationEnteredBackground];
  browserListView = self->_browserListView;

  [(SFDefaultBrowserListView *)browserListView setHostAppIsInBackground:1];
}

- (void)_hostApplicationWillEnterForeground
{
}

- (void)_showListOfAvailableBrowsers
{
  navigationController = self->_navigationController;
  id v3 = [(SFDefaultBrowserServiceViewController *)self _makeDefaultBrowserSelectionViewController];
  [(UINavigationController *)navigationController pushViewController:v3 animated:1];
}

- (id)_makeDefaultBrowserInformationViewController
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = _WBSLocalizedString();
  _SFDeviceIsPad();
  id v4 = _WBSLocalizedString();
  id v5 = +[SFDefaultBrowserPromptController sharedController];
  int v6 = [v5 hasShownBrowserChoiceScreenOnOtherDevices];

  v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  v8 = SFDefaultBrowserSelectionStateKey();
  if ([v7 integerForKey:v8]) {
    char v9 = v6;
  }
  else {
    char v9 = 1;
  }

  if ((v9 & 1) == 0) {
    self->_int64_t userCohort = 1;
  }
  if (v6)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    v10 = (uint64_t (*)(uint64_t))getDMGetUserDataDispositionSymbolLoc_ptr;
    v30 = getDMGetUserDataDispositionSymbolLoc_ptr;
    if (!getDMGetUserDataDispositionSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v32 = __getDMGetUserDataDispositionSymbolLoc_block_invoke;
      v33 = &unk_1E5C723B0;
      v34 = &v27;
      __getDMGetUserDataDispositionSymbolLoc_block_invoke((uint64_t)&buf);
      v10 = (uint64_t (*)(uint64_t))v28[3];
    }
    _Block_object_dispose(&v27, 8);
    if (!v10)
    {
      -[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:]();
      __break(1u);
    }
    if ((v10(v11) & 4) != 0)
    {
      _SFDeviceIsPad();
      uint64_t v12 = _WBSLocalizedString();

      self->_int64_t userCohort = 2;
      id v4 = (void *)v12;
    }
  }
  if (!self->_userCohort) {
    self->_int64_t userCohort = 3;
  }
  v13 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int64_t userCohort = self->_userCohort;
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = userCohort;
    _os_log_impl(&dword_1A690B000, v13, OS_LOG_TYPE_INFO, "User cohort type: %lu", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  uint64_t v15 = (void *)getOBWelcomeControllerClass_softClass_1;
  v30 = (void *)getOBWelcomeControllerClass_softClass_1;
  if (!getOBWelcomeControllerClass_softClass_1)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v32 = __getOBWelcomeControllerClass_block_invoke_1;
    v33 = &unk_1E5C723B0;
    v34 = &v27;
    __getOBWelcomeControllerClass_block_invoke_1((uint64_t)&buf);
    uint64_t v15 = (void *)v28[3];
  }
  uint64_t v16 = v15;
  _Block_object_dispose(&v27, 8);
  id v17 = [v16 alloc];
  v18 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"network", v27);
  id v19 = (void *)[v17 initWithTitle:v3 detailText:v4 icon:v18 contentLayout:2];

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v20 = (void *)getOBBoldTrayButtonClass_softClass_0;
  v30 = (void *)getOBBoldTrayButtonClass_softClass_0;
  if (!getOBBoldTrayButtonClass_softClass_0)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v32 = __getOBBoldTrayButtonClass_block_invoke_0;
    v33 = &unk_1E5C723B0;
    v34 = &v27;
    __getOBBoldTrayButtonClass_block_invoke_0((uint64_t)&buf);
    v20 = (void *)v28[3];
  }
  id v21 = v20;
  _Block_object_dispose(&v27, 8);
  v22 = objc_msgSend(v21, "boldButton", v27);
  v23 = _WBSLocalizedString();
  [v22 setTitle:v23 forState:0];

  [v22 addTarget:self action:sel__showListOfAvailableBrowsers forControlEvents:64];
  v24 = [v19 buttonTray];
  [v24 addButton:v22];

  v25 = [v19 buttonTray];
  [v25 setPrivacyLinkForBundles:&unk_1EFBDF9E8];

  return v19;
}

- (id)_makeDefaultBrowserSelectionViewController
{
  v70[4] = *MEMORY[0x1E4F143B8];
  v59 = _WBSLocalizedString();
  id v3 = [[SFDefaultBrowserListViewController alloc] initWithTitle:v59 detailText:0 icon:0 contentLayout:3];
  id v4 = [(SFDefaultBrowserListViewController *)v3 contentView];
  [v4 addSubview:self->_browserListView];

  [(SFDefaultBrowserListView *)self->_browserListView setTranslatesAutoresizingMaskIntoConstraints:0];
  v47 = (void *)MEMORY[0x1E4F28DC8];
  v63 = [(SFDefaultBrowserListView *)self->_browserListView topAnchor];
  id v5 = v3;
  v65 = [(SFDefaultBrowserListViewController *)v3 contentView];
  v57 = [v65 topAnchor];
  v55 = [v63 constraintEqualToAnchor:v57];
  v70[0] = v55;
  v50 = [(SFDefaultBrowserListView *)self->_browserListView bottomAnchor];
  v52 = [(SFDefaultBrowserListViewController *)v3 contentView];
  v48 = [v52 bottomAnchor];
  v46 = [v50 constraintEqualToAnchor:v48];
  v70[1] = v46;
  int v6 = self;
  v61 = self;
  v7 = [(SFDefaultBrowserListView *)self->_browserListView leadingAnchor];
  v8 = [(SFDefaultBrowserListViewController *)v3 contentView];
  char v9 = [v8 leadingAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v70[2] = v10;
  uint64_t v11 = [(SFDefaultBrowserListView *)v6->_browserListView trailingAnchor];
  uint64_t v12 = [(SFDefaultBrowserListViewController *)v5 contentView];
  v13 = [v12 trailingAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v70[3] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:4];
  [v47 activateConstraints:v15];

  id v58 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v58 configureWithTransparentBackground];
  v56 = [(UINavigationController *)v61->_navigationController navigationBar];
  [v56 setScrollEdgeAppearance:v58];
  [v56 setCompactAppearance:v58];
  [v56 setStandardAppearance:v58];
  uint64_t v16 = [SFDefaultBrowserPinnedHeaderView alloc];
  double v17 = *MEMORY[0x1E4F1DB28];
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v21 = -[SFDefaultBrowserPinnedHeaderView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], v18, v19, v20);
  v60 = v5;
  v22 = [(SFDefaultBrowserListViewController *)v5 view];
  [v22 addSubview:v21];

  [(SFDefaultBrowserPinnedHeaderView *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  v64 = [(SFDefaultBrowserListView *)v61->_browserListView layoutMarginsGuide];
  v49 = (void *)MEMORY[0x1E4F28DC8];
  v51 = [(SFDefaultBrowserPinnedHeaderView *)v21 topAnchor];
  v53 = [(SFDefaultBrowserListViewController *)v5 view];
  v23 = [v53 safeAreaLayoutGuide];
  v24 = [v23 topAnchor];
  v25 = [v51 constraintEqualToAnchor:v24];
  v69[0] = v25;
  v26 = v21;
  v66 = v21;
  uint64_t v27 = [(SFDefaultBrowserPinnedHeaderView *)v21 leadingAnchor];
  v28 = [v64 leadingAnchor];
  uint64_t v29 = [v27 constraintEqualToAnchor:v28];
  v69[1] = v29;
  v30 = [(SFDefaultBrowserPinnedHeaderView *)v26 trailingAnchor];
  v31 = [v64 trailingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v69[2] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
  [v49 activateConstraints:v33];

  [(SFDefaultBrowserListView *)v61->_browserListView setContainerViewController:v60];
  [(SFDefaultBrowserListView *)v61->_browserListView setHeaderView:v66];
  v34 = -[SFDefaultBrowserScrollInstructionView initWithFrame:]([SFDefaultBrowserScrollInstructionView alloc], "initWithFrame:", v17, v18, v19, v20);
  [(SFDefaultBrowserScrollInstructionView *)v34 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SFDefaultBrowserListView *)v61->_browserListView setInstructionView:v34];
  uint64_t v35 = [(SFDefaultBrowserListViewController *)v60 view];
  [v35 addSubview:v34];

  v54 = (void *)MEMORY[0x1E4F28DC8];
  v67 = [(SFDefaultBrowserScrollInstructionView *)v34 leadingAnchor];
  v62 = [v64 leadingAnchor];
  v36 = [v67 constraintEqualToAnchor:v62];
  v68[0] = v36;
  v37 = [(SFDefaultBrowserScrollInstructionView *)v34 trailingAnchor];
  v38 = [v64 trailingAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];
  v68[1] = v39;
  v40 = [(SFDefaultBrowserScrollInstructionView *)v34 bottomAnchor];
  v41 = [(SFDefaultBrowserListViewController *)v60 view];
  v42 = [v41 bottomAnchor];
  v43 = [v40 constraintEqualToAnchor:v42];
  v68[2] = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
  [v54 activateConstraints:v44];

  return v60;
}

- (void)_showConnectionErrorAlert
{
  id v3 = _WBSLocalizedString();
  id v4 = _WBSLocalizedString();
  id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v3 message:v4 preferredStyle:1];
  objc_initWeak(&location, self);
  int v6 = (void *)MEMORY[0x1E4FB1410];
  v7 = _WBSLocalizedString();
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __66__SFDefaultBrowserServiceViewController__showConnectionErrorAlert__block_invoke;
  uint64_t v12 = &unk_1E5C72B18;
  objc_copyWeak(&v13, &location);
  v8 = [v6 actionWithTitle:v7 style:1 handler:&v9];

  objc_msgSend(v5, "addAction:", v8, v9, v10, v11, v12);
  [(UINavigationController *)self->_navigationController presentViewController:v5 animated:1 completion:0];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __66__SFDefaultBrowserServiceViewController__showConnectionErrorAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _remoteViewControllerProxy];
  [v1 serviceViewControllerFailed];
}

- (void)didCommitDefaultBrowserChoice:(int64_t)a3
{
  id v4 = [(SFDefaultBrowserServiceViewController *)self _remoteViewControllerProxy];
  [v4 serviceViewControllerDidFinishWithResult:a3];
}

- (void)_postNotification:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F44628];
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  int v6 = [v4 UUID];
  v7 = [v6 UUIDString];
  id v9 = [v3 requestWithIdentifier:v7 content:v5 trigger:0];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.Preferences"];
  [v8 addNotificationRequest:v9 withCompletionHandler:&__block_literal_global_65];
}

void __59__SFDefaultBrowserServiceViewController__postNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__SFDefaultBrowserServiceViewController__postNotification___block_invoke_cold_1(v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_INFO, "Successfully posted default web browser updated notification", v5, 2u);
  }
}

- (void)_updateDefaultBrowserWithRecord:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__SFDefaultBrowserServiceViewController__updateDefaultBrowserWithRecord___block_invoke;
  v7[3] = &unk_1E5C78310;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 setDefaultWebBrowserToApplicationRecord:v6 completionHandler:v7];
}

void __73__SFDefaultBrowserServiceViewController__updateDefaultBrowserWithRecord___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __73__SFDefaultBrowserServiceViewController__updateDefaultBrowserWithRecord___block_invoke_cold_1(v5);
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F445B0]);
    v7 = _WBSLocalizedString();
    [v6 setTitle:v7];

    id v8 = NSString;
    id v9 = _WBSLocalizedString();
    uint64_t v10 = [*(id *)(a1 + 32) localizedName];
    uint64_t v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);
    [v6 setBody:v11];

    uint64_t v12 = [*(id *)(a1 + 32) bundleIdentifier];
    id v13 = (void *)MEMORY[0x1E4F1CB10];
    v14 = [NSString stringWithFormat:@"app-prefs:%@", v12];
    uint64_t v15 = [v13 URLWithString:v14];
    [v6 setDefaultActionURL:v15];

    uint64_t v16 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v17 = objc_alloc_init(MEMORY[0x1E4F224A0]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__SFDefaultBrowserServiceViewController__updateDefaultBrowserWithRecord___block_invoke_122;
    v19[3] = &unk_1E5C78310;
    v19[4] = *(void *)(a1 + 40);
    id v20 = v6;
    id v18 = v6;
    [v16 openApplicationWithBundleIdentifier:v12 usingConfiguration:v17 completionHandler:v19];
  }
}

void __73__SFDefaultBrowserServiceViewController__updateDefaultBrowserWithRecord___block_invoke_122(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __73__SFDefaultBrowserServiceViewController__updateDefaultBrowserWithRecord___block_invoke_122_cold_1(v5);
    }
  }
  [*(id *)(a1 + 32) _postNotification:*(void *)(a1 + 40)];
}

- (void)didChangeDefaultBrowserWithBundleIdentifier:(id)a3 browserChoiceResult:(int64_t)a4
{
  id v6 = a3;
  if (a4 != 2)
  {
    id v17 = 0;
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v17];
    id v8 = v17;
    if (!v7)
    {
      uint64_t v12 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SFDefaultBrowserServiceViewController didChangeDefaultBrowserWithBundleIdentifier:browserChoiceResult:](v12);
      }
      goto LABEL_12;
    }
    id v9 = [v7 bundleIdentifier];
    if (a4 == 1)
    {
      uint64_t v10 = +[SFDefaultBrowserPromptController sharedController];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __105__SFDefaultBrowserServiceViewController_didChangeDefaultBrowserWithBundleIdentifier_browserChoiceResult___block_invoke;
      v13[3] = &unk_1E5C72300;
      v13[4] = self;
      id v14 = v7;
      uint64_t v16 = 1;
      id v15 = v9;
      uint64_t v11 = [v10 browserIconReplacementAlertController:v14 completionHandler:v13];

      if (v11)
      {
        [(SFDefaultBrowserServiceViewController *)self presentViewController:v11 animated:0 completion:0];

LABEL_11:
LABEL_12:

        goto LABEL_13;
      }
    }
    [(SFDefaultBrowserServiceViewController *)self _commitDefaultBrowser:v7 browserChoiceResult:a4 defaultBrowserBundleIdentifier:v9];
    goto LABEL_11;
  }
  [(SFDefaultBrowserServiceViewController *)self didCommitDefaultBrowserChoice:2];
LABEL_13:
}

uint64_t __105__SFDefaultBrowserServiceViewController_didChangeDefaultBrowserWithBundleIdentifier_browserChoiceResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitDefaultBrowser:*(void *)(a1 + 40) browserChoiceResult:*(void *)(a1 + 56) defaultBrowserBundleIdentifier:*(void *)(a1 + 48)];
}

- (void)_commitDefaultBrowser:(id)a3 browserChoiceResult:(int64_t)a4 defaultBrowserBundleIdentifier:(id)a5
{
  id v9 = a5;
  [(SFDefaultBrowserServiceViewController *)self _updateDefaultBrowserWithRecord:a3];
  if (v9)
  {
    id v8 = [MEMORY[0x1E4F98948] sharedLogger];
    objc_msgSend(v8, "_sf_reportBrowserChoice:", v9);
  }
  [(SFDefaultBrowserServiceViewController *)self didCommitDefaultBrowserChoice:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserListView, 0);

  objc_storeStrong((id *)&self->_navigationController, 0);
}

void __59__SFDefaultBrowserServiceViewController__postNotification___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Failed to post default web browser updated notification: %{public}@", v6, v7, v8, v9, v10);
}

void __73__SFDefaultBrowserServiceViewController__updateDefaultBrowserWithRecord___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Failed to set default browser app with error: %{public}@", v6, v7, v8, v9, v10);
}

void __73__SFDefaultBrowserServiceViewController__updateDefaultBrowserWithRecord___block_invoke_122_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Failed to open application: %{public}@", v6, v7, v8, v9, v10);
}

- (void)didChangeDefaultBrowserWithBundleIdentifier:(void *)a1 browserChoiceResult:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Failed to get app record with error: %{public}@", v6, v7, v8, v9, v10);
}

@end