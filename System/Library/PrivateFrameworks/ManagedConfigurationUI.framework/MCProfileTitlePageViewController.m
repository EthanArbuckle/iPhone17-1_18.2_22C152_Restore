@interface MCProfileTitlePageViewController
- (BOOL)hasUpdatedBottomInset;
- (BOOL)questionsControllerIsDisplayedInSheet:(id)a3;
- (DMCInstallProfileQuestionViewController)questionsController;
- (MCActivityViewController)activityViewController;
- (MCProfileTitlePageMetaDataSectionAnimationController)animationController;
- (MCProfileTitlePageMetaDataSectionController)metaDataSectionController;
- (MCProfileTitlePageView)profileTitlePageView;
- (MCProfileTitlePageViewController)initWithViewModel:(id)a3;
- (MCProfileTitlePageViewModel)viewModel;
- (double)metaDataSectionHeight;
- (id)_sectionControllersWithProfile:(id)a3;
- (id)authenticationCompletionHandler;
- (id)authenticationPreparationHandler;
- (id)defaultView;
- (id)passcodeCompletionHandler;
- (id)restoreCompletionHandler;
- (id)userInputCompletionHandler;
- (void)_resetNavigationBarStyleForViewController:(id)a3;
- (void)_showAlertForInstallError:(id)a3;
- (void)_updateBottomInsetToEnableCompleteScrollAnimation;
- (void)_updateMetaDataSectionHeight;
- (void)cancelButtonTapped:(id)a3;
- (void)dealloc;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didCancelEnteringPIN;
- (void)infoButtonTapped:(id)a3;
- (void)informQuestionViewControllerOfPreflightResult:(id)a3 profileConnection:(id)a4;
- (void)installButtonTapped:(id)a3;
- (void)installationFinishedSuccessfully:(BOOL)a3 shouldDismiss:(BOOL)a4 shouldRedirect:(BOOL)a5 errorToDisplay:(id)a6;
- (void)loadView;
- (void)presentAuthenticationViewControllerWithContext:(id)a3 authenticationPreparationHandler:(id)a4 authenticationCompletionHandler:(id)a5;
- (void)presentRestoreFailedAlertWithError:(id)a3 completionHandler:(id)a4;
- (void)presentSpinnerViewController;
- (void)promptForManagedRestoreWithManagedAppleID:(id)a3 snapshot:(id)a4 conflictingApps:(id)a5 completionHandler:(id)a6;
- (void)promptForPasscodeWithCompletionHandler:(id)a3;
- (void)promptForUserInput:(id)a3 completionHandler:(id)a4;
- (void)questionsController:(id)a3 didFinishWithResponses:(id)a4;
- (void)restoreViewController:(id)a3 didReceiveUserAction:(BOOL)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setActivityViewController:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setAuthenticationCompletionHandler:(id)a3;
- (void)setAuthenticationPreparationHandler:(id)a3;
- (void)setHasUpdatedBottomInset:(BOOL)a3;
- (void)setMetaDataSectionController:(id)a3;
- (void)setMetaDataSectionHeight:(double)a3;
- (void)setPasscodeCompletionHandler:(id)a3;
- (void)setProfileTitlePageView:(id)a3;
- (void)setQuestionsController:(id)a3;
- (void)setRestoreCompletionHandler:(id)a3;
- (void)setUserInputCompletionHandler:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setViewModel:(id)a3;
- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5;
- (void)signInViewController:(id)a3 willAuthenticateWithCompletionHandler:(id)a4;
- (void)signInViewControllerDidCancelAuthentication:(id)a3;
- (void)viewControllerHasBeenDismissed;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MCProfileTitlePageViewController

