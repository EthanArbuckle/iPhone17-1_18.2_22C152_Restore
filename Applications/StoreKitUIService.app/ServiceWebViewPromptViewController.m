@interface ServiceWebViewPromptViewController
+ (id)_generateClientInterface;
- (BOOL)shouldAutorotate;
- (BOOL)shouldUseAMS;
- (BOOL)viewControllerShown;
- (NSURL)URL;
- (SUClientInterface)clientInterface;
- (ServiceWebViewPromptViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)underlyingViewController;
- (id)_bag;
- (id)_sanitizedURL;
- (id)_viewControllerForType:(int64_t)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_determineTypeForURL:(id)a3 completion:(id)a4;
- (void)_dismiss;
- (void)_presentViewController;
- (void)_willAppearInRemoteViewController;
- (void)attemptDismissHostViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handleButtonActions:(id)a3;
- (void)setClientInterface:(id)a3;
- (void)setShouldUseAMS:(BOOL)a3;
- (void)setURL:(id)a3;
- (void)setUnderlyingViewController:(id)a3;
- (void)setViewControllerShown:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ServiceWebViewPromptViewController

- (ServiceWebViewPromptViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ServiceWebViewPromptViewController;
  v4 = [(ServiceWebViewPromptViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = [(id)objc_opt_class() _generateClientInterface];
    clientInterface = v4->_clientInterface;
    v4->_clientInterface = (SUClientInterface *)v5;

    [(SUClientInterface *)v4->_clientInterface setDelegate:v4];
  }
  return v4;
}

- (void)dealloc
{
  [(SUClientInterface *)self->_clientInterface setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)ServiceWebViewPromptViewController;
  [(ServiceWebViewPromptViewController *)&v3 dealloc];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v17 = (void (**)(void))a4;
  v6 = [a3 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"URLString"];
  objc_super v8 = [v6 objectForKeyedSubscript:@"referrer"];
  if (v7)
  {
    v9 = +[NSURL URLWithString:v7];
    v10 = [v9 scheme];
    unsigned int v11 = [v10 isEqualToString:@"ams-ui"];

    if (v11) {
      [(ServiceWebViewPromptViewController *)self setShouldUseAMS:1];
    }
    if ([v8 isEqualToString:@"com.apple.appstored"]
      && ([v9 host],
          v12 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v13 = [v12 isEqualToString:@"localhost"],
          v12,
          (v13 & 1) != 0))
    {
      CFStringRef v14 = @"http";
    }
    else
    {
      CFStringRef v14 = @"https";
    }
    v15 = [v9 urlByReplacingSchemeWithScheme:v14];

    [(ServiceWebViewPromptViewController *)self setURL:v15];
  }
  if ([v8 length])
  {
    v16 = [(ServiceWebViewPromptViewController *)self clientInterface];
    [v16 setHostApplicationIdentifier:v8];
  }
  v17[2]();
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) events] & 0x10) != 0) {
          [(ServiceWebViewPromptViewController *)self _dismiss];
        }
        objc_super v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ServiceWebViewPromptViewController;
  [(ServiceWebViewPromptViewController *)&v5 viewDidLoad];
  objc_super v3 = [(ServiceWebViewPromptViewController *)self view];
  id v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)_willAppearInRemoteViewController
{
  v4.receiver = self;
  v4.super_class = (Class)ServiceWebViewPromptViewController;
  [(ServiceWebViewPromptViewController *)&v4 _willAppearInRemoteViewController];
  objc_super v3 = [(ServiceWebViewPromptViewController *)self _remoteViewControllerProxy];
  [v3 setDesiredHardwareButtonEvents:16];
  [v3 setAllowsAlertItems:1];
  [v3 setAllowsAlertStacking:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ServiceWebViewPromptViewController;
  [(ServiceWebViewPromptViewController *)&v8 viewDidAppear:a3];
  objc_super v4 = [(ServiceWebViewPromptViewController *)self view];
  objc_super v5 = [v4 window];

  id v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];

  if (![(ServiceWebViewPromptViewController *)self viewControllerShown])
  {
    uint64_t v7 = +[ServiceHostRegistry sharedInstance];
    [v7 setRegisteredHostBundleId:0];

    [(ServiceWebViewPromptViewController *)self _presentViewController];
    [(ServiceWebViewPromptViewController *)self setViewControllerShown:1];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)shouldAutorotate
{
  v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (void)attemptDismissHostViewController
{
  unint64_t v3 = [(ServiceWebViewPromptViewController *)self presentedViewController];

  if (!v3)
  {
    [(ServiceWebViewPromptViewController *)self _dismiss];
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return 2;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)UIPresentationController) initWithPresentedViewController:v8 presentingViewController:v7];

  [v9 setDelegate:self];

  return v9;
}

