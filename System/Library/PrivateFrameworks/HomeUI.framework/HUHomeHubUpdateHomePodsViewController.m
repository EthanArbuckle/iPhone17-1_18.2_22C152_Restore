@interface HUHomeHubUpdateHomePodsViewController
- (BOOL)_allHomePodsHaveValidSoftwareUpdatesOrSupportsHH2;
- (BOOL)_noHomePodsWithAvailableUpdates;
- (BOOL)ranIntoFetchError;
- (BOOL)userTappedUpdate;
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeHubUpdateHomePodsViewController)initWithOwnedHomes:(id)a3 homePodsToUpdate:(id)a4;
- (NAFuture)softwareUpdateFetchFuture;
- (NSArray)homePods;
- (NSArray)homes;
- (OBTrayButton)continueButton;
- (UIActivityIndicatorView)spinner;
- (UIBarButtonItem)cancelButton;
- (id)_homePodsDownloadingSoftwareUpdate;
- (id)_homePodsReadyToInstallSoftwareUpdate;
- (id)hu_preloadContent;
- (id)softwareUpdateUIManager:(id)a3 dismissViewController:(id)a4;
- (id)softwareUpdateUIManager:(id)a3 presentViewController:(id)a4;
- (void)_cancelButtonPressed:(id)a3;
- (void)_continueButtonPressed:(id)a3;
- (void)_dismiss;
- (void)_fetchSoftwareUpdates;
- (void)_hideSpinner;
- (void)_presentErrorWithMessage:(id)a3;
- (void)_presentGenericError;
- (void)_showSpinner;
- (void)_startUpdate;
- (void)setCancelButton:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomePods:(id)a3;
- (void)setHomes:(id)a3;
- (void)setRanIntoFetchError:(BOOL)a3;
- (void)setSoftwareUpdateFetchFuture:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setUserTappedUpdate:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUHomeHubUpdateHomePodsViewController

- (HUHomeHubUpdateHomePodsViewController)initWithOwnedHomes:(id)a3 homePodsToUpdate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((objc_msgSend(v8, "na_all:", &__block_literal_global_221) & 1) == 0) {
    NSLog(&cfstr_MustOnlyPassIn.isa);
  }
  v9 = _HULocalizedStringWithDefaultValue(@"HUHomePodSoftwareUpdateRequiredDescriptionSingularHomePodSingularHome", @"HUHomePodSoftwareUpdateRequiredDescriptionSingularHomePodSingularHome", 1);
  if ([v8 count] == 1 && (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v10 = @"HUHomePodSoftwareUpdateRequiredDescriptionSingularHomePodMultipleHomes";
LABEL_12:
    uint64_t v11 = _HULocalizedStringWithDefaultValue(v10, v10, 1);

    v9 = (void *)v11;
    goto LABEL_13;
  }
  if ((unint64_t)[v8 count] >= 2 && objc_msgSend(v7, "count") == 1)
  {
    v10 = @"HUHomePodSoftwareUpdateRequiredDescriptionMultipleHomePodsSingularHome";
    goto LABEL_12;
  }
  if ((unint64_t)[v8 count] >= 2 && (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v10 = @"HUHomePodSoftwareUpdateRequiredDescriptionMultipleHomePodsMultipleHomes";
    goto LABEL_12;
  }
LABEL_13:
  v12 = [HUHomeHubAccessoryListItemManager alloc];
  v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  v14 = [(HUHomeHubAccessoryListItemManager *)v12 initWithAccessories:v13 delegate:self];

  v15 = [(HUItemTableViewController *)[HUHomeHubSimpleTableViewController alloc] initWithItemManager:v14 tableViewStyle:1];
  v16 = _HULocalizedStringWithDefaultValue(@"HUHomePodSoftwareUpdateRequiredTitle", @"HUHomePodSoftwareUpdateRequiredTitle", 1);
  v19.receiver = self;
  v19.super_class = (Class)HUHomeHubUpdateHomePodsViewController;
  v17 = [(HUItemTableOBWelcomeController *)&v19 initWithTitle:v16 detailText:v9 icon:0 contentLayout:2 itemTableViewController:v15];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_homes, a3);
    objc_storeStrong((id *)&v17->_homePods, a4);
    v17->_userTappedUpdate = 0;
  }

  return v17;
}