- (MCProfileTitlePageViewController)initWithViewModel:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCProfileTitlePageViewController;
  v6 = [(MCProfileTitlePageViewController *)&v11 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(MCProfileTitlePageViewModel *)v7->_viewModel setDelegate:v7];
    v8 = [v5 profile];
    v9 = [(MCProfileTitlePageViewController *)v7 _sectionControllersWithProfile:v8];
    [(MCSectionBasedTableViewController *)v7 setSectionControllers:v9];
  }
  return v7;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)MCProfileTitlePageViewController;
  [(MCSectionBasedTableViewController *)&v9 loadView];
  v3 = [(MCProfileTitlePageViewController *)self view];
  [(MCProfileTitlePageViewController *)self setProfileTitlePageView:v3];

  v4 = [(MCProfileTitlePageViewController *)self navigationController];
  [v4 setNavigationBarHidden:1];

  id v5 = [(MCProfileTitlePageViewController *)self navigationController];
  v6 = [v5 view];
  v7 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  v8 = [v7 bottomBarView];
  [v6 addSubview:v8];
}

- (id)defaultView
{
  v2 = objc_opt_new();
  return v2;
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)MCProfileTitlePageViewController;
  [(MCSectionBasedTableViewController *)&v35 viewDidLoad];
  v3 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  v4 = [v3 tableView];
  [v4 reloadData];

  id v5 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  v6 = [v5 tableView];
  [v6 contentInset];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [(MCProfileTitlePageViewController *)self metaDataSectionController];
  [v15 heightForHeader];
  double v17 = v8 - v16;

  v18 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  v19 = [v18 tableView];
  objc_msgSend(v19, "setContentInset:", v17, v10, v12, v14);

  v20 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  v21 = [v20 tableView];
  v22 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  v23 = [v22 tableView];
  [v23 contentInset];
  objc_msgSend(v21, "setContentOffset:animated:", 0, 0.0, -v24);

  [(MCProfileTitlePageViewController *)self _updateMetaDataSectionHeight];
  v25 = [(MCProfileTitlePageViewController *)self animationController];
  v26 = [(MCProfileTitlePageViewController *)self metaDataSectionController];
  v27 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  v28 = [v27 topBarView];
  [v25 startTrackingWithMetaDataSectionController:v26 topBar:v28];

  v29 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  v30 = [v29 infoButton];
  [v30 addTarget:self action:sel_infoButtonTapped_ forControlEvents:64];

  v31 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  v32 = [v31 installButton];
  [v32 addTarget:self action:sel_installButtonTapped_ forControlEvents:64];

  v33 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  v34 = [v33 cancelButton];
  [v34 addTarget:self action:sel_cancelButtonTapped_ forControlEvents:64];
}

