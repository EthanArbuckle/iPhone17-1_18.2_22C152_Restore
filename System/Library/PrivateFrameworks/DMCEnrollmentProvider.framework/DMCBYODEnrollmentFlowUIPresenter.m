@interface DMCBYODEnrollmentFlowUIPresenter
- (BOOL)hasDoneAuthServices;
- (BOOL)questionsControllerIsDisplayedInSheet:(id)a3;
- (DMCEnrollmentAuthenticationController)authenticationController;
- (DMCEnrollmentAuthenticationViewController)usernameViewController;
- (DMCEnrollmentConsentViewController)consentViewController;
- (DMCInstallProfileQuestionViewController)questionsController;
- (NSString)managedAppleID;
- (id)ESSOApplicationInstallationCompletionHandler;
- (id)_fakeAppleAccountWithAuthenticationResults:(id)a3 personaID:(id)a4 store:(id)a5;
- (id)_fakeiTunesAccountWithAuthenticationResults:(id)a3 personaID:(id)a4 store:(id)a5;
- (id)authenticationActionHandler;
- (id)authenticationCompletionHandler;
- (id)consentCompletionHandler;
- (id)iCloudPromotionCompletionHandler;
- (id)notificationNameForApplicationWillTerminate;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (id)profileInstallationCompletionHandler;
- (id)restoreCompletionHandler;
- (id)userInputCompletionHandler;
- (id)usernameAndPasswordCompletionHandler;
- (id)usernameCompletionHandler;
- (id)webURLCompletionHandler;
- (void)ESSOApplicationDisclosurViewController:(id)a3 didReceiveUserAction:(BOOL)a4 error:(id)a5;
- (void)_handleApplicationInstallationViewControllerDelegate:(id)a3 didReceiveUserAction:(BOOL)a4 error:(id)a5;
- (void)_makeAuthenticationActionHandlerWithEphemeral:(BOOL)a3 requireAppleMAID:(BOOL)a4 presentingViewController:(id)a5;
- (void)_presentOKAlertWithTitle:(id)a3 message:(id)a4 action:(id)a5;
- (void)_showCancelAlertForMAID:(id)a3 actionHandler:(id)a4;
- (void)authenticationViewController:(id)a3 didReceivePassword:(id)a4 forUsername:(id)a5;
- (void)authenticationViewController:(id)a3 didReceiveUsername:(id)a4;
- (void)authenticationViewControllerDidCancel:(id)a3;
- (void)consentViewController:(id)a3 didReceiveUserAction:(BOOL)a4;
- (void)debuggingApplicationInstallationViewController:(id)a3 didReceiveUserAction:(BOOL)a4;
- (void)dismissEnrollmentScene;
- (void)displayManagementDetailsOverviewWithProfileData:(id)a3 managedAppleID:(id)a4 completionHandler:(id)a5;
- (void)doesUserWantToRestoreSnapshot:(id)a3 withConflictingApps:(id)a4 completion:(id)a5;
- (void)ensureNetworkConnectionWithCompletionHandler:(id)a3;
- (void)fetchEnrollmentProfileWithWebAuthURL:(id)a3 machineInfo:(id)a4 anchorCertificateRefs:(id)a5 completionHandler:(id)a6;
- (void)iCloudPromotionViewController:(id)a3 didReceiveUserAction:(BOOL)a4;
- (void)informQuestionViewControllerOfPreflightResult:(id)a3;
- (void)managementDetailsOverviewViewController:(id)a3 didReceiveUserAction:(BOOL)a4;
- (void)questionsController:(id)a3 didFinishWithResponses:(id)a4;
- (void)recievedProfile:(id)a3;
- (void)requestDebuggingApplicationsInstallation:(id)a3 requiredEntitlements:(id)a4 completionHandler:(id)a5;
- (void)requestDevicePasscodeWithCompletionHandler:(id)a3;
- (void)requestESSOApplicationInstallationWithITunesItemID:(id)a3 requiredEntitlements:(id)a4 completionHandler:(id)a5;
- (void)requestMAIDAuthenticationWithManagedAppleID:(id)a3 personaID:(id)a4 ephemeral:(BOOL)a5 requireAppleMAID:(BOOL)a6 completionHandler:(id)a7;
- (void)requestMAIDSignInWithAuthenticationResults:(id)a3 personaID:(id)a4 makeiTunesAccountActive:(BOOL)a5 completionHandler:(id)a6;
- (void)requestMDMUsernameAndPasswordWithCompletionHandler:(id)a3;
- (void)requestSilentMAIDAuthenticationWithAuthenticationResults:(id)a3 personaID:(id)a4 requireAppleMAID:(BOOL)a5 completionHandler:(id)a6;
- (void)requestUserConsentWithCloudConfig:(id)a3 completionHandler:(id)a4;
- (void)requestUserConsentWithProfileData:(id)a3 managedAppleID:(id)a4 completionHandler:(id)a5;
- (void)requestUserInputWithRequest:(id)a3 completionHandler:(id)a4;
- (void)requestUsernameWithDefaultUsername:(id)a3 completionHandler:(id)a4;
- (void)requestWebAuthenticationWithWebAuthURL:(id)a3 authenticator:(id)a4 authParams:(id)a5 completionHandler:(id)a6;
- (void)requestiCloudSignInConfirmationWithCompletionHandler:(id)a3;
- (void)restoreViewController:(id)a3 didReceiveUserAction:(BOOL)a4;
- (void)setAuthenticationActionHandler:(id)a3;
- (void)setAuthenticationCompletionHandler:(id)a3;
- (void)setAuthenticationController:(id)a3;
- (void)setConsentCompletionHandler:(id)a3;
- (void)setConsentViewController:(id)a3;
- (void)setESSOApplicationInstallationCompletionHandler:(id)a3;
- (void)setHasDoneAuthServices:(BOOL)a3;
- (void)setICloudPromotionCompletionHandler:(id)a3;
- (void)setManagedAppleID:(id)a3;
- (void)setProfileInstallationCompletionHandler:(id)a3;
- (void)setQuestionsController:(id)a3;
- (void)setRestoreCompletionHandler:(id)a3;
- (void)setUserInputCompletionHandler:(id)a3;
- (void)setUsernameAndPasswordCompletionHandler:(id)a3;
- (void)setUsernameCompletionHandler:(id)a3;
- (void)setUsernameViewController:(id)a3;
- (void)setWebURLCompletionHandler:(id)a3;
- (void)showEnrollmentCompletionScene;
- (void)showEnrollmentFailure:(id)a3;
- (void)showInstallingEnrollmentProfileScene;
- (void)showiCloudPromotionPageWithiCloudQuotaString:(id)a3 completionHandler:(id)a4;
- (void)suggestRestoreForAccountWithUsername:(id)a3 personaID:(id)a4 completionHandler:(id)a5;
- (void)webAuthCanceled:(id)a3;
@end

@implementation DMCBYODEnrollmentFlowUIPresenter

- (DMCEnrollmentAuthenticationController)authenticationController
{
  authenticationController = self->_authenticationController;
  if (!authenticationController)
  {
    v4 = (DMCEnrollmentAuthenticationController *)objc_opt_new();
    v5 = self->_authenticationController;
    self->_authenticationController = v4;

    authenticationController = self->_authenticationController;
  }
  return authenticationController;
}

- (void)_showCancelAlertForMAID:(id)a3 actionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 length];
  v8 = DMCLocalizedString();
  if ([v6 length])
  {
    v20 = [(DMCBYODEnrollmentFlowUIPresenter *)self managedAppleID];
    v9 = DMCLocalizedFormat();
  }
  else
  {
    v9 = DMCLocalizedString();
  }
  objc_msgSend(v6, "length", v20);
  v10 = DMCLocalizedString();
  v11 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v8 message:v9 preferredStyle:1];
  v12 = (void *)MEMORY[0x263F1C3F0];
  v13 = DMCLocalizedString();
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __74__DMCBYODEnrollmentFlowUIPresenter__showCancelAlertForMAID_actionHandler___block_invoke;
  v23[3] = &unk_2645E8F60;
  id v14 = v7;
  id v24 = v14;
  v15 = [v12 actionWithTitle:v13 style:1 handler:v23];

  v16 = (void *)MEMORY[0x263F1C3F0];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __74__DMCBYODEnrollmentFlowUIPresenter__showCancelAlertForMAID_actionHandler___block_invoke_2;
  v21[3] = &unk_2645E8F88;
  v21[4] = self;
  id v22 = v14;
  id v17 = v14;
  v18 = [v16 actionWithTitle:v10 style:0 handler:v21];
  [v11 addAction:v18];
  [v11 addAction:v15];
  v19 = [(DMCEnrollmentFlowUIPresenterBase *)self navigationController];
  [v19 presentAlert:v11 animated:1];
}

