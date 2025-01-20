@interface ICQUIRootViewController
- (ICQRemoteContext)remoteContext;
- (NSString)sceneIdentifier;
- (void)_dismissAndExit;
- (void)_dismissFlowWithSuccess:(BOOL)a3;
- (void)_fetchDefaultOfferAndLaunchUpgradeFlow;
- (void)_handleFallback;
- (void)_launchUpgradeFlowWithOffer:(id)a3 icqLink:(id)a4;
- (void)_notifyFlowCompletionToDaemonWithSuccess:(BOOL)a3;
- (void)dismissUpgradeFlow;
- (void)loadView;
- (void)setRemoteContext:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)upgradeFlowManager:(id)a3 didPresentViewController:(id)a4;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICQUIRootViewController

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  [(ICQUIRootViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)ICQUIRootViewController;
  [(ICQUIRootViewController *)&v19 viewDidLoad];
  id v3 = +[UIColor systemBackgroundColor];
  v4 = [(ICQUIRootViewController *)self view];
  [v4 setBackgroundColor:v3];

  remoteContext = self->_remoteContext;
  v6 = _ICQGetLogSystem();
  v7 = v6;
  if (remoteContext)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Remote context found. Proceeding to launch the upgrade flow.", v18, 2u);
    }

    v8 = [(ICQRemoteContext *)self->_remoteContext offer];
    v9 = [v8 bundleIdentifier];
    unsigned int v10 = [v9 isEqualToString:ICQBundleId];

    v11 = [v8 serverUIURL];
    if (v11)
    {
      BOOL v12 = 0;
    }
    else
    {
      v13 = [(ICQRemoteContext *)self->_remoteContext link];
      v14 = [v13 actionURL];
      BOOL v12 = v14 == 0;
    }
    if ((v10 | v12) == 1)
    {
      v15 = _ICQGetLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10000757C();
      }

      [(ICQUIRootViewController *)self _fetchDefaultOfferAndLaunchUpgradeFlow];
    }
    else
    {
      v16 = [(ICQRemoteContext *)self->_remoteContext offer];
      v17 = [(ICQRemoteContext *)self->_remoteContext link];
      [(ICQUIRootViewController *)self _launchUpgradeFlowWithOffer:v16 icqLink:v17];
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007548();
    }

    [(ICQUIRootViewController *)self _dismissAndExit];
  }
}

- (void)dismissUpgradeFlow
{
}

