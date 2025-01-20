@interface CNFRegAccountWebViewController
- (BOOL)_loadURLFromBag;
- (BOOL)canSendURLRequest:(id)a3;
- (BOOL)failedBagLoad;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldSetHeadersForRequest:(id)a3;
- (CNFRegAccountWebViewController)initWithRegController:(id)a3;
- (id)_nonModalParentController;
- (id)_viewPortForFormSheetPresentation;
- (id)_viewPortForNormalPresentation;
- (id)_viewPortStringForSize:(CGSize)a3;
- (id)authIdHeaderValue;
- (id)authTokenHeaderValue;
- (id)bagKey;
- (id)clientInfoHeaderValue;
- (id)interfaceLayoutHeaderValue;
- (id)logName;
- (id)pushTokenHeaderValue;
- (id)securityHeaderValue;
- (id)serviceHeaderValue;
- (id)viewPortHeaderValue;
- (void)_bagLoadTimeout:(id)a3;
- (void)_handleFTServerBagFinishedLoading;
- (void)_reload;
- (void)_reloadDelayed;
- (void)_showGenericErrorWithHandler;
- (void)_showURLDidNotLoadAlert;
- (void)_startBagLoadTimer;
- (void)_startListeningForBagLoad;
- (void)_stopBagLoadTimer;
- (void)_stopCurrentReload;
- (void)_stopListeningForBagLoad;
- (void)cancelTapped;
- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6;
- (void)dealloc;
- (void)loadView;
- (void)setFailedBagLoad:(BOOL)a3;
- (void)setHeadersForRequest:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNFRegAccountWebViewController

- (CNFRegAccountWebViewController)initWithRegController:(id)a3
{
  id v4 = a3;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "CNFRegAccountWebViewController initWithRegController", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CNFRegAccountWebViewController;
  v6 = [(CNFRegServerWebViewController *)&v13 initWithRegController:v4];
  if (v6)
  {
    v7 = [MEMORY[0x263F3BB58] sharedInstance];
    char v8 = [v7 isLoaded];
    BOOL v9 = [(CNFRegServerWebViewController *)v6 _shouldLog];
    if (v8)
    {
      if (v9)
      {
        v10 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, "CNFRegAccountWebViewController bag already loaded", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }
      }
    }
    else
    {
      if (v9)
      {
        v11 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "CNFRegAccountWebViewController starting bag load", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }
      }
      [v7 startBagLoad];
    }
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(NSTimer *)self->_bagLoadTimer invalidate];
  bagLoadTimer = self->_bagLoadTimer;
  self->_bagLoadTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)CNFRegAccountWebViewController;
  [(CNFRegServerWebViewController *)&v5 dealloc];
}

- (void)loadView
{
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "CNFRegAccountWebViewController loadView", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)CNFRegAccountWebViewController;
  [(CNFRegServerWebViewController *)&v19 loadView];
  id v4 = +[CNFRegAppearanceController globalAppearanceController];
  objc_super v5 = [v4 webViewBackgroundColor];
  v6 = [(CNFRegAccountWebViewController *)self view];
  [v6 setBackgroundColor:v5];

  uint64_t v7 = [v4 webViewIsOpaque];
  char v8 = [(CNFRegAccountWebViewController *)self view];
  [v8 setOpaque:v7];

  BOOL v9 = [v4 webViewBackgroundView];
  v10 = [(CNFRegAccountWebViewController *)self view];
  [v10 bounds];
  objc_msgSend(v9, "setFrame:");

  v11 = [(CNFRegAccountWebViewController *)self view];
  [v11 addSubview:v9];

  v12 = [(CNFRegAccountWebViewController *)self view];
  [v12 sendSubviewToBack:v9];

  objc_super v13 = CommunicationsSetupUIBundle();
  v14 = CNFRegStringTableName();
  v15 = [v13 localizedStringForKey:@"FACETIME_ACCOUNT_PAGE_TITLE" value:&stru_26D05D4F8 table:v14];
  v16 = [(CNFRegAccountWebViewController *)self navigationItem];
  [v16 setTitle:v15];

  v17 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelTapped];
  v18 = [(CNFRegAccountWebViewController *)self navigationItem];
  [v18 setLeftBarButtonItem:v17];
}

