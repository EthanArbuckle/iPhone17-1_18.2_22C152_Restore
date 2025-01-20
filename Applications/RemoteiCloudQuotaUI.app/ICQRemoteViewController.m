@interface ICQRemoteViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelFlow;
- (void)_dismissAndExit;
- (void)_dismissFlowWithSuccess:(BOOL)a3;
- (void)_main_dismissAndExit;
- (void)_presentFlowWithOffer:(id)a3 flowOptions:(id)a4 containerViewController:(id)a5;
- (void)_presentFreshmintWithOffer:(id)a3 link:(id)a4 flowOptions:(id)a5 preloadedRemoteUIData:(id)a6;
- (void)_presentOSLOWithOffer:(id)a3 link:(id)a4 presenter:(id)a5;
- (void)_presentPostPurchaseFlowWithOffer:(id)a3 link:(id)a4 flowOptions:(id)a5 preloadedRemoteUIData:(id)a6;
- (void)_setupRemoteProxy;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICQRemoteViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICQRemoteViewController;
  [(ICQRemoteViewController *)&v4 viewWillAppear:a3];
  [(ICQRemoteViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(ICQRemoteViewController *)self _setupRemoteProxy];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICQRemoteViewController;
  [(ICQRemoteViewController *)&v4 viewWillDisappear:a3];
  if (!self->_isDismissing) {
    [(ICQRemoteViewController *)self _dismissFlowWithSuccess:0];
  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_setupRemoteProxy
{
  [(SBUIRemoteAlertHostInterface *)self->_remoteVCProxy setShouldDisableFadeInAnimation:1];
  [(SBUIRemoteAlertHostInterface *)self->_remoteVCProxy setAllowsMenuButtonDismissal:1];
  [(SBUIRemoteAlertHostInterface *)self->_remoteVCProxy setAllowsAlertStacking:1];
  [(SBUIRemoteAlertHostInterface *)self->_remoteVCProxy setDesiredHardwareButtonEvents:16];
  [(SBUIRemoteAlertHostInterface *)self->_remoteVCProxy setSwipeDismissalStyle:0];
  remoteVCProxy = self->_remoteVCProxy;

  [(SBUIRemoteAlertHostInterface *)remoteVCProxy setDismissalAnimationStyle:1];
}

- (void)_presentPostPurchaseFlowWithOffer:(id)a3 link:(id)a4 flowOptions:(id)a5 preloadedRemoteUIData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_flowManager)
  {
    v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "flow manager already presented; ignoring",
        buf,
        2u);
    }
  }
  else
  {
    id v15 = [objc_alloc((Class)ICQRemoteContainerViewController) initWithRootViewController:self];
    [v15 setModalPresentationCapturesStatusBarAppearance:1];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000036CC;
    v16[3] = &unk_10000C2D8;
    v16[4] = self;
    id v17 = v10;
    id v18 = v12;
    id v19 = v11;
    id v20 = v15;
    id v21 = v13;
    v14 = v15;
    [(ICQRemoteViewController *)self presentViewController:v14 animated:1 completion:v16];
  }
}

- (void)_presentFreshmintWithOffer:(id)a3 link:(id)a4 flowOptions:(id)a5 preloadedRemoteUIData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_flowManager)
  {
    v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "flow manager already presented; ignoring",
        buf,
        2u);
    }
  }
  else
  {
    id v15 = [v10 bundleIdentifier];
    +[ICQMLBiomePublisher publishOfferDisplayActionEventWithBundleId:v15];

    id v16 = [objc_alloc((Class)ICQRemoteContainerViewController) initWithRootViewController:self];
    [v16 setModalPresentationCapturesStatusBarAppearance:1];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100003928;
    v17[3] = &unk_10000C2D8;
    id v18 = v10;
    id v19 = v11;
    id v20 = self;
    id v21 = v16;
    id v22 = v12;
    id v23 = v13;
    v14 = v16;
    [(ICQRemoteViewController *)self presentViewController:v14 animated:1 completion:v17];
  }
}

