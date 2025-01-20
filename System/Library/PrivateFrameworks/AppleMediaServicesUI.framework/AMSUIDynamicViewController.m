@interface AMSUIDynamicViewController
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)clientInfo;
- (AMSUIDynamicViewController)dynamicViewController;
- (AMSUIDynamicViewController)initWithBag:(id)a3 URL:(id)a4;
- (AMSUIDynamicViewController)initWithBag:(id)a3 bagValue:(id)a4;
- (AMSUIDynamicViewControllerDelegate)delegate;
- (AMSUIDynamicViewControllerDelegateProxy)delegateProxy;
- (AMSUIMediaContentDelegate)mediaContentDelegate;
- (BOOL)anonymousMetrics;
- (BOOL)isBeingDismissed;
- (BOOL)isMovingFromParentViewController;
- (NSDictionary)clientOptions;
- (NSDictionary)internalClientOptions;
- (NSDictionary)metricsOverlay;
- (NSString)mediaClientIdentifier;
- (id)navigationItem;
- (id)preload;
- (id)title;
- (void)_setup;
- (void)reloadContentViewImpressionItems;
- (void)setAccount:(id)a3;
- (void)setAnonymousMetrics:(BOOL)a3;
- (void)setBag:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setClientOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInternalClientOptions:(id)a3;
- (void)setMediaClientIdentifier:(id)a3;
- (void)setMediaContentDelegate:(id)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setTitle:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSUIDynamicViewController

- (AMSUIDynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIDynamicViewController;
  v8 = [(AMSUICommonViewController *)&v13 init];
  if (v8)
  {
    v9 = [[AMSEngagementOfflineBag alloc] initWithUnderlyingBag:v6];
    uint64_t v10 = [objc_alloc((Class)getAMSUIDDynamicViewControllerClass()) initWithBag:v9 bagValue:v7];
    dynamicViewController = v8->_dynamicViewController;
    v8->_dynamicViewController = (AMSUIDynamicViewController *)v10;

    [(AMSUIDynamicViewController *)v8 _setup];
  }

  return v8;
}

- (AMSUIDynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIDynamicViewController;
  v8 = [(AMSUICommonViewController *)&v13 init];
  if (v8)
  {
    v9 = [[AMSEngagementOfflineBag alloc] initWithUnderlyingBag:v6];
    uint64_t v10 = [objc_alloc((Class)getAMSUIDDynamicViewControllerClass()) initWithBag:v9 URL:v7];
    dynamicViewController = v8->_dynamicViewController;
    v8->_dynamicViewController = (AMSUIDynamicViewController *)v10;

    [(AMSUIDynamicViewController *)v8 _setup];
  }

  return v8;
}

- (ACAccount)account
{
  v2 = [(AMSUIDynamicViewController *)self dynamicViewController];
  v3 = [v2 account];

  return (ACAccount *)v3;
}

- (BOOL)anonymousMetrics
{
  v2 = [(AMSUIDynamicViewController *)self dynamicViewController];
  char v3 = [v2 anonymousMetrics];

  return v3;
}

- (AMSBagProtocol)bag
{
  v2 = [(AMSUIDynamicViewController *)self dynamicViewController];
  char v3 = [v2 bag];

  return (AMSBagProtocol *)v3;
}

- (AMSProcessInfo)clientInfo
{
  v2 = [(AMSUIDynamicViewController *)self dynamicViewController];
  char v3 = [v2 clientInfo];

  return (AMSProcessInfo *)v3;
}

- (NSDictionary)clientOptions
{
  v2 = [(AMSUIDynamicViewController *)self dynamicViewController];
  char v3 = [v2 clientOptions];

  return (NSDictionary *)v3;
}

- (AMSUIDynamicViewControllerDelegate)delegate
{
  v2 = [(AMSUIDynamicViewController *)self delegateProxy];
  char v3 = [v2 delegate];

  return (AMSUIDynamicViewControllerDelegate *)v3;
}

- (NSDictionary)internalClientOptions
{
  v2 = [(AMSUIDynamicViewController *)self dynamicViewController];
  char v3 = [v2 internalClientOptions];

  return (NSDictionary *)v3;
}

- (NSString)mediaClientIdentifier
{
  v2 = [(AMSUIDynamicViewController *)self dynamicViewController];
  char v3 = [v2 mediaClientIdentifier];

  return (NSString *)v3;
}

- (NSDictionary)metricsOverlay
{
  v2 = [(AMSUIDynamicViewController *)self dynamicViewController];
  char v3 = [v2 metricsOverlay];

  return (NSDictionary *)v3;
}

- (void)setAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIDynamicViewController *)self dynamicViewController];
  [v5 setAccount:v4];
}

- (void)setAnonymousMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AMSUIDynamicViewController *)self dynamicViewController];
  [v4 setAnonymousMetrics:v3];
}

- (void)setBag:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIDynamicViewController *)self dynamicViewController];
  [v5 setBag:v4];
}

- (void)setClientInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIDynamicViewController *)self dynamicViewController];
  [v5 setClientInfo:v4];
}

- (void)setClientOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIDynamicViewController *)self dynamicViewController];
  [v5 setClientOptions:v4];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIDynamicViewController *)self delegateProxy];
  [v5 setDelegate:v4];
}

- (void)setInternalClientOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIDynamicViewController *)self dynamicViewController];
  [v5 setInternalClientOptions:v4];
}

