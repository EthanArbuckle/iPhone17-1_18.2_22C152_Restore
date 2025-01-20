@interface MCProfileTitlePageViewModel
- (BOOL)_installErrorIsUserCancelledError:(id)a3;
- (BOOL)isInstallingProfile;
- (DMCProfileViewModel)profileViewModel;
- (MCProfile)profile;
- (MCProfileTitlePageViewModel)init;
- (MCProfileTitlePageViewModel)initWithProfile:(id)a3 profileData:(id)a4;
- (MCProfileTitlePageViewModelDelegate)delegate;
- (NSData)profileData;
- (NSString)accountIdentifier;
- (NSString)managedAppleID;
- (NSString)personaID;
- (NSString)pin;
- (OS_dispatch_queue)serialQueue;
- (id)_createAuthenticationContext:(id)a3 presentingViewController:(id)a4;
- (id)cleanupTask;
- (id)postRestoreTask;
- (int)installState;
- (void)_continueInstallAfterPresentingWarnings;
- (void)_handleMAIDSignInRequestWithAccountID:(id)a3 personaID:(id)a4 connection:(id)a5;
- (void)_handleUserInputRequest:(id)a3;
- (void)_installFinishedWithIdentifier:(id)a3 error:(id)a4;
- (void)_respondToMAIDAuthenticationRequestIfNeeded:(id)a3 successful:(BOOL)a4 error:(id)a5 isCancelled:(BOOL)a6;
- (void)_respondToUserInputRequest:(id)a3 cancelled:(BOOL)a4;
- (void)_setup;
- (void)_signInMAID:(id)a3 authenticationResult:(id)a4 personaID:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)doesUserWantToRestoreSnapshot:(id)a3 withConflictingApps:(id)a4 completion:(id)a5;
- (void)profileConnection:(id)a3 didFinishInstallationWithIdentifier:(id)a4 error:(id)a5;
- (void)profileConnection:(id)a3 didFinishPreflightWithError:(id)a4;
- (void)profileConnection:(id)a3 didRequestMAIDSignIn:(id)a4 personaID:(id)a5;
- (void)profileConnection:(id)a3 didRequestManagedRestoreWithManagedAppleID:(id)a4 personaID:(id)a5;
- (void)profileConnection:(id)a3 didRequestUserInput:(id)a4;
- (void)profileConnectionDidRequestCurrentPasscode:(id)a3;
- (void)setCleanupTask:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInstallState:(int)a3;
- (void)setIsInstallingProfile:(BOOL)a3;
- (void)setManagedAppleID:(id)a3;
- (void)setPersonaID:(id)a3;
- (void)setPin:(id)a3;
- (void)setPostRestoreTask:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProfileData:(id)a3;
- (void)setProfileViewModel:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)startProfileInstallationFlow;
- (void)terminateProfileInstallationFlow;
- (void)terminateProfileInstallationFlowAndDeleteProfile;
@end

@implementation MCProfileTitlePageViewModel

- (MCProfileTitlePageViewModel)initWithProfile:(id)a3 profileData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(MCProfileTitlePageViewModel *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    objc_storeStrong((id *)&v10->_profileData, a4);
  }

  return v10;
}

- (MCProfileTitlePageViewModel)init
{
  v5.receiver = self;
  v5.super_class = (Class)MCProfileTitlePageViewModel;
  v2 = [(MCProfileTitlePageViewModel *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MCProfileTitlePageViewModel *)v2 _setup];
  }
  return v3;
}

- (void)_setup
{
  v3 = (OS_dispatch_queue *)dispatch_queue_create("MCUI_profile_installation_queue", 0);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v3;

  self->_installState = 1;
}

- (void)dealloc
{
  [(MCProfileTitlePageViewModel *)self terminateProfileInstallationFlow];
  v3.receiver = self;
  v3.super_class = (Class)MCProfileTitlePageViewModel;
  [(MCProfileTitlePageViewModel *)&v3 dealloc];
}

