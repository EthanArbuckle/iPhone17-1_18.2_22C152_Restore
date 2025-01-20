@interface DAEASOAuthWebViewController
+ (void)_presentAlertWithAlertParameters:(id)a3;
+ (void)presentInternetOfflineError;
+ (void)presentSSLError;
+ (void)presentUsernameMismatchAlert;
- (DAEASOAuthWebViewController)initWithAccount:(id)a3 accountStore:(id)a4 authURI:(id)a5 accountType:(unint64_t)a6 userName:(id)a7 accountDescription:(id)a8 isFirstTimeSetup:(BOOL)a9 presentationBlock:(id)a10;
- (DAEASOAuthWebViewController)initWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5;
- (DAEASOAuthWebViewController)initWithAccountDescription:(id)a3 presentationBlock:(id)a4;
- (DAEASOAuthWebViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)completion;
- (void)_commonInitializationWithAccount:(id)a3 accountStore:(id)a4 username:(id)a5 accountDescription:(id)a6 presentationBlock:(id)a7;
- (void)_didInstantiateRemoteViewController;
- (void)_dismissAndCompleteWithIdentity:(id)a3 error:(id)a4 extensionCompletion:(id)a5;
- (void)_extensionRequestDidCancelWithError:(id)a3;
- (void)_extensionRequestDidCompleteWithTokens:(id)a3 extensionCompletion:(id)a4;
- (void)loadView;
- (void)setCompletion:(id)a3;
@end

@implementation DAEASOAuthWebViewController

- (DAEASOAuthWebViewController)initWithAccountDescription:(id)a3 presentationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DAEASOAuthWebViewController;
  v8 = [(DAEASOAuthWebViewController *)&v11 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8) {
    [(DAEASOAuthWebViewController *)v8 _commonInitializationWithAccount:0 accountStore:0 username:0 accountDescription:v6 presentationBlock:v7];
  }

  return v9;
}

- (DAEASOAuthWebViewController)initWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DAEASOAuthWebViewController;
  objc_super v11 = [(DAEASOAuthWebViewController *)&v14 initWithNibName:0 bundle:0];
  if (v11)
  {
    v12 = [v8 accountDescription];
    [(DAEASOAuthWebViewController *)v11 _commonInitializationWithAccount:v8 accountStore:v9 username:0 accountDescription:v12 presentationBlock:v10];
  }
  return v11;
}

- (DAEASOAuthWebViewController)initWithAccount:(id)a3 accountStore:(id)a4 authURI:(id)a5 accountType:(unint64_t)a6 userName:(id)a7 accountDescription:(id)a8 isFirstTimeSetup:(BOOL)a9 presentationBlock:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  v25.receiver = self;
  v25.super_class = (Class)DAEASOAuthWebViewController;
  v22 = [(DAEASOAuthWebViewController *)&v25 initWithNibName:0 bundle:0];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_authURI, a5);
    v23->_oauthType = a6;
    v23->_isFirstTimeSetup = a9;
    [(DAEASOAuthWebViewController *)v23 _commonInitializationWithAccount:v16 accountStore:v17 username:v19 accountDescription:v20 presentationBlock:v21];
  }

  return v23;
}

- (DAEASOAuthWebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DAEASOAuthWebViewController;
  v4 = [(DAEASOAuthWebViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(DAEASOAuthWebViewController *)v4 _commonInitializationWithAccount:0 accountStore:0 username:0 accountDescription:0 presentationBlock:0];
  }
  return v5;
}

