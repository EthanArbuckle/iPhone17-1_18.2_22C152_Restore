@interface SKAccountPageSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (AIDAAccountManager)accountManager;
- (BOOL)_isSingleIdentity;
- (BOOL)handleURL:(id)a3;
- (NSArray)specifiers;
- (PSSpecifier)activelyLoadingSpecifier;
- (SKAccountPageSpecifierProvider)initWithAccountManager:(id)a3;
- (id)_appleAccount;
- (id)_storeAccount;
- (uint64_t)_appleAccount;
- (void)_accountPageSpecifierWasTapped:(id)a3;
- (void)_viewAccountPageSpecifierWasTapped:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setActivelyLoadingSpecifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation SKAccountPageSpecifierProvider

- (SKAccountPageSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKAccountPageSpecifierProvider;
  v6 = [(SKAccountPageSpecifierProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (NSArray)specifiers
{
  v19[1] = *MEMORY[0x1E4F143B8];
  specifiers = self->_specifiers;
  if (specifiers)
  {
    v3 = specifiers;
  }
  else
  {
    id v5 = [(SKAccountPageSpecifierProvider *)self _storeAccount];

    if (v5)
    {
      v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v7 = [v6 localizedStringForKey:@"APPLEID_ACCOUNT_PAGE_CELL_TITLE" value:&stru_1F08A7B80 table:0];
      v8 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:2 edit:0];
      [v8 setControllerLoadAction:sel__accountPageSpecifierWasTapped_];
      [v8 setIdentifier:@"STORE_SERVICE"];
      [v8 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F931D0]];
      [v8 setProperty:@"com.apple.AppStore" forKey:*MEMORY[0x1E4F931C0]];
      if (![(SKAccountPageSpecifierProvider *)self _isSingleIdentity])
      {
        [v8 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
        objc_super v9 = NSNumber;
        v10 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
        BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);
        double v12 = *MEMORY[0x1E4FB2F28];
        if (!IsAccessibilityCategory) {
          double v12 = 58.0;
        }
        v13 = [v9 numberWithDouble:v12];

        [v8 setProperty:v13 forKey:*MEMORY[0x1E4F93218]];
        [v8 setProperty:v7 forKey:*MEMORY[0x1E4F93240]];
        v14 = [(SKAccountPageSpecifierProvider *)self _storeAccount];
        v15 = objc_msgSend(v14, "aa_formattedUsername");
        [v8 setProperty:v15 forKey:*MEMORY[0x1E4F93230]];
      }
      v19[0] = v8;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      v17 = self->_specifiers;
      self->_specifiers = v16;

      v3 = self->_specifiers;
    }
    else
    {
      v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v3;
}

- (BOOL)_isSingleIdentity
{
  v3 = [(SKAccountPageSpecifierProvider *)self _appleAccount];
  uint64_t v4 = [(SKAccountPageSpecifierProvider *)self _storeAccount];
  id v5 = (void *)v4;
  char v6 = 1;
  if (v3 && v4)
  {
    v7 = objc_msgSend(v3, "ams_altDSID");
    v8 = objc_msgSend(v5, "ams_altDSID");
    if ([v7 length] && objc_msgSend(v8, "length"))
    {
      char v6 = [v7 isEqualToString:v8];
    }
    else
    {
      objc_super v9 = objc_msgSend(v3, "ams_DSID");
      uint64_t v10 = objc_msgSend(v5, "ams_DSID");
      v11 = (void *)v10;
      if (v10) {
        double v12 = (void *)v10;
      }
      else {
        double v12 = &unk_1F08C0DD8;
      }
      char v6 = [v9 isEqualToNumber:v12];
    }
  }

  return v6;
}

- (id)_appleAccount
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v3 = (void *)getAIDAServiceTypeCloudSymbolLoc_ptr;
  uint64_t v11 = getAIDAServiceTypeCloudSymbolLoc_ptr;
  if (!getAIDAServiceTypeCloudSymbolLoc_ptr)
  {
    uint64_t v4 = (void *)AppleIDSSOAuthenticationLibrary();
    v9[3] = (uint64_t)dlsym(v4, "AIDAServiceTypeCloud");
    getAIDAServiceTypeCloudSymbolLoc_ptr = v9[3];
    v3 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    v7 = (_Unwind_Exception *)-[SKAccountPageSpecifierProvider _appleAccount]();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  id v5 = [v2 objectForKeyedSubscript:*v3];

  return v5;
}

- (id)_storeAccount
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v3 = (void *)getAIDAServiceTypeStoreSymbolLoc_ptr;
  uint64_t v11 = getAIDAServiceTypeStoreSymbolLoc_ptr;
  if (!getAIDAServiceTypeStoreSymbolLoc_ptr)
  {
    uint64_t v4 = (void *)AppleIDSSOAuthenticationLibrary();
    v9[3] = (uint64_t)dlsym(v4, "AIDAServiceTypeStore");
    getAIDAServiceTypeStoreSymbolLoc_ptr = v9[3];
    v3 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    v7 = (_Unwind_Exception *)-[SKAccountPageSpecifierProvider _appleAccount]();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  id v5 = [v2 objectForKeyedSubscript:*v3];

  return v5;
}

- (void)_accountPageSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(SKAccountPageSpecifierProvider *)self delegate];
  [v5 specifierProvider:self willBeginLoadingSpecifier:v4];

  char v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  uint64_t v8 = (void *)MEMORY[0x1E4FB1410];
  objc_super v9 = [v6 localizedStringForKey:@"SIGN_OUT" value:&stru_1F08A7B80 table:0];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke;
  v38[3] = &unk_1E5FAAAB0;
  id v10 = v6;
  id v39 = v10;
  v40 = self;
  id v11 = v4;
  id v41 = v11;
  double v12 = [v8 actionWithTitle:v9 style:2 handler:v38];
  [v7 addAction:v12];

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2050000000;
  v13 = (void *)getAMSBiometricsClass_softClass;
  uint64_t v46 = getAMSBiometricsClass_softClass;
  if (!getAMSBiometricsClass_softClass)
  {
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __getAMSBiometricsClass_block_invoke;
    v42[3] = &unk_1E5FA9A30;
    v42[4] = &v43;
    __getAMSBiometricsClass_block_invoke((uint64_t)v42);
    v13 = (void *)v44[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v43, 8);
  v15 = [(SKAccountPageSpecifierProvider *)self _storeAccount];
  LOBYTE(v14) = [v14 isAvailableForAccount:v15];

  if ((v14 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E4FB1410];
    v17 = [v10 localizedStringForKey:@"PASSWORD_SETTINGS" value:&stru_1F08A7B80 table:0];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_6;
    v36[3] = &unk_1E5FAAA60;
    v36[4] = self;
    id v37 = v11;
    v18 = [v16 actionWithTitle:v17 style:0 handler:v36];
    [v7 addAction:v18];
  }
  v19 = (void *)MEMORY[0x1E4FB1410];
  v20 = [v10 localizedStringForKey:@"VIEW_ACCOUNT" value:&stru_1F08A7B80 table:0];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_7;
  v34[3] = &unk_1E5FAAA60;
  v34[4] = self;
  id v21 = v11;
  id v35 = v21;
  v22 = [v19 actionWithTitle:v20 style:0 handler:v34];
  [v7 addAction:v22];

  v23 = (void *)MEMORY[0x1E4FB1410];
  v24 = [v10 localizedStringForKey:@"CANCEL" value:&stru_1F08A7B80 table:0];
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_8;
  v31 = &unk_1E5FAAA60;
  v32 = self;
  id v33 = v21;
  id v25 = v21;
  v26 = [v23 actionWithTitle:v24 style:1 handler:&v28];
  objc_msgSend(v7, "addAction:", v26, v28, v29, v30, v31, v32);

  v27 = [(SKAccountPageSpecifierProvider *)self delegate];
  [v27 specifierProvider:self showViewController:v7];
}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1418];
  v3 = [*(id *)(a1 + 32) localizedStringForKey:@"ARE_YOU_SURE" value:&stru_1F08A7B80 table:0];
  id v4 = [*(id *)(a1 + 32) localizedStringForKey:@"CONFIRM_BLURB" value:&stru_1F08A7B80 table:0];
  id v5 = [v2 alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  char v6 = (void *)MEMORY[0x1E4FB1410];
  v7 = [*(id *)(a1 + 32) localizedStringForKey:@"CANCEL" value:&stru_1F08A7B80 table:0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_2;
  v21[3] = &unk_1E5FAAA60;
  uint64_t v8 = *(void **)(a1 + 48);
  v21[4] = *(void *)(a1 + 40);
  id v22 = v8;
  objc_super v9 = [v6 actionWithTitle:v7 style:1 handler:v21];
  [v5 addAction:v9];

  id v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = [*(id *)(a1 + 32) localizedStringForKey:@"SIGN_OUT" value:&stru_1F08A7B80 table:0];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_3;
  v18 = &unk_1E5FAAA60;
  double v12 = *(void **)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 40);
  id v20 = v12;
  v13 = [v10 actionWithTitle:v11 style:2 handler:&v15];
  objc_msgSend(v5, "addAction:", v13, v15, v16, v17, v18, v19);

  id v14 = [*(id *)(a1 + 40) delegate];
  [v14 specifierProvider:*(void *)(a1 + 40) showViewController:v5];
}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 specifierProvider:*(void *)(a1 + 32) didFinishLoadingSpecifier:*(void *)(a1 + 40)];
}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _storeAccount];
  [v2 setActive:0];
  v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v4 = objc_msgSend(v3, "ams_saveAccount:", v2);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_4;
  v6[3] = &unk_1E5FAAA88;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 addFinishBlock:v6];
}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_4(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_5;
  v2[3] = &unk_1E5FAA6D8;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 specifierProvider:*(void *)(a1 + 32) didFinishLoadingSpecifier:*(void *)(a1 + 40)];
}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v4 = (void *)getAMSUIPasswordSettingsViewControllerClass_softClass;
  uint64_t v16 = getAMSUIPasswordSettingsViewControllerClass_softClass;
  if (!getAMSUIPasswordSettingsViewControllerClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getAMSUIPasswordSettingsViewControllerClass_block_invoke;
    v12[3] = &unk_1E5FA9A30;
    v12[4] = &v13;
    __getAMSUIPasswordSettingsViewControllerClass_block_invoke((uint64_t)v12);
    id v4 = (void *)v14[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v13, 8);
  id v6 = [v5 alloc];
  id v7 = [*(id *)(a1 + 32) _storeAccount];
  uint64_t v8 = (void *)[v6 initWithAccount:v7];

  objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v8];
  id v10 = [*(id *)(a1 + 32) delegate];
  [v10 specifierProvider:*(void *)(a1 + 32) showViewController:v9];

  id v11 = [*(id *)(a1 + 32) delegate];
  [v11 specifierProvider:*(void *)(a1 + 32) didFinishLoadingSpecifier:*(void *)(a1 + 40)];
}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) _viewAccountPageSpecifierWasTapped:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 specifierProvider:*(void *)(a1 + 32) didFinishLoadingSpecifier:*(void *)(a1 + 40)];
}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 specifierProvider:*(void *)(a1 + 32) didFinishLoadingSpecifier:*(void *)(a1 + 40)];
}