uint64_t __74__DMCBYODEnrollmentFlowUIPresenter__showCancelAlertForMAID_actionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__DMCBYODEnrollmentFlowUIPresenter__showCancelAlertForMAID_actionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  v3 = [v2 view];
  [v3 setUserInteractionEnabled:0];

  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)_presentOKAlertWithTitle:(id)a3 message:(id)a4 action:(id)a5
{
  id v8 = a5;
  v9 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v10 = (void *)MEMORY[0x263F1C3F0];
  v11 = DMCLocalizedString();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__DMCBYODEnrollmentFlowUIPresenter__presentOKAlertWithTitle_message_action___block_invoke;
  v16[3] = &unk_2645E8F60;
  id v17 = v8;
  id v12 = v8;
  v13 = [v10 actionWithTitle:v11 style:0 handler:v16];

  [v9 addAction:v13];
  id v14 = [(DMCEnrollmentFlowUIPresenterBase *)self navigationController];

  if (v14)
  {
    v15 = [(DMCEnrollmentFlowUIPresenterBase *)self navigationController];
    [v15 presentAlert:v9 animated:1];
  }
  else
  {
    v15 = [(DMCEnrollmentFlowUIPresenterBase *)self baseViewController];
    [v15 presentViewController:v9 animated:1 completion:0];
  }
}

uint64_t __76__DMCBYODEnrollmentFlowUIPresenter__presentOKAlertWithTitle_message_action___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestUsernameWithDefaultUsername:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__DMCBYODEnrollmentFlowUIPresenter_requestUsernameWithDefaultUsername_completionHandler___block_invoke;
  block[3] = &unk_2645E8FB0;
  id v11 = v6;
  id v12 = v7;
  block[4] = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __89__DMCBYODEnrollmentFlowUIPresenter_requestUsernameWithDefaultUsername_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) usernameViewController];

  if (!v2)
  {
    v3 = objc_opt_new();
    [v3 setDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setUsernameViewController:v3];
  }
  [*(id *)(a1 + 32) setUsernameCompletionHandler:*(void *)(a1 + 48)];
  v4 = [*(id *)(a1 + 32) usernameViewController];
  [v4 setUsernameEditable:1];

  v5 = [*(id *)(a1 + 32) usernameViewController];
  [v5 setUsername:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) usernameViewController];
  [v6 showPasswordField:0];

  id v7 = [*(id *)(a1 + 32) usernameViewController];
  [v7 setInProgress:0];

  id v8 = [*(id *)(a1 + 32) usernameViewController];
  [v8 setStyle:0];

  [*(id *)(a1 + 32) setHasDoneAuthServices:0];
  id v9 = *(void **)(a1 + 32);
  id v11 = [v9 usernameViewController];
  v10 = [*(id *)(a1 + 32) usernameViewController];
  [v9 pushViewController:v11 foundationViewController:v10];
}

- (void)requestESSOApplicationInstallationWithITunesItemID:(id)a3 requiredEntitlements:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  [(DMCBYODEnrollmentFlowUIPresenter *)self setESSOApplicationInstallationCompletionHandler:a5];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __126__DMCBYODEnrollmentFlowUIPresenter_requestESSOApplicationInstallationWithITunesItemID_requiredEntitlements_completionHandler___block_invoke;
  block[3] = &unk_2645E9028;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __126__DMCBYODEnrollmentFlowUIPresenter_requestESSOApplicationInstallationWithITunesItemID_requiredEntitlements_completionHandler___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263F25388]) initWithName:@"DMC Enrollment SSO App Lockup"];
  id v3 = objc_alloc(MEMORY[0x263F25350]);
  v4 = [*(id *)(a1 + 32) stringValue];
  v5 = (void *)[v3 initWithStringValue:v4];

  id v6 = objc_alloc(MEMORY[0x263F25378]);
  id v7 = (void *)[v6 initWithID:v5 kind:*MEMORY[0x263F25330] context:*MEMORY[0x263F25318]];
  v18[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __126__DMCBYODEnrollmentFlowUIPresenter_requestESSOApplicationInstallationWithITunesItemID_requiredEntitlements_completionHandler___block_invoke_2;
  v12[3] = &unk_2645E9000;
  id v13 = *(id *)(a1 + 32);
  id v14 = v8;
  id v9 = *(void **)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = v2;
  id v17 = v9;
  id v10 = v2;
  id v11 = v8;
  [v10 _cacheLockupsWithRequests:v11 withCompletionBlock:v12];
}

void __126__DMCBYODEnrollmentFlowUIPresenter_requestESSOApplicationInstallationWithITunesItemID_requiredEntitlements_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (![v3 count])
  {
    v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v5;
      _os_log_impl(&dword_221CC5000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch ASCLockupRequest with iTunes item ID: %{public}@. Will let the UI have another try.", buf, 0xCu);
    }
  }
  uint64_t v6 = [v3 count];
  id v7 = v3;
  if (!v6) {
    id v7 = *(void **)(a1 + 40);
  }
  id v8 = [v7 firstObject];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __126__DMCBYODEnrollmentFlowUIPresenter_requestESSOApplicationInstallationWithITunesItemID_requiredEntitlements_completionHandler___block_invoke_58;
  v11[3] = &unk_2645E8FD8;
  id v9 = *(void **)(a1 + 56);
  v11[4] = *(void *)(a1 + 48);
  id v12 = v8;
  id v13 = v9;
  id v14 = *(id *)(a1 + 64);
  id v10 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __126__DMCBYODEnrollmentFlowUIPresenter_requestESSOApplicationInstallationWithITunesItemID_requiredEntitlements_completionHandler___block_invoke_58(uint64_t a1)
{
  v2 = [[DMCEnrollmentESSOApplicationDisclosureViewController alloc] initWithDelegate:*(void *)(a1 + 32) lockupRequest:*(void *)(a1 + 40) lockupViewGroup:*(void *)(a1 + 48) requiredEntitlements:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) pushViewController:v2];
}

- (void)requestDevicePasscodeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  DMCLocalizedStringByDevice();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(DMCEnrollmentFlowUIPresenterBase *)self requestDevicePasscodeWithDescriptionText:v5 completionHandler:v4];
}

- (void)requestWebAuthenticationWithWebAuthURL:(id)a3 authenticator:(id)a4 authParams:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (objc_class *)MEMORY[0x263EFC480];
  id v14 = a3;
  id v15 = [v13 alloc];
  uint64_t v16 = *MEMORY[0x263F527A8];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __118__DMCBYODEnrollmentFlowUIPresenter_requestWebAuthenticationWithWebAuthURL_authenticator_authParams_completionHandler___block_invoke;
  id v24 = &unk_2645E9078;
  v25 = self;
  id v17 = v12;
  id v28 = v17;
  id v18 = v10;
  id v26 = v18;
  id v19 = v11;
  id v27 = v19;
  v20 = (void *)[v15 initWithURL:v14 callbackURLScheme:v16 completionHandler:&v21];

  if ((objc_msgSend(MEMORY[0x263F38B70], "useNonEphemeralWebAuthSession", v21, v22, v23, v24, v25) & 1) == 0) {
    [v20 setPrefersEphemeralWebBrowserSession:1];
  }
  [v20 setPresentationContextProvider:self];
  [v20 start];
}

void __118__DMCBYODEnrollmentFlowUIPresenter_requestWebAuthenticationWithWebAuthURL_authenticator_authParams_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setHasDoneAuthServices:1];
  id v7 = *(void (***)(void, void, void, void))(a1 + 56);
  if (v7)
  {
    if (v5)
    {
      id v9 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __118__DMCBYODEnrollmentFlowUIPresenter_requestWebAuthenticationWithWebAuthURL_authenticator_authParams_completionHandler___block_invoke_2;
      v10[3] = &unk_2645E9050;
      id v11 = v7;
      [v9 authTokensWithCallbackURL:v5 authParams:v8 completionHandler:v10];
    }
    else
    {
      ((void (**)(void, void, BOOL, id))v7)[2](v7, 0, [v6 code] == 1, v6);
    }
  }
}