- (void)dealloc
{
  v3 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  v4 = [v3 bottomBarView];
  [v4 removeFromSuperview];

  v5.receiver = self;
  v5.super_class = (Class)MCProfileTitlePageViewController;
  [(MCProfileTitlePageViewController *)&v5 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCProfileTitlePageViewController;
  [(MCProfileTitlePageViewController *)&v5 viewWillAppear:a3];
  v4 = [(MCProfileTitlePageViewController *)self navigationController];
  [v4 setNavigationBarHidden:1 animated:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCProfileTitlePageViewController;
  [(MCProfileTitlePageViewController *)&v5 viewDidAppear:a3];
  [(MCProfileTitlePageViewController *)self _updateBottomInsetToEnableCompleteScrollAnimation];
  v4 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  [v4 showBottomView:1 animated:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCProfileTitlePageViewController;
  [(MCProfileTitlePageViewController *)&v5 viewDidDisappear:a3];
  v4 = [(MCProfileTitlePageViewController *)self navigationController];
  [v4 setNavigationBarHidden:0 animated:1];
}

- (void)viewControllerHasBeenDismissed
{
  v3 = [(MCProfileTitlePageViewController *)self viewModel];
  [v3 terminateProfileInstallationFlow];

  [(MCProfileTitlePageViewController *)self setUserInteractionEnabled:1];
}

- (id)_sectionControllersWithProfile:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = objc_opt_new();
  v6 = [[MCProfileTitlePageMetaDataSectionController alloc] initWithProfile:v4];
  metaDataSectionController = self->_metaDataSectionController;
  self->_metaDataSectionController = v6;

  double v8 = objc_opt_new();
  double v9 = [v4 installationWarnings];
  [v8 addObjectsFromArray:v9];

  double v10 = [v4 localizedConsentText];

  if (v10)
  {
    double v11 = NSString;
    double v12 = MCUILocalizedString(@"INSTALL_CONSENT_MESSAGE_FROM_%@");
    uint64_t v13 = [v4 organization];
    double v14 = (void *)v13;
    if (v13)
    {
      v15 = objc_msgSend(v11, "stringWithFormat:", v12, v13);
    }
    else
    {
      double v16 = [v4 friendlyName];
      v15 = objc_msgSend(v11, "stringWithFormat:", v12, v16);
    }
    id v17 = objc_alloc(MEMORY[0x1E4F74238]);
    v18 = [v4 localizedConsentText];
    v19 = (void *)[v17 initWithLocalizedTitle:v15 localizedBody:v18 isLongForm:1];

    [v8 addObject:v19];
  }
  [v5 addObject:self->_metaDataSectionController];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v20 = v8;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = [[MCProfileTitlePageWarningSectionController alloc] initWithWarning:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        [v5 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v22);
  }

  v26 = (void *)[v5 copy];
  return v26;
}

- (void)_updateMetaDataSectionHeight
{
  id v13 = [(MCProfileTitlePageViewController *)self metaDataSectionController];
  v3 = [v13 iconCell];
  [v3 bounds];
  double Height = CGRectGetHeight(v15);
  objc_super v5 = [(MCProfileTitlePageViewController *)self metaDataSectionController];
  v6 = [v5 titleCell];
  [v6 bounds];
  double v7 = Height + CGRectGetHeight(v16);
  double v8 = [(MCProfileTitlePageViewController *)self metaDataSectionController];
  double v9 = [v8 subtitleCell];
  [v9 bounds];
  double v10 = v7 + CGRectGetHeight(v17);
  double v11 = [(MCProfileTitlePageViewController *)self metaDataSectionController];
  double v12 = [v11 orgCell];
  [v12 bounds];
  [(MCProfileTitlePageViewController *)self setMetaDataSectionHeight:v10 + CGRectGetHeight(v18)];
}

- (void)_resetNavigationBarStyleForViewController:(id)a3
{
  id v3 = a3;
  id v4 = [v3 navigationController];
  objc_super v5 = [v4 navigationBar];
  [v5 setBackgroundImage:0 forBarMetrics:0];

  id v7 = [v3 navigationController];

  v6 = [v7 navigationBar];
  [v6 setShadowImage:0];
}

- (void)_updateBottomInsetToEnableCompleteScrollAnimation
{
  if (![(MCProfileTitlePageViewController *)self hasUpdatedBottomInset])
  {
    [(MCProfileTitlePageViewController *)self setHasUpdatedBottomInset:1];
    id v3 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
    id v4 = [v3 tableView];
    [v4 contentSize];
    double v6 = v5;

    id v7 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
    double v8 = [v7 tableView];
    [v8 frame];
    double v10 = v9;
    double v11 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
    double v12 = [v11 tableView];
    [v12 contentInset];
    double v14 = v13;

    double v15 = -v14;
    if (v14 >= 0.0) {
      double v15 = v14;
    }
    double v16 = v10 - v15;
    CGRect v17 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
    CGRect v18 = [v17 tableView];
    [v18 contentInset];
    double v20 = v19;

    double v21 = -v20;
    if (v20 >= 0.0) {
      double v21 = v20;
    }
    double v22 = v16 - v21;

    NSLog(&cfstr_ContentsizeFVi.isa, *(void *)&v6, *(void *)&v22);
    if (v6 > v22)
    {
      uint64_t v23 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
      double v24 = [v23 tableView];
      [v24 contentInset];
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;

      [(MCProfileTitlePageViewController *)self metaDataSectionHeight];
      double v34 = v30 + fmax(v33 - (v6 - v22), 0.0);
      id v36 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
      objc_super v35 = [v36 tableView];
      objc_msgSend(v35, "setContentInset:", v26, v28, v34, v32);
    }
  }
}

- (MCProfileTitlePageMetaDataSectionAnimationController)animationController
{
  animationController = self->_animationController;
  if (!animationController)
  {
    id v4 = (MCProfileTitlePageMetaDataSectionAnimationController *)objc_opt_new();
    double v5 = self->_animationController;
    self->_animationController = v4;

    animationController = self->_animationController;
  }
  return animationController;
}

- (void)infoButtonTapped:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F5E668]);
  double v5 = [(MCProfileTitlePageViewController *)self viewModel];
  double v6 = [v5 profileViewModel];
  id v11 = (id)[v4 initWithProfileViewModel:v6];

  id v7 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  double v8 = [v7 bottomBarView];
  [v8 frame];
  [v11 setTableViewBottomInset:CGRectGetHeight(v13)];

  double v9 = [(MCProfileTitlePageViewController *)self navigationController];
  [v9 pushViewController:v11 animated:1];

  double v10 = [v11 navigationController];
  [v10 setNavigationBarHidden:0 animated:1];

  [(MCProfileTitlePageViewController *)self _resetNavigationBarStyleForViewController:v11];
}

