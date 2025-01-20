@interface MCInstallProfileViewController
- (BOOL)_attemptRemoteInstallAfterCompletingPrecheck;
- (BOOL)_installErrorIsUserCancelledError:(id)a3;
- (BOOL)delayNextQuesion;
- (BOOL)displayedAsSheet;
- (BOOL)installHasFailed;
- (BOOL)isDeallocating;
- (BOOL)processingPayload;
- (BOOL)profileViewControllerIsProfileInstalled;
- (BOOL)questionsAlreadyAsked;
- (BOOL)secondaryProfileReceived;
- (BOOL)userCancelledInstall;
- (BOOL)waitingForNextQuestion;
- (DMCProfileViewController)profileViewController;
- (MCInstallProfileDelegate)delegate;
- (MCInstallProfileQuestionViewController)questionsController;
- (MCInstallProfileViewController)initWithInstallableProfileData:(id)a3 fromSource:(unint64_t)a4;
- (MCInstallProfileViewController)initWithProfile:(id)a3 viewMode:(int64_t)a4;
- (MCInstallProfileViewController)initWithProfile:(id)a3 viewMode:(int64_t)a4 profileUIDataProvider:(id)a5;
- (MCInstallProfileViewController)initWithProfileDataFromSettingsJump:(id)a3;
- (MCProfile)originalProfile;
- (MCProfile)profile;
- (NSArray)warnings;
- (NSData)originalProfileData;
- (NSData)profileData;
- (NSString)enrollmentPersonaID;
- (NSString)pin;
- (id)_localizedCPLFinalWarningString;
- (id)_newRightBarButtonItem;
- (id)didAppearBlock;
- (id)signInCompletionHandler;
- (int)installState;
- (void)_beginInstallFlow;
- (void)_cancelInstallAfterMAIDAuthenticationAnimated:(BOOL)a3;
- (void)_cancelInstallDueToApplicationExit;
- (void)_didFinishEnteringPINWithCompletion:(id)a3;
- (void)_didFinishPresentingConsent:(id)a3;
- (void)_finishWaitingForMoreQuestions;
- (void)_handleInstallationError:(id)a3;
- (void)_hideProgressIndicatorIfNeeded;
- (void)_installFinishedWithIdentifier:(id)a3 error:(id)a4;
- (void)_presentConsent:(id)a3;
- (void)_promptUserWithQuestions:(id)a3;
- (void)_promptUserWithQuestionsAfterDelay:(id)a3;
- (void)_removeProfileWithIdentifier:(id)a3 isProtectedProfile:(BOOL)a4 completionHandler:(id)a5;
- (void)_resetInstallationVariables;
- (void)_returnToSender;
- (void)_showCPLFinalInstallationWarning:(id)a3 withMDMWarning:(BOOL)a4;
- (void)_signInMAID:(id)a3 completionHandler:(id)a4;
- (void)_takeMeBack;
- (void)_waitForNextQuestion;
- (void)addCancelActionToAlert:(id)a3 withCompletion:(id)a4;
- (void)addInstallActionWithTitle:(id)a3 style:(int64_t)a4 toAlert:(id)a5 completion:(id)a6;
- (void)cancelInstallWhilePresentingConsentAndWarningsAnimated:(BOOL)a3;
- (void)cancelInstallWhilePresentingConsentAndWarningsUponDidAppear;
- (void)cancelInstallWhilePresentingQuestionsAnimated:(BOOL)a3;
- (void)consentExtensionShowConsentAndWarnings:(id)a3;
- (void)continueInstallFlowAfterCompletingPrecheck;
- (void)continueInstallFlowAfterPINVerification;
- (void)dealloc;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didCancelEnteringPIN;
- (void)installationConsentViewController:(id)a3 finishedWithUserContinueResponse:(BOOL)a4;
- (void)installationWarningViewController:(id)a3 finishedWithUserContinueResponse:(BOOL)a4;
- (void)performRemoveAfterFinalVerification;
- (void)pinExtensionShowPINSheet;
- (void)profileConnection:(id)a3 didBeginInstallingNextProfile:(id)a4;
- (void)profileConnection:(id)a3 didFinishInstallationWithIdentifier:(id)a4 error:(id)a5;
- (void)profileConnection:(id)a3 didFinishPreflightWithError:(id)a4;
- (void)profileConnection:(id)a3 didRequestMAIDSignIn:(id)a4 personaID:(id)a5;
- (void)profileConnection:(id)a3 didRequestUserInput:(id)a4;
- (void)profileConnection:(id)a3 didShowUserWarnings:(id)a4;
- (void)profileConnection:(id)a3 didUpdateStatus:(id)a4;
- (void)profileConnectionDidRequestCurrentPasscode:(id)a3;
- (void)profileRemovalDidFinish;
- (void)questionsController:(id)a3 didFinishWithResponses:(id)a4;
- (void)questionsExtensionDidFinishPreflightWithError:(id)a3;
- (void)questionsExtensionDidRequestAnswersForQuestions:(id)a3;
- (void)questionsExtensionInstallFinished;
- (void)queueNextProfileData:(id)a3;
- (void)setCurrentQuestionsController:(id)a3;
- (void)setDelayNextQuesion:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAppearBlock:(id)a3;
- (void)setEnrollmentPersonaID:(id)a3;
- (void)setInstallHasFailed:(BOOL)a3;
- (void)setInstallState:(int)a3;
- (void)setInstallState:(int)a3 animated:(BOOL)a4;
- (void)setIsDeallocating:(BOOL)a3;
- (void)setOriginalProfile:(id)a3;
- (void)setOriginalProfileData:(id)a3;
- (void)setPin:(id)a3;
- (void)setProcessingPayload:(BOOL)a3;
- (void)setProfile:(id)a3;
- (void)setProfileData:(id)a3;
- (void)setProfileViewController:(id)a3;
- (void)setQuestionsAlreadyAsked:(BOOL)a3;
- (void)setQuestionsController:(id)a3;
- (void)setSecondaryProfileReceived:(BOOL)a3;
- (void)setSignInCompletionHandler:(id)a3;
- (void)setUserCancelledInstall:(BOOL)a3;
- (void)setWaitingForNextQuestion:(BOOL)a3;
- (void)setWarnings:(id)a3;
- (void)showFinalInstallationAlert:(id)a3;
- (void)showMDMFinalInstallationAlert:(id)a3;
- (void)showProgressIndicator;
- (void)showReEnrollFailureAlert;
- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5;
- (void)submitQuestionAnswers:(id)a3;
- (void)updateBarButtonItemsForProfileInstallationState:(int)a3 animated:(BOOL)a4;
- (void)updateTitleForProfileInstallationState:(int)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)warningsExtensionPushWarningsControllerWithWarnings:(id)a3;
@end

@implementation MCInstallProfileViewController

- (MCInstallProfileViewController)initWithProfileDataFromSettingsJump:(id)a3
{
  return [(MCInstallProfileViewController *)self initWithInstallableProfileData:a3 fromSource:0];
}

- (MCInstallProfileViewController)initWithInstallableProfileData:(id)a3 fromSource:(unint64_t)a4
{
  id v7 = a3;
  v8 = [MEMORY[0x1E4F74220] profileWithData:v7 outError:0];
  v9 = [(MCInstallProfileViewController *)self initWithProfile:v8 viewMode:1];
  v10 = v9;
  if (v9)
  {
    [(MCInstallProfileViewController *)v9 setInstallState:1 animated:1];
    objc_storeStrong((id *)&v10->_profileData, a3);
    [(MCInstallProfileViewController *)v10 setOriginalProfileData:v7];
    v11 = [(MCInstallProfileViewController *)v10 profileViewController];
    [v11 setInstallProfileSource:a4];

    if (a4)
    {
      v12 = MCUILocalizedString(@"BLOB_INSTALL_TITLE");
      v13 = [(MCInstallProfileViewController *)v10 navigationItem];
      [v13 setTitle:v12];
    }
    else
    {
      v14 = [v8 friendlyName];
      v15 = [(MCInstallProfileViewController *)v10 navigationItem];
      [v15 setTitle:v14];

      v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 addObserver:v10 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4F43660] object:0];
    }
  }
  return v10;
}

