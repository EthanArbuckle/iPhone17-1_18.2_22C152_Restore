@interface HUWebViewController
- (BOOL)_shouldShare;
- (BOOL)scrollEnabled;
- (BOOL)showsShareButton;
- (BOOL)zoomEnabled;
- (HMHTMLDocument)document;
- (HUWebViewController)initWithDocument:(id)a3;
- (HUWebViewController)initWithURL:(id)a3;
- (NAFuture)loadingFuture;
- (NSURL)URL;
- (WKWebView)webView;
- (id)_initWithDocument:(id)a3 orMaybeAURL:(id)a4;
- (void)_share:(id)a3;
- (void)_startLoadWithDocument:(id)a3 orMaybeAURL:(id)a4;
- (void)loadView;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setShowsShareButton:(BOOL)a3;
- (void)setZoomEnabled:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation HUWebViewController

- (HUWebViewController)initWithURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HUWebViewController.m", 29, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  v6 = [(HUWebViewController *)self _initWithDocument:0 orMaybeAURL:v5];

  return v6;
}

- (HUWebViewController)initWithDocument:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HUWebViewController.m", 35, @"Invalid parameter not satisfying: %@", @"document" object file lineNumber description];
  }
  v6 = [(HUWebViewController *)self _initWithDocument:v5 orMaybeAURL:0];

  return v6;
}

- (id)_initWithDocument:(id)a3 orMaybeAURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUWebViewController;
  v8 = [(HUWebViewController *)&v14 init];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F466F8]);
    [v9 setDataDetectorTypes:0];
    uint64_t v10 = objc_opt_new();
    webView = v8->_webView;
    v8->_webView = (WKWebView *)v10;

    [(WKWebView *)v8->_webView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WKWebView *)v8->_webView setNavigationDelegate:v8];
    v12 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(WKWebView *)v8->_webView setBackgroundColor:v12];

    [(HUWebViewController *)v8 _startLoadWithDocument:v6 orMaybeAURL:v7];
  }

  return v8;
}

- (void)_startLoadWithDocument:(id)a3 orMaybeAURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!self->_loadingFuture)
  {
    id v9 = (NAFuture *)objc_opt_new();
    loadingFuture = self->_loadingFuture;
    self->_loadingFuture = v9;

    if (v7)
    {
      objc_storeStrong((id *)&self->_document, a3);
      v11 = [(HUWebViewController *)self webView];
      v12 = [(HUWebViewController *)self document];
      v13 = [v12 stringValue];
      id v14 = (id)[v11 loadHTMLString:v13 baseURL:0];
    }
    else
    {
      if (!v8)
      {
LABEL_7:
        objc_initWeak(&location, self);
        v18 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __58__HUWebViewController__startLoadWithDocument_orMaybeAURL___block_invoke;
        v20[3] = &unk_1E63862A0;
        objc_copyWeak(&v21, &location);
        id v19 = (id)[v18 afterDelay:v20 performBlock:3.0];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
        goto LABEL_8;
      }
      v15 = (NSURL *)[v8 copy];
      URL = self->_URL;
      self->_URL = v15;

      v11 = [(HUWebViewController *)self webView];
      v12 = [MEMORY[0x1E4F290D0] requestWithURL:v8];
      id v17 = (id)[v11 loadRequest:v12];
    }

    goto LABEL_7;
  }
LABEL_8:
}

void __58__HUWebViewController__startLoadWithDocument_orMaybeAURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained loadingFuture];
  char v2 = [v1 isFinished];

  if ((v2 & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    v4 = [WeakRetained document];
    objc_msgSend(v3, "na_safeSetObject:forKey:", v4, @"document");

    id v5 = [WeakRetained URL];
    objc_msgSend(v3, "na_safeSetObject:forKey:", v5, @"URL");

    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:operation:options:", 26, @"Loading software update license", v3);
    id v7 = [MEMORY[0x1E4F69110] sharedHandler];
    [v7 logError:v6 operationDescription:0];

    id v8 = [WeakRetained loadingFuture];
    [v8 finishWithError:v6];
  }
}