uint64_t __77__HUHomeHubUpdateHomePodsViewController_initWithOwnedHomes_homePodsToUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomePod");
}

- (void)viewDidLoad
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)HUHomeHubUpdateHomePodsViewController;
  [(HUItemTableOBWelcomeController *)&v34 viewDidLoad];
  v4 = [(HUHomeHubUpdateHomePodsViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5EA8];

  v6 = _HULocalizedStringWithDefaultValue(@"HUHomePodSoftwareUpdateRequiredCaptionSingularHomePodSingularHome", @"HUHomePodSoftwareUpdateRequiredCaptionSingularHomePodSingularHome", 1);
  id v7 = [(HUHomeHubUpdateHomePodsViewController *)self homePods];
  if ([v7 count] == 1)
  {
    id v8 = [(HUHomeHubUpdateHomePodsViewController *)self homes];
    unint64_t v9 = [v8 count];

    if (v9 >= 2)
    {
      v10 = @"HUHomePodSoftwareUpdateRequiredCaptionSingularHomePodMultipleHomes";
LABEL_12:
      _HULocalizedStringWithDefaultValue(v10, v10, 1);
      v6 = v14 = v6;
      goto LABEL_13;
    }
  }
  else
  {
  }
  uint64_t v11 = [(HUHomeHubUpdateHomePodsViewController *)self homePods];
  if ((unint64_t)[v11 count] <= 1)
  {
  }
  else
  {
    v12 = [(HUHomeHubUpdateHomePodsViewController *)self homes];
    uint64_t v13 = [v12 count];

    if (v13 == 1)
    {
      v10 = @"HUHomePodSoftwareUpdateRequiredCaptionMultipleHomePodsSingularHome";
      goto LABEL_12;
    }
  }
  v14 = [(HUHomeHubUpdateHomePodsViewController *)self homePods];
  if ((unint64_t)[v14 count] >= 2)
  {
    v15 = [(HUHomeHubUpdateHomePodsViewController *)self homes];
    unint64_t v16 = [v15 count];

    if (v16 < 2) {
      goto LABEL_14;
    }
    v10 = @"HUHomePodSoftwareUpdateRequiredCaptionMultipleHomePodsMultipleHomes";
    goto LABEL_12;
  }
LABEL_13:

LABEL_14:
  v17 = [(HUHomeHubUpdateHomePodsViewController *)self buttonTray];
  [v17 addCaptionText:v6];

  v18 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomeHubUpdateHomePodsViewController *)self setContinueButton:v18];

  objc_super v19 = [(HUHomeHubUpdateHomePodsViewController *)self continueButton];
  v20 = _HULocalizedStringWithDefaultValue(@"HUHomePodSoftwareUpdateRequiredUpdateNowButton", @"HUHomePodSoftwareUpdateRequiredUpdateNowButton", 1);
  [v19 setTitle:v20 forState:0];

  v21 = [(HUHomeHubUpdateHomePodsViewController *)self continueButton];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = [(HUHomeHubUpdateHomePodsViewController *)self continueButton];
  [v22 addTarget:self action:sel__continueButtonPressed_ forControlEvents:64];

  v23 = [(HUHomeHubUpdateHomePodsViewController *)self continueButton];
  [v23 setAccessibilityIdentifier:@"Home.Onboarding.HomeHubMigration.HUHomeHubUpdateHomePod.NotNowButton"];

  v24 = [(HUHomeHubUpdateHomePodsViewController *)self buttonTray];
  v25 = [(HUHomeHubUpdateHomePodsViewController *)self continueButton];
  [v24 addButton:v25];

  id v26 = objc_alloc(MEMORY[0x1E4F427C0]);
  v27 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  v28 = (void *)[v26 initWithTitle:v27 style:0 target:self action:sel__cancelButtonPressed_];
  [(HUHomeHubUpdateHomePodsViewController *)self setCancelButton:v28];

  v29 = [(HUHomeHubUpdateHomePodsViewController *)self cancelButton];
  [v29 setAccessibilityIdentifier:@"Home.Onboarding.HomeHubMigration.HUHomeHubUpdateHomePod.CancelButton"];

  v30 = [(OBBaseWelcomeController *)self navigationItem];
  v31 = [(HUHomeHubUpdateHomePodsViewController *)self cancelButton];
  [v30 setRightBarButtonItem:v31];

  [(HUHomeHubUpdateHomePodsViewController *)self setModalInPresentation:1];
  v32 = HFLogForCategory();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v36 = self;
    __int16 v37 = 2112;
    v38 = v33;
    _os_log_impl(&dword_1BE345000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubUpdateHomePodsViewController", buf, 0x16u);
  }
}

