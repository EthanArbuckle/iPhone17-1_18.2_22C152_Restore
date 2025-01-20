@interface CNFRegWizardController
+ (void)setGlobalAppearanceStyle:(int64_t)a3;
+ (void)setSupportsAutoRotation:(BOOL)a3;
- (BOOL)allowCancel;
- (BOOL)allowSMS;
- (BOOL)canShowDisabledScreen;
- (BOOL)canShowSplashScreen;
- (BOOL)canStartNested;
- (BOOL)hideLearnMoreButton;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldListenForSuspension;
- (BOOL)shouldShowFirstRunController;
- (BOOL)shouldTerminateInBackground;
- (BOOL)showSplashOnSignin;
- (BOOL)skipReloadOnNextViewWillAppear;
- (CNFRegController)regController;
- (CNFRegWizardController)init;
- (CNFRegWizardController)initWithRegController:(id)a3;
- (CNFRegWizardController)initWithServiceTypes:(int64_t)a3;
- (CNFRegWizardControllerDelegate)firstRunDelegate;
- (_UIBackdropView)backdropView;
- (id)controllerClassesToShow:(BOOL)a3;
- (id)controllersToShow;
- (id)controllersToShow:(BOOL)a3;
- (id)popViewControllerAnimated:(BOOL)a3;
- (id)popViewControllerWithTransition:(int)a3;
- (int)_firstRunState:(id)a3;
- (void)_applicationDidEnterBackground;
- (void)_checkRestrictions;
- (void)_doCancel;
- (void)_startListeningForResignResume;
- (void)_stopListeningForResignResume;
- (void)_updateNavigationBarHiddenForCurrentState;
- (void)_updateNavigationBarHiddenForPop;
- (void)_updateNavigationBarHiddenForPush;
- (void)_updateNavigationBarTitle;
- (void)applicationDidResume;
- (void)applicationWillSuspend;
- (void)dealloc;
- (void)dismissFinished:(BOOL)a3;
- (void)dismissWithState:(unint64_t)a3;
- (void)firstRunController:(id)a3 finishedWithState:(unint64_t)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 transition:(int)a4;
- (void)setAllowCancel:(BOOL)a3;
- (void)setAllowSMS:(BOOL)a3;
- (void)setBackdropView:(id)a3;
- (void)setCanShowDisabledScreen:(BOOL)a3;
- (void)setCanShowSplashScreen:(BOOL)a3;
- (void)setCanStartNested:(BOOL)a3;
- (void)setFirstRunDelegate:(id)a3;
- (void)setHideLearnMoreButton:(BOOL)a3;
- (void)setRegController:(id)a3;
- (void)setShouldListenForSuspension:(BOOL)a3;
- (void)setShouldTerminateInBackground:(BOOL)a3;
- (void)setShowSplashOnSignin:(BOOL)a3;
- (void)setSkipReloadOnNextViewWillAppear:(BOOL)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)setupController;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNFRegWizardController

- (CNFRegWizardController)initWithRegController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNFRegWizardController;
  v5 = [(PSSetupController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_wizardFlags |= 2u;
    if (!v4)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v5->_serviceType = [v4 serviceType];
    [(CNFRegWizardController *)v6 setRegController:v4];
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v6 selector:sel__restrictionsChanged name:*MEMORY[0x263F3BB10] object:0];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v6 selector:sel__applicationDidFinishLaunching name:*MEMORY[0x263F83338] object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v6 selector:sel__applicationDidEnterBackground name:*MEMORY[0x263F83330] object:0];
  }
  v10 = v6;
LABEL_6:

  return v10;
}

- (CNFRegWizardController)initWithServiceTypes:(int64_t)a3
{
  id v4 = +[CNFRegController controllerForServiceType:a3];
  v5 = [(CNFRegWizardController *)self initWithRegController:v4];

  return v5;
}

