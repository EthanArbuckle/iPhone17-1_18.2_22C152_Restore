@interface AMSUIAddFundsViewController
+ (id)bagKeySet;
+ (id)bagSubProfile;
+ (id)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)clientInfo;
- (AMSUIAddFundsViewController)initWithAccount:(id)a3 bag:(id)a4;
- (AMSUIAddFundsViewController)initWithAccount:(id)a3 bag:(id)a4 clientInfo:(id)a5;
- (AMSUIWebViewController)webViewController;
- (NSDictionary)metricsOverlay;
- (void)loadView;
- (void)setAccount:(id)a3;
- (void)setBag:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSUIAddFundsViewController

- (AMSUIAddFundsViewController)initWithAccount:(id)a3 bag:(id)a4
{
  v6 = (void *)MEMORY[0x263F27E08];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 currentProcess];
  v10 = [(AMSUIAddFundsViewController *)self initWithAccount:v8 bag:v7 clientInfo:v9];

  return v10;
}

- (AMSUIAddFundsViewController)initWithAccount:(id)a3 bag:(id)a4 clientInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIAddFundsViewController;
  v11 = [(AMSUICommonViewController *)&v15 init];
  if (v11)
  {
    v12 = [[AMSUIWebViewController alloc] initWithBag:v9 account:v8 clientInfo:v10];
    webViewController = v11->_webViewController;
    v11->_webViewController = v12;
  }
  return v11;
}

- (ACAccount)account
{
  v2 = [(AMSUIAddFundsViewController *)self webViewController];
  v3 = [v2 account];

  return (ACAccount *)v3;
}

- (AMSBagProtocol)bag
{
  v2 = [(AMSUIAddFundsViewController *)self webViewController];
  v3 = [v2 bag];

  return (AMSBagProtocol *)v3;
}

- (AMSProcessInfo)clientInfo
{
  v2 = [(AMSUIAddFundsViewController *)self webViewController];
  v3 = [v2 clientInfo];

  return (AMSProcessInfo *)v3;
}

- (NSDictionary)metricsOverlay
{
  v2 = [(AMSUIAddFundsViewController *)self webViewController];
  v3 = [v2 metricsOverlay];

  return (NSDictionary *)v3;
}

- (void)setAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIAddFundsViewController *)self webViewController];
  [v5 setAccount:v4];
}

- (void)setBag:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIAddFundsViewController *)self webViewController];
  [v5 setBag:v4];
}

- (void)setClientInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIAddFundsViewController *)self webViewController];
  [v5 setClientInfo:v4];
}

- (void)setMetricsOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIAddFundsViewController *)self webViewController];
  [v5 setMetricsOverlay:v4];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIAddFundsViewController;
  [(AMSUICommonViewController *)&v4 loadView];
  v3 = [(AMSUIAddFundsViewController *)self webViewController];
  [(AMSUICommonViewController *)self setChildViewController:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AMSUIAddFundsViewController;
  [(AMSUIAddFundsViewController *)&v8 viewWillAppear:a3];
  objc_super v4 = [(AMSUIAddFundsViewController *)self webViewController];
  id v5 = [(AMSUIAddFundsViewController *)self bag];
  v6 = [v5 URLForKey:@"AddFundsUrl"];
  id v7 = (id)[v4 loadBagValue:v6];
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AMSUIAddFundsViewController;
  [(AMSUIAddFundsViewController *)&v14 viewWillLayoutSubviews];
  v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(AMSUIAddFundsViewController *)self webViewController];
  v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

+ (id)bagKeySet
{
  id v2 = objc_alloc_init(MEMORY[0x263F27D80]);
  [v2 addBagKey:@"AddFundsUrl" valueType:5];
  v3 = +[AMSUIWebViewController bagKeySet];
  [v2 unionBagKeySet:v3];

  return v2;
}

+ (id)bagSubProfile
{
  return @"AMSUIAddFundsProfile";
}

+ (id)bagSubProfileVersion
{
  return @"1";
}

+ (id)createBagForSubProfile
{
  v3 = (void *)MEMORY[0x263F27B40];
  double v4 = [a1 bagKeySet];
  double v5 = [a1 bagSubProfile];
  double v6 = [a1 bagSubProfileVersion];
  [v3 registerBagKeySet:v4 forProfile:v5 profileVersion:v6];

  double v7 = (void *)MEMORY[0x263F27B28];
  double v8 = [a1 bagSubProfile];
  double v9 = [a1 bagSubProfileVersion];
  double v10 = [v7 bagForProfile:v8 profileVersion:v9];

  return v10;
}

- (AMSUIWebViewController)webViewController
{
  return self->_webViewController;
}

- (void).cxx_destruct
{
}

@end