- (id)hu_preloadContent
{
  [(HUHomeHubUpdateHomePodsViewController *)self _fetchSoftwareUpdates];
  v2 = (void *)MEMORY[0x1E4F7A0D8];

  return (id)[v2 futureWithNoResult];
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (id)softwareUpdateUIManager:(id)a3 presentViewController:(id)a4
{
  return [(UIViewController *)self hu_presentPreloadableViewController:a4 animated:1];
}

- (id)softwareUpdateUIManager:(id)a3 dismissViewController:(id)a4
{
  [(HUHomeHubUpdateHomePodsViewController *)self _hideSpinner];
  id v5 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__HUHomeHubUpdateHomePodsViewController_softwareUpdateUIManager_dismissViewController___block_invoke;
  v8[3] = &unk_1E6386018;
  id v6 = v5;
  id v9 = v6;
  [(HUHomeHubUpdateHomePodsViewController *)self dismissViewControllerAnimated:1 completion:v8];

  return v6;
}

uint64_t __87__HUHomeHubUpdateHomePodsViewController_softwareUpdateUIManager_dismissViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

- (void)_continueButtonPressed:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v7, 0x16u);
  }
  [(HUHomeHubUpdateHomePodsViewController *)self setUserTappedUpdate:1];
  [(HUHomeHubUpdateHomePodsViewController *)self _startUpdate];
}

- (void)_cancelButtonPressed:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v7, 0x16u);
  }
  [(HUHomeHubUpdateHomePodsViewController *)self _dismiss];
}

- (void)_dismiss
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HUHomeHubUpdateHomePodsViewController *)self delegate];
  id v5 = @"HUHomeHub2OnboardingKey_UserInput";
  v6[0] = &unk_1F19B4CA0;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v3 viewController:self didFinishWithConfigurationResults:v4];
}

- (void)_fetchSoftwareUpdates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(HUHomeHubUpdateHomePodsViewController *)self softwareUpdateFetchFuture];

  if (!v3)
  {
    v4 = objc_opt_new();
    [(HUHomeHubUpdateHomePodsViewController *)self setSoftwareUpdateFetchFuture:v4];
  }
  BOOL v5 = [(HUHomeHubUpdateHomePodsViewController *)self _allHomePodsHaveValidSoftwareUpdatesOrSupportsHH2];
  [(HUHomeHubUpdateHomePodsViewController *)self setRanIntoFetchError:0];
  if (v5)
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v16 = self;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@ Skipping software update fetch since HomePods have valid SU or already support HH2", buf, 0xCu);
    }

    int v7 = [(HUHomeHubUpdateHomePodsViewController *)self softwareUpdateFetchFuture];
    [v7 finishWithNoResult];
  }
  else
  {
    id v8 = +[HUSoftwareUpdateUIManager sharedManager];
    __int16 v9 = (void *)MEMORY[0x1E4F1CAD0];
    v10 = [(HUHomeHubUpdateHomePodsViewController *)self homePods];
    uint64_t v11 = [v9 setWithArray:v10];
    v12 = [v8 fetchAvailableUpdatesForAccessories:v11 options:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__HUHomeHubUpdateHomePodsViewController__fetchSoftwareUpdates__block_invoke;
    v14[3] = &unk_1E63856C0;
    v14[4] = self;
    id v13 = (id)[v12 addCompletionBlock:v14];
  }
}

