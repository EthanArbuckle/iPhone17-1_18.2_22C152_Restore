@interface CNFRegServerWebViewController
- (BOOL)_shouldLog;
- (BOOL)canSendURLRequest:(id)a3;
- (BOOL)isLoaded;
- (BOOL)isLoading;
- (BOOL)shouldSetHeadersForRequest:(id)a3;
- (BOOL)timedOut;
- (CNFRegController)regController;
- (CNFRegServerWebViewController)init;
- (CNFRegServerWebViewController)initWithRegController:(id)a3;
- (UIWebView)webView;
- (id)logName;
- (id)overrideURLForURL:(id)a3;
- (id)parentViewControllerForObjectModel:(id)a3;
- (void)_cleanupLoader;
- (void)_popObjectModelAnimated:(BOOL)a3;
- (void)_startTimeoutWithDuration:(double)a3;
- (void)_stopTimeout;
- (void)_timeoutFired:(id)a3;
- (void)applicationWillSuspend;
- (void)cancelButtonPressed:(id)a3;
- (void)dealloc;
- (void)hideSpinner;
- (void)loadURL:(id)a3;
- (void)loadView;
- (void)loader:(id)a3 didFailWithError:(id)a4;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5;
- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5;
- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5;
- (void)objectModelDidChange:(id)a3;
- (void)objectModelPressedBack:(id)a3;
- (void)receivedStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6;
- (void)setRegController:(id)a3;
- (void)setWebView:(id)a3;
- (void)showSpinner;
- (void)startRequiringWifi;
- (void)stopRequiringWifi;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNFRegServerWebViewController

- (CNFRegServerWebViewController)initWithRegController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNFRegServerWebViewController;
  v5 = [(CNFRegServerWebViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CNFRegServerWebViewController *)v5 setRegController:v4];
  }

  return v6;
}

- (CNFRegServerWebViewController)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"CNFRegServerWebViewController.m", 51, @"Do not directly instantiate a %@, use -initWithRegController: instead", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)CNFRegServerWebViewController;
  [(CNFRegServerWebViewController *)&v5 loadView];
  v3 = [(CNFRegServerWebViewController *)self view];
  id v4 = [MEMORY[0x263F825C8] whiteColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CNFRegServerWebViewController;
  [(CNFRegServerWebViewController *)&v2 viewDidLoad];
}

- (void)viewDidUnload
{
  v2.receiver = self;
  v2.super_class = (Class)CNFRegServerWebViewController;
  [(CNFRegServerWebViewController *)&v2 viewDidUnload];
}