- (MCInstallProfileViewController)initWithProfile:(id)a3 viewMode:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  v8 = [(MCInstallProfileViewController *)self initWithProfile:v6 viewMode:a4 profileUIDataProvider:v7];

  return v8;
}

- (MCInstallProfileViewController)initWithProfile:(id)a3 viewMode:(int64_t)a4 profileUIDataProvider:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)MCInstallProfileViewController;
  v11 = [(MCUIViewController *)&v32 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_profile, a3);
    [(MCInstallProfileViewController *)v12 setOriginalProfile:v9];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F5E680]) initWithProfile:v9 viewMode:a4 profileUIDataProvider:v10];
    [(MCInstallProfileViewController *)v12 setProfileViewController:v13];

    v14 = [(MCInstallProfileViewController *)v12 profileViewController];
    [(MCInstallProfileViewController *)v12 addChildViewController:v14];

    v15 = [(MCInstallProfileViewController *)v12 view];
    [v15 frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = [(MCInstallProfileViewController *)v12 profileViewController];
    v25 = [v24 view];
    objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);

    v26 = [(MCInstallProfileViewController *)v12 view];
    v27 = [(MCInstallProfileViewController *)v12 profileViewController];
    v28 = [v27 view];
    [v26 addSubview:v28];

    v29 = [(MCInstallProfileViewController *)v12 profileViewController];
    [v29 didMoveToParentViewController:v12];

    v30 = [(MCInstallProfileViewController *)v12 profileViewController];
    [v30 setProfileViewControllerDelegate:v12];
  }
  return v12;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MCInstallProfileViewController *)self setIsDeallocating:1];
  [(MCInstallProfileViewController *)self _cancelInstallDueToApplicationExit];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(MCInstallProfileViewController *)self childViewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v8 willMoveToParentViewController:0];
        id v9 = [v8 view];
        [v9 removeFromSuperview];

        [v8 removeFromParentViewController];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)MCInstallProfileViewController;
  [(MCUIViewController *)&v10 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCInstallProfileViewController;
  [(MCInstallProfileViewController *)&v6 viewDidAppear:a3];
  uint64_t v4 = [(MCInstallProfileViewController *)self didAppearBlock];

  if (v4)
  {
    uint64_t v5 = [(MCInstallProfileViewController *)self didAppearBlock];
    v5[2]();

    [(MCInstallProfileViewController *)self setDidAppearBlock:0];
  }
  else
  {
    [(MCInstallProfileViewController *)self setDelayNextQuesion:0];
  }
  [(MCInstallProfileViewController *)self setModalInPresentation:1];
}

- (BOOL)displayedAsSheet
{
  v2 = [(MCInstallProfileViewController *)self presentingViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_returnToSender
{
  if ([(MCInstallProfileViewController *)self installHasFailed]) {
    BOOL v3 = [(MCInstallProfileViewController *)self userCancelledInstall];
  }
  else {
    BOOL v3 = 1;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__MCInstallProfileViewController__returnToSender__block_invoke;
  v4[3] = &unk_1E6EAD230;
  v4[4] = self;
  [(UIViewController *)self MCUIReturnToSender:v3 returnToAccountSettings:0 viewControllerDismissalBlock:v4];
}

void __49__MCInstallProfileViewController__returnToSender__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) navigationController];
  BOOL v3 = [v4 presentingViewController];
  [v3 dismissViewControllerAnimated:a2 completion:0];
}

- (void)_takeMeBack
{
  BOOL v3 = [(MCInstallProfileViewController *)self profileViewController];
  uint64_t v4 = [v3 installProfileSource];

  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F74230] sharedConnection];
      id v6 = [v5 popProfileDataFromHeadOfInstallationQueue];

      if (v6) {
        [(MCInstallProfileViewController *)self queueNextProfileData:v6];
      }
      else {
        [(MCInstallProfileViewController *)self _returnToSender];
      }
    }
  }
  else
  {
    [(MCInstallProfileViewController *)self _returnToSender];
  }
}

- (void)queueNextProfileData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCInstallProfileViewController *)self profile];
  [(MCInstallProfileViewController *)self setOriginalProfile:v5];

  id v6 = [(MCInstallProfileViewController *)self profileData];
  [(MCInstallProfileViewController *)self setOriginalProfileData:v6];

  [(MCInstallProfileViewController *)self setProfileData:v4];
  [(MCInstallProfileViewController *)self setInstallState:1 animated:1];
}

- (void)setProfile:(id)a3
{
  id v8 = a3;
  id v5 = [(MCInstallProfileViewController *)self profile];

  if (v5 != v8)
  {
    objc_storeStrong((id *)&self->_profile, a3);
    profileData = self->_profileData;
    self->_profileData = 0;

    id v7 = [(MCInstallProfileViewController *)self profileViewController];
    [v7 setProfile:v8];
  }
}

- (void)setProfileData:(id)a3
{
  id v10 = a3;
  id v5 = [(MCInstallProfileViewController *)self profileData];

  if (v5 != v10)
  {
    objc_storeStrong((id *)&self->_profileData, a3);
    id v6 = [MEMORY[0x1E4F74220] profileWithData:v10 outError:0];
    profile = self->_profile;
    self->_profile = v6;

    id v8 = self->_profile;
    id v9 = [(MCInstallProfileViewController *)self profileViewController];
    [v9 setProfile:v8];
  }
}

- (void)setInstallState:(int)a3
{
}

- (void)setInstallState:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if (![(MCInstallProfileViewController *)self isDeallocating]
    && [(MCInstallProfileViewController *)self installState] != v5)
  {
    self->_installState = v5;
    int v7 = [(MCInstallProfileViewController *)self installState];
    switch(v7)
    {
      case 1:
        [(MCInstallProfileViewController *)self _resetInstallationVariables];
        break;
      case 9:
        [(MCInstallProfileViewController *)self _resetInstallationVariables];
        id v8 = [(MCInstallProfileViewController *)self profileViewController];
        id v9 = [v8 tableView];
        [v9 reloadData];

        break;
      case 2:
        [(MCInstallProfileViewController *)self setInstallHasFailed:0];
        break;
    }
    [(MCInstallProfileViewController *)self updateTitleForProfileInstallationState:v5];
    [(MCInstallProfileViewController *)self updateBarButtonItemsForProfileInstallationState:v5 animated:v4];
  }
}

- (void)_resetInstallationVariables
{
  [(MCInstallProfileViewController *)self setProcessingPayload:0];
  [(MCInstallProfileViewController *)self setUserCancelledInstall:0];
  [(MCInstallProfileViewController *)self setQuestionsAlreadyAsked:0];
  [(MCInstallProfileViewController *)self setPin:0];
  [(MCInstallProfileViewController *)self setDidAppearBlock:0];
  [(MCInstallProfileViewController *)self _hideProgressIndicatorIfNeeded];
}

- (void)showProgressIndicator
{
  if ([(MCInstallProfileViewController *)self displayedAsSheet])
  {
    BOOL v3 = [(MCInstallProfileViewController *)self navigationItem];
    [v3 setLeftBarButtonItem:0 animated:0];

    BOOL v4 = [(MCInstallProfileViewController *)self navigationItem];
    [v4 setRightBarButtonItem:0 animated:0];
  }
  [(UIViewController *)self MCUIShowProgressInNavBar];
}

- (void)_hideProgressIndicatorIfNeeded
{
  if ([(UIViewController *)self MCUIIsShowingProgress])
  {
    [(UIViewController *)self MCUIHideProgressInNavBarShowBackButton:1];
  }
}

