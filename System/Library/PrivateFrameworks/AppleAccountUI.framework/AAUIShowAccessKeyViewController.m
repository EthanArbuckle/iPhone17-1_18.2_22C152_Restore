@interface AAUIShowAccessKeyViewController
- (AAUIShowAccessKeyViewController)initWithAppleAccount:(id)a3 localContactInfo:(id)a4 accessKey:(id)a5 accessKeyQRCodeImage:(id)a6;
- (id)_specifiersForShowAccessKey;
- (id)specifiers;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (void)_printTapped:(id)a3;
- (void)_setTableSeparatorInset;
- (void)_setupNavigationBar;
- (void)inviteMessageCompleteSecondaryButtonTapped:(id)a3;
- (void)inviteMessageFlowDidFinish:(id)a3;
- (void)inviteMessageWasSent:(id)a3 completion:(id)a4;
- (void)viewDidLoad;
@end

@implementation AAUIShowAccessKeyViewController

- (AAUIShowAccessKeyViewController)initWithAppleAccount:(id)a3 localContactInfo:(id)a4 accessKey:(id)a5 accessKeyQRCodeImage:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AAUIShowAccessKeyViewController;
  v15 = [(AAUIShowAccessKeyViewController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appleAccount, a3);
    v17 = objc_alloc_init(AAUIAccountContactsSpecifierCreator);
    specifierCreator = v16->_specifierCreator;
    v16->_specifierCreator = v17;

    objc_storeStrong((id *)&v16->_localContact, a4);
    objc_storeStrong((id *)&v16->_accessKey, a5);
    objc_storeStrong((id *)&v16->_qrCodeImage, a6);
  }

  return v16;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIShowAccessKeyViewController;
  [(AAUIShowAccessKeyViewController *)&v3 viewDidLoad];
  [(AAUIShowAccessKeyViewController *)self _setupNavigationBar];
  [(AAUIShowAccessKeyViewController *)self _setTableSeparatorInset];
}

- (void)_setupNavigationBar
{
  id v4 = [(AAUIShowAccessKeyViewController *)self navigationItem];
  if (([(AALocalContactInfo *)self->_localContact contactType] & 4) != 0) {
    [MEMORY[0x263F259B0] showAccessKeyBeneficiaryTitle];
  }
  else {
  objc_super v3 = [MEMORY[0x263F259B0] showAccessKeyBenefactorTitle];
  }
  [v4 setTitle:v3];
}

- (void)_setTableSeparatorInset
{
  id v2 = [(AAUIShowAccessKeyViewController *)self table];
  objc_msgSend(v2, "setSeparatorInset:", 0.0, 0.0, 3.0, 0.0);
}

- (id)specifiers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "AAUIShowAccessKeyViewController is loading specifiers.", (uint8_t *)&v11, 2u);
    }

    v5 = [(AAUIShowAccessKeyViewController *)self _specifiersForShowAccessKey];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;
  }
  v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v3);
    int v11 = 138412290;
    uint64_t v12 = v8;
    _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "AAUIShowAccessKeyViewController specifiers: returning %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v9;
}

- (id)_specifiersForShowAccessKey
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [MEMORY[0x263F259B0] showAccessKeyCellTitle];
  char v5 = [(AALocalContactInfo *)self->_localContact contactType];
  v6 = NSString;
  if ((v5 & 4) != 0) {
    [MEMORY[0x263F259B0] showAccessKeyBeneficiarySubtitle];
  }
  else {
  v7 = [MEMORY[0x263F259B0] showAccessKeyBenefactorSubtitle];
  }
  uint64_t v8 = [(AALocalContactInfo *)self->_localContact firstName];
  v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);

  v10 = [(AAUIAccountContactsSpecifierCreator *)self->_specifierCreator createTableCellWithName:v4 title:v4 longSubtitle:v9 image:0];
  [v3 addObject:v10];
  int v11 = +[AAUIInheritanceAccessKeyCell specifierForAcessKey:self->_accessKey qrCodeImage:self->_qrCodeImage];
  [v3 addObject:v11];
  uint64_t v12 = [MEMORY[0x263F259B0] showAccessKeyPrintTitle];
  uint64_t v13 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v13 setButtonAction:sel__printTapped_];
  [v3 addObject:v13];
  id v14 = (void *)[v3 copy];

  return v14;
}