- (void)dealloc
{
  [(CNFRegServerWebViewController *)self _stopTimeout];
  [(RUILoader *)self->_loader cancel];
  [(RUILoader *)self->_loader setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CNFRegServerWebViewController;
  [(CNFRegServerWebViewController *)&v3 dealloc];
}

- (id)logName
{
  return @"Server";
}

- (BOOL)_shouldLog
{
  unsigned int webControllerFlags = self->_webControllerFlags;
  if ((webControllerFlags & 0x20) == 0)
  {
    if ([MEMORY[0x263EFFA40] shouldShowCNFRegistrationServerLogs]) {
      int v4 = 96;
    }
    else {
      int v4 = 32;
    }
    unsigned int webControllerFlags = v4 | *(unsigned char *)&self->_webControllerFlags & 0x9F;
    *(unsigned char *)&self->_unsigned int webControllerFlags = webControllerFlags;
  }
  return (webControllerFlags >> 6) & 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegServerWebViewController;
  [(CNFRegServerWebViewController *)&v4 viewWillAppear:a3];
  [(CNFRegServerWebViewController *)self startRequiringWifi];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNFRegServerWebViewController;
  [(CNFRegServerWebViewController *)&v6 viewDidAppear:a3];
  int IsAutomaticAppearanceEnabled = UIKeyboardIsAutomaticAppearanceEnabled();
  if (IsAutomaticAppearanceEnabled) {
    char v5 = 0;
  }
  else {
    char v5 = 16;
  }
  *(unsigned char *)&self->_unsigned int webControllerFlags = *(unsigned char *)&self->_webControllerFlags & 0xEF | v5;
  if ((IsAutomaticAppearanceEnabled & 1) == 0) {
    UIKeyboardEnableAutomaticAppearance();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegServerWebViewController;
  [(CNFRegServerWebViewController *)&v4 viewWillDisappear:a3];
  if ((*(unsigned char *)&self->_webControllerFlags & 0x10) != 0) {
    UIKeyboardDisableAutomaticAppearance();
  }
  [(CNFRegServerWebViewController *)self _stopTimeout];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegServerWebViewController;
  [(CNFRegServerWebViewController *)&v4 viewDidDisappear:a3];
  [(CNFRegServerWebViewController *)self stopRequiringWifi];
}

- (void)startRequiringWifi
{
  if ((*(unsigned char *)&self->_webControllerFlags & 0xC) == 4)
  {
    objc_super v3 = [(CNFRegServerWebViewController *)self regController];
    [v3 startRequiringWifi];

    *(unsigned char *)&self->_webControllerFlags |= 8u;
  }
}

- (void)stopRequiringWifi
{
  if ((*(unsigned char *)&self->_webControllerFlags & 8) != 0)
  {
    objc_super v3 = [(CNFRegServerWebViewController *)self regController];
    [v3 stopRequiringWifi];

    *(unsigned char *)&self->_webControllerFlags &= ~8u;
  }
}

- (void)showSpinner
{
  id v17 = [(CNFRegServerWebViewController *)self view];
  [v17 bounds];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  loadingView = self->_loadingView;
  if (!loadingView)
  {
    v12 = -[CNFRegLoadingView initWithFrame:]([CNFRegLoadingView alloc], "initWithFrame:", v3, v4, v5, v6);
    v13 = self->_loadingView;
    self->_loadingView = v12;

    loadingView = self->_loadingView;
  }
  v14 = [(CNFRegLoadingView *)loadingView superview];
  v15 = [(CNFRegServerWebViewController *)self view];

  v16 = v17;
  if (v14 != v15)
  {
    -[CNFRegLoadingView setFrame:](self->_loadingView, "setFrame:", v7, v8, v9, v10);
    [v17 addSubview:self->_loadingView];
    v16 = v17;
  }
}

- (void)hideSpinner
{
  [(CNFRegLoadingView *)self->_loadingView removeFromSuperview];
  loadingView = self->_loadingView;
  self->_loadingView = 0;
}

- (void)loadURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    double v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "LoadURL: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v15 = v4;
      IMLogString();
    }
  }
  if (([(CNFRegServerWebViewController *)self isViewLoaded] & 1) == 0) {
    [(CNFRegServerWebViewController *)self loadView];
  }
  [(CNFRegServerWebViewController *)self showSpinner];
  id v6 = [(CNFRegServerWebViewController *)self overrideURLForURL:v4];
  if (v6 != v4 && [(CNFRegServerWebViewController *)self _shouldLog])
  {
    double v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Overriding URL: {%@} => {%@}", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v16 = v4;
      id v18 = v6;
      IMLogString();
    }
  }
  double v8 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v6 cachePolicy:1 timeoutInterval:30.0];
  if ([(CNFRegServerWebViewController *)self shouldSetHeadersForRequest:v8]) {
    [(CNFRegServerWebViewController *)self setHeadersForRequest:v8];
  }
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    double v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = [v8 allHTTPHeaderFields];
      *(_DWORD *)buf = 138412290;
      id v20 = v10;
      _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "Request headers : %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v17 = [v8 allHTTPHeaderFields];
      IMLogString();
    }
  }
  if (-[CNFRegServerWebViewController canSendURLRequest:](self, "canSendURLRequest:", v8, v17))
  {
    [v8 setValue:@"Preferences" forHTTPHeaderField:@"User-Agent"];
    [v8 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
    v11 = (RUILoader *)objc_alloc_init(MEMORY[0x263F63790]);
    loader = self->_loader;
    self->_loader = v11;

    [(RUILoader *)self->_loader setDelegate:self];
    [(RUILoader *)self->_loader loadXMLUIWithRequest:v8];
    if ([(CNFRegServerWebViewController *)self _shouldLog])
    {
      v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Finished loadingXMLUIWithRequest.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
    }
  }
  else
  {
    if ([(CNFRegServerWebViewController *)self _shouldLog])
    {
      v14 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "ERROR: Not allowed to send URL request, bailing", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
    }
    [(CNFRegServerWebViewController *)self hideSpinner];
    *(unsigned char *)&self->_webControllerFlags &= 0xFCu;
    self->_webControllerFlags.timedOut = 1;
    [(CNFRegServerWebViewController *)self _handleTimeout];
  }
}