- (DMCProfileViewModel)profileViewModel
{
  profileViewModel = self->_profileViewModel;
  if (!profileViewModel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5E688]);
    objc_super v5 = [(MCProfileTitlePageViewModel *)self profile];
    v6 = (DMCProfileViewModel *)[v4 initWithProfile:v5 managedPayloads:0];
    id v7 = self->_profileViewModel;
    self->_profileViewModel = v6;

    profileViewModel = self->_profileViewModel;
  }
  return profileViewModel;
}

- (NSString)accountIdentifier
{
  v2 = (void *)MEMORY[0x1E4F5E750];
  objc_super v3 = [(MCProfileTitlePageViewModel *)self personaID];
  id v4 = [v2 accountIdentifierForAppleAccountWithPersonaID:v3];

  return (NSString *)v4;
}

- (void)setInstallState:(int)a3
{
  if (self->_installState != a3)
  {
    self->_int installState = a3;
    NSLog(&cfstr_SetStateD.isa, a2, a3);
    int installState = self->_installState;
    if ((installState - 4) < 6) {
      goto LABEL_3;
    }
    if (installState == 2)
    {
      objc_super v5 = v7;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v6 = __47__MCProfileTitlePageViewModel_setInstallState___block_invoke_2;
      goto LABEL_4;
    }
    if (installState == 1)
    {
LABEL_3:
      objc_super v5 = block;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      v6 = __47__MCProfileTitlePageViewModel_setInstallState___block_invoke;
LABEL_4:
      v5[2] = v6;
      v5[3] = &unk_1E6EAD1D0;
      v5[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], v5);
    }
  }
}

void __47__MCProfileTitlePageViewModel_setInstallState___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 setUserInteractionEnabled:1];
}

void __47__MCProfileTitlePageViewModel_setInstallState___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 setUserInteractionEnabled:0];
}

- (void)startProfileInstallationFlow
{
  objc_super v3 = [(MCProfileTitlePageViewModel *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke;
  block[3] = &unk_1E6EAD1D0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 isPasscodeSet];

  if (v3)
  {
    NSLog(&cfstr_Mcprofiletitle_1.isa);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke_2;
    block[3] = &unk_1E6EAD1D0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else if ([*(id *)(a1 + 32) isInstallingProfile])
  {
    NSLog(&cfstr_Mcprofiletitle_2.isa);
  }
  else
  {
    [*(id *)(a1 + 32) setIsInstallingProfile:1];
    NSLog(&cfstr_Mcprofiletitle_3.isa);
    [*(id *)(a1 + 32) setInstallState:2];
    id v5 = [MEMORY[0x1E4F74230] sharedConnection];
    id v4 = [*(id *)(a1 + 32) profileData];
    [v5 installProfileData:v4 interactionDelegate:*(void *)(a1 + 32)];
  }
}

void __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke_3;
  v3[3] = &unk_1E6EAD4F8;
  v3[4] = *(void *)(a1 + 32);
  [v2 promptForPasscodeWithCompletionHandler:v3];
}

void __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke_4;
  block[3] = &unk_1E6EAD4D0;
  char v10 = a2;
  block[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) setPin:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setIsInstallingProfile:1];
    [*(id *)(a1 + 32) setInstallState:2];
    id v4 = [MEMORY[0x1E4F74230] sharedConnection];
    v2 = [*(id *)(a1 + 32) profileData];
    [v4 installProfileData:v2 interactionDelegate:*(void *)(a1 + 32)];
  }
  else
  {
    int v3 = *(void **)(a1 + 32);
    [v3 setIsInstallingProfile:0];
  }
}

- (void)_continueInstallAfterPresentingWarnings
{
  v2 = [(MCProfileTitlePageViewModel *)self serialQueue];
  dispatch_async(v2, &__block_literal_global_0);
}

void __70__MCProfileTitlePageViewModel__continueInstallAfterPresentingWarnings__block_invoke()
{
  id v0 = [MEMORY[0x1E4F74230] sharedConnection];
  [v0 respondToWarningsContinueInstallation:1];
}