- (CNFRegWizardController)init
{
  return [(CNFRegWizardController *)self initWithServiceTypes:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  self->_firstRunDelegate = 0;
  [(CNFRegWizardController *)self _stopListeningForResignResume];
  v4.receiver = self;
  v4.super_class = (Class)CNFRegWizardController;
  [(PSRootController *)&v4 dealloc];
}

- (int)_firstRunState:(id)a3
{
  id v4 = a3;
  v5 = [(CNFRegWizardController *)self regController];
  if (([v5 isConnected] & 1) == 0) {
    [v5 connect:1];
  }
  int v6 = [v5 accountState:v4];
  if ((v6 & 4) != 0) {
    int v7 = 4;
  }
  else {
    int v7 = 3;
  }
  if ((v6 & 2) != 0) {
    int v8 = v7;
  }
  else {
    int v8 = 2;
  }
  if (v6) {
    int v9 = v8;
  }
  else {
    int v9 = 1;
  }
  if ((v6 & 0x20000000) != 0) {
    int v10 = 5;
  }
  else {
    int v10 = v9;
  }

  return v10;
}

- (void)_checkRestrictions
{
  if ([(CNFRegWizardController *)self shouldShowFirstRunController]
    && ![(CNFRegWizardController *)self shouldTerminateInBackground])
  {
    v3 = [MEMORY[0x263F3BB18] sharedInstance];
    int v4 = [v3 accountModificationRestricted];

    if (v4)
    {
      CNFRegSetStringTableForServiceType(self->_serviceType);
      v5 = CommunicationsSetupUIBundle();
      int v6 = CNFRegStringTableName();
      int v7 = [v5 localizedStringForKey:@"FACETIME_ACCOUNT_RESTRICTION_ERROR_TITLE" value:&stru_26D05D4F8 table:v6];

      int v8 = CNFRegStringTableName();
      int v9 = CommunicationsSetupUIBundle();
      int v10 = CNFLocalizedStringFromTableInBundleWithFallback(@"FACETIME_ACCOUNT_CREATION_ERROR_MESSAGE", v8, v9);

      v11 = CommunicationsSetupUIBundle();
      objc_super v12 = CNFRegStringTableName();
      v13 = [v11 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v12];

      [(CNFRegWizardController *)self setShouldTerminateInBackground:1];
      v14 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v10 preferredStyle:1];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __44__CNFRegWizardController__checkRestrictions__block_invoke;
      v16[3] = &unk_2644F0988;
      v16[4] = self;
      v15 = [MEMORY[0x263F82400] actionWithTitle:v13 style:0 handler:v16];
      [v14 addAction:v15];

      [(CNFRegWizardController *)self presentViewController:v14 animated:1 completion:0];
    }
  }
}

void __44__CNFRegWizardController__checkRestrictions__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F3BB18] sharedInstance];
  int v3 = [v2 accountModificationRestricted];

  if (v3)
  {
    id v5 = [MEMORY[0x263F82438] sharedApplication];
    [v5 suspend];
  }
  else
  {
    int v4 = *(void **)(a1 + 32);
    [v4 setShouldTerminateInBackground:0];
  }
}

- (id)controllerClassesToShow:(BOOL)a3
{
  id v5 = [(CNFRegWizardController *)self regController];
  int v6 = [v5 isServiceSupported];

  if (!v6)
  {
    id v10 = 0;
    goto LABEL_17;
  }
  int v7 = [(CNFRegWizardController *)self regController];
  int v8 = [v7 appleIDAccounts];
  unsigned int v9 = [(CNFRegWizardController *)self _firstRunState:v8];

  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v9 < 4
    || ([(CNFRegWizardController *)self regController],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 hasFailedLogin],
        v11,
        v12))
  {
    id v13 = (id)objc_opt_class();
    if (v9 != 2)
    {
      if (v9 != 3)
      {
        BOOL v14 = [(CNFRegWizardController *)self canShowSplashScreen];
        uint64_t v15 = (uint64_t)v13;
        if (!v14)
        {
LABEL_14:
          [v10 addObject:v15];
          goto LABEL_15;
        }
LABEL_13:
        uint64_t v15 = objc_opt_class();
        goto LABEL_14;
      }
      if (!a3)
      {
LABEL_15:

        goto LABEL_17;
      }
    }
    [v10 addObject:v13];
    goto LABEL_13;
  }
  if (v9 == 5) {
    [(CNFRegWizardController *)self canShowDisabledScreen];
  }
  [v10 addObject:objc_opt_class()];
