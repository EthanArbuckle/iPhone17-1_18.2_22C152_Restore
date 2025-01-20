@interface ServiceTermsPageViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_checkEntitlementsWithError:(id *)a3;
- (id)_remoteViewControllerProxy;
- (void)_dismiss;
- (void)_dismissClientViewController;
- (void)_dismissWithAcceptance:(BOOL)a3;
- (void)_showViewControllerForAlertProxy:(id)a3;
- (void)_willAppearInRemoteViewController:(id)a3;
- (void)alertProxyDidCancel:(id)a3;
- (void)dealloc;
- (void)termsPageViewControllerDidFinish:(id)a3 withAcceptance:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ServiceTermsPageViewController

- (void)dealloc
{
  [(ServiceAlertProxy *)self->_remoteAlertProxy setDelegate:0];
  [(SKTermsPageViewController *)self->_underlyingViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)ServiceTermsPageViewController;
  [(ServiceTermsPageViewController *)&v3 dealloc];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  v5 = +[ServiceAlertQueue defaultQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012818;
  v11[3] = &unk_10004D488;
  objc_copyWeak(&v12, &location);
  [v5 getNextAlertForClassName:@"ServiceTermsPageViewController" completionBlock:v11];

  v6 = [(ServiceTermsPageViewController *)self _remoteViewControllerProxy];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 setIdleTimerDisabled:1 forReason:v8];

  v9 = [(ServiceTermsPageViewController *)self _remoteViewControllerProxy];
  [v9 setDesiredHardwareButtonEvents:16];

  v10.receiver = self;
  v10.super_class = (Class)ServiceTermsPageViewController;
  [(ServiceTermsPageViewController *)&v10 viewDidAppear:v3];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)viewDidLoad
{
  BOOL v3 = [(ServiceTermsPageViewController *)self view];
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  v5.receiver = self;
  v5.super_class = (Class)ServiceTermsPageViewController;
  [(ServiceTermsPageViewController *)&v5 viewDidLoad];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[SSLogConfig sharedConfig];
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  v8 = [v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    int v9 = v7;
  }
  else {
    int v9 = v7 & 2;
  }
  if (!v9) {
    goto LABEL_10;
  }
  int v12 = 138412290;
  id v13 = v4;
  LODWORD(v11) = 12;
  objc_super v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v12, v11);
    free(v10);
    SSFileLog();
LABEL_10:
  }
  [(ServiceTermsPageViewController *)self _dismissClientViewController];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  remoteAlertProxy = self->_remoteAlertProxy;
  if (remoteAlertProxy)
  {
    [(ServiceAlertProxy *)remoteAlertProxy setDelegate:0];
    [(ServiceAlertProxy *)self->_remoteAlertProxy invalidate];
    unsigned int v6 = self->_remoteAlertProxy;
    self->_remoteAlertProxy = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)ServiceTermsPageViewController;
  [(ServiceTermsPageViewController *)&v7 viewWillDisappear:v3];
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v4 = a3;
  [v4 setAllowsAlertStacking:1];
  [v4 setAllowsMenuButtonDismissal:1];
  [v4 setShouldDismissOnUILock:1];
  v5.receiver = self;
  v5.super_class = (Class)ServiceTermsPageViewController;
  [(ServiceTermsPageViewController *)&v5 _willAppearInRemoteViewController:v4];
}

- (void)alertProxyDidCancel:(id)a3
{
  id v4 = +[SSLogConfig sharedConfig];
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  objc_super v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_9;
  }
  LODWORD(v11) = 138412290;
  *(void *)((char *)&v11 + 4) = objc_opt_class();
  id v8 = *(id *)((char *)&v11 + 4);
  LODWORD(v10) = 12;
  int v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_super v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v11, v10, v11);
    free(v9);
    SSFileLog();
LABEL_9:
  }
  [(ServiceTermsPageViewController *)self _dismissClientViewController];
}

- (void)termsPageViewControllerDidFinish:(id)a3 withAcceptance:(BOOL)a4
{
}