- (void)_installFinishedWithIdentifier:(id)a3 error:(id)a4
{
  id v5 = a4;
  v6 = [(MCProfileTitlePageViewModel *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke;
  v8[3] = &unk_1E6EAD458;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsInstallingProfile:0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke_2;
  v3[3] = &unk_1E6EAD458;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _installErrorIsUserCancelledError:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 32) setInstallState:1];
    v2 = [*(id *)(a1 + 32) delegate];
    id v8 = v2;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      [v7 setInstallState:1];
      v2 = [*(id *)(a1 + 32) delegate];
      id v8 = v2;
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v3 = 0;
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      goto LABEL_6;
    }
    if ([v7 installState] == 7)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke_3;
      v9[3] = &unk_1E6EAD1F8;
      objc_copyWeak(&v10, &location);
      [*(id *)(a1 + 32) setPostRestoreTask:v9];
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
      return;
    }
    [*(id *)(a1 + 32) setInstallState:9];
    v2 = [*(id *)(a1 + 32) delegate];
    id v8 = v2;
    uint64_t v3 = 1;
    uint64_t v4 = 1;
    uint64_t v5 = 1;
  }
  uint64_t v6 = 0;
LABEL_6:
  [v2 installationFinishedSuccessfully:v3 shouldDismiss:v4 shouldRedirect:v5 errorToDisplay:v6];
}

void __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke_3(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke_4;
  v1[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v2, &to);
  dispatch_async(MEMORY[0x1E4F14428], v1);
  objc_destroyWeak(&v2);
  objc_destroyWeak(&to);
}

void __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke_4(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setInstallState:9];

  id v4 = objc_loadWeakRetained(v1);
  uint64_t v3 = [v4 delegate];
  [v3 installationFinishedSuccessfully:1 shouldDismiss:1 shouldRedirect:1 errorToDisplay:0];
}

- (void)terminateProfileInstallationFlow
{
  NSLog(&cfstr_Terminateprofi.isa, a2);
  uint64_t v3 = [(MCProfileTitlePageViewModel *)self cleanupTask];

  if (v3)
  {
    id v4 = [(MCProfileTitlePageViewModel *)self cleanupTask];
    v4[2]();

    [(MCProfileTitlePageViewModel *)self setCleanupTask:0];
  }
}

- (void)terminateProfileInstallationFlowAndDeleteProfile
{
  [(MCProfileTitlePageViewModel *)self terminateProfileInstallationFlow];
  NSLog(&cfstr_WillDeleteProf.isa);
  uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
  id v4 = [(MCProfileTitlePageViewModel *)self profile];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [MEMORY[0x1E4F74220] thisDeviceType];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__MCProfileTitlePageViewModel_terminateProfileInstallationFlowAndDeleteProfile__block_invoke;
  v7[3] = &unk_1E6EAD1D0;
  v7[4] = self;
  [v3 removeUninstalledProfileWithIdentifier:v5 installationType:1 targetDeviceType:v6 completion:v7];
}

void __79__MCProfileTitlePageViewModel_terminateProfileInstallationFlowAndDeleteProfile__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MCProfileTitlePageViewModel_terminateProfileInstallationFlowAndDeleteProfile__block_invoke_2;
  block[3] = &unk_1E6EAD1D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__MCProfileTitlePageViewModel_terminateProfileInstallationFlowAndDeleteProfile__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 installationFinishedSuccessfully:0 shouldDismiss:1 shouldRedirect:0 errorToDisplay:0];
  }
}

- (void)_handleUserInputRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCProfileTitlePageViewModel *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke;
  v7[3] = &unk_1E6EAD458;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInstallState:4];
  [*(id *)(a1 + 32) setCleanupTask:&__block_literal_global_54];
  NSLog(&cfstr_Mcprofiletitle_4.isa);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke_3;
  v3[3] = &unk_1E6EAD458;
  id v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F74230] sharedConnection];
  [v0 cancelUserInputResponses];
}

void __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke_4;
  v4[3] = &unk_1E6EAD520;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [v2 promptForUserInput:v3 completionHandler:v4];
}

uint64_t __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _respondToUserInputRequest:a2 cancelled:a3];
}