- (void)updateTitleForProfileInstallationState:(int)a3
{
  if (a3 == 1)
  {
    BOOL v4 = @"BLOB_INSTALL_TITLE";
    goto LABEL_5;
  }
  if (a3 == 9)
  {
    BOOL v4 = @"BLOB_JUST_INSTALLED_TITLE";
LABEL_5:
    MCUILocalizedString(v4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  if (![(MCInstallProfileViewController *)self processingPayload])
  {
    id v6 = v8;
    if (!v8) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v5 = MCUILocalizedString(@"BLOB_INSTALLING_TITLE");

  id v6 = (void *)v5;
  if (v5)
  {
LABEL_11:
    id v9 = v6;
    int v7 = [(MCInstallProfileViewController *)self navigationItem];
    [v7 setTitle:v9];

    id v6 = v9;
  }
LABEL_12:
}

- (void)updateBarButtonItemsForProfileInstallationState:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 9)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__takeMeBack];
    id v9 = 0;
  }
  else if (a3 == 1)
  {
    id v6 = [(MCInstallProfileViewController *)self _newRightBarButtonItem];
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__takeMeBack];
  }
  else
  {
    id v9 = 0;
    id v6 = 0;
  }
  int v7 = [(MCInstallProfileViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6 animated:v4];

  id v8 = [(MCInstallProfileViewController *)self navigationItem];
  [v8 setLeftBarButtonItem:v9 animated:v4];
}

- (id)_newRightBarButtonItem
{
  BOOL v3 = [(MCInstallProfileViewController *)self profile];
  BOOL v4 = [MEMORY[0x1E4F74230] sharedConnection];
  char v5 = [v4 mustInstallProfileNonInteractively:v3];

  if ((v5 & 1) != 0 || [(MCInstallProfileViewController *)self installState] != 1)
  {
    id v8 = 0;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
    int v7 = MCUILocalizedString(@"INSTALL");
    id v8 = (void *)[v6 initWithTitle:v7 style:2 target:self action:sel__beginInstallFlow];
  }
  return v8;
}

- (void)_beginInstallFlow
{
  [(MCInstallProfileViewController *)self setInstallState:2 animated:1];
  BOOL v3 = [MEMORY[0x1E4F74230] sharedConnection];
  char v4 = [v3 isPasscodeSet];

  if (v4)
  {
    uint64_t v5 = [(MCInstallProfileViewController *)self delegate];
    if (v5
      && (id v6 = (void *)v5,
          [(MCInstallProfileViewController *)self delegate],
          int v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = objc_opt_respondsToSelector(),
          v7,
          v6,
          (v8 & 1) != 0))
    {
      objc_initWeak(&location, self);
      id v9 = [(MCInstallProfileViewController *)self delegate];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __51__MCInstallProfileViewController__beginInstallFlow__block_invoke;
      v10[3] = &unk_1E6EAD258;
      objc_copyWeak(&v11, &location);
      [v9 performPinAuthenticationWithCompletionHandler:v10];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      [(MCInstallProfileViewController *)self pinExtensionShowPINSheet];
    }
  }
  else
  {
    [(MCInstallProfileViewController *)self continueInstallFlowAfterPINVerification];
  }
}

void __51__MCInstallProfileViewController__beginInstallFlow__block_invoke(uint64_t a1, int a2)
{
  BOOL v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      [WeakRetained continueInstallFlowAfterPINVerification];
    }
    else if ([WeakRetained installHasFailed])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__MCInstallProfileViewController__beginInstallFlow__block_invoke_2;
      block[3] = &unk_1E6EAD1F8;
      objc_copyWeak(&v7, v3);
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v7);
    }
  }
}

void __51__MCInstallProfileViewController__beginInstallFlow__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setInstallState:1 animated:1];
    id WeakRetained = v2;
  }
}

- (void)continueInstallFlowAfterPINVerification
{
  [(MCInstallProfileViewController *)self showProgressIndicator];
  unsigned int v3 = MCUIForPairedDevice();
  char v4 = v3;
  NSLog(&cfstr_Mcinstallprofi.isa, v3);
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [(MCInstallProfileViewController *)self delegate];

    if (!v5)
    {
      id v11 = [MEMORY[0x1E4F74230] sharedConnection];
      id v10 = [(MCInstallProfileViewController *)self profileData];
      [v11 installProfileData:v10 interactionDelegate:self];
      goto LABEL_8;
    }
  }
  id v6 = [(MCInstallProfileViewController *)self profile];
  id v7 = [v6 installationWarnings];
  if ([v7 count])
  {

LABEL_6:
    id v11 = [(MCInstallProfileViewController *)self profile];
    id v10 = [v11 installationWarnings];
    [(MCInstallProfileViewController *)self profileConnection:0 didShowUserWarnings:v10];
LABEL_8:

    return;
  }
  char v8 = [(MCInstallProfileViewController *)self profile];
  id v9 = [v8 localizedConsentText];

  if (v9) {
    goto LABEL_6;
  }
  if (![(MCInstallProfileViewController *)self _attemptRemoteInstallAfterCompletingPrecheck])NSLog(&cfstr_ErrorMcinstall.isa); {
}
  }

- (void)continueInstallFlowAfterCompletingPrecheck
{
  [(MCInstallProfileViewController *)self setProcessingPayload:1];
  [(MCInstallProfileViewController *)self setQuestionsAlreadyAsked:1];
  [(MCInstallProfileViewController *)self setInstallState:2 animated:1];
  [(MCInstallProfileViewController *)self showProgressIndicator];
  if (![(MCInstallProfileViewController *)self _attemptRemoteInstallAfterCompletingPrecheck])
  {
    NSLog(&cfstr_Mcinstallprofi_0.isa);
    id v3 = [MEMORY[0x1E4F74230] sharedConnection];
    [v3 respondToWarningsContinueInstallation:1];
  }
}

- (BOOL)_attemptRemoteInstallAfterCompletingPrecheck
{
  id v3 = [(MCInstallProfileViewController *)self profile];
  char v4 = [v3 identifier];

  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__MCInstallProfileViewController__attemptRemoteInstallAfterCompletingPrecheck__block_invoke;
  v13[3] = &unk_1E6EAD280;
  objc_copyWeak(&v15, &location);
  id v5 = v4;
  id v14 = v5;
  id v6 = (void *)MEMORY[0x1E4E8BC40](v13);
  id v7 = +[MCUIWatchManager shared];

  if (v7)
  {
    NSLog(&cfstr_Mcinstallprofi_1.isa);
    char v8 = +[MCUIWatchManager shared];
    id v9 = [(MCInstallProfileViewController *)self profileData];
    [v8 installProfileData:v9 completion:v6];
  }
  else
  {
    id v10 = [(MCInstallProfileViewController *)self delegate];

    if (!v10)
    {
      BOOL v11 = 0;
      goto LABEL_6;
    }
    NSLog(&cfstr_Mcinstallprofi_2.isa);
    char v8 = [(MCInstallProfileViewController *)self delegate];
    [v8 installProfileWithCompletionHandler:v6];
  }

  BOOL v11 = 1;
LABEL_6:

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __78__MCInstallProfileViewController__attemptRemoteInstallAfterCompletingPrecheck__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _installFinishedWithIdentifier:*(void *)(a1 + 32) error:v5];
  }
}

- (void)profileConnection:(id)a3 didRequestUserInput:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MCInstallProfileViewController_profileConnection_didRequestUserInput___block_invoke;
  block[3] = &unk_1E6EAD2A8;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__MCInstallProfileViewController_profileConnection_didRequestUserInput___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained questionsExtensionDidRequestAnswersForQuestions:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)profileConnection:(id)a3 didShowUserWarnings:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MCInstallProfileViewController_profileConnection_didShowUserWarnings___block_invoke;
  block[3] = &unk_1E6EAD2A8;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__MCInstallProfileViewController_profileConnection_didShowUserWarnings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained consentExtensionShowConsentAndWarnings:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)profileConnection:(id)a3 didUpdateStatus:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MCInstallProfileViewController_profileConnection_didUpdateStatus___block_invoke;
  block[3] = &unk_1E6EAD2A8;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __68__MCInstallProfileViewController_profileConnection_didUpdateStatus___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v5 = WeakRetained;
    if (v3)
    {
      char v4 = [WeakRetained navigationItem];
      [v4 setTitle:v3];
    }
    else
    {
      [WeakRetained updateTitleForProfileInstallationState:2];
    }
    id WeakRetained = v5;
  }
}