- (void)_launchUpgradeFlowWithOffer:(id)a3 icqLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  flowManager = self->_flowManager;
  v9 = _ICQGetLogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (flowManager)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Upgrade flow manager already presented; ignoring.",
        buf,
        2u);
    }
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Presenting upgrade flow within hidden app.", buf, 2u);
    }

    v11 = (ICQUpgradeFlowManager *)[objc_alloc((Class)ICQUpgradeFlowManager) initWithOffer:v6];
    BOOL v12 = self->_flowManager;
    self->_flowManager = v11;

    [(ICQUpgradeFlowManager *)self->_flowManager setDelegate:self];
    v13 = [(ICQRemoteContext *)self->_remoteContext flowOptionsData];
    v14 = +[ICQUpgradeFlowOptions flowOptionsFromData:v13];
    [(ICQUpgradeFlowManager *)self->_flowManager setFlowOptions:v14];

    [(ICQUpgradeFlowManager *)self->_flowManager setIcqLink:v7];
    v15 = [(ICQRemoteContext *)self->_remoteContext presentingSceneIdentifier];

    v16 = _ICQGetLogSystem();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        v18 = [(ICQRemoteContext *)self->_remoteContext presentingSceneIdentifier];
        *(_DWORD *)buf = 138412290;
        v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting OOP parent/host's app sceneIdentifier: %@", buf, 0xCu);
      }
      objc_super v19 = [(ICQRemoteContext *)self->_remoteContext presentingSceneIdentifier];
      [(ICQUpgradeFlowManager *)self->_flowManager setPresentingSceneIdentifier:v19];
    }
    else
    {
      if (v17)
      {
        sceneIdentifier = self->_sceneIdentifier;
        *(_DWORD *)buf = 138412290;
        v23 = sceneIdentifier;
      }

      [(ICQUpgradeFlowManager *)self->_flowManager setPresentingSceneIdentifier:self->_sceneIdentifier];
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006154;
    block[3] = &unk_10000C3E0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_fetchDefaultOfferAndLaunchUpgradeFlow
{
  id v3 = +[ICQOfferManager sharedOfferManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006204;
  v4[3] = &unk_10000C490;
  v4[4] = self;
  [v3 getOfferForBundleIdentifier:ICQBundleId completion:v4];
}

- (void)_handleFallback
{
  v2 = [(ICQRemoteContext *)self->_remoteContext offer];
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [v2 context];
    int v12 = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Failed to launch upgrade flow with context = %@", (uint8_t *)&v12, 0xCu);
  }
  v5 = [v2 context];
  id v6 = +[NSURL URLWithString:v5];

  unsigned int v7 = [v6 icq_isICQLaunchURL];
  v8 = _ICQGetLogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v12) = 0;
    }

    id v10 = +[NSURL URLWithString:ICQManageStoragePreferencesURL];
    v11 = +[LSApplicationWorkspace defaultWorkspace];
    [v11 openSensitiveURL:v10 withOptions:0];
  }
  else
  {
    if (v9)
    {
      int v12 = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Launching link %@ in safari", (uint8_t *)&v12, 0xCu);
    }

    id v10 = objc_alloc_init((Class)_LSOpenConfiguration);
    [v10 setAllowURLOverrides:0];
    v11 = +[LSApplicationWorkspace defaultWorkspace];
    [v11 openURL:v6 configuration:v10 completionHandler:&stru_10000C4B0];
  }
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000075B0();
  }

  flowManager = self->_flowManager;
  id v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (flowManager)
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      v8 = "Upgrade flow has been cancelled.";
      BOOL v9 = v6;
      uint32_t v10 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    int v11 = 136315138;
    int v12 = "-[ICQUIRootViewController upgradeFlowManagerDidCancel:]";
    v8 = "Upgrade flow has been dismissed already, %s will be ignored.";
    BOOL v9 = v6;
    uint32_t v10 = 12;
    goto LABEL_8;
  }

  [(ICQUIRootViewController *)self _dismissFlowWithSuccess:0];
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000075E4();
  }

  flowManager = self->_flowManager;
  id v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!flowManager)
  {
    if (v7)
    {
      int v14 = 136315138;
      v15 = "-[ICQUIRootViewController upgradeFlowManagerDidComplete:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Upgrade flow has been dismissed already, %s will be ignored.", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_16;
  }
  if (v7)
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Upgrade flow has been completed.", (uint8_t *)&v14, 2u);
  }

  v8 = [(ICQUpgradeFlowManager *)self->_flowManager offer];
  unsigned int v9 = [v8 isPremiumOffer];

  uint32_t v10 = [(ICQUpgradeFlowManager *)self->_flowManager offer];
  unsigned __int8 v11 = [v10 isDefaultOffer];

  if ((v11 & 1) == 0)
  {
    int v12 = _ICQGetLogSystem();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v13)
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cleaning up pending premium followup item", (uint8_t *)&v14, 2u);
      }

      id v6 = +[ICQOfferManager sharedOfferManager];
      [v6 teardownCachedPremiumOffer];
    }
    else
    {
      if (v13)
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cleaning up pending regular followup item", (uint8_t *)&v14, 2u);
      }

      id v6 = +[ICQOfferManager sharedOfferManager];
      [v6 teardownCachedOffer];
    }
LABEL_16:
  }
  [(ICQUIRootViewController *)self _dismissFlowWithSuccess:1];
}

- (void)upgradeFlowManager:(id)a3 didPresentViewController:(id)a4
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100007618();
  }
}

- (void)_dismissFlowWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing upgrade flow with success: %d", (uint8_t *)v6, 8u);
  }

  [(ICQUIRootViewController *)self _notifyFlowCompletionToDaemonWithSuccess:v3];
  [(ICQUIRootViewController *)self _dismissAndExit];
}

- (void)_notifyFlowCompletionToDaemonWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.ind.xpc" options:0];
  v5 = _ICQGetLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Connection to ind initiated successfully.", (uint8_t *)v11, 2u);
    }

    uint64_t v12 = 0;
    BOOL v13 = &v12;
    uint64_t v14 = 0x2050000000;
    BOOL v7 = (void *)qword_100012230;
    uint64_t v15 = qword_100012230;
    if (!qword_100012230)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100007120;
      v11[3] = &unk_10000C430;
      v11[4] = &v12;
      sub_100007120((uint64_t)v11);
      BOOL v7 = (void *)v13[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v12, 8);
    unsigned int v9 = [v8 XPCInterface];
    [v4 setRemoteObjectInterface:v9];

    [v4 resume];
    id v6 = [v4 remoteObjectProxyWithErrorHandler:&stru_10000C4F0];
    uint32_t v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Let the daemon know about flow completion.", (uint8_t *)v11, 2u);
    }

    [v6 remoteFreshmintFlowCompletedWithSuccess:v3 error:0];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10000764C();
  }
}

- (void)_dismissAndExit
{
  [(ICQUpgradeFlowManager *)self->_flowManager setDelegate:0];
  flowManager = self->_flowManager;
  self->_flowManager = 0;

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10000C530);
}

- (ICQRemoteContext)remoteContext
{
  return self->_remoteContext;
}

- (void)setRemoteContext:(id)a3
{
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteContext, 0);

  objc_storeStrong((id *)&self->_flowManager, 0);
}

@end