uint64_t __118__DMCBYODEnrollmentFlowUIPresenter_requestWebAuthenticationWithWebAuthURL_authenticator_authParams_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestMAIDAuthenticationWithManagedAppleID:(id)a3 personaID:(id)a4 ephemeral:(BOOL)a5 requireAppleMAID:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke;
  v15[3] = &unk_2645E9140;
  id v16 = v11;
  id v17 = v12;
  v15[4] = self;
  BOOL v18 = a6;
  BOOL v19 = a5;
  id v13 = v11;
  id v14 = v12;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAuthenticationCompletionHandler:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 32) usernameViewController];

  if (!v2)
  {
    id v3 = objc_opt_new();
    [v3 setDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setUsernameViewController:v3];
  }
  id v4 = [*(id *)(a1 + 32) usernameViewController];
  [v4 setInProgress:0];

  if ([*(id *)(a1 + 40) length])
  {
    id v5 = [*(id *)(a1 + 32) usernameViewController];
    [v5 setUsername:*(void *)(a1 + 40)];

    if ([*(id *)(a1 + 32) hasDoneAuthServices])
    {
      id v6 = (void *)MEMORY[0x263F1CB60];
      id v7 = [*(id *)(a1 + 32) usernameViewController];
      uint64_t v8 = [v7 view];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_2;
      v20[3] = &unk_2645E90A0;
      v20[4] = *(void *)(a1 + 32);
      [v6 transitionWithView:v8 duration:5242880 options:v20 animations:0 completion:0.100000001];
    }
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_3;
  v16[3] = &unk_2645E90F0;
  objc_copyWeak(&v17, &location);
  __int16 v18 = *(_WORD *)(a1 + 56);
  id v9 = (void (**)(void, void))MEMORY[0x223C90320](v16);
  id v10 = *(void **)(a1 + 32);
  id v11 = [v10 usernameViewController];
  id v12 = [*(id *)(a1 + 32) usernameViewController];
  [v10 pushViewController:v11 foundationViewController:v12];

  if ([*(id *)(a1 + 40) length])
  {
    v9[2](v9, *(void *)(a1 + 40));
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_3_73;
    v13[3] = &unk_2645E9118;
    id v14 = v9;
    id v15 = *(id *)(a1 + 48);
    [*(id *)(a1 + 32) setUsernameCompletionHandler:v13];
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) usernameViewController];
  [v1 setStyle:1];
}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    id v14 = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_4;
    id v15 = &unk_2645E90A0;
    id v16 = WeakRetained;
    BSRunLoopPerformAfterCACommit();
    id v6 = [v5 authenticationController];
    uint64_t v7 = *(unsigned __int8 *)(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_5;
    v8[3] = &unk_2645E90C8;
    v8[4] = v5;
    char v10 = *(unsigned char *)(a1 + 41);
    char v11 = v7;
    id v9 = v3;
    [v6 fetchAuthenticationModeForUsername:v9 requireAppleMAID:v7 completionHandler:v8];
  }
}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) usernameViewController];
  [v2 setUsernameEditable:0];

  id v3 = [*(id *)(a1 + 32) usernameViewController];
  [v3 setInProgress:1];
}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_6;
  block[3] = &unk_2645E90A0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  if (v5)
  {
    id v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v5;
      _os_log_impl(&dword_221CC5000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch authentication mode with error: %{public}@", buf, 0xCu);
    }
    uint64_t v7 = [*(id *)(a1 + 32) authenticationCompletionHandler];

    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 32) authenticationCompletionHandler];
      ((void (**)(void, void, void, id))v8)[2](v8, 0, 0, v5);

      [*(id *)(a1 + 32) setAuthenticationCompletionHandler:0];
    }
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 49);
    uint64_t v12 = [v9 navigationController];
    [v9 _makeAuthenticationActionHandlerWithEphemeral:v10 requireAppleMAID:v11 presentingViewController:v12];

    if (a2 == 2)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_2_70;
      v16[3] = &unk_2645E90A0;
      void v16[4] = *(void *)(a1 + 32);
      uint64_t v13 = (void *)MEMORY[0x263EF83A0];
      dispatch_async(MEMORY[0x263EF83A0], v16);

      id v14 = [*(id *)(a1 + 32) authenticationActionHandler];
      v14[2](v14, *(void *)(a1 + 40), 0);
    }
    else
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_69;
      v17[3] = &unk_2645E90A0;
      v17[4] = *(void *)(a1 + 32);
      id v15 = (void *)MEMORY[0x263EF83A0];
      dispatch_async(MEMORY[0x263EF83A0], v17);
    }
  }
}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_6(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) usernameViewController];
  [v1 setInProgress:0];
}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_69(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) usernameViewController];
  [v2 setInProgress:0];

  id v3 = [*(id *)(a1 + 32) usernameViewController];
  [v3 showPasswordField:1];
}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_2_70(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) usernameViewController];
  [v1 setInProgress:1];
}

uint64_t __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_3_73(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_makeAuthenticationActionHandlerWithEphemeral:(BOOL)a3 requireAppleMAID:(BOOL)a4 presentingViewController:(id)a5
{
  id v8 = a5;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke;
  v10[3] = &unk_2645E9190;
  objc_copyWeak(&v12, &location);
  BOOL v13 = a3;
  BOOL v14 = a4;
  id v9 = v8;
  id v11 = v9;
  [(DMCBYODEnrollmentFlowUIPresenter *)self setAuthenticationActionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([MEMORY[0x263F38B70] shouldSimulateMDMAccountDrivenEnrollment]
      && ([MEMORY[0x263F38B70] simluatedMDMAccountDrivenEnrollmentAuthenticationResults],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke_2;
      block[3] = &unk_2645E90A0;
      void block[4] = WeakRetained;
      dispatch_async(MEMORY[0x263EF83A0], block);
      id v9 = [WeakRetained authenticationCompletionHandler];
      uint64_t v10 = [MEMORY[0x263F38B70] simluatedMDMAccountDrivenEnrollmentAuthenticationResults];
      ((void (**)(void, void *, void, void))v9)[2](v9, v10, 0, 0);

      [WeakRetained setAuthenticationCompletionHandler:0];
    }
    else
    {
      id v11 = [WeakRetained authenticationController];
      uint64_t v12 = *(unsigned __int8 *)(a1 + 48);
      uint64_t v13 = *(unsigned __int8 *)(a1 + 49);
      uint64_t v14 = *(void *)(a1 + 32);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke_3;
      v15[3] = &unk_2645E9168;
      objc_copyWeak(&v16, (id *)(a1 + 40));
      [v11 authenticateWithUsername:v5 password:v6 ephemeral:v12 requireAppleMAID:v13 presentingViewController:v14 completionHandler:v15];

      objc_destroyWeak(&v16);
    }
  }
}

void __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) usernameViewController];
  [v1 setInProgress:0];
}

void __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v8)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke_4;
      block[3] = &unk_2645E90A0;
      void block[4] = WeakRetained;
      dispatch_async(MEMORY[0x263EF83A0], block);
      id v11 = [v8 domain];
      if ([v11 isEqualToString:*MEMORY[0x263F28F30]])
      {
        uint64_t v12 = [v8 code];

        if (v12 == -7006)
        {
          [v10 showEnrollmentFailure:v8];
          goto LABEL_10;
        }
      }
      else
      {
      }
      uint64_t v13 = [v10 authenticationCompletionHandler];
      uint64_t v14 = (void *)[v7 mutableCopy];
      ((void (**)(void, void *, uint64_t, id))v13)[2](v13, v14, a3, v8);
    }
    else
    {
      uint64_t v13 = [WeakRetained authenticationCompletionHandler];
      uint64_t v14 = (void *)[v7 mutableCopy];
      ((void (**)(void, void *, uint64_t, void))v13)[2](v13, v14, a3, 0);
    }

    [v10 setAuthenticationCompletionHandler:0];
  }
LABEL_10:
}

void __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) usernameViewController];
  [v1 setInProgress:0];
}

- (void)requestSilentMAIDAuthenticationWithAuthenticationResults:(id)a3 personaID:(id)a4 requireAppleMAID:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke;
  block[3] = &unk_2645E9258;
  void block[4] = self;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  BOOL v20 = a5;
  id v13 = v10;
  id v14 = v12;
  id v15 = v11;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activityController];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = DMCLocalizedStringByDevice();
    [v3 presentActivityPageWithText:v4 showButtomView:0];
  }
  id v5 = [MEMORY[0x263F38BB8] currentPersonaID];
  id v6 = (void *)MEMORY[0x263F38BB8];
  uint64_t v7 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_2;
  v12[3] = &unk_2645E9230;
  id v13 = v5;
  id v16 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  char v17 = *(unsigned char *)(a1 + 64);
  id v10 = v5;
  id v11 = (id)[v6 performBlockUnderPersona:v7 block:v12];
}