- (void)_printTapped:(id)a3
{
  int v11 = [[AAUIInheritanceAccessKeyPDFGenerator alloc] initWithAppleAccount:self->_appleAccount localContactInfo:self->_localContact];
  id v4 = [(AAUIInheritanceAccessKeyPDFGenerator *)v11 createPDFDocumentData];
  if ([MEMORY[0x263F61090] canPrintData:v4])
  {
    char v5 = [MEMORY[0x263F61088] printInfo];
    v6 = NSString;
    v7 = [(AALocalContactInfo *)self->_localContact firstName];
    uint64_t v8 = [MEMORY[0x263F259B0] printAccessKeyDocumentTitle];
    v9 = [v6 stringWithFormat:@"%@ - %@", v7, v8];
    [v5 setJobName:v9];

    [v5 setOrientation:0];
    [v5 setOutputType:2];
    v10 = [MEMORY[0x263F61090] sharedPrintController];
    [v10 setPrintInfo:v5];
    [v10 setShowsNumberOfCopies:1];
    [v10 setPrintingItem:v4];
    [v10 presentAnimated:1 completionHandler:&__block_literal_global_24];
  }
}

void __48__AAUIShowAccessKeyViewController__printTapped___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a4;
  if (v4)
  {
    char v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Error presenting printInteractionController - %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)inviteMessageFlowDidFinish:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = (objc_class *)objc_opt_class();
    int v6 = NSStringFromClass(v5);
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "%@ : Resend Invite flow did finish", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [v3 navigationController];

  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (void)inviteMessageWasSent:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "%@ : Sending IDS Message to Beneficiary", buf, 0xCu);
  }
  v9 = objc_opt_new();
  uint64_t v10 = [(AALocalContactInfo *)self->_localContact inheritanceContactInfo];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__AAUIShowAccessKeyViewController_inviteMessageWasSent_completion___block_invoke;
  v12[3] = &unk_263F92DC8;
  v12[4] = self;
  id v13 = v5;
  id v11 = v5;
  [v9 sendInvitationToContact:v10 completion:v12];
}

void __67__AAUIShowAccessKeyViewController_inviteMessageWasSent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__AAUIShowAccessKeyViewController_inviteMessageWasSent_completion___block_invoke_2;
  block[3] = &unk_263F92DA0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __67__AAUIShowAccessKeyViewController_inviteMessageWasSent_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = _AALogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke_2_cold_1(a1, v2);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v4();
  }
}

- (void)inviteMessageCompleteSecondaryButtonTapped:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__AAUIShowAccessKeyViewController_inviteMessageCompleteSecondaryButtonTapped___block_invoke;
  block[3] = &unk_263F92168;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __78__AAUIShowAccessKeyViewController_inviteMessageCompleteSecondaryButtonTapped___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationController];
  [v1 dismissViewControllerAnimated:1 completion:&__block_literal_global_54_0];
}

void __78__AAUIShowAccessKeyViewController_inviteMessageCompleteSecondaryButtonTapped___block_invoke_2()
{
  [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=accountContactDetails"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x263F01880] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6 = objc_msgSend(a3, "cellForRowAtIndexPath:", a4, a5.x, a5.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __93__AAUIShowAccessKeyViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    v9[3] = &unk_263F947A0;
    v9[4] = self;
    id v7 = [MEMORY[0x263F82610] configurationWithIdentifier:0 previewProvider:0 actionProvider:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __93__AAUIShowAccessKeyViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F823D0];
  id v3 = [MEMORY[0x263F259B0] showAccessKeyCopyTitle];
  uint64_t v4 = [MEMORY[0x263F827E8] systemImageNamed:@"doc.on.doc"];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __93__AAUIShowAccessKeyViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v10[3] = &unk_263F94778;
  v10[4] = *(void *)(a1 + 32);
  id v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:v10];

  id v6 = (void *)MEMORY[0x263F82940];
  v11[0] = v5;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v8 = [v6 menuWithChildren:v7];

  return v8;
}

void __93__AAUIShowAccessKeyViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82A18] generalPasteboard];
  [v2 setString:*(void *)(*(void *)(a1 + 32) + 1408)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteFlowController, 0);
  objc_storeStrong((id *)&self->_qrCodeImage, 0);
  objc_storeStrong((id *)&self->_accessKey, 0);
  objc_storeStrong((id *)&self->_localContact, 0);
  objc_storeStrong((id *)&self->_specifierCreator, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

@end