- (void)_presentFlowWithOffer:(id)a3 flowOptions:(id)a4 containerViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)AAUISpinnerViewController) initWithNibName:0 bundle:0];
  id v12 = [objc_alloc((Class)ICQRemoteUINavigationController) initWithRootViewController:v11];
  id v13 = [v12 navigationBar];
  [v13 setTranslucent:1];

  [v12 setModalInPresentation:1];
  v14 = +[UIDevice currentDevice];
  id v15 = [v14 userInterfaceIdiom];

  if (v15 == (id)1) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = -2;
  }
  [v12 setModalPresentationStyle:v16];
  id v17 = [v8 context];
  id v18 = [v8 universalLinkForContext:v17];

  if ([v18 action] == (id)118)
  {
    id v19 = _ICQGetLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "_presentFlowWithOffer detected action direct to oslo, skipping presentation", buf, 2u);
    }
  }
  else
  {
    [v10 presentViewController:v12 animated:1 completion:0];
  }
  id v20 = +[ICQOfferManager sharedOfferManager];
  uint64_t v21 = ICQBundleId;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100003D34;
  v26[3] = &unk_10000C390;
  id v27 = v8;
  v28 = self;
  id v29 = v10;
  id v30 = v12;
  id v31 = v9;
  id v22 = v9;
  id v23 = v12;
  id v24 = v10;
  id v25 = v8;
  [v20 getOfferForBundleIdentifier:v21 completion:v26];
}

- (void)_presentOSLOWithOffer:(id)a3 link:(id)a4 presenter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_flowManager)
  {
    id v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      id v15 = "-[ICQRemoteViewController _presentOSLOWithOffer:link:presenter:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ICQRemoteViewController UpgradeFlowManager has already been dismissed, %s will be ignored", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    id v12 = (ICQUpgradeFlowManager *)[objc_alloc((Class)ICQUpgradeFlowManager) initWithOffer:v8];
    flowManager = self->_flowManager;
    self->_flowManager = v12;

    [(ICQUpgradeFlowManager *)self->_flowManager setDelegate:self];
    [(ICQUpgradeFlowManager *)self->_flowManager setIcqLink:v9];
    [(ICQUpgradeFlowManager *)self->_flowManager beginOSLOFlowWithPresentingViewController:v10];
  }
}

- (void)_dismissFlowWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_opt_new();
  [v5 _setEndpoint:self->_xpcEndpoint];
  id v6 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v5];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v7 = (void *)qword_100012220;
  uint64_t v20 = qword_100012220;
  if (!qword_100012220)
  {
    location[0] = _NSConcreteStackBlock;
    location[1] = (id)3221225472;
    location[2] = sub_100005278;
    location[3] = &unk_10000C430;
    location[4] = &v17;
    sub_100005278((uint64_t)location);
    v7 = (void *)v18[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v17, 8);
  id v9 = [v8 XPCInterface];
  [v6 setRemoteObjectInterface:v9];

  [v6 resume];
  objc_initWeak(location, self);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10000475C;
  int v14 = &unk_10000C3B8;
  objc_copyWeak(&v15, location);
  id v10 = [v6 remoteObjectProxyWithErrorHandler:&v11];
  [v10 remoteFreshmintFlowCompletedWithSuccess:v3 error:0 v11, v12, v13, v14];
  [(ICQRemoteViewController *)self _dismissAndExit];

  objc_destroyWeak(&v15);
  objc_destroyWeak(location);
}