- (void)viewDidLoad
{
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "CNFRegAccountWebViewController viewDidLoad", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CNFRegAccountWebViewController;
  [(CNFRegServerWebViewController *)&v6 viewDidLoad];
  if (![(CNFRegAccountWebViewController *)self _loadURLFromBag])
  {
    [(CNFRegServerWebViewController *)self showSpinner];
    id v4 = [MEMORY[0x263F3BB58] sharedInstance];
    char v5 = [v4 isLoaded];

    if (v5)
    {
      [(CNFRegAccountWebViewController *)self setFailedBagLoad:1];
    }
    else
    {
      [(CNFRegAccountWebViewController *)self _startListeningForBagLoad];
      [(CNFRegAccountWebViewController *)self _startBagLoadTimer];
    }
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return CNFRegShouldRotateToOrientation(a3);
}

- (id)logName
{
  return @"Server-Account";
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegAccountWebViewController;
  [(CNFRegServerWebViewController *)&v4 viewDidAppear:a3];
  if ([(CNFRegAccountWebViewController *)self failedBagLoad]) {
    [(CNFRegAccountWebViewController *)self _showURLDidNotLoadAlert];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegAccountWebViewController;
  [(CNFRegServerWebViewController *)&v4 viewWillDisappear:a3];
  [(CNFRegAccountWebViewController *)self _stopCurrentReload];
}

- (BOOL)shouldSetHeadersForRequest:(id)a3
{
  v3 = [a3 valueForHTTPHeaderField:@"x-protocol-version"];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)setHeadersForRequest:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNFRegAccountWebViewController;
  [(CNFRegServerWebViewController *)&v10 setHeadersForRequest:v4];
  [v4 addValue:@"6" forHTTPHeaderField:@"x-protocol-version"];
  char v5 = [(CNFRegAccountWebViewController *)self clientInfoHeaderValue];
  if (v5) {
    [v4 addValue:v5 forHTTPHeaderField:@"x-apple-client-info"];
  }
  objc_super v6 = [(CNFRegAccountWebViewController *)self viewPortHeaderValue];
  if (v6) {
    [v4 addValue:v6 forHTTPHeaderField:@"x-vc-view-res"];
  }
  uint64_t v7 = [(CNFRegAccountWebViewController *)self securityHeaderValue];
  if (v7) {
    [v4 addValue:v7 forHTTPHeaderField:@"x-ds-client-id"];
  }
  char v8 = [(CNFRegAccountWebViewController *)self serviceHeaderValue];
  if (v8) {
    [v4 addValue:v8 forHTTPHeaderField:@"x-vc-service"];
  }
  BOOL v9 = [(CNFRegAccountWebViewController *)self interfaceLayoutHeaderValue];
  if (v9) {
    [v4 addValue:v9 forHTTPHeaderField:@"x-vc-ui-layout"];
  }
}

- (BOOL)canSendURLRequest:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNFRegAccountWebViewController;
  if (![(CNFRegServerWebViewController *)&v20 canSendURLRequest:v4]) {
    goto LABEL_45;
  }
  char v5 = [v4 valueForHTTPHeaderField:@"x-apple-client-info"];

  if (!v5)
  {
    if (![(CNFRegServerWebViewController *)self _shouldLog]) {
      goto LABEL_45;
    }
    v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v19 = 0;
      _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "No client info for request, denying send", v19, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0) {
      goto LABEL_45;
    }
LABEL_44:
    IMLogString();
LABEL_45:
    BOOL v11 = 0;
    goto LABEL_46;
  }
  objc_super v6 = [v4 valueForHTTPHeaderField:@"x-ds-client-id"];

  if (!v6)
  {
    if (![(CNFRegServerWebViewController *)self _shouldLog]) {
      goto LABEL_45;
    }
    objc_super v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v19 = 0;
      _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "No security header for request, denying send", v19, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  uint64_t v7 = [v4 valueForHTTPHeaderField:@"x-protocol-version"];

  if (!v7)
  {
    if (![(CNFRegServerWebViewController *)self _shouldLog]) {
      goto LABEL_45;
    }
    v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v19 = 0;
      _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "No protocol header for request, denying send", v19, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  char v8 = [v4 valueForHTTPHeaderField:@"x-vc-service"];

  if (!v8)
  {
    if (![(CNFRegServerWebViewController *)self _shouldLog]) {
      goto LABEL_45;
    }
    v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v19 = 0;
      _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "No service header for request, denying send", v19, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  BOOL v9 = [v4 valueForHTTPHeaderField:@"x-vc-ui-layout"];

  if (!v9)
  {
    if (![(CNFRegServerWebViewController *)self _shouldLog]) {
      goto LABEL_45;
    }
    v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v19 = 0;
      _os_log_impl(&dword_21ED18000, v16, OS_LOG_TYPE_DEFAULT, "No layout header for request, denying send", v19, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  objc_super v10 = [v4 valueForHTTPHeaderField:@"x-vc-view-res"];

  if (!v10)
  {
    if (![(CNFRegServerWebViewController *)self _shouldLog]) {
      goto LABEL_45;
    }
    v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v19 = 0;
      _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_DEFAULT, "No viewport header for request, denying send", v19, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  BOOL v11 = 1;
LABEL_46:

  return v11;
}

- (void)_reload
{
  if (![(CNFRegServerWebViewController *)self isLoading])
  {
    [(CNFRegAccountWebViewController *)self _loadURLFromBag];
  }
}

- (void)_stopCurrentReload
{
}

- (void)_reloadDelayed
{
  [(CNFRegAccountWebViewController *)self _stopCurrentReload];
  [(CNFRegAccountWebViewController *)self performSelector:sel__reload withObject:0 afterDelay:0.0];
}

- (BOOL)_loadURLFromBag
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(CNFRegAccountWebViewController *)self bagKey];
  id v4 = [MEMORY[0x263EFFA40] CNFRegServerURLOverride];
  if (v4)
  {
    char v5 = [NSURL URLWithString:v4];
    if (v5) {
      objc_super v6 = @"defaults override";
    }
    else {
      objc_super v6 = 0;
    }
  }
  else if (v3)
  {
    BOOL v11 = [MEMORY[0x263F3BB58] sharedInstance];
    char v5 = [v11 urlWithKey:v3];

    if (v5)
    {
      objc_super v6 = [NSString stringWithFormat:@"bag key {%@}", v3];
    }
    else
    {
      objc_super v6 = 0;
    }
  }
  else
  {
    objc_super v6 = 0;
    char v5 = 0;
  }
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    uint64_t v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      objc_super v13 = v6;
      __int16 v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Found url via %@ : %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8) {
    [(CNFRegServerWebViewController *)self loadURL:v5];
  }

  return v9;
}

- (void)_showURLDidNotLoadAlert
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CNFRegAccountWebViewController *)self bagKey];
      *(_DWORD *)buf = 138412290;
      objc_super v19 = v4;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Server bag finished loading, but could not find url for key : %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      uint64_t v16 = [(CNFRegAccountWebViewController *)self bagKey];
      IMLogString();
    }
  }
  char v5 = CommunicationsSetupUIBundle();
  objc_super v6 = CNFRegStringTableName();
  uint64_t v7 = [v5 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v6];

  BOOL v8 = CommunicationsSetupUIBundle();
  BOOL v9 = CNFRegStringTableName();
  objc_super v10 = [v8 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_GENERIC" value:&stru_26D05D4F8 table:v9];

  BOOL v11 = CommunicationsSetupUIBundle();
  v12 = CNFRegStringTableName();
  objc_super v13 = [v11 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v12];

  __int16 v14 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v10 preferredStyle:1];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__CNFRegAccountWebViewController__showURLDidNotLoadAlert__block_invoke;
  v17[3] = &unk_2644F0988;
  v17[4] = self;
  v15 = [MEMORY[0x263F82400] actionWithTitle:v13 style:0 handler:v17];
  [v14 addAction:v15];

  [(CNFRegAccountWebViewController *)self presentViewController:v14 animated:1 completion:0];
}

