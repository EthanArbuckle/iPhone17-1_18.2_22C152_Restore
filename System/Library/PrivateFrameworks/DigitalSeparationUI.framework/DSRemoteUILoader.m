@interface DSRemoteUILoader
+ (void)initialize;
- (DSNavigationDelegate)delegate;
- (DSRemoteUILoader)initWithAccountManager:(id)a3 presenter:(id)a4 delegate:(id)a5;
- (DSRemoteUILoader)initWithPresenter:(id)a3 delegate:(id)a4;
- (DSRemoteUILoader)initWithPresenter:(id)a3 delegate:(id)a4 URL:(id)a5;
- (id)accountsForAccountManager:(id)a3;
- (void)loadRemoteUI;
- (void)remoteUIDidEndFlow:(id)a3;
- (void)remoteUIDidReceiveHTTPResponse:(id)a3;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)remoteUIWillLoadRequest:(id)a3;
- (void)remoteUIWillPresentObjectModel:(id)a3 modally:(BOOL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation DSRemoteUILoader

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLog_0 = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSRemoteUILoader");
    MEMORY[0x270F9A758]();
  }
}

- (DSRemoteUILoader)initWithPresenter:(id)a3 delegate:(id)a4
{
  v6 = (void *)MEMORY[0x263EFB210];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultStore];
  v10 = (void *)[objc_alloc(MEMORY[0x263F26D70]) initWithAccountStore:v9];
  [v10 setDelegate:self];
  v11 = [(DSRemoteUILoader *)self initWithAccountManager:v10 presenter:v8 delegate:v7];

  return v11;
}

- (DSRemoteUILoader)initWithPresenter:(id)a3 delegate:(id)a4 URL:(id)a5
{
  id v8 = a5;
  v9 = [(DSRemoteUILoader *)self initWithPresenter:a3 delegate:a4];
  v10 = v9;
  if (v8 && v9)
  {
    uint64_t v11 = [NSURL URLWithString:v8];
    dynamicURL = v10->_dynamicURL;
    v10->_dynamicURL = (NSURL *)v11;
  }
  return v10;
}

- (DSRemoteUILoader)initWithAccountManager:(id)a3 presenter:(id)a4 delegate:(id)a5
{
  v30[3] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)DSRemoteUILoader;
  v12 = [(DSRemoteUILoader *)&v29 init];
  if (v12)
  {
    v13 = DSLog_0;
    if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_235BFC000, v13, OS_LOG_TYPE_INFO, "Initializing DSRemoteUILoader", v28, 2u);
    }
    objc_storeStrong((id *)&v12->_accountManager, a3);
    objc_storeWeak((id *)&v12->_delegate, v11);
    v14 = (IDSIDQueryController *)objc_alloc_init(MEMORY[0x263F4A058]);
    queryController = v12->_queryController;
    v12->_queryController = v14;

    v16 = [v9 accountStore];
    uint64_t v17 = objc_msgSend(v16, "aa_primaryAppleAccount");
    currentAccount = v12->_currentAccount;
    v12->_currentAccount = (ACAccount *)v17;

    id v19 = objc_alloc(MEMORY[0x263F25C88]);
    v20 = [(ACAccount *)v12->_currentAccount aa_altDSID];
    v21 = (void *)[v19 initWithAltDSID:v20];

    v30[0] = v21;
    v22 = objc_opt_new();
    v30[1] = v22;
    v23 = objc_opt_new();
    v30[2] = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];

    uint64_t v25 = [objc_alloc(MEMORY[0x263F25CD8]) initWithAccountManager:v12->_accountManager presenter:v10 hooks:v24];
    privacyRepairPresenter = v12->_privacyRepairPresenter;
    v12->_privacyRepairPresenter = (AAUIGrandSlamRemoteUIPresenter *)v25;

    [(AAUIGrandSlamRemoteUIPresenter *)v12->_privacyRepairPresenter setDelegate:v12];
  }

  return v12;
}

- (void)loadRemoteUI
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dynamicURL = self->_dynamicURL;
  if (dynamicURL)
  {
    v4 = dynamicURL;
  }
  else
  {
    v5 = [MEMORY[0x263F29270] bagForAltDSID:0];
    v4 = [v5 privacyRepairURL];
  }
  id v6 = objc_alloc_init(MEMORY[0x263F089E0]);
  [v6 setURL:v4];
  [v6 setHTTPMethod:@"GET"];
  id v7 = DSLog_0;
  if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_235BFC000, v7, OS_LOG_TYPE_INFO, "Loading Remote UI request, %@", (uint8_t *)&v8, 0xCu);
  }
  [(AAUIGrandSlamRemoteUIPresenter *)self->_privacyRepairPresenter loadRequest:v6];
}

