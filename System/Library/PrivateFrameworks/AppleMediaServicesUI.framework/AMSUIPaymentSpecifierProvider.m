@interface AMSUIPaymentSpecifierProvider
+ (BOOL)_accountsChangedFromAccount:(id)a3 toAccount:(id)a4;
- (AAUISpecifierProviderDelegate)delegate;
- (AIDAAccountManager)accountManager;
- (AMSUIPaymentSpecifierProvider)initWithAccountManager:(id)a3;
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (NSArray)specifiers;
- (NSString)paymentSummaryDescription;
- (id)_findViewController;
- (id)_grandSlamAccount;
- (void)_loadControllerForSpecifier:(id)a3;
- (void)dealloc;
- (void)setAccountManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPaymentSummaryDescription:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation AMSUIPaymentSpecifierProvider

- (void)setPaymentSummaryDescription:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_paymentSummaryDescription, "isEqualToString:"))
  {
    v4 = (NSString *)[v7 copy];
    paymentSummaryDescription = self->_paymentSummaryDescription;
    self->_paymentSummaryDescription = v4;

    v6 = [(AMSUIPaymentSpecifierProvider *)self delegate];
    [v6 reloadSpecifierForProvider:self identifier:@"PAYMENT_AND_SHIPPING"];
  }
}

- (AMSUIPaymentSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIPaymentSpecifierProvider;
  v6 = [(AMSUIPaymentSpecifierProvider *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    objc_initWeak(&location, v7);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__AMSUIPaymentSpecifierProvider_initWithAccountManager___block_invoke;
    v9[3] = &unk_2643E3D80;
    objc_copyWeak(&v10, &location);
    [v5 addAccountChangeObserver:v7 handler:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __56__AMSUIPaymentSpecifierProvider_initWithAccountManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = 0x263F27000uLL;
  v9 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v9)
  {
    v9 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = AMSLogKey();
    objc_super v12 = NSString;
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = v13;
    if (v11)
    {
      a3 = AMSLogKey();
      [v12 stringWithFormat:@"%@: [%@] ", v14, a3];
    }
    else
    {
      [v12 stringWithFormat:@"%@: ", v13];
    v15 = };
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v15;
    _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_INFO, "%{public}@-[AIDAAccountManager addAccountChangeObserver:handler:] handler called", buf, 0xCu);
    if (v11)
    {

      v15 = a3;
    }
  }
  if (WeakRetained)
  {
    v16 = getAIDAServiceTypeStore_0();
    v17 = [v5 objectForKeyedSubscript:v16];

    v18 = getAIDAServiceTypeStore_0();
    v19 = [v6 objectForKeyedSubscript:v18];

    v20 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
    if (!v20)
    {
      v20 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v48 = v5;
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v46 = v6;
      v22 = AMSLogKey();
      v23 = NSString;
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = v24;
      if (v22)
      {
        AMSLogKey();
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        [v23 stringWithFormat:@"%@: [%@] ", v25, v6];
      }
      else
      {
        [v23 stringWithFormat:@"%@: ", v24];
      v26 = };
      v27 = AMSHashIfNeeded();
      v28 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2114;
      v53 = v28;
      _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_DEBUG, "%{public}@-[AIDAAccountManager addAccountChangeObserver:handler:] called with old account: %{public}@, new account: %{public}@", buf, 0x20u);
      if (v22)
      {

        v26 = v6;
      }

      id v6 = v46;
      uint64_t v8 = 0x263F27000uLL;
    }

    int v29 = [(id)objc_opt_class() _accountsChangedFromAccount:v17 toAccount:v19];
    v30 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
    if (!v30)
    {
      v30 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v31 = [v30 OSLogObject];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v47 = v19;
      v32 = v17;
      id v33 = v6;
      v34 = AMSLogKey();
      v35 = NSString;
      uint64_t v36 = objc_opt_class();
      uint64_t v37 = v36;
      if (v34)
      {
        uint64_t v8 = AMSLogKey();
        [v35 stringWithFormat:@"%@: [%@] ", v37, v8];
      }
      else
      {
        [v35 stringWithFormat:@"%@: ", v36];
      v38 = };
      v39 = @"false";
      if (v29) {
        v39 = @"true";
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v39;
      _os_log_impl(&dword_21C134000, v31, OS_LOG_TYPE_DEBUG, "%{public}@didChangeAccounts: %{public}@", buf, 0x16u);
      if (v34)
      {

        v38 = (void *)v8;
      }

      id v6 = v33;
      v17 = v32;
      v19 = v47;
    }

    if (v29)
    {
      v40 = [WeakRetained specifiers];
      v41 = (void *)[v40 copy];

      [WeakRetained setSpecifiers:0];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __56__AMSUIPaymentSpecifierProvider_initWithAccountManager___block_invoke_41;
      v49[3] = &unk_2643E34D0;
      id v50 = WeakRetained;
      id v51 = v41;
      v42 = v49;
      id v43 = v41;
      v44 = AMSLogKey();
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_4;
      v53 = &unk_2643E33B0;
      id v54 = v44;
      id v55 = v42;
      id v45 = v44;
      dispatch_async(MEMORY[0x263EF83A0], buf);
    }
    id v5 = v48;
  }
}

void __56__AMSUIPaymentSpecifierProvider_initWithAccountManager___block_invoke_41(uint64_t a1)
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
    objc_super v12 = AMSHashIfNeeded();
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
  uint64_t v14 = [*(id *)(a1 + 32) delegate];
  [v14 reloadSpecifiersForProvider:*(void *)(a1 + 32) oldSpecifiers:*(void *)(a1 + 40) animated:0];
}