- (void)installButtonTapped:(id)a3
{
  id v3 = [(MCProfileTitlePageViewController *)self viewModel];
  [v3 startProfileInstallationFlow];
}

- (void)cancelButtonTapped:(id)a3
{
  id v3 = [(MCProfileTitlePageViewController *)self viewModel];
  [v3 terminateProfileInstallationFlowAndDeleteProfile];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  [v4 contentInset];
  double v8 = v7;

  id v10 = [(MCProfileTitlePageViewController *)self animationController];
  [(MCProfileTitlePageViewController *)self metaDataSectionHeight];
  [v10 updateProgressWithTranslationDistance:1 referenceDistance:v6 + v8 isScrolling:v9];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  [v4 contentInset];
  double v8 = v7;

  id v10 = [(MCProfileTitlePageViewController *)self animationController];
  [(MCProfileTitlePageViewController *)self metaDataSectionHeight];
  [v10 updateProgressWithTranslationDistance:1 referenceDistance:v6 + v8 isScrolling:v9];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  [v4 contentInset];
  double v8 = v7;

  id v10 = [(MCProfileTitlePageViewController *)self animationController];
  [(MCProfileTitlePageViewController *)self metaDataSectionHeight];
  [v10 updateProgressWithTranslationDistance:0 referenceDistance:v6 + v8 isScrolling:v9];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    id v6 = a3;
    [v6 contentOffset];
    double v8 = v7;
    [v6 contentInset];
    double v10 = v9;

    id v12 = [(MCProfileTitlePageViewController *)self animationController];
    [(MCProfileTitlePageViewController *)self metaDataSectionHeight];
    [v12 updateProgressWithTranslationDistance:0 referenceDistance:v8 + v10 isScrolling:v11];
  }
}

- (void)promptForPasscodeWithCompletionHandler:(id)a3
{
  [(MCProfileTitlePageViewController *)self setPasscodeCompletionHandler:a3];
  id v9 = (id)objc_opt_new();
  [v9 setDelegate:self];
  if (MCUIIsiPad())
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v9];
    [v4 setModalPresentationStyle:2];
    double v5 = [(MCProfileTitlePageViewController *)self navigationController];
    [v5 presentViewController:v4 animated:1 completion:0];

    id v6 = [v9 navigationController];
    [v6 setNavigationBarHidden:0 animated:0];
  }
  else
  {
    [v9 setStyle:1];
    double v7 = [(MCProfileTitlePageViewController *)self navigationController];
    [v7 popToViewController:self pushViewController:v9 animated:1];

    double v8 = [v9 navigationController];
    [v8 setNavigationBarHidden:0 animated:1];

    uint64_t v4 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
    [v4 showBottomView:0 animated:1];
  }
}