uint64_t __57__CNFRegAccountWebViewController__showURLDidNotLoadAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelTapped];
}

- (void)_bagLoadTimeout:(id)a3
{
  id v4 = a3;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    char v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Bag load timed out", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  [(CNFRegAccountWebViewController *)self _stopBagLoadTimer];
  [(CNFRegAccountWebViewController *)self _stopListeningForBagLoad];
  [(CNFRegAccountWebViewController *)self _showURLDidNotLoadAlert];
}

- (void)_startBagLoadTimer
{
  if (!self->_bagLoadTimer)
  {
    self->_bagLoadTimer = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__bagLoadTimeout_ selector:0 userInfo:0 repeats:15.0];
    MEMORY[0x270F9A758]();
  }
}

- (void)_stopBagLoadTimer
{
  bagLoadTimer = self->_bagLoadTimer;
  if (bagLoadTimer)
  {
    [(NSTimer *)bagLoadTimer invalidate];
    id v4 = self->_bagLoadTimer;
    self->_bagLoadTimer = 0;
  }
}

- (void)_handleFTServerBagFinishedLoading
{
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Server bag finished loading", v4, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  if ([(CNFRegAccountWebViewController *)self _loadURLFromBag])
  {
    [(CNFRegAccountWebViewController *)self _stopListeningForBagLoad];
    [(CNFRegAccountWebViewController *)self _stopBagLoadTimer];
  }
  else
  {
    [(CNFRegAccountWebViewController *)self _showURLDidNotLoadAlert];
  }
}