void __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_2(uint64_t a1)
{
  if ([MEMORY[0x263F38B70] shouldSimulateMDMAccountDrivenEnrollment]
    && ([MEMORY[0x263F38B70] simluatedMDMAccountDrivenEnrollmentAuthenticationResults],
        v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    id v3 = (void *)MEMORY[0x263F38BB8];
    uint64_t v4 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_3;
    v15[3] = &unk_2645E91B8;
    id v5 = &v17;
    id v17 = *(id *)(a1 + 56);
    id v6 = &v16;
    id v16 = *(id *)(a1 + 40);
    id v7 = (id)[v3 performBlockUnderPersona:v4 block:v15];
  }
  else
  {
    id v8 = [*(id *)(a1 + 48) authenticationController];
    uint64_t v9 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [*(id *)(a1 + 48) navigationController];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_4;
    v12[3] = &unk_2645E9208;
    id v5 = &v13;
    id v13 = *(id *)(a1 + 32);
    id v6 = &v14;
    id v14 = *(id *)(a1 + 56);
    [v8 authenticateWithAuthenticationResults:v10 ephemeral:0 requireAppleMAID:v9 presentingViewController:v11 completionHandler:v12];
  }
}

void __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) mutableCopy];
  (*(void (**)(uint64_t, id, void, void))(v1 + 16))(v1, v2, 0, 0);
}

void __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_4(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x263F38BB8];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_5;
  v15[3] = &unk_2645E91E0;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v17 = v8;
  id v18 = v11;
  char v19 = a3;
  id v16 = v7;
  id v12 = v8;
  id v13 = v7;
  id v14 = (id)[v9 performBlockUnderPersona:v10 block:v15];
}

void __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = (id)[*(id *)(a1 + 32) mutableCopy];
  (*(void (**)(uint64_t, id, void, void))(v2 + 16))(v2, v3, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

- (void)requestMAIDSignInWithAuthenticationResults:(id)a3 personaID:(id)a4 makeiTunesAccountActive:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __131__DMCBYODEnrollmentFlowUIPresenter_requestMAIDSignInWithAuthenticationResults_personaID_makeiTunesAccountActive_completionHandler___block_invoke;
  block[3] = &unk_2645E92A8;
  void block[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  BOOL v20 = a5;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __131__DMCBYODEnrollmentFlowUIPresenter_requestMAIDSignInWithAuthenticationResults_personaID_makeiTunesAccountActive_completionHandler___block_invoke(uint64_t a1)
{
  v22[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) activityController];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = DMCLocalizedStringByDevice();
    [v3 presentActivityPageWithText:v4 showButtomView:0];
  }
  if ([MEMORY[0x263F38B70] shouldSimulateMDMAccountDrivenEnrollment]
    && ([MEMORY[0x263F38B70] simluatedMDMAccountDrivenEnrollmentAuthenticationResults],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v6 = [MEMORY[0x263EFB210] defaultStore];
    id v7 = [*(id *)(a1 + 32) _fakeAppleAccountWithAuthenticationResults:*(void *)(a1 + 40) personaID:*(void *)(a1 + 48) store:v6];
    id v21 = 0;
    [v6 saveVerifiedAccount:v7 error:&v21];
    id v8 = v21;
    uint64_t v9 = [*(id *)(a1 + 32) _fakeiTunesAccountWithAuthenticationResults:*(void *)(a1 + 40) personaID:*(void *)(a1 + 48) store:v6];
    id v20 = v8;
    [v6 saveVerifiedAccount:v9 error:&v20];
    id v10 = v20;

    (*(void (**)(void, BOOL, void, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v10 == 0, 0, v10);
  }
  else
  {
    id v11 = objc_opt_new();
    uint64_t v12 = *MEMORY[0x263EFB000];
    v22[0] = *MEMORY[0x263EFAE58];
    v22[1] = v12;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v16 = *(unsigned __int8 *)(a1 + 64);
    id v17 = [*(id *)(a1 + 32) navigationController];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = __131__DMCBYODEnrollmentFlowUIPresenter_requestMAIDSignInWithAuthenticationResults_personaID_makeiTunesAccountActive_completionHandler___block_invoke_2;
    v18[3] = &unk_2645E9280;
    id v19 = *(id *)(a1 + 56);
    [v11 signInAccountsWithTypes:v13 authenticationResult:v15 personaID:v14 canMakeAccountActive:v16 baseViewController:v17 completionHandler:v18];

    id v6 = v19;
  }
}

uint64_t __131__DMCBYODEnrollmentFlowUIPresenter_requestMAIDSignInWithAuthenticationResults_personaID_makeiTunesAccountActive_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestUserConsentWithProfileData:(id)a3 managedAppleID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x263F53C48];
  id v20 = 0;
  id v10 = a5;
  id v11 = [v9 profileWithData:a3 outError:&v20];
  id v12 = v20;
  if (v12)
  {
    id v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221CC5000, v13, OS_LOG_TYPE_ERROR, "Failed to parse profile data", buf, 2u);
    }
  }
  [(DMCBYODEnrollmentFlowUIPresenter *)self setManagedAppleID:v8];
  [(DMCBYODEnrollmentFlowUIPresenter *)self setConsentCompletionHandler:v10];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__DMCBYODEnrollmentFlowUIPresenter_requestUserConsentWithProfileData_managedAppleID_completionHandler___block_invoke;
  block[3] = &unk_2645E9028;
  void block[4] = self;
  id v17 = v8;
  id v18 = v11;
  id v14 = v11;
  id v15 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __103__DMCBYODEnrollmentFlowUIPresenter_requestUserConsentWithProfileData_managedAppleID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[DMCEnrollmentConsentViewController alloc] initWithDelegate:*(void *)(a1 + 32) username:*(void *)(a1 + 40) profile:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) pushViewController:v2];
}

- (void)displayManagementDetailsOverviewWithProfileData:(id)a3 managedAppleID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x263F53C48];
  id v20 = 0;
  id v10 = a5;
  id v11 = [v9 profileWithData:a3 outError:&v20];
  id v12 = v20;
  if (v12)
  {
    id v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221CC5000, v13, OS_LOG_TYPE_ERROR, "Failed to parse profile data", buf, 2u);
    }
  }
  [(DMCBYODEnrollmentFlowUIPresenter *)self setManagedAppleID:v8];
  [(DMCBYODEnrollmentFlowUIPresenter *)self setConsentCompletionHandler:v10];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__DMCBYODEnrollmentFlowUIPresenter_displayManagementDetailsOverviewWithProfileData_managedAppleID_completionHandler___block_invoke;
  block[3] = &unk_2645E9028;
  void block[4] = self;
  id v17 = v8;
  id v18 = v11;
  id v14 = v11;
  id v15 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __117__DMCBYODEnrollmentFlowUIPresenter_displayManagementDetailsOverviewWithProfileData_managedAppleID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[DMCEnrollmentManagementDetailsOverviewViewController alloc] initWithDelegate:*(void *)(a1 + 32) managedAppleID:*(void *)(a1 + 40) profile:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) pushViewController:v2];
}

- (void)requestUserInputWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [(DMCBYODEnrollmentFlowUIPresenter *)self setUserInputCompletionHandler:a4];
  id v7 = [[DMCInstallProfileQuestionViewController alloc] initWithUserInput:v6];

  [(DMCInstallProfileQuestionViewController *)v7 setQuestionsDelegate:self];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__DMCBYODEnrollmentFlowUIPresenter_requestUserInputWithRequest_completionHandler___block_invoke;
  v9[3] = &unk_2645E92D0;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __82__DMCBYODEnrollmentFlowUIPresenter_requestUserInputWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40)];
}

- (void)informQuestionViewControllerOfPreflightResult:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCBYODEnrollmentFlowUIPresenter *)self questionsController];
  [v5 profileConnectionDidFinishPreflightWithError:v4];
}

