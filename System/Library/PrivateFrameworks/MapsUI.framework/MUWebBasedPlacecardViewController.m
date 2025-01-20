@interface MUWebBasedPlacecardViewController
- (MUWebBasedPlacecardViewController)initWithURL:(id)a3 traits:(id)a4;
- (MUWebPlacecardBridgeDelegate)webBridgeDelegate;
- (NSURL)url;
- (WKWebView)webView;
- (void)callMethod:(id)a3 arguments:(id)a4;
- (void)setWebBridgeDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation MUWebBasedPlacecardViewController

- (MUWebBasedPlacecardViewController)initWithURL:(id)a3 traits:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F64790] sharedNetworkObserver];
  int v10 = [v9 isNetworkReachable];

  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)MUWebBasedPlacecardViewController;
    v11 = [(MUWebBasedPlacecardViewController *)&v15 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_url, a3);
      objc_storeStrong((id *)&v12->_webContentTraits, a4);
      v12->_defaultHeight = 800.0;
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)viewDidLoad
{
  v38[5] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)MUWebBasedPlacecardViewController;
  [(MUWebBasedPlacecardViewController *)&v37 viewDidLoad];
  v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(MUWebBasedPlacecardViewController *)self view];
  v5 = [v3 constraintWithItem:v4 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:self->_defaultHeight];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v5;

  id v7 = [[MUWebPlacecardBridgeConfiguration alloc] initWithNativeControllerName:@"PlacecardNativeController" webControllerName:@"PlacecardWebController"];
  id v8 = [MUWebPlacecardBridge alloc];
  v9 = [(MUWebBasedPlacecardViewController *)self webBridgeDelegate];
  v36 = v7;
  int v10 = [(MUWebPlacecardBridge *)v8 initWithConfiguration:v7 delegate:v9];
  bridge = self->_bridge;
  self->_bridge = v10;

  v12 = [(MUWebPlacecardBridge *)self->_bridge webView];
  webView = self->_webView;
  self->_webView = v12;

  [(WKWebView *)self->_webView setAccessibilityIdentifier:@"MUWebPlacecard"];
  v14 = [(MUWebBasedPlacecardViewController *)self view];
  [v14 addSubview:self->_webView];

  v28 = (void *)MEMORY[0x1E4F28DC8];
  v34 = [(WKWebView *)self->_webView leadingAnchor];
  v35 = [(MUWebBasedPlacecardViewController *)self view];
  v33 = [v35 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v38[0] = v32;
  v30 = [(WKWebView *)self->_webView trailingAnchor];
  v31 = [(MUWebBasedPlacecardViewController *)self view];
  v29 = [v31 trailingAnchor];
  v27 = [v30 constraintEqualToAnchor:v29];
  v38[1] = v27;
  v26 = [(WKWebView *)self->_webView topAnchor];
  objc_super v15 = [(MUWebBasedPlacecardViewController *)self view];
  v16 = [v15 topAnchor];
  v17 = [v26 constraintEqualToAnchor:v16];
  v38[2] = v17;
  v18 = [(WKWebView *)self->_webView bottomAnchor];
  v19 = [(MUWebBasedPlacecardViewController *)self view];
  v20 = [v19 bottomAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v22 = self->_heightConstraint;
  v38[3] = v21;
  v38[4] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:5];
  [v28 activateConstraints:v23];

  if (self->_url)
  {
    v24 = objc_msgSend(MEMORY[0x1E4F290D0], "requestWithURL:");
    id v25 = [(WKWebView *)self->_webView loadRequest:v24];
  }
}

- (void)callMethod:(id)a3 arguments:(id)a4
{
}

- (NSURL)url
{
  return self->_url;
}

- (MUWebPlacecardBridgeDelegate)webBridgeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webBridgeDelegate);
  return (MUWebPlacecardBridgeDelegate *)WeakRetained;
}

- (void)setWebBridgeDelegate:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_destroyWeak((id *)&self->_webBridgeDelegate);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_webContentTraits, 0);
  objc_storeStrong((id *)&self->_bridge, 0);
}

@end