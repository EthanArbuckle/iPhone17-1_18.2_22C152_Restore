@interface HUSoftwareUpdateLicenseViewController
- (HMHTMLDocument)document;
- (HUSoftwareUpdateLicenseViewController)initWithDocument:(id)a3;
- (HUSoftwareUpdateLicenseViewController)initWithURL:(id)a3;
- (HUWebViewController)webViewController;
- (NSFileManager)fileManager;
- (NSString)license;
- (NSURL)URL;
- (UIButton)retainCopyOfTermsButton;
- (UIScrollView)scrollView;
- (WKWebView)webView;
- (id)_evaluateHeight:(id)a3;
- (id)_initWithWebViewController:(id)a3;
- (id)agreeHandler;
- (id)disagreeHandler;
- (id)hu_preloadContent;
- (id)loadLicense;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)_agreeToTerms:(id)a3;
- (void)_disagreeToTerms:(id)a3;
- (void)_emailTermsAndConditions:(id)a3;
- (void)loadView;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)setAgreeHandler:(id)a3;
- (void)setDisagreeHandler:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setLicense:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation HUSoftwareUpdateLicenseViewController

- (HUSoftwareUpdateLicenseViewController)initWithURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HUSoftwareUpdateLicenseViewController.m", 49, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  v6 = [[HUWebViewController alloc] initWithURL:v5];
  v7 = [(HUSoftwareUpdateLicenseViewController *)self _initWithWebViewController:v6];

  return v7;
}

- (HUSoftwareUpdateLicenseViewController)initWithDocument:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HUSoftwareUpdateLicenseViewController.m", 55, @"Invalid parameter not satisfying: %@", @"document" object file lineNumber description];
  }
  v6 = [[HUWebViewController alloc] initWithDocument:v5];
  v7 = [(HUSoftwareUpdateLicenseViewController *)self _initWithWebViewController:v6];

  return v7;
}

- (id)_initWithWebViewController:(id)a3
{
  id v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)HUSoftwareUpdateLicenseViewController;
  v6 = [(HUSoftwareUpdateLicenseViewController *)&v39 init];
  p_isa = (id *)&v6->super.super.super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webViewController, a3);
    [p_isa[130] setShowsShareButton:0];
    v8 = [p_isa webViewController];
    [v8 setZoomEnabled:0];

    [p_isa addChildViewController:v5];
    [v5 didMoveToParentViewController:p_isa];
    v9 = [p_isa webView];
    [v9 setAutoresizingMask:18];

    v10 = [p_isa webView];
    [v10 setUIDelegate:p_isa];

    v11 = [p_isa webView];
    [v11 _setLayoutMode:4];

    v12 = [p_isa webView];
    v13 = [v12 scrollView];
    v14 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [v13 setBackgroundColor:v14];

    v15 = [p_isa webView];
    v16 = [v15 scrollView];
    [v16 _setShowsBackgroundShadow:0];

    v17 = [p_isa webView];
    v18 = [v17 scrollView];
    [v18 setDecelerationRate:0.998];

    v19 = [p_isa webView];
    v20 = [v19 scrollView];
    [v20 setScrollEnabled:0];

    v21 = [p_isa webView];
    v22 = [v21 scrollView];
    [v22 setDelegate:p_isa];

    uint64_t v23 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    id v24 = p_isa[127];
    p_isa[127] = (id)v23;

    v25 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
    [p_isa[127] setBackgroundColor:v25];

    id v26 = p_isa[127];
    v27 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    [v26 setTitleColor:v27 forState:0];

    id v28 = p_isa[127];
    v29 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateLicenseViewControllerEmailButtonTitle", @"HUSoftwareUpdateLicenseViewControllerEmailButtonTitle", 1);
    [v28 setTitle:v29 forState:0];

    [p_isa[127] addTarget:p_isa action:sel__emailTermsAndConditions_ forControlEvents:64];
    if (([MEMORY[0x1E4F350E8] canSendMail] & 1) == 0) {
      [p_isa[127] setEnabled:0];
    }
    uint64_t v30 = objc_opt_new();
    id v31 = p_isa[126];
    p_isa[126] = (id)v30;

    v32 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
    [p_isa[126] setBackgroundColor:v32];

    id v33 = p_isa[126];
    v34 = [p_isa retainCopyOfTermsButton];
    [v33 addSubview:v34];

    id v35 = p_isa[126];
    v36 = [p_isa webViewController];
    v37 = [v36 view];
    [v35 addSubview:v37];
  }
  return p_isa;
}

