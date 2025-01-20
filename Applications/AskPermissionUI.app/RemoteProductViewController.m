@interface RemoteProductViewController
+ (id)metricsEventForAccount:(id)a3 request:(id)a4 action:(unint64_t)a5;
- (ACAccount)account;
- (AMSBag)bag;
- (ApprovalRequest)request;
- (UIViewController)childViewController;
- (id)_viewControllerProxy;
- (void)_presentErrorAlert;
- (void)_presentStoreProductViewController;
- (void)_presentWebProductViewController;
- (void)_updateRequestWithAction:(int64_t)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)productViewControllerDidFinishWithAction:(unint64_t)a3;
- (void)setAccount:(id)a3;
- (void)setBag:(id)a3;
- (void)setChildViewController:(id)a3;
- (void)setRequest:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RemoteProductViewController

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RemoteProductViewController;
  [(RemoteProductViewController *)&v8 viewWillAppear:a3];
  v4 = +[ACAccountStore ams_sharedAccountStore];
  v5 = [v4 ams_activeiTunesAccountForMediaType:AMSAccountMediaTypeProduction];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000050C8;
  v7[3] = &unk_100018440;
  v7[4] = self;
  [v5 addSuccessBlock:v7];

  v6 = +[AMSBag bagForProfile:@"AskPermission" profileVersion:@"1"];
  [(RemoteProductViewController *)self setBag:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RemoteProductViewController;
  [(RemoteProductViewController *)&v12 viewDidAppear:a3];
  v4 = [(RemoteProductViewController *)self request];
  v5 = [v4 previewURL];

  if (v5)
  {
    [(RemoteProductViewController *)self _presentWebProductViewController];
  }
  else
  {
    v6 = [(RemoteProductViewController *)self request];
    v7 = [v6 itemIdentifier];

    if (v7)
    {
      [(RemoteProductViewController *)self _presentStoreProductViewController];
    }
    else
    {
      objc_super v8 = +[APLogConfig sharedUIServiceConfig];
      if (!v8)
      {
        objc_super v8 = +[APLogConfig sharedConfig];
      }
      v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v14 = v10;
        id v11 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@: Unsupported request", buf, 0xCu);
      }
      [(RemoteProductViewController *)self _presentErrorAlert];
    }
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  v7 = [(RemoteProductViewController *)self childViewController];

  if (v7)
  {
    objc_super v8 = [(RemoteProductViewController *)self childViewController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100005354;
    v10[3] = &unk_100018468;
    v10[4] = self;
    id v11 = v6;
    [v8 dismissViewControllerAnimated:v4 completion:v10];
  }
  else
  {
    v9 = [(RemoteProductViewController *)self _viewControllerProxy];
    [v9 dismiss];

    if (v6) {
      v6[2](v6);
    }
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  v7 = [a3 userInfo];
  objc_super v8 = [[ApprovalRequest alloc] initWithDictionary:v7];
  [(RemoteProductViewController *)self setRequest:v8];

  v9 = [(RemoteProductViewController *)self _viewControllerProxy];
  [v9 setDesiredHardwareButtonEvents:16];

  v10 = +[APLogConfig sharedUIServiceConfig];
  if (!v10)
  {
    v10 = +[APLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = objc_opt_class();
    id v13 = v12;
    v14 = [(RemoteProductViewController *)self request];
    int v15 = 138543618;
    v16 = v12;
    __int16 v17 = 2114;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Configured with context. Request payload: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  v6[2](v6);
}

- (void)handleButtonActions:(id)a3
{
}

+ (id)metricsEventForAccount:(id)a3 request:(id)a4 action:(unint64_t)a5
{
  v6 = +[APMetricsEvent metricsEventWithAccount:a3 request:a4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000560C;
  v9[3] = &unk_100018488;
  v9[4] = a5;
  v7 = [v6 thenWithBlock:v9];

  return v7;
}

- (void)_presentStoreProductViewController
{
  v3 = +[APLogConfig sharedUIServiceConfig];
  if (!v3)
  {
    v3 = +[APLogConfig sharedConfig];
  }
  BOOL v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v5 = *(id *)((char *)&buf + 4);
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Presenting store product view controller", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  v6 = (void *)qword_10001FC00;
  uint64_t v41 = qword_10001FC00;
  if (!qword_10001FC00)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v45 = sub_100006E1C;
    v46 = &unk_1000185A0;
    v47 = &v38;
    sub_100006E1C((uint64_t)&buf);
    v6 = (void *)v39[3];
  }
  v7 = v6;
  _Block_object_dispose(&v38, 8);
  id v8 = objc_alloc_init(v7);
  [v8 setDelegate:self];
  [v8 setAskToBuy:1];
  v9 = [(RemoteProductViewController *)self request];
  BOOL v10 = [v9 status] == (id)-1;

  if (v10)
  {
    id v11 = [(RemoteProductViewController *)self request];
    objc_super v12 = [v11 localizations];
    id v13 = [v12 decline];
    [v8 setCancelButtonTitle:v13];

    v14 = [(RemoteProductViewController *)self request];
    int v15 = [v14 localizations];
    v16 = [v15 approve];
    [v8 setRightBarButtonTitle:v16];

    [v8 setShowsRightBarButton:1];
    __int16 v17 = [(RemoteProductViewController *)self request];
    v18 = [v17 localizations];
    v19 = [v18 body];
    [v8 setPromptString:v19];
  }
  else
  {
    [v8 setShowsRightBarButton:0];
  }
  v20 = +[UIDevice currentDevice];
  BOOL v21 = [v20 userInterfaceIdiom] == (id)1;

  if (v21) {
    [v8 setModalPresentationStyle:0];
  }
  v22 = [v8 presentationController];
  [v22 setDelegate:self];

  v23 = [(RemoteProductViewController *)self request];
  v24 = [v23 itemIdentifier];
  v25 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v24 longLongValue]);

  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  v26 = (id *)qword_10001FC10;
  uint64_t v41 = qword_10001FC10;
  if (!qword_10001FC10)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v45 = sub_100006FE8;
    v46 = &unk_1000185A0;
    v47 = &v38;
    v27 = (void *)sub_100006E74();
    v28 = dlsym(v27, "SKStoreProductParameterITunesItemIdentifier");
    *(void *)(v47[1] + 24) = v28;
    qword_10001FC10 = *(void *)(v47[1] + 24);
    v26 = (id *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (!v26) {
    sub_10000FAD4();
  }
  v42[0] = *v26;
  v42[1] = @"askToBuyItem";
  v43[0] = v25;
  id v29 = v42[0];
  v30 = [(RemoteProductViewController *)self request];
  v31 = [v30 compile];
  v43[1] = v31;
  v32 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];

  objc_initWeak((id *)&buf, self);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100005C78;
  v36[3] = &unk_1000184D8;
  objc_copyWeak(&v37, (id *)&buf);
  [v8 loadProductWithParameters:v32 completionBlock:v36];
  v33 = [(RemoteProductViewController *)self view];
  v34 = [v33 window];
  v35 = [v34 _rootSheetPresentationController];
  [v35 _setShouldScaleDownBehindDescendantSheets:0];

  [(RemoteProductViewController *)self presentViewController:v8 animated:1 completion:0];
  [(RemoteProductViewController *)self setChildViewController:v8];
  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)&buf);
}

