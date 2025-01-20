@interface DMCEnrollmentConsentViewController
- (BOOL)isEqual:(id)a3;
- (DMCEnrollmentConfirmationView)confirmationView;
- (DMCEnrollmentConsentViewController)initWithDelegate:(id)a3 username:(id)a4 profile:(id)a5;
- (DMCEnrollmentConsentViewControllerDelegate)delegate;
- (DMCEnrollmentTableViewPlatterCell)infoCell;
- (MCProfile)profile;
- (NSNumber)requiredAppID;
- (NSString)orgName;
- (NSString)serverURL;
- (NSString)username;
- (id)_cellDataForESSOBYODDisclosure;
- (id)_cellDataForLearnMoreButton;
- (id)_commonCellDataForRegularBYODDisclosure;
- (id)_platterCellDataForRegularADDEDisclosure;
- (id)_platterCellDataForRegularADUEDisclosure;
- (id)_platterCellDataWithImage:(id)a3 text:(id)a4;
- (id)_requiredAppCellData;
- (id)_serverURLWithoutHTTP:(id)a3;
- (void)_requiredAppCellData;
- (void)_setupManagementDetailsLinkTextForCell:(id)a3;
- (void)loadView;
- (void)setConfirmationView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInfoCell:(id)a3;
- (void)setOrgName:(id)a3;
- (void)setProfile:(id)a3;
- (void)setRequiredAppID:(id)a3;
- (void)setServerURL:(id)a3;
- (void)setUsername:(id)a3;
- (void)updateContinueButtonStatus;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DMCEnrollmentConsentViewController

- (DMCEnrollmentConsentViewController)initWithDelegate:(id)a3 username:(id)a4 profile:(id)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = DMCLocalizedString();
  v33.receiver = self;
  v33.super_class = (Class)DMCEnrollmentConsentViewController;
  v12 = [(DMCEnrollmentTemplateTableViewController *)&v33 initWithIconNames:&unk_26D44B020 title:v11 subTitle:0];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    username = v12->_username;
    v12->_username = (NSString *)v13;

    objc_storeStrong((id *)&v12->_profile, a5);
    objc_storeWeak((id *)&v12->_delegate, v8);
    uint64_t v15 = [v10 hasRequiredAppIDForMDM];
    requiredAppID = v12->_requiredAppID;
    v12->_requiredAppID = (NSNumber *)v15;

    if (v10)
    {
      v17 = [v10 payloadsWithClass:objc_opt_class()];
      v18 = [v17 firstObject];

      v19 = [v10 organization];
      uint64_t v20 = [v19 copy];
      orgName = v12->_orgName;
      v12->_orgName = (NSString *)v20;

      v22 = [v18 serverURLString];
      uint64_t v23 = [(DMCEnrollmentConsentViewController *)v12 _serverURLWithoutHTTP:v22];
      serverURL = v12->_serverURL;
      v12->_serverURL = (NSString *)v23;

      v25 = [(DMCEnrollmentConsentViewController *)v12 _commonCellDataForRegularBYODDisclosure];
      [(DMCEnrollmentTemplateTableViewController *)v12 addCellData:v25 animated:0];
      v26 = [v18 enrollmentMode];
      int v27 = [v26 isEqualToString:*MEMORY[0x263F529B8]];

      if (v27)
      {
        v28 = [(DMCEnrollmentConsentViewController *)v12 _platterCellDataForRegularADDEDisclosure];
        v35[0] = v28;
        v29 = (void **)v35;
      }
      else
      {
        v28 = [(DMCEnrollmentConsentViewController *)v12 _platterCellDataForRegularADUEDisclosure];
        v34 = v28;
        v29 = &v34;
      }
      v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
      [(DMCEnrollmentTemplateTableViewController *)v12 addSectionWithCellData:v31 animated:0];
    }
    else
    {
      v18 = [(DMCEnrollmentConsentViewController *)v12 _cellDataForESSOBYODDisclosure];
      v30 = [(DMCEnrollmentConsentViewController *)v12 _cellDataForLearnMoreButton];
      [v18 addObject:v30];

      [(DMCEnrollmentTemplateTableViewController *)v12 addCellData:v18 animated:0];
    }
  }
  return v12;
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)DMCEnrollmentConsentViewController;
  [(DMCEnrollmentConsentViewController *)&v12 loadView];
  objc_initWeak(&location, self);
  v3 = [DMCEnrollmentConfirmationView alloc];
  v4 = DMCLocalizedString();
  v5 = DMCLocalizedString();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__DMCEnrollmentConsentViewController_loadView__block_invoke;
  v9[3] = &unk_2645E9398;
  objc_copyWeak(&v10, &location);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__DMCEnrollmentConsentViewController_loadView__block_invoke_2;
  v7[3] = &unk_2645E9398;
  objc_copyWeak(&v8, &location);
  v6 = [(DMCEnrollmentConfirmationView *)v3 initWithConfirmationText:v4 cancelText:v5 confirmationAction:v9 cancelAction:v7];

  [(DMCEnrollmentTemplateTableViewController *)self addBottomView:v6];
  [(DMCEnrollmentConsentViewController *)self setConfirmationView:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __46__DMCEnrollmentConsentViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 consentViewController:v3 didReceiveUserAction:1];

    id WeakRetained = v3;
  }
}

void __46__DMCEnrollmentConsentViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 consentViewController:v3 didReceiveUserAction:0];

    id WeakRetained = v3;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DMCEnrollmentConsentViewController;
  [(DMCEnrollmentTemplateTableViewController *)&v5 viewWillAppear:a3];
  v4 = [(DMCEnrollmentConsentViewController *)self navigationItem];
  [v4 setHidesBackButton:1];

  [(DMCEnrollmentConsentViewController *)self setModalInPresentation:1];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DMCEnrollmentConsentViewController *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v6 = [(DMCEnrollmentConsentViewController *)self username];
      v7 = [(DMCEnrollmentConsentViewController *)v5 username];
      if ([v6 isEqualToString:v7])
      {
        id v8 = [(DMCEnrollmentConsentViewController *)self orgName];
        id v9 = [(DMCEnrollmentConsentViewController *)v5 orgName];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (void)updateContinueButtonStatus
{
  BOOL v3 = [(DMCEnrollmentTemplateTableViewController *)self inProgress];
  id v4 = [(DMCEnrollmentConsentViewController *)self confirmationView];
  [v4 setInProgress:v3];
}

- (id)_commonCellDataForRegularBYODDisclosure
{
  BOOL v3 = objc_opt_new();
  id v4 = [DMCEnrollmentTableViewTextCell alloc];
  objc_super v5 = DMCLocalizedString();
  v6 = [(DMCEnrollmentTableViewTextCell *)v4 initWithText:v5 bold:0];
  [v3 addObject:v6];

  v7 = [DMCEnrollmentTableViewTextCell alloc];
  id v8 = [(DMCEnrollmentConsentViewController *)self orgName];
  id v9 = [(DMCEnrollmentConsentViewController *)self serverURL];
  char v10 = [(DMCEnrollmentTableViewTextCell *)v7 initWithText:v8 bold:1 subText:v9 layoutStyle:0];
  [v3 addObject:v10];

  return v3;
}

- (id)_platterCellDataForRegularADUEDisclosure
{
  BOOL v3 = [MEMORY[0x263F1C6B0] systemImageNamed:@"person.line.dotted.person.fill"];
  id v4 = DMCLocalizedString();
  objc_super v5 = [(DMCEnrollmentConsentViewController *)self _platterCellDataWithImage:v3 text:v4];

  return v5;
}

- (id)_platterCellDataForRegularADDEDisclosure
{
  v13[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle.fill"];
  id v4 = (void *)MEMORY[0x263F1C6C8];
  objc_super v5 = [MEMORY[0x263F1C550] systemWhiteColor];
  v13[0] = v5;
  v6 = [MEMORY[0x263F1C550] systemOrangeColor];
  v13[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  id v8 = [v4 configurationWithPaletteColors:v7];

  id v9 = [v3 imageWithConfiguration:v8];

  char v10 = DMCLocalizedStringByDevice();
  v11 = [(DMCEnrollmentConsentViewController *)self _platterCellDataWithImage:v9 text:v10];

  return v11;
}

- (id)_platterCellDataWithImage:(id)a3 text:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [DMCEnrollmentTableViewIconCell alloc];
  v23[0] = v6;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  char v10 = [(DMCEnrollmentTableViewIconCell *)v8 initWithIconImages:v9 layoutStyle:1];

  v11 = [[DMCEnrollmentTableViewTextCell alloc] initWithText:v7 bold:0 subText:0 layoutStyle:1];
  objc_super v12 = [[DMCEnrollmentTableViewTextCell alloc] initWithText:&stru_26D435FC0 bold:0 subText:0 layoutStyle:1];
  [(DMCEnrollmentConsentViewController *)self _setupManagementDetailsLinkTextForCell:v12];
  v22[0] = v10;
  v22[1] = v11;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v14 = (void *)[v13 mutableCopy];

  uint64_t v15 = [(DMCEnrollmentConsentViewController *)self _requiredAppCellData];
  if (v15) {
    [v14 insertObject:v15 atIndex:1];
  }
  [v14 addObject:v12];
  v16 = [DMCEnrollmentTableViewPlatterCell alloc];
  v21 = v14;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  v18 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
  v19 = [(DMCEnrollmentTableViewPlatterCell *)v16 initWithCellData:v17 parentTableView:v18 useShadow:1];

  return v19;
}

- (void)_setupManagementDetailsLinkTextForCell:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_super v5 = DMCLocalizedString();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__DMCEnrollmentConsentViewController__setupManagementDetailsLinkTextForCell___block_invoke;
  v6[3] = &unk_2645E9398;
  objc_copyWeak(&v7, &location);
  [v4 configureLinkText:v5 forceLineBreak:0 linkAction:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __77__DMCEnrollmentConsentViewController__setupManagementDetailsLinkTextForCell___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__DMCEnrollmentConsentViewController__setupManagementDetailsLinkTextForCell___block_invoke_2;
    block[3] = &unk_2645E90A0;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __77__DMCEnrollmentConsentViewController__setupManagementDetailsLinkTextForCell___block_invoke_2(uint64_t a1)
{
  v2 = [DMCProfileViewModel alloc];
  BOOL v3 = [*(id *)(a1 + 32) profile];
  id v7 = [(DMCProfileViewModel *)v2 initWithProfile:v3 managedPayloads:0];

  id v4 = [[DMCProfileDetailsViewController alloc] initWithProfileViewModel:v7 mode:1];
  objc_super v5 = DMCLocalizedString();
  [(DMCProfileDetailsViewController *)v4 setTableTitle:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v4];
  if ([MEMORY[0x263F38B98] isPad]) {
    [v6 setModalPresentationStyle:2];
  }
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

- (id)_requiredAppCellData
{
  v32[1] = *MEMORY[0x263EF8340];
  if (self->_requiredAppID)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    BOOL v3 = (void *)getSKStoreProductViewControllerClass_softClass;
    uint64_t v30 = getSKStoreProductViewControllerClass_softClass;
    if (!getSKStoreProductViewControllerClass_softClass)
    {
      id location = (id)MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      v24 = __getSKStoreProductViewControllerClass_block_invoke;
      v25 = &unk_2645E94A8;
      v26 = &v27;
      __getSKStoreProductViewControllerClass_block_invoke((uint64_t)&location);
      BOOL v3 = (void *)v28[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v27, 8);
    id v5 = objc_alloc_init(v4);
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    id v6 = (id *)getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr;
    uint64_t v30 = getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr;
    if (!getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr)
    {
      id location = (id)MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      v24 = __getSKStoreProductParameterITunesItemIdentifierSymbolLoc_block_invoke;
      v25 = &unk_2645E94A8;
      v26 = &v27;
      id v7 = (void *)StoreKitLibrary();
      id v8 = dlsym(v7, "SKStoreProductParameterITunesItemIdentifier");
      *(void *)(v26[1] + 24) = v8;
      getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr = *(void *)(v26[1] + 24);
      id v6 = (id *)v28[3];
    }
    _Block_object_dispose(&v27, 8);
    if (!v6) {
      -[DMCEnrollmentConsentViewController _requiredAppCellData]();
    }
    requiredAppID = self->_requiredAppID;
    id v31 = *v6;
    v32[0] = requiredAppID;
    char v10 = NSDictionary;
    id v11 = v31;
    objc_super v12 = [v10 dictionaryWithObjects:v32 forKeys:&v31 count:1];
    [v5 loadProductWithParameters:v12 completionBlock:&__block_literal_global_0];

    [v5 setShowsStoreButton:0];
    [v5 setShowsRightBarButton:0];
    uint64_t v13 = [DMCEnrollmentTableViewTextCell alloc];
    v14 = DMCLocalizedString();
    uint64_t v15 = [(DMCEnrollmentTableViewTextCell *)v13 initWithText:v14 bold:0 subText:0 layoutStyle:1];

    objc_initWeak(&location, self);
    v16 = DMCLocalizedString();
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __58__DMCEnrollmentConsentViewController__requiredAppCellData__block_invoke_60;
    v19[3] = &unk_2645E9480;
    objc_copyWeak(&v21, &location);
    id v17 = v5;
    id v20 = v17;
    [(DMCEnrollmentTableViewTextCell *)v15 configureLinkText:v16 forceLineBreak:0 linkAction:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

void __58__DMCEnrollmentConsentViewController__requiredAppCellData__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    id v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_221CC5000, v5, OS_LOG_TYPE_ERROR, "Could not load product info for store!! : %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __58__DMCEnrollmentConsentViewController__requiredAppCellData__block_invoke_60(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __58__DMCEnrollmentConsentViewController__requiredAppCellData__block_invoke_2;
  v2[3] = &unk_2645E9480;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);

  objc_destroyWeak(&v4);
}

void __58__DMCEnrollmentConsentViewController__requiredAppCellData__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
    id WeakRetained = v3;
  }
}

- (id)_cellDataForLearnMoreButton
{
  id v3 = [[DMCEnrollmentTableViewTextCell alloc] initWithText:&stru_26D435FC0 bold:0];
  objc_initWeak(&location, self);
  id v4 = DMCLocalizedString();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__DMCEnrollmentConsentViewController__cellDataForLearnMoreButton__block_invoke;
  v6[3] = &unk_2645E9398;
  objc_copyWeak(&v7, &location);
  [(DMCEnrollmentTableViewTextCell *)v3 configureLinkText:v4 forceLineBreak:0 linkAction:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v3;
}

void __65__DMCEnrollmentConsentViewController__cellDataForLearnMoreButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__DMCEnrollmentConsentViewController__cellDataForLearnMoreButton__block_invoke_2;
    block[3] = &unk_2645E90A0;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __65__DMCEnrollmentConsentViewController__cellDataForLearnMoreButton__block_invoke_2(uint64_t a1)
{
  return +[DMCEnrollmentAboutRemoteManagementViewController presentAboutRemoteManagementViewControllerWithBaseViewController:*(void *)(a1 + 32)];
}

- (id)_cellDataForESSOBYODDisclosure
{
  v2 = objc_opt_new();
  id v3 = [DMCEnrollmentTableViewTextCell alloc];
  id v4 = DMCLocalizedString();
  id v5 = [(DMCEnrollmentTableViewTextCell *)v3 initWithText:v4 bold:0];
  [v2 addObject:v5];

  int v6 = [DMCEnrollmentTableViewTextCell alloc];
  id v7 = DMCLocalizedString();
  uint64_t v8 = [(DMCEnrollmentTableViewTextCell *)v6 initWithText:v7 bold:0];
  [v2 addObject:v8];

  id v9 = [DMCEnrollmentTableViewTextCell alloc];
  char v10 = DMCLocalizedString();
  id v11 = [(DMCEnrollmentTableViewTextCell *)v9 initWithText:v10 bold:0];
  [v2 addObject:v11];

  return v2;
}

- (id)_serverURLWithoutHTTP:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "dmc_substringWithPattern:", @".*:\\/\\/(.*)");
  id v5 = v4;
  if (!v4) {
    id v4 = v3;
  }
  id v6 = v4;

  return v6;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)orgName
{
  return self->_orgName;
}

- (void)setOrgName:(id)a3
{
}

- (NSString)serverURL
{
  return self->_serverURL;
}

- (void)setServerURL:(id)a3
{
}

- (NSNumber)requiredAppID
{
  return self->_requiredAppID;
}

- (void)setRequiredAppID:(id)a3
{
}

- (MCProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (DMCEnrollmentConsentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMCEnrollmentConsentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DMCEnrollmentTableViewPlatterCell)infoCell
{
  return self->_infoCell;
}

- (void)setInfoCell:(id)a3
{
}

- (DMCEnrollmentConfirmationView)confirmationView
{
  return self->_confirmationView;
}

- (void)setConfirmationView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationView, 0);
  objc_storeStrong((id *)&self->_infoCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_requiredAppID, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_orgName, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (void)_requiredAppCellData
{
}

@end