- (void)profileConnection:(id)a3 didFinishPreflightWithError:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MCInstallProfileViewController_profileConnection_didFinishPreflightWithError___block_invoke;
  block[3] = &unk_1E6EAD2A8;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __80__MCInstallProfileViewController_profileConnection_didFinishPreflightWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained questionsExtensionDidFinishPreflightWithError:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)profileConnection:(id)a3 didFinishInstallationWithIdentifier:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__MCInstallProfileViewController_profileConnection_didFinishInstallationWithIdentifier_error___block_invoke;
  v11[3] = &unk_1E6EAD2D0;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __94__MCInstallProfileViewController_profileConnection_didFinishInstallationWithIdentifier_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _installFinishedWithIdentifier:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)profileConnection:(id)a3 didBeginInstallingNextProfile:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MCInstallProfileViewController_profileConnection_didBeginInstallingNextProfile___block_invoke;
  block[3] = &unk_1E6EAD2A8;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __82__MCInstallProfileViewController_profileConnection_didBeginInstallingNextProfile___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setSecondaryProfileReceived:1];
    [v3 setProfile:*(void *)(a1 + 32)];
    [v3 setInstallState:2 animated:1];
    id WeakRetained = v3;
  }
}

- (void)profileConnectionDidRequestCurrentPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(MCInstallProfileViewController *)self pin];
  [v4 respondToCurrentPasscodeRequestContinue:1 passcode:v5];
}

- (void)profileConnection:(id)a3 didRequestMAIDSignIn:(id)a4 personaID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F5E7B0] currentPersonaID];
  [(MCInstallProfileViewController *)self setEnrollmentPersonaID:v9];

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__MCInstallProfileViewController_profileConnection_didRequestMAIDSignIn_personaID___block_invoke;
  v12[3] = &unk_1E6EAD2D0;
  objc_copyWeak(&v15, &location);
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __83__MCInstallProfileViewController_profileConnection_didRequestMAIDSignIn_personaID___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setInstallState:5];
    [v4 hideProgressIndicatorWithShowButtons:1];
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__MCInstallProfileViewController_profileConnection_didRequestMAIDSignIn_personaID___block_invoke_2;
    v6[3] = &unk_1E6EAD320;
    objc_copyWeak(&v8, v2);
    id v7 = *(id *)(a1 + 40);
    [v4 _signInMAID:v5 completionHandler:v6];

    objc_destroyWeak(&v8);
  }
}

void __83__MCInstallProfileViewController_profileConnection_didRequestMAIDSignIn_personaID___block_invoke_2(uint64_t a1, char a2, void *a3, char a4)
{
  id v7 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__MCInstallProfileViewController_profileConnection_didRequestMAIDSignIn_personaID___block_invoke_3;
  v10[3] = &unk_1E6EAD2F8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  char v14 = a4;
  id v8 = *(id *)(a1 + 32);
  char v15 = a2;
  id v11 = v8;
  id v12 = v7;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
}

void __83__MCInstallProfileViewController_profileConnection_didRequestMAIDSignIn_personaID___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (*(unsigned char *)(a1 + 56))
    {
      [WeakRetained _cancelInstallAfterMAIDAuthenticationAnimated:1];
    }
    else
    {
      [WeakRetained showProgressIndicator];
      [*(id *)(a1 + 32) respondToMAIDAuthenticationRequest:*(unsigned __int8 *)(a1 + 57) error:*(void *)(a1 + 40) isCancelled:*(unsigned __int8 *)(a1 + 56)];
    }
    id WeakRetained = v3;
  }
}

- (void)submitQuestionAnswers:(id)a3
{
  id v4 = a3;
  [(MCInstallProfileViewController *)self setInstallState:2 animated:1];
  id v5 = [MEMORY[0x1E4F74230] sharedConnection];
  [v5 submitUserInputResponses:v4];
}

- (void)cancelInstallWhilePresentingQuestionsAnimated:(BOOL)a3
{
  [(MCInstallProfileViewController *)self setInstallState:1 animated:a3];
  id v3 = [MEMORY[0x1E4F74230] sharedConnection];
  [v3 cancelUserInputResponses];
}

- (void)_cancelInstallAfterMAIDAuthenticationAnimated:(BOOL)a3
{
  [(MCInstallProfileViewController *)self setInstallState:1 animated:a3];
  id v3 = [MEMORY[0x1E4F74230] sharedConnection];
  [v3 respondToMAIDAuthenticationRequest:0 error:0 isCancelled:1];
}

- (void)cancelInstallWhilePresentingConsentAndWarningsAnimated:(BOOL)a3
{
  [(MCInstallProfileViewController *)self setInstallState:1 animated:a3];
  id v3 = [MEMORY[0x1E4F74230] sharedConnection];
  [v3 respondToWarningsContinueInstallation:0];
}

- (void)cancelInstallWhilePresentingConsentAndWarningsUponDidAppear
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __93__MCInstallProfileViewController_cancelInstallWhilePresentingConsentAndWarningsUponDidAppear__block_invoke;
  id v8 = &unk_1E6EAD1F8;
  objc_copyWeak(&v9, &location);
  [(MCInstallProfileViewController *)self setDidAppearBlock:&v5];
  id v3 = [(MCInstallProfileViewController *)self navigationController];
  id v4 = (id)[v3 popToViewController:self animated:1];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __93__MCInstallProfileViewController_cancelInstallWhilePresentingConsentAndWarningsUponDidAppear__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__MCInstallProfileViewController_cancelInstallWhilePresentingConsentAndWarningsUponDidAppear__block_invoke_2;
  block[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __93__MCInstallProfileViewController_cancelInstallWhilePresentingConsentAndWarningsUponDidAppear__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained cancelInstallWhilePresentingConsentAndWarningsAnimated:1];
    id WeakRetained = v2;
  }
}

- (void)_installFinishedWithIdentifier:(id)a3 error:(id)a4
{
  id v12 = a4;
  [(MCInstallProfileViewController *)self questionsExtensionInstallFinished];
  if (v12)
  {
    [(MCInstallProfileViewController *)self setInstallState:1 animated:0];
    [(MCInstallProfileViewController *)self setInstallHasFailed:1];
    if ([(MCInstallProfileViewController *)self _installErrorIsUserCancelledError:v12])
    {
      [(MCInstallProfileViewController *)self setUserCancelledInstall:1];
    }
    else
    {
      [(MCInstallProfileViewController *)self _handleInstallationError:v12];
    }
    if ([(MCInstallProfileViewController *)self secondaryProfileReceived])
    {
      id v7 = [(MCInstallProfileViewController *)self originalProfileData];
      [(MCInstallProfileViewController *)self setProfileData:v7];

      [(MCInstallProfileViewController *)self setSecondaryProfileReceived:0];
    }
  }
  else
  {
    uint64_t v5 = [(MCInstallProfileViewController *)self profileViewController];
    [v5 setInstallComplete:1];

    [(MCInstallProfileViewController *)self setInstallState:9 animated:1];
    uint64_t v6 = [(MCInstallProfileViewController *)self originalProfile];
    if ([v6 needsReboot])
    {
    }
    else
    {
      id v8 = [(MCInstallProfileViewController *)self profile];
      int v9 = [v8 needsReboot];

      if (!v9) {
        goto LABEL_13;
      }
    }
    id v10 = [(MCInstallProfileViewController *)self delegate];

    if (v10)
    {
      id v11 = [(MCInstallProfileViewController *)self delegate];
      [v11 showRebootAlertAndReboot];
    }
    else
    {
      [MEMORY[0x1E4F42728] MCUIShowRebootAlertFromViewController:self];
    }
  }
LABEL_13:
}