- (void)_presentWebProductViewController
{
  v3 = +[APLogConfig sharedUIServiceConfig];
  if (!v3)
  {
    v3 = +[APLogConfig sharedConfig];
  }
  BOOL v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = (id)objc_opt_class();
    id v5 = v18;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Presenting web product view controller", (uint8_t *)&v17, 0xCu);
  }
  v6 = [WebProductViewController alloc];
  v7 = [(RemoteProductViewController *)self request];
  id v8 = [(WebProductViewController *)v6 initWithRequest:v7];

  [(WebProductViewController *)v8 setActionDelegate:self];
  id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
  BOOL v10 = +[UIColor systemBackgroundColor];
  id v11 = [v9 navigationBar];
  [v11 setBackgroundColor:v10];

  objc_super v12 = [v9 navigationBar];
  [v12 setTranslucent:0];

  id v13 = [v9 presentationController];
  [v13 setDelegate:self];

  v14 = [(RemoteProductViewController *)self view];
  int v15 = [v14 window];
  v16 = [v15 _rootSheetPresentationController];
  [v16 _setShouldScaleDownBehindDescendantSheets:0];

  [(RemoteProductViewController *)self presentViewController:v9 animated:1 completion:0];
  [(RemoteProductViewController *)self setChildViewController:v8];
}