- (void)_startListeningForBagLoad
{
  if (!self->_listeningForBagLoad)
  {
    if ([(CNFRegServerWebViewController *)self _shouldLog])
    {
      v3 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v6 = 0;
        _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Started listening for bag load", v6, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (IMShouldLog()) {
          IMLogString();
        }
      }
    }
    id v4 = [MEMORY[0x263F3BB58] sharedInstance];
    char v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel__handleFTServerBagFinishedLoading name:*MEMORY[0x263F3BB00] object:v4];
    self->_listeningForBagLoad = 1;
  }
}

- (void)_stopListeningForBagLoad
{
  if (self->_listeningForBagLoad)
  {
    if ([(CNFRegServerWebViewController *)self _shouldLog])
    {
      v3 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v6 = 0;
        _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Stopped listening for bag load", v6, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (IMShouldLog()) {
          IMLogString();
        }
      }
    }
    id v4 = [MEMORY[0x263F3BB58] sharedInstance];
    char v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x263F3BB00] object:v4];
    self->_listeningForBagLoad = 0;
  }
}

- (void)_showGenericErrorWithHandler
{
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "_showGenericErrorWithHandler", v15, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  id v4 = CommunicationsSetupUIBundle();
  char v5 = CNFRegStringTableName();
  objc_super v6 = [v4 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v5];

  uint64_t v7 = CommunicationsSetupUIBundle();
  BOOL v8 = CNFRegStringTableName();
  BOOL v9 = [v7 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_GENERIC" value:&stru_26D05D4F8 table:v8];

  objc_super v10 = CommunicationsSetupUIBundle();
  BOOL v11 = CNFRegStringTableName();
  v12 = [v10 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v11];

  objc_super v13 = [MEMORY[0x263F82418] alertControllerWithTitle:v6 message:v9 preferredStyle:1];
  __int16 v14 = [MEMORY[0x263F82400] actionWithTitle:v12 style:0 handler:0];
  [v13 addAction:v14];

  [(CNFRegAccountWebViewController *)self presentViewController:v13 animated:1 completion:0];
}

- (id)_viewPortStringForSize:(CGSize)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ldx%ld", (uint64_t)fabs(floor(a3.width)), (uint64_t)fabs(floor(a3.height)));
}

- (id)_nonModalParentController
{
  v2 = [(CNFRegAccountWebViewController *)self parentViewController];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)_viewPortForFormSheetPresentation
{
  return -[CNFRegAccountWebViewController _viewPortStringForSize:](self, "_viewPortStringForSize:", 540.0, 576.0);
}

- (id)_viewPortForNormalPresentation
{
  id v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  BOOL v8 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  objc_super v10 = [(CNFRegAccountWebViewController *)self _nonModalParentController];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v11 = [(CNFRegAccountWebViewController *)self navigationController];
      v12 = [v11 navigationBar];
      [v12 defaultSizeForOrientation:1];
      double v14 = v13;

      double v7 = v7 - v14;
    }
  }
  if (v9 == 1) {
    double v15 = 320.0;
  }
  else {
    double v15 = v5;
  }
  uint64_t v16 = -[CNFRegAccountWebViewController _viewPortStringForSize:](self, "_viewPortStringForSize:", v15, v7);

  return v16;
}

- (id)viewPortHeaderValue
{
  v2 = self;
  id v3 = [(CNFRegAccountWebViewController *)v2 _nonModalParentController];
  double v4 = v3;
  double v5 = v2;
  if (v3)
  {
    double v5 = v3;
  }
  if ([(CNFRegAccountWebViewController *)v5 modalPresentationStyle] == 2) {
    [(CNFRegAccountWebViewController *)v2 _viewPortForFormSheetPresentation];
  }
  else {
  double v6 = [(CNFRegAccountWebViewController *)v2 _viewPortForNormalPresentation];
  }

  return v6;
}

- (id)securityHeaderValue
{
  v2 = (void *)CUTWeakLinkClass();
  if (v2)
  {
    v2 = [v2 appleIDClientIdentifier];
  }
  return v2;
}

- (id)pushTokenHeaderValue
{
  v2 = (objc_class *)CUTWeakLinkClass();
  if (v2)
  {
    if (!pushTokenHeaderValue__APSEnvironmentProduction)
    {
      id v3 = (void **)CUTWeakLinkSymbol();
      if (v3) {
        double v4 = *v3;
      }
      else {
        double v4 = 0;
      }
      objc_storeStrong((id *)&pushTokenHeaderValue__APSEnvironmentProduction, v4);
    }
    id v5 = [v2 alloc];
    double v6 = (void *)[v5 initWithEnvironmentName:pushTokenHeaderValue__APSEnvironmentProduction queue:MEMORY[0x263EF83A0]];
    v2 = [v6 publicToken];
  }
  return v2;
}