- (BOOL)_installErrorIsUserCancelledError:(id)a3
{
  id v3 = a3;
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  uint64_t v5 = *MEMORY[0x1E4F741B8];
  uint64_t v6 = *MEMORY[0x1E4F741D0];
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  while (1)
  {
    id v8 = [v4 domain];
    int v9 = [v8 isEqualToString:v5];

    if (!v9) {
      break;
    }
    if ([v4 code] == 4004) {
      goto LABEL_11;
    }
LABEL_8:
    id v12 = [v4 userInfo];
    uint64_t v13 = [v12 objectForKey:v7];

    id v4 = (void *)v13;
    if (!v13)
    {
      BOOL v14 = 0;
      goto LABEL_12;
    }
  }
  id v10 = [v4 domain];
  int v11 = [v10 isEqualToString:v6];

  if (!v11 || [v4 code] != 24007) {
    goto LABEL_8;
  }
LABEL_11:
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (void)_handleInstallationError:(id)a3
{
  uint64_t v16 = self;
  id v17 = a3;
  id v3 = [v17 localizedDescription];
  id v4 = [v17 localizedRecoverySuggestion];
  if (v17)
  {
    uint64_t v5 = *MEMORY[0x1E4F73EC8];
    uint64_t v6 = *MEMORY[0x1E4F28A50];
    uint64_t v7 = v17;
    while (1)
    {
      id v8 = objc_msgSend(v7, "userInfo", v16);
      int v9 = [v7 localizedRecoverySuggestion];

      if (v9)
      {
        uint64_t v10 = [v7 localizedRecoverySuggestion];

        id v4 = (void *)v10;
      }
      int v11 = [v8 objectForKey:v5];
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
          if (v12) {
            break;
          }
        }
      }
      uint64_t v13 = [v8 objectForKey:v6];

      uint64_t v7 = (void *)v13;
      if (!v13) {
        goto LABEL_9;
      }
    }
    BOOL v14 = (void *)v12;
    char v15 = [MEMORY[0x1E4F42738] sharedApplication];
    [v15 openURL:v14 options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
  else
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E4F42728], "MCUIShowAlertForError:fromViewController:suggestedTitle:suggestedMessage:completion:", v17, v16, v3, v4, 0, v16);
    uint64_t v7 = 0;
  }
}

- (void)_cancelInstallDueToApplicationExit
{
  switch([(MCInstallProfileViewController *)self installState])
  {
    case 1:
    case 9:
      [(MCInstallProfileViewController *)self _takeMeBack];
      break;
    case 2:
      [(MCInstallProfileViewController *)self setInstallState:1 animated:0];
      break;
    case 3:
      [(MCInstallProfileViewController *)self cancelInstallWhilePresentingConsentAndWarningsAnimated:0];
      break;
    case 4:
      [(MCInstallProfileViewController *)self cancelInstallWhilePresentingQuestionsAnimated:0];
      break;
    case 5:
      [(MCInstallProfileViewController *)self _cancelInstallAfterMAIDAuthenticationAnimated:0];
      break;
    default:
      break;
  }
  id v4 = [(MCInstallProfileViewController *)self navigationController];
  id v3 = (id)[v4 popToViewController:self animated:1];
}

- (void)showFinalInstallationAlert:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCInstallProfileViewController *)self profile];
  BOOL v6 = [v5 trustLevel] == 2;

  uint64_t v7 = [(MCInstallProfileViewController *)self profile];
  int v8 = [v7 isLocked];

  if (v8)
  {
    int v9 = [(MCInstallProfileViewController *)self profile];
    uint64_t v10 = [v9 removalPasscode];
    if (v10) {
      int v11 = @"BLOB_INSTALL_NOT_REMOVABLE_AUTH";
    }
    else {
      int v11 = @"BLOB_INSTALL_NOT_REMOVABLE";
    }
    MCUILocalizedString(v11);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v6 = 0;
  }
  else
  {
    id v19 = 0;
  }
  unsigned int v12 = MCUIPreferAlert();
  if (MCUIPreferAlert())
  {
    uint64_t v13 = MCUILocalizedString(@"BLOB_INSTALL_TITLE");
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v12;
  if (v6) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 2;
  }
  uint64_t v16 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v13 message:v19 preferredStyle:v14];
  id v17 = MCUILocalizedString(@"INSTALL");
  [(MCInstallProfileViewController *)self addInstallActionWithTitle:v17 style:v15 toAlert:v16 completion:v4];

  [(MCInstallProfileViewController *)self addCancelActionToAlert:v16 withCompletion:v4];
  double v18 = [(MCInstallProfileViewController *)self navigationController];
  [v16 MCUIShowFromController:v18];
}

- (void)showMDMFinalInstallationAlert:(id)a3
{
  id v4 = a3;
  MCUILocalizedStringByDevice(@"MOBILE_DEVICE_MANAGEMENT_WARNING");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)MEMORY[0x1E4F42728];
  BOOL v6 = MCUILocalizedString(@"BLOB_MDM_ENROLL_TITLE");
  uint64_t v7 = [v5 alertControllerWithTitle:v6 message:v10 preferredStyle:1];

  int v8 = MCUILocalizedString(@"TRUST");
  [(MCInstallProfileViewController *)self addInstallActionWithTitle:v8 style:2 toAlert:v7 completion:v4];

  [(MCInstallProfileViewController *)self addCancelActionToAlert:v7 withCompletion:v4];
  int v9 = [(MCInstallProfileViewController *)self navigationController];
  [v7 MCUIShowFromController:v9];
}

- (void)showReEnrollFailureAlert
{
  id v3 = (void *)MEMORY[0x1E4F42728];
  id v4 = MCUILocalizedString(@"PROFILE_UPDATE_ERROR");
  uint64_t v5 = MCUILocalizedString(@"PROFILE_REENROLL_ERROR");
  id v8 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  BOOL v6 = MCUILocalizedString(@"OK");
  [v8 MCUIAddCancelActionWithTitle:v6];

  uint64_t v7 = [(MCInstallProfileViewController *)self navigationController];
  [v8 MCUIShowFromController:v7];
}

- (void)addInstallActionWithTitle:(id)a3 style:(int64_t)a4 toAlert:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__MCInstallProfileViewController_addInstallActionWithTitle_style_toAlert_completion___block_invoke;
  v14[3] = &unk_1E6EAD348;
  id v13 = v12;
  id v15 = v13;
  objc_copyWeak(&v16, &location);
  [v11 MCUIAddActionWithTitle:v10 style:a4 completion:v14];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __85__MCInstallProfileViewController_addInstallActionWithTitle_style_toAlert_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained continueInstallFlowAfterCompletingPrecheck];
    id WeakRetained = v4;
  }
}

- (void)addCancelActionToAlert:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = MCUILocalizedString(@"CANCEL");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__MCInstallProfileViewController_addCancelActionToAlert_withCompletion___block_invoke;
  v10[3] = &unk_1E6EAD348;
  id v9 = v7;
  id v11 = v9;
  objc_copyWeak(&v12, &location);
  [v6 MCUIAddActionWithTitle:v8 style:1 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __72__MCInstallProfileViewController_addCancelActionToAlert_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained cancelInstallWhilePresentingConsentAndWarningsAnimated:1];
    id WeakRetained = v4;
  }
}

- (BOOL)profileViewControllerIsProfileInstalled
{
  return 0;
}

- (void)performRemoveAfterFinalVerification
{
  id v3 = MCUILocalizedString(@"BLOB_REMOVING_TITLE");
  id v4 = [(MCInstallProfileViewController *)self navigationItem];
  [v4 setTitle:v3];

  [(MCInstallProfileViewController *)self showProgressIndicator];
  [(MCInstallProfileViewController *)self setProcessingPayload:1];
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __69__MCInstallProfileViewController_performRemoveAfterFinalVerification__block_invoke;
  id v11 = &unk_1E6EAD370;
  objc_copyWeak(&v12, &location);
  uint64_t v5 = (void *)MEMORY[0x1E4E8BC40](&v8);
  id v6 = [(MCInstallProfileViewController *)self profile];
  id v7 = [v6 identifier];
  [(MCInstallProfileViewController *)self _removeProfileWithIdentifier:v7 isProtectedProfile:0 completionHandler:v5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __69__MCInstallProfileViewController_performRemoveAfterFinalVerification__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__MCInstallProfileViewController_performRemoveAfterFinalVerification__block_invoke_2;
  v5[3] = &unk_1E6EAD2A8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __69__MCInstallProfileViewController_performRemoveAfterFinalVerification__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = WeakRetained;
    if (v3)
    {
      [MEMORY[0x1E4F42728] MCUIShowAlertForError:v3 fromViewController:WeakRetained suggestedTitle:0 suggestedMessage:0 completion:0];
      id WeakRetained = v4;
    }
    [WeakRetained hideProgressIndicatorWithShowButtons:1];
    [v4 profileRemovalDidFinish];
    id WeakRetained = v4;
  }
}