- (void)showiCloudPromotionPageWithiCloudQuotaString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __99__DMCBYODEnrollmentFlowUIPresenter_showiCloudPromotionPageWithiCloudQuotaString_completionHandler___block_invoke;
  v12[3] = &unk_2645E92F8;
  id v13 = v7;
  id v8 = v7;
  [(DMCBYODEnrollmentFlowUIPresenter *)self setICloudPromotionCompletionHandler:v12];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__DMCBYODEnrollmentFlowUIPresenter_showiCloudPromotionPageWithiCloudQuotaString_completionHandler___block_invoke_2;
  block[3] = &unk_2645E92D0;
  void block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __99__DMCBYODEnrollmentFlowUIPresenter_showiCloudPromotionPageWithiCloudQuotaString_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __99__DMCBYODEnrollmentFlowUIPresenter_showiCloudPromotionPageWithiCloudQuotaString_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [[DMCEnrollmentiCloudPromotionViewController alloc] initWithType:1 delegate:*(void *)(a1 + 32)];
  [(DMCEnrollmentiCloudPromotionViewController *)v2 setQuotaString:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) pushViewController:v2];
}

- (void)requestiCloudSignInConfirmationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__DMCBYODEnrollmentFlowUIPresenter_requestiCloudSignInConfirmationWithCompletionHandler___block_invoke;
  v7[3] = &unk_2645E92F8;
  id v8 = v4;
  id v5 = v4;
  [(DMCBYODEnrollmentFlowUIPresenter *)self setICloudPromotionCompletionHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__DMCBYODEnrollmentFlowUIPresenter_requestiCloudSignInConfirmationWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_2645E90A0;
  v6[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __89__DMCBYODEnrollmentFlowUIPresenter_requestiCloudSignInConfirmationWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__DMCBYODEnrollmentFlowUIPresenter_requestiCloudSignInConfirmationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [[DMCEnrollmentiCloudPromotionViewController alloc] initWithType:0 delegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) pushViewController:v2 foundationViewController:v2];
}

- (void)suggestRestoreForAccountWithUsername:(id)a3 personaID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (DMCRFMBDeviceEnvironment *)a5;
  [(DMCBYODEnrollmentFlowUIPresenter *)self setManagedAppleID:a3];
  if ([MEMORY[0x263F38B70] shouldSimulateMDMAccountDrivenEnrollment]
    && ([MEMORY[0x263F38B70] simluatedMDMAccountDrivenEnrollmentAuthenticationResults],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    id v11 = objc_opt_new();
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke;
    v19[3] = &unk_2645E9280;
    id v20 = v9;
    id v12 = v9;
    [(DMCBYODEnrollmentFlowUIPresenter *)self doesUserWantToRestoreSnapshot:v11 withConflictingApps:0 completion:v19];

    id v13 = v20;
  }
  else
  {
    id v12 = [[DMCRFMBSnapshotSource alloc] initWithPersonaIdentifier:v8 delegate:0];
    id v13 = objc_alloc_init(DMCRFMBDeviceEnvironment);
    id v14 = [DMCRFRestoreFlow alloc];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke_2;
    v17[3] = &unk_2645E9370;
    v17[4] = self;
    id v18 = v9;
    id v15 = v9;
    uint64_t v16 = [(DMCRFRestoreFlow *)v14 initWithSnapshotSource:v12 interactionClient:self deviceEnvironment:v13 completion:v17];
    [(DMCRFRestoreFlow *)v16 startManagedRestoreWorkflow];
  }
}

uint64_t __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke_3;
    v4[3] = &unk_2645E9348;
    uint64_t v2 = *(void **)(a1 + 40);
    v4[4] = *(void *)(a1 + 32);
    id v5 = v2;
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

void __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = DMCLocalizedString();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke_4;
  v4[3] = &unk_2645E9320;
  id v5 = *(id *)(a1 + 40);
  [v2 _presentOKAlertWithTitle:0 message:v3 action:v4];
}

uint64_t __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestDebuggingApplicationsInstallation:(id)a3 requiredEntitlements:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  [(DMCBYODEnrollmentFlowUIPresenter *)self setESSOApplicationInstallationCompletionHandler:a5];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __116__DMCBYODEnrollmentFlowUIPresenter_requestDebuggingApplicationsInstallation_requiredEntitlements_completionHandler___block_invoke;
  block[3] = &unk_2645E9028;
  void block[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __116__DMCBYODEnrollmentFlowUIPresenter_requestDebuggingApplicationsInstallation_requiredEntitlements_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[DMCEnrollmentDebuggingESSOApplicationInstallationViewController alloc] initWithDelegate:*(void *)(a1 + 32) appBundleIDs:*(void *)(a1 + 40) requiredEntitlements:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) pushViewController:v2];
}

- (void)showInstallingEnrollmentProfileScene
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__DMCBYODEnrollmentFlowUIPresenter_showInstallingEnrollmentProfileScene__block_invoke;
  block[3] = &unk_2645E90A0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __72__DMCBYODEnrollmentFlowUIPresenter_showInstallingEnrollmentProfileScene__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activityController];
  if (!v2) {
    goto LABEL_3;
  }
  id v3 = (void *)v2;
  id v4 = [*(id *)(a1 + 32) navigationController];
  id v5 = [v4 topViewController];
  id v6 = [*(id *)(a1 + 32) activityController];

  if (v5 != v6)
  {
LABEL_3:
    id v7 = *(void **)(a1 + 32);
    DMCLocalizedStringByDevice();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v7 presentActivityPageWithText:v8 showButtomView:0];
  }
}

- (void)showEnrollmentCompletionScene
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentCompletionScene__block_invoke;
  block[3] = &unk_2645E90A0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __65__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentCompletionScene__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentCompletionScene__block_invoke_2;
  v3[3] = &unk_2645E90A0;
  v3[4] = v1;
  return [v1 dismissWithCompletion:v3];
}

void __65__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentCompletionScene__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = NSString;
  uint64_t v2 = *MEMORY[0x263F53E40];
  id v3 = [*(id *)(a1 + 32) managedAppleID];
  [v1 stringWithFormat:@"%@&username=%@", v2, v3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [MEMORY[0x263F01880] defaultWorkspace];
  id v5 = [NSURL URLWithString:v6];
  [v4 openSensitiveURL:v5 withOptions:0];
}

- (void)showEnrollmentFailure:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentFailure___block_invoke;
  v6[3] = &unk_2645E92D0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __58__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentFailure___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setActivityController:0];
  uint64_t v2 = [*(id *)(a1 + 40) localizedDescription];
  if ([MEMORY[0x263F38B68] isAppleInternal])
  {
    id v3 = [*(id *)(a1 + 40) underlyingErrors];

    if (v3)
    {
      id v4 = NSString;
      id v5 = [*(id *)(a1 + 40) underlyingErrors];
      id v6 = [v5 firstObject];
      id v7 = [v6 description];
      uint64_t v8 = [v4 stringWithFormat:@"%@\n\n[Internal only]\n%@", v2, v7];

      uint64_t v2 = (void *)v8;
    }
  }
  id v9 = [*(id *)(a1 + 32) navigationController];
  [v9 blockNavigationPush];

  objc_initWeak(&location, *(id *)(a1 + 32));
  id v10 = *(void **)(a1 + 32);
  id v11 = DMCLocalizedString();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentFailure___block_invoke_2;
  v12[3] = &unk_2645E9398;
  objc_copyWeak(&v13, &location);
  [v10 _presentOKAlertWithTitle:v11 message:v2 action:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __58__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentFailure___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained navigationController];
  [v1 unblockNavigationPush];
}

- (void)dismissEnrollmentScene
{
  id v3 = [(DMCBYODEnrollmentFlowUIPresenter *)self usernameViewController];
  if ([v3 inProgress])
  {
    id v4 = [(DMCEnrollmentFlowUIPresenterBase *)self navigationController];
    id v5 = [v4 topViewController];
    id v6 = [(DMCBYODEnrollmentFlowUIPresenter *)self usernameViewController];

    if (v5 == v6)
    {
      dispatch_time_t v7 = dispatch_time(0, 700000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__DMCBYODEnrollmentFlowUIPresenter_dismissEnrollmentScene__block_invoke;
      block[3] = &unk_2645E90A0;
      void block[4] = self;
      dispatch_after(v7, MEMORY[0x263EF83A0], block);
      return;
    }
  }
  else
  {
  }
  [(DMCEnrollmentFlowUIPresenterBase *)self dismissWithCompletion:0];
}

uint64_t __58__DMCBYODEnrollmentFlowUIPresenter_dismissEnrollmentScene__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWithCompletion:0];
}

- (id)notificationNameForApplicationWillTerminate
{
  return (id)*MEMORY[0x263F1D0E0];
}