- (id)_bag
{
  v2 = [sub_10001AC88() bagSubProfile];
  unint64_t v3 = [sub_10001AC88() bagSubProfileVersion];
  objc_super v4 = [sub_10001AC88() bagKeySet];
  +[AMSBagKeySet registerBagKeySet:v4 forProfile:v2 profileVersion:v3];

  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2050000000;
  objc_super v5 = (void *)qword_100067368;
  uint64_t v13 = qword_100067368;
  if (!qword_100067368)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001BA88;
    v9[3] = &unk_10004D570;
    v9[4] = &v10;
    sub_10001BA88((uint64_t)v9);
    objc_super v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  id v7 = [v6 bagForProfile:v2 profileVersion:v3];

  return v7;
}

- (void)_determineTypeForURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ServiceWebViewPromptViewController *)self shouldUseAMS])
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    id v8 = (void *)qword_100067378;
    uint64_t v24 = qword_100067378;
    if (!qword_100067378)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10001BC50;
      v20[3] = &unk_10004D570;
      v20[4] = &v21;
      sub_10001BC50((uint64_t)v20);
      id v8 = (void *)v22[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v21, 8);
    id v10 = [v9 alloc];
    long long v11 = [(ServiceWebViewPromptViewController *)self _bag];
    id v12 = [v10 initWithBag:v11];

    uint64_t v13 = [(ServiceWebViewPromptViewController *)self _sanitizedURL];
    CFStringRef v14 = [v12 typeForURL:v13];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001AFB8;
    v16[3] = &unk_10004D6C0;
    id v17 = v7;
    id v15 = v7;
    [v14 addFinishBlock:v16];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001AFA4;
    block[3] = &unk_10004CDF0;
    id v19 = v7;
    id v12 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    CFStringRef v14 = v19;
  }
}

