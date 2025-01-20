@interface ServiceAccountPageViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (ACAccount)account;
- (BOOL)finishedLoading;
- (BOOL)loadFromBridgedNavigation;
- (BOOL)showAccountGlyph;
- (CGRect)presentationBounds;
- (SSPromise)configurationPromise;
- (SUAccountViewController)presentedAccountViewController;
- (SUClientInterface)clientInterface;
- (SUNavigationController)containerNavigationController;
- (SUScriptRedeemCameraViewController)redeemCameraScriptObject;
- (ServiceAccountPageEmbedded)underlyingViewController;
- (ServiceAccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)childViewController;
- (UIViewController)presentingBridgedViewController;
- (id)_bagKeyForConfigURLString:(id)a3;
- (id)_preloadConfiguration;
- (id)navigationController;
- (id)navigationItem;
- (id)navigationItemOptionsFromViewController:(id)a3;
- (int64_t)type;
- (void)_cancelButtonAction:(id)a3;
- (void)_loadURLWithActiveConfiguration:(id)a3;
- (void)_presentErrorViewControllerWithError:(id)a3;
- (void)_presentViewController:(id)a3;
- (void)_willAppearInRemoteViewController;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)bridgedRightButtonPressed;
- (void)clientInterface:(id)a3 financeInterruptionResolved:(BOOL)a4;
- (void)clientInterface:(id)a3 overrideCreditCardPresentationFromViewController:(id)a4 completion:(id)a5;
- (void)clientInterface:(id)a3 overrideRedeemCameraPerformAction:(int64_t)a4 withObject:(id)a5;
- (void)clientInterfaceDidFinishLoading:(id)a3;
- (void)dealloc;
- (void)dismissHostViewController;
- (void)dismissHostViewControllerWithResult:(BOOL)a3 error:(id)a4;
- (void)dismissPresentingBridgedViewController;
- (void)dismissViewController;
- (void)keyboardDidChangeFrame:(CGRect)a3 animationCurve:(int64_t)a4 duration:(double)a5;
- (void)keyboardWillChangeFrame:(CGRect)a3 animationCurve:(int64_t)a4 duration:(double)a5;
- (void)loadWithURL:(id)a3;
- (void)navigationItemUpdated;
- (void)overrideIPadRedeemCamera:(id)a3 completion:(id)a4;
- (void)performRedeemOperationWithCode:(id)a3 cameraRecognized:(BOOL)a4 completion:(id)a5;
- (void)popBridgedViewControllersToIndex:(unint64_t)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)pushBridgedViewController:(id)a3 animated:(BOOL)a4;
- (void)redeemCameraCodeDetected:(id)a3;
- (void)setAccount:(id)a3;
- (void)setBridgedNavigationItemWithOptions:(id)a3;
- (void)setChildViewController:(id)a3;
- (void)setClientInterface:(id)a3;
- (void)setConfigurationPromise:(id)a3;
- (void)setContainerNavigationController:(id)a3;
- (void)setFinishedLoading:(BOOL)a3;
- (void)setLoadFromBridgedNavigation:(BOOL)a3;
- (void)setPresentationBounds:(CGRect)a3;
- (void)setPresentedAccountViewController:(id)a3;
- (void)setPresentingBridgedViewController:(id)a3;
- (void)setRedeemCameraScriptObject:(id)a3;
- (void)setReferrer:(id)a3;
- (void)setShowAccountGlyph:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setUnderlyingViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ServiceAccountPageViewController

- (ServiceAccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)ServiceAccountPageViewController;
  v4 = [(ServiceAccountPageViewController *)&v12 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = +[SKProductPageViewController _defaultClientInterface];
    clientInterface = v4->_clientInterface;
    v4->_clientInterface = (SUClientInterface *)v5;

    [(SUClientInterface *)v4->_clientInterface setDelegate:v4];
    [(SUClientInterface *)v4->_clientInterface setIgnoreDefaultKeyboardNotifications:1];
    v7 = v4->_clientInterface;
    v8 = +[SUWebViewManager defaultLocalStoragePath];
    [(SUClientInterface *)v7 setLocalStoragePath:v8];

    uint64_t v9 = [(ServiceAccountPageViewController *)v4 _preloadConfiguration];
    configurationPromise = v4->_configurationPromise;
    v4->_configurationPromise = (SSPromise *)v9;
  }
  return v4;
}

- (void)dealloc
{
  [(SUClientInterface *)self->_clientInterface setDelegate:0];
  if (objc_opt_respondsToSelector()) {
    [(ServiceAccountPageEmbedded *)self->_underlyingViewController setEmbeddedParent:0];
  }
  if ((unint64_t)(self->_type - 1) <= 1)
  {
    v3 = +[ServiceBridgedNavigationController sharedController];
    [v3 synchonrizeContinainerViewControllers];
  }
  v4.receiver = self;
  v4.super_class = (Class)ServiceAccountPageViewController;
  [(ServiceAccountPageViewController *)&v4 dealloc];
}