- (void)_removeProfileWithIdentifier:(id)a3 isProtectedProfile:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(MCInstallProfileViewController *)self profileViewControllerIsProfileInstalled])
  {
    id v10 = +[MCUIWatchManager shared];

    if (v10)
    {
      id v11 = +[MCUIWatchManager shared];
      [v11 removeProfileIdentifier:v8 completion:v9];
LABEL_11:

      goto LABEL_12;
    }
    id v15 = [MEMORY[0x1E4F74230] sharedConnection];
    id v11 = v15;
    if (v6)
    {
      [v15 removeProtectedProfileAsyncWithIdentifier:v8 installationType:1 completion:v9];
      goto LABEL_11;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __100__MCInstallProfileViewController__removeProfileWithIdentifier_isProtectedProfile_completionHandler___block_invoke_2;
    v16[3] = &unk_1E6EAD398;
    id v17 = v9;
    [v11 removeProfileWithIdentifier:v8 installationType:1 completion:v16];

    uint64_t v14 = v17;
  }
  else
  {
    if (MCUIForPairedDevice()) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = [MEMORY[0x1E4F74220] thisDeviceType];
    }
    id v13 = [MEMORY[0x1E4F74230] sharedConnection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __100__MCInstallProfileViewController__removeProfileWithIdentifier_isProtectedProfile_completionHandler___block_invoke;
    v18[3] = &unk_1E6EAD398;
    id v19 = v9;
    [v13 removeUninstalledProfileWithIdentifier:v8 installationType:1 targetDeviceType:v12 completion:v18];

    uint64_t v14 = v19;
  }

LABEL_12:
}

uint64_t __100__MCInstallProfileViewController__removeProfileWithIdentifier_isProtectedProfile_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__MCInstallProfileViewController__removeProfileWithIdentifier_isProtectedProfile_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)profileRemovalDidFinish
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(MCInstallProfileViewController *)self navigationController];
  id v4 = [v3 popViewControllerAnimated:1];

  if (!v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__MCInstallProfileViewController_profileRemovalDidFinish__block_invoke;
    v5[3] = &unk_1E6EAD258;
    objc_copyWeak(&v6, &location);
    [(UIViewController *)self MCUIReturnToSender:1 returnToAccountSettings:0 viewControllerDismissalBlock:v5];
    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);
}

void __57__MCInstallProfileViewController_profileRemovalDidFinish__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v4 = [WeakRetained navigationController];
    uint64_t v5 = [v4 presentingViewController];
    [v5 dismissViewControllerAnimated:a2 completion:0];

    id WeakRetained = v6;
  }
}

- (void)_signInMAID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = objc_alloc_init(MCUISignInViewController);
  [(MCUISignInViewController *)v10 setDelegate:self];
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F100]);
  [v8 setIsEphemeral:0];
  [v8 setAuthenticationType:2];
  [v8 setPresentingViewController:v10];
  [v8 setUsername:v7];

  [v8 setIsUsernameEditable:0];
  [(MCUISignInViewController *)v10 setContext:v8];
  [(MCInstallProfileViewController *)self setSignInCompletionHandler:v6];

  id v9 = [(MCInstallProfileViewController *)self navigationController];
  [v9 presentViewController:v10 animated:1 completion:0];
}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MCInstallProfileViewController *)self signInCompletionHandler];

  if (v11)
  {
    if (v10)
    {
      uint64_t v12 = [(MCInstallProfileViewController *)self signInCompletionHandler];
      ((void (**)(void, void, id, void))v12)[2](v12, 0, v10, 0);
    }
    else
    {
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__MCInstallProfileViewController_signInViewController_didAuthenticateWithResults_error___block_invoke;
      block[3] = &unk_1E6EAD1F8;
      objc_copyWeak(&v20, &location);
      dispatch_async(MEMORY[0x1E4F14428], block);
      id v13 = objc_opt_new();
      uint64_t v14 = *MEMORY[0x1E4F17890];
      v22[0] = *MEMORY[0x1E4F17750];
      v22[1] = v14;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
      id v16 = [(MCInstallProfileViewController *)self enrollmentPersonaID];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __88__MCInstallProfileViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_2;
      v17[3] = &unk_1E6EAD3C0;
      objc_copyWeak(&v18, &location);
      [v13 signInAccountsWithTypes:v15 authenticationResult:v9 personaID:v16 canMakeAccountActive:0 baseViewController:self completionHandler:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
}

void __88__MCInstallProfileViewController_signInViewController_didAuthenticateWithResults_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained showProgressIndicator];
    id WeakRetained = v2;
  }
}

void __88__MCInstallProfileViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_2(id *a1, int a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__MCInstallProfileViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_3;
  block[3] = &unk_1E6EAD1F8;
  a1 += 4;
  objc_copyWeak(&v10, a1);
  dispatch_async(MEMORY[0x1E4F14428], block);
  id WeakRetained = objc_loadWeakRetained(a1);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained signInCompletionHandler];
    if (a2)
    {
      id v8 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      v8[2](v8, 1, 0, 0);
    }
    else
    {
      id v8 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void, id, void))v8)[2](v8, 0, v5, 0);
    }
  }
  objc_destroyWeak(&v10);
}

void __88__MCInstallProfileViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained MCUIHideProgressInNavBarShowBackButton:0];
    id WeakRetained = v2;
  }
}

- (MCInstallProfileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MCInstallProfileDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MCProfile)originalProfile
{
  return self->_originalProfile;
}

- (void)setOriginalProfile:(id)a3
{
}

- (NSData)profileData
{
  return self->_profileData;
}

- (NSData)originalProfileData
{
  return self->_originalProfileData;
}

- (void)setOriginalProfileData:(id)a3
{
}

- (BOOL)processingPayload
{
  return self->_processingPayload;
}

- (void)setProcessingPayload:(BOOL)a3
{
  self->_processingPayload = a3;
}

- (BOOL)userCancelledInstall
{
  return self->_userCancelledInstall;
}

- (void)setUserCancelledInstall:(BOOL)a3
{
  self->_userCancelledInstall = a3;
}

- (BOOL)secondaryProfileReceived
{
  return self->_secondaryProfileReceived;
}

- (void)setSecondaryProfileReceived:(BOOL)a3
{
  self->_secondaryProfileReceived = a3;
}

- (id)signInCompletionHandler
{
  return self->_signInCompletionHandler;
}

- (void)setSignInCompletionHandler:(id)a3
{
}

- (NSString)enrollmentPersonaID
{
  return self->_enrollmentPersonaID;
}

- (void)setEnrollmentPersonaID:(id)a3
{
}

- (MCProfile)profile
{
  return self->_profile;
}

- (DMCProfileViewController)profileViewController
{
  return self->_profileViewController;
}

- (void)setProfileViewController:(id)a3
{
}

- (MCInstallProfileQuestionViewController)questionsController
{
  return self->_questionsController;
}

- (void)setQuestionsController:(id)a3
{
}

- (int)installState
{
  return self->_installState;
}

- (BOOL)installHasFailed
{
  return self->_installHasFailed;
}

- (void)setInstallHasFailed:(BOOL)a3
{
  self->_installHasFailed = a3;
}

- (BOOL)questionsAlreadyAsked
{
  return self->_questionsAlreadyAsked;
}

- (void)setQuestionsAlreadyAsked:(BOOL)a3
{
  self->_questionsAlreadyAsked = a3;
}

- (BOOL)waitingForNextQuestion
{
  return self->_waitingForNextQuestion;
}

- (void)setWaitingForNextQuestion:(BOOL)a3
{
  self->_waitingForNextQuestion = a3;
}

- (BOOL)delayNextQuesion
{
  return self->_delayNextQuesion;
}

- (void)setDelayNextQuesion:(BOOL)a3
{
  self->_delayNextQuesion = a3;
}

- (NSString)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
}

- (NSArray)warnings
{
  return self->_warnings;
}

