@interface BCWebViewController
- (BCWebViewController)initWithCallbackURI:(id)a3;
- (BCWebViewControllerDelegate)delegate;
- (NSString)callbackURI;
- (WKWebView)webkitView;
- (void)loadURL:(id)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentCertificatErrorForHost:(id)a3;
- (void)reload;
- (void)setCallbackURI:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWebkitView:(id)a3;
- (void)setupConstraints;
- (void)setupSubviews;
- (void)updateNavigationBar;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation BCWebViewController

- (BCWebViewController)initWithCallbackURI:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BCWebViewController;
  v6 = [(BCWebViewController *)&v16 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackURI, a3);
    id v8 = objc_alloc_init(MEMORY[0x263F1FA60]);
    v9 = [MEMORY[0x263F1FA68] nonPersistentDataStore];
    [v8 setWebsiteDataStore:v9];

    id v10 = objc_alloc(MEMORY[0x263F1FA58]);
    uint64_t v11 = objc_msgSend(v10, "initWithFrame:configuration:", v8, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    webkitView = v7->_webkitView;
    v7->_webkitView = (WKWebView *)v11;

    v13 = objc_alloc_init(BCProgressIndicatorView);
    progressIndicatorView = v7->_progressIndicatorView;
    v7->_progressIndicatorView = v13;
  }
  return v7;
}

- (void)loadURL:(id)a3
{
  id v5 = (objc_class *)MEMORY[0x263F08BD8];
  id v6 = a3;
  id v9 = (id)[[v5 alloc] initWithURL:v6];
  v7 = [(BCWebViewController *)self webkitView];
  id v8 = (id)[v7 loadRequest:v9];

  if (self)
  {
    objc_storeStrong((id *)&self->_originURL, a3);

    self->_wasCallbackCaptured = 0;
  }
  else
  {
  }
}

- (void)reload
{
  v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_228C26000, v3, OS_LOG_TYPE_DEFAULT, "BCWebViewController: reload", v13, 2u);
  }

  if (self)
  {
    self->_wasCallbackCaptured = 0;
    serverErrorView = self->_serverErrorView;
    if (serverErrorView)
    {
      [(BCServerErrorView *)serverErrorView removeFromSuperview];
      id v5 = self->_serverErrorView;
      self->_serverErrorView = 0;
    }
    invalidCertificatView = self->_invalidCertificatView;
    if (invalidCertificatView)
    {
      [(BCInvalidCertificatView *)invalidCertificatView removeFromSuperview];
      v7 = self->_invalidCertificatView;
      self->_invalidCertificatView = 0;
    }
  }
  id v8 = [(BCWebViewController *)self webkitView];
  id v9 = [v8 URL];

  if (v9)
  {
    id v10 = [(BCWebViewController *)self webkitView];
    id v11 = (id)[v10 reload];
  }
  else
  {
    if (self) {
      originURL = self->_originURL;
    }
    else {
      originURL = 0;
    }
    [(BCWebViewController *)self loadURL:originURL];
  }
}