void __62__HUHomeHubUpdateHomePodsViewController__fetchSoftwareUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) softwareUpdateFetchFuture];
  [v7 finishWithResult:v5 error:v6];

  if (v6)
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      int v21 = 138412546;
      uint64_t v22 = v20;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "%@ Error fetching software updates: %@", (uint8_t *)&v21, 0x16u);
    }

    int v9 = [*(id *)(a1 + 32) _allHomePodsHaveValidSoftwareUpdatesOrSupportsHH2];
    v10 = *(void **)(a1 + 32);
    if (v9)
    {
      if ([v10 userTappedUpdate])
      {
        uint64_t v11 = HFLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          int v21 = 138412290;
          uint64_t v22 = v12;
          id v13 = "%@ Error fetching software updates but will start updating since all HomePods have valid software updates";
          v14 = v11;
          uint32_t v15 = 12;
LABEL_11:
          _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, v15);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else
    {
      [v10 setRanIntoFetchError:1];
      if ([*(id *)(a1 + 32) userTappedUpdate])
      {
        uint64_t v17 = [v6 code];
        v18 = *(void **)(a1 + 32);
        if (v17 == 8)
        {
          objc_super v19 = _HULocalizedStringWithDefaultValue(@"HUHomePodSoftwareUpdateRequiredFetchTimeoutErrorMessage", @"HUHomePodSoftwareUpdateRequiredFetchTimeoutErrorMessage", 1);
          [v18 _presentErrorWithMessage:v19];
        }
        else
        {
          [v18 _presentGenericError];
        }
      }
    }
  }
  else if ([*(id *)(a1 + 32) userTappedUpdate])
  {
    uint64_t v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v21 = 138412546;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      id v24 = v5;
      id v13 = "%@ Completed fetching software updates with result: %@, and no error";
      v14 = v11;
      uint32_t v15 = 22;
      goto LABEL_11;
    }
LABEL_12:

    [*(id *)(a1 + 32) _startUpdate];
  }
}

