@interface AMSUIManageSubsriptionSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (AIDAAccountManager)accountManager;
- (AMSUIManageSubsriptionSpecifierProvider)initWithAccountManager:(id)a3;
- (BOOL)_isSingleIdentity;
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (NSArray)specifiers;
- (PSSpecifier)activelyLoadingSpecifier;
- (id)_appleAccount;
- (id)_findViewController;
- (id)_storeAccount;
- (void)_subscriptionsSpecifierWasTapped:(id)a3;
- (void)dealloc;
- (void)setAccountManager:(id)a3;
- (void)setActivelyLoadingSpecifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation AMSUIManageSubsriptionSpecifierProvider

- (AMSUIManageSubsriptionSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIManageSubsriptionSpecifierProvider;
  v6 = [(AMSUIManageSubsriptionSpecifierProvider *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    objc_initWeak(&location, v7);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__AMSUIManageSubsriptionSpecifierProvider_initWithAccountManager___block_invoke;
    v9[3] = &unk_2643E3D80;
    objc_copyWeak(&v10, &location);
    [v5 addAccountChangeObserver:v7 handler:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __66__AMSUIManageSubsriptionSpecifierProvider_initWithAccountManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v8)
  {
    v8 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = AMSLogKey();
    v11 = NSString;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = v12;
    if (v10)
    {
      a3 = AMSLogKey();
      [v11 stringWithFormat:@"%@: [%@] ", v13, a3];
    }
    else
    {
      [v11 stringWithFormat:@"%@: ", v12];
    v14 = };
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v14;
    _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_INFO, "%{public}@-[AIDAAccountManager addAccountChangeObserver:handler:] handler called", buf, 0xCu);
    if (v10)
    {

      v14 = a3;
    }
  }
  if (WeakRetained)
  {
    v15 = getAIDAServiceTypeStore();
    v16 = [v5 objectForKeyedSubscript:v15];

    v17 = getAIDAServiceTypeStore();
    v18 = [v6 objectForKeyedSubscript:v17];

    v19 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
    if (!v19)
    {
      v19 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v20 = [v19 OSLogObject];
    id v49 = v6;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v47 = v5;
      v21 = AMSLogKey();
      v22 = NSString;
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = v23;
      if (v21)
      {
        AMSLogKey();
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        [v22 stringWithFormat:@"%@: [%@] ", v24, v6];
      }
      else
      {
        [v22 stringWithFormat:@"%@: ", v23];
      v25 = };
      v26 = AMSHashIfNeeded();
      v27 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2114;
      v54 = v27;
      _os_log_impl(&dword_21C134000, v20, OS_LOG_TYPE_DEBUG, "%{public}@-[AIDAAccountManager addAccountChangeObserver:handler:] called with old account: %{public}@, new account: %{public}@", buf, 0x20u);
      if (v21)
      {

        v25 = v6;
      }

      id v5 = v47;
      id v6 = v49;
    }

    if ((v18 != 0) != (v16 != 0))
    {
      int v28 = 1;
    }
    else
    {
      uint64_t v29 = objc_msgSend(v16, "ams_DSID");
      uint64_t v30 = objc_msgSend(v18, "ams_DSID");
      v31 = (void *)v30;
      if (v29 && v30)
      {
        if (v18) {
          int v28 = [(id)v29 isEqualToNumber:v30] ^ 1;
        }
        else {
          int v28 = 0;
        }
      }
      else
      {
        int v28 = (v29 | v30) != 0;
      }
    }
    v32 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
    if (!v32)
    {
      v32 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v33 = [v32 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v48 = v16;
      id v34 = v5;
      v35 = AMSLogKey();
      v36 = NSString;
      uint64_t v37 = objc_opt_class();
      uint64_t v38 = v37;
      if (v35)
      {
        AMSLogKey();
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        [v36 stringWithFormat:@"%@: [%@] ", v38, v6];
      }
      else
      {
        [v36 stringWithFormat:@"%@: ", v37];
      v39 = };
      v40 = @"false";
      if (v28) {
        v40 = @"true";
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v40;
      _os_log_impl(&dword_21C134000, v33, OS_LOG_TYPE_DEBUG, "%{public}@didChangeAccounts: %{public}@", buf, 0x16u);
      if (v35)
      {

        v39 = v6;
      }

      id v5 = v34;
      v16 = v48;
      id v6 = v49;
    }

    if (v28)
    {
      v41 = [WeakRetained specifiers];
      v42 = (void *)[v41 copy];

      [WeakRetained setSpecifiers:0];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __66__AMSUIManageSubsriptionSpecifierProvider_initWithAccountManager___block_invoke_44;
      v50[3] = &unk_2643E34D0;
      id v51 = WeakRetained;
      id v52 = v42;
      v43 = v50;
      id v44 = v42;
      v45 = AMSLogKey();
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_3;
      v54 = &unk_2643E33B0;
      id v55 = v45;
      id v56 = v43;
      id v46 = v45;
      dispatch_async(MEMORY[0x263EF83A0], buf);
    }
  }
}

void __66__AMSUIManageSubsriptionSpecifierProvider_initWithAccountManager___block_invoke_44(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v3)
  {
    v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = AMSLogKey();
    id v6 = NSString;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = v7;
    if (v5)
    {
      uint64_t v1 = AMSLogKey();
      [v6 stringWithFormat:@"%@: [%@] ", v8, v1];
    }
    else
    {
      [v6 stringWithFormat:@"%@: ", v7];
    v9 = };
    id v10 = [*(id *)(a1 + 32) delegate];
    v11 = AMSHashIfNeeded();
    uint64_t v12 = AMSHashIfNeeded();
    uint64_t v13 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544386;
    v16 = v9;
    __int16 v17 = 2114;
    v18 = v11;
    __int16 v19 = 2114;
    v20 = v12;
    __int16 v21 = 2114;
    v22 = v13;
    __int16 v23 = 2114;
    uint64_t v24 = @"false";
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling -[AAUISpecifierProviderDelegate reloadSpecifiersForProvider:oldSpecifiers:animated:] on delegate: %{public}@ with provider: %{public}@, oldSpecifiers: %{public}@, animated: %{public}@", buf, 0x34u);

    if (v5)
    {

      v9 = (void *)v1;
    }
  }
  v14 = [*(id *)(a1 + 32) delegate];
  [v14 reloadSpecifiersForProvider:*(void *)(a1 + 32) oldSpecifiers:*(void *)(a1 + 40) animated:0];
}

- (void)dealloc
{
  v3 = [(AMSUIManageSubsriptionSpecifierProvider *)self accountManager];
  [v3 removeAccountChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AMSUIManageSubsriptionSpecifierProvider;
  [(AMSUIManageSubsriptionSpecifierProvider *)&v4 dealloc];
}

- (NSArray)specifiers
{
  v20[1] = *MEMORY[0x263EF8340];
  specifiers = self->_specifiers;
  if (specifiers) {
    goto LABEL_2;
  }
  id v5 = [(AMSUIManageSubsriptionSpecifierProvider *)self _storeAccount];

  if (!v5)
  {
    __int16 v19 = self->_specifiers;
    self->_specifiers = (NSArray *)MEMORY[0x263EFFA68];

    specifiers = self->_specifiers;
LABEL_2:
    v3 = specifiers;
    goto LABEL_9;
  }
  id v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  uint64_t v7 = AMSUILocalizedStringFromBundle(@"APPLEID_SUBSCRIPTIONS_CELL_TITLE", 0, v6);

  uint64_t v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:2 edit:0];
  [v8 setControllerLoadAction:sel__subscriptionsSpecifierWasTapped_];
  [v8 setIdentifier:@"SUBSCRIPTIONS"];
  if (![(AMSUIManageSubsriptionSpecifierProvider *)self _isSingleIdentity])
  {
    [v8 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    v9 = NSNumber;
    id v10 = [(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);
    double v12 = *MEMORY[0x263F839B8];
    if (!IsAccessibilityCategory) {
      double v12 = 58.0;
    }
    uint64_t v13 = [v9 numberWithDouble:v12];

    [v8 setProperty:v13 forKey:*MEMORY[0x263F602A8]];
    [v8 setProperty:v7 forKey:*MEMORY[0x263F602D0]];
    v14 = [(AMSUIManageSubsriptionSpecifierProvider *)self _storeAccount];
    v15 = objc_msgSend(v14, "aa_formattedUsername");
    [v8 setProperty:v15 forKey:*MEMORY[0x263F602C8]];
  }
  v20[0] = v8;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  __int16 v17 = self->_specifiers;
  self->_specifiers = v16;

  v3 = self->_specifiers;
LABEL_9:
  return v3;
}

- (BOOL)_isSingleIdentity
{
  v3 = [(AMSUIManageSubsriptionSpecifierProvider *)self _appleAccount];
  uint64_t v4 = [(AMSUIManageSubsriptionSpecifierProvider *)self _storeAccount];
  id v5 = (void *)v4;
  char v6 = 1;
  if (v3 && v4)
  {
    uint64_t v7 = objc_msgSend(v3, "ams_altDSID");
    uint64_t v8 = objc_msgSend(v5, "ams_altDSID");
    if ([v7 length] && objc_msgSend(v8, "length"))
    {
      char v6 = [v7 isEqualToString:v8];
    }
    else
    {
      v9 = objc_msgSend(v3, "ams_DSID");
      uint64_t v10 = objc_msgSend(v5, "ams_DSID");
      v11 = (void *)v10;
      if (v10) {
        double v12 = (void *)v10;
      }
      else {
        double v12 = &unk_26CC73658;
      }
      char v6 = [v9 isEqualToNumber:v12];
    }
  }

  return v6;
}

- (id)_appleAccount
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v3 = (void *)getAIDAServiceTypeCloudSymbolLoc_ptr_0;
  uint64_t v10 = getAIDAServiceTypeCloudSymbolLoc_ptr_0;
  if (!getAIDAServiceTypeCloudSymbolLoc_ptr_0)
  {
    uint64_t v4 = (void *)AppleIDSSOAuthenticationLibrary_0();
    v8[3] = (uint64_t)dlsym(v4, "AIDAServiceTypeCloud");
    getAIDAServiceTypeCloudSymbolLoc_ptr_0 = v8[3];
    v3 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3) {
    getAIDAServiceTypeCloud_cold_1();
  }
  id v5 = [v2 objectForKeyedSubscript:*v3];

  return v5;
}

- (id)_storeAccount
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = getAIDAServiceTypeStore();
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

- (void)_subscriptionsSpecifierWasTapped:(id)a3
{
  id v21 = a3;
  uint64_t v4 = [(AMSUIManageSubsriptionSpecifierProvider *)self delegate];
  [v4 specifierProvider:self willBeginLoadingSpecifier:v21];

  id v5 = objc_alloc_init(MEMORY[0x263F27D80]);
  char v6 = +[AMSUISubscriptionsViewController bagKeySet];
  [v5 unionBagKeySet:v6];

  uint64_t v7 = [NSURL URLWithString:@"https://apps.mzstatic.com/content/54a1317a0ad442d3965d64ef6bfaae1c/"];
  [v5 addBagKey:@"manageSubscriptionsV2Url" valueType:5 defaultValue:v7];

  uint64_t v8 = +[AMSUISubscriptionsViewController bagSubProfile];
  uint64_t v9 = +[AMSUISubscriptionsViewController bagSubProfileVersion];
  [MEMORY[0x263F27B40] registerBagKeySet:v5 forProfile:v8 profileVersion:v9];
  uint64_t v10 = [MEMORY[0x263F27B28] bagForProfile:v8 profileVersion:v9];
  v11 = AMSSetLogKey();
  double v12 = [v10 URLForKey:@"manageSubscriptionsV2Url"];
  uint64_t v13 = [AMSUIWebViewController alloc];
  v14 = [(AMSUIManageSubsriptionSpecifierProvider *)self _storeAccount];
  v15 = [(AMSUIWebViewController *)v13 initWithBag:v10 account:v14 clientInfo:0];

  v16 = +[AMSUIWebAppearance tableViewAppearance];
  [(AMSUIWebViewController *)v15 setAppearance:v16];

  [(AMSUIWebViewController *)v15 setDelegate:self];
  __int16 v17 = [(AMSUIWebViewController *)v15 loadBagValue:v12];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __76__AMSUIManageSubsriptionSpecifierProvider__subscriptionsSpecifierWasTapped___block_invoke;
  v22[3] = &unk_2643E3DD0;
  id v23 = v11;
  uint64_t v24 = self;
  uint64_t v25 = v15;
  id v26 = v21;
  id v18 = v21;
  __int16 v19 = v15;
  id v20 = v11;
  [v17 addFinishBlock:v22];
}

void __76__AMSUIManageSubsriptionSpecifierProvider__subscriptionsSpecifierWasTapped___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__AMSUIManageSubsriptionSpecifierProvider__subscriptionsSpecifierWasTapped___block_invoke_2;
  block[3] = &unk_2643E3DA8;
  id v8 = *(id *)(a1 + 32);
  id v9 = v4;
  id v5 = *(void **)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = v5;
  id v12 = *(id *)(a1 + 56);
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __76__AMSUIManageSubsriptionSpecifierProvider__subscriptionsSpecifierWasTapped___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = (id)AMSSetLogKey();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x263F27CB8] sharedConfig];
  id v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = AMSLogKey();
      uint64_t v9 = *(void *)(a1 + 40);
      int v17 = 138543874;
      uint64_t v18 = v7;
      __int16 v19 = 2114;
      id v20 = v8;
      __int16 v21 = 2114;
      uint64_t v22 = v9;
      uint64_t v10 = "%{public}@: [%{public}@] Failed to load manage subscription. %{public}@";
      id v11 = v6;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_10:
      _os_log_impl(&dword_21C134000, v11, v12, v10, (uint8_t *)&v17, v13);
    }
  }
  else
  {
    if (!v4)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      id v8 = AMSLogKey();
      int v17 = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      id v20 = v8;
      uint64_t v10 = "%{public}@: [%{public}@] Presenting manage subs";
      id v11 = v6;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 22;
      goto LABEL_10;
    }
  }

  v15 = [*(id *)(a1 + 48) delegate];
  [v15 specifierProvider:*(void *)(a1 + 48) showViewController:*(void *)(a1 + 56)];

  v16 = [*(id *)(a1 + 48) delegate];
  [v16 specifierProvider:*(void *)(a1 + 48) didFinishLoadingSpecifier:*(void *)(a1 + 64)];
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [AMSUIAuthenticateTask alloc];
  uint64_t v10 = [(AMSUIManageSubsriptionSpecifierProvider *)self _findViewController];
  os_log_type_t v12 = [(AMSUIAuthenticateTask *)v9 initWithRequest:v8 presentingViewController:v10];

  id v11 = [(AMSAuthenticateTask *)v12 performAuthentication];
  [v11 addFinishBlock:v7];
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [AMSUIAlertDialogTask alloc];
  uint64_t v10 = [(AMSUIManageSubsriptionSpecifierProvider *)self _findViewController];
  os_log_type_t v12 = [(AMSUIAlertDialogTask *)v9 initWithRequest:v8 presentingViewController:v10];

  id v11 = [(AMSUIAlertDialogTask *)v12 present];
  [v11 addFinishBlock:v7];
}

- (id)_findViewController
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v3 = [v2 windows];
  uint64_t v4 = [v3 firstObject];
  id v5 = [v4 rootViewController];

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

@end