LABEL_17:
  return v10;
}

- (id)controllersToShow:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNFRegWizardController *)self regController];
  int v6 = [v5 isServiceSupported];

  if (v6)
  {
    int v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Getting controllers to show", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    int v8 = [(CNFRegWizardController *)self controllerClassesToShow:v3];
    unsigned int v9 = v8;
    if ((*(_WORD *)&self->_wizardFlags & 4) == 0 && [v8 count])
    {
      id v10 = (void *)MEMORY[0x263EFF8C0];
      v11 = [v9 objectAtIndex:0];
      uint64_t v12 = [v10 arrayWithObject:v11];

      unsigned int v9 = (void *)v12;
    }
    if (v9 && [v9 count])
    {
      id v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
      if ([v9 count])
      {
        unint64_t v14 = 0;
        do
        {
          uint64_t v15 = (objc_class *)(id)[v9 objectAtIndex:v14];
          v16 = [(CNFRegWizardController *)self regController];
          v17 = [v16 appleIDAccounts];

          if ([v17 count])
          {
            v18 = [v17 objectAtIndex:0];
          }
          else
          {
            v18 = 0;
          }
          id v19 = [v15 alloc];
          v20 = [(CNFRegWizardController *)self regController];
          v21 = (void *)[v19 initWithRegController:v20 account:v18];

          if (objc_opt_respondsToSelector()) {
            [v21 setHideLearnMoreButton:(*(_WORD *)&self->_wizardFlags >> 5) & 1];
          }
          if (!v14 && (*(_WORD *)&self->_wizardFlags & 0x100) != 0)
          {
            v22 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__doCancel];
            [v21 setCustomLeftButton:v22];
          }
          [v13 addObject:v21];

          ++v14;
        }
        while (v14 < [v9 count]);
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

- (id)controllersToShow
{
  return [(CNFRegWizardController *)self controllersToShow:1];
}

- (BOOL)shouldShowFirstRunController
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  BOOL v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "shouldShowFirstRunController", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  int v4 = [(CNFRegWizardController *)self regController];
  char v5 = [v4 isServiceSupported];

  if ((v5 & 1) == 0)
  {
    unsigned int v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "Service is not supported", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !IMShouldLog()) {
      goto LABEL_19;
    }
LABEL_18:
    IMLogString();
LABEL_19:
    LOBYTE(v10) = 0;
    return v10;
  }
  int v6 = [MEMORY[0x263F3BB18] sharedInstance];
  if ([v6 supportsSMSIdentification])
  {
    BOOL v7 = (*(_WORD *)&self->_wizardFlags & 0x200) == 0;

    if (v7)
    {
      int v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "SMS identification is supported", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled() || !IMShouldLog()) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else
  {
  }
  v11 = [(CNFRegWizardController *)self regController];
  char v12 = [v11 isConnected];

  if ((v12 & 1) == 0)
  {
    id v13 = [(CNFRegWizardController *)self regController];
    [v13 connect:1];
  }
  unint64_t v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "Checking to see if we need to show the first-run experience", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  CNFRegLogIndent();
  uint64_t v15 = [(CNFRegWizardController *)self regController];
  v16 = [v15 accounts];
  uint64_t v17 = [(CNFRegWizardController *)self _firstRunState:v16];

  v18 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v17;
    _os_log_impl(&dword_21ED18000, v18, OS_LOG_TYPE_DEFAULT, "State: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v25 = v17;
    IMLogString();
  }
  BOOL v19 = v17 < 4;
  v20 = [(CNFRegWizardController *)self regController];
  int v21 = [v20 isServiceEnabled];

  int v10 = v21 ^ 1 | v19;
  v22 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = @"NO";
    if (v10) {
      v23 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v27 = v23;
    _os_log_impl(&dword_21ED18000, v22, OS_LOG_TYPE_DEFAULT, "Should show first run controller:%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  CNFRegLogOutdent();
  return v10;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CNFRegWizardController;
  [(CNFRegWizardController *)&v6 viewDidLoad];
  BOOL v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "View did load", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  int v4 = [(CNFRegWizardController *)self view];
  [v4 setClipsToBounds:1];

  [(CNFRegWizardController *)self setupController];
}

- (void)setupController
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Setting up wizard controller", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  CNFRegSetStringTableForServiceType(self->_serviceType);
  uint64_t v3 = CNFRegGlobalAppearanceStyle();
  switch(v3)
  {
    case 6:
      char v5 = [(CNFRegWizardController *)self navigationBar];
      [v5 setBarStyle:1];

      [(CNFRegWizardController *)self _setClipUnderlapWhileTransitioning:1];
      break;
    case 5:
      [(CNFRegWizardController *)self _setClipUnderlapWhileTransitioning:1];
      break;
    case 3:
      int v4 = [(CNFRegWizardController *)self navigationBar];
      [v4 setBarStyle:1];

      break;
  }
  v49 = CNFRegGlobalAppearanceController();
  objc_super v6 = [v49 navigationBarTintColor];
  BOOL v7 = [(CNFRegWizardController *)self navigationBar];
  [v7 setBarTintColor:v6];

  uint64_t v8 = [v49 navigationBarTranslucent];
  unsigned int v9 = [(CNFRegWizardController *)self navigationBar];
  [v9 setTranslucent:v8];

  uint64_t v10 = [v49 navigationBarHidesShadow];
  v11 = [(CNFRegWizardController *)self navigationBar];
  [v11 _setHidesShadow:v10];

  v48 = [v49 navigationBarBackgroundImage];
  if (v48)
  {
    char v12 = [(CNFRegWizardController *)self navigationBar];
    [v12 setBackgroundImage:v48 forBarPosition:0 barMetrics:0];
  }
  id v13 = [(CNFRegWizardController *)self controllerClassesToShow:1];
  v50 = [(CNFRegWizardController *)self viewControllers];
  if ((*(_WORD *)&self->_wizardFlags & 4) == 0 && [v13 count])
  {
    unint64_t v14 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v15 = [v13 objectAtIndex:0];
    uint64_t v16 = [v14 arrayWithObject:v15];

    id v13 = (void *)v16;
  }
  uint64_t v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_DEFAULT, "  => Controller classes to show:", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v13;
  uint64_t v18 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v63 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        v22 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v69 = v21;
          _os_log_impl(&dword_21ED18000, v22, OS_LOG_TYPE_DEFAULT, "    => %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          uint64_t v47 = v21;
          IMLogString();
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v18);
  }

  v23 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v23, OS_LOG_TYPE_DEFAULT, "  => Current controller stack:", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v51 = v50;
  uint64_t v24 = [v51 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v59 != v25) {
          objc_enumerationMutation(v51);
        }
        uint64_t v27 = *(void *)(*((void *)&v58 + 1) + 8 * j);
        uint64_t v28 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v69 = v27;
          _os_log_impl(&dword_21ED18000, v28, OS_LOG_TYPE_DEFAULT, "    => %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          uint64_t v47 = v27;
          IMLogString();
        }
      }
      uint64_t v24 = [v51 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v24);
  }

  if ([v51 count])
  {
    uint64_t v29 = [obj count];
    if (v29 == [v51 count])
    {
      if (![obj count]) {
        goto LABEL_81;
      }
      uint64_t v30 = 0;
      while (1)
      {
        v31 = objc_msgSend(v51, "objectAtIndex:", v30, v47);
        id v32 = (id)[obj objectAtIndex:v30];
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          break;
        }
        if ([obj count] <= (unint64_t)++v30) {
          goto LABEL_81;
        }
      }
    }
  }
  v34 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v34, OS_LOG_TYPE_DEFAULT, "  => Should reload controllers", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  v35 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = (*(_WORD *)&self->_wizardFlags >> 2) & 1;
    *(_DWORD *)buf = 67109120;
    LODWORD(v69) = v36;
    _os_log_impl(&dword_21ED18000, v35, OS_LOG_TYPE_DEFAULT, "  => Can start nested: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v47 = (*(_WORD *)&self->_wizardFlags >> 2) & 1;
    IMLogString();
  }
  v37 = -[CNFRegWizardController controllersToShow:](self, "controllersToShow:", 1, v47);
  v38 = v37;
  if ((*(_WORD *)&self->_wizardFlags & 4) != 0)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v42 = v37;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(v42);
          }
          v46 = *(void **)(*((void *)&v54 + 1) + 8 * k);
          [v46 setRootController:self];
          [v46 setParentController:self];
          [v46 setDelegate:self];
        }
        uint64_t v43 = [v42 countByEnumeratingWithState:&v54 objects:v66 count:16];
      }
      while (v43);
    }

    [(CNFRegWizardController *)self setViewControllers:v42];
  }
  else
  {
    v39 = [v37 objectAtIndex:0];
    v40 = v39;
    if (v39)
    {
      [v39 setRootController:self];
      [v40 setParentController:self];
      [v40 setDelegate:self];
      v41 = [MEMORY[0x263EFF8C0] arrayWithObject:v40];
      [(CNFRegWizardController *)self setViewControllers:v41];
    }
  }