- (void)_commonInitializationWithAccount:(id)a3 accountStore:(id)a4 username:(id)a5 accountDescription:(id)a6 presentationBlock:(id)a7
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v50 = a4;
  id v14 = a5;
  v15 = (__CFString *)a6;
  id v51 = a7;
  p_account = &self->_account;
  objc_storeStrong((id *)&self->_account, a3);
  objc_storeStrong((id *)&self->_accountStore, a4);
  id v17 = (void *)MEMORY[0x230F5DCD0](v51);
  id presentationBlock = self->_presentationBlock;
  self->_id presentationBlock = v17;

  uint64_t v19 = MEMORY[0x263F38F90];
  if (!self->_presentationBlock)
  {
    id v20 = DALoggingwithCategory();
    os_log_type_t v21 = *(unsigned char *)(v19 + 3);
    if (os_log_type_enabled(v20, v21))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C076000, v20, v21, "DAEASOAuthWebViewController Client did not pass a presentationBlock to the init method. Your presentation animation will probably look horrible. Please pass a presentationBlock.", buf, 2u);
    }
  }
  [(DAEASOAuthWebViewController *)self setModalPresentationStyle:0];
  id v58 = 0;
  v22 = [MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.exchangesyncexpress.framework.EASOAuthService" error:&v58];
  id v49 = v58;
  extension = self->_extension;
  self->_extension = v22;

  v24 = DALoggingwithCategory();
  os_log_type_t v25 = *(unsigned char *)(v19 + 7);
  if (os_log_type_enabled(v24, v25))
  {
    v26 = self->_extension;
    *(_DWORD *)buf = 138412290;
    v61 = v26;
    _os_log_impl(&dword_22C076000, v24, v25, "DAEASOAuthWebViewController got extension %@", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke;
  v55[3] = &unk_26490ABC8;
  objc_copyWeak(&v56, &location);
  [(NSExtension *)self->_extension setRequestCancellationBlock:v55];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_9;
  v53[3] = &unk_26490AC18;
  objc_copyWeak(&v54, &location);
  [(NSExtension *)self->_extension set_requestPostCompletionBlockWithItems:v53];
  if (v13)
  {
    uint64_t v27 = [v13 accountDescription];

    v15 = (__CFString *)v27;
  }
  if (v15) {
    v28 = v15;
  }
  else {
    v28 = @"Outlook";
  }
  v29 = DALoggingwithCategory();
  if (os_log_type_enabled(v29, v25))
  {
    *(_DWORD *)buf = 138412546;
    v61 = v28;
    __int16 v62 = 2112;
    id v63 = v14;
    _os_log_impl(&dword_22C076000, v29, v25, "DAEASOAuthWebViewController initializing for description %@ username %@", buf, 0x16u);
  }

  id v30 = objc_alloc_init(MEMORY[0x263F08810]);
  v31 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v28 forKey:@"description"];
  if (v13)
  {
    v32 = [v13 identifier];
    BOOL v33 = v32 == 0;

    if (!v33)
    {
      v34 = [v13 identifier];
      v35 = (void *)[v34 copy];
      [v31 setObject:v35 forKeyedSubscript:@"accountId"];
    }
  }
  unint64_t oauthType = self->_oauthType;
  if (oauthType)
  {
    v37 = [NSNumber numberWithUnsignedInteger:self->_oauthType];
  }
  else
  {
    v37 = &unk_26DF814B8;
  }
  [v31 setObject:v37 forKeyedSubscript:@"oauthAccountType"];
  if (oauthType) {

  }
  v38 = v14;
  if (!v14)
  {
    v39 = [v13 username];
    BOOL v40 = v39 == 0;

    if (v40) {
      goto LABEL_27;
    }
    v38 = [v13 username];
  }
  [v31 setObject:v38 forKeyedSubscript:@"username"];
  if (!v14) {

  }
LABEL_27:
  authURI = self->_authURI;
  if (authURI) {
    [v31 setObject:authURI forKeyedSubscript:@"authURI"];
  }
  v42 = [(ACAccount *)*p_account objectForKeyedSubscript:*MEMORY[0x263F38E30]];

  if (v42)
  {
    v43 = [(ACAccount *)*p_account objectForKeyedSubscript:*MEMORY[0x263F3B8E8]];
    [v31 setObject:v43 forKeyedSubscript:@"easEndPoint"];
  }
  uint64_t v44 = *MEMORY[0x263F3B988];
  v45 = [(ACAccount *)*p_account objectForKeyedSubscript:*MEMORY[0x263F3B988]];

  if (v45)
  {
    v46 = [(ACAccount *)*p_account objectForKeyedSubscript:v44];
    [v31 setObject:v46 forKeyedSubscript:@"claimsChallenge"];
  }
  [v30 setUserInfo:v31];
  v47 = self->_extension;
  id v59 = v30;
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_41;
  v52[3] = &unk_26490AC40;
  v52[4] = self;
  [(NSExtension *)v47 instantiateViewControllerWithInputItems:v48 listenerEndpoint:0 connectionHandler:v52];

  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);
}