- (void)dealloc
{
  v3 = [(AMSUIPaymentSpecifierProvider *)self accountManager];
  [v3 removeAccountChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AMSUIPaymentSpecifierProvider;
  [(AMSUIPaymentSpecifierProvider *)&v4 dealloc];
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    objc_super v4 = (void *)MEMORY[0x263F5FC40];
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    id v6 = AMSUILocalizedStringFromBundle(@"APPLEID_PAYMENT_CELL_TITLE", 0, v5);
    uint64_t v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:sel__paymentSummaryDescriptionForSpecifier_ detail:0 cell:2 edit:0];

    [v7 setControllerLoadAction:sel__loadControllerForSpecifier_];
    [v7 setIdentifier:@"PAYMENT_AND_SHIPPING"];
    uint64_t v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v7, 0);
    v9 = self->_specifiers;
    self->_specifiers = v8;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [AMSUIAuthenticateTask alloc];
  id v10 = [(AMSUIPaymentSpecifierProvider *)self _findViewController];
  objc_super v12 = [(AMSUIAuthenticateTask *)v9 initWithRequest:v8 presentingViewController:v10];

  v11 = [(AMSAuthenticateTask *)v12 performAuthentication];
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
  v9 = [AMSUIAlertDialogTask alloc];
  id v10 = [(AMSUIPaymentSpecifierProvider *)self _findViewController];
  objc_super v12 = [(AMSUIAlertDialogTask *)v9 initWithRequest:v8 presentingViewController:v10];

  v11 = [(AMSUIAlertDialogTask *)v12 present];
  [v11 addFinishBlock:v7];
}