- (id)_viewControllerProxy
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006180;
  v5[3] = &unk_100018500;
  objc_copyWeak(&v6, &location);
  v3 = [(RemoteProductViewController *)self _remoteViewControllerProxyWithErrorHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (void)_presentErrorAlert
{
  v3 = +[Localizations stringWithKey:@"DEFAULT_ERROR_ACTION"];
  BOOL v4 = +[Localizations stringWithKey:@"DEFAULT_ERROR_MESSAGE"];
  id v5 = +[Localizations stringWithKey:@"DEFAULT_ERROR_TITLE"];
  id v6 = +[UIAlertController alertControllerWithTitle:v5 message:v4 preferredStyle:1];
  objc_initWeak(&location, self);
  BOOL v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  objc_super v12 = sub_100006474;
  id v13 = &unk_100018528;
  objc_copyWeak(&v14, &location);
  v7 = +[UIAlertAction actionWithTitle:v3 style:0 handler:&v10];
  [v6 addAction:v7, v10, v11, v12, v13];

  id v8 = [(RemoteProductViewController *)self childViewController];

  if (v8)
  {
    id v9 = [(RemoteProductViewController *)self childViewController];
    [v9 presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    [(RemoteProductViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_updateRequestWithAction:(int64_t)a3
{
  id v5 = [(RemoteProductViewController *)self request];
  unsigned int v6 = [v5 isMocked];

  if (v6)
  {
    v7 = +[APLogConfig sharedUIServiceConfig];
    if (!v7)
    {
      v7 = +[APLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v9 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot update mocked request", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    BOOL v10 = [(RemoteProductViewController *)self request];
    uint64_t v11 = [v10 requestIdentifier];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000066B4;
    v12[3] = &unk_100018500;
    objc_copyWeak(&v13, (id *)buf);
    +[APRequestHandler updateRequestWithIdentifier:v11 action:a3 completion:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)productViewControllerDidFinishWithAction:(unint64_t)a3
{
  id v5 = +[APLogConfig sharedUIServiceConfig];
  if (!v5)
  {
    id v5 = +[APLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v20 = (id)objc_opt_class();
    __int16 v21 = 2050;
    unint64_t v22 = a3;
    id v7 = v20;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Product view controller finished. Action: %{public}ld", buf, 0x16u);
  }
  id v8 = [(RemoteProductViewController *)self request];
  BOOL v9 = [v8 status] == (id)-1;

  if (!v9) {
    a3 = 2;
  }
  BOOL v10 = objc_opt_class();
  uint64_t v11 = [(RemoteProductViewController *)self account];
  objc_super v12 = [(RemoteProductViewController *)self request];
  id v13 = [v10 metricsEventForAccount:v11 request:v12 action:a3];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006BC0;
  v18[3] = &unk_100018550;
  v18[4] = self;
  [v13 resultWithCompletion:v18];

  switch(a3)
  {
    case 0uLL:
      objc_initWeak((id *)buf, self);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100006C50;
      v16[3] = &unk_100018578;
      objc_copyWeak(&v17, (id *)buf);
      [(RemoteProductViewController *)self dismissViewControllerAnimated:1 completion:v16];
      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
      break;
    case 1uLL:
      objc_initWeak((id *)buf, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100006C94;
      v14[3] = &unk_100018578;
      objc_copyWeak(&v15, (id *)buf);
      [(RemoteProductViewController *)self dismissViewControllerAnimated:1 completion:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
      break;
    case 2uLL:
      [(RemoteProductViewController *)self dismissViewControllerAnimated:1 completion:0];
      break;
    case 3uLL:
      [(RemoteProductViewController *)self _presentErrorAlert];
      break;
    default:
      return;
  }
}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  if (a4) {
    uint64_t v4 = 2 * (a4 != 5);
  }
  else {
    uint64_t v4 = 1;
  }
  [(RemoteProductViewController *)self productViewControllerDidFinishWithAction:v4];
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (UIViewController)childViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_childViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setChildViewController:(id)a3
{
}

- (ApprovalRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_childViewController);
  objc_storeStrong((id *)&self->_bag, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end