- (id)hu_preloadContent
{
  objc_initWeak(&location, self);
  v3 = [(HUSoftwareUpdateLicenseViewController *)self webViewController];
  v4 = objc_msgSend(v3, "hu_preloadContent");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HUSoftwareUpdateLicenseViewController_hu_preloadContent__block_invoke;
  v7[3] = &unk_1E638B350;
  objc_copyWeak(&v8, &location);
  id v5 = [v4 flatMap:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v5;
}

id __58__HUSoftwareUpdateLicenseViewController_hu_preloadContent__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained loadLicense];

  return v2;
}

- (void)loadView
{
  id v3 = [(HUSoftwareUpdateLicenseViewController *)self scrollView];
  [(HUSoftwareUpdateLicenseViewController *)self setView:v3];
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)HUSoftwareUpdateLicenseViewController;
  [(HUSoftwareUpdateLicenseViewController *)&v8 viewWillLayoutSubviews];
  id v3 = [(HUSoftwareUpdateLicenseViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  v6 = [(HUSoftwareUpdateLicenseViewController *)self retainCopyOfTermsButton];
  [v6 sizeToFit];

  v7 = [(HUSoftwareUpdateLicenseViewController *)self retainCopyOfTermsButton];
  objc_msgSend(v7, "setFrame:", 0.0, 32.0, v5, 38.0);
}

- (void)viewDidLayoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)HUSoftwareUpdateLicenseViewController;
  [(HUSoftwareUpdateLicenseViewController *)&v30 viewDidLayoutSubviews];
  id v3 = [(HUSoftwareUpdateLicenseViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  v6 = [(HUSoftwareUpdateLicenseViewController *)self navigationController];
  v7 = [v6 toolbar];
  [v7 bounds];
  double v9 = v8 + 32.0;

  v10 = [(HUSoftwareUpdateLicenseViewController *)self webViewController];
  v11 = [v10 view];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v18 = [(HUSoftwareUpdateLicenseViewController *)self view];
  [v18 frame];
  double v20 = v19;

  v21 = [(HUSoftwareUpdateLicenseViewController *)self webViewController];
  v22 = [v21 view];
  objc_msgSend(v22, "setFrame:", v13, v15, v20, v17);

  uint64_t v23 = [(HUSoftwareUpdateLicenseViewController *)self webView];
  id v24 = [(HUSoftwareUpdateLicenseViewController *)self _evaluateHeight:v23];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __62__HUSoftwareUpdateLicenseViewController_viewDidLayoutSubviews__block_invoke;
  v29[3] = &unk_1E6392840;
  v29[4] = self;
  *(double *)&v29[5] = v5;
  *(double *)&v29[6] = v9;
  id v25 = (id)[v24 addSuccessBlock:v29];

  id v26 = [(HUSoftwareUpdateLicenseViewController *)self webView];
  [v26 frame];
  CGFloat v27 = CGRectGetMaxY(v31) + 32.0;
  id v28 = [(HUSoftwareUpdateLicenseViewController *)self scrollView];
  objc_msgSend(v28, "setContentSize:", v5, v27);
}

void __62__HUSoftwareUpdateLicenseViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 retainCopyOfTermsButton];
  [v5 frame];
  CGFloat v6 = CGRectGetMaxY(v18) + 32.0;
  double v7 = *(double *)(a1 + 40);
  [v4 floatValue];
  float v9 = v8;

  double v10 = *(double *)(a1 + 48) + v9 + 10.0;
  v11 = [*(id *)(a1 + 32) webViewController];
  double v12 = [v11 view];
  objc_msgSend(v12, "setFrame:", 0.0, v6, v7, v10);

  double v13 = *(double *)(a1 + 40);
  id v16 = [*(id *)(a1 + 32) webView];
  [v16 frame];
  CGFloat v14 = CGRectGetMaxY(v19) + 32.0;
  double v15 = [*(id *)(a1 + 32) scrollView];
  objc_msgSend(v15, "setContentSize:", v13, v14);
}

- (void)viewDidLoad
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)HUSoftwareUpdateLicenseViewController;
  [(HUSoftwareUpdateLicenseViewController *)&v12 viewDidLoad];
  id v3 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateLicenseTitle", @"HUSoftwareUpdateLicenseTitle", 1);
  [(HUSoftwareUpdateLicenseViewController *)self setTitle:v3];

  id v4 = objc_alloc(MEMORY[0x1E4F427C0]);
  double v5 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateLicenseDisagreeButtonTitle", @"HUSoftwareUpdateLicenseDisagreeButtonTitle", 1);
  CGFloat v6 = (void *)[v4 initWithTitle:v5 style:0 target:self action:sel__disagreeToTerms_];

  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:5 target:0 action:0];
  id v8 = objc_alloc(MEMORY[0x1E4F427C0]);
  float v9 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateLicenseAgreeButtonTitle", @"HUSoftwareUpdateLicenseAgreeButtonTitle", 1);
  double v10 = (void *)[v8 initWithTitle:v9 style:2 target:self action:sel__agreeToTerms_];

  v13[0] = v6;
  v13[1] = v7;
  v13[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  [(HUSoftwareUpdateLicenseViewController *)self setToolbarItems:v11];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUSoftwareUpdateLicenseViewController;
  [(HUSoftwareUpdateLicenseViewController *)&v5 viewWillAppear:a3];
  id v4 = [(HUSoftwareUpdateLicenseViewController *)self navigationController];
  [v4 setToolbarHidden:0];
}