+ (BOOL)_accountsChangedFromAccount:(id)a3 toAccount:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  id v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6) {
      BOOL v9 = v5 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v6) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v5 == 0;
    }
    LOBYTE(v8) = 1;
    if (v10 && !v9)
    {
      uint64_t v11 = objc_msgSend((id)v5, "ams_DSID");
      uint64_t v12 = objc_msgSend(v7, "ams_DSID");
      uint64_t v13 = (void *)v12;
      if (v11 | v12)
      {
        if (v12) {
          BOOL v14 = v11 == 0;
        }
        else {
          BOOL v14 = 0;
        }
        if (v12) {
          BOOL v15 = 1;
        }
        else {
          BOOL v15 = v11 == 0;
        }
        if (v15 && !v14) {
          int v8 = [(id)v11 isEqualToNumber:v12] ^ 1;
        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_findViewController
{
  v2 = [MEMORY[0x263F82438] sharedApplication];
  v3 = [v2 windows];
  objc_super v4 = [v3 firstObject];
  unint64_t v5 = [v4 rootViewController];

  return v5;
}

- (id)_grandSlamAccount
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  p_grandSlamAccount = &self->_grandSlamAccount;
  grandSlamAccount = self->_grandSlamAccount;
  if (!grandSlamAccount)
  {
    unint64_t v5 = [(AMSUIPaymentSpecifierProvider *)self accountManager];
    unint64_t v6 = [v5 accountStore];
    id v7 = [v5 accounts];
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    int v8 = (void *)getAIDAServiceTypeCloudSymbolLoc_ptr_1;
    uint64_t v41 = getAIDAServiceTypeCloudSymbolLoc_ptr_1;
    if (!getAIDAServiceTypeCloudSymbolLoc_ptr_1)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getAIDAServiceTypeCloudSymbolLoc_block_invoke_1;
      id v43 = &unk_2643E33D8;
      v44 = &v38;
      BOOL v9 = (void *)AppleIDSSOAuthenticationLibrary_1();
      BOOL v10 = dlsym(v9, "AIDAServiceTypeCloud");
      *(void *)(v44[1] + 24) = v10;
      getAIDAServiceTypeCloudSymbolLoc_ptr_1 = *(void *)(v44[1] + 24);
      int v8 = (void *)v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v8) {
      getAIDAServiceTypeCloud_cold_1();
    }
    uint64_t v11 = [v7 objectForKeyedSubscript:*v8];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v12)
      {
        uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      uint64_t v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v14 = objc_opt_class();
        id v15 = v14;
        v16 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v16;
        _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching grandslam account from iCloud account", buf, 0x16u);
      }
      uint64_t v17 = objc_msgSend(v6, "aida_accountForiCloudAccount:", v11);
      v18 = *p_grandSlamAccount;
      *p_grandSlamAccount = (ACAccount *)v17;
    }
    else
    {
      __int16 v19 = [v5 accounts];
      v20 = getAIDAServiceTypeStore_0();
      v18 = [v19 objectForKeyedSubscript:v20];

      if (v18)
      {
        __int16 v21 = [MEMORY[0x263F27CB8] sharedConfig];
        if (!v21)
        {
          __int16 v21 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v22 = [v21 OSLogObject];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v23 = objc_opt_class();
          id v37 = v23;
          uint64_t v24 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v23;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v24;
          _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching grandslam account from store account", buf, 0x16u);
        }
        uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263F26D88]) initWithAccountStore:v6];
        v26 = getAIDAServiceTypeStore_0();
        v27 = [v25 altDSIDForAccount:v18 service:v26];

        uint64_t v28 = objc_msgSend(v6, "aida_accountForAltDSID:", v27);
        int v29 = *p_grandSlamAccount;
        *p_grandSlamAccount = (ACAccount *)v28;
      }
    }

    if (*p_grandSlamAccount)
    {
      v30 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
      v31 = objc_msgSend(v30, "ams_iTunesAccountForAccount:", *p_grandSlamAccount);
      v32 = (ACAccount *)v31;
      if (!v31) {
        v32 = *p_grandSlamAccount;
      }
      objc_storeStrong((id *)p_grandSlamAccount, v32);
    }
    else
    {
      v30 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v30)
      {
        v30 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v31 = [v30 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v33 = objc_opt_class();
        id v34 = v33;
        v35 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v35;
        _os_log_impl(&dword_21C134000, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not fetch GrandSlam Account, we're destined for failure!", buf, 0x16u);
      }
    }

    grandSlamAccount = *p_grandSlamAccount;
  }
  return grandSlamAccount;
}

- (void)_loadControllerForSpecifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(AMSUIPaymentSpecifierProvider *)self delegate];
  [v5 specifierProvider:self willBeginLoadingSpecifier:v4];

  unint64_t v6 = +[AMSUIWebViewController createBagForSubProfile];
  id v7 = [v6 URLForKey:@"paymentsAndShippingUrl"];
  int v8 = [v7 valuePromise];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke;
  v24[3] = &unk_2643E3190;
  id v9 = v6;
  id v25 = v9;
  v26 = self;
  BOOL v10 = [v8 thenWithBlock:v24];
  uint64_t v11 = AMSSetLogKey();
  uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = v8;
    id v15 = objc_opt_class();
    id v19 = v15;
    v16 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v15;
    int v8 = v14;
    __int16 v29 = 2114;
    v30 = v16;
    _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading payments and shipment", buf, 0x16u);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_72;
  v20[3] = &unk_2643E43B0;
  id v21 = v11;
  v22 = self;
  id v23 = v4;
  id v17 = v4;
  id v18 = v11;
  [v10 addFinishBlock:v20];
}

id __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke(int8x16_t *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F27EC8]) initWithBag:a1[2].i64[0]];
  unint64_t v5 = [v4 typeForURL:v3];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_2;
  v11[3] = &unk_2643E4388;
  int8x16_t v10 = a1[2];
  id v6 = (id)v10.i64[0];
  int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
  id v13 = v3;
  id v7 = v3;
  int v8 = [v5 thenWithBlock:v11];

  return v8;
}