- (void)_cleanupLoader
{
  [(RUILoader *)self->_loader cancel];
  [(RUILoader *)self->_loader setDelegate:0];
  loader = self->_loader;
  self->_loader = 0;
}

- (void)_popObjectModelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(NSMutableArray *)self->_objectModels count]) {
    -[CNFRegServerWebViewController _popObjectModelAnimated:]();
  }
  id v16 = [(NSMutableArray *)self->_objectModels lastObject];
  double v5 = [v16 displayedPages];
  uint64_t v6 = [v5 count];
  uint64_t v7 = v6 - 1;
  if (v6 >= 1)
  {
    do
    {
      double v8 = [v5 objectAtIndex:v7];
      double v9 = [(CNFRegServerWebViewController *)self navigationController];
      double v10 = [v9 topViewController];

      if (v10 == v8)
      {
        v11 = [(CNFRegServerWebViewController *)self navigationController];
        v12 = v11;
        if (v7) {
          BOOL v13 = 0;
        }
        else {
          BOOL v13 = v3;
        }
        id v14 = (id)[v11 popViewControllerAnimated:v13];
      }
      unint64_t v15 = v7-- + 1;
    }
    while (v15 > 1);
  }
  [v16 setDelegate:0];
  [(NSMutableArray *)self->_objectModels removeLastObject];
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    double v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CNFRegServerWebViewController *)self navigationController];
      *(_DWORD *)buf = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Asked for parentViewControllerForObjectModel %@  returned %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      [(CNFRegServerWebViewController *)self navigationController];
      v10 = id v9 = v4;
      IMLogString();
    }
  }
  uint64_t v7 = [(CNFRegServerWebViewController *)self navigationController];

  return v7;
}

- (void)objectModelPressedBack:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    double v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "objectModelPressedback: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v9 = v4;
      IMLogString();
    }
  }
  [(CNFRegServerWebViewController *)self _cleanupLoader];
  uint64_t v6 = [(NSMutableArray *)self->_objectModels lastObject];
  if (([v6 goBack] & 1) == 0)
  {
    uint64_t v7 = [(CNFRegServerWebViewController *)self navigationController];
    id v8 = (id)[v7 popViewControllerAnimated:1];

    [(NSMutableArray *)self->_objectModels removeLastObject];
  }
}

- (void)objectModelDidChange:(id)a3
{
  id v4 = a3;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    double v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "objectModelDidChange", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
}