- (void)remoteUIWillLoadRequest:(id)a3
{
  id v4 = a3;
  v5 = [(DSRemoteUILoader *)self delegate];
  if (([v5 isNetworkReachable] & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__DSRemoteUILoader_remoteUIWillLoadRequest___block_invoke;
    block[3] = &unk_264C6E7D0;
    id v7 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  [v4 setValue:@"digitalseparation" forHTTPHeaderField:@"X-Apple-I-App-Provided-Context"];
}

uint64_t __44__DSRemoteUILoader_remoteUIWillLoadRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayNetworkError];
}

- (void)remoteUIDidReceiveHTTPResponse:(id)a3
{
  id v4 = a3;
  v5 = DSLog_0;
  if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_ERROR)) {
    -[DSRemoteUILoader remoteUIDidReceiveHTTPResponse:]((uint64_t)v4, v5);
  }
  if ([v4 statusCode] == 401
    || [v4 statusCode] == 302
    || (uint64_t v6 = [v4 statusCode], !v4)
    || v6 == 200)
  {
    [(IDSIDQueryController *)self->_queryController flushQueryCache];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F82418];
    int v8 = DSUILocStringForKey(@"REMOTEUI_ERROR_TITLE");
    id v9 = DSUILocStringForKey(@"REMOTEUI_ERROR_DETAIL");
    uint64_t v10 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

    id v11 = (void *)MEMORY[0x263F82400];
    v12 = DSUILocStringForKey(@"REMOTEUI_ERROR_CONFIRMATION");
    v13 = [v11 actionWithTitle:v12 style:1 handler:&__block_literal_global_3];
    [v10 addAction:v13];

    v14 = [(DSRemoteUILoader *)self delegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v14 presentViewController:v10 animated:1 completion:0];
    }
  }
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = DSLog_0;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_ERROR)) {
      -[DSRemoteUILoader remoteUIRequestComplete:error:]((uint64_t)v5, (uint64_t)v6, v7);
    }
  }
  else if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_235BFC000, v7, OS_LOG_TYPE_INFO, "Loading Remote UI request, %@,  success", (uint8_t *)&v8, 0xCu);
  }
}

- (void)remoteUIDidEndFlow:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = (void *)DSLog_0;
  if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = NSStringFromSelector(a2);
    int v9 = 138412290;
    uint64_t v10 = v7;
    _os_log_impl(&dword_235BFC000, v6, OS_LOG_TYPE_INFO, "%@, Ending the Remote UI flow and moving on", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pushNextPane];
}

- (id)accountsForAccountManager:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  currentAccount = self->_currentAccount;
  uint64_t v6 = *MEMORY[0x263F26D28];
  v7[0] = currentAccount;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  return v4;
}

- (void)remoteUIWillPresentObjectModel:(id)a3 modally:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = [a3 allPages];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v10 = [v9 rightNavigationBarButtonItem];

          if (!v10)
          {
            id v11 = objc_alloc(MEMORY[0x263F63778]);
            v26[0] = @"label";
            v12 = DSUILocStringForKey(@"QUICK_EXIT");
            v27[0] = v12;
            v27[1] = @"navigationBar";
            v26[1] = @"parentBar";
            v26[2] = @"position";
            v26[3] = @"type";
            v27[2] = @"right";
            v27[3] = @"linkBarItem";
            v13 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
            v14 = [v9 pageElement];
            v15 = (void *)[v11 initWithAttributes:v13 parent:v14];
            [v9 setRightNavigationBarButtonItem:v15];

            v16 = [v9 rightNavigationBarButtonItem];
            uint64_t v17 = [v16 barButtonItem];
            [v17 setAction:sel_quickExit];

            v18 = [(DSRemoteUILoader *)self delegate];
            id v19 = [v9 rightNavigationBarButtonItem];
            v20 = [v19 barButtonItem];
            [v20 setTarget:v18];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v6);
    }
  }
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dynamicURL, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_privacyRepairPresenter, 0);
  objc_storeStrong((id *)&self->_currentAccount, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)remoteUIDidReceiveHTTPResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "Loading Remote UI request with response: %@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteUIRequestComplete:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_235BFC000, log, OS_LOG_TYPE_ERROR, "Loading Remote UI request, %@, with error, %@", (uint8_t *)&v3, 0x16u);
}

@end