LABEL_81:
}

- (void)_updateNavigationBarTitle
{
  id v7 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v7 navigationBarHidesTitle])
  {
    id v3 = objc_alloc(MEMORY[0x263F82E00]);
    int v4 = objc_msgSend(v3, "initWithSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    char v5 = [(CNFRegWizardController *)self navigationBar];
    objc_super v6 = [v5 topItem];
    [v6 setTitleView:v4];
  }
}

- (void)_updateNavigationBarHiddenForPush
{
  id v3 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v3 firstNavigationBarHidden]) {
    [(CNFRegWizardController *)self setNavigationBarHidden:0];
  }
  [(CNFRegWizardController *)self _updateNavigationBarTitle];
}

- (void)_updateNavigationBarHiddenForPop
{
  id v4 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v4 firstNavigationBarHidden])
  {
    id v3 = [(CNFRegWizardController *)self viewControllers];
    -[CNFRegWizardController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", [v3 count] == 2, 1);
  }
  [(CNFRegWizardController *)self _updateNavigationBarTitle];
}

- (void)_updateNavigationBarHiddenForCurrentState
{
  id v4 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v4 firstNavigationBarHidden])
  {
    id v3 = [(CNFRegWizardController *)self viewControllers];
    -[CNFRegWizardController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", [v3 count] == 1, 0);
  }
  [(CNFRegWizardController *)self _updateNavigationBarTitle];
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CNFRegWizardController;
  [(PSRootController *)&v5 setViewControllers:a3 animated:a4];
  [(CNFRegWizardController *)self _updateNavigationBarHiddenForCurrentState];
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CNFRegWizardController *)self _updateNavigationBarHiddenForPop];
  v7.receiver = self;
  v7.super_class = (Class)CNFRegWizardController;
  objc_super v5 = [(PSRootController *)&v7 popViewControllerAnimated:v3];
  return v5;
}