- (void)authenticationViewController:(id)a3 didReceiveUsername:(id)a4
{
  id v5 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__DMCBYODEnrollmentFlowUIPresenter_authenticationViewController_didReceiveUsername___block_invoke;
  block[3] = &unk_2645E90A0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  id v6 = [(DMCBYODEnrollmentFlowUIPresenter *)self usernameCompletionHandler];

  if (v6)
  {
    dispatch_time_t v7 = [(DMCBYODEnrollmentFlowUIPresenter *)self usernameCompletionHandler];
    ((void (**)(void, id, void))v7)[2](v7, v5, 0);

    [(DMCBYODEnrollmentFlowUIPresenter *)self setUsernameCompletionHandler:0];
  }
}

void __84__DMCBYODEnrollmentFlowUIPresenter_authenticationViewController_didReceiveUsername___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) usernameViewController];
  [v1 setInProgress:1];
}

- (void)authenticationViewController:(id)a3 didReceivePassword:(id)a4 forUsername:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(DMCBYODEnrollmentFlowUIPresenter *)self authenticationCompletionHandler];

  if (v9)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__DMCBYODEnrollmentFlowUIPresenter_authenticationViewController_didReceivePassword_forUsername___block_invoke;
    block[3] = &unk_2645E90A0;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    id v10 = [(DMCBYODEnrollmentFlowUIPresenter *)self authenticationActionHandler];
    ((void (**)(void, id, id))v10)[2](v10, v8, v7);
  }
  id v11 = [(DMCBYODEnrollmentFlowUIPresenter *)self usernameAndPasswordCompletionHandler];

  if (v11)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __96__DMCBYODEnrollmentFlowUIPresenter_authenticationViewController_didReceivePassword_forUsername___block_invoke_2;
    v13[3] = &unk_2645E90A0;
    void v13[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v13);
    id v12 = [(DMCBYODEnrollmentFlowUIPresenter *)self usernameAndPasswordCompletionHandler];
    ((void (**)(void, id, id, void))v12)[2](v12, v8, v7, 0);

    [(DMCBYODEnrollmentFlowUIPresenter *)self setUsernameAndPasswordCompletionHandler:0];
  }
}

void __96__DMCBYODEnrollmentFlowUIPresenter_authenticationViewController_didReceivePassword_forUsername___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) usernameViewController];
  [v1 setInProgress:1];
}

void __96__DMCBYODEnrollmentFlowUIPresenter_authenticationViewController_didReceivePassword_forUsername___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) usernameViewController];
  [v1 setInProgress:1];
}

- (void)authenticationViewControllerDidCancel:(id)a3
{
  id v4 = [(DMCBYODEnrollmentFlowUIPresenter *)self usernameCompletionHandler];

  if (v4)
  {
    id v5 = [(DMCBYODEnrollmentFlowUIPresenter *)self usernameCompletionHandler];
    v5[2](v5, 0, 1);

    [(DMCBYODEnrollmentFlowUIPresenter *)self setUsernameCompletionHandler:0];
  }
  else
  {
    if ([(DMCBYODEnrollmentFlowUIPresenter *)self hasDoneAuthServices])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __74__DMCBYODEnrollmentFlowUIPresenter_authenticationViewControllerDidCancel___block_invoke;
      block[3] = &unk_2645E90A0;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      id v6 = [(DMCBYODEnrollmentFlowUIPresenter *)self authenticationCompletionHandler];

      if (v6)
      {
        id v7 = [(DMCBYODEnrollmentFlowUIPresenter *)self authenticationCompletionHandler];
        v7[2](v7, 0, 1, 0);

        [(DMCBYODEnrollmentFlowUIPresenter *)self setAuthenticationCompletionHandler:0];
      }
    }
    id v8 = [(DMCBYODEnrollmentFlowUIPresenter *)self usernameAndPasswordCompletionHandler];

    if (v8)
    {
      id v9 = [(DMCBYODEnrollmentFlowUIPresenter *)self usernameAndPasswordCompletionHandler];
      v9[2](v9, 0, 0, 1);

      [(DMCBYODEnrollmentFlowUIPresenter *)self setUsernameAndPasswordCompletionHandler:0];
    }
  }
}

uint64_t __74__DMCBYODEnrollmentFlowUIPresenter_authenticationViewControllerDidCancel___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __74__DMCBYODEnrollmentFlowUIPresenter_authenticationViewControllerDidCancel___block_invoke_2;
  v3[3] = &unk_2645E93C0;
  v3[4] = v1;
  return [v1 _showCancelAlertForMAID:0 actionHandler:v3];
}

void __74__DMCBYODEnrollmentFlowUIPresenter_authenticationViewControllerDidCancel___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) authenticationCompletionHandler];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) authenticationCompletionHandler];
      v4[2](v4, 0, 1, 0);

      id v5 = *(void **)(a1 + 32);
      [v5 setAuthenticationCompletionHandler:0];
    }
  }
}

- (void)consentViewController:(id)a3 didReceiveUserAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = [(DMCBYODEnrollmentFlowUIPresenter *)self consentCompletionHandler];

    if (v7)
    {
      [v6 setInProgress:1];
      id v8 = [(DMCBYODEnrollmentFlowUIPresenter *)self consentCompletionHandler];
      v8[2](v8, 1);

      [(DMCBYODEnrollmentFlowUIPresenter *)self setConsentCompletionHandler:0];
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__DMCBYODEnrollmentFlowUIPresenter_consentViewController_didReceiveUserAction___block_invoke;
    block[3] = &unk_2645E90A0;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __79__DMCBYODEnrollmentFlowUIPresenter_consentViewController_didReceiveUserAction___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 managedAppleID];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __79__DMCBYODEnrollmentFlowUIPresenter_consentViewController_didReceiveUserAction___block_invoke_2;
  v4[3] = &unk_2645E93C0;
  void v4[4] = *(void *)(a1 + 32);
  [v2 _showCancelAlertForMAID:v3 actionHandler:v4];
}

void __79__DMCBYODEnrollmentFlowUIPresenter_consentViewController_didReceiveUserAction___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) consentCompletionHandler];

    if (v3)
    {
      BOOL v4 = [*(id *)(a1 + 32) consentCompletionHandler];
      v4[2](v4, 0);

      id v5 = *(void **)(a1 + 32);
      [v5 setConsentCompletionHandler:0];
    }
  }
}

- (void)questionsController:(id)a3 didFinishWithResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__DMCBYODEnrollmentFlowUIPresenter_questionsController_didFinishWithResponses___block_invoke;
  block[3] = &unk_2645E90A0;
  id v8 = v6;
  id v12 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
  id v9 = [(DMCBYODEnrollmentFlowUIPresenter *)self userInputCompletionHandler];

  if (v9)
  {
    id v10 = [(DMCBYODEnrollmentFlowUIPresenter *)self userInputCompletionHandler];
    ((void (**)(void, id, BOOL))v10)[2](v10, v7, [v7 count] == 0);
  }
}

uint64_t __79__DMCBYODEnrollmentFlowUIPresenter_questionsController_didFinishWithResponses___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitForMoreInput];
}

- (BOOL)questionsControllerIsDisplayedInSheet:(id)a3
{
  return 1;
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v3 = [(DMCEnrollmentFlowUIPresenterBase *)self baseViewController];
  BOOL v4 = [v3 view];
  id v5 = [v4 window];

  return v5;
}

- (void)iCloudPromotionViewController:(id)a3 didReceiveUserAction:(BOOL)a4
{
  if (a4)
  {
    id v5 = [(DMCBYODEnrollmentFlowUIPresenter *)self iCloudPromotionCompletionHandler];

    if (v5)
    {
      id v6 = [(DMCBYODEnrollmentFlowUIPresenter *)self iCloudPromotionCompletionHandler];
      v6[2](v6, 1);

      [(DMCBYODEnrollmentFlowUIPresenter *)self setICloudPromotionCompletionHandler:0];
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__DMCBYODEnrollmentFlowUIPresenter_iCloudPromotionViewController_didReceiveUserAction___block_invoke;
    block[3] = &unk_2645E90A0;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __87__DMCBYODEnrollmentFlowUIPresenter_iCloudPromotionViewController_didReceiveUserAction___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __87__DMCBYODEnrollmentFlowUIPresenter_iCloudPromotionViewController_didReceiveUserAction___block_invoke_2;
  v3[3] = &unk_2645E93C0;
  v3[4] = v1;
  return [v1 _showCancelAlertForMAID:0 actionHandler:v3];
}

void __87__DMCBYODEnrollmentFlowUIPresenter_iCloudPromotionViewController_didReceiveUserAction___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) iCloudPromotionCompletionHandler];

    if (v3)
    {
      BOOL v4 = [*(id *)(a1 + 32) iCloudPromotionCompletionHandler];
      v4[2](v4, 0);

      id v5 = *(void **)(a1 + 32);
      [v5 setICloudPromotionCompletionHandler:0];
    }
  }
}

