@interface FAFamilyInvitationAcceptanceViewController
- (FAFamilyInvitationAcceptanceViewController)initWithInvite:(id)a3 appleAccount:(id)a4 grandSlamSigner:(id)a5;
- (id)_createCancelButton;
- (void)_cancelButtonWasTapped:(id)a3;
- (void)_loadiTunesLinkingRemoteUI;
- (void)_sendUserToiTunesSettings;
- (void)_showErrorAlert;
- (void)confirmIdentityViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)remoteUIController:(id)a3 willLoadRequest:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIControllerDidDismiss:(id)a3;
@end

@implementation FAFamilyInvitationAcceptanceViewController

- (FAFamilyInvitationAcceptanceViewController)initWithInvite:(id)a3 appleAccount:(id)a4 grandSlamSigner:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [[FAConfirmIdentityViewController alloc] initWithAppleAccount:v10 grandSlamSigner:v11];
  [(FAConfirmIdentityViewController *)v12 setDelegate:self];
  v22.receiver = self;
  v22.super_class = (Class)FAFamilyInvitationAcceptanceViewController;
  v13 = [(FAFamilyInvitationAcceptanceViewController *)&v22 initWithRootViewController:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_grandSlamSigner, a5);
    objc_storeStrong((id *)&v14->_invite, a3);
    objc_storeStrong((id *)&v14->_account, a4);
    uint64_t v15 = [v11 accountStore];
    accountStore = v14->_accountStore;
    v14->_accountStore = (ACAccountStore *)v15;

    v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    inviteOperationQueue = v14->_inviteOperationQueue;
    v14->_inviteOperationQueue = v17;

    v19 = [(FAConfirmIdentityViewController *)v12 navigationItem];
    v20 = [(FAFamilyInvitationAcceptanceViewController *)v14 _createCancelButton];
    [v19 setLeftBarButtonItem:v20];
  }
  return v14;
}

- (id)_createCancelButton
{
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"CLOSE_BUTTON_TITLE" value:&stru_26CA2C800 table:@"Localizable"];
  v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel__cancelButtonWasTapped_];

  return v6;
}

- (void)_cancelButtonWasTapped:(id)a3
{
  id v4 = [(FAFamilyInvitationAcceptanceViewController *)self delegate];
  [v4 familyInvitationAcceptanceViewController:self didCompleteWithSuccess:0];
}

- (void)confirmIdentityViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  if (a4)
  {
    [(FAFamilyInvitationAcceptanceViewController *)self _loadiTunesLinkingRemoteUI];
  }
  else
  {
    id v5 = [(FAFamilyInvitationAcceptanceViewController *)self delegate];
    [v5 familyInvitationAcceptanceViewController:self didCompleteWithSuccess:0];
  }
}

- (void)_showErrorAlert
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"COULD_NOT_CONNECT_TO_ICLOUD" value:&stru_26CA2C800 table:@"Localizable"];

  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"OK" value:&stru_26CA2C800 table:@"Localizable"];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__FAFamilyInvitationAcceptanceViewController__showErrorAlert__block_invoke;
  v8[3] = &unk_2643489F8;
  v8[4] = self;
  v7 = [MEMORY[0x263F82418] alertWithTitle:v4 message:0 buttonTitle:v6 actionHandler:v8];
  [(FAFamilyInvitationAcceptanceViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __61__FAFamilyInvitationAcceptanceViewController__showErrorAlert__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 familyInvitationAcceptanceViewController:*(void *)(a1 + 32) didCompleteWithSuccess:0];
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v5 = (void *)MEMORY[0x263F637D0];
  id v6 = a4;
  id v7 = [v5 setupAssistantModalStyle];
  [v7 applyToObjectModel:v6];
}