- (void)_dismissAndExit
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000489C;
  block[3] = &unk_10000C3E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_main_dismissAndExit
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000499C;
  v3[3] = &unk_10000C3E0;
  v3[4] = self;
  [(ICQRemoteViewController *)self dismissViewControllerAnimated:1 completion:v3];
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

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100004C08;
  v19[3] = &unk_10000C408;
  v19[4] = self;
  id v7 = a3;
  id v8 = [(ICQRemoteViewController *)self _remoteViewControllerProxyWithErrorHandler:v19];
  remoteVCProxy = self->_remoteVCProxy;
  self->_remoteVCProxy = v8;

  id v10 = [v7 xpcEndpoint];
  xpcEndpoint = self->_xpcEndpoint;
  self->_xpcEndpoint = v10;

  uint64_t v12 = +[ICQRemoteContext ICQContextFromRemoteAlertContext:v7];

  id v13 = [v12 flowOptionsData];
  int v14 = +[ICQUpgradeFlowOptions flowOptionsFromData:v13];

  unsigned int v15 = [v12 isPostPurchaseFlow];
  uint64_t v16 = [v12 offer];
  uint64_t v17 = [v12 link];
  id v18 = [v12 preloadedRemoteUIData];
  if (v15) {
    [(ICQRemoteViewController *)self _presentPostPurchaseFlowWithOffer:v16 link:v17 flowOptions:v14 preloadedRemoteUIData:v18];
  }
  else {
    [(ICQRemoteViewController *)self _presentFreshmintWithOffer:v16 link:v17 flowOptions:v14 preloadedRemoteUIData:v18];
  }

  if (v6) {
    v6[2](v6);
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
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) events] & 0x10) != 0) {
          [(ICQRemoteViewController *)self _cancelFlow];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_cancelFlow
{
  self->_isDismissing = 1;
  if (self->_flowManager) {
    [(ICQUpgradeFlowManager *)self->_flowManager _cancelFlow];
  }
  else {
    [(ICQRemoteViewController *)self _dismissFlowWithSuccess:0];
  }
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v4 = (ICQUpgradeFlowManager *)a3;
  flowManager = self->_flowManager;
  if (flowManager)
  {
    id v6 = _ICQGetLogSystem();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (flowManager == v4)
    {
      if (v7)
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICQRemoteViewController UpgradeFlowManager did cancel", (uint8_t *)&v12, 2u);
      }

      [(ICQUpgradeFlowManager *)self->_flowManager setDelegate:0];
      id v6 = self->_flowManager;
      self->_flowManager = 0;
    }
    else if (v7)
    {
      id v8 = self->_flowManager;
      int v12 = 138412546;
      id v13 = (const char *)v4;
      __int16 v14 = 2112;
      unsigned int v15 = v8;
      long long v9 = "ICQRemoteViewController UpgradeFlowManager did cancel for manager %@ instead of %@";
      long long v10 = v6;
      uint32_t v11 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    }
  }
  else
  {
    id v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = "-[ICQRemoteViewController upgradeFlowManagerDidCancel:]";
      long long v9 = "ICQRemoteViewController UpgradeFlowManager has already been dismissed, %s will be ignored";
      long long v10 = v6;
      uint32_t v11 = 12;
      goto LABEL_7;
    }
  }

  self->_isDismissing = 1;
  [(ICQRemoteViewController *)self _dismissFlowWithSuccess:0];
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v4 = (ICQUpgradeFlowManager *)a3;
  flowManager = self->_flowManager;
  if (flowManager)
  {
    id v6 = _ICQGetLogSystem();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (flowManager == v4)
    {
      if (v7)
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICQRemoteViewController local UpgradeFlowManager did complete!", (uint8_t *)&v19, 2u);
      }

      int v12 = [(ICQUpgradeFlowManager *)self->_flowManager offer];
      unsigned int v13 = [v12 isPremiumOffer];

      __int16 v14 = [(ICQUpgradeFlowManager *)self->_flowManager offer];
      unsigned __int8 v15 = [v14 isDefaultOffer];

      if ((v15 & 1) == 0)
      {
        uint64_t v16 = _ICQGetLogSystem();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v17)
          {
            LOWORD(v19) = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cleaning up pending premium followup item", (uint8_t *)&v19, 2u);
          }

          id v18 = +[ICQOfferManager sharedOfferManager];
          [v18 teardownCachedPremiumOffer];
        }
        else
        {
          if (v17)
          {
            LOWORD(v19) = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cleaning up pending regular followup item", (uint8_t *)&v19, 2u);
          }

          id v18 = +[ICQOfferManager sharedOfferManager];
          [v18 teardownCachedOffer];
        }
      }
      id v6 = self->_flowManager;
      self->_flowManager = 0;
    }
    else if (v7)
    {
      id v8 = self->_flowManager;
      int v19 = 138412546;
      uint64_t v20 = (const char *)v4;
      __int16 v21 = 2112;
      id v22 = v8;
      long long v9 = "ICQRemoteViewController local UpgradeFlowManager did complete for manager %@ instead of %@";
      long long v10 = v6;
      uint32_t v11 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v19, v11);
    }
  }
  else
  {
    id v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      uint64_t v20 = "-[ICQRemoteViewController upgradeFlowManagerDidComplete:]";
      long long v9 = "ICQRemoteViewController UpgradeFlowManager has already been dismissed, %s will be ignored";
      long long v10 = v6;
      uint32_t v11 = 12;
      goto LABEL_7;
    }
  }

  self->_isDismissing = 1;
  [(ICQRemoteViewController *)self _dismissFlowWithSuccess:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteVCProxy, 0);

  objc_storeStrong((id *)&self->_flowManager, 0);
}

@end