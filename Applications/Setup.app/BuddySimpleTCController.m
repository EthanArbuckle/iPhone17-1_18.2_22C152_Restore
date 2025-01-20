@interface BuddySimpleTCController
- (BuddyTCSubControllerDelegate)termsAndConditionsDelegate;
- (WKWebView)webView;
- (id)termsContent;
- (id)titleString;
- (void)_agreeTapped:(id)a3;
- (void)_disagreeTapped:(id)a3;
- (void)setTermsAndConditionsDelegate:(id)a3;
- (void)setWebView:(id)a3;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
@end

@implementation BuddySimpleTCController

- (void)viewDidLoad
{
  v72 = self;
  SEL v71 = a2;
  v70.receiver = self;
  v70.super_class = (Class)BuddySimpleTCController;
  [(BuddySimpleTCController *)&v70 viewDidLoad];
  id v2 = [(BuddySimpleTCController *)v72 titleString];
  [(BuddySimpleTCController *)v72 setTitle:v2];

  [(BuddySimpleTCController *)v72 setModalInPresentation:1];
  id v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = +[NSBundle mainBundle];
  v5 = [(NSBundle *)v4 localizedStringForKey:@"AGREE" value:&stru_1002B4E18 table:@"Localizable"];
  id v6 = [v3 initWithTitle:v5 style:2 target:v72 action:"_agreeTapped:"];
  id v7 = [(BuddySimpleTCController *)v72 navigationItem];
  [v7 setRightBarButtonItem:v6];

  id v8 = objc_alloc((Class)UIBarButtonItem);
  v9 = +[NSBundle mainBundle];
  v10 = [(NSBundle *)v9 localizedStringForKey:@"DISAGREE" value:&stru_1002B4E18 table:@"Localizable"];
  id v11 = [v8 initWithTitle:v10 style:0 target:v72 action:"_disagreeTapped:"];
  id v12 = [(BuddySimpleTCController *)v72 navigationItem];
  [v12 setLeftBarButtonItem:v11];

  id location = objc_alloc_init((Class)WKWebViewConfiguration);
  [location setSuppressesIncrementalRendering:1];
  [location setDataDetectorTypes:0];
  id v13 = [location preferences];
  [v13 setMinimumFontSize:0.0];

  id v14 = [location preferences];
  [v14 setTextInteractionEnabled:0];

  [location setIgnoresViewportScaleLimits:0];
  id v15 = objc_alloc((Class)WKWebView);
  double v16 = sub_1001269B8();
  id v20 = [v15 initWithFrame:location configuration:v16, v17, v18, v19];
  [(BuddySimpleTCController *)v72 setWebView:v20];

  v21 = [(BuddySimpleTCController *)v72 webView];
  [(WKWebView *)v21 setOpaque:0];

  v22 = [(BuddySimpleTCController *)v72 webView];
  [(WKWebView *)v22 setAllowsLinkPreview:0];

  v23 = v72;
  v24 = [(BuddySimpleTCController *)v72 webView];
  [(WKWebView *)v24 setNavigationDelegate:v23];

  v25 = [(BuddySimpleTCController *)v72 webView];
  [(WKWebView *)v25 _setDragInteractionPolicy:2];

  v26 = [(BuddySimpleTCController *)v72 webView];
  [(WKWebView *)v26 setTranslatesAutoresizingMaskIntoConstraints:0];

  v27 = [(BuddySimpleTCController *)v72 webView];
  v28 = [(WKWebView *)v27 scrollView];
  [(UIScrollView *)v28 _setShowsBackgroundShadow:0];

  v29 = [(BuddySimpleTCController *)v72 webView];
  id v30 = [(BuddySimpleTCController *)v72 termsContent];
  v31 = +[NSBundle mainBundle];
  v32 = [(NSBundle *)v31 resourceURL];
  id v33 = [(WKWebView *)v29 loadHTMLString:v30 baseURL:v32];

  v34 = [(BuddySimpleTCController *)v72 webView];
  v35 = [(WKWebView *)v34 scrollView];
  [(UIScrollView *)v35 _setIndicatorInsetAdjustmentBehavior:2];

  v36 = [(BuddySimpleTCController *)v72 webView];
  v37 = [(WKWebView *)v36 scrollView];
  [(UIScrollView *)v37 setContentInsetAdjustmentBehavior:2];

  long long v68 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  long long v67 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v38 = [(BuddySimpleTCController *)v72 webView];
  v39 = [(WKWebView *)v38 scrollView];
  -[UIScrollView setContentInset:](v39, "setContentInset:", v67, v68);

  id v40 = [(BuddySimpleTCController *)v72 view];
  v41 = [(BuddySimpleTCController *)v72 webView];
  [v40 addSubview:v41];

  id v66 = [(BuddySimpleTCController *)v72 view];
  id v65 = [v66 safeAreaLayoutGuide];
  id v63 = [v65 topAnchor];
  v64 = [(BuddySimpleTCController *)v72 webView];
  id v62 = [(WKWebView *)v64 topAnchor];
  id v61 = [v63 constraintEqualToAnchor:];
  v73[0] = v61;
  id v60 = [(BuddySimpleTCController *)v72 view];
  id v59 = [v60 layoutMarginsGuide];
  id v57 = [v59 rightAnchor];
  v58 = [(BuddySimpleTCController *)v72 webView];
  id v56 = [(WKWebView *)v58 rightAnchor];
  id v55 = [v57 constraintEqualToAnchor:];
  v73[1] = v55;
  id v54 = [(BuddySimpleTCController *)v72 view];
  id v53 = [v54 safeAreaLayoutGuide];
  id v52 = [v53 bottomAnchor];
  v42 = [(BuddySimpleTCController *)v72 webView];
  id v43 = [(WKWebView *)v42 bottomAnchor];
  id v44 = [v52 constraintEqualToAnchor:v43];
  v73[2] = v44;
  id v45 = [(BuddySimpleTCController *)v72 view];
  id v46 = [v45 layoutMarginsGuide];
  id v47 = [v46 leftAnchor];
  v48 = [(BuddySimpleTCController *)v72 webView];
  id v49 = [(WKWebView *)v48 leftAnchor];
  id v50 = [v47 constraintEqualToAnchor:v49];
  v73[3] = v50;
  v51 = +[NSArray arrayWithObjects:v73 count:4];
  +[NSLayoutConstraint activateConstraints:v51];

  objc_storeStrong(&location, 0);
}

- (id)termsContent
{
  return 0;
}

- (id)titleString
{
  return 0;
}

- (void)_agreeTapped:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_termsAndConditionsDelegate);
  [WeakRetained buddyTCSubController:v5 didFinishWithAgree:1];

  objc_storeStrong(location, 0);
}

- (void)_disagreeTapped:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_termsAndConditionsDelegate);
  [WeakRetained buddyTCSubController:v5 didFinishWithAgree:0];

  objc_storeStrong(location, 0);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  if (v12)
  {
    id v7 = [v13 request];
    id v8 = [v7 URL];
    v9 = +[NSBundle mainBundle];
    v10 = [(NSBundle *)v9 resourceURL];
    unsigned __int8 v11 = [v8 isEqual:v10];

    if (v11) {
      (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
    }
    else {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (BuddyTCSubControllerDelegate)termsAndConditionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_termsAndConditionsDelegate);

  return (BuddyTCSubControllerDelegate *)WeakRetained;
}

- (void)setTermsAndConditionsDelegate:(id)a3
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
}

@end