- (void)loadView
{
  v31[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(HUWebViewController *)self setView:v3];

  v4 = [(HUWebViewController *)self view];
  id v5 = [(HUWebViewController *)self webView];
  [v4 addSubview:v5];

  v20 = (void *)MEMORY[0x1E4F28DC8];
  v30 = [(HUWebViewController *)self webView];
  v28 = [v30 leadingAnchor];
  v29 = [(HUWebViewController *)self view];
  v27 = [v29 safeAreaLayoutGuide];
  v26 = [v27 leadingAnchor];
  v25 = [v28 constraintEqualToAnchor:v26];
  v31[0] = v25;
  v24 = [(HUWebViewController *)self webView];
  v22 = [v24 trailingAnchor];
  v23 = [(HUWebViewController *)self view];
  id v21 = [v23 safeAreaLayoutGuide];
  id v19 = [v21 trailingAnchor];
  v18 = [v22 constraintEqualToAnchor:v19];
  v31[1] = v18;
  id v17 = [(HUWebViewController *)self webView];
  v16 = [v17 topAnchor];
  id v6 = [(HUWebViewController *)self view];
  id v7 = [v6 safeAreaLayoutGuide];
  id v8 = [v7 topAnchor];
  id v9 = [v16 constraintEqualToAnchor:v8];
  v31[2] = v9;
  uint64_t v10 = [(HUWebViewController *)self webView];
  v11 = [v10 bottomAnchor];
  v12 = [(HUWebViewController *)self view];
  v13 = [v12 bottomAnchor];
  id v14 = [v11 constraintEqualToAnchor:v13];
  v31[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  [v20 activateConstraints:v15];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUWebViewController;
  [(HUWebViewController *)&v10 viewWillAppear:a3];
  id v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  uint64_t v5 = [v4 CGColor];
  id v6 = [(HUWebViewController *)self view];
  id v7 = [v6 layer];
  [v7 setBackgroundColor:v5];

  if ([(HUWebViewController *)self _shouldShare])
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:9 target:self action:sel__share_];
    id v9 = [(HUWebViewController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
}

- (void)setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_scrollEnabled = a3;
  id v5 = [(HUWebViewController *)self webView];
  id v4 = [v5 scrollView];
  [v4 setScrollEnabled:v3];
}

- (void)setZoomEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_zoomEnabled = a3;
  id v5 = [(HUWebViewController *)self webView];
  id v4 = [v5 scrollView];
  [v4 setZoomEnabled:v3];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v12 = a4;
  id v6 = (void (**)(id, uint64_t))a5;
  if ([v12 navigationType])
  {
    uint64_t v7 = 1;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F69378] sharedInstance];
    id v9 = [v12 request];
    objc_super v10 = [v9 URL];
    id v11 = (id)[v8 openURL:v10];

    uint64_t v7 = 0;
  }
  v6[2](v6, v7);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6 = a5;
  id v7 = [(HUWebViewController *)self loadingFuture];
  [v7 finishWithError:v6];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v6 pointSize];
  double v8 = v7;

  [MEMORY[0x1E4F42A30] defaultFontSize];
  double v10 = v9;
  id v11 = objc_opt_new();
  id v12 = v11;
  if (v8 == v10)
  {
    [v11 finishWithNoResult];
  }
  else
  {
    float v13 = v8 / v10 * 100.0;
    objc_msgSend(NSString, "stringWithFormat:", @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust='%f%%';",
    id v14 = floorf(v13));
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__HUWebViewController_webView_didFinishNavigation___block_invoke;
    v17[3] = &unk_1E63850B8;
    id v18 = v12;
    [v5 evaluateJavaScript:v14 completionHandler:v17];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__HUWebViewController_webView_didFinishNavigation___block_invoke_2;
  v16[3] = &unk_1E6387DC8;
  v16[4] = self;
  id v15 = (id)[v12 addSuccessBlock:v16];
}

uint64_t __51__HUWebViewController_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

void __51__HUWebViewController_webView_didFinishNavigation___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) loadingFuture];
  [v1 finishWithNoResult];
}

- (BOOL)_shouldShare
{
  if ([MEMORY[0x1E4F69758] isAMac]) {
    return 0;
  }
  id v4 = [(HUWebViewController *)self document];
  if (v4) {
    BOOL v3 = [(HUWebViewController *)self showsShareButton];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_share:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if ([(HUWebViewController *)self _shouldShare])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42718]);
    id v5 = [(HUWebViewController *)self document];
    id v6 = [v5 attributedString];
    v16[0] = v6;
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    double v8 = (void *)[v4 initWithActivityItems:v7 applicationActivities:0];

    [v8 setExcludedActivityCategories:1];
    uint64_t v9 = *MEMORY[0x1E4F435C8];
    v15[0] = *MEMORY[0x1E4F43598];
    v15[1] = v9;
    uint64_t v10 = *MEMORY[0x1E4F43608];
    v15[2] = *MEMORY[0x1E4F43588];
    v15[3] = v10;
    v15[4] = *MEMORY[0x1E4F43600];
    v15[5] = @"com.apple.mobilenotes.SharingExtension";
    v15[6] = @"com.apple.reminders.RemindersEditorExtension";
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:7];
    [v8 setExcludedActivityTypes:v11];

    id v12 = [(HUWebViewController *)self navigationItem];
    float v13 = [v12 rightBarButtonItem];
    id v14 = [v8 popoverPresentationController];
    [v14 setBarButtonItem:v13];

    [(HUWebViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (HMHTMLDocument)document
{
  return self->_document;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (BOOL)showsShareButton
{
  return self->_showsShareButton;
}

- (void)setShowsShareButton:(BOOL)a3
{
  self->_showsShareButton = a3;
}

- (BOOL)zoomEnabled
{
  return self->_zoomEnabled;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (NAFuture)loadingFuture
{
  return self->_loadingFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingFuture, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_document, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end