- (void)dismissHostViewController
{
}

- (void)dismissHostViewControllerWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
  v7 = +[NSNumber numberWithBool:v4];
  [v8 dismissViewControllerWithResult:v7 error:v6];
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKUIServiceAccountPageViewController];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKUIClientAccountPageViewController];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)ServiceAccountPageViewController;
  [(ServiceAccountPageViewController *)&v10 viewDidLoad];
  v3 = [(ServiceAccountPageViewController *)self view];
  BOOL v4 = +[UIColor systemGroupedBackgroundColor];
  [v3 setBackgroundColor:v4];

  uint64_t v5 = [(SUClientInterface *)self->_clientInterface viewControllerFactory];
  id v6 = [v5 newPlaceholderViewController];

  id v7 = [objc_alloc((Class)SUNavigationController) initWithRootViewController:v6];
  [(ServiceAccountPageViewController *)self setContainerNavigationController:v7];

  id v8 = [(ServiceAccountPageViewController *)self containerNavigationController];
  [v8 setClientInterface:self->_clientInterface];

  uint64_t v9 = [(ServiceAccountPageViewController *)self containerNavigationController];
  [(ServiceAccountPageViewController *)self setChildViewController:v9];
}

- (void)setChildViewController:(id)a3
{
  uint64_t v5 = (UIViewController *)a3;
  p_childViewController = &self->_childViewController;
  childViewController = self->_childViewController;
  if (childViewController != v5)
  {
    v14 = v5;
    if (childViewController)
    {
      [(UIViewController *)childViewController willMoveToParentViewController:0];
      id v8 = [(UIViewController *)*p_childViewController view];
      [v8 removeFromSuperview];

      [(UIViewController *)*p_childViewController removeFromParentViewController];
      uint64_t v5 = v14;
    }
    [(UIViewController *)v5 willMoveToParentViewController:self];
    uint64_t v9 = [(UIViewController *)v14 view];
    objc_super v10 = [(ServiceAccountPageViewController *)self view];
    [v10 bounds];
    [v9 setFrame:];

    v11 = [(UIViewController *)v14 view];
    [v11 setAutoresizingMask:18];

    objc_super v12 = [(ServiceAccountPageViewController *)self view];
    v13 = [(UIViewController *)v14 view];
    [v12 addSubview:v13];

    [(ServiceAccountPageViewController *)self addChildViewController:v14];
    objc_storeStrong((id *)&self->_childViewController, a3);
  }

  _objc_release_x1();
}

- (void)setUnderlyingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingViewController, a3);
  id v5 = a3;
  id v7 = [v5 navigationItem];
  id v6 = +[ServiceBridgedNavigationItem itemFromItem:v7];
  [v6 setProxyHandler:self];
  [v5 su_setBridgedNavigationItem:v6];
}

- (void)_willAppearInRemoteViewController
{
  long long v9 = 0u;
  long long v10 = 0u;
  [(ServiceAccountPageViewController *)self _hostAuditToken];
  long long v7 = v9;
  long long v8 = v10;
  if (sub_100010BA0(&v7, @"com.apple.ios.StoreKit.account-page")
    || (v7 = v9, long long v8 = v10, sub_100010BA0(&v7, kSSITunesStorePrivateEntitlement)))
  {
    v3 = 0;
    uint64_t v4 = 1;
  }
  else
  {
    v3 = SSError();
    uint64_t v4 = 0;
  }
  id v5 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
  id v6 = +[NSNumber numberWithBool:v4];
  [v5 didPrepareWithResult:v6 error:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ServiceAccountPageViewController;
  [(ServiceAccountPageViewController *)&v5 viewWillAppear:a3];
  if ((id)[(ServiceAccountPageViewController *)self type] == (id)1
    && ![(ServiceAccountPageViewController *)self loadFromBridgedNavigation])
  {
    uint64_t v4 = +[ServiceBridgedNavigationController sharedController];
    [v4 setProxyHandler:self];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ServiceAccountPageViewController;
  [(ServiceAccountPageViewController *)&v5 viewDidAppear:a3];
  if ((id)[(ServiceAccountPageViewController *)self type] == (id)1
    || (id)[(ServiceAccountPageViewController *)self type] == (id)2)
  {
    uint64_t v4 = +[ServiceBridgedNavigationController sharedController];
    [v4 synchonrizeContinainerViewControllers];
  }
}

- (id)navigationItem
{
  if ((id)[(ServiceAccountPageViewController *)self type] == (id)1)
  {
    v3 = [(ServiceAccountPageViewController *)self underlyingViewController];
    uint64_t v4 = [v3 su_bridgedNavigationItem];
    objc_super v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)ServiceAccountPageViewController;
      id v6 = [(ServiceAccountPageViewController *)&v10 navigationItem];
    }
    long long v7 = v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ServiceAccountPageViewController;
    long long v7 = [(ServiceAccountPageViewController *)&v9 navigationItem];
  }

  return v7;
}