- (void)updateNavigationBar
{
  v2 = LogCategory_Daemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_228C26000, v2, OS_LOG_TYPE_DEFAULT, "BCWebViewController: updateNavigationBar", v3, 2u);
  }
}

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(BCWebViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)BCWebViewController;
  [(BCWebViewController *)&v25 viewDidLoad];
  [(BCWebViewController *)self setupSubviews];
  [(BCWebViewController *)self setupConstraints];
  if (self)
  {
    id v3 = LogCategory_Daemon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228C26000, v3, OS_LOG_TYPE_DEFAULT, "BCWebViewController: setupObservers", buf, 2u);
    }

    v4 = [(BCWebViewController *)self webkitView];
    [v4 addObserver:self forKeyPath:@"hasOnlySecureContent" options:1 context:0];

    id v5 = [(BCWebViewController *)self webkitView];
    [v5 addObserver:self forKeyPath:@"estimatedProgress" options:1 context:0];

    id v6 = [(BCWebViewController *)self webkitView];
    [v6 addObserver:self forKeyPath:@"canGoBack" options:1 context:0];

    v7 = [(BCWebViewController *)self webkitView];
    [v7 addObserver:self forKeyPath:@"canGoForward" options:1 context:0];

    [(BCProgressIndicatorView *)self->_progressIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = (void *)MEMORY[0x263F08938];
    v24 = self->_progressIndicatorView;
    v22 = [(BCProgressIndicatorView *)v24 topAnchor];
    v23 = [(BCWebViewController *)self webkitView];
    v21 = [v23 topAnchor];
    v20 = [v22 constraintEqualToAnchor:v21 constant:-0.0];
    *(void *)buf = v20;
    id v8 = self->_progressIndicatorView;
    v18 = [(BCProgressIndicatorView *)v8 leadingAnchor];
    id v9 = [(BCWebViewController *)self webkitView];
    id v10 = [v9 leadingAnchor];
    id v11 = [v18 constraintEqualToAnchor:v10 constant:-0.0];
    v27 = v11;
    v12 = self->_progressIndicatorView;
    v13 = [(BCProgressIndicatorView *)v12 trailingAnchor];
    v14 = [(BCWebViewController *)self webkitView];
    v15 = [v14 trailingAnchor];
    objc_super v16 = [v13 constraintEqualToAnchor:v15 constant:0.0];
    v28 = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:3];
    [v19 activateConstraints:v17];
  }
}

- (void)setupSubviews
{
  id v3 = _SFIPhoneSafariUserAgentString();
  v4 = [(BCWebViewController *)self webkitView];
  [v4 setCustomUserAgent:v3];

  id v5 = [(BCWebViewController *)self webkitView];
  [v5 setNavigationDelegate:self];

  id v6 = [(BCWebViewController *)self view];
  v7 = [(BCWebViewController *)self webkitView];
  [v6 addSubview:v7];

  id v8 = [(BCWebViewController *)self view];
  if (self) {
    progressIndicatorView = self->_progressIndicatorView;
  }
  else {
    progressIndicatorView = 0;
  }
  id v10 = v8;
  [v8 addSubview:progressIndicatorView];
}