- (void)promptForUserInput:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [(MCProfileTitlePageViewController *)self setUserInputCompletionHandler:a4];
  id v10 = (id)[objc_alloc(MEMORY[0x1E4F5E660]) initWithUserInput:v6];

  [v10 setQuestionsDelegate:self];
  double v7 = [(MCProfileTitlePageViewController *)self navigationController];
  [v7 popToViewController:self pushViewController:v10 animated:1];

  double v8 = [v10 navigationController];
  [v8 setNavigationBarHidden:0 animated:1];

  [(MCProfileTitlePageViewController *)self _resetNavigationBarStyleForViewController:v10];
  id v9 = [(MCProfileTitlePageViewController *)self profileTitlePageView];
  [v9 showBottomView:0 animated:1];
}

- (void)informQuestionViewControllerOfPreflightResult:(id)a3 profileConnection:(id)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__MCProfileTitlePageViewController_informQuestionViewControllerOfPreflightResult_profileConnection___block_invoke;
  block[3] = &unk_1E6EAD2A8;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __100__MCProfileTitlePageViewController_informQuestionViewControllerOfPreflightResult_profileConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained questionsController];
    [v3 profileConnectionDidFinishPreflightWithError:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (void)presentAuthenticationViewControllerWithContext:(id)a3 authenticationPreparationHandler:(id)a4 authenticationCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(MCProfileTitlePageViewController *)self setAuthenticationPreparationHandler:a4];
  [(MCProfileTitlePageViewController *)self setAuthenticationCompletionHandler:v9];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __148__MCProfileTitlePageViewController_presentAuthenticationViewControllerWithContext_authenticationPreparationHandler_authenticationCompletionHandler___block_invoke;
  v11[3] = &unk_1E6EAD458;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __148__MCProfileTitlePageViewController_presentAuthenticationViewControllerWithContext_authenticationPreparationHandler_authenticationCompletionHandler___block_invoke(uint64_t a1)
{
  id v8 = objc_alloc_init(MCUISignInViewController);
  [(MCUISignInViewController *)v8 setDelegate:*(void *)(a1 + 32)];
  [(MCUISignInViewController *)v8 setContext:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) viewModel];
  id v3 = [v2 profile];
  id v4 = [v3 organization];
  [(MCUISignInViewController *)v8 setOrgName:v4];

  id v5 = [*(id *)(a1 + 32) navigationController];
  [v5 popToViewController:*(void *)(a1 + 32) pushViewController:v8 animated:1];

  id v6 = [(MCUISignInViewController *)v8 navigationController];
  [v6 setNavigationBarHidden:0 animated:1];

  double v7 = [*(id *)(a1 + 32) profileTitlePageView];
  [v7 showBottomView:0 animated:1];
}

- (void)promptForManagedRestoreWithManagedAppleID:(id)a3 snapshot:(id)a4 conflictingApps:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [(MCProfileTitlePageViewController *)self setRestoreCompletionHandler:a6];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __121__MCProfileTitlePageViewController_promptForManagedRestoreWithManagedAppleID_snapshot_conflictingApps_completionHandler___block_invoke;
  v16[3] = &unk_1E6EAD480;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

void __121__MCProfileTitlePageViewController_promptForManagedRestoreWithManagedAppleID_snapshot_conflictingApps_completionHandler___block_invoke(uint64_t a1)
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F5E648]) initWithDelegate:*(void *)(a1 + 32) managedAppleID:*(void *)(a1 + 40) restoreSnapshot:*(void *)(a1 + 48) conflictingApps:*(void *)(a1 + 56)];
  v2 = [*(id *)(a1 + 32) navigationController];
  [v2 popToViewController:*(void *)(a1 + 32) pushViewController:v4 animated:1];

  id v3 = [v4 navigationController];
  [v3 setNavigationBarHidden:0 animated:1];
}

