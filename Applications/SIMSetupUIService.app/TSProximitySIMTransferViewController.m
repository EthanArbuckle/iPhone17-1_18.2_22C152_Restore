@interface TSProximitySIMTransferViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)isResumeTransferProxCard;
- (BOOL)shouldAutorotate;
- (NSDictionary)peerDeviceInfo;
- (TSSIMSetupFlow)setupFlow;
- (UINavigationController)pkNavigationController;
- (unint64_t)supportedInterfaceOrientations;
- (void)_deactivate;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)proxCardFlowDidDismiss;
- (void)setIdleTimerDisabled:(BOOL)a3;
- (void)setIsResumeTransferProxCard:(BOOL)a3;
- (void)setPeerDeviceInfo:(id)a3;
- (void)setPkNavigationController:(id)a3;
- (void)setSetupFlow:(id)a3;
- (void)setViewDisappearHandler:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TSProximitySIMTransferViewController

- (void)dealloc
{
  [(TSProximitySIMTransferViewController *)self setIdleTimerDisabled:0];
  v3.receiver = self;
  v3.super_class = (Class)TSProximitySIMTransferViewController;
  [(TSProximitySIMTransferViewController *)&v3 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (Block_layout *)a4;
  v7 = [a3 userInfo];
  v8 = sub_100010734();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    __int16 v19 = 2080;
    v20 = "-[TSProximitySIMTransferViewController configureWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "options:%@ @%s", buf, 0x16u);
  }

  self->_isResumeTransferProxCard = 0;
  uint64_t v9 = [v7 objectForKey:TSUserInfoResumeTransferProxCardKey];
  v10 = (void *)v9;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      LOBYTE(v9) = [v10 BOOLValue];
    }
    else {
      LOBYTE(v9) = 0;
    }
  }
  self->_isResumeTransferProxCard = v9;
  v11 = [v7 objectForKeyedSubscript:@"device"];
  if (!v11)
  {
    v12 = sub_100010734();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100013848(v12);
    }
  }
  objc_storeStrong((id *)&self->_peerDeviceInfo, v11);
  uint64_t v16 = 0;
  id v13 = [objc_alloc((Class)CBDevice) initWithDictionary:v11 error:&v16];
  if (!v13)
  {
    v14 = sub_100010734();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000137C4(v14);
    }
  }
  if (!v6) {
    v6 = &stru_1000208B0;
  }
  v15 = [(TSProximitySIMTransferViewController *)self _remoteViewControllerProxy];
  [v15 setWallpaperTunnelActive:0];
  [v15 setWallpaperStyle:1 withDuration:0.0];
  [v15 setDesiredHardwareButtonEvents:16];
  [v15 setAllowsMenuButtonDismissal:0];
  [v15 setAllowsAlertStacking:1];
  v6->invoke(v6);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 userInfo];
  v23[0] = TSUserInfoFlowTypeKey;
  uint64_t v9 = +[NSNumber numberWithUnsignedInteger:TSFlowTypeProximityTransfer];
  v24[0] = v9;
  v24[1] = &__kCFBooleanTrue;
  v23[1] = TSUserInfoIsClientKey;
  v23[2] = TSUserInfoPeerDeviceKey;
  peerDeviceInfo = self->_peerDeviceInfo;
  if (peerDeviceInfo)
  {
    v11 = self->_peerDeviceInfo;
  }
  else
  {
    v11 = +[NSNull null];
  }
  BOOL v12 = peerDeviceInfo == 0;
  v23[3] = TSUserInfoResumeTransferProxCardKey;
  if (self->_isResumeTransferProxCard) {
    id v13 = &__kCFBooleanTrue;
  }
  else {
    id v13 = &__kCFBooleanFalse;
  }
  v24[2] = v11;
  v24[3] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  v15 = +[TSSIMSetupFlow flowWithOptions:v14];
  setupFlow = self->_setupFlow;
  self->_setupFlow = v15;

  if (v12) {
  [(TSSIMSetupFlow *)self->_setupFlow setDelegate:self];
  }
  objc_initWeak(&location, self);
  v17 = self->_setupFlow;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000DE18;
  v19[3] = &unk_1000208D8;
  objc_copyWeak(&v21, &location);
  id v18 = v7;
  id v20 = v18;
  [(TSSIMSetupFlow *)v17 firstViewController:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)handleButtonActions:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000DF84;
  v3[3] = &unk_100020788;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  if (sub_1000107CC())
  {
    v5 = sub_100010734();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100013958(a3, v5);
    }
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E0E8;
  v6[3] = &unk_1000207B0;
  v6[4] = self;
  [(TSProximitySIMTransferViewController *)self dismissViewControllerWithTransition:7 completion:v6];
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  if (self->_idleTimerDisabled != a3)
  {
    self->_BOOL idleTimerDisabled = a3;
    v4 = sub_100010734();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL idleTimerDisabled = self->_idleTimerDisabled;
      v7[0] = 67109378;
      v7[1] = idleTimerDisabled;
      __int16 v8 = 2080;
      uint64_t v9 = "-[TSProximitySIMTransferViewController setIdleTimerDisabled:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "set idle timer disabled : %d @%s", (uint8_t *)v7, 0x12u);
    }

    id v6 = [(TSProximitySIMTransferViewController *)self _remoteViewControllerProxy];
    [v6 setIdleTimerDisabled:self->_idleTimerDisabled forReason:@"SIMTransfer"];
  }
}

- (void)setViewDisappearHandler:(id)a3
{
  self->_viewDisappearHandler = objc_retainBlock(a3);

  _objc_release_x1();
}

- (void)proxCardFlowDidDismiss
{
  objc_super v3 = sub_100010734();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[TSProximitySIMTransferViewController proxCardFlowDidDismiss]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRXFlowDelegate: proxCardFlowDidDismiss @%s", (uint8_t *)&v4, 0xCu);
  }

  [(TSSIMSetupFlow *)self->_setupFlow userDidTapCancel];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)TSProximitySIMTransferViewController;
  [(TSProximitySIMTransferViewController *)&v8 viewDidLoad];
  objc_super v3 = +[UIColor systemBackgroundColor];
  int v4 = [(TSProximitySIMTransferViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  id v6 = +[UINavigationBar appearance];
  [v6 _setHidesShadow:1];

  id v7 = +[UINavigationBar appearance];
  [v7 setTranslucent:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSProximitySIMTransferViewController;
  [(TSProximitySIMTransferViewController *)&v5 viewDidDisappear:a3];
  viewDisappearHandler = (void (**)(void))self->_viewDisappearHandler;
  if (viewDisappearHandler) {
    viewDisappearHandler[2]();
  }
}

- (BOOL)shouldAutorotate
{
  return +[SSServiceUtilities isPad];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (+[SSServiceUtilities isPad]) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)_deactivate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E518;
  block[3] = &unk_1000207B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (UINavigationController)pkNavigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPkNavigationController:(id)a3
{
}

- (NSDictionary)peerDeviceInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPeerDeviceInfo:(id)a3
{
}

- (TSSIMSetupFlow)setupFlow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSetupFlow:(id)a3
{
}

- (BOOL)isResumeTransferProxCard
{
  return self->_isResumeTransferProxCard;
}

- (void)setIsResumeTransferProxCard:(BOOL)a3
{
  self->_isResumeTransferProxCard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupFlow, 0);
  objc_storeStrong((id *)&self->_peerDeviceInfo, 0);
  objc_storeStrong((id *)&self->_pkNavigationController, 0);

  objc_storeStrong(&self->_viewDisappearHandler, 0);
}

@end