- (void)setupConstraints
{
  v26[4] = *MEMORY[0x263EF8340];
  id v3 = [(BCWebViewController *)self webkitView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v16 = (void *)MEMORY[0x263F08938];
  objc_super v25 = [(BCWebViewController *)self webkitView];
  v23 = [v25 topAnchor];
  v24 = [(BCWebViewController *)self view];
  v22 = [v24 topAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v26[0] = v21;
  v20 = [(BCWebViewController *)self webkitView];
  v18 = [v20 leftAnchor];
  v19 = [(BCWebViewController *)self view];
  v17 = [v19 leftAnchor];
  v15 = [v18 constraintEqualToAnchor:v17];
  v26[1] = v15;
  v14 = [(BCWebViewController *)self webkitView];
  v4 = [v14 rightAnchor];
  id v5 = [(BCWebViewController *)self view];
  id v6 = [v5 rightAnchor];
  v7 = [v4 constraintEqualToAnchor:v6];
  v26[2] = v7;
  id v8 = [(BCWebViewController *)self webkitView];
  id v9 = [v8 bottomAnchor];
  id v10 = [(BCWebViewController *)self view];
  id v11 = [v10 bottomAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v26[3] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];
  [v16 activateConstraints:v13];
}

- (void)presentCertificatErrorForHost:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v4;
    _os_log_impl(&dword_228C26000, v5, OS_LOG_TYPE_DEFAULT, "BCWebViewController: presentCertificatErrorForHost: %@", buf, 0xCu);
  }

  v26 = v4;
  id v6 = -[BCInvalidCertificatView initWithHost:]((id *)[BCInvalidCertificatView alloc], v4);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [(BCWebViewController *)self view];
  [v7 addSubview:v6];

  v18 = (void *)MEMORY[0x263F08938];
  v24 = [v6 topAnchor];
  objc_super v25 = [(BCWebViewController *)self webkitView];
  v23 = [v25 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v27[0] = v22;
  v20 = [v6 leftAnchor];
  v21 = [(BCWebViewController *)self webkitView];
  v19 = [v21 leftAnchor];
  v17 = [v20 constraintEqualToAnchor:v19];
  v27[1] = v17;
  objc_super v16 = [v6 rightAnchor];
  id v8 = [(BCWebViewController *)self webkitView];
  id v9 = [v8 rightAnchor];
  id v10 = [v16 constraintEqualToAnchor:v9];
  v27[2] = v10;
  id v11 = [v6 bottomAnchor];
  v12 = [(BCWebViewController *)self webkitView];
  v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v27[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  [v18 activateConstraints:v15];

  if (self) {
    objc_storeStrong((id *)&self->_invalidCertificatView, v6);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((!self || !self->_wasCallbackCaptured)
    && [v9 isEqualToString:@"hasOnlySecureContent"])
  {
    v12 = [(BCWebViewController *)self delegate];
    v13 = [(BCWebViewController *)self webkitView];
    objc_msgSend(v12, "didChangeSecureStatus:", objc_msgSend(v13, "hasOnlySecureContent"));
  }
  if (([v9 isEqualToString:@"canGoBack"] & 1) != 0
    || [v9 isEqualToString:@"canGoForward"])
  {
    [(BCWebViewController *)self updateNavigationBar];
  }
  if ([v9 isEqualToString:@"estimatedProgress"])
  {
    v14 = [(BCWebViewController *)self webkitView];
    [v14 estimatedProgress];
    double v16 = v15;

    if (self)
    {
      [(BCProgressIndicatorView *)self->_progressIndicatorView progress];
      float v19 = *(float *)&v18;
      progressIndicatorView = self->_progressIndicatorView;
    }
    else
    {
      [0 progress];
      float v19 = *(float *)&v18;
      progressIndicatorView = 0;
    }
    *(float *)&double v18 = v16;
    [(BCProgressIndicatorView *)progressIndicatorView setProgress:1 animated:v18];
    if (v16 >= 1.0)
    {
      float v17 = v16;
      dispatch_time_t v21 = dispatch_time(0, (uint64_t)(float)(vabds_f32(v17, v19) * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __70__BCWebViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_264851ED0;
      block[4] = self;
      dispatch_after(v21, MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __70__BCWebViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return -[BCProgressIndicatorView hide](*(void *)(v1 + 1016));
  }
  else {
    return -[BCProgressIndicatorView hide](0);
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = a3;
  id v11 = [v8 request];
  v12 = [v11 URL];

  v13 = LogCategory_Daemon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v12 baseURL];
    int v20 = 138412290;
    dispatch_time_t v21 = v14;
    _os_log_impl(&dword_228C26000, v13, OS_LOG_TYPE_DEFAULT, "BCWebViewController: decidePolicyFor %@", (uint8_t *)&v20, 0xCu);
  }
  double v15 = [(BCWebViewController *)self delegate];
  double v16 = [v10 URL];

  [v15 didChangeNavigationURL:v16];
  if ([v15 shouldHandleRedirectURI:v12])
  {
    float v17 = LogCategory_Daemon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = [v12 baseURL];
      int v20 = 138412290;
      dispatch_time_t v21 = v18;
      _os_log_impl(&dword_228C26000, v17, OS_LOG_TYPE_DEFAULT, "BCWebViewController: capturing URL: %@", (uint8_t *)&v20, 0xCu);
    }
    if (self) {
      self->_wasCallbackCaptured = 1;
    }
    v9[2](v9, 0);
    float v19 = [v8 request];
    [v15 didReceiveCallbackRequest:v19];
  }
  else
  {
    v9[2](v9, 1);
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a5;
  v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_error_impl(&dword_228C26000, v7, OS_LOG_TYPE_ERROR, "BCWebViewController: didFailProvisionalNavigation error: %@", (uint8_t *)&buf, 0xCu);
  }

  if (!self || !self->_wasCallbackCaptured)
  {
    id v8 = [(BCWebViewController *)self delegate];
    id v9 = [v6 domain];
    if ([v9 isEqualToString:*MEMORY[0x263F08570]])
    {
      id v10 = v6;
      id v11 = v10;
      if (self)
      {
        unint64_t v12 = [v10 code] + 1206;

        if (v12 < 6)
        {
          v13 = LogCategory_Daemon();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_228C26000, v13, OS_LOG_TYPE_DEFAULT, "BCWebViewController: provisional error is related to certificate", (uint8_t *)&buf, 2u);
          }

          v14 = [v11 userInfo];
          double v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F08578]];

          double v16 = [v15 host];
          float v17 = objc_msgSend(v16, "_webkit_decodeHostName");

          [(BCWebViewController *)self presentCertificatErrorForHost:v17];
          [v8 didChangeSecureStatus:0];

          goto LABEL_16;
        }
        goto LABEL_12;
      }
    }
    else
    {

      if (self)
      {
LABEL_12:
        v40 = v8;
        id v41 = v6;
        double v18 = LogCategory_Daemon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_228C26000, v18, OS_LOG_TYPE_DEFAULT, "BCWebViewController: presentServerError", v42, 2u);
        }

        float v19 = (BCServerErrorView *)objc_opt_new();
        [(BCServerErrorView *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
        int v20 = [(BCWebViewController *)self view];
        [v20 addSubview:v19];

        v32 = (void *)MEMORY[0x263F08938];
        v38 = [(BCServerErrorView *)v19 topAnchor];
        v39 = [(BCWebViewController *)self webkitView];
        v37 = [v39 topAnchor];
        v36 = [v38 constraintEqualToAnchor:v37];
        *(void *)&long long buf = v36;
        v34 = [(BCServerErrorView *)v19 leftAnchor];
        v35 = [(BCWebViewController *)self webkitView];
        v33 = [v35 leftAnchor];
        v31 = [v34 constraintEqualToAnchor:v33];
        *((void *)&buf + 1) = v31;
        uint64_t v30 = [(BCServerErrorView *)v19 rightAnchor];
        dispatch_time_t v21 = [(BCWebViewController *)self webkitView];
        uint64_t v22 = [v21 rightAnchor];
        v23 = [v30 constraintEqualToAnchor:v22];
        v44 = v23;
        v24 = [(BCServerErrorView *)v19 bottomAnchor];
        objc_super v25 = [(BCWebViewController *)self webkitView];
        v26 = [v25 bottomAnchor];
        v27 = [v24 constraintEqualToAnchor:v26];
        v45 = v27;
        v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&buf count:4];
        [v32 activateConstraints:v28];

        serverErrorView = self->_serverErrorView;
        self->_serverErrorView = v19;

        id v8 = v40;
        id v6 = v41;
      }
    }
    [v8 didChangeSecureStatus:0];
LABEL_16:
  }
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_228C26000, v5, OS_LOG_TYPE_DEFAULT, "BCWebViewController: didStartProvisionalNavigation", v7, 2u);
  }

  if (self) {
    progressIndicatorView = self->_progressIndicatorView;
  }
  else {
    progressIndicatorView = 0;
  }
  -[BCProgressIndicatorView show](progressIndicatorView);
}

- (BCWebViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCWebViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WKWebView)webkitView
{
  return self->_webkitView;
}

- (void)setWebkitView:(id)a3
{
}

- (NSString)callbackURI
{
  return self->_callbackURI;
}

- (void)setCallbackURI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_serverErrorView, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_invalidCertificatView, 0);
  objc_storeStrong((id *)&self->_callbackURI, 0);
  objc_storeStrong((id *)&self->_webkitView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end