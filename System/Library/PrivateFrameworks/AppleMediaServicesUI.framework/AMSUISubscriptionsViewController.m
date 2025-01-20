@interface AMSUISubscriptionsViewController
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)clientInfo;
- (AMSUISubscriptionsViewController)initWithAccount:(id)a3 bag:(id)a4;
- (AMSUISubscriptionsViewController)initWithAccount:(id)a3 bag:(id)a4 clientInfo:(id)a5;
- (AMSUIWebViewController)webViewController;
- (NSDictionary)metricsOverlay;
- (NSString)subscriptionType;
- (void)_setChildViewController:(id)a3;
- (void)_setupChildViewController;
- (void)_setupLayout;
- (void)_startLoading;
- (void)setAccount:(id)a3;
- (void)setBag:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setSubscriptionType:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSUISubscriptionsViewController

- (AMSUISubscriptionsViewController)initWithAccount:(id)a3 bag:(id)a4
{
  return [(AMSUISubscriptionsViewController *)self initWithAccount:a3 bag:a4 clientInfo:0];
}

- (AMSUISubscriptionsViewController)initWithAccount:(id)a3 bag:(id)a4 clientInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUISubscriptionsViewController;
  v11 = [(AMSUISubscriptionsViewController *)&v15 init];
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
  v2 = [(AMSUISubscriptionsViewController *)self webViewController];
  v3 = [v2 account];

  return (ACAccount *)v3;
}

- (AMSBagProtocol)bag
{
  v2 = [(AMSUISubscriptionsViewController *)self webViewController];
  v3 = [v2 bag];

  return (AMSBagProtocol *)v3;
}

- (AMSProcessInfo)clientInfo
{
  v2 = [(AMSUISubscriptionsViewController *)self webViewController];
  v3 = [v2 clientInfo];

  return (AMSProcessInfo *)v3;
}

- (NSDictionary)metricsOverlay
{
  v2 = [(AMSUISubscriptionsViewController *)self webViewController];
  v3 = [v2 metricsOverlay];

  return (NSDictionary *)v3;
}

- (void)setAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUISubscriptionsViewController *)self webViewController];
  [v5 setAccount:v4];
}

- (void)setBag:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUISubscriptionsViewController *)self webViewController];
  [v5 setBag:v4];
}

- (void)setClientInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUISubscriptionsViewController *)self webViewController];
  [v5 setClientInfo:v4];
}

- (void)setMetricsOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUISubscriptionsViewController *)self webViewController];
  [v5 setMetricsOverlay:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUISubscriptionsViewController;
  [(AMSUISubscriptionsViewController *)&v3 viewDidLoad];
  [(AMSUISubscriptionsViewController *)self _setup];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUISubscriptionsViewController;
  [(AMSUISubscriptionsViewController *)&v4 viewWillAppear:a3];
  [(AMSUISubscriptionsViewController *)self _startLoading];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUISubscriptionsViewController;
  [(AMSUISubscriptionsViewController *)&v3 viewWillLayoutSubviews];
  [(AMSUISubscriptionsViewController *)self _setupLayout];
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(MEMORY[0x263F27D80]);
  [v2 addBagKey:@"manageSubscriptionsDynamicUIUrl" valueType:5];
  objc_super v3 = +[AMSUIDynamicViewController bagKeySet];
  [v2 unionBagKeySet:v3];

  return (AMSBagKeySet *)v2;
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSUIManageSubscriptions";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  objc_super v3 = (void *)MEMORY[0x263F27B40];
  objc_super v4 = [a1 bagKeySet];
  id v5 = [a1 bagSubProfile];
  v6 = [a1 bagSubProfileVersion];
  [v3 registerBagKeySet:v4 forProfile:v5 profileVersion:v6];

  v7 = (void *)MEMORY[0x263F27B28];
  id v8 = [a1 bagSubProfile];
  id v9 = [a1 bagSubProfileVersion];
  id v10 = [v7 bagForProfile:v8 profileVersion:v9];

  return v10;
}

- (void)_setupChildViewController
{
  id v3 = [(AMSUISubscriptionsViewController *)self webViewController];
  [(AMSUISubscriptionsViewController *)self _setChildViewController:v3];
}

- (void)_setChildViewController:(id)a3
{
  id v6 = a3;
  [(AMSUISubscriptionsViewController *)self addChildViewController:v6];
  objc_super v4 = [(AMSUISubscriptionsViewController *)self view];
  id v5 = [v6 view];
  [v4 addSubview:v5];

  objc_msgSend(v6, "ams_didMoveToParentViewController:", self);
}

- (void)_setupLayout
{
  id v13 = [(AMSUISubscriptionsViewController *)self view];
  [v13 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(AMSUISubscriptionsViewController *)self webViewController];
  v12 = [v11 view];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
}

- (void)_startLoading
{
  objc_initWeak(&location, self);
  double v3 = [(AMSUISubscriptionsViewController *)self bag];
  double v4 = [v3 URLForKey:@"manageSubscriptionsV2Url"];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  double v10 = __49__AMSUISubscriptionsViewController__startLoading__block_invoke;
  v11 = &unk_2643E4630;
  objc_copyWeak(&v12, &location);
  double v5 = [v4 transformWithBlock:&v8];

  double v6 = [(AMSUISubscriptionsViewController *)self webViewController];
  id v7 = (id)[v6 loadBagValue:v5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

id __49__AMSUISubscriptionsViewController__startLoading__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = (void *)MEMORY[0x263F08BA0];
  double v6 = [v3 absoluteString];
  id v7 = [v5 componentsWithString:v6];

  uint64_t v8 = [v7 queryItems];
  uint64_t v9 = (void *)[v8 mutableCopy];

  double v10 = [WeakRetained subscriptionType];

  if (v10)
  {
    v11 = (void *)MEMORY[0x263F08BD0];
    id v12 = [WeakRetained subscriptionType];
    id v13 = [v11 queryItemWithName:@"subscriptionType" value:v12];
    [v9 addObject:v13];
  }
  uint64_t v14 = [v7 URL];
  objc_super v15 = (void *)v14;
  if (v14) {
    v16 = (void *)v14;
  }
  else {
    v16 = v3;
  }
  id v17 = v16;

  v18 = [MEMORY[0x263F27E10] promiseWithResult:v17];

  return v18;
}

- (NSString)subscriptionType
{
  return self->_subscriptionType;
}

- (void)setSubscriptionType:(id)a3
{
}

- (AMSUIWebViewController)webViewController
{
  return self->_webViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewController, 0);
  objc_storeStrong((id *)&self->_subscriptionType, 0);
}

@end