void __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_2;
  block[3] = &unk_26490ABA0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = DALoggingwithCategory();
    os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_22C076000, v3, v4, "DAEASOAuthWebViewController extension requestCancellationBlock requestIdentifier %@ error %@", (uint8_t *)&v7, 0x16u);
    }

    [WeakRetained _extensionRequestDidCancelWithError:*(void *)(a1 + 40)];
  }
}

void __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_2_10;
  v13[3] = &unk_26490ABF0;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  id v14 = v7;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v13);

  objc_destroyWeak(&v17);
}

void __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_2_10(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = DALoggingwithCategory();
    os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_22C076000, v3, v4, "DAEASOAuthWebViewController extension _requestPostCompletionBlockWithItems requestIdentifier %@ items %@", (uint8_t *)&v7, 0x16u);
    }

    [WeakRetained _extensionRequestDidCompleteWithTokens:*(void *)(a1 + 40) extensionCompletion:*(void *)(a1 + 48)];
  }
}

void __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_41(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DALoggingwithCategory();
  os_log_type_t v11 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v10, v11))
  {
    int v15 = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_22C076000, v10, v11, "DAEASOAuthWebViewController finished instantiate remote view controller %@ error %@ extension request identifier %@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 1000);
  *(void *)(v12 + 1000) = v8;
  id v14 = v8;

  [*(id *)(a1 + 32) _didInstantiateRemoteViewController];
}

- (void)_didInstantiateRemoteViewController
{
  v27[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __66__DAEASOAuthWebViewController__didInstantiateRemoteViewController__block_invoke;
    v21[3] = &unk_26490AC68;
    objc_copyWeak(&v22, &location);
    [(UIViewController *)self->_serviceViewController setViewServiceTerminationBlock:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  serviceViewController = self->_serviceViewController;
  if (serviceViewController && !self->_extensionCancellationError)
  {
    [(UIViewController *)serviceViewController willMoveToParentViewController:self];
    [(DAEASOAuthWebViewController *)self addChildViewController:self->_serviceViewController];
    os_log_type_t v4 = [(DAEASOAuthWebViewController *)self view];
    uint64_t v5 = [(UIViewController *)self->_serviceViewController view];
    [v4 addSubview:v5];

    uint64_t v6 = [(DAEASOAuthWebViewController *)self view];
    id v7 = [(UIViewController *)self->_serviceViewController view];
    [v6 bringSubviewToFront:v7];

    [(UIViewController *)self->_serviceViewController didMoveToParentViewController:self];
    id v8 = [(UIViewController *)self->_serviceViewController view];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v10 = (void *)MEMORY[0x263F08938];
    v26 = @"serviceView";
    os_log_type_t v11 = [(UIViewController *)self->_serviceViewController view];
    v27[0] = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v13 = [v10 constraintsWithVisualFormat:@"H:|[serviceView]|" options:0 metrics:0 views:v12];
    [v9 addObjectsFromArray:v13];

    id v14 = (void *)MEMORY[0x263F08938];
    v24 = @"serviceView";
    int v15 = [(UIViewController *)self->_serviceViewController view];
    os_log_type_t v25 = v15;
    id v16 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    __int16 v17 = [v14 constraintsWithVisualFormat:@"V:|[serviceView]|" options:0 metrics:0 views:v16];
    [v9 addObjectsFromArray:v17];

    [MEMORY[0x263F08938] activateConstraints:v9];
    id v18 = [(DAEASOAuthWebViewController *)self view];
    [v18 setNeedsLayout];

    id presentationBlock = (void (**)(id, DAEASOAuthWebViewController *))self->_presentationBlock;
    if (presentationBlock) {
      presentationBlock[2](presentationBlock, self);
    }
  }
  id v20 = self->_presentationBlock;
  self->_id presentationBlock = 0;
}

void __66__DAEASOAuthWebViewController__didInstantiateRemoteViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[1024])
  {
    v2 = WeakRetained;
    [WeakRetained _extensionRequestDidCompleteWithTokens:0 extensionCompletion:0];
    id WeakRetained = v2;
  }
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)DAEASOAuthWebViewController;
  [(DAEASOAuthWebViewController *)&v6 loadView];
  v3 = [(DAEASOAuthWebViewController *)self view];
  [v3 setOpaque:0];

  os_log_type_t v4 = [MEMORY[0x263F1C550] clearColor];
  uint64_t v5 = [(DAEASOAuthWebViewController *)self view];
  [v5 setBackgroundColor:v4];
}

