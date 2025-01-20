@interface ServiceOcelotUpsellViewController
- (NSNumber)itemID;
- (NSString)bundleID;
- (SKArcadeSubscribeViewController)childViewController;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismissViewService;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didFinishWithError:(id)a3;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setBundleID:(id)a3;
- (void)setChildViewController:(id)a3;
- (void)setItemID:(id)a3;
@end

@implementation ServiceOcelotUpsellViewController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v25 = (void (**)(void))a4;
  id v6 = a3;
  v7 = [(ServiceOcelotUpsellViewController *)self _remoteViewControllerProxy];
  [v7 setDesiredHardwareButtonEvents:16];
  [v7 setAllowsMenuButtonDismissal:1];
  [v7 setWallpaperTunnelActive:1];
  [v7 setAllowsAlertStacking:1];
  [v7 setDismissalAnimationStyle:2];
  [v7 setReachabilityDisabled:1];
  [v7 setSwipeDismissalStyle:1];
  v8 = +[UIDevice currentDevice];
  unint64_t v9 = (unint64_t)[v8 userInterfaceIdiom];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v10 = +[UIApplication sharedApplication];
    id v11 = [v10 statusBarOrientation];

    [v7 setLaunchingInterfaceOrientation:v11];
  }
  id v12 = objc_alloc((Class)SKArcadeSubscribeViewController);
  v13 = [v6 userInfo];
  v14 = [v13 objectForKeyedSubscript:@"itemID"];
  v15 = [v6 userInfo];

  v16 = [v15 objectForKeyedSubscript:@"bundleID"];
  id v17 = [v12 initWithItemID:v14 bundleID:v16];
  [(ServiceOcelotUpsellViewController *)self setChildViewController:v17];

  v18 = [(ServiceOcelotUpsellViewController *)self childViewController];
  [v18 setDelegate:self];

  v19 = [(ServiceOcelotUpsellViewController *)self childViewController];
  [(ServiceOcelotUpsellViewController *)self addChildViewController:v19];

  v20 = [(ServiceOcelotUpsellViewController *)self childViewController];
  v21 = [v20 view];

  v22 = [(ServiceOcelotUpsellViewController *)self view];
  [v22 bounds];
  [v21 setFrame:];

  [v21 setAutoresizingMask:18];
  v23 = [(ServiceOcelotUpsellViewController *)self view];
  [v23 addSubview:v21];

  v24 = [(ServiceOcelotUpsellViewController *)self childViewController];
  [v24 didMoveToParentViewController:self];

  if (v25) {
    v25[2]();
  }
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
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) events] & 0x10) != 0) {
          [(ServiceOcelotUpsellViewController *)self _dismissViewService];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)_dismissViewService
{
  id v5 = [(ServiceOcelotUpsellViewController *)self _remoteViewControllerProxy];
  [v5 dismiss];
  unint64_t v3 = [(ServiceOcelotUpsellViewController *)self childViewController];

  if (v3)
  {
    id v4 = [(ServiceOcelotUpsellViewController *)self childViewController];
    [v4 finishExtension];
  }
}

- (void)didFinishWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      v7 &= 2u;
    }
    if (v7)
    {
      *(_DWORD *)v13 = 138543618;
      *(void *)&v13[4] = objc_opt_class();
      *(_WORD *)&v13[12] = 2114;
      *(void *)&v13[14] = v4;
      id v9 = *(id *)&v13[4];
      LODWORD(v12) = 22;
      long long v11 = v13;
      long long v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_11:

        goto LABEL_12;
      }
      v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, v13, v12, *(_OWORD *)v13, *(void *)&v13[16]);
      free(v10);
      long long v11 = v8;
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  [(ServiceOcelotUpsellViewController *)self _dismissViewService];
}

- (SKArcadeSubscribeViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end