id __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] _grandSlamAccount];
  id v5 = objc_alloc_init(MEMORY[0x263F27E10]);
  uint64_t v6 = [v3 integerValue];
  if (v6)
  {
    if (v6 == 2)
    {
      id v7 = [[AMSUIDynamicViewController alloc] initWithBag:a1[5] URL:a1[6]];
      [(AMSUIDynamicViewController *)v7 setAccount:v4];
      [v5 finishWithResult:v7];
    }
    else
    {
      uint64_t v24 = 0;
      id v25 = &v24;
      uint64_t v26 = 0x2050000000;
      int8x16_t v10 = (void *)getSKAccountPageViewControllerClass_softClass;
      uint64_t v27 = getSKAccountPageViewControllerClass_softClass;
      if (!getSKAccountPageViewControllerClass_softClass)
      {
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __getSKAccountPageViewControllerClass_block_invoke;
        v23[3] = &unk_2643E33D8;
        v23[4] = &v24;
        __getSKAccountPageViewControllerClass_block_invoke((uint64_t)v23);
        int8x16_t v10 = (void *)v25[3];
      }
      uint64_t v11 = v10;
      _Block_object_dispose(&v24, 8);
      int8x16_t v12 = (void *)[[v11 alloc] initWithAccountURL:a1[6]];
      [v12 setAccount:v4];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_5;
      v14[3] = &unk_2643E34D0;
      id v15 = v5;
      id v16 = v12;
      id v7 = v12;
      [(AMSUIDynamicViewController *)v7 loadWithCompletionBlock:v14];
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_3;
    block[3] = &unk_2643E3DA8;
    id v18 = a1[5];
    id v8 = v4;
    id v9 = a1[4];
    id v19 = v8;
    id v20 = v9;
    id v21 = a1[6];
    id v22 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return v5;
}

void __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_3(uint64_t a1)
{
  v2 = [[AMSUIWebViewController alloc] initWithBag:*(void *)(a1 + 32) account:*(void *)(a1 + 40) clientInfo:0];
  id v3 = +[AMSUIWebAppearance tableViewAppearance];
  [(AMSUIWebViewController *)v2 setAppearance:v3];

  [(AMSUIWebViewController *)v2 setDelegate:*(void *)(a1 + 48)];
  id v4 = [(AMSUIWebViewController *)v2 loadURL:*(void *)(a1 + 56)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_4;
  v6[3] = &unk_2643E39B8;
  id v7 = *(id *)(a1 + 64);
  id v8 = v2;
  id v5 = v2;
  [v4 addFinishBlock:v6];
}

uint64_t __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v4, "finishWithError:");
  }
  else {
    return [v4 finishWithResult:*(void *)(a1 + 40)];
  }
}

uint64_t __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

void __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_2_73;
  block[3] = &unk_2643E3DA8;
  id v11 = *(id *)(a1 + 32);
  id v12 = v6;
  id v7 = *(void **)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = v5;
  id v15 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_2_73(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
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
      id v7 = objc_opt_class();
      id v8 = v7;
      id v9 = AMSLogKey();
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)id v18 = 138543874;
      *(void *)&v18[4] = v7;
      *(_WORD *)&v18[12] = 2114;
      *(void *)&v18[14] = v9;
      *(_WORD *)&v18[22] = 2114;
      uint64_t v19 = v10;
      id v11 = "%{public}@: [%{public}@] Failed to load payments and shipment. %{public}@";
      id v12 = v6;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_10:
      _os_log_impl(&dword_21C134000, v12, v13, v11, v18, v14);
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
      id v15 = objc_opt_class();
      id v8 = v15;
      id v9 = AMSLogKey();
      *(_DWORD *)id v18 = 138543618;
      *(void *)&v18[4] = v15;
      *(_WORD *)&v18[12] = 2114;
      *(void *)&v18[14] = v9;
      id v11 = "%{public}@: [%{public}@] Presenting payments and shipment";
      id v12 = v6;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 22;
      goto LABEL_10;
    }
  }

  if (*(void *)(a1 + 56))
  {
    id v16 = [*(id *)(a1 + 48) delegate];
    [v16 specifierProvider:*(void *)(a1 + 48) showViewController:*(void *)(a1 + 56)];
  }
  id v17 = objc_msgSend(*(id *)(a1 + 48), "delegate", *(_OWORD *)v18, *(void *)&v18[16], v19);
  [v17 specifierProvider:*(void *)(a1 + 48) didFinishLoadingSpecifier:*(void *)(a1 + 64)];
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

- (NSString)paymentSummaryDescription
{
  return self->_paymentSummaryDescription;
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_paymentSummaryDescription, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
}

@end