- (id)navigationController
{
  if ((id)[(ServiceAccountPageViewController *)self type] == (id)1)
  {
    v3 = +[ServiceBridgedNavigationController sharedController];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ServiceAccountPageViewController;
    v3 = [(ServiceAccountPageViewController *)&v5 navigationController];
  }

  return v3;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v5 = a4;
  id v7 = a3;
  long long v8 = +[ServiceBridgedPresentationController sharedController];
  [(ServiceAccountPageViewController *)self presentationBounds];
  LODWORD(v5) = [v8 saveViewController:v7 animated:v5 presentationBounds:self];

  if (v5)
  {
    id v9 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
    [v9 presentBridgedViewController];
  }
}

- (void)navigationItemUpdated
{
  v3 = [(ServiceAccountPageViewController *)self underlyingViewController];
  id v4 = [(ServiceAccountPageViewController *)self navigationItemOptionsFromViewController:v3];

  [(ServiceAccountPageViewController *)self setBridgedNavigationItemWithOptions:v4];
}

- (void)setBridgedNavigationItemWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
  [v5 setBridgedNavigationItemWithOptions:v4];
}

- (id)navigationItemOptionsFromViewController:(id)a3
{
  v3 = [a3 navigationItem];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 hidesBackButton]);
  [v4 setObject:v5 forKeyedSubscript:SKUIServiceNavigationOptionBackButtonHidden];

  id v6 = [v3 backButtonTitle];

  if (v6)
  {
    id v7 = [v3 backButtonTitle];
    [v4 setObject:v7 forKeyedSubscript:SKUIServiceNavigationOptionBackButtonTitle];
  }
  long long v8 = [v3 rightBarButtonItem];

  if (v8)
  {
    id v9 = [v3 rightBarButtonItem];
    objc_super v10 = [v9 title];
    [v4 setObject:v10 forKeyedSubscript:SKUIServiceNavigationOptionRightButtonTitle];

    v11 = [v3 rightBarButtonItem];
    objc_super v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 style]);
    [v4 setObject:v12 forKeyedSubscript:SKUIServiceNavigationOptionRightButtonStyle];

    v13 = [v3 rightBarButtonItem];
    v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 isEnabled]);
    [v4 setObject:v14 forKeyedSubscript:SKUIServiceNavigationOptionRightButtonEnabled];
  }
  v15 = [v3 title];

  if (v15)
  {
    v16 = [v3 title];
    [v4 setObject:v16 forKeyedSubscript:SKUIServiceNavigationOptionTitle];
  }

  return v4;
}

- (void)pushBridgedViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(ServiceAccountPageViewController *)self navigationItemOptionsFromViewController:a3];
  id v6 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
  [v6 pushBridgedViewControllerAnimated:v4 options:v7];
}

- (void)popBridgedViewControllersToIndex:(unint64_t)a3
{
  id v4 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
  [v4 popBridgedViewControllersToIndex:a3];
}

- (void)dismissViewController
{
  id v2 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
  [v2 dismissBridgedViewController];
}