- (void)doesUserWantToRestoreSnapshot:(id)a3 withConflictingApps:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __97__DMCBYODEnrollmentFlowUIPresenter_doesUserWantToRestoreSnapshot_withConflictingApps_completion___block_invoke;
  v17[3] = &unk_2645E92F8;
  id v18 = v10;
  id v11 = v10;
  [(DMCBYODEnrollmentFlowUIPresenter *)self setRestoreCompletionHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __97__DMCBYODEnrollmentFlowUIPresenter_doesUserWantToRestoreSnapshot_withConflictingApps_completion___block_invoke_2;
  v14[3] = &unk_2645E9028;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

uint64_t __97__DMCBYODEnrollmentFlowUIPresenter_doesUserWantToRestoreSnapshot_withConflictingApps_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

void __97__DMCBYODEnrollmentFlowUIPresenter_doesUserWantToRestoreSnapshot_withConflictingApps_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [DMCEnrollmentFlowRestoreViewController alloc];
  id v3 = *(void **)(a1 + 32);
  BOOL v4 = [v3 managedAppleID];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) allObjects];
  id v7 = [(DMCEnrollmentFlowRestoreViewController *)v2 initWithDelegate:v3 managedAppleID:v4 restoreSnapshot:v5 conflictingApps:v6];

  [*(id *)(a1 + 32) pushViewController:v7];
}

- (void)restoreViewController:(id)a3 didReceiveUserAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(DMCBYODEnrollmentFlowUIPresenter *)self restoreCompletionHandler];

  if (v6)
  {
    id v7 = [(DMCBYODEnrollmentFlowUIPresenter *)self restoreCompletionHandler];
    v7[2](v7, v4);

    [(DMCBYODEnrollmentFlowUIPresenter *)self setRestoreCompletionHandler:0];
  }
}

- (void)ESSOApplicationDisclosurViewController:(id)a3 didReceiveUserAction:(BOOL)a4 error:(id)a5
{
}

- (void)_handleApplicationInstallationViewControllerDelegate:(id)a3 didReceiveUserAction:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __116__DMCBYODEnrollmentFlowUIPresenter__handleApplicationInstallationViewControllerDelegate_didReceiveUserAction_error___block_invoke;
  v12[3] = &unk_2645E93E8;
  BOOL v16 = a4;
  id v13 = v9;
  id v14 = v8;
  id v15 = self;
  id v10 = v8;
  id v11 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __116__DMCBYODEnrollmentFlowUIPresenter__handleApplicationInstallationViewControllerDelegate_didReceiveUserAction_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 40) setInProgress:1];
  }
  else if (!*(void *)(a1 + 32))
  {
    uint64_t v5 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __116__DMCBYODEnrollmentFlowUIPresenter__handleApplicationInstallationViewControllerDelegate_didReceiveUserAction_error___block_invoke_2;
    v6[3] = &unk_2645E93C0;
    v6[4] = v5;
    [v5 _showCancelAlertForMAID:0 actionHandler:v6];
    return;
  }
  uint64_t v2 = [*(id *)(a1 + 48) ESSOApplicationInstallationCompletionHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 48) ESSOApplicationInstallationCompletionHandler];
    v3[2](v3, 0, *(void *)(a1 + 32));

    BOOL v4 = *(void **)(a1 + 48);
    [v4 setESSOApplicationInstallationCompletionHandler:0];
  }
}

void __116__DMCBYODEnrollmentFlowUIPresenter__handleApplicationInstallationViewControllerDelegate_didReceiveUserAction_error___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) ESSOApplicationInstallationCompletionHandler];

    if (v3)
    {
      BOOL v4 = [*(id *)(a1 + 32) ESSOApplicationInstallationCompletionHandler];
      v4[2](v4, 1, 0);

      uint64_t v5 = *(void **)(a1 + 32);
      [v5 setESSOApplicationInstallationCompletionHandler:0];
    }
  }
}

- (void)debuggingApplicationInstallationViewController:(id)a3 didReceiveUserAction:(BOOL)a4
{
}

- (void)managementDetailsOverviewViewController:(id)a3 didReceiveUserAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = [(DMCBYODEnrollmentFlowUIPresenter *)self consentCompletionHandler];

    if (v7)
    {
      [v6 setInProgress:1];
      id v8 = [(DMCBYODEnrollmentFlowUIPresenter *)self consentCompletionHandler];
      v8[2](v8, 1);

      [(DMCBYODEnrollmentFlowUIPresenter *)self setConsentCompletionHandler:0];
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__DMCBYODEnrollmentFlowUIPresenter_managementDetailsOverviewViewController_didReceiveUserAction___block_invoke;
    block[3] = &unk_2645E90A0;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __97__DMCBYODEnrollmentFlowUIPresenter_managementDetailsOverviewViewController_didReceiveUserAction___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 managedAppleID];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __97__DMCBYODEnrollmentFlowUIPresenter_managementDetailsOverviewViewController_didReceiveUserAction___block_invoke_2;
  v4[3] = &unk_2645E93C0;
  void v4[4] = *(void *)(a1 + 32);
  [v2 _showCancelAlertForMAID:v3 actionHandler:v4];
}

void __97__DMCBYODEnrollmentFlowUIPresenter_managementDetailsOverviewViewController_didReceiveUserAction___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) consentCompletionHandler];

    if (v3)
    {
      BOOL v4 = [*(id *)(a1 + 32) consentCompletionHandler];
      v4[2](v4, 0);

      uint64_t v5 = *(void **)(a1 + 32);
      [v5 setConsentCompletionHandler:0];
    }
  }
}

- (void)requestUserConsentWithCloudConfig:(id)a3 completionHandler:(id)a4
{
  [(DMCBYODEnrollmentFlowUIPresenter *)self setConsentCompletionHandler:a4];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__DMCBYODEnrollmentFlowUIPresenter_requestUserConsentWithCloudConfig_completionHandler___block_invoke;
  block[3] = &unk_2645E90A0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __88__DMCBYODEnrollmentFlowUIPresenter_requestUserConsentWithCloudConfig_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[DMCEnrollmentConsentViewController alloc] initWithDelegate:*(void *)(a1 + 32) username:@"Cloud Config Test" profile:0];
  [*(id *)(a1 + 32) pushViewController:v2];
}

- (void)fetchEnrollmentProfileWithWebAuthURL:(id)a3 machineInfo:(id)a4 anchorCertificateRefs:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [(DMCBYODEnrollmentFlowUIPresenter *)self setWebURLCompletionHandler:a6];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __125__DMCBYODEnrollmentFlowUIPresenter_fetchEnrollmentProfileWithWebAuthURL_machineInfo_anchorCertificateRefs_completionHandler___block_invoke;
  v16[3] = &unk_2645E8FD8;
  id v17 = v10;
  id v18 = self;
  id v19 = v11;
  id v20 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v16);
}

void __125__DMCBYODEnrollmentFlowUIPresenter_fetchEnrollmentProfileWithWebAuthURL_machineInfo_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(DMCTestWebViewController);
  [(DMCTestWebViewController *)v2 setWebURL:*(void *)(a1 + 32)];
  [(DMCTestWebViewController *)v2 setDelegate:*(void *)(a1 + 40)];
  [(DMCTestWebViewController *)v2 setMachineInfo:*(void *)(a1 + 48)];
  [(DMCTestWebViewController *)v2 setAnchorCerts:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) pushViewController:v2];
}

- (void)requestMDMUsernameAndPasswordWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__DMCBYODEnrollmentFlowUIPresenter_requestMDMUsernameAndPasswordWithCompletionHandler___block_invoke;
  v6[3] = &unk_2645E9348;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __87__DMCBYODEnrollmentFlowUIPresenter_requestMDMUsernameAndPasswordWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) usernameViewController];

  if (!v2)
  {
    id v3 = objc_opt_new();
    [v3 setDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setUsernameViewController:v3];
  }
  [*(id *)(a1 + 32) setUsernameAndPasswordCompletionHandler:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) usernameViewController];
  [v4 setUsernameEditable:1];

  id v5 = [*(id *)(a1 + 32) usernameViewController];
  [v5 setUsername:@"user"];

  id v6 = [*(id *)(a1 + 32) usernameViewController];
  [v6 showPasswordField:1];

  id v7 = [*(id *)(a1 + 32) usernameViewController];
  [v7 setInProgress:0];

  id v8 = [*(id *)(a1 + 32) usernameViewController];
  [v8 setStyle:0];

  [*(id *)(a1 + 32) setHasDoneAuthServices:0];
  id v9 = *(void **)(a1 + 32);
  id v10 = [v9 usernameViewController];
  [v9 pushViewController:v10];
}