- (void)_respondToUserInputRequest:(id)a3 cancelled:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(MCProfileTitlePageViewModel *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MCProfileTitlePageViewModel__respondToUserInputRequest_cancelled___block_invoke;
  block[3] = &unk_1E6EAD4D0;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __68__MCProfileTitlePageViewModel__respondToUserInputRequest_cancelled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCleanupTask:0];
  if (*(unsigned char *)(a1 + 48) || ![*(id *)(a1 + 40) count])
  {
    [*(id *)(a1 + 32) setInstallState:1];
    id v2 = [MEMORY[0x1E4F74230] sharedConnection];
    [v2 cancelUserInputResponses];
  }
  else
  {
    [*(id *)(a1 + 32) setInstallState:2];
    id v2 = [MEMORY[0x1E4F74230] sharedConnection];
    [v2 submitUserInputResponses:*(void *)(a1 + 40)];
  }
}

- (void)_handleMAIDSignInRequestWithAccountID:(id)a3 personaID:(id)a4 connection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(MCProfileTitlePageViewModel *)self serialQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke;
  v15[3] = &unk_1E6EAD480;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke(id *a1)
{
  [a1[4] setPersonaID:a1[5]];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_2;
  v6[3] = &unk_1E6EAD1D0;
  id v7 = a1[6];
  [a1[4] setCleanupTask:v6];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_3;
  block[3] = &unk_1E6EAD480;
  block[4] = a1[4];
  id v3 = a1[7];
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondToMAIDAuthenticationRequest:0 error:0 isCancelled:1];
}

void __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_3(id *a1)
{
  [a1[4] setInstallState:5];
  id v2 = a1[4];
  id v3 = a1[5];
  id v4 = [v2 delegate];
  id v5 = [v2 _createAuthenticationContext:v3 presentingViewController:v4];

  NSLog(&cfstr_Mcprofiletitle_5.isa, a1[5]);
  id v6 = [a1[4] delegate];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_4;
  v13[3] = &unk_1E6EAD548;
  id v7 = a1[6];
  id v8 = a1[4];
  id v14 = v7;
  id v15 = v8;
  id v16 = a1[7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_5;
  v9[3] = &unk_1E6EAD598;
  void v9[4] = a1[4];
  id v10 = a1[7];
  id v11 = a1[5];
  id v12 = a1[6];
  [v6 presentAuthenticationViewControllerWithContext:v5 authenticationPreparationHandler:v13 authenticationCompletionHandler:v9];
}

void __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v3 = [MEMORY[0x1E4F5E7B0] performBlockUnderPersona:*(void *)(a1 + 32) block:v5];
    id v4 = (void *)v3;
    if (v3)
    {
      NSLog(&cfstr_FailedToAdoptP.isa, v3);
      v5[2]();
      [*(id *)(a1 + 40) _respondToMAIDAuthenticationRequestIfNeeded:*(void *)(a1 + 48) successful:0 error:v4 isCancelled:0];
    }
  }
  else
  {
    v5[2]();
  }
}

void __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_5(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  if (a4)
  {
    id v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    id v12 = 0;
    uint64_t v13 = 1;
LABEL_7:
    [v10 _respondToMAIDAuthenticationRequestIfNeeded:v11 successful:0 error:v12 isCancelled:v13];
    goto LABEL_8;
  }
  id v14 = (void *)a1[4];
  if (!v7 || v8)
  {
    uint64_t v11 = a1[5];
    id v10 = (void *)a1[4];
    id v12 = v9;
    uint64_t v13 = 0;
    goto LABEL_7;
  }
  uint64_t v15 = a1[6];
  uint64_t v16 = a1[7];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_6;
  v17[3] = &unk_1E6EAD570;
  v17[4] = v14;
  id v18 = (id)a1[5];
  [v14 _signInMAID:v15 authenticationResult:v7 personaID:v16 completionHandler:v17];

LABEL_8:
}

uint64_t __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _respondToMAIDAuthenticationRequestIfNeeded:*(void *)(a1 + 40) successful:a2 error:a3 isCancelled:0];
}