- (void)presentSpinnerViewController
{
  id v3 = (MCActivityViewController *)objc_opt_new();
  id v4 = [(MCActivityViewController *)v3 view];
  [v4 setUserInteractionEnabled:0];

  id v5 = MCUILocalizedString(@"BLOB_SIGN_IN_ACCOUNT");
  [(MCActivityViewController *)v3 setInProgresText:v5];

  id v6 = MCUILocalizedString(@"ENROLLMENT_SUCCESSFUL");
  [(MCActivityViewController *)v3 setCompletionText:v6];

  double v7 = MCUILocalizedString(@"SIGN_IN_DURATION_WARNING");
  [(MCActivityViewController *)v3 setLongWaitingWarningText:v7];

  [(MCActivityViewController *)v3 setLongWaitingWarningThreshold:20.0];
  id v8 = [(MCProfileTitlePageViewController *)self navigationController];
  [v8 popToViewController:self pushViewController:v3 animated:1];

  id v9 = [(MCActivityViewController *)v3 navigationController];
  [v9 setNavigationBarHidden:1 animated:1];

  activityViewController = self->_activityViewController;
  self->_activityViewController = v3;
}

- (void)installationFinishedSuccessfully:(BOOL)a3 shouldDismiss:(BOOL)a4 shouldRedirect:(BOOL)a5 errorToDisplay:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  id v11 = [(MCProfileTitlePageViewController *)self navigationController];
  id v12 = [v11 topViewController];
  int v13 = [v12 isEqual:self->_activityViewController];

  if (!v8)
  {
LABEL_10:
    int64_t v18 = 0;
    if (v10) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  activityViewController = self->_activityViewController;
  if (activityViewController)
  {
    if (!v13) {
      goto LABEL_10;
    }
  }
  else
  {
    [(MCProfileTitlePageViewController *)self presentSpinnerViewController];
    id v15 = [(MCProfileTitlePageViewController *)self navigationController];
    double v16 = [v15 topViewController];
    int v17 = [v16 isEqual:self->_activityViewController];

    if (!v17) {
      goto LABEL_10;
    }
    activityViewController = self->_activityViewController;
  }
  [(MCActivityViewController *)activityViewController completeActivityAnimated:1];
  int64_t v18 = 1200000047;
  if (v10)
  {
LABEL_11:
    dispatch_time_t v20 = dispatch_time(0, 1000000000);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __113__MCProfileTitlePageViewController_installationFinishedSuccessfully_shouldDismiss_shouldRedirect_errorToDisplay___block_invoke_2;
    v21[3] = &unk_1E6EAD458;
    v21[4] = self;
    id v22 = v10;
    dispatch_after(v20, MEMORY[0x1E4F14428], v21);

    goto LABEL_12;
  }
LABEL_8:
  if (v7)
  {
    dispatch_time_t v19 = dispatch_time(0, v18);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__MCProfileTitlePageViewController_installationFinishedSuccessfully_shouldDismiss_shouldRedirect_errorToDisplay___block_invoke;
    block[3] = &unk_1E6EAD430;
    void block[4] = self;
    BOOL v24 = a5;
    dispatch_after(v19, MEMORY[0x1E4F14428], block);
  }
LABEL_12:
}

void __113__MCProfileTitlePageViewController_installationFinishedSuccessfully_shouldDismiss_shouldRedirect_errorToDisplay___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];

  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F742A8]];
    [v4 openSensitiveURL:v3 withOptions:0];
  }
}