- (id)popViewControllerWithTransition:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(CNFRegWizardController *)self _updateNavigationBarHiddenForPop];
  v7.receiver = self;
  v7.super_class = (Class)CNFRegWizardController;
  objc_super v5 = [(CNFRegWizardController *)&v7 popViewControllerWithTransition:v3];
  return v5;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CNFRegWizardController *)self _updateNavigationBarHiddenForPush];
  v7.receiver = self;
  v7.super_class = (Class)CNFRegWizardController;
  [(CNFRegWizardController *)&v7 pushViewController:v6 transition:v4];
}

- (void)pushViewController:(id)a3 transition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(CNFRegWizardController *)self _updateNavigationBarHiddenForPush];
  v7.receiver = self;
  v7.super_class = (Class)CNFRegWizardController;
  [(CNFRegWizardController *)&v7 pushViewController:v6 transition:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  CNFRegSetStringTableForServiceType(self->_serviceType);
  __int16 wizardFlags = (__int16)self->_wizardFlags;
  if ((wizardFlags & 0x80) != 0) {
    *(_WORD *)&self->___int16 wizardFlags = wizardFlags & 0xFF7F;
  }
  else {
    [(CNFRegWizardController *)self setupController];
  }
  if (CNFRegGlobalAppearanceStyle() == 3)
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Setting bar style to black", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    objc_super v7 = [(CNFRegWizardController *)self navigationBar];
    [v7 setBarStyle:1];
  }
  v8.receiver = self;
  v8.super_class = (Class)CNFRegWizardController;
  [(CNFRegWizardController *)&v8 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  __int16 IsAutomaticAppearanceEnabled = UIKeyboardIsAutomaticAppearanceEnabled();
  *(_WORD *)&self->___int16 wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFFE | IsAutomaticAppearanceEnabled ^ 1;
  if ((IsAutomaticAppearanceEnabled & 1) == 0) {
    UIKeyboardEnableAutomaticAppearance();
  }
  [(CNFRegWizardController *)self _startListeningForResignResume];
  v6.receiver = self;
  v6.super_class = (Class)CNFRegWizardController;
  [(CNFRegWizardController *)&v6 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegWizardController;
  [(PSSetupController *)&v4 viewWillDisappear:a3];
  [(CNFRegWizardController *)self _stopListeningForResignResume];
  if (*(_WORD *)&self->_wizardFlags) {
    UIKeyboardDisableAutomaticAppearance();
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegWizardController;
  [(PSSetupController *)&v3 viewDidDisappear:a3];
}

- (void)_startListeningForResignResume
{
  if (!self->_resignListener && (*(_WORD *)&self->_wizardFlags & 2) != 0)
  {
    objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *MEMORY[0x263F833C0];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __56__CNFRegWizardController__startListeningForResignResume__block_invoke;
    v17[3] = &unk_2644F0EA8;
    id v18 = v3;
    id v5 = v3;
    objc_super v6 = (void *)MEMORY[0x223C3AA40](v17);
    objc_super v7 = [v5 addObserverForName:v4 object:0 queue:0 usingBlock:v6];
    id resignListener = self->_resignListener;
    self->_id resignListener = v7;
  }
  if (!self->_resumeListener && (*(_WORD *)&self->_wizardFlags & 2) != 0)
  {
    unsigned int v9 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v10 = *MEMORY[0x263F83318];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __56__CNFRegWizardController__startListeningForResignResume__block_invoke_2;
    v15[3] = &unk_2644F0ED0;
    v15[4] = self;
    id v16 = v9;
    id v11 = v9;
    char v12 = (void *)MEMORY[0x223C3AA40](v15);
    id v13 = [v11 addObserverForName:v10 object:0 queue:0 usingBlock:v12];
    id resumeListener = self->_resumeListener;
    self->_id resumeListener = v13;
  }
}

uint64_t __56__CNFRegWizardController__startListeningForResignResume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) postNotificationName:@"com.apple.PreferencesApp.willResignActive" object:0];
}