- (void)setMediaClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIDynamicViewController *)self dynamicViewController];
  [v5 setMediaClientIdentifier:v4];
}

- (void)setMediaContentDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIDynamicViewController *)self dynamicViewController];
  [v5 setMediaContentDelegate:v4];
}

- (void)setMetricsOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIDynamicViewController *)self dynamicViewController];
  [v5 setMetricsOverlay:v4];
}

- (id)preload
{
  v2 = [(AMSUIDynamicViewController *)self dynamicViewController];
  BOOL v3 = [v2 preload];

  return v3;
}

- (void)reloadContentViewImpressionItems
{
  id v2 = [(AMSUIDynamicViewController *)self dynamicViewController];
  [v2 reloadContentViewImpressionItems];
}

- (void)_setup
{
  BOOL v3 = [[AMSUIDynamicViewControllerDelegateProxy alloc] initWithDynamicViewController:self];
  delegateProxy = self->_delegateProxy;
  self->_delegateProxy = v3;

  id v5 = self->_delegateProxy;
  dynamicViewController = self->_dynamicViewController;
  [(AMSUIDynamicViewController *)dynamicViewController setDelegate:v5];
}

- (BOOL)isBeingDismissed
{
  BOOL v3 = [(AMSUIDynamicViewController *)self parentViewController];

  if (v3)
  {
    id v4 = [(AMSUIDynamicViewController *)self parentViewController];
    char v5 = [v4 isBeingDismissed];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AMSUIDynamicViewController;
    return [(AMSUIDynamicViewController *)&v7 isBeingDismissed];
  }
}

- (BOOL)isMovingFromParentViewController
{
  BOOL v3 = [(AMSUIDynamicViewController *)self parentViewController];

  if (v3)
  {
    id v4 = [(AMSUIDynamicViewController *)self parentViewController];
    char v5 = [v4 isMovingFromParentViewController];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AMSUIDynamicViewController;
    return [(AMSUIDynamicViewController *)&v7 isMovingFromParentViewController];
  }
}

- (id)navigationItem
{
  uint64_t v3 = [(AMSUIDynamicViewController *)self parentViewController];
  if (v3
    && (id v4 = (void *)v3,
        [(AMSUIDynamicViewController *)self parentViewController],
        char v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        v4,
        (isKindOfClass & 1) == 0))
  {
    v8 = [(AMSUIDynamicViewController *)self parentViewController];
    objc_super v7 = [v8 navigationItem];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AMSUIDynamicViewController;
    objc_super v7 = [(AMSUIDynamicViewController *)&v10 navigationItem];
  }
  return v7;
}

- (id)title
{
  uint64_t v3 = [(AMSUIDynamicViewController *)self parentViewController];

  if (v3)
  {
    id v4 = [(AMSUIDynamicViewController *)self parentViewController];
    char v5 = [v4 title];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AMSUIDynamicViewController;
    char v5 = [(AMSUIDynamicViewController *)&v7 title];
  }
  return v5;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  char v5 = [(AMSUIDynamicViewController *)self parentViewController];

  if (v5)
  {
    id v6 = [(AMSUIDynamicViewController *)self parentViewController];
    [v6 setTitle:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AMSUIDynamicViewController;
    [(AMSUIDynamicViewController *)&v7 setTitle:v4];
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIDynamicViewController;
  [(AMSUIDynamicViewController *)&v4 viewDidLoad];
  uint64_t v3 = [(AMSUIDynamicViewController *)self dynamicViewController];
  [(AMSUICommonViewController *)self setChildViewController:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIDynamicViewController;
  [(AMSUIDynamicViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AMSUIDynamicViewController;
  [(AMSUIDynamicViewController *)&v14 viewWillLayoutSubviews];
  objc_super v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(AMSUIDynamicViewController *)self dynamicViewController];
  objc_super v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(MEMORY[0x263F27D80]);
  objc_super v3 = [MEMORY[0x263F27D18] bagKeySet];
  [v2 unionBagKeySet:v3];

  double v4 = [MEMORY[0x263F27E30] bagKeySet];
  [v2 unionBagKeySet:v4];

  return (AMSBagKeySet *)v2;
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSUIDynamic";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  id v2 = (void *)MEMORY[0x263F27B40];
  objc_super v3 = [(id)objc_opt_class() bagKeySet];
  double v4 = [(id)objc_opt_class() bagSubProfile];
  double v5 = [(id)objc_opt_class() bagSubProfileVersion];
  [v2 registerBagKeySet:v3 forProfile:v4 profileVersion:v5];

  double v6 = (void *)MEMORY[0x263F27B28];
  double v7 = [(id)objc_opt_class() bagSubProfile];
  double v8 = [(id)objc_opt_class() bagSubProfileVersion];
  double v9 = [v6 bagForProfile:v7 profileVersion:v8];

  return v9;
}

- (AMSUIMediaContentDelegate)mediaContentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaContentDelegate);
  return (AMSUIMediaContentDelegate *)WeakRetained;
}

- (AMSUIDynamicViewControllerDelegateProxy)delegateProxy
{
  return self->_delegateProxy;
}

- (AMSUIDynamicViewController)dynamicViewController
{
  return self->_dynamicViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicViewController, 0);
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_destroyWeak((id *)&self->_mediaContentDelegate);
}

@end