- (void)cancelButtonPressed:(id)a3
{
  id v4 = a3;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    double v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Cancel pressed!", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  [(CNFRegServerWebViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    double v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v55 = a5;
      _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, "loader received object model, actionsignal = %lu", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v53 = (void *)a5;
      IMLogString();
    }
  }
  if (!self->_objectModels)
  {
    id v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    objectModels = self->_objectModels;
    self->_objectModels = v11;

    [MEMORY[0x263F829A0] _setUseCustomBackButtonAction:1];
  }
  switch(a5)
  {
    case 1uLL:
      [(CNFRegServerWebViewController *)self _cleanupLoader];
      [(CNFRegServerWebViewController *)self dismissViewControllerAnimated:1 completion:0];
      goto LABEL_41;
    case 2uLL:
    case 5uLL:
      [v9 setDelegate:self];
      [(NSMutableArray *)self->_objectModels addObject:v9];
      __int16 v13 = [(CNFRegServerWebViewController *)self navigationController];
      [v9 presentInParentViewController:v13 animated:0];

      goto LABEL_40;
    case 3uLL:
      id v14 = [v9 clientInfo];

      if (v14)
      {
        uint64_t v15 = [v9 clientInfo];
        id v16 = [v15 objectForKey:@"status"];

        if (v16)
        {
          id v17 = [v9 clientInfo];
          id v18 = [v17 objectForKey:@"status"];
          uint64_t v19 = [v18 intValue];
        }
        else
        {
          uint64_t v19 = 0xFFFFFFFFLL;
        }
        v36 = objc_msgSend(v9, "clientInfo", v53);
        v37 = [v36 objectForKey:@"apple-id"];

        if (v37)
        {
          v38 = [v9 clientInfo];
          v39 = [v38 objectForKey:@"apple-id"];
          v40 = [v39 stringByRemovingPercentEncoding];
        }
        else
        {
          v40 = 0;
        }
        v41 = [v9 clientInfo];
        v42 = [v41 objectForKey:@"profile-id"];

        if (v42)
        {
          v43 = [v9 clientInfo];
          v44 = [v43 objectForKey:@"profile-id"];
          v45 = [v44 stringByRemovingPercentEncoding];
        }
        else
        {
          v45 = 0;
        }
        v46 = [v9 clientInfo];
        v47 = [v46 objectForKey:@"auth-token"];

        if (v47)
        {
          v48 = [v9 clientInfo];
          v49 = [v48 objectForKey:@"auth-token"];
          v50 = [v49 stringByRemovingPercentEncoding];
        }
        else
        {
          v50 = 0;
        }
        [(CNFRegServerWebViewController *)self receivedStatus:v19 appleID:v40 authID:v45 authToken:v50];
        if ([(CNFRegServerWebViewController *)self _shouldLog])
        {
          v51 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v52 = [v9 clientInfo];
            *(_DWORD *)buf = 138412290;
            unint64_t v55 = (unint64_t)v52;
            _os_log_impl(&dword_21ED18000, v51, OS_LOG_TYPE_DEFAULT, "Received clientInfo %@", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            v53 = [v9 clientInfo];
            IMLogString();
          }
        }
      }
      else
      {
        if ([(NSMutableArray *)self->_objectModels count]) {
          [(NSMutableArray *)self->_objectModels removeLastObject];
        }
        objc_msgSend(v9, "setDelegate:", self, v53);
        [(NSMutableArray *)self->_objectModels addObject:v9];
        if ([(NSMutableArray *)self->_objectModels count] == 1)
        {
          id v20 = [v9 defaultPages];
          __int16 v21 = [v20 objectAtIndex:0];

          id v22 = NSDictionary;
          uint64_t v23 = CommunicationsSetupUIBundle();
          v24 = CNFRegStringTableName();
          v25 = [v23 localizedStringForKey:@"FACETIME_ALERT_CANCEL" value:&stru_26D05D4F8 table:v24];
          v26 = objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v25, @"label", @"cancel", @"name", @"buttonBarItem", @"type", 0);

          id v27 = objc_alloc_init(MEMORY[0x263F63778]);
          [v27 setAttributes:v26];
          [v21 setLeftNavigationBarButtonItem:v27];
          v28 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonPressed_];
          v29 = [(CNFRegServerWebViewController *)self navigationController];
          v30 = [v29 navigationItem];
          [v30 setLeftBarButtonItem:v28];
        }
        v31 = [(CNFRegServerWebViewController *)self navigationController];
        [v9 presentInParentViewController:v31 animated:0];

        v32 = [(CNFRegServerWebViewController *)self navigationController];
        v33 = [v32 viewControllers];
        v34 = (void *)[v33 mutableCopy];

        if ((unint64_t)[v34 count] >= 3) {
          objc_msgSend(v34, "removeObjectAtIndex:", objc_msgSend(v34, "count") - 2);
        }
        v35 = [(CNFRegServerWebViewController *)self navigationController];
        [v35 setViewControllers:v34];
      }
      goto LABEL_40;
    case 4uLL:
      [(CNFRegServerWebViewController *)self _popObjectModelAnimated:1];
      goto LABEL_40;
    default:
LABEL_40:
      [(CNFRegServerWebViewController *)self _cleanupLoader];