uint64_t __113__MCProfileTitlePageViewController_installationFinishedSuccessfully_shouldDismiss_shouldRedirect_errorToDisplay___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  id v3 = (id)[v2 popToViewController:*(void *)(a1 + 32) animated:1];

  NSLog(&cfstr_SignInFailedEr.isa, *(void *)(a1 + 40));
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _showAlertForInstallError:v5];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MCProfileTitlePageViewController *)self view];
  int v6 = [v5 isUserInteractionEnabled];

  if (v3)
  {
    if (v6) {
      return;
    }
    NSLog(&cfstr_Mcprofiletitle.isa);
    BOOL v7 = [(MCProfileTitlePageViewController *)self view];
    id v9 = v7;
    uint64_t v8 = 1;
  }
  else
  {
    if (!v6) {
      return;
    }
    NSLog(&cfstr_Mcprofiletitle_0.isa);
    BOOL v7 = [(MCProfileTitlePageViewController *)self view];
    id v9 = v7;
    uint64_t v8 = 0;
  }
  [v7 setUserInteractionEnabled:v8];
}

- (void)_showAlertForInstallError:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F42728];
  id v5 = a3;
  int v6 = [v5 localizedDescription];
  BOOL v7 = [v5 localizedRecoverySuggestion];

  id v10 = [v4 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  uint64_t v8 = MCUILocalizedString(@"OK");
  [v10 MCUIAddCancelActionWithTitle:v8];

  id v9 = [(MCProfileTitlePageViewController *)self navigationController];
  [v10 MCUIShowFromController:v9];
}

- (void)presentRestoreFailedAlertWithError:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__MCProfileTitlePageViewController_presentRestoreFailedAlertWithError_completionHandler___block_invoke;
  block[3] = &unk_1E6EAD3E8;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __89__MCProfileTitlePageViewController_presentRestoreFailedAlertWithError_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F42728];
    id v4 = MCUILocalizedString(@"RESTORE_FAILED");
    id v5 = [v3 alertControllerWithTitle:0 message:v4 preferredStyle:1];

    id v6 = (void *)MEMORY[0x1E4F42720];
    BOOL v7 = MCUILocalizedString(@"OK");
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__MCProfileTitlePageViewController_presentRestoreFailedAlertWithError_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6EAD4A8;
    id v11 = *(id *)(a1 + 32);
    id v8 = [v6 actionWithTitle:v7 style:0 handler:v10];
    [v5 addAction:v8];

    id v9 = [WeakRetained navigationController];
    [v5 MCUIShowFromController:v9];
  }
}

uint64_t __89__MCProfileTitlePageViewController_presentRestoreFailedAlertWithError_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (MCUIIsiPad())
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __56__MCProfileTitlePageViewController_didAcceptEnteredPIN___block_invoke;
    id v9 = &unk_1E6EAD1F8;
    objc_copyWeak(&v10, &location);
    dispatch_async(MEMORY[0x1E4F14428], &v6);
    objc_destroyWeak(&v10);
  }
  id v5 = [(MCProfileTitlePageViewController *)self passcodeCompletionHandler];
  ((void (**)(void, uint64_t, id))v5)[2](v5, 1, v4);

  objc_destroyWeak(&location);
}

void __56__MCProfileTitlePageViewController_didAcceptEnteredPIN___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained navigationController];
    [v2 dismissViewControllerAnimated:1 completion:0];

    id WeakRetained = v3;
  }
}

- (void)didCancelEnteringPIN
{
  objc_initWeak(&location, self);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __56__MCProfileTitlePageViewController_didCancelEnteringPIN__block_invoke;
  uint64_t v7 = &unk_1E6EAD1F8;
  objc_copyWeak(&v8, &location);
  dispatch_async(MEMORY[0x1E4F14428], &v4);
  id v3 = [(MCProfileTitlePageViewController *)self passcodeCompletionHandler];
  v3[2](v3, 0, 0);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __56__MCProfileTitlePageViewController_didCancelEnteringPIN__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    int v2 = MCUIIsiPad();
    id v3 = [v6 navigationController];
    uint64_t v4 = v3;
    if (v2) {
      [v3 dismissViewControllerAnimated:1 completion:0];
    }
    else {
      id v5 = (id)[v3 popToViewController:v6 animated:1];
    }

    id WeakRetained = v6;
  }
}