- (void)_extensionRequestDidCancelWithError:(id)a3
{
}

- (void)_extensionRequestDidCompleteWithTokens:(id)a3 extensionCompletion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  self->_extensionRequestDidComplete = 1;
  if (a3)
  {
    id v9 = [a3 objectAtIndexedSubscript:0];
    uint64_t v10 = [v9 attachments];
    os_log_type_t v11 = [v10 objectAtIndexedSubscript:0];

    uint64_t v12 = dispatch_get_global_queue(25, 0);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_2;
    v14[3] = &unk_26490AD08;
    id v15 = v11;
    id v16 = self;
    SEL v18 = a2;
    id v17 = v8;
    id v13 = v11;
    dispatch_async(v12, v14);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke;
    block[3] = &unk_26490AAA0;
    void block[4] = self;
    id v20 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke(uint64_t a1)
{
  id v8 = *(id *)(*(void *)(a1 + 32) + 1016);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 1016))
  {
    v3 = [*(id *)(v2 + 1016) domain];
    if ([v3 isEqualToString:*MEMORY[0x263F08570]])
    {
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 1016) code];

      uint64_t v2 = *(void *)(a1 + 32);
      if (v4 == -1009)
      {
        [(id)objc_opt_class() presentInternetOfflineError];
        goto LABEL_9;
      }
    }
    else
    {

      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  uint64_t v5 = *(void **)(v2 + 1016);
  if (!v5) {
    goto LABEL_11;
  }
  objc_super v6 = [v5 domain];
  if (![v6 isEqualToString:*MEMORY[0x263EFB070]]) {
    goto LABEL_10;
  }
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 1016) code];

  if (v7 != 1) {
    goto LABEL_11;
  }
LABEL_9:
  objc_super v6 = v8;
  id v8 = 0;
LABEL_10:

LABEL_11:
  [*(id *)(a1 + 32) _dismissAndCompleteWithIdentity:0 error:v8 extensionCompletion:*(void *)(a1 + 40)];
}