- (void)_respondToMAIDAuthenticationRequestIfNeeded:(id)a3 successful:(BOOL)a4 error:(id)a5 isCancelled:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [(MCProfileTitlePageViewModel *)self serialQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__MCProfileTitlePageViewModel__respondToMAIDAuthenticationRequestIfNeeded_successful_error_isCancelled___block_invoke;
  v15[3] = &unk_1E6EAD5C0;
  v15[4] = self;
  id v16 = v10;
  BOOL v18 = a4;
  id v17 = v11;
  BOOL v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, v15);
}

uint64_t __104__MCProfileTitlePageViewModel__respondToMAIDAuthenticationRequestIfNeeded_successful_error_isCancelled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCleanupTask:0];
  uint64_t result = [*(id *)(a1 + 32) isInstallingProfile];
  if (result)
  {
    [*(id *)(a1 + 32) setInstallState:2];
    uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 57);
    return [v4 respondToMAIDAuthenticationRequest:v3 error:v5 isCancelled:v6];
  }
  return result;
}

- (void)_signInMAID:(id)a3 authenticationResult:(id)a4 personaID:(id)a5 completionHandler:(id)a6
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(MCProfileTitlePageViewModel *)self isInstallingProfile])
  {
    NSLog(&cfstr_Mcprofiletitle_6.isa, v10);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__MCProfileTitlePageViewModel__signInMAID_authenticationResult_personaID_completionHandler___block_invoke;
    block[3] = &unk_1E6EAD1D0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    [(MCProfileTitlePageViewModel *)self setInstallState:6];
    id v14 = objc_opt_new();
    uint64_t v15 = *MEMORY[0x1E4F17890];
    v21[0] = *MEMORY[0x1E4F17750];
    v21[1] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    id v17 = [(MCProfileTitlePageViewModel *)self delegate];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __92__MCProfileTitlePageViewModel__signInMAID_authenticationResult_personaID_completionHandler___block_invoke_2;
    v18[3] = &unk_1E6EAD5E8;
    id v19 = v13;
    [v14 signInAccountsWithTypes:v16 authenticationResult:v11 personaID:v12 canMakeAccountActive:0 baseViewController:v17 completionHandler:v18];
  }
}

void __92__MCProfileTitlePageViewModel__signInMAID_authenticationResult_personaID_completionHandler___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 presentSpinnerViewController];
}

uint64_t __92__MCProfileTitlePageViewModel__signInMAID_authenticationResult_personaID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_createAuthenticationContext:(id)a3 presentingViewController:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F4F100];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setIsEphemeral:0];
  [v8 setAuthenticationType:2];
  [v8 setPresentingViewController:v6];

  [v8 setUsername:v7];
  [v8 setIsUsernameEditable:0];
  id v11 = @"shouldAllowManagedAppleIDOnly";
  v12[0] = MEMORY[0x1E4F1CC38];
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v8 setAppProvidedData:v9];

  return v8;
}

- (void)profileConnectionDidRequestCurrentPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(MCProfileTitlePageViewModel *)self pin];
  [v4 respondToCurrentPasscodeRequestContinue:1 passcode:v5];
}

- (void)profileConnection:(id)a3 didRequestMAIDSignIn:(id)a4 personaID:(id)a5
{
}

- (void)profileConnection:(id)a3 didFinishInstallationWithIdentifier:(id)a4 error:(id)a5
{
}

- (void)profileConnection:(id)a3 didRequestUserInput:(id)a4
{
}

- (void)profileConnection:(id)a3 didFinishPreflightWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MCProfileTitlePageViewModel *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MCProfileTitlePageViewModel_profileConnection_didFinishPreflightWithError___block_invoke;
  block[3] = &unk_1E6EAD610;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __77__MCProfileTitlePageViewModel_profileConnection_didFinishPreflightWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 informQuestionViewControllerOfPreflightResult:*(void *)(a1 + 40) profileConnection:*(void *)(a1 + 48)];
}