- (void)_startUpdate
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(HUHomeHubUpdateHomePodsViewController *)self _showSpinner];
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(HUHomeHubUpdateHomePodsViewController *)self softwareUpdateFetchFuture];
    *(_DWORD *)buf = 138412802;
    v29 = self;
    __int16 v30 = 1024;
    *(_DWORD *)v31 = [v4 isFinished];
    *(_WORD *)&v31[4] = 1024;
    *(_DWORD *)&v31[6] = [(HUHomeHubUpdateHomePodsViewController *)self ranIntoFetchError];
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@ Did fetching software updates finish: %{BOOL}d. Did fetching software updates run into errors: %{BOOL}d", buf, 0x18u);
  }
  id v5 = [(HUHomeHubUpdateHomePodsViewController *)self softwareUpdateFetchFuture];
  if (![v5 isFinished])
  {

    goto LABEL_8;
  }
  BOOL v6 = [(HUHomeHubUpdateHomePodsViewController *)self ranIntoFetchError];

  if (v6)
  {
LABEL_8:
    [(HUHomeHubUpdateHomePodsViewController *)self _fetchSoftwareUpdates];
    return;
  }
  int v7 = [(HUHomeHubUpdateHomePodsViewController *)self _homePodsReadyToInstallSoftwareUpdate];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    int v9 = +[HUSoftwareUpdateUIManager sharedManager];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = [(HUHomeHubUpdateHomePodsViewController *)self _homePodsReadyToInstallSoftwareUpdate];
    uint64_t v12 = [v10 setWithArray:v11];
    id v13 = [v9 startUpdatesForAccessories:v12 presentationDelegate:self];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __53__HUHomeHubUpdateHomePodsViewController__startUpdate__block_invoke;
    v27[3] = &unk_1E6386708;
    v27[4] = self;
    id v14 = (id)[v13 addFailureBlock:v27];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __53__HUHomeHubUpdateHomePodsViewController__startUpdate__block_invoke_82;
    v26[3] = &unk_1E6387DC8;
    v26[4] = self;
    id v15 = (id)[v13 addSuccessBlock:v26];
  }
  else
  {
    uint64_t v16 = [(HUHomeHubUpdateHomePodsViewController *)self _homePodsDownloadingSoftwareUpdate];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      v18 = HFLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v19 = [(HUHomeHubUpdateHomePodsViewController *)self _homePodsDownloadingSoftwareUpdate];
        uint64_t v20 = [v19 count];
        int v21 = [(HUHomeHubUpdateHomePodsViewController *)self _homePodsDownloadingSoftwareUpdate];
        *(_DWORD *)buf = 138412802;
        v29 = self;
        __int16 v30 = 2048;
        *(void *)v31 = v20;
        *(_WORD *)&v31[8] = 2112;
        v32 = v21;
        _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@ Not starting installation since %lu software update(s) are being downloaded for HomePods: %@... should start installation once finished", buf, 0x20u);
      }
      [(HUHomeHubUpdateHomePodsViewController *)self _hideSpinner];
      [(HUHomeHubUpdateHomePodsViewController *)self _dismiss];
    }
    else
    {
      BOOL v22 = [(HUHomeHubUpdateHomePodsViewController *)self _noHomePodsWithAvailableUpdates];
      __int16 v23 = HFLogForCategory();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      if (v22)
      {
        if (v24)
        {
          *(_DWORD *)buf = 138412290;
          v29 = self;
          _os_log_error_impl(&dword_1BE345000, v23, OS_LOG_TYPE_ERROR, "%@ There are no available software updates for any HomePods... showing error message", buf, 0xCu);
        }

        uint64_t v25 = _HULocalizedStringWithDefaultValue(@"HUHomePodSoftwareUpdateRequiredNoAvailableUpdateErrorMessage", @"HUHomePodSoftwareUpdateRequiredNoAvailableUpdateErrorMessage", 1);
        [(HUHomeHubUpdateHomePodsViewController *)self _presentErrorWithMessage:v25];
      }
      else
      {
        if (v24)
        {
          *(_DWORD *)buf = 138412290;
          v29 = self;
          _os_log_error_impl(&dword_1BE345000, v23, OS_LOG_TYPE_ERROR, "%@ There are no software update downloads in progress... showing error message", buf, 0xCu);
        }

        [(HUHomeHubUpdateHomePodsViewController *)self _presentGenericError];
      }
    }
  }
}

void __53__HUHomeHubUpdateHomePodsViewController__startUpdate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    int v9 = (void *)MEMORY[0x1E4F1CAD0];
    v10 = [v8 homePods];
    uint64_t v11 = [v9 setWithArray:v10];
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "%@ Error installing software updates for HomePods: %@, error: %@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v5 = [v3 code];
  BOOL v6 = *(void **)(a1 + 32);
  if (v5 == 8)
  {
    int v7 = _HULocalizedStringWithDefaultValue(@"HUHomePodSoftwareUpdateRequiredUpdateTimeoutErrorMessage", @"HUHomePodSoftwareUpdateRequiredUpdateTimeoutErrorMessage", 1);
    [v6 _presentErrorWithMessage:v7];
  }
  else
  {
    [v6 _presentGenericError];
  }
}