- (void)setWarnings:(id)a3
{
}

- (id)didAppearBlock
{
  return self->_didAppearBlock;
}

- (void)setDidAppearBlock:(id)a3
{
}

- (BOOL)isDeallocating
{
  return self->_isDeallocating;
}

- (void)setIsDeallocating:(BOOL)a3
{
  self->_isDeallocating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didAppearBlock, 0);
  objc_storeStrong((id *)&self->_warnings, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_questionsController, 0);
  objc_storeStrong((id *)&self->_profileViewController, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_enrollmentPersonaID, 0);
  objc_storeStrong(&self->_signInCompletionHandler, 0);
  objc_storeStrong((id *)&self->_originalProfileData, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_originalProfile, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)consentExtensionShowConsentAndWarnings:(id)a3
{
  id v6 = a3;
  [(MCInstallProfileViewController *)self hideProgressIndicatorWithShowButtons:0];
  [(MCInstallProfileViewController *)self setInstallState:3 animated:1];
  id v4 = [(MCInstallProfileViewController *)self profile];
  id v5 = [v4 localizedConsentText];

  if (v5) {
    [(MCInstallProfileViewController *)self _presentConsent:v6];
  }
  else {
    [(MCInstallProfileViewController *)self _didFinishPresentingConsent:v6];
  }
}

- (void)installationConsentViewController:(id)a3 finishedWithUserContinueResponse:(BOOL)a4
{
  BOOL v4 = a4;
  NSLog(&cfstr_Mcinstallprofi_3.isa, a2, a3, a4);
  if (v4)
  {
    id v6 = [(MCInstallProfileViewController *)self warnings];
    [(MCInstallProfileViewController *)self _didFinishPresentingConsent:v6];

    [(MCInstallProfileViewController *)self setWarnings:0];
  }
  else
  {
    [(MCInstallProfileViewController *)self cancelInstallWhilePresentingConsentAndWarningsUponDidAppear];
  }
}

- (void)_presentConsent:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_Mcinstallprofi_4.isa);
  [(MCInstallProfileViewController *)self setWarnings:v4];
  id v8 = [[MCInstallationConsentViewController alloc] initWithStyle:2];
  id v5 = [(MCInstallProfileViewController *)self profile];
  [(MCInstallationConsentViewController *)v8 setProfile:v5];

  [(MCInstallationConsentViewController *)v8 setConsentDelegate:self];
  uint64_t v6 = [v4 count];

  [(MCInstallationConsentViewController *)v8 setShowInstall:v6 == 0];
  id v7 = [(MCInstallProfileViewController *)self navigationController];
  [v7 pushViewController:v8 animated:1];
}

- (void)_didFinishPresentingConsent:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    NSLog(&cfstr_Mcinstallprofi_5.isa, v4);
    [(MCInstallProfileViewController *)self warningsExtensionPushWarningsControllerWithWarnings:v4];
  }
  else if ([(MCInstallProfileViewController *)self questionsAlreadyAsked])
  {
    NSLog(&cfstr_Mcinstallprofi_6.isa);
    [(MCInstallProfileViewController *)self continueInstallFlowAfterCompletingPrecheck];
  }
  else
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__MCInstallProfileViewController_Consent___didFinishPresentingConsent___block_invoke;
    v5[3] = &unk_1E6EAD1F8;
    objc_copyWeak(&v6, &location);
    [(MCInstallProfileViewController *)self showFinalInstallationAlert:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __71__MCInstallProfileViewController_Consent___didFinishPresentingConsent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    NSLog(&cfstr_Mcinstallprofi_7.isa);
    v1 = [WeakRetained navigationController];
    id v2 = (id)[v1 popToViewController:WeakRetained animated:1];
  }
}

- (void)pinExtensionShowPINSheet
{
  id v6 = (id)objc_opt_new();
  [v6 setDelegate:self];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v6];
  [v3 setModalPresentationStyle:2];
  if (MCUIIsiPad()) {
    [v3 setModalTransitionStyle:2];
  }
  if (MCUIForPairedDevice())
  {
    id v4 = [v3 navigationBar];
    BPSApplyStyleToNavBar();
  }
  id v5 = [(MCInstallProfileViewController *)self navigationController];
  [v5 presentViewController:v3 animated:1 completion:0];
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__MCInstallProfileViewController_PIN__didAcceptEnteredPIN___block_invoke;
  v6[3] = &unk_1E6EAD2A8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(MCInstallProfileViewController *)self _didFinishEnteringPINWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__MCInstallProfileViewController_PIN__didAcceptEnteredPIN___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setPin:*(void *)(a1 + 32)];
    [v3 continueInstallFlowAfterPINVerification];
    id WeakRetained = v3;
  }
}

- (void)didCancelEnteringPIN
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__MCInstallProfileViewController_PIN__didCancelEnteringPIN__block_invoke;
  v3[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v4, &location);
  [(MCInstallProfileViewController *)self _didFinishEnteringPINWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __59__MCInstallProfileViewController_PIN__didCancelEnteringPIN__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setInstallState:1 animated:1];
    id WeakRetained = v2;
  }
}

- (void)_didFinishEnteringPINWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__MCInstallProfileViewController_PIN___didFinishEnteringPINWithCompletion___block_invoke;
  v8[3] = &unk_1E6EAD3E8;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = (void *)MEMORY[0x1E4E8BC40](v8);
  id v7 = [(MCInstallProfileViewController *)self navigationController];
  [v7 dismissViewControllerAnimated:1 completion:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __75__MCInstallProfileViewController_PIN___didFinishEnteringPINWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained installHasFailed] & 1) == 0 && *(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__MCInstallProfileViewController_PIN___didFinishEnteringPINWithCompletion___block_invoke_2;
    block[3] = &unk_1E6EAD398;
    id v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __75__MCInstallProfileViewController_PIN___didFinishEnteringPINWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)questionsExtensionDidRequestAnswersForQuestions:(id)a3
{
  id v4 = a3;
  [(MCInstallProfileViewController *)self setInstallState:4 animated:1];
  if ([(MCInstallProfileViewController *)self delayNextQuesion]) {
    [(MCInstallProfileViewController *)self _promptUserWithQuestionsAfterDelay:v4];
  }
  else {
    [(MCInstallProfileViewController *)self _promptUserWithQuestions:v4];
  }
}

- (void)questionsExtensionDidFinishPreflightWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(MCInstallProfileViewController *)self questionsController];
  [v5 profileConnectionDidFinishPreflightWithError:v4];
}

- (void)questionsExtensionInstallFinished
{
  if ([(MCInstallProfileViewController *)self waitingForNextQuestion])
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__finishWaitingForMoreQuestions object:0];
    [(MCInstallProfileViewController *)self _finishWaitingForMoreQuestions];
  }
  [(MCInstallProfileViewController *)self hideProgressIndicatorWithShowButtons:1];
  id v3 = [(MCInstallProfileViewController *)self navigationController];
  id v4 = (id)[v3 popToViewController:self animated:1];

  [(MCInstallProfileViewController *)self setQuestionsController:0];
}

- (void)setCurrentQuestionsController:(id)a3
{
  id v6 = a3;
  id v4 = [(MCInstallProfileViewController *)self questionsController];

  id v5 = v6;
  if (v4 != v6)
  {
    [(MCInstallProfileViewController *)self setQuestionsController:v6];
    id v5 = v6;
  }
}

- (void)questionsController:(id)a3 didFinishWithResponses:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    [(MCInstallProfileViewController *)self submitQuestionAnswers:v5];
    [(MCInstallProfileViewController *)self _waitForNextQuestion];
  }
  else
  {
    [(MCInstallProfileViewController *)self cancelInstallWhilePresentingQuestionsAnimated:1];
  }
}