- (void)loadWithURL:(id)a3
{
  id v4 = a3;
  if ([(ServiceAccountPageViewController *)self loadFromBridgedNavigation])
  {
    id v5 = +[ServiceBridgedNavigationController sharedController];
    id v6 = [v5 topViewController];

    [(ServiceAccountPageViewController *)self setUnderlyingViewController:v6];
    [(ServiceAccountPageViewController *)self setChildViewController:v6];
  }
  else if ((id)[(ServiceAccountPageViewController *)self type] == (id)2)
  {
    id v7 = objc_alloc_init((Class)UIView);
    long long v8 = +[UIColor clearColor];
    [v7 setBackgroundColor:v8];

    [v7 setOpaque:0];
    [(ServiceAccountPageViewController *)self setView:v7];
    id v9 = [(ServiceAccountPageViewController *)self view];
    objc_super v10 = [v9 window];
    [v10 makeKeyWindow];

    v11 = +[ServiceBridgedPresentationController sharedController];
    objc_super v12 = [v11 removeSavedViewController];

    if (v12)
    {
      [(ServiceAccountPageViewController *)self setPresentingBridgedViewController:v12];
      [(ServiceAccountPageViewController *)self showViewController:v12 sender:self];
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v13 = [(ServiceAccountPageViewController *)self configurationPromise];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100017AD8;
    v14[3] = &unk_10004D5D0;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    [v13 addFinishBlock:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)applicationWillEnterForeground
{
  id v5 = [(ServiceAccountPageViewController *)self underlyingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v5 embeddedViewController];

    id v5 = (id)v2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v5;
    [v3 applicationWillEnterForeground];
    id v4 = [v3 activeChildViewController];

    [v4 applicationWillEnterForeground];
  }
}

- (void)applicationDidEnterBackground
{
  id v5 = [(ServiceAccountPageViewController *)self underlyingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v5 embeddedViewController];

    id v5 = (id)v2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v5;
    [v3 applicationDidEnterBackground];
    id v4 = [v3 activeChildViewController];

    [v4 applicationDidEnterBackground];
  }
}

- (void)performRedeemOperationWithCode:(id)a3 cameraRecognized:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v8 = a5;
  p_redeemCameraViewController = &self->_redeemCameraViewController;
  id WeakRetained = objc_loadWeakRetained((id *)p_redeemCameraViewController);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)p_redeemCameraViewController);
    [v11 performRedeemOperationWithCode:v12 cameraRecognized:v6 completion:v8];
  }
}

- (void)bridgedRightButtonPressed
{
  if ((id)[(ServiceAccountPageViewController *)self type] == (id)1)
  {
    id v3 = [(ServiceAccountPageViewController *)self underlyingViewController];
    id v4 = [v3 su_bridgedNavigationItem];
    id v6 = [v4 rightBarButtonItem];

    id v5 = [v6 target];
    [v5 performSelector:[v6 action]];
  }
}

- (void)dismissPresentingBridgedViewController
{
  if ((id)[(ServiceAccountPageViewController *)self type] == (id)2)
  {
    id v3 = [(ServiceAccountPageViewController *)self presentingBridgedViewController];

    if (v3)
    {
      objc_initWeak(&location, self);
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_100018030;
      v4[3] = &unk_10004CDC8;
      objc_copyWeak(&v5, &location);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

- (void)redeemCameraCodeDetected:(id)a3
{
  id v4 = a3;
  id v5 = [(ServiceAccountPageViewController *)self redeemCameraScriptObject];
  [v5 codeDetected:v4];
}

- (void)keyboardDidChangeFrame:(CGRect)a3 animationCurve:(int64_t)a4 duration:(double)a5
{
  v13[0] = UIKeyboardFrameEndUserInfoKey;
  CGRect v12 = a3;
  id v7 = +[NSValue valueWithBytes:&v12 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v14[0] = v7;
  v13[1] = UIKeyboardAnimationCurveUserInfoKey;
  id v8 = +[NSNumber numberWithInteger:a4];
  v14[1] = v8;
  v13[2] = UIKeyboardAnimationDurationUserInfoKey;
  id v9 = +[NSNumber numberWithDouble:a5];
  v14[2] = v9;
  objc_super v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 postNotificationName:SUKeyboardDidChangeNotification object:0 userInfo:v10];
}

- (void)keyboardWillChangeFrame:(CGRect)a3 animationCurve:(int64_t)a4 duration:(double)a5
{
  v13[0] = UIKeyboardFrameEndUserInfoKey;
  CGRect v12 = a3;
  id v7 = +[NSValue valueWithBytes:&v12 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v14[0] = v7;
  v13[1] = UIKeyboardAnimationCurveUserInfoKey;
  id v8 = +[NSNumber numberWithInteger:a4];
  v14[1] = v8;
  v13[2] = UIKeyboardAnimationDurationUserInfoKey;
  id v9 = +[NSNumber numberWithDouble:a5];
  v14[2] = v9;
  objc_super v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 postNotificationName:SUKeyboardWillChangeNotification object:0 userInfo:v10];
}

- (void)setReferrer:(id)a3
{
  id v4 = a3;
  id v5 = [(ServiceAccountPageViewController *)self clientInterface];
  [v5 setHostApplicationIdentifier:v4];
}

- (void)overrideIPadRedeemCamera:(id)a3 completion:(id)a4
{
  p_redeemCameraViewController = &self->_redeemCameraViewController;
  id v7 = a4;
  objc_storeWeak((id *)p_redeemCameraViewController, a3);
  id v8 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
  [v8 overrideRedeemCameraWithCompletion:v7];
}

- (void)clientInterface:(id)a3 overrideCreditCardPresentationFromViewController:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
  [v7 overrideCreditCardPresentationWithCompletion:v6];
}

- (void)clientInterface:(id)a3 overrideRedeemCameraPerformAction:(int64_t)a4 withObject:(id)a5
{
  id v8 = a5;
  if (a4 == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ServiceAccountPageViewController *)self setRedeemCameraScriptObject:v8];
    }

    id v8 = 0;
  }
  id v7 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
  [v7 overrideRedeemCameraPerformAction:a4 withObject:v8];
}

