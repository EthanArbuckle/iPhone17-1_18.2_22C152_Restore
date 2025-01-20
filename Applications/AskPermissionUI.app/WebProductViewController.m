@interface WebProductViewController
- (ApprovalRequest)request;
- (ProductViewControllerActionDelegate)actionDelegate;
- (UIActivityIndicatorView)activityIndicatorView;
- (UILabel)bannerLabel;
- (UIView)separatorView;
- (WKWebView)webView;
- (WebProductViewController)initWithRequest:(id)a3;
- (void)_approveButtonAction;
- (void)_declineButtonAction;
- (void)_loadWebsite;
- (void)_setup;
- (void)_setupNavigationItem;
- (void)_setupSubviews;
- (void)loadView;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setActionDelegate:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setBannerLabel:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setWebView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)webView:(id)a3 didCommitNavigation:(id)a4;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
@end

@implementation WebProductViewController

- (WebProductViewController)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WebProductViewController;
  v6 = [(WebProductViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)WebProductViewController;
  [(WebProductViewController *)&v5 loadView];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(WebProductViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WebProductViewController;
  [(WebProductViewController *)&v3 viewDidLoad];
  [(WebProductViewController *)self _setup];
  [(WebProductViewController *)self _loadWebsite];
}

- (void)viewWillLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)WebProductViewController;
  [(WebProductViewController *)&v20 viewWillLayoutSubviews];
  objc_super v3 = [(WebProductViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  v8 = [(WebProductViewController *)self bannerLabel];
  [v8 heightForWidth:v5 + -30.0];
  double v10 = v9;

  v11 = [(WebProductViewController *)self view];
  [v11 center];
  double v13 = v12;
  double v15 = v14;
  v16 = [(WebProductViewController *)self activityIndicatorView];
  [v16 setCenter:v13, v15];

  v17 = [(WebProductViewController *)self bannerLabel];
  [v17 setFrame:CGRectMake(15.0, 15.0, v5 + -30.0, v10)];

  v18 = [(WebProductViewController *)self separatorView];
  [v18 setFrame:CGRectMake(0.0, v10 + 30.0, v5, 0.5)];

  v19 = [(WebProductViewController *)self webView];
  [v19 setFrame:0.0, v10 + 30.0, v5, v7 - v10];
}

- (void)_setup
{
  [(WebProductViewController *)self _setupNavigationItem];

  [(WebProductViewController *)self _setupSubviews];
}

- (void)_setupNavigationItem
{
  objc_super v3 = [(WebProductViewController *)self request];
  double v4 = [v3 localizations];
  double v5 = [v4 approve];
  id v14 = +[Localizations stringWithKey:v5];

  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v14 style:0 target:self action:"_approveButtonAction"];
  double v7 = [(WebProductViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];

  v8 = [(WebProductViewController *)self request];
  double v9 = [v8 localizations];
  double v10 = [v9 decline];
  v11 = +[Localizations stringWithKey:v10];

  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v11 style:0 target:self action:"_declineButtonAction"];
  double v13 = [(WebProductViewController *)self navigationItem];
  [v13 setLeftBarButtonItem:v12];
}

- (void)_setupSubviews
{
  id v3 = objc_alloc_init((Class)WKWebView);
  [(WebProductViewController *)self setWebView:v3];

  double v4 = [(WebProductViewController *)self webView];
  [v4 setCustomUserAgent:@"MobileAskPermissionUI/1.0"];

  double v5 = [(WebProductViewController *)self webView];
  [v5 setNavigationDelegate:self];

  id v6 = [(WebProductViewController *)self webView];
  double v7 = [v6 scrollView];
  [v7 setDelegate:self];

  v8 = [(WebProductViewController *)self view];
  double v9 = [(WebProductViewController *)self webView];
  [v8 addSubview:v9];

  id v10 = objc_alloc_init((Class)UILabel);
  [(WebProductViewController *)self setBannerLabel:v10];

  v11 = +[UIFont systemFontOfSize:14.0];
  id v12 = [(WebProductViewController *)self bannerLabel];
  [v12 setFont:v11];

  double v13 = [(WebProductViewController *)self bannerLabel];
  [v13 setNumberOfLines:0];

  id v14 = [(WebProductViewController *)self request];
  double v15 = [v14 localizations];
  v16 = [v15 body];
  v17 = [(WebProductViewController *)self bannerLabel];
  [v17 setText:v16];

  v18 = [(WebProductViewController *)self bannerLabel];
  [v18 setTextAlignment:1];

  v19 = [(WebProductViewController *)self view];
  objc_super v20 = [(WebProductViewController *)self bannerLabel];
  [v19 addSubview:v20];

  id v21 = objc_alloc_init((Class)UIView);
  [(WebProductViewController *)self setSeparatorView:v21];

  v22 = +[UIColor separatorColor];
  v23 = [(WebProductViewController *)self separatorView];
  [v23 setBackgroundColor:v22];

  v24 = [(WebProductViewController *)self view];
  v25 = [(WebProductViewController *)self separatorView];
  [v24 addSubview:v25];

  id v26 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(WebProductViewController *)self setActivityIndicatorView:v26];

  v27 = [(WebProductViewController *)self activityIndicatorView];
  [v27 setHidesWhenStopped:1];

  v28 = [(WebProductViewController *)self activityIndicatorView];
  [v28 startAnimating];

  id v30 = [(WebProductViewController *)self view];
  v29 = [(WebProductViewController *)self activityIndicatorView];
  [v30 addSubview:v29];
}

- (void)_approveButtonAction
{
  id v2 = [(WebProductViewController *)self actionDelegate];
  [v2 productViewControllerDidFinishWithAction:0];
}

- (void)_declineButtonAction
{
  id v2 = [(WebProductViewController *)self actionDelegate];
  [v2 productViewControllerDidFinishWithAction:1];
}

- (void)_loadWebsite
{
  id v3 = [(WebProductViewController *)self request];
  double v4 = [v3 previewURL];
  id v7 = +[NSURLRequest requestWithURL:v4];

  double v5 = [(WebProductViewController *)self webView];
  id v6 = [v5 loadRequest:v7];
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v4 = [a3 pinchGestureRecognizer];
  [v4 setEnabled:0];
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6 = a5;
  id v7 = +[APLogConfig sharedUIServiceConfig];
  if (!v7)
  {
    id v7 = +[APLogConfig sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v6;
    id v9 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: Web view failed to load. Error: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v10 = [(WebProductViewController *)self activityIndicatorView];
  [v10 stopAnimating];

  v11 = [(WebProductViewController *)self actionDelegate];
  [v11 productViewControllerDidFinishWithAction:3];
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  double v5 = +[APLogConfig sharedUIServiceConfig];
  if (!v5)
  {
    double v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v7 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Web view loaded succesfully.", (uint8_t *)&v9, 0xCu);
  }
  v8 = [(WebProductViewController *)self activityIndicatorView];
  [v8 stopAnimating];
}

- (ProductViewControllerActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (ProductViewControllerActionDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (ApprovalRequest)request
{
  return self->_request;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UILabel)bannerLabel
{
  return self->_bannerLabel;
}

- (void)setBannerLabel:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_bannerLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_destroyWeak((id *)&self->_actionDelegate);
}

@end