- (void)_viewAccountPageSpecifierWasTapped:(id)a3
{
  id v6 = [[SKAccountPageViewController alloc] initWithAccountURL:0];
  id v4 = [(SKAccountPageSpecifierProvider *)self _storeAccount];
  [(SKAccountPageViewController *)v6 setAccount:v4];

  id v5 = [(SKAccountPageSpecifierProvider *)self delegate];
  [v5 specifierProvider:self showViewController:v6];
}

- (BOOL)handleURL:(id)a3
{
  id v4 = [a3 valueForKey:@"path"];
  int v5 = [v4 isEqualToString:@"VIEW_ACCOUNT"];
  if (v5)
  {
    id v6 = [(SKAccountPageSpecifierProvider *)self specifiers];
    id v7 = [v6 firstObject];

    uint64_t v8 = [(SKAccountPageSpecifierProvider *)self delegate];
    [v8 specifierProvider:self willBeginLoadingSpecifier:v7];

    [(SKAccountPageSpecifierProvider *)self _viewAccountPageSpecifierWasTapped:v7];
    objc_super v9 = [(SKAccountPageSpecifierProvider *)self delegate];
    [v9 specifierProvider:self didFinishLoadingSpecifier:v7];
  }
  return v5;
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (PSSpecifier)activelyLoadingSpecifier
{
  return self->_activelyLoadingSpecifier;
}

- (void)setActivelyLoadingSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activelyLoadingSpecifier, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (uint64_t)_appleAccount
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getAMSBiometricsClass_block_invoke_cold_1(v0);
}

@end