- (id)serviceHeaderValue
{
  v2 = [(CNFRegServerWebViewController *)self regController];
  unint64_t v3 = [v2 serviceType];

  if (v3 > 2) {
    return 0;
  }
  else {
    return off_2644F0CF8[v3];
  }
}

- (id)interfaceLayoutHeaderValue
{
  if (interfaceLayoutHeaderValue_onceToken != -1) {
    dispatch_once(&interfaceLayoutHeaderValue_onceToken, &__block_literal_global_8);
  }
  if (interfaceLayoutHeaderValue_isInPreferences) {
    v2 = @"k2-settings3";
  }
  else {
    v2 = @"k2-app3";
  }
  unint64_t v3 = @"p2-settings3";
  if (!interfaceLayoutHeaderValue_isInPreferences) {
    unint64_t v3 = @"p2-app3";
  }
  if (interfaceLayoutHeaderValue_isAniPad) {
    return v2;
  }
  else {
    return v3;
  }
}

void __60__CNFRegAccountWebViewController_interfaceLayoutHeaderValue__block_invoke()
{
  MainBundle = CFBundleGetMainBundle();
  CFStringRef Identifier = CFBundleGetIdentifier(MainBundle);
  if (Identifier) {
    BOOL v2 = CFEqual(Identifier, @"com.apple.Preferences") != 0;
  }
  else {
    BOOL v2 = 0;
  }
  interfaceLayoutHeaderValue_isInPreferences = v2;
  id v3 = [MEMORY[0x263F82670] currentDevice];
  interfaceLayoutHeaderValue_isAniPad = [v3 userInterfaceIdiom] == 1;
}

- (id)clientInfoHeaderValue
{
  if (clientInfoHeaderValue_once != -1) {
    dispatch_once(&clientInfoHeaderValue_once, &__block_literal_global_224);
  }
  BOOL v2 = (void *)clientInfoHeaderValue_clientInfo;
  return v2;
}

void __55__CNFRegAccountWebViewController_clientInfoHeaderValue__block_invoke()
{
  id v22 = [MEMORY[0x263F3BB18] sharedInstance];
  v0 = NSString;
  v1 = [v22 model];
  uint64_t v2 = [v0 stringWithFormat:@"<%@> ", v1];
  id v3 = (void *)clientInfoHeaderValue_clientInfo;
  clientInfoHeaderValue_clientInfo = v2;

  double v4 = (void *)clientInfoHeaderValue_clientInfo;
  id v5 = [v22 productName];
  double v6 = [v22 productVersion];
  double v7 = [v22 productBuildVersion];
  uint64_t v8 = [v4 stringByAppendingFormat:@"<%@;%@;%@> ", v5, v6, v7];
  uint64_t v9 = (void *)clientInfoHeaderValue_clientInfo;
  clientInfoHeaderValue_clientInfo = v8;

  objc_super v10 = CommunicationsSetupUIBundle();
  BOOL v11 = [v10 infoDictionary];

  v12 = [MEMORY[0x263F086E0] mainBundle];
  double v13 = [v12 infoDictionary];

  uint64_t v14 = *MEMORY[0x263EFFB58];
  double v15 = [v11 objectForKey:*MEMORY[0x263EFFB58]];
  uint64_t v16 = *MEMORY[0x263EFFB70];
  v17 = [v11 objectForKey:*MEMORY[0x263EFFB70]];
  v18 = [v13 objectForKey:v14];
  objc_super v19 = [v13 objectForKey:v16];
  uint64_t v20 = [(id)clientInfoHeaderValue_clientInfo stringByAppendingFormat:@"<%@/%@ (%@/%@)>", v15, v17, v18, v19];
  v21 = (void *)clientInfoHeaderValue_clientInfo;
  clientInfoHeaderValue_clientInfo = v20;
}

- (id)bagKey
{
  return 0;
}

- (void)cancelTapped
{
}

- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
}

- (id)authIdHeaderValue
{
  return 0;
}

- (id)authTokenHeaderValue
{
  return 0;
}

- (BOOL)failedBagLoad
{
  return self->_failedBagLoad;
}

- (void)setFailedBagLoad:(BOOL)a3
{
  self->_failedBagLoad = a3;
}

- (void).cxx_destruct
{
}

@end