- (void)_dismiss
{
  unint64_t v3 = [(ServiceWebViewPromptViewController *)self _remoteViewControllerProxy];
  objc_super v4 = [(ServiceWebViewPromptViewController *)self presentedViewController];

  if (v4)
  {
    objc_super v5 = [(ServiceWebViewPromptViewController *)self presentedViewController];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001B154;
    v6[3] = &unk_10004CEB0;
    id v7 = v3;
    [v5 dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    [v3 dismiss];
  }
}

+ (id)_generateClientInterface
{
  id v2 = objc_alloc_init((Class)SUClientInterface);
  unint64_t v3 = +[NSBundle mainBundle];
  objc_super v4 = [v3 bundleIdentifier];
  [v2 setClientIdentifier:v4];

  objc_super v5 = +[SUWebViewManager defaultLocalStoragePath];
  [v2 setLocalStoragePath:v5];

  id v6 = objc_alloc_init((Class)SKUIViewControllerFactory);
  [v2 setViewControllerFactory:v6];

  return v2;
}

- (void)_presentViewController
{
  unint64_t v3 = [(ServiceWebViewPromptViewController *)self _sanitizedURL];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B2AC;
  v4[3] = &unk_10004D6E8;
  v4[4] = self;
  [(ServiceWebViewPromptViewController *)self _determineTypeForURL:v3 completion:v4];
}

- (id)_sanitizedURL
{
  unint64_t v3 = [(ServiceWebViewPromptViewController *)self URL];
  objc_super v4 = [v3 absoluteString];

  id v5 = objc_alloc((Class)NSURLComponents);
  id v6 = [(ServiceWebViewPromptViewController *)self URL];
  id v7 = [v5 initWithURL:v6 resolvingAgainstBaseURL:0];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [v7 queryItems];
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        CFStringRef v14 = [v13 name];
        unsigned int v15 = [v14 isEqualToString:@"url"];

        if (v15)
        {
          uint64_t v16 = [v13 value];

          objc_super v4 = (void *)v16;
          goto LABEL_11;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v17 = +[NSURL URLWithString:v4];

  return v17;
}

- (id)_viewControllerForType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      CFStringRef v14 = +[SSAccountStore defaultStore];
      id v9 = [v14 activeAccount];

      unsigned int v15 = [(ServiceWebViewPromptViewController *)self URL];

      if (v15)
      {
        uint64_t v16 = [ServiceSUAccountViewController alloc];
        id v17 = [(ServiceWebViewPromptViewController *)self URL];
        id v8 = [(ServiceSUAccountViewController *)v16 initWithExternalAccountURL:v17];
      }
      else
      {
        v18 = objc_alloc_init(ServiceSUAccountViewController);
        id v8 = v18;
        if (v9) {
          uint64_t v19 = 2;
        }
        else {
          uint64_t v19 = 1;
        }
        [(ServiceSUAccountViewController *)v18 setStyle:v19];
      }
      long long v20 = [(ServiceWebViewPromptViewController *)self clientInterface];
      [(ServiceSUAccountViewController *)v8 setClientInterface:v20];

      [(ServiceSUAccountViewController *)v8 setEmbeddedParent:self];
      long long v21 = [(ServiceSUAccountViewController *)v8 authenticationContext];
      id v22 = [v21 mutableCopy];

      if (!v22) {
        id v22 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:v9];
      }
      [v22 setDisplaysOnLockScreen:1];
      [(ServiceSUAccountViewController *)v8 setAuthenticationContext:v22];
      id v7 = (ServiceAMSUIWebViewController *)[objc_alloc((Class)SUNavigationContainerViewController) initWithChildViewController:v8];
    }
    else
    {
      if (a3 != 2)
      {
        id v7 = 0;
        goto LABEL_17;
      }
      id v4 = objc_alloc((Class)AMSUIDynamicViewController);
      id v5 = [(ServiceWebViewPromptViewController *)self _bag];
      id v6 = [(ServiceWebViewPromptViewController *)self _sanitizedURL];
      id v7 = (ServiceAMSUIWebViewController *)[v4 initWithBag:v5 URL:v6];

      id v8 = +[ACAccountStore ams_sharedAccountStore];
      id v9 = [(ServiceSUAccountViewController *)v8 ams_activeiTunesAccount];
      [(ServiceAMSUIWebViewController *)v7 setAccount:v9];
    }
  }
  else
  {
    id v10 = +[ACAccountStore ams_sharedAccountStore];
    [v10 ams_activeiTunesAccount];
    id v8 = (ServiceSUAccountViewController *)objc_claimAutoreleasedReturnValue();

    uint64_t v11 = [ServiceAMSUIWebViewController alloc];
    id v12 = [(ServiceWebViewPromptViewController *)self _bag];
    id v7 = [(ServiceAMSUIWebViewController *)v11 initWithBag:v12 account:v8 clientInfo:0];

    [(ServiceAMSUIWebViewController *)v7 setEmbeddedParent:self];
    id v9 = [(ServiceWebViewPromptViewController *)self URL];
    id v13 = [(ServiceAMSUIWebViewController *)v7 loadURL:v9];
  }

LABEL_17:

  return v7;
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (void)setClientInterface:(id)a3
{
}

- (BOOL)shouldUseAMS
{
  return self->_shouldUseAMS;
}

- (void)setShouldUseAMS:(BOOL)a3
{
  self->_shouldUseAMS = a3;
}

- (UIViewController)underlyingViewController
{
  return self->_underlyingViewController;
}

- (void)setUnderlyingViewController:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (BOOL)viewControllerShown
{
  return self->_viewControllerShown;
}

- (void)setViewControllerShown:(BOOL)a3
{
  self->_viewControllerShown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_underlyingViewController, 0);

  objc_storeStrong((id *)&self->_clientInterface, 0);
}

@end