- (void)questionsController:(id)a3 didFinishWithResponses:(id)a4
{
  id v5 = a4;
  id v6 = [(MCProfileTitlePageViewController *)self userInputCompletionHandler];
  v6[2](v6, v5, [v5 count] == 0);
}

- (BOOL)questionsControllerIsDisplayedInSheet:(id)a3
{
  id v3 = [(MCProfileTitlePageViewController *)self presentingViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(MCProfileTitlePageViewController *)self authenticationCompletionHandler];
  v9[2](v9, v8, v7, 0);
}

- (void)signInViewControllerDidCancelAuthentication:(id)a3
{
  id v3 = [(MCProfileTitlePageViewController *)self authenticationCompletionHandler];
  (*((void (**)(id, void, void, uint64_t))v3 + 2))(v3, 0, 0, 1);
}

- (void)signInViewController:(id)a3 willAuthenticateWithCompletionHandler:(id)a4
{
  id v7 = (void (**)(void))a4;
  id v5 = [(MCProfileTitlePageViewController *)self authenticationPreparationHandler];

  if (v5)
  {
    id v6 = [(MCProfileTitlePageViewController *)self authenticationPreparationHandler];
    ((void (**)(void, void (**)(void)))v6)[2](v6, v7);
  }
  else
  {
    v7[2]();
  }
}

- (void)restoreViewController:(id)a3 didReceiveUserAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(MCProfileTitlePageViewController *)self restoreCompletionHandler];

  if (v6)
  {
    id v7 = [(MCProfileTitlePageViewController *)self restoreCompletionHandler];
    v7[2](v7, v4);
  }
}

- (MCProfileTitlePageViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (MCProfileTitlePageView)profileTitlePageView
{
  return self->_profileTitlePageView;
}

- (void)setProfileTitlePageView:(id)a3
{
}

- (double)metaDataSectionHeight
{
  return self->_metaDataSectionHeight;
}

- (void)setMetaDataSectionHeight:(double)a3
{
  self->_metaDataSectiondouble Height = a3;
}

- (BOOL)hasUpdatedBottomInset
{
  return self->_hasUpdatedBottomInset;
}

- (void)setHasUpdatedBottomInset:(BOOL)a3
{
  self->_hasUpdatedBottomInset = a3;
}

- (MCProfileTitlePageMetaDataSectionController)metaDataSectionController
{
  return self->_metaDataSectionController;
}

- (void)setMetaDataSectionController:(id)a3
{
}

- (void)setAnimationController:(id)a3
{
}

- (DMCInstallProfileQuestionViewController)questionsController
{
  return self->_questionsController;
}

- (void)setQuestionsController:(id)a3
{
}

- (MCActivityViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
}

- (id)passcodeCompletionHandler
{
  return self->_passcodeCompletionHandler;
}

- (void)setPasscodeCompletionHandler:(id)a3
{
}

- (id)authenticationCompletionHandler
{
  return self->_authenticationCompletionHandler;
}

- (void)setAuthenticationCompletionHandler:(id)a3
{
}

- (id)authenticationPreparationHandler
{
  return self->_authenticationPreparationHandler;
}

- (void)setAuthenticationPreparationHandler:(id)a3
{
}

- (id)userInputCompletionHandler
{
  return self->_userInputCompletionHandler;
}

- (void)setUserInputCompletionHandler:(id)a3
{
}

- (id)restoreCompletionHandler
{
  return self->_restoreCompletionHandler;
}

- (void)setRestoreCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_restoreCompletionHandler, 0);
  objc_storeStrong(&self->_userInputCompletionHandler, 0);
  objc_storeStrong(&self->_authenticationPreparationHandler, 0);
  objc_storeStrong(&self->_authenticationCompletionHandler, 0);
  objc_storeStrong(&self->_passcodeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_questionsController, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_metaDataSectionController, 0);
  objc_storeStrong((id *)&self->_profileTitlePageView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end