uint64_t __53__HUHomeHubUpdateHomePodsViewController__startUpdate__block_invoke_82(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = [v3 _homePodsReadyToInstallSoftwareUpdate];
    BOOL v6 = [v4 setWithArray:v5];
    int v8 = 138412546;
    int v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@ Successfully started installing software updates for HomePods: %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) _hideSpinner];
  return [*(id *)(a1 + 32) _dismiss];
}

- (BOOL)_allHomePodsHaveValidSoftwareUpdatesOrSupportsHH2
{
  if (HFPreferencesBoolForKey()) {
    return 1;
  }
  v4 = [(HUHomeHubUpdateHomePodsViewController *)self homePods];
  char v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_85_1);

  return v5;
}

uint64_t __90__HUHomeHubUpdateHomePodsViewController__allHomePodsHaveValidSoftwareUpdatesOrSupportsHH2__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_hasNewValidSoftwareUpdate"))
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [v2 device];
    uint64_t v3 = [v4 supportsHH2];
  }
  return v3;
}

- (id)_homePodsReadyToInstallSoftwareUpdate
{
  id v2 = [(HUHomeHubUpdateHomePodsViewController *)self homePods];
  uint64_t v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_87_0);

  return v3;
}

uint64_t __78__HUHomeHubUpdateHomePodsViewController__homePodsReadyToInstallSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isControllable]) {
    uint64_t v3 = objc_msgSend(v2, "hf_isReadyToInstallSoftwareUpdate");
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_homePodsDownloadingSoftwareUpdate
{
  id v2 = [(HUHomeHubUpdateHomePodsViewController *)self homePods];
  uint64_t v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_89);

  return v3;
}

uint64_t __75__HUHomeHubUpdateHomePodsViewController__homePodsDownloadingSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isDownloadingSoftwareUpdate");
}

- (BOOL)_noHomePodsWithAvailableUpdates
{
  id v2 = [(HUHomeHubUpdateHomePodsViewController *)self homePods];
  char v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_91_0);

  return v3;
}

BOOL __72__HUHomeHubUpdateHomePodsViewController__noHomePodsWithAvailableUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 softwareUpdateController];
  char v3 = [v2 availableUpdate];

  if (v3) {
    BOOL v4 = [v3 state] == 4;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)_showSpinner
{
  char v3 = [(HUHomeHubUpdateHomePodsViewController *)self spinner];

  if (!v3)
  {
    BOOL v4 = [(OBBaseWelcomeController *)self navigationItem];
    [v4 setHidesBackButton:1 animated:1];

    char v5 = [(HUHomeHubUpdateHomePodsViewController *)self continueButton];
    BOOL v6 = [v5 titleLabel];
    [v6 setHidden:1];

    int v7 = [(HUHomeHubUpdateHomePodsViewController *)self continueButton];
    [v7 setEnabled:0];

    int v8 = [(HUHomeHubUpdateHomePodsViewController *)self cancelButton];
    [v8 setEnabled:0];

    int v9 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    [(HUHomeHubUpdateHomePodsViewController *)self setSpinner:v9];

    __int16 v10 = [(HUHomeHubUpdateHomePodsViewController *)self spinner];
    [v10 sizeToFit];

    uint64_t v11 = [(HUHomeHubUpdateHomePodsViewController *)self spinner];
    [v11 startAnimating];

    uint64_t v12 = [(HUHomeHubUpdateHomePodsViewController *)self continueButton];
    [v12 center];
    double v14 = v13;
    double v16 = v15;
    id v17 = [(HUHomeHubUpdateHomePodsViewController *)self spinner];
    objc_msgSend(v17, "setCenter:", v14, v16);

    id v20 = [(HUHomeHubUpdateHomePodsViewController *)self continueButton];
    uint64_t v18 = [v20 superview];
    objc_super v19 = [(HUHomeHubUpdateHomePodsViewController *)self spinner];
    [v18 addSubview:v19];
  }
}