LABEL_41:

      return;
  }
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v9;
      _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "objectModel:pressedLink: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v26 = v9;
      IMLogString();
    }
  }
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v12 = [(RUILoader *)self->_loader URL];
  __int16 v13 = [v12 absoluteURL];
  id v14 = [v9 absoluteURL];
  char v15 = [v13 isEqual:v14];

  if ((v15 & 1) == 0)
  {
LABEL_9:
    [(CNFRegServerWebViewController *)self _cleanupLoader];
    id v16 = [v10 lowercaseString];
    int v17 = [v16 isEqualToString:@"post"];

    if (v17)
    {
      id v18 = [v8 postbackData];
    }
    else
    {
      id v18 = 0;
    }
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v9 cachePolicy:1 timeoutInterval:30.0];
    id v20 = v19;
    if (v18)
    {
      [v19 setHTTPBody:v18];
      [v20 setHTTPMethod:@"POST"];
      [v20 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
    }
    if ([(CNFRegServerWebViewController *)self shouldSetHeadersForRequest:v20]) {
      [(CNFRegServerWebViewController *)self setHeadersForRequest:v20];
    }
    if ([(CNFRegServerWebViewController *)self _shouldLog])
    {
      __int16 v21 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [v20 allHTTPHeaderFields];
        *(_DWORD *)buf = 138412290;
        id v29 = v22;
        _os_log_impl(&dword_21ED18000, v21, OS_LOG_TYPE_DEFAULT, "Request headers : %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        id v27 = [v20 allHTTPHeaderFields];
        IMLogString();
      }
    }
    if (-[CNFRegServerWebViewController canSendURLRequest:](self, "canSendURLRequest:", v20, v27))
    {
      [v20 setValue:@"Preferences" forHTTPHeaderField:@"User-Agent"];
      uint64_t v23 = (RUILoader *)objc_alloc_init(MEMORY[0x263F63790]);
      loader = self->_loader;
      self->_loader = v23;

      [(RUILoader *)self->_loader setDelegate:self];
      [(RUILoader *)self->_loader loadXMLUIWithRequest:v20];
      if ([(CNFRegServerWebViewController *)self _shouldLog])
      {
        v25 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v25, OS_LOG_TYPE_DEFAULT, "Finished loadingXMLUIWithRequest.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }
      }
    }
  }
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "objectModel:pressedButton: %@ attributes: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v15 = v9;
      id v16 = v10;
      IMLogString();
    }
  }
  if (objc_msgSend(v9, "isEqual:", @"cancel", v15, v16))
  {
    [(CNFRegServerWebViewController *)self cancelButtonPressed:0];
  }
  else
  {
    uint64_t v12 = [v10 objectForKey:@"url"];
    if ([v12 length])
    {
      __int16 v13 = [NSURL URLWithString:v12];
      id v14 = [MEMORY[0x263F82438] sharedApplication];
      [v14 openURL:v13 withCompletionHandler:0];
    }
  }
}

- (void)loader:(id)a3 didFailWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Loader reported Error %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v9 = v7;
      IMLogString();
    }
  }
  [(CNFRegServerWebViewController *)self _cleanupLoader];
}

- (void)receivedStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    uint64_t v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = self;
      _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "Received status - this should be overridden by a subclass! I'm a %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
}

- (id)overrideURLForURL:(id)a3
{
  id v3 = a3;
  return v3;
}

- (BOOL)shouldSetHeadersForRequest:(id)a3
{
  return 0;
}

- (BOOL)canSendURLRequest:(id)a3
{
  return 1;
}

- (void)_startTimeoutWithDuration:(double)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!self->_timeoutTimer)
  {
    if ([(CNFRegServerWebViewController *)self _shouldLog])
    {
      double v5 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v10 = a3;
        _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Starting timeout timer with duration %0.2f", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (IMShouldLog())
        {
          double v8 = a3;
          IMLogString();
        }
      }
    }
    self->_webControllerFlags.timedOut = 0;
    objc_msgSend(MEMORY[0x263EFFA20], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timeoutFired_, 0, 0, a3, *(void *)&v8);
    id v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v6;
  }
}

- (void)_stopTimeout
{
  if (self->_timeoutTimer)
  {
    if ([(CNFRegServerWebViewController *)self _shouldLog])
    {
      id v3 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v5 = 0;
        _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Stopping timeout timer", v5, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (IMShouldLog()) {
          IMLogString();
        }
      }
    }
    [(NSTimer *)self->_timeoutTimer invalidate];
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
}

- (void)_timeoutFired:(id)a3
{
  id v4 = a3;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    double v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Timeout timer fired", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  [(CNFRegServerWebViewController *)self _stopTimeout];
  self->_webControllerFlags.timedOut = 1;
  [(CNFRegServerWebViewController *)self _handleTimeout];
}

- (void)applicationWillSuspend
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegServerWebViewController;
  [(CNFRegServerWebViewController *)&v3 applicationWillSuspend];
  [(CNFRegServerWebViewController *)self _stopTimeout];
  [(CNFRegServerWebViewController *)self dismissViewControllerAnimated:0 completion:0];
}

- (BOOL)isLoaded
{
  return (*(unsigned char *)&self->_webControllerFlags >> 1) & 1;
}

- (BOOL)isLoading
{
  return *(unsigned char *)&self->_webControllerFlags & 1;
}

- (BOOL)timedOut
{
  return self->_webControllerFlags.timedOut != 0;
}

- (CNFRegController)regController
{
  return self->_regController;
}

- (void)setRegController:(id)a3
{
}

- (UIWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_regController, 0);
}

- (void)_popObjectModelAnimated:.cold.1()
{
}

@end