- (BOOL)_checkEntitlementsWithError:(id *)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  [(ServiceTermsPageViewController *)self _hostAuditToken];
  long long v7 = v9;
  long long v8 = v10;
  if (sub_100010BA0(&v7, @"com.apple.ios.StoreKit.terms-page")
    || (long long v7 = v9, v8 = v10, sub_100010BA0(&v7, kSSITunesStorePrivateEntitlement)))
  {
    id v4 = 0;
    BOOL v5 = 1;
  }
  else
  {
    SSError();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      id v4 = v4;
      BOOL v5 = 0;
      *a3 = v4;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (void)_dismiss
{
  [(ServiceAlertProxy *)self->_remoteAlertProxy setDelegate:0];
  remoteAlertProxy = self->_remoteAlertProxy;
  self->_remoteAlertProxy = 0;

  id v6 = [(ServiceTermsPageViewController *)self _remoteViewControllerProxy];
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  [v6 setIdleTimerDisabled:0 forReason:v5];

  [v6 dismiss];
}

- (void)_dismissClientViewController
{
  if (self->_underlyingViewController)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012F5C;
    block[3] = &unk_10004CEB0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_dismissWithAcceptance:(BOOL)a3
{
  id v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v5, "1", a3);
  [(ServiceAlertProxy *)self->_remoteAlertProxy finishWithResponse:v5];
  [(ServiceTermsPageViewController *)self _dismiss];
}

- (id)_remoteViewControllerProxy
{
  v4.receiver = self;
  v4.super_class = (Class)ServiceTermsPageViewController;
  v2 = [(ServiceTermsPageViewController *)&v4 _remoteViewControllerProxy];

  return v2;
}

- (void)_showViewControllerForAlertProxy:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_remoteAlertProxy, a3);
  [(ServiceAlertProxy *)self->_remoteAlertProxy setDelegate:self];
  id v6 = [v5 options];
  long long v7 = (void *)SSXPCCreateCFObjectFromXPCObject();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = 0;
    unsigned __int8 v8 = [(ServiceTermsPageViewController *)self _checkEntitlementsWithError:&v30];
    id v9 = v30;
    if (v8)
    {
      underlyingViewController = self->_underlyingViewController;
      if (underlyingViewController) {
        goto LABEL_5;
      }
      id v11 = objc_alloc((Class)SKTermsPageViewController);
      int v12 = [v7 objectForKey:@"terms"];
      id v13 = (SKTermsPageViewController *)[v11 initWithTerms:v12];
      v14 = self->_underlyingViewController;
      self->_underlyingViewController = v13;

      [(SKTermsPageViewController *)self->_underlyingViewController setDelegate:self];
      underlyingViewController = self->_underlyingViewController;
      if (underlyingViewController)
      {
LABEL_5:
        [(ServiceTermsPageViewController *)self presentViewController:underlyingViewController animated:1 completion:0];
LABEL_27:

        goto LABEL_28;
      }
LABEL_26:
      [(ServiceTermsPageViewController *)self _dismiss];
      goto LABEL_27;
    }
    v21 = +[SSLogConfig sharedConfig];
    unsigned int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    v24 = [v21 OSLogObject];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      v23 &= 2u;
    }
    if (v23)
    {
      v25 = objc_opt_class();
      int v31 = 138412290;
      id v32 = v25;
      id v26 = v25;
      LODWORD(v29) = 12;
      v28 = &v31;
      v27 = (void *)_os_log_send_and_compose_impl();

      if (!v27)
      {
LABEL_25:

        goto LABEL_26;
      }
      v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v31, v29);
      free(v27);
      v28 = (int *)v24;
      SSFileLog();
    }

    goto LABEL_25;
  }
  v15 = +[SSLogConfig sharedConfig];
  unsigned int v16 = [v15 shouldLog];
  if ([v15 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  v18 = [v15 OSLogObject];
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    v17 &= 2u;
  }
  if (!v17) {
    goto LABEL_14;
  }
  int v31 = 138412290;
  id v32 = (id)objc_opt_class();
  id v19 = v32;
  LODWORD(v29) = 12;
  v20 = (void *)_os_log_send_and_compose_impl();

  if (v20)
  {
    v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v31, v29);
    free(v20);
    SSFileLog();
LABEL_14:
  }
  [(ServiceTermsPageViewController *)self _dismiss];
LABEL_28:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingViewController, 0);

  objc_storeStrong((id *)&self->_remoteAlertProxy, 0);
}

@end