- (void)_hideSpinner
{
  char v3 = [(HUHomeHubUpdateHomePodsViewController *)self spinner];

  if (v3)
  {
    BOOL v4 = [(HUHomeHubUpdateHomePodsViewController *)self spinner];
    [v4 removeFromSuperview];

    [(HUHomeHubUpdateHomePodsViewController *)self setSpinner:0];
    char v5 = [(HUHomeHubUpdateHomePodsViewController *)self view];
    [v5 setNeedsLayout];
  }
  BOOL v6 = [(OBBaseWelcomeController *)self navigationItem];
  [v6 setHidesBackButton:0 animated:1];

  int v7 = [(HUHomeHubUpdateHomePodsViewController *)self continueButton];
  int v8 = [v7 titleLabel];
  [v8 setHidden:0];

  int v9 = [(HUHomeHubUpdateHomePodsViewController *)self continueButton];
  [v9 setEnabled:1];

  id v10 = [(HUHomeHubUpdateHomePodsViewController *)self cancelButton];
  [v10 setEnabled:1];
}

- (void)_presentGenericError
{
  [(HUHomeHubUpdateHomePodsViewController *)self setUserTappedUpdate:0];
  char v3 = (void *)MEMORY[0x1E4F42728];
  BOOL v4 = _HULocalizedStringWithDefaultValue(@"HUHomePodSoftwareUpdateRequiredErrorTitle", @"HUHomePodSoftwareUpdateRequiredErrorTitle", 1);
  char v5 = _HULocalizedStringWithDefaultValue(@"HUHomePodSoftwareUpdateRequiredErrorMessage", @"HUHomePodSoftwareUpdateRequiredErrorMessage", 1);
  BOOL v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  int v7 = (void *)MEMORY[0x1E4F42720];
  int v8 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__HUHomeHubUpdateHomePodsViewController__presentGenericError__block_invoke;
  v10[3] = &unk_1E6385188;
  v10[4] = self;
  int v9 = [v7 actionWithTitle:v8 style:1 handler:v10];
  [v6 addAction:v9];

  [(HUHomeHubUpdateHomePodsViewController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __61__HUHomeHubUpdateHomePodsViewController__presentGenericError__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideSpinner];
}

- (void)_presentErrorWithMessage:(id)a3
{
  id v4 = a3;
  [(HUHomeHubUpdateHomePodsViewController *)self setUserTappedUpdate:0];
  char v5 = (void *)MEMORY[0x1E4F42728];
  BOOL v6 = _HULocalizedStringWithDefaultValue(@"HUHomePodSoftwareUpdateRequiredErrorTitle", @"HUHomePodSoftwareUpdateRequiredErrorTitle", 1);
  int v7 = [v5 alertControllerWithTitle:v6 message:v4 preferredStyle:1];

  int v8 = (void *)MEMORY[0x1E4F42720];
  int v9 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__HUHomeHubUpdateHomePodsViewController__presentErrorWithMessage___block_invoke;
  v11[3] = &unk_1E6385188;
  v11[4] = self;
  id v10 = [v8 actionWithTitle:v9 style:1 handler:v11];
  [v7 addAction:v10];

  [(HUHomeHubUpdateHomePodsViewController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __66__HUHomeHubUpdateHomePodsViewController__presentErrorWithMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideSpinner];
}

- (HUConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
}

- (NSArray)homePods
{
  return self->_homePods;
}

- (void)setHomePods:(id)a3
{
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (NAFuture)softwareUpdateFetchFuture
{
  return self->_softwareUpdateFetchFuture;
}

- (void)setSoftwareUpdateFetchFuture:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (BOOL)userTappedUpdate
{
  return self->_userTappedUpdate;
}

- (void)setUserTappedUpdate:(BOOL)a3
{
  self->_userTappedUpdate = a3;
}

- (BOOL)ranIntoFetchError
{
  return self->_ranIntoFetchError;
}

- (void)setRanIntoFetchError:(BOOL)a3
{
  self->_ranIntoFetchError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_softwareUpdateFetchFuture, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_homePods, 0);
  objc_storeStrong((id *)&self->_homes, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end