- (void)ensureNetworkConnectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__DMCBYODEnrollmentFlowUIPresenter_ensureNetworkConnectionWithCompletionHandler___block_invoke;
  block[3] = &unk_2645E90A0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  id v5 = [DMCTestNetworkMonitor alloc];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __81__DMCBYODEnrollmentFlowUIPresenter_ensureNetworkConnectionWithCompletionHandler___block_invoke_2;
  id v11 = &unk_2645E9320;
  id v12 = v4;
  id v6 = v4;
  id v7 = [(DMCTestNetworkMonitor *)v5 initWithNetworkAvailableHandler:&v8];
  [(DMCTestNetworkMonitor *)v7 startMonitoring];
}

void __81__DMCBYODEnrollmentFlowUIPresenter_ensureNetworkConnectionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activityController];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    DMCLocalizedStringByDevice();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 presentActivityPageWithText:v4 showButtomView:0];
  }
}

uint64_t __81__DMCBYODEnrollmentFlowUIPresenter_ensureNetworkConnectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)webAuthCanceled:(id)a3
{
  id v6 = a3;
  id v4 = [(DMCBYODEnrollmentFlowUIPresenter *)self webURLCompletionHandler];

  if (v4)
  {
    id v5 = [(DMCBYODEnrollmentFlowUIPresenter *)self webURLCompletionHandler];
    ((void (**)(void, void, BOOL))v5)[2](v5, 0, v6 == 0);

    [(DMCBYODEnrollmentFlowUIPresenter *)self setWebURLCompletionHandler:0];
  }
}

- (void)recievedProfile:(id)a3
{
  id v6 = a3;
  id v4 = [(DMCBYODEnrollmentFlowUIPresenter *)self webURLCompletionHandler];

  if (v4)
  {
    id v5 = [(DMCBYODEnrollmentFlowUIPresenter *)self webURLCompletionHandler];
    ((void (**)(void, id, void, void))v5)[2](v5, v6, 0, 0);

    [(DMCBYODEnrollmentFlowUIPresenter *)self setWebURLCompletionHandler:0];
  }
}

- (id)_fakeAppleAccountWithAuthenticationResults:(id)a3 personaID:(id)a4 store:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x263EFB1F8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 alloc];
  id v12 = [v8 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAE58]];

  id v13 = (void *)[v11 initWithAccountType:v12];
  uint64_t v14 = *MEMORY[0x263F29010];
  id v15 = [v10 objectForKeyedSubscript:*MEMORY[0x263F29010]];
  [v13 setAccountDescription:v15];

  BOOL v16 = [v10 objectForKeyedSubscript:v14];
  [v13 setUsername:v16];

  objc_msgSend(v13, "dmc_setPersonaIdentifier:", v9);
  objc_msgSend(v13, "aa_setAccountClass:", *MEMORY[0x263F25610]);
  id v17 = [v10 objectForKeyedSubscript:*MEMORY[0x263F28F58]];
  objc_msgSend(v13, "dmc_setAltDSID:", v17);

  id v18 = [v10 objectForKeyedSubscript:*MEMORY[0x263F28F80]];
  objc_msgSend(v13, "dmc_setDSID:", v18);

  id v19 = [v10 objectForKeyedSubscript:*MEMORY[0x263F28FA8]];
  objc_msgSend(v13, "aa_setFirstName:", v19);

  id v20 = [v10 objectForKeyedSubscript:*MEMORY[0x263F28FE0]];

  objc_msgSend(v13, "aa_setLastName:", v20);
  [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isManagedAppleID"];
  [v13 setAuthenticated:1];
  return v13;
}

- (id)_fakeiTunesAccountWithAuthenticationResults:(id)a3 personaID:(id)a4 store:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x263EFB1F8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 alloc];
  id v12 = [v8 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFB000]];

  id v13 = (void *)[v11 initWithAccountType:v12];
  uint64_t v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F29010]];
  [v13 setUsername:v14];

  objc_msgSend(v13, "dmc_setPersonaIdentifier:", v9);
  id v15 = [v10 objectForKeyedSubscript:*MEMORY[0x263F28F58]];
  objc_msgSend(v13, "dmc_setAltDSID:", v15);

  BOOL v16 = [v10 objectForKeyedSubscript:*MEMORY[0x263F28FA8]];
  objc_msgSend(v13, "aa_setFirstName:", v16);

  id v17 = [v10 objectForKeyedSubscript:*MEMORY[0x263F28FE0]];

  objc_msgSend(v13, "aa_setLastName:", v17);
  [v13 setActive:0];
  [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isManagedAppleID"];
  [v13 setAuthenticated:1];
  return v13;
}

- (DMCEnrollmentAuthenticationViewController)usernameViewController
{
  return self->_usernameViewController;
}

- (void)setUsernameViewController:(id)a3
{
}

- (id)usernameCompletionHandler
{
  return self->_usernameCompletionHandler;
}

- (void)setUsernameCompletionHandler:(id)a3
{
}

- (id)ESSOApplicationInstallationCompletionHandler
{
  return self->_ESSOApplicationInstallationCompletionHandler;
}

- (void)setESSOApplicationInstallationCompletionHandler:(id)a3
{
}

- (BOOL)hasDoneAuthServices
{
  return self->_hasDoneAuthServices;
}

- (void)setHasDoneAuthServices:(BOOL)a3
{
  self->_hasDoneAuthServices = a3;
}

- (void)setAuthenticationController:(id)a3
{
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (void)setManagedAppleID:(id)a3
{
}

- (DMCEnrollmentConsentViewController)consentViewController
{
  return self->_consentViewController;
}

- (void)setConsentViewController:(id)a3
{
}

- (id)consentCompletionHandler
{
  return self->_consentCompletionHandler;
}

- (void)setConsentCompletionHandler:(id)a3
{
}

- (id)profileInstallationCompletionHandler
{
  return self->_profileInstallationCompletionHandler;
}

- (void)setProfileInstallationCompletionHandler:(id)a3
{
}

- (id)authenticationActionHandler
{
  return self->_authenticationActionHandler;
}

- (void)setAuthenticationActionHandler:(id)a3
{
}

- (DMCInstallProfileQuestionViewController)questionsController
{
  return self->_questionsController;
}

- (void)setQuestionsController:(id)a3
{
}

- (id)userInputCompletionHandler
{
  return self->_userInputCompletionHandler;
}

- (void)setUserInputCompletionHandler:(id)a3
{
}

- (id)iCloudPromotionCompletionHandler
{
  return self->_iCloudPromotionCompletionHandler;
}

- (void)setICloudPromotionCompletionHandler:(id)a3
{
}

- (id)restoreCompletionHandler
{
  return self->_restoreCompletionHandler;
}

- (void)setRestoreCompletionHandler:(id)a3
{
}

- (id)webURLCompletionHandler
{
  return self->_webURLCompletionHandler;
}

- (void)setWebURLCompletionHandler:(id)a3
{
}

- (id)usernameAndPasswordCompletionHandler
{
  return self->_usernameAndPasswordCompletionHandler;
}

- (void)setUsernameAndPasswordCompletionHandler:(id)a3
{
}

- (id)authenticationCompletionHandler
{
  return self->_authenticationCompletionHandler;
}

- (void)setAuthenticationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authenticationCompletionHandler, 0);
  objc_storeStrong(&self->_usernameAndPasswordCompletionHandler, 0);
  objc_storeStrong(&self->_webURLCompletionHandler, 0);
  objc_storeStrong(&self->_restoreCompletionHandler, 0);
  objc_storeStrong(&self->_iCloudPromotionCompletionHandler, 0);
  objc_storeStrong(&self->_userInputCompletionHandler, 0);
  objc_storeStrong((id *)&self->_questionsController, 0);
  objc_storeStrong(&self->_authenticationActionHandler, 0);
  objc_storeStrong(&self->_profileInstallationCompletionHandler, 0);
  objc_storeStrong(&self->_consentCompletionHandler, 0);
  objc_storeStrong((id *)&self->_consentViewController, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong(&self->_ESSOApplicationInstallationCompletionHandler, 0);
  objc_storeStrong(&self->_usernameCompletionHandler, 0);
  objc_storeStrong((id *)&self->_usernameViewController, 0);
}

@end