uint64_t __56__CNFRegWizardController__startListeningForResignResume__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) regController];
  [v2 resetNetworkFirstRunAlert];

  objc_super v3 = *(void **)(a1 + 40);
  return [v3 postNotificationName:@"com.apple.PreferencesApp.willBecomeActive" object:0];
}

- (void)_stopListeningForResignResume
{
  if (self->_resignListener)
  {
    objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_resignListener];
    id resignListener = self->_resignListener;
    self->_id resignListener = 0;
  }
  if (self->_resumeListener)
  {
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self->_resumeListener];
    id resumeListener = self->_resumeListener;
    self->_id resumeListener = 0;
  }
}

- (void)applicationWillSuspend
{
  v2.receiver = self;
  v2.super_class = (Class)CNFRegWizardController;
  [(CNFRegWizardController *)&v2 applicationWillSuspend];
}

- (void)applicationDidResume
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegWizardController;
  [(CNFRegWizardController *)&v3 applicationDidResume];
  [(CNFRegWizardController *)self _checkRestrictions];
}

- (void)_applicationDidEnterBackground
{
  if ([(CNFRegWizardController *)self shouldTerminateInBackground])
  {
    id v2 = [MEMORY[0x263F82438] sharedApplication];
    [v2 terminateWithSuccess];
  }
}

- (void)dismissWithState:(unint64_t)a3
{
}