- (void)remoteUIController:(id)a3 willLoadRequest:(id)a4
{
  v18 = (NSMutableURLRequest *)a4;
  objc_storeStrong((id *)&self->_currentRemoteUIRequest, a4);
  id v6 = v18;
  if (self->_startRemoteUIRequest != v18)
  {
    id v7 = [(NSMutableURLRequest *)v18 URL];
    v8 = [v7 absoluteString];
    int v9 = [v8 containsString:@"prefs:itunes"];

    if (v9)
    {
      [(FAFamilyInvitationAcceptanceViewController *)self _sendUserToiTunesSettings];
    }
    else
    {
      id v10 = [(NSMutableURLRequest *)v18 URL];
      id v11 = [v10 absoluteString];
      int v12 = [v11 containsString:@"prefs:icloud"];

      if (v12)
      {
        v13 = [(FAFamilyInvitationAcceptanceViewController *)self delegate];
        [v13 familyInvitationAcceptanceViewController:self didCompleteWithSuccess:0];
      }
      else
      {
        [(NSMutableURLRequest *)v18 aa_addBasicAuthorizationHeaderWithAccount:self->_account preferUsingPassword:0];
        [(NSMutableURLRequest *)v18 aa_addLoggedInAppleIDHeaderWithAccount:self->_account];
        [(NSMutableURLRequest *)v18 aa_addDeviceInternalDevHeaderIfEnabled];
        [(NSMutableURLRequest *)v18 aa_addDeviceIDHeader];
        [(NSMutableURLRequest *)v18 aa_addLocationSharingAllowedHeader];
        v14 = [MEMORY[0x263F25820] clientInfoHeader];
        [(NSMutableURLRequest *)v18 setValue:v14 forHTTPHeaderField:@"X-MMe-Client-Info"];

        uint64_t v15 = [MEMORY[0x263EFF960] currentLocale];
        v16 = [v15 objectForKey:*MEMORY[0x263EFF4D0]];
        v17 = [v16 uppercaseString];
        [(NSMutableURLRequest *)v18 setValue:v17 forHTTPHeaderField:@"X-MMe-Country"];

        [(AAGrandSlamSigner *)self->_grandSlamSigner signURLRequest:v18 isUserInitiated:1];
      }
    }
    id v6 = v18;
  }
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  if ([(NSMutableURLRequest *)self->_currentRemoteUIRequest aa_addDeviceProvisioningInfoHeadersWithDSIDFromReponse:a4])
  {
    id v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "Device is provisioned... Reissuing request...", v6, 2u);
    }

    [(AAUIRemoteUIController *)self->_remoteUIController loadRequest:self->_currentRemoteUIRequest completion:&__block_literal_global_14];
  }
}

void __88__FAFamilyInvitationAcceptanceViewController_remoteUIController_didReceiveHTTPResponse___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "Failed to load Family Setup remote UI: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  id v4 = [(FAFamilyInvitationAcceptanceViewController *)self delegate];
  [v4 familyInvitationAcceptanceViewController:self didCompleteWithSuccess:1];
}

- (void)_loadiTunesLinkingRemoteUI
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  id v4 = objc_msgSend(v3, "ams_activeiTunesAccount");

  id v5 = [(AAFamilyRequest *)[FAFamilySetupBuddyMLRequest alloc] initWithGrandSlamSigner:self->_grandSlamSigner];
  [(FAFamilySetupBuddyMLRequest *)v5 setiTunesAccount:v4];
  int v6 = [(FAFamilyInvite *)self->_invite code];
  [(FAFamilySetupBuddyMLRequest *)v5 setInviteCode:v6];

  id v7 = [(FAFamilySetupBuddyMLRequest *)v5 urlRequest];
  uint64_t v8 = (NSMutableURLRequest *)[v7 mutableCopy];
  startRemoteUIRequest = self->_startRemoteUIRequest;
  self->_startRemoteUIRequest = v8;

  id v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "Will load Family Setup remote UI using request: %@", buf, 0xCu);
  }

  id v11 = (AAUIRemoteUIController *)objc_alloc_init(MEMORY[0x263F25D30]);
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = v11;

  [(AAUIRemoteUIController *)self->_remoteUIController setDelegate:self];
  [(AAUIRemoteUIController *)self->_remoteUIController setNavigationController:self];
  v13 = self->_remoteUIController;
  v14 = self->_startRemoteUIRequest;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__FAFamilyInvitationAcceptanceViewController__loadiTunesLinkingRemoteUI__block_invoke;
  v15[3] = &unk_264349538;
  v15[4] = self;
  [(AAUIRemoteUIController *)v13 loadRequest:v14 completion:v15];
}

void __72__FAFamilyInvitationAcceptanceViewController__loadiTunesLinkingRemoteUI__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    int v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Failed to load Family Setup remote UI: %@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) _showErrorAlert];
  }
}

- (void)_sendUserToiTunesSettings
{
  id v3 = [(FAFamilyInvitationAcceptanceViewController *)self delegate];
  [v3 familyInvitationAcceptanceViewController:self didCompleteWithSuccess:0];

  dispatch_time_t v4 = dispatch_time(0, 500000000);
  id v5 = MEMORY[0x263EF83A0];
  dispatch_after(v4, v5, &__block_literal_global_58_0);
}

void __71__FAFamilyInvitationAcceptanceViewController__sendUserToiTunesSettings__block_invoke()
{
  uint64_t v2 = 0;
  v0 = [MEMORY[0x263F3C010] urlDestinationTo:6 error:&v2];
  v1 = [MEMORY[0x263F01880] defaultWorkspace];
  [v1 openSensitiveURL:v0 withOptions:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRemoteUIRequest, 0);
  objc_storeStrong((id *)&self->_startRemoteUIRequest, 0);
  objc_storeStrong((id *)&self->_inviteOperationQueue, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_invite, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end