- (void)_promptUserWithQuestions:(id)a3
{
  id v4 = a3;
  if ([(MCInstallProfileViewController *)self waitingForNextQuestion])
  {
    [(MCInstallProfileViewController *)self setWaitingForNextQuestion:0];
    id v5 = [(MCInstallProfileViewController *)self questionsController];
    [v5 stopWaitingForMoreInput];
  }
  [(MCInstallProfileViewController *)self hideProgressIndicatorWithShowButtons:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F5E660]) initWithUserInput:v4];

  [(MCInstallProfileViewController *)self setQuestionsController:v6];
  id v7 = [(MCInstallProfileViewController *)self questionsController];
  [v7 setQuestionsDelegate:self];

  id v9 = [(MCInstallProfileViewController *)self navigationController];
  id v8 = [(MCInstallProfileViewController *)self questionsController];
  [v9 pushViewController:v8 animated:1];
}

- (void)_promptUserWithQuestionsAfterDelay:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__MCInstallProfileViewController_Questions___promptUserWithQuestionsAfterDelay___block_invoke;
  v6[3] = &unk_1E6EAD2A8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(MCInstallProfileViewController *)self setDidAppearBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __80__MCInstallProfileViewController_Questions___promptUserWithQuestionsAfterDelay___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDelayNextQuesion:0];

  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__MCInstallProfileViewController_Questions___promptUserWithQuestionsAfterDelay___block_invoke_2;
  v5[3] = &unk_1E6EAD2A8;
  objc_copyWeak(&v7, v2);
  id v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __80__MCInstallProfileViewController_Questions___promptUserWithQuestionsAfterDelay___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _promptUserWithQuestions:*(void *)(a1 + 32)];
}

- (void)_waitForNextQuestion
{
  [(MCInstallProfileViewController *)self setWaitingForNextQuestion:1];
  id v3 = [(MCInstallProfileViewController *)self questionsController];
  [v3 waitForMoreInput];

  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MCInstallProfileViewController_Questions___waitForNextQuestion__block_invoke;
  block[3] = &unk_1E6EAD1D0;
  void block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

uint64_t __65__MCInstallProfileViewController_Questions___waitForNextQuestion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWaitingForMoreQuestions];
}

- (void)_finishWaitingForMoreQuestions
{
  if ([(MCInstallProfileViewController *)self waitingForNextQuestion])
  {
    [(MCInstallProfileViewController *)self setWaitingForNextQuestion:0];
    id v3 = [(MCInstallProfileViewController *)self questionsController];
    [v3 stopWaitingForMoreInput];

    [(MCInstallProfileViewController *)self showProgressIndicator];
    [(MCInstallProfileViewController *)self setDelayNextQuesion:1];
    id v5 = [(MCInstallProfileViewController *)self navigationController];
    id v4 = (id)[v5 popToViewController:self animated:1];
  }
}

- (void)warningsExtensionPushWarningsControllerWithWarnings:(id)a3
{
  id v4 = a3;
  id v5 = [(MCInstallProfileViewController *)self profile];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(MCInstallProfileViewController *)self profile];
    uint64_t v7 = [v6 isMDMProfile];
  }
  else
  {
    uint64_t v7 = 0;
  }

  id v9 = [[MCInstallationWarningViewController alloc] initWithStyle:2];
  [(MCInstallationWarningViewController *)v9 setIsMDMInstall:v7];
  [(MCInstallationWarningViewController *)v9 setWarnings:v4];

  [(MCInstallationWarningViewController *)v9 setWarningDelegate:self];
  id v8 = [(MCInstallProfileViewController *)self navigationController];
  [v8 pushViewController:v9 animated:1];
}

- (void)installationWarningViewController:(id)a3 finishedWithUserContinueResponse:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    [(MCInstallProfileViewController *)self cancelInstallWhilePresentingConsentAndWarningsUponDidAppear];
    goto LABEL_17;
  }
  uint64_t v7 = [(MCInstallProfileViewController *)self profileViewController];
  id v8 = [v7 UIProfile];
  uint64_t v9 = [v8 finalInstallationWarningStyle];

  if (v9 == 1) {
    goto LABEL_10;
  }
  if (v9 == 3)
  {
    uint64_t v9 = 1;
    goto LABEL_8;
  }
  if (v9 != 2)
  {
    uint64_t v9 = 0;
LABEL_10:
    BOOL v12 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = 0;
LABEL_8:
  uint64_t v20 = 0;
  id location = 0;
  uint64_t v19 = 0;
  id v10 = (void *)MEMORY[0x1E4F8A950];
  id v11 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
  [v10 countOfAssetsWithRequiredResourcesNotLocallyAvailableInLibrary:v11 outCount:&location photoCount:&v20 videoCount:&v19];

  BOOL v12 = location != 0;
LABEL_11:
  objc_initWeak(&location, self);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __111__MCInstallProfileViewController_Warnings__installationWarningViewController_finishedWithUserContinueResponse___block_invoke;
  id v17 = &unk_1E6EAD1F8;
  objc_copyWeak(&v18, &location);
  id v13 = (void *)MEMORY[0x1E4E8BC40](&v14);
  if (v12)
  {
    -[MCInstallProfileViewController _showCPLFinalInstallationWarning:withMDMWarning:](self, "_showCPLFinalInstallationWarning:withMDMWarning:", v13, v9, v14, v15, v16, v17);
  }
  else if (v9)
  {
    -[MCInstallProfileViewController showMDMFinalInstallationAlert:](self, "showMDMFinalInstallationAlert:", v13, v14, v15, v16, v17);
  }
  else
  {
    -[MCInstallProfileViewController showFinalInstallationAlert:](self, "showFinalInstallationAlert:", v13, v14, v15, v16, v17);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
LABEL_17:
}

void __111__MCInstallProfileViewController_Warnings__installationWarningViewController_finishedWithUserContinueResponse___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained navigationController];
    id v3 = (id)[v2 popToViewController:v4 animated:1];

    id WeakRetained = v4;
  }
}

- (void)_showCPLFinalInstallationWarning:(id)a3 withMDMWarning:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = MCUIPreferAlert();
  if (MCUIPreferAlert())
  {
    id v8 = MCUILocalizedString(@"BLOB_INSTALL_TITLE");
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [(MCInstallProfileViewController *)self _localizedCPLFinalWarningString];
  id v10 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v8 message:v9 preferredStyle:v7];
  if (v4)
  {
    objc_initWeak(&location, self);
    id v11 = MCUILocalizedString(@"INSTALL");
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __92__MCInstallProfileViewController_Warnings___showCPLFinalInstallationWarning_withMDMWarning___block_invoke;
    v14[3] = &unk_1E6EAD3E8;
    objc_copyWeak(&v16, &location);
    id v15 = v6;
    [v10 MCUIAddActionWithTitle:v11 style:2 completion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v12 = MCUILocalizedString(@"INSTALL");
    [(MCInstallProfileViewController *)self addInstallActionWithTitle:v12 style:2 toAlert:v10 completion:v6];
  }
  [(MCInstallProfileViewController *)self addCancelActionToAlert:v10 withCompletion:v6];
  id v13 = [(MCInstallProfileViewController *)self navigationController];
  [v10 MCUIShowFromController:v13];
}

void __92__MCInstallProfileViewController_Warnings___showCPLFinalInstallationWarning_withMDMWarning___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained showMDMFinalInstallationAlert:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (id)_localizedCPLFinalWarningString
{
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v9 = 0;
  id v2 = (void *)MEMORY[0x1E4F8A950];
  id v3 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
  [v2 countOfAssetsWithRequiredResourcesNotLocallyAvailableInLibrary:v3 outCount:&v11 photoCount:&v10 videoCount:&v9];

  if (v11 >= 2)
  {
    BOOL v4 = NSString;
    id v5 = MCUILocalizedStringByDevice(@"CLOUD_PHOTO_LIBRARY_RESTRICTION_PHOTOS_VIDEOS_WARNING_%d");
    id v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v11);

    goto LABEL_9;
  }
  if (v10 == 1)
  {
    uint64_t v7 = @"CLOUD_PHOTO_LIBRARY_RESTRICTION_PHOTO_SINGULAR_WARNING";
LABEL_7:
    id v6 = MCUILocalizedStringByDevice(v7);
    goto LABEL_9;
  }
  if (v9 == 1)
  {
    uint64_t v7 = @"CLOUD_PHOTO_LIBRARY_RESTRICTION_VIDEO_SINGULAR_WARNING";
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_9:
  return v6;
}

@end