- (void)clientInterface:(id)a3 financeInterruptionResolved:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
  [v5 financeInterruptionResolved:v4];
}

- (void)clientInterfaceDidFinishLoading:(id)a3
{
  self->_finishedLoading = 1;
  BOOL v4 = [(ServiceAccountPageViewController *)self underlyingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 firstViewController];

    BOOL v4 = (void *)v5;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [v4 navigationItem];
  id v7 = [v6 leftBarButtonItems];

  id v8 = (char *)[v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    objc_super v10 = 0;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      CGRect v12 = 0;
      v13 = &v9[(void)v10];
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v19 + 1) + 8 * (void)v12) tag] == (id)999)
        {
          v14 = [v4 navigationItem];
          id v15 = [v14 leftBarButtonItems];
          id v16 = [v15 mutableCopy];

          [v16 removeObjectAtIndex:&v12[(void)v10]];
          v17 = [v4 navigationItem];
          [v17 setLeftBarButtonItems:v16 animated:1];

          goto LABEL_13;
        }
        ++v12;
      }
      while (v9 != v12);
      id v9 = (char *)[v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      objc_super v10 = v13;
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  v18 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
  [v18 didFinishLoading];
}

- (void)_cancelButtonAction:(id)a3
{
}

- (id)_preloadConfiguration
{
  id v2 = objc_alloc_init((Class)SSPromise);
  uint64_t v11 = 0;
  CGRect v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10001891C;
  id v15 = sub_10001892C;
  id v16 = objc_alloc_init((Class)SKUIConfigurationPreloader);
  id v3 = (void *)v12[5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100018934;
  v8[3] = &unk_10004D5F8;
  id v4 = v2;
  id v9 = v4;
  objc_super v10 = &v11;
  [v3 preloadConfigurationForPurpose:0 withCompletionBlock:v8];
  uint64_t v5 = v9;
  id v6 = v4;

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)_bagKeyForConfigURLString:(id)a3
{
  v7[0] = SKAccountPagePaymentsShippingURLString;
  v7[1] = SKAccountPageManageSubscriptionsURLString;
  v8[0] = @"paymentsAndShippingUrl";
  v8[1] = @"manageSubscriptionsUrl";
  v7[2] = SKAccountPageEditBillingURLString;
  v8[2] = @"editBillingUrl";
  id v3 = a3;
  id v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  uint64_t v5 = [v4 objectForKey:v3];

  return v5;
}

- (void)_loadURLWithActiveConfiguration:(id)a3
{
  id v76 = a3;
  v74 = [(ServiceAccountPageViewController *)self _hostApplicationBundleIdentifier];
  id v4 = +[SSLogConfig sharedConfig];
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    v5 |= 2u;
  }
  id v6 = [v4 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    int v7 = v5;
  }
  else {
    int v7 = v5 & 2;
  }
  if (v7)
  {
    *(_DWORD *)id location = 138543618;
    *(void *)&location[4] = objc_opt_class();
    __int16 v88 = 2112;
    v89 = v74;
    id v8 = *(id *)&location[4];
    LODWORD(v72) = 22;
    v71 = location;
    id v9 = (void *)_os_log_send_and_compose_impl();

    if (v9)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, location, v72);
      objc_super v10 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      free(v9);
      v71 = v10;
      SSFileLog();
    }
  }
  else
  {
  }
  uint64_t v11 = +[ServiceHostRegistry sharedInstance];
  [v11 setRegisteredHostBundleId:v74];

  CGRect v12 = [v76 path];
  v75 = [(ServiceAccountPageViewController *)self _bagKeyForConfigURLString:v12];

  if (v75)
  {
    uint64_t v13 = +[SSLogConfig sharedConfig];
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    id v16 = [v13 OSLogObject:v71];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      int v17 = v15;
    }
    else {
      int v17 = v15 & 2;
    }
    if (v17)
    {
      v18 = objc_opt_class();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v18;
      __int16 v88 = 2112;
      v89 = v75;
      id v19 = v18;
      LODWORD(v72) = 22;
      long long v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_21:

        long long v21 = (ServiceSKUIRedeemViewController *)objc_alloc_init((Class)SSURLBag);
        +[SSWeakReference weakReferenceWithObject:self];
        v83[0] = _NSConcreteStackBlock;
        v83[1] = 3221225472;
        v83[2] = sub_1000196A0;
        v83[3] = &unk_10004D648;
        id v84 = (id)objc_claimAutoreleasedReturnValue();
        long long v22 = (ServiceSKUIGiftViewController *)v84;
        [(ServiceSKUIRedeemViewController *)v21 loadValueForKey:v75 completionBlock:v83];

        goto LABEL_63;
      }
      id v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, location, v72);
      free(v20);
      SSFileLog();
    }

    goto LABEL_21;
  }
  v23 = [v76 pathComponents];
  v24 = [v23 firstObject];
  unsigned int v25 = [v24 isEqual:SKAccountPageRedeemURLString];

  if (v25)
  {
    long long v21 = [[ServiceSKUIRedeemViewController alloc] initWithRedeemCategory:0];
    v26 = +[ServiceClientContext defaultContext];
    [(ServiceSKUIRedeemViewController *)v21 setClientContext:v26];

    [(ServiceSKUIRedeemViewController *)v21 setClientInterface:self->_clientInterface];
    [(ServiceSKUIRedeemViewController *)v21 setEmbeddedParent:self];
    [(ServiceSKUIRedeemViewController *)v21 setCameraDelegate:self];
    v27 = [v76 pathComponents];
    BOOL v28 = (unint64_t)[v27 count] > 1;

    if (v28)
    {
      v73 = [v76 pathComponents];
      long long v22 = [v73 objectAtIndexedSubscript:1];
    }
    else
    {
      v73 = +[NSURLComponents componentsWithURL:v76 resolvingAgainstBaseURL:1];
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      v47 = [v73 queryItems];
      id v48 = [v47 countByEnumeratingWithState:&v79 objects:v86 count:16];
      if (v48)
      {
        uint64_t v49 = *(void *)v80;
        while (2)
        {
          for (i = 0; i != v48; i = (char *)i + 1)
          {
            if (*(void *)v80 != v49) {
              objc_enumerationMutation(v47);
            }
            v51 = *(void **)(*((void *)&v79 + 1) + 8 * i);
            v52 = [v51 name];
            unsigned int v53 = [v52 isEqualToString:@"code"];

            if (v53)
            {
              long long v22 = [v51 value];
              goto LABEL_41;
            }
          }
          id v48 = [v47 countByEnumeratingWithState:&v79 objects:v86 count:16];
          if (v48) {
            continue;
          }
          break;
        }
      }
      long long v22 = 0;
LABEL_41:
    }
    if (v22)
    {
      [(ServiceSKUIRedeemViewController *)v21 setInitialCode:v22];
      [(ServiceSKUIRedeemViewController *)v21 setAttempsAutomaticRedeem:1];
    }
    -[ServiceAccountPageViewController setUnderlyingViewController:](self, "setUnderlyingViewController:", v21, v71);
    [(ServiceAccountPageViewController *)self setChildViewController:v21];
  }
  else
  {
    v29 = [v76 pathComponents];
    v30 = [v29 firstObject];
    unsigned int v31 = [v30 isEqual:SKAccountPageGiftURLString];

    if (v31)
    {
      v32 = [v76 pathComponents];
      BOOL v33 = (unint64_t)[v32 count] > 1;

      if (v33)
      {
        v34 = [v76 pathComponents];
        long long v21 = [v34 objectAtIndexedSubscript:1];

        long long v22 = (ServiceSKUIGiftViewController *)objc_alloc_init((Class)SSLookupRequest);
        [(ServiceSKUIGiftViewController *)v22 setKeyProfile:SSLookupKeyProfileLockup];
        v85 = v21;
        v35 = +[NSArray arrayWithObjects:&v85 count:1];
        [(ServiceSKUIGiftViewController *)v22 setValue:v35 forRequestParameter:SSLookupParameterItemIdentifiers];

        [(ServiceSKUIGiftViewController *)v22 setValue:@"2" forRequestParameter:SSLookupParameterProtocolVersion];
        objc_initWeak((id *)location, self);
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v77[2] = sub_100019AB0;
        v77[3] = &unk_10004D670;
        objc_copyWeak(&v78, (id *)location);
        [(ServiceSKUIGiftViewController *)v22 startWithLookupBlock:v77];
        objc_destroyWeak(&v78);
        objc_destroyWeak((id *)location);
      }
      else
      {
        long long v21 = (ServiceSKUIRedeemViewController *)[objc_alloc((Class)SKUIGift) initWithGiftCategory:0];
        long long v22 = [[ServiceSKUIGiftViewController alloc] initWithGift:v21];
        v54 = +[ServiceClientContext defaultContext];
        [(ServiceSKUIGiftViewController *)v22 setClientContext:v54];

        [(ServiceSKUIGiftViewController *)v22 setEmbeddedParent:self];
        [(ServiceAccountPageViewController *)self setUnderlyingViewController:v22];
        [(ServiceAccountPageViewController *)self setChildViewController:v22];
      }
    }
    else
    {
      v36 = [v76 path];
      unsigned int v37 = [v36 isEqual:SKAccountPageCustomURLString];

      if (v37)
      {
        long long v21 = (ServiceSKUIRedeemViewController *)[v76 copyQueryStringDictionaryWithUnescapedValues:1];
        v38 = [(ServiceSKUIRedeemViewController *)v21 objectForKeyedSubscript:@"url"];
        long long v22 = +[NSURL URLWithString:v38];

        if (v22)
        {
          v39 = [(ServiceSKUIRedeemViewController *)v21 objectForKeyedSubscript:@"shouldSignRequests"];
          id v40 = [v39 BOOLValue];

          id v41 = objc_alloc_init((Class)SUWebViewController);
          v42 = [(ServiceAccountPageViewController *)self account];
          [v41 setAccount:v42];

          [v41 setStyle:0];
          [v41 setShouldSignRequests:v40];
          v43 = [v41 webView];
          v44 = [v43 scrollView];
          [v44 _setContentInsetAdjustmentBehavior:0];

          [v41 reloadWithStorePage:0 forURL:v22];
          v45 = [v41 webView];
          v46 = +[NSURLRequest requestWithURL:v22];
          [v45 loadRequest:v46];

          [(ServiceAccountPageViewController *)self _presentViewController:v41];
        }
        else
        {
          SSError();
          id v41 = (id)objc_claimAutoreleasedReturnValue();
          [(ServiceAccountPageViewController *)self dismissHostViewControllerWithResult:0 error:v41];
        }
      }
      else
      {
        v55 = [v76 path];
        unsigned int v56 = [v55 isEqual:SKAccountPageCharityURLString];

        if (v56)
        {
          long long v21 = (ServiceSKUIRedeemViewController *)[v76 copyQueryStringDictionaryWithUnescapedValues:1];
          long long v22 = [(ServiceSKUIRedeemViewController *)v21 objectForKeyedSubscript:@"id"];
          v57 = [[ServiceSKUIDonationViewController alloc] initWithCharityIdentifier:v22];
          v58 = +[ServiceClientContext defaultContext];
          [(ServiceSKUIDonationViewController *)v57 setClientContext:v58];

          [(ServiceSKUIDonationViewController *)v57 setEmbeddedParent:self];
          [(ServiceAccountPageViewController *)self setUnderlyingViewController:v57];
          [(ServiceAccountPageViewController *)self setChildViewController:v57];
        }
        else
        {
          if (v76)
          {
            long long v21 = [[ServiceSUAccountViewController alloc] initWithExternalAccountURL:v76];
          }
          else
          {
            long long v21 = objc_alloc_init(ServiceSUAccountViewController);
            v59 = +[SSAccountStore defaultStore];
            v60 = [v59 activeAccount];
            BOOL v61 = v60 == 0;

            if (v61) {
              [(ServiceSKUIRedeemViewController *)v21 setStyle:1];
            }
            else {
              [(ServiceSKUIRedeemViewController *)v21 setStyle:2];
            }
          }
          if (objc_opt_respondsToSelector()) {
            [(ServiceSKUIRedeemViewController *)v21 setShowAccountGlyph:[(ServiceAccountPageViewController *)self showAccountGlyph]];
          }
          v62 = [(ServiceAccountPageViewController *)self clientInterface];
          [v62 setShowDialogOnError:1];

          [(ServiceSKUIRedeemViewController *)v21 setClientInterface:self->_clientInterface];
          [(ServiceSKUIRedeemViewController *)v21 setEmbeddedParent:self];
          v63 = [(ServiceSKUIRedeemViewController *)v21 authenticationContext];
          long long v22 = (ServiceSKUIGiftViewController *)[v63 mutableCopy];

          if (!v22)
          {
            v64 = [(ServiceAccountPageViewController *)self account];
            v65 = [v64 ams_DSID];
            BOOL v66 = v65 == 0;

            id v67 = objc_alloc((Class)SSMutableAuthenticationContext);
            if (v66)
            {
              v68 = +[SSAccountStore defaultStore];
              v69 = [v68 activeAccount];
              v70 = (ServiceSKUIGiftViewController *)[v67 initWithAccount:v69];
            }
            else
            {
              v68 = [(ServiceAccountPageViewController *)self account];
              v69 = [v68 ams_DSID];
              v70 = (ServiceSKUIGiftViewController *)[v67 initWithAccountIdentifier:v69];
            }
            long long v22 = v70;
          }
          [(ServiceSKUIGiftViewController *)v22 setDisplaysOnLockScreen:1];
          [(ServiceSKUIRedeemViewController *)v21 setAuthenticationContext:v22];
          [(ServiceAccountPageViewController *)self setPresentedAccountViewController:v21];
          [(ServiceAccountPageViewController *)self _presentViewController:v21];
        }
      }
    }
  }