- (id)loadLicense
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__HUSoftwareUpdateLicenseViewController_loadLicense__block_invoke;
  v4[3] = &unk_1E6385108;
  v4[4] = self;
  v2 = [MEMORY[0x1E4F7A0D8] futureWithBlock:v4];

  return v2;
}

void __52__HUSoftwareUpdateLicenseViewController_loadLicense__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) webView];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HUSoftwareUpdateLicenseViewController_loadLicense__block_invoke_2;
  v6[3] = &unk_1E6384CE0;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 evaluateJavaScript:@"document.documentElement.outerHTML.toString()" completionHandler:v6];
}

void __52__HUSoftwareUpdateLicenseViewController_loadLicense__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v8 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v8;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  [*(id *)(a1 + 32) setLicense:v5];
  CGFloat v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) license];
  [v6 finishWithResult:v7];
}

- (void)_agreeToTerms:(id)a3
{
  id v5 = [(HUSoftwareUpdateLicenseViewController *)self agreeHandler];

  if (!v5)
  {
    CGFloat v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HUSoftwareUpdateLicenseViewController.m" lineNumber:179 description:@"Agree handler must be set before presenting HUSoftwareUpdateLicenseViewController"];
  }
  id v7 = [(HUSoftwareUpdateLicenseViewController *)self agreeHandler];
  v7[2]();
}

- (void)_disagreeToTerms:(id)a3
{
  id v5 = [(HUSoftwareUpdateLicenseViewController *)self disagreeHandler];

  if (!v5)
  {
    CGFloat v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HUSoftwareUpdateLicenseViewController.m" lineNumber:185 description:@"Disagree handler must be set before presenting HUSoftwareUpdateLicenseViewController"];
  }
  id v7 = [(HUSoftwareUpdateLicenseViewController *)self disagreeHandler];
  v7[2]();
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return 0;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v7 = a5;
  if (v7)
  {
    CGFloat v6 = [MEMORY[0x1E4F69110] sharedHandler];
    [v6 handleError:v7];
  }
  else
  {
    [(HUSoftwareUpdateLicenseViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_emailTermsAndConditions:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F350E8]);
  id v4 = [(HUSoftwareUpdateLicenseViewController *)self license];
  [v5 setMessageBody:v4 isHTML:1];

  [v5 setMailComposeDelegate:self];
  [(HUSoftwareUpdateLicenseViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (id)_evaluateHeight:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HUSoftwareUpdateLicenseViewController__evaluateHeight___block_invoke;
  v8[3] = &unk_1E6385108;
  id v9 = v3;
  id v5 = v3;
  CGFloat v6 = [v4 futureWithBlock:v8];

  return v6;
}

void __57__HUSoftwareUpdateLicenseViewController__evaluateHeight___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HUSoftwareUpdateLicenseViewController__evaluateHeight___block_invoke_2;
  v6[3] = &unk_1E63850B8;
  id v7 = v3;
  id v5 = v3;
  [v4 evaluateJavaScript:@"Math.max( document.body.scrollHeight, document.body.offsetHeight)", v6 completionHandler];
}

void __57__HUSoftwareUpdateLicenseViewController__evaluateHeight___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  objc_opt_class();
  id v7 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v7;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  [v4 finishWithResult:v6];
}

- (WKWebView)webView
{
  v2 = [(HUSoftwareUpdateLicenseViewController *)self webViewController];
  id v3 = [v2 webView];

  return (WKWebView *)v3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (HMHTMLDocument)document
{
  return self->_document;
}

- (id)agreeHandler
{
  return self->_agreeHandler;
}

- (void)setAgreeHandler:(id)a3
{
}

- (id)disagreeHandler
{
  return self->_disagreeHandler;
}

- (void)setDisagreeHandler:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIButton)retainCopyOfTermsButton
{
  return self->_retainCopyOfTermsButton;
}

- (NSString)license
{
  return self->_license;
}

- (void)setLicense:(id)a3
{
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (HUWebViewController)webViewController
{
  return self->_webViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewController, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_retainCopyOfTermsButton, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong(&self->_disagreeHandler, 0);
  objc_storeStrong(&self->_agreeHandler, 0);
  objc_storeStrong((id *)&self->_document, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end