void __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_2(void *a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__0;
  v89 = __Block_byref_object_dispose__0;
  id v90 = 0;
  v3 = (void *)a1[4];
  uint64_t v4 = *MEMORY[0x263F01A08];
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_59;
  v82[3] = &unk_26490AC90;
  v84 = &v85;
  uint64_t v5 = v2;
  v83 = v5;
  [v3 loadItemForTypeIdentifier:v4 options:0 completionHandler:v82];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__0;
  v80 = __Block_byref_object_dispose__0;
  id v81 = [(id)v86[5] objectForKeyedSubscript:@"accessToken"];
  objc_super v6 = [(id)v86[5] objectForKeyedSubscript:@"refreshToken"];
  uint64_t v7 = [(id)v86[5] objectForKeyedSubscript:@"username"];
  uint64_t v8 = [(id)v86[5] objectForKeyedSubscript:@"displayName"];
  uint64_t v9 = [(id)v86[5] objectForKeyedSubscript:@"oauthURI"];
  uint64_t v10 = [(id)v86[5] objectForKeyedSubscript:@"tokenRequestURI"];
  os_log_type_t v11 = [(id)v86[5] objectForKeyedSubscript:@"jwksURI"];
  id v54 = (void *)v9;
  v55 = (void *)v8;
  uint64_t v12 = [(id)v86[5] objectForKeyedSubscript:@"issuer"];
  id v13 = [(id)v86[5] objectForKeyedSubscript:@"jwksData"];
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__0;
  v74[4] = __Block_byref_object_dispose__0;
  id v75 = 0;
  uint64_t v14 = a1[5];
  if (!*(unsigned char *)(v14 + 1048))
  {
    os_log_type_t v25 = *(void **)(v14 + 976);
    if (v25)
    {
      if (v77[5] && v6 && v7)
      {
        v26 = [v25 username];
        uint64_t v27 = [v26 compare:v7 options:1];

        if (v27)
        {
          [(id)objc_opt_class() presentUsernameMismatchAlert];
          v28 = (void *)v77[5];
          v77[5] = 0;
LABEL_18:

          goto LABEL_2;
        }
        v52 = [(id)v86[5] objectForKeyedSubscript:@"oauthURI"];
        if (!v52) {
          goto LABEL_14;
        }
        v29 = [(id)v86[5] objectForKeyedSubscript:@"tokenRequestURI"];
        if (v29)
        {
          id v50 = [(id)v86[5] objectForKeyedSubscript:@"jwksURI"];
          if (v50)
          {
            uint64_t v30 = [(id)v86[5] objectForKeyedSubscript:@"issuer"];
            if (v30)
            {
              v31 = (void *)v30;
              [(id)v86[5] objectForKeyedSubscript:@"jwksData"];
              v32 = id v49 = v29;

              if (v32)
              {
LABEL_15:
                v34 = [(id)v86[5] objectForKeyedSubscript:@"oauthURI"];
                [*(id *)(a1[5] + 976) setObject:v34 forKeyedSubscript:*MEMORY[0x263F3B970]];

                v35 = [(id)v86[5] objectForKeyedSubscript:@"tokenRequestURI"];
                [*(id *)(a1[5] + 976) setObject:v35 forKeyedSubscript:*MEMORY[0x263F3B990]];

                v36 = [(id)v86[5] objectForKeyedSubscript:@"jwksURI"];
                [*(id *)(a1[5] + 976) setObject:v36 forKeyedSubscript:*MEMORY[0x263F3B950]];

                v37 = [(id)v86[5] objectForKeyedSubscript:@"issuer"];
                [*(id *)(a1[5] + 976) setObject:v37 forKeyedSubscript:*MEMORY[0x263F3B968]];

                v38 = [(id)v86[5] objectForKeyedSubscript:@"jwksData"];
                [*(id *)(a1[5] + 976) setObject:v38 forKeyedSubscript:*MEMORY[0x263F3B938]];

                v39 = NSNumber;
                BOOL v40 = [MEMORY[0x263EFF910] date];
                [v40 timeIntervalSince1970];
                v41 = objc_msgSend(v39, "numberWithDouble:");
                [*(id *)(a1[5] + 976) setObject:v41 forKeyedSubscript:*MEMORY[0x263F3B948]];

                [*(id *)(a1[5] + 976) setObject:@"2" forKeyedSubscript:*MEMORY[0x263F3B978]];
                [*(id *)(a1[5] + 976) setObject:&stru_26DF7DF88 forKeyedSubscript:*MEMORY[0x263F3B980]];
                [*(id *)(a1[5] + 976) setObject:&stru_26DF7DF88 forKeyedSubscript:*MEMORY[0x263F3B988]];
                id v42 = objc_alloc(MEMORY[0x263EFB200]);
                uint64_t v43 = [v42 initWithOAuth2Token:v77[5] refreshToken:v6 expiryDate:0];
                [*(id *)(a1[5] + 976) setCredential:v43];
                uint64_t v44 = DALoggingwithCategory();
                v53 = (void *)v43;
                os_log_type_t v45 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
                if (os_log_type_enabled(v44, v45))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_22C076000, v44, v45, "DAEASOAuthWebViewController will save account with new credential", buf, 2u);
                }

                uint64_t v46 = a1[5];
                id v51 = *(void **)(v46 + 984);
                uint64_t v47 = *(void *)(v46 + 976);
                v69[0] = MEMORY[0x263EF8330];
                v69[1] = 3221225472;
                v69[2] = __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_104;
                v69[3] = &unk_26490ACB8;
                v71 = v74;
                v72 = &v76;
                v48 = v5;
                v70 = v48;
                [v51 saveAccount:v47 withCompletionHandler:v69];
                v28 = v53;
                dispatch_semaphore_wait(v48, 0xFFFFFFFFFFFFFFFFLL);

                goto LABEL_18;
              }
LABEL_14:
              BOOL v33 = [MEMORY[0x263F08690] currentHandler];
              [v33 handleFailureInMethod:a1[7], a1[5], @"DAEASOAuthWebViewController.m", 279, @"We have used these objects to fetch and verify the tokens, neither of these should be empty" object file lineNumber description];

              goto LABEL_15;
            }
          }
        }

        goto LABEL_14;
      }
    }
  }