LABEL_63:
}

- (void)_presentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)SUNavigationContainerViewController) initWithChildViewController:v4];
  if ((id)[(ServiceAccountPageViewController *)self type] == (id)1)
  {
    [v5 setBridgedNavigation:1];
    id v6 = +[ServiceBridgedNavigationController sharedController];
    [v6 setupWithContainerViewController:v5];
  }
  int v7 = [(ServiceAccountPageViewController *)self navigationController];

  if (v7)
  {
    [(ServiceAccountPageViewController *)self setUnderlyingViewController:v4];
    [(ServiceAccountPageViewController *)self setChildViewController:v5];
  }
  else
  {
    id v8 = [[ServiceSUNavigationController alloc] initWithRootViewController:v5];
    [(ServiceSUNavigationController *)v8 setEmbeddedParent:self];
    [(ServiceAccountPageViewController *)self setUnderlyingViewController:v4];
    [(ServiceAccountPageViewController *)self setChildViewController:v8];
  }
  dispatch_time_t v9 = dispatch_time(0, 3000000000);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100019E6C;
  v11[3] = &unk_10004D2C0;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)_presentErrorViewControllerWithError:(id)a3
{
  id v4 = a3;
  self->_finishedLoading = 1;
  id v5 = [(ServiceAccountPageViewController *)self _clientViewControllerProxy];
  [v5 didFinishLoading];

  objc_initWeak(&location, self);
  id v6 = [ServiceErrorViewController alloc];
  int v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"CANNOT_CONNECT_TO_ITUNES_STORE" value:&stru_10004DF18 table:0];
  dispatch_time_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"BACK" value:&stru_10004DF18 table:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001A12C;
  void v13[3] = &unk_10004D460;
  objc_copyWeak(&v15, &location);
  id v11 = v4;
  id v14 = v11;
  id v12 = [(ServiceErrorViewController *)v6 initWithTitle:v8 message:0 buttonTitle:v10 actionBlock:v13];

  [(ServiceAccountPageViewController *)self setChildViewController:v12];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (void)setClientInterface:(id)a3
{
}