- (void)dismissFinished:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  firstRunDelegate = self->_firstRunDelegate;
  if (firstRunDelegate)
  {
    id v6 = firstRunDelegate;
LABEL_3:
    objc_super v7 = v6;
    goto LABEL_8;
  }
  objc_super v8 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDE8]);
  id WeakRetained = objc_loadWeakRetained(v8);
  if (WeakRetained)
  {
    uint64_t v10 = WeakRetained;
    id v11 = objc_loadWeakRetained(v8);
    int v12 = [v11 conformsToProtocol:&unk_26D099390];

    if (v12)
    {
      id v6 = (CNFRegWizardControllerDelegate *)objc_loadWeakRetained(v8);
      goto LABEL_3;
    }
  }
  objc_super v7 = 0;
LABEL_8:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = [(CNFRegWizardController *)self viewControllers];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) setDelegate:0];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

  [(CNFRegWizardControllerDelegate *)v7 firstRunControllerDidFinish:self finished:v3];
}

- (void)firstRunController:(id)a3 finishedWithState:(unint64_t)a4
{
}

- (void)_doCancel
{
  id v5 = [(CNFRegWizardController *)self regController];
  BOOL v3 = [(CNFRegWizardController *)self regController];
  uint64_t v4 = [v3 appleIDAccounts];
  -[CNFRegWizardController dismissWithState:](self, "dismissWithState:", [v5 accountState:v4]);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  id v5 = [(CNFRegWizardController *)self topViewController];

  if (!v5) {
    return a3 == 1;
  }
  id v6 = [(CNFRegWizardController *)self topViewController];
  char v7 = [v6 _isSupportedInterfaceOrientation:a3];

  return v7;
}

+ (void)setGlobalAppearanceStyle:(int64_t)a3
{
}

+ (void)setSupportsAutoRotation:(BOOL)a3
{
}

- (BOOL)canStartNested
{
  return (*(_WORD *)&self->_wizardFlags >> 2) & 1;
}

- (void)setCanStartNested:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFFB | v3;
}

- (BOOL)canShowSplashScreen
{
  return (*(_WORD *)&self->_wizardFlags >> 3) & 1;
}

- (void)setCanShowSplashScreen:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFF7 | v3;
}

- (BOOL)canShowDisabledScreen
{
  return (*(_WORD *)&self->_wizardFlags >> 4) & 1;
}

- (void)setCanShowDisabledScreen:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFEF | v3;
}

- (BOOL)skipReloadOnNextViewWillAppear
{
  return (*(_WORD *)&self->_wizardFlags >> 7) & 1;
}

- (void)setSkipReloadOnNextViewWillAppear:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFF7F | v3;
}

- (BOOL)shouldListenForSuspension
{
  return (*(_WORD *)&self->_wizardFlags >> 1) & 1;
}

- (void)setShouldListenForSuspension:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFFD | v3;
}

- (BOOL)allowCancel
{
  return HIBYTE(*(_WORD *)&self->_wizardFlags) & 1;
}

- (void)setAllowCancel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFEFF | v3;
}

- (BOOL)allowSMS
{
  return (*(_WORD *)&self->_wizardFlags >> 9) & 1;
}

- (void)setAllowSMS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFDFF | v3;
}

- (BOOL)hideLearnMoreButton
{
  return (*(_WORD *)&self->_wizardFlags >> 5) & 1;
}

- (void)setHideLearnMoreButton:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFDF | v3;
}

- (BOOL)showSplashOnSignin
{
  return (*(_WORD *)&self->_wizardFlags >> 6) & 1;
}

- (void)setShowSplashOnSignin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFBF | v3;
}

- (BOOL)shouldTerminateInBackground
{
  return (*(_WORD *)&self->_wizardFlags >> 10) & 1;
}

- (void)setShouldTerminateInBackground:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFBFF | v3;
}

- (CNFRegWizardControllerDelegate)firstRunDelegate
{
  return self->_firstRunDelegate;
}

- (void)setFirstRunDelegate:(id)a3
{
  self->_firstRunDelegate = (CNFRegWizardControllerDelegate *)a3;
}

- (CNFRegController)regController
{
  return self->_regController;
}

- (void)setRegController:(id)a3
{
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong(&self->_resumeListener, 0);
  objc_storeStrong(&self->_resignListener, 0);
  objc_storeStrong((id *)&self->_regController, 0);
}

@end