LABEL_2:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_106;
  block[3] = &unk_26490ACE0;
  id v57 = v6;
  id v58 = v55;
  id v59 = v7;
  id v60 = v54;
  id v61 = v10;
  id v62 = v11;
  id v63 = v12;
  id v64 = v13;
  uint64_t v15 = a1[5];
  id v16 = (void *)a1[6];
  v67 = &v76;
  uint64_t v65 = v15;
  v68 = v74;
  id v66 = v16;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  id v21 = v54;
  id v22 = v7;
  id v23 = v55;
  id v24 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v74, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v85, 8);
}

void __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  objc_super v6 = a3;
  if (v6)
  {
    uint64_t v7 = DALoggingwithCategory();
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      os_log_type_t v25 = v6;
      _os_log_impl(&dword_22C076000, v7, v8, "DAEASOAuthWebViewController did loadItemForTypeIdentifier for response, got error %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = v5;
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v9 = (void *)MEMORY[0x263F08928];
      uint64_t v10 = (void *)MEMORY[0x263EFFA08];
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      id v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
      id v23 = 0;
      uint64_t v14 = [v9 unarchivedObjectOfClasses:v13 fromData:v7 error:&v23];
      uint64_t v15 = v23;
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v14;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v18 = DALoggingwithCategory();
        os_log_type_t v19 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)buf = 138412290;
          os_log_type_t v25 = v15;
          _os_log_impl(&dword_22C076000, v18, v19, "Unable to decode response: %@", buf, 0xCu);
        }

        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
        id v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = 0;
      }
    }
    else
    {
      uint64_t v15 = DALoggingwithCategory();
      os_log_type_t v22 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
      if (os_log_type_enabled(v15, v22))
      {
        *(_DWORD *)buf = 138412290;
        os_log_type_t v25 = v7;
        _os_log_impl(&dword_22C076000, v15, v22, "DAEASOAuthWebViewController did loadItemForTypeIdentifier for response, got invalid response %@", buf, 0xCu);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_104(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = DALoggingwithCategory();
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v12[0] = 67109378;
    v12[1] = a2;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_22C076000, v7, v8, "DAEASOAuthWebViewController did save account with success %d error %@", (uint8_t *)v12, 0x12u);
  }

  if ((a2 & 1) == 0)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_106(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) && *(void *)(a1 + 32))
  {
    dispatch_semaphore_t v2 = objc_alloc_init(DAEASOAuthIdentity);
    [(DAEASOAuthIdentity *)v2 setDisplayName:*(void *)(a1 + 40)];
    [(DAEASOAuthIdentity *)v2 setUsername:*(void *)(a1 + 48)];
    [(DAEASOAuthIdentity *)v2 setAccessToken:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];
    [(DAEASOAuthIdentity *)v2 setRefreshToken:*(void *)(a1 + 32)];
    [(DAEASOAuthIdentity *)v2 setOauthURI:*(void *)(a1 + 56)];
    [(DAEASOAuthIdentity *)v2 setTokenRequestURI:*(void *)(a1 + 64)];
    [(DAEASOAuthIdentity *)v2 setJwksURI:*(void *)(a1 + 72)];
    [(DAEASOAuthIdentity *)v2 setIssuer:*(void *)(a1 + 80)];
    [(DAEASOAuthIdentity *)v2 setJwksData:*(void *)(a1 + 88)];
  }
  else if (*(void *)(a1 + 48))
  {
    dispatch_semaphore_t v2 = objc_alloc_init(DAEASOAuthIdentity);
    [(DAEASOAuthIdentity *)v2 setUsername:*(void *)(a1 + 48)];
  }
  else
  {
    dispatch_semaphore_t v2 = 0;
  }
  [*(id *)(a1 + 96) _dismissAndCompleteWithIdentity:v2 error:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) extensionCompletion:*(void *)(a1 + 104)];
}