- (SUNavigationController)containerNavigationController
{
  return self->_containerNavigationController;
}

- (void)setContainerNavigationController:(id)a3
{
}

- (BOOL)finishedLoading
{
  return self->_finishedLoading;
}

- (void)setFinishedLoading:(BOOL)a3
{
  self->_finishedLoading = a3;
}

- (ServiceAccountPageEmbedded)underlyingViewController
{
  return self->_underlyingViewController;
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (SSPromise)configurationPromise
{
  return self->_configurationPromise;
}

- (void)setConfigurationPromise:(id)a3
{
}

- (SUAccountViewController)presentedAccountViewController
{
  return self->_presentedAccountViewController;
}

- (void)setPresentedAccountViewController:(id)a3
{
}

- (BOOL)showAccountGlyph
{
  return self->_showAccountGlyph;
}

- (void)setShowAccountGlyph:(BOOL)a3
{
  self->_showAccountGlyph = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (BOOL)loadFromBridgedNavigation
{
  return self->_loadFromBridgedNavigation;
}

- (void)setLoadFromBridgedNavigation:(BOOL)a3
{
  self->_loadFromBridgedNavigation = a3;
}

- (CGRect)presentationBounds
{
  double x = self->_presentationBounds.origin.x;
  double y = self->_presentationBounds.origin.y;
  double width = self->_presentationBounds.size.width;
  double height = self->_presentationBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentationBounds:(CGRect)a3
{
  self->_presentationBounds = a3;
}

- (SUScriptRedeemCameraViewController)redeemCameraScriptObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redeemCameraScriptObject);

  return (SUScriptRedeemCameraViewController *)WeakRetained;
}

- (void)setRedeemCameraScriptObject:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIViewController)presentingBridgedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingBridgedViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingBridgedViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingBridgedViewController);
  objc_destroyWeak((id *)&self->_redeemCameraScriptObject);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_presentedAccountViewController, 0);
  objc_storeStrong((id *)&self->_configurationPromise, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_underlyingViewController, 0);
  objc_storeStrong((id *)&self->_containerNavigationController, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);

  objc_destroyWeak((id *)&self->_redeemCameraViewController);
}

@end