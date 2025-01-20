@interface STWebServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)URLIsBlocked;
- (DMFWebsitePolicyMonitor)websitePolicyMonitor;
- (STBlockingViewController)blockingViewController;
- (STWebServiceViewController)initWithCoder:(id)a3;
- (STWebServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (USWebpageUsage)webpageUsage;
- (void)_hideBlockingViewControllerWithAnimation:(BOOL)a3 replyHandler:(id)a4;
- (void)_reportURLIsBlocked:(BOOL)a3;
- (void)_requestPolicyForURL:(id)a3 replyHandler:(id)a4;
- (void)_showBlockingViewControllerForWebpage:(id)a3 withPolicy:(int64_t)a4 animated:(BOOL)a5 replyHandler:(id)a6;
- (void)_stWebServiceViewControllerCommonInit;
- (void)_startRecordingUsageForURL:(id)a3 bundleIdentifier:(id)a4 usageState:(int64_t)a5 replyHandler:(id)a6;
- (void)changeUsageState:(int64_t)a3 replyHandler:(id)a4;
- (void)setURL:(id)a3 bundleIdentifier:(id)a4 usageState:(int64_t)a5 replyHandler:(id)a6;
- (void)setWebpageUsage:(id)a3;
@end

@implementation STWebServiceViewController

- (STWebServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)STWebServiceViewController;
  v4 = [(STWebServiceViewController *)&v6 initWithNibName:a3 bundle:a4];
  [(STWebServiceViewController *)v4 _stWebServiceViewControllerCommonInit];
  return v4;
}

- (STWebServiceViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STWebServiceViewController;
  v3 = [(STWebServiceViewController *)&v5 initWithCoder:a3];
  [(STWebServiceViewController *)v3 _stWebServiceViewControllerCommonInit];
  return v3;
}

- (void)_stWebServiceViewControllerCommonInit
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)DMFWebsitePolicyMonitor);
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100001C64;
  v11 = &unk_100004198;
  objc_copyWeak(&v12, &location);
  v4 = (DMFWebsitePolicyMonitor *)[v3 initWithPolicyChangeHandler:&v8];
  websitePolicyMonitor = self->_websitePolicyMonitor;
  self->_websitePolicyMonitor = v4;

  objc_super v6 = (STBlockingViewController *)+[STBlockingViewController newTranslucentBlockingViewController];
  blockingViewController = self->_blockingViewController;
  self->_blockingViewController = v6;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

+ (id)_remoteViewControllerInterface
{
  id v2 = +[STWebService newDelegateInterface];

  return v2;
}

+ (id)_exportedInterface
{
  id v2 = +[STWebService newServiceInterface];

  return v2;
}

- (void)setURL:(id)a3 bundleIdentifier:(id)a4 usageState:(int64_t)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(STWebServiceViewController *)self webpageUsage];
  if (v13)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100001E80;
    v14[3] = &unk_1000041C0;
    v14[4] = self;
    id v15 = v10;
    id v16 = v11;
    int64_t v18 = a5;
    id v17 = v12;
    [v13 changeState:0 completionHandler:v14];
  }
  else
  {
    [(STWebServiceViewController *)self _startRecordingUsageForURL:v10 bundleIdentifier:v11 usageState:a5 replyHandler:v12];
  }
}

- (void)changeUsageState:(int64_t)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(STWebServiceViewController *)self webpageUsage];
  [v7 changeState:a3 completionHandler:v6];
}

- (void)_startRecordingUsageForURL:(id)a3 bundleIdentifier:(id)a4 usageState:(int64_t)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    id v13 = objc_alloc((Class)USWebpageUsage);
    [(STWebServiceViewController *)self _hostAuditToken];
    id v14 = [v13 initWithURL:v10 bundleIdentifier:v11 auditToken:v18];
    [(STWebServiceViewController *)self setWebpageUsage:v14];
    if ((unint64_t)(a5 - 1) >= 2)
    {
      if (!a5) {
        [(STWebServiceViewController *)self _requestPolicyForURL:v10 replyHandler:v12];
      }
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100002084;
      v15[3] = &unk_1000041E8;
      v15[4] = self;
      id v16 = v10;
      id v17 = v12;
      [v14 changeState:a5 completionHandler:v15];
    }
  }
  else
  {
    [(STWebServiceViewController *)self setWebpageUsage:0];
    [(STWebServiceViewController *)self _hideBlockingViewControllerWithAnimation:0 replyHandler:v12];
  }
}

- (void)_requestPolicyForURL:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(STWebServiceViewController *)self websitePolicyMonitor];
  id v16 = v6;
  uint64_t v9 = +[NSArray arrayWithObjects:&v16 count:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000021DC;
  v12[3] = &unk_100004238;
  id v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  [v8 requestPoliciesForWebsites:v9 completionHandler:v12];
}

- (void)_reportURLIsBlocked:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(STWebServiceViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_100004278];
  [v4 setURLIsBlocked:v3 replyHandler:&stru_1000042B8];
}

- (BOOL)URLIsBlocked
{
  BOOL v3 = [(STWebServiceViewController *)self childViewControllers];
  id v4 = [(STWebServiceViewController *)self blockingViewController];
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (void)_showBlockingViewControllerForWebpage:(id)a3 withPolicy:(int64_t)a4 animated:(BOOL)a5 replyHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = (void (**)(id, void))a6;
  id v11 = a3;
  id v12 = [(STWebServiceViewController *)self blockingViewController];
  [v12 updateAppearanceUsingPolicy:a4 forWebpageURL:v11];

  if ([(STWebServiceViewController *)self URLIsBlocked])
  {
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else
  {
    [(STWebServiceViewController *)self addChildViewController:v12];
    id v13 = [v12 view];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v14 = [(STWebServiceViewController *)self view];
    [v14 addSubview:v13];

    id v15 = _NSDictionaryOfVariableBindings(@"blockingView", v13, 0);
    id v16 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[blockingView]|" options:0 metrics:0 views:v15];
    id v17 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[blockingView]|" options:0 metrics:0 views:v15];
    int64_t v18 = [v16 arrayByAddingObjectsFromArray:v17];
    +[NSLayoutConstraint activateConstraints:v18];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100002708;
    v19[3] = &unk_1000042E0;
    id v20 = v12;
    v21 = self;
    v22 = v10;
    [v20 showWithAnimation:v6 completionHandler:v19];
  }
}

- (void)_hideBlockingViewControllerWithAnimation:(BOOL)a3 replyHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(STWebServiceViewController *)self blockingViewController];
  if ([(STWebServiceViewController *)self URLIsBlocked])
  {
    [v7 willMoveToParentViewController:0];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000028A4;
    v8[3] = &unk_100004308;
    id v9 = v7;
    id v10 = self;
    id v11 = v6;
    [v9 hideWithAnimation:v4 completionHandler:v8];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (USWebpageUsage)webpageUsage
{
  return (USWebpageUsage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWebpageUsage:(id)a3
{
}

- (DMFWebsitePolicyMonitor)websitePolicyMonitor
{
  return (DMFWebsitePolicyMonitor *)objc_getProperty(self, a2, 16, 1);
}

- (STBlockingViewController)blockingViewController
{
  return (STBlockingViewController *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingViewController, 0);
  objc_storeStrong((id *)&self->_websitePolicyMonitor, 0);

  objc_storeStrong((id *)&self->_webpageUsage, 0);
}

@end