- (void)profileConnection:(id)a3 didRequestManagedRestoreWithManagedAppleID:(id)a4 personaID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MCProfileTitlePageViewModel *)self serialQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke;
  v15[3] = &unk_1E6EAD480;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setManagedAppleID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setInstallState:7];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F5E698]) initWithPersonaIdentifier:*(void *)(a1 + 48) delegate:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4F5E690]);
  id v4 = objc_alloc(MEMORY[0x1E4F5E6A0]);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke_2;
  id v10 = &unk_1E6EAD638;
  uint64_t v11 = v5;
  id v12 = *(id *)(a1 + 56);
  id v6 = (void *)[v4 initWithSnapshotSource:v2 interactionClient:v5 deviceEnvironment:v3 completion:&v7];
  objc_msgSend(v6, "startManagedRestoreWorkflow", v7, v8, v9, v10, v11);
}

void __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    NSLog(&cfstr_Mcprofiletitle_7.isa, v3);
    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke_3;
    v13[3] = &unk_1E6EAD610;
    id v6 = &v14;
    id v14 = *(id *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = *(void *)(a1 + 32);
    id v15 = v7;
    uint64_t v16 = v8;
    [v5 presentRestoreFailedAlertWithError:v7 completionHandler:v13];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke_4;
    block[3] = &unk_1E6EAD458;
    id v6 = (id *)v12;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    v12[0] = v9;
    v12[1] = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) respondToManagedRestoreRequest:0 error:*(void *)(a1 + 40) isCancelled:0];
  [*(id *)(a1 + 48) setInstallState:8];
  id v2 = [*(id *)(a1 + 48) postRestoreTask];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 48) postRestoreTask];
    v3[2]();

    id v4 = *(void **)(a1 + 48);
    [v4 setPostRestoreTask:0];
  }
}

void __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) respondToManagedRestoreRequest:1 error:0 isCancelled:0];
  [*(id *)(a1 + 40) setInstallState:8];
  id v2 = [*(id *)(a1 + 40) postRestoreTask];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) postRestoreTask];
    v3[2]();

    id v4 = *(void **)(a1 + 40);
    [v4 setPostRestoreTask:0];
  }
}

- (void)doesUserWantToRestoreSnapshot:(id)a3 withConflictingApps:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(MCProfileTitlePageViewModel *)self delegate];
  id v12 = [(MCProfileTitlePageViewModel *)self managedAppleID];
  id v13 = [v9 allObjects];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__MCProfileTitlePageViewModel_doesUserWantToRestoreSnapshot_withConflictingApps_completion___block_invoke;
  v15[3] = &unk_1E6EAD660;
  id v16 = v8;
  id v14 = v8;
  [v11 promptForManagedRestoreWithManagedAppleID:v12 snapshot:v10 conflictingApps:v13 completionHandler:v15];
}

uint64_t __92__MCProfileTitlePageViewModel_doesUserWantToRestoreSnapshot_withConflictingApps_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (BOOL)_installErrorIsUserCancelledError:(id)a3
{
  id v3 = a3;
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  uint64_t v5 = *MEMORY[0x1E4F741B8];
  uint64_t v6 = *MEMORY[0x1E4F28A50];
  do
  {
    id v7 = [v4 domain];
    if ([v7 isEqualToString:v5])
    {
      uint64_t v8 = [v4 code];

      if (v8 == 4004)
      {
        BOOL v11 = 1;
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v9 = [v4 userInfo];
    uint64_t v10 = [v9 objectForKey:v6];

    id v4 = (void *)v10;
  }
  while (v10);
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (MCProfileTitlePageViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MCProfileTitlePageViewModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MCProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
}

- (BOOL)isInstallingProfile
{
  return self->_isInstallingProfile;
}

- (void)setIsInstallingProfile:(BOOL)a3
{
  self->_isInstallingProfile = a3;
}

- (void)setProfileViewModel:(id)a3
{
}

- (NSString)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (int)installState
{
  return self->_installState;
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (void)setManagedAppleID:(id)a3
{
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (id)cleanupTask
{
  return self->_cleanupTask;
}

- (void)setCleanupTask:(id)a3
{
}

- (id)postRestoreTask
{
  return self->_postRestoreTask;
}

- (void)setPostRestoreTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_postRestoreTask, 0);
  objc_storeStrong(&self->_cleanupTask, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_profileViewModel, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end