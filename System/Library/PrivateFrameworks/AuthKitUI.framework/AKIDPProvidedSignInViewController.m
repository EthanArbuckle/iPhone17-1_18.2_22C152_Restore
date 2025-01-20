@interface AKIDPProvidedSignInViewController
- (AKIDPHandler)idpHandler;
- (AKIDPProvidedSignInViewController)initWithIDPHandler:(id)a3;
- (UIImageView)secureIconView;
- (UILabel)titleLabel;
- (UIStackView)titleStackView;
- (WKWebView)webView;
- (void)IDPHandler:(id)a3 didFinishLoadingPageInWebView:(id)a4;
- (void)IDPHandler:(id)a3 didStartLoadingPageInWebView:(id)a4;
- (void)_cancelBarButtonPressed:(id)a3;
- (void)_setNavigationTitle:(id)a3;
- (void)loadView;
- (void)setIdpHandler:(id)a3;
- (void)setSecureIconView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleStackView:(id)a3;
- (void)setupTitleView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AKIDPProvidedSignInViewController

- (AKIDPProvidedSignInViewController)initWithIDPHandler:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKIDPProvidedSignInViewController;
  v6 = [(AKIDPProvidedSignInViewController *)&v11 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_idpHandler, a3);
    [(AKIDPHandler *)v7->_idpHandler setDelegate:v7];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F466F0], "ak_idpWebViewWithFrame:idpHandler:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    webView = v7->_webView;
    v7->_webView = (WKWebView *)v8;
  }
  return v7;
}

- (void)loadView
{
  id v3 = [(AKIDPProvidedSignInViewController *)self webView];
  [(AKIDPProvidedSignInViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AKIDPProvidedSignInViewController;
  [(AKIDPProvidedSignInViewController *)&v3 viewDidLoad];
  [(AKIDPProvidedSignInViewController *)self setupTitleView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AKIDPProvidedSignInViewController;
  [(AKIDPProvidedSignInViewController *)&v9 viewWillAppear:a3];
  v4 = [(AKIDPProvidedSignInViewController *)self idpHandler];
  id v5 = [v4 configuration];
  v6 = [v5 request];
  v7 = [v6 URL];
  uint64_t v8 = [v7 host];
  [(AKIDPProvidedSignInViewController *)self _setNavigationTitle:v8];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AKIDPProvidedSignInViewController;
  [(AKIDPProvidedSignInViewController *)&v9 viewDidAppear:a3];
  [(AKIDPProvidedSignInViewController *)self setEdgesForExtendedLayout:0];
  v4 = [(AKIDPProvidedSignInViewController *)self webView];
  id v5 = [(AKIDPProvidedSignInViewController *)self idpHandler];
  v6 = [v5 configuration];
  v7 = [v6 request];
  id v8 = (id)[v4 loadRequest:v7];
}

- (void)_cancelBarButtonPressed:(id)a3
{
  id v3 = [(AKIDPProvidedSignInViewController *)self idpHandler];
  [v3 cancel];
}

- (void)setupTitleView
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v5 = [(AKIDPProvidedSignInViewController *)self navigationController];
    v6 = [v5 navigationBar];
    [v6 setBackgroundImage:0 forBarMetrics:0];
  }
  v7 = [(AKIDPProvidedSignInViewController *)self navigationController];
  id v8 = [v7 navigationBar];
  [v8 _setHidesShadow:0];

  id v9 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v10 = (void *)MEMORY[0x1E4F42A80];
  objc_super v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  v12 = [v10 imageNamed:@"LockIcon" inBundle:v11];
  v13 = (void *)[v9 initWithImage:v12];
  [(AKIDPProvidedSignInViewController *)self setSecureIconView:v13];

  v14 = [(AKIDPProvidedSignInViewController *)self secureIconView];
  [v14 setContentMode:4];

  v15 = [MEMORY[0x1E4F428B8] systemGreenColor];
  v16 = [(AKIDPProvidedSignInViewController *)self secureIconView];
  [v16 setTintColor:v15];

  v17 = [(AKIDPProvidedSignInViewController *)self secureIconView];
  [v17 setHidden:1];

  v18 = [(AKIDPProvidedSignInViewController *)self secureIconView];
  [v18 setAlpha:0.0];

  id v19 = objc_alloc(MEMORY[0x1E4F42B38]);
  v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(AKIDPProvidedSignInViewController *)self setTitleLabel:v20];

  v21 = [(AKIDPProvidedSignInViewController *)self webView];
  v22 = [v21 title];
  v23 = [(AKIDPProvidedSignInViewController *)self titleLabel];
  [v23 setText:v22];

  v24 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F438A8] maximumContentSizeCategory:*MEMORY[0x1E4F437B0]];
  v25 = [(AKIDPProvidedSignInViewController *)self titleLabel];
  [v25 setFont:v24];

  id v26 = objc_alloc(MEMORY[0x1E4F42E20]);
  v27 = [(AKIDPProvidedSignInViewController *)self secureIconView];
  v36[0] = v27;
  v28 = [(AKIDPProvidedSignInViewController *)self titleLabel];
  v36[1] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v30 = (void *)[v26 initWithArrangedSubviews:v29];
  [(AKIDPProvidedSignInViewController *)self setTitleStackView:v30];

  v31 = [(AKIDPProvidedSignInViewController *)self titleStackView];
  [v31 setSpacing:6.0];

  v32 = [(AKIDPProvidedSignInViewController *)self titleStackView];
  v33 = [(AKIDPProvidedSignInViewController *)self navigationItem];
  [v33 setTitleView:v32];

  v34 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancelBarButtonPressed_];
  v35 = [(AKIDPProvidedSignInViewController *)self navigationItem];
  [v35 setLeftBarButtonItem:v34];
}