- (void)_dismissAndCompleteWithIdentity:(id)a3 error:(id)a4 extensionCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = DALoggingwithCategory();
  os_log_type_t v12 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v11, v12))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C076000, v11, v12, "DAEASOAuthWebViewController will dismiss", buf, 2u);
  }

  __int16 v13 = [(DAEASOAuthWebViewController *)self presentingViewController];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__DAEASOAuthWebViewController__dismissAndCompleteWithIdentity_error_extensionCompletion___block_invoke;
  v17[3] = &unk_26490AD30;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v10;
  [v13 dismissViewControllerAnimated:1 completion:v17];
}

void __89__DAEASOAuthWebViewController__dismissAndCompleteWithIdentity_error_extensionCompletion___block_invoke(void *a1)
{
  dispatch_semaphore_t v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_22C076000, v2, v3, "DAEASOAuthWebViewController did dismiss", v8, 2u);
  }

  uint64_t v4 = a1[7];
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  uint64_t v5 = *(void *)(a1[4] + 1056);
  if (v5)
  {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, a1[5], a1[6]);
    uint64_t v6 = a1[4];
    uint64_t v7 = *(void **)(v6 + 1056);
    *(void *)(v6 + 1056) = 0;
  }
}

+ (void)presentUsernameMismatchAlert
{
  id v11 = (id)MEMORY[0x263EFF9A0];
  dispatch_semaphore_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  os_log_type_t v3 = [v2 localizedStringForKey:@"HOTMAIL_EMAIL_MISMATCH_TITLE" value:&stru_26DF7DF88 table:@"EASOAuthSupport"];
  uint64_t v4 = *MEMORY[0x263EFFFC8];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"HOTMAIL_EMAIL_MISMATCH_MESSAGE" value:&stru_26DF7DF88 table:@"EASOAuthSupport"];
  uint64_t v7 = *MEMORY[0x263EFFFD8];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"HOTMAIL_EMAIL_MISMATCH_OK" value:&stru_26DF7DF88 table:@"EASOAuthSupport"];
  objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v3, v4, v6, v7, v9, *MEMORY[0x263F00000], 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  [a1 _presentAlertWithAlertParameters:v12];
}

+ (void)presentInternetOfflineError
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263EFFFC8];
  os_log_type_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"SIGN_IN_ERROR_TITLE" value:&stru_26DF7DF88 table:@"EASOAuthSupport"];
  v11[0] = v4;
  v10[1] = *MEMORY[0x263EFFFD8];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"SIGN_IN_ERROR_MESSAGE_NO_CONNECTION" value:&stru_26DF7DF88 table:@"EASOAuthSupport"];
  v11[1] = v6;
  v10[2] = *MEMORY[0x263F00000];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SIGN_IN_ERROR_OK" value:&stru_26DF7DF88 table:@"EASOAuthSupport"];
  v11[2] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  [a1 _presentAlertWithAlertParameters:v9];
}

+ (void)presentSSLError
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263EFFFC8];
  os_log_type_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"SIGN_IN_ERROR_TITLE" value:&stru_26DF7DF88 table:@"EASOAuthSupport"];
  v11[0] = v4;
  v10[1] = *MEMORY[0x263EFFFD8];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"SIGN_IN_ERROR_MESSAGE_SSL_ERROR" value:&stru_26DF7DF88 table:@"EASOAuthSupport"];
  v11[1] = v6;
  v10[2] = *MEMORY[0x263F00000];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SIGN_IN_ERROR_OK" value:&stru_26DF7DF88 table:@"EASOAuthSupport"];
  v11[2] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  [a1 _presentAlertWithAlertParameters:v9];
}

+ (void)_presentAlertWithAlertParameters:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFUserNotificationRef v8 = 0;
  CFUserNotificationRef v8 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, 0, (CFDictionaryRef)a3);
  if (v6[3])
  {
    os_log_type_t v3 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__DAEASOAuthWebViewController__presentAlertWithAlertParameters___block_invoke;
    block[3] = &unk_26490AD58;
    void block[4] = &v5;
    dispatch_async(v3, block);
  }
  _Block_object_dispose(&v5, 8);
}

void __64__DAEASOAuthWebViewController__presentAlertWithAlertParameters___block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_authURI, 0);
  objc_storeStrong((id *)&self->_extensionCancellationError, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_serviceViewController, 0);
  objc_storeStrong(&self->_presentationBlock, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end