- (void)_setNavigationTitle:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F42948];
  id v5 = a3;
  v6 = [v4 currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v8 = [(AKIDPProvidedSignInViewController *)self titleLabel];
    [v8 setText:v5];
  }
  else
  {
    id v8 = [(AKIDPProvidedSignInViewController *)self navigationItem];
    [v8 setPrompt:v5];
  }
}

- (void)IDPHandler:(id)a3 didFinishLoadingPageInWebView:(id)a4
{
  id v5 = a4;
  v6 = [v5 title];
  uint64_t v7 = [(AKIDPProvidedSignInViewController *)self titleLabel];
  [v7 setText:v6];

  LODWORD(v6) = [v5 hasOnlySecureContent];
  uint64_t v8 = v6 ^ 1;
  id v9 = [(AKIDPProvidedSignInViewController *)self secureIconView];
  [v9 setHidden:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__AKIDPProvidedSignInViewController_IDPHandler_didFinishLoadingPageInWebView___block_invoke;
  v10[3] = &unk_1E648F0D8;
  v10[4] = self;
  char v11 = v8;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v10 animations:0.3];
}

void __78__AKIDPProvidedSignInViewController_IDPHandler_didFinishLoadingPageInWebView___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) secureIconView];
  [v2 setAlpha:v1];
}

- (void)IDPHandler:(id)a3 didStartLoadingPageInWebView:(id)a4
{
  objc_msgSend(a4, "URL", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v6 host];
  [(AKIDPProvidedSignInViewController *)self _setNavigationTitle:v5];
}

- (WKWebView)webView
{
  return self->_webView;
}

- (AKIDPHandler)idpHandler
{
  return self->_idpHandler;
}

- (void)setIdpHandler:(id)a3
{
}

- (UIImageView)secureIconView
{
  return self->_secureIconView;
}

- (void)setSecureIconView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIStackView)titleStackView
{
  return self->_titleStackView;
}

- (void)setTitleStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_secureIconView, 0);
  objc_storeStrong((id *)&self->_idpHandler, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end