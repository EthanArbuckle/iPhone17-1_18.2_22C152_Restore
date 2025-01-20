@interface TransitionViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)rootController;
+ (unsigned)newInstanceId;
+ (unsigned)newTaskId;
- (BOOL)_canShowWhileLocked;
- (BOOL)_internalBooleanDefaultNamed:(id)a3;
- (BOOL)_isRootControllerClass;
- (BOOL)_shouldCancelForApplicationChange;
- (BOOL)_shouldHideStatusBarForController:(int64_t)a3;
- (BOOL)_shouldRegisterForApplicationChange;
- (BOOL)_shouldSimulateStaleRootController;
- (BOOL)_shouldSkipStaleRootControllerRecovery;
- (BOOL)appeared;
- (BOOL)awaitingDissappear;
- (BOOL)callerNameOverride;
- (BOOL)disappeared;
- (BOOL)isFullScreenController;
- (BOOL)isRemoteViewController;
- (BOOL)isUiReady;
- (BOOL)prefersStatusBarHidden;
- (BOOL)processHomeButtonPressed;
- (LABackoffCounter)backoffCounter;
- (LACachedExternalizedContext)cachedExternalizedContext;
- (LARemoteUIHost)remoteUIHost;
- (LAUIMechanism)mechanism;
- (NSDictionary)internalInfo;
- (NSDictionary)options;
- (NSString)authenticationSubtitle;
- (NSString)authenticationTitle;
- (NSString)callerBundleId;
- (NSString)callerName;
- (NSString)description;
- (TransitionViewController)init;
- (TransitionViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7;
- (TransitionViewController)initWithInternalInfo:(id)a3 parent:(id)a4 allowsLandscape:(BOOL)a5;
- (id)_sceneSessions;
- (id)appearedNotification;
- (id)disappearedNotification;
- (id)localizedCallerName;
- (int)_preferredStatusBarVisibility;
- (int64_t)policy;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)instanceId;
- (void)_cancelForApplicationChangeIfNeeded;
- (void)_checkClearForIdleExit;
- (void)_dismissChild:(id)a3 andRoot:(BOOL)a4 reason:(id)a5 completion:(id)a6;
- (void)_dismissRemoteUIWithCompletionHandler:(id)a3;
- (void)_dismissRootWithReason:(id)a3 completion:(id)a4;
- (void)_handleIdleExitResponse:(id)a3 error:(id)a4;
- (void)_mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)_performOnMainQueueWhenAppeared:(id)a3;
- (void)_resetUI;
- (void)_scheduleIdleExit;
- (void)_setActivityWatchdog;
- (void)_setupConnection;
- (void)authMethodWithReply:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didReceiveAuthenticationData;
- (void)dismissChildWithCompletionHandler:(id)a3;
- (void)dismissRemoteUIWasInvalidated:(BOOL)a3 completionHandler:(id)a4;
- (void)externalizedContextWithReply:(id)a3;
- (void)handleButtonActions:(id)a3;
- (void)idleTimerDisable:(BOOL)a3;
- (void)internalInfoWithReply:(id)a3;
- (void)mechanismEvent:(int64_t)a3 reply:(id)a4;
- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)noteActivatedWithPresentationMode:(int64_t)a3;
- (void)setAppeared:(BOOL)a3;
- (void)setAppearedNotification:(id)a3;
- (void)setAuthenticationSubtitle:(id)a3;
- (void)setAuthenticationTitle:(id)a3;
- (void)setAwaitingDissappear:(BOOL)a3;
- (void)setBackoffCounter:(id)a3;
- (void)setDisappeared:(BOOL)a3;
- (void)setDisappearedNotification:(id)a3;
- (void)showWithController:(int64_t)a3 internalInfo:(id)a4 completionHandler:(id)a5;
- (void)transitionToController:(int64_t)a3 internalInfo:(id)a4 completionHandler:(id)a5;
- (void)uiCancel;
- (void)uiCancelWithError:(id)a3;
- (void)uiContinue;
- (void)uiDismissed;
- (void)uiEvent:(int64_t)a3 options:(id)a4;
- (void)uiFailureWithError:(id)a3;
- (void)uiFallback;
- (void)uiOpenURL:(id)a3;
- (void)uiSuccessWithResult:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewModelDidReceiveAuthenticationDataWithInternalInfo:(id)a3 mechanism:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TransitionViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (TransitionViewController)init
{
  v18.receiver = self;
  v18.super_class = (Class)TransitionViewController;
  v3 = [(TransitionViewController *)&v18 init];
  if (!v3) {
    return v3;
  }
  v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  v3->_allowsLandscape = (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v3->_instanceId = +[TransitionViewController newInstanceId];
  id WeakRetained = objc_loadWeakRetained(&qword_10009E270);

  if (!WeakRetained) {
    goto LABEL_11;
  }
  if (![(TransitionViewController *)v3 _isRootControllerClass]) {
    goto LABEL_12;
  }
  unsigned int v7 = [(TransitionViewController *)v3 _shouldSkipStaleRootControllerRecovery];
  v8 = LALogForCategory();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (!v7)
  {
    if (v9) {
      sub_100060F1C((uint64_t)v3, v8);
    }

LABEL_11:
    objc_storeWeak(&qword_10009E270, v3);
    goto LABEL_12;
  }
  if (v9) {
    sub_100060E84(v8);
  }

LABEL_12:
  v10 = LALogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (TransitionViewController *)objc_loadWeakRetained(&qword_10009E270);
    if (v3 == v11)
    {
      v12 = @"will become a new root VC";
    }
    else
    {
      id v2 = objc_loadWeakRetained(&qword_10009E270);
      v12 = +[NSString stringWithFormat:@"root VC: %@", v2];
    }
    *(_DWORD *)buf = 138543618;
    v20 = v3;
    __int16 v21 = 2114;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@, %{public}@", buf, 0x16u);
    if (v3 != v11)
    {
    }
  }

  v13 = +[LACDevice sharedInstance];
  if (([v13 usesFrontBoardServicesForRemoteUI] & 1) != 0
    || !_os_feature_enabled_impl())
  {

LABEL_24:
    [(TransitionViewController *)v3 _setupConnection];
    goto LABEL_25;
  }
  v14 = (TransitionViewController *)objc_loadWeakRetained(&qword_10009E270);
  if (v3 != v14)
  {

    goto LABEL_25;
  }
  unsigned __int8 v17 = [(TransitionViewController *)v3 isMemberOfClass:objc_opt_class()];

  if ((v17 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_25:
  if ([(TransitionViewController *)v3 _shouldRegisterForApplicationChange])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_100010D54, CLFApplicationDidChangeNotification, 0, (CFNotificationSuspensionBehavior)0);
  }
  return v3;
}

- (void)dealloc
{
  v3 = LALogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100060FD0();
  }

  if ([(TransitionViewController *)self _shouldRegisterForApplicationChange])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CLFApplicationDidChangeNotification, 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)TransitionViewController;
  [(TransitionViewController *)&v5 dealloc];
}

- (BOOL)_isRootControllerClass
{
  if ([(TransitionViewController *)self isMemberOfClass:objc_opt_class()]) {
    return 1;
  }

  return [(TransitionViewController *)self isRemoteViewController];
}

- (void)_resetUI
{
  id disappearedNotification = self->_disappearedNotification;
  self->_id disappearedNotification = 0;

  id appearedNotification = self->_appearedNotification;
  self->_id appearedNotification = 0;

  self->_hasRequestedReset = 1;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100010F54;
  v5[3] = &unk_1000860D8;
  objc_copyWeak(&v6, &location);
  [(TransitionViewController *)self dismissRemoteUIWasInvalidated:1 completionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_setupConnection
{
  objc_initWeak(&location, self);
  if (qword_10009E278)
  {
    [(id)qword_10009E278 suspend];
  }
  else
  {
    id v3 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.LocalAuthentication.RemoteUIHost" options:0];
    v4 = (void *)qword_10009E278;
    qword_10009E278 = (uint64_t)v3;

    objc_super v5 = +[LAInternalProtocols interfaceWithInternalProtocol:&OBJC_PROTOCOL___LARemoteUIHost];
    [(id)qword_10009E278 setRemoteObjectInterface:v5];
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100011354;
  v24[3] = &unk_1000860D8;
  objc_copyWeak(&v25, &location);
  [(id)qword_10009E278 setInterruptionHandler:v24];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100011394;
  v22[3] = &unk_1000860D8;
  objc_copyWeak(&v23, &location);
  [(id)qword_10009E278 setInvalidationHandler:v22];
  [(id)qword_10009E278 resume];
  id v6 = (void *)qword_10009E278;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000113E0;
  v20[3] = &unk_100086468;
  objc_copyWeak(&v21, &location);
  unsigned int v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v20];
  remoteUIHost = self->_remoteUIHost;
  self->_remoteUIHost = v7;

  BOOL v9 = self->_remoteUIHost;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100011458;
  v19[3] = &unk_100086490;
  v19[4] = self;
  [(LARemoteUIHost *)v9 connectRemoteUI:self reply:v19];
  v10 = [(TransitionViewController *)self mechanism];
  if (v10)
  {
    unsigned int v11 = [(TransitionViewController *)self isRemoteViewController];

    if (v11)
    {
      dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
      mechanism = self->_mechanism;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100011528;
      v17[3] = &unk_1000864B8;
      v17[4] = self;
      v14 = v12;
      objc_super v18 = v14;
      [(LAUIMechanism *)mechanism internalInfoWithReply:v17];
      dispatch_time_t v15 = dispatch_time(0, 1000000000);
      if (dispatch_semaphore_wait(v14, v15))
      {
        v16 = LALogForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          sub_100061044(v16);
        }
      }
    }
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (TransitionViewController)initWithInternalInfo:(id)a3 parent:(id)a4 allowsLandscape:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TransitionViewController;
  unsigned int v11 = [(TransitionViewController *)&v20 init];
  if (v11)
  {
    v11->_instanceId = +[TransitionViewController newInstanceId];
    dispatch_semaphore_t v12 = LALogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v22 = v11;
      __int16 v23 = 2114;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ is initializing as a child of %{public}@ with %{public}@", buf, 0x20u);
    }

    objc_storeStrong((id *)&v11->_internalInfo, a3);
    uint64_t v13 = [v10 mechanism];
    mechanism = v11->_mechanism;
    v11->_mechanism = (LAUIMechanism *)v13;

    uint64_t v15 = [v10 backoffCounter];
    backoffCounter = v11->_backoffCounter;
    v11->_backoffCounter = (LABackoffCounter *)v15;

    uint64_t v17 = [v10 remoteUIHost];
    remoteUIHost = v11->_remoteUIHost;
    v11->_remoteUIHost = (LARemoteUIHost *)v17;

    v11->_allowsLandscape = a5;
    [(TransitionViewController *)v11 didReceiveAuthenticationData];
  }

  return v11;
}

- (TransitionViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TransitionViewController;
  v16 = [(TransitionViewController *)&v18 init];
  if (v16)
  {
    v16->_instanceId = +[TransitionViewController newInstanceId];
    objc_storeStrong((id *)&v16->_backoffCounter, a5);
    objc_storeStrong((id *)&v16->_remoteUIHost, a6);
    v16->_allowsLandscape = a7;
    [(TransitionViewController *)v16 viewModelDidReceiveAuthenticationDataWithInternalInfo:v12 mechanism:v13];
  }

  return v16;
}

- (void)didReceiveAuthenticationData
{
  id v3 = [(NSDictionary *)self->_internalInfo objectForKey:@"Policy"];
  self->_policy = (int64_t)[v3 integerValue];

  v38 = self;
  v4 = [(NSDictionary *)self->_internalInfo objectForKey:@"Options"];
  id v5 = [v4 mutableCopy];

  if (v5)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v6 = [v5 allKeys];
    id v7 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v42;
      id v10 = &_s7SwiftUI14_PaddingLayoutVAA12ViewModifierAAWP_ptr;
      v37 = v6;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          id v13 = [v5 objectForKeyedSubscript:v12];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v10[107] isLocalizationKey:v13])
          {
            unsigned __int8 v40 = 0;
            [v10[107] decodeLocalizationKeyFromString:v13 shouldUseDeviceVariant:&v40];
            id v15 = v14 = v10;
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v39[2] = sub_100011CA8;
            v39[3] = &unk_1000864E0;
            v39[4] = v38;
            v16 = sub_100011CA8((uint64_t)v39, v15, v40);
            [v5 setObject:v16 forKeyedSubscript:v12];

            id v10 = v14;
            id v6 = v37;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v8);
    }
  }
  p_options = (id *)&v38->_options;
  objc_storeStrong((id *)&v38->_options, v5);
  if (v38->_options)
  {
    objc_super v18 = [(NSDictionary *)v38->_options objectForKey:&off_10008A378];
    v19 = v18;
    if (v18) {
      -[TransitionViewController setModalPresentationStyle:](v38, "setModalPresentationStyle:", [v18 integerValue]);
    }
    objc_super v20 = [*p_options objectForKey:&off_10008A390];
    id v21 = v20;
    if (v20) {
      -[TransitionViewController setModalTransitionStyle:](v38, "setModalTransitionStyle:", [v20 integerValue]);
    }
  }
  uint64_t v22 = [(TransitionViewController *)v38 localizedCallerName];
  callerName = v38->_callerName;
  v38->_callerName = (NSString *)v22;

  id v24 = [*p_options objectForKeyedSubscript:&off_10008A3A8];
  v38->_callerNameOverride = [v24 isEqualToString:v38->_callerName];

  uint64_t v25 = [(NSDictionary *)v38->_internalInfo objectForKey:@"CallerId"];
  callerBundleId = v38->_callerBundleId;
  v38->_callerBundleId = (NSString *)v25;

  v27 = [(TransitionViewController *)v38 options];
  v28 = [v27 objectForKeyedSubscript:&off_10008A3C0];
  uint64_t v29 = +[LAUtils truncateString:v28 maxLength:512];
  authenticationTitle = v38->_authenticationTitle;
  v38->_authenticationTitle = (NSString *)v29;

  v31 = [(TransitionViewController *)v38 options];
  v32 = [v31 objectForKeyedSubscript:&off_10008A3D8];
  uint64_t v33 = +[LAUtils truncateString:v32 maxLength:512];
  authenticationSubtitle = v38->_authenticationSubtitle;
  v38->_authenticationSubtitle = (NSString *)v33;

  v35 = (LACachedExternalizedContext *)[objc_alloc((Class)LACachedExternalizedContext) initWithExternalizationDelegate:v38->_mechanism];
  cachedExternalizedContext = v38->_cachedExternalizedContext;
  v38->_cachedExternalizedContext = v35;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"%@[%u]", v4, [(TransitionViewController *)self instanceId]];

  return (NSString *)v5;
}

- (id)localizedCallerName
{
  id v2 = [(NSDictionary *)self->_internalInfo objectForKeyedSubscript:@"CallerName"];
  if (v2)
  {
    id v3 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v2 allowPlaceholder:0 error:0];
    v4 = v3;
    if (v3)
    {
      id v5 = [v3 localizedName];
      id v6 = v5;
      if (v5)
      {
        id v7 = v5;
        id v8 = v2;
      }
      else
      {
        uint64_t v9 = [v4 localizedShortName];
        id v8 = v9;
        if (v9)
        {
          id v7 = v9;
        }
        else
        {
          uint64_t v10 = [v4 bundleIdentifier];
          unsigned int v11 = (void *)v10;
          if (v10) {
            uint64_t v12 = (void *)v10;
          }
          else {
            uint64_t v12 = v2;
          }
          id v7 = v12;

          id v2 = v11;
        }
      }
      id v2 = v7;
    }
  }

  return v2;
}

+ (unsigned)newInstanceId
{
  return ++dword_10009E280;
}

+ (unsigned)newTaskId
{
  return ++dword_10009E284;
}

- (void)_dismissRemoteUIWithCompletionHandler:(id)a3
{
}

- (void)dismissRemoteUIWasInvalidated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  unsigned int v7 = +[TransitionViewController newTaskId];
  id v8 = LALogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = self;
    __int16 v26 = 1024;
    BOOL v27 = v4;
    __int16 v28 = 1024;
    unsigned int v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dismissing %{public}@, invalidated: %d, created tid:%u", buf, 0x18u);
  }

  if (self->_disappeared)
  {
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    if (v4 && !self->_appeared)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100012224;
      block[3] = &unk_100086508;
      objc_copyWeak(&v20, (id *)buf);
      unsigned int v21 = v7;
      v19 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v20);
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000122A4;
      v14[3] = &unk_100086558;
      unsigned int v17 = v7;
      v14[4] = self;
      id v15 = v6;
      objc_copyWeak(&v16, (id *)buf);
      uint64_t v9 = objc_retainBlock(v14);
      uint64_t v10 = v9;
      if (self->_appeared)
      {
        ((void (*)(void *))v9[2])(v9);
      }
      else
      {
        unsigned int v11 = LALogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v22 = 67109120;
          unsigned int v23 = v7;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Scheduling disappearBlock when controller appears, tid:%u", v22, 8u);
        }

        id v12 = objc_retainBlock(v10);
        id appearedNotification = self->_appearedNotification;
        self->_id appearedNotification = v12;
      }
      objc_destroyWeak(&v16);
    }
    objc_destroyWeak((id *)buf);
  }
}

- (void)transitionToController:(int64_t)a3 internalInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = +[TransitionViewController newTaskId];
  unsigned int v11 = LALogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    unsigned __int8 v40 = self;
    __int16 v41 = 1024;
    int v42 = a3;
    __int16 v43 = 2114;
    id v44 = v8;
    __int16 v45 = 1024;
    unsigned int v46 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ transitioning to %d (%{public}@), created tid:%u", buf, 0x22u);
  }

  id v12 = +[UIDevice currentDevice];
  unint64_t v13 = (unint64_t)[v12 userInterfaceIdiom];

  char v14 = v13 & 0xFB;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    char v15 = _os_feature_enabled_impl();
    if (a3 == 1) {
      char v14 = v15;
    }
    else {
      char v14 = 0;
    }
  }
  self->_allowsLandscape = v14;
  id v16 = LALogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_allowsLandscape) {
      unsigned int v17 = "YES";
    }
    else {
      unsigned int v17 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    unsigned __int8 v40 = (TransitionViewController *)v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting _allowsLandscape = %s", buf, 0xCu);
  }

  objc_super v18 = [v8 objectForKey:@"CallerId"];
  if (v18)
  {
    v19 = [v8 objectForKey:@"BackgroundUi"];
    unsigned __int8 v20 = [v19 BOOLValue];

    unsigned int v21 = [v8 objectForKey:@"Policy"];
    id v22 = [v21 integerValue];

    if ((v20 & 1) == 0
      && (+[LAUtils isApplePayPolicy:v22] & 1) == 0)
    {
      unsigned int v23 = [v8 objectForKeyedSubscript:@"ProcessId"];
      if (+[LAUtils callerRunningOnForeground:pid:](LAUtils, "callerRunningOnForeground:pid:", v18, [v23 unsignedIntValue]))
      {
      }
      else
      {
        id v24 = +[NSBundle mainBundle];
        uint64_t v25 = [v24 bundleIdentifier];
        unsigned __int8 v26 = +[LAUtils callerRunningOnForeground:v25 pid:geteuid()];

        if ((v26 & 1) == 0)
        {
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_1000128DC;
          v37[3] = &unk_100086580;
          id v38 = v9;
          id v31 = v9;
          [(TransitionViewController *)self _dismissRemoteUIWithCompletionHandler:v37];
          v30 = v38;
          goto LABEL_24;
        }
      }
    }
  }
  if ([(TransitionViewController *)self _shouldHideStatusBarForController:a3])
  {
    BOOL v27 = LALogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v40 = self;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ will hide status bar, because the child controller needs it", buf, 0xCu);
    }

    BOOL v28 = 1;
  }
  else
  {
    BOOL v28 = 0;
  }
  self->_hideStatusBar = v28;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100012964;
  v32[3] = &unk_1000865F0;
  unsigned int v36 = v10;
  int64_t v35 = a3;
  v32[4] = self;
  id v33 = v8;
  id v34 = v9;
  id v29 = v9;
  [(TransitionViewController *)self _performOnMainQueueWhenAppeared:v32];

  v30 = v33;
LABEL_24:
}

- (void)_performOnMainQueueWhenAppeared:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[TransitionViewController newTaskId];
  id v6 = LALogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    unsigned int v17 = self;
    __int16 v18 = 1024;
    unsigned int v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@ will perform task when appeared, created tid:%u", buf, 0x12u);
  }

  unsigned int v7 = self->_childController;
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013040;
  block[3] = &unk_100086640;
  unsigned int v11 = v7;
  id v8 = v7;
  objc_copyWeak(&v14, (id *)buf);
  unsigned int v15 = v5;
  id v12 = self;
  id v13 = v4;
  id v9 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (BOOL)_shouldHideStatusBarForController:(int64_t)a3
{
  id v4 = +[LACMobileGestalt currentDeviceScreenSize];
  return a3 == 2 && !v4 || a3 == 1 && (sub_100010890() & 1) != 0;
}

- (void)viewDidLoad
{
  id v3 = LALogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ viewDidLoad", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)TransitionViewController;
  [(TransitionViewController *)&v10 viewDidLoad];
  id v4 = [(TransitionViewController *)self view];
  [v4 setAccessibilityIdentifier:@"authentication_ui"];

  objc_initWeak((id *)buf, self);
  unsigned int v5 = self;
  unsigned int v11 = v5;
  id v6 = +[NSArray arrayWithObjects:&v11 count:1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000135EC;
  v8[3] = &unk_100086668;
  objc_copyWeak(&v9, (id *)buf);
  id v7 = [(TransitionViewController *)self registerForTraitChanges:v6 withHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = LALogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    objc_super v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ viewDidAppear", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)TransitionViewController;
  [(TransitionViewController *)&v8 viewDidAppear:v3];
  self->_disappeared = 0;
  self->_appeared = 1;
  self->_awaitingDissappear = 0;
  id appearedNotification = (void (**)(void))self->_appearedNotification;
  if (appearedNotification)
  {
    appearedNotification[2]();
    id v7 = self->_appearedNotification;
    self->_id appearedNotification = 0;
  }
  if ([(TransitionViewController *)self isUiReady]) {
    [(TransitionViewController *)self uiEvent:0 options:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = LALogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ viewWillAppear", buf, 0xCu);
  }

  v11.receiver = self;
  v11.super_class = (Class)TransitionViewController;
  [(TransitionViewController *)&v11 viewWillAppear:v3];
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v10.receiver = self;
    v10.super_class = (Class)TransitionViewController;
    id v7 = [(TransitionViewController *)&v10 _remoteViewControllerProxy];
    [v7 setDesiredHardwareButtonEvents:16];
  }
  objc_super v8 = [(TransitionViewController *)self _remoteViewControllerProxy];
  id v9 = v8;
  if (v8) {
    [v8 setDismissalAnimationStyle:1];
  }
}

- (BOOL)prefersStatusBarHidden
{
  return [(TransitionViewController *)self isFullScreenController] || self->_hideStatusBar;
}

- (void)idleTimerDisable:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TransitionViewController;
  id v4 = [(TransitionViewController *)&v5 _remoteViewControllerProxy];
  [v4 setIdleTimerDisabled:v3 forReason:@"com.apple.LocalAuthentication"];
}

+ (id)rootController
{
  id WeakRetained = objc_loadWeakRetained(&qword_10009E270);

  return WeakRetained;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = LALogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ viewDidDisappear", buf, 0xCu);
  }

  v16.receiver = self;
  v16.super_class = (Class)TransitionViewController;
  [(TransitionViewController *)&v16 viewDidDisappear:v3];
  BOOL v6 = !self->_awaitingDissappear;
  if (self->_awaitingDissappear)
  {
    id v7 = LALogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "ignoring expected UI disappearance", buf, 2u);
    }
  }
  else
  {
    [(LAUIMechanism *)self->_mechanism uiEvent:1 options:0];
    childController = self->_childController;
    if (!childController || [(TransitionViewController *)childController disappeared])
    {
      BOOL v6 = 0;
      goto LABEL_11;
    }
    id v9 = self->_childController;
    id v7 = +[NSString stringWithFormat:@"viewDidDisappear on %@, needs to dismiss child", self];
    [(TransitionViewController *)self _dismissChild:v9 andRoot:1 reason:v7 completion:0];
  }

LABEL_11:
  id disappearedNotification = (void (**)(void))self->_disappearedNotification;
  if (disappearedNotification)
  {
    disappearedNotification[2]();
    id v11 = self->_disappearedNotification;
    self->_id disappearedNotification = 0;
  }
  id v12 = +[LACDevice sharedInstance];
  if ([v12 usesFrontBoardServicesForRemoteUI]
    && (uint64_t v13 = objc_opt_class(), v13 == objc_opt_class()))
  {
    BOOL awaitingDissappear = self->_awaitingDissappear;

    if (awaitingDissappear) {
      return;
    }
  }
  else
  {
  }
  if (!v6)
  {
    id v14 = +[NSString stringWithFormat:@"viewDidDisappear on %@, no active child", self];
    [(TransitionViewController *)self _dismissRootWithReason:v14 completion:0];
  }
  self->_disappeared = 1;
  self->_appeared = 0;
  [(TransitionViewModel *)self->_viewModel suspendConnection];
}

- (void)_scheduleIdleExit
{
  BOOL v3 = +[TransitionViewController rootController];
  if (v3 == self)
  {
  }
  else
  {
    BOOL hasRequestedReset = self->_hasRequestedReset;

    if (!hasRequestedReset) {
      return;
    }
  }
  if ([(TransitionViewController *)self _shouldSimulateStaleRootController])
  {
    objc_super v5 = LALogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100061250();
    }
  }
  else
  {
    objc_storeWeak(&qword_10009E270, 0);
    childController = self->_childController;
    self->_childController = 0;

    id v7 = +[LACDevice sharedInstance];
    unsigned int v8 = [v7 usesFrontBoardServicesForRemoteUI];

    if (v8)
    {
      id v9 = [(TransitionViewController *)self _sceneSessions];
      id v10 = [v9 count];
      id v11 = LALogForCategory();
      os_log_type_t v12 = 16 * (v10 == 0);
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Will destroy %d sessions", buf, 8u);
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id obj = v9;
      id v13 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v24;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(obj);
            }
            unsigned int v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            __int16 v18 = LALogForCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v19 = [v17 persistentIdentifier];
              *(_DWORD *)buf = 138543362;
              BOOL v28 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Will destroy scene %{public}@", buf, 0xCu);
            }
            unsigned __int8 v20 = +[UIApplication sharedApplication];
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_100013F80;
            v22[3] = &unk_100086690;
            uint8_t v22[4] = v17;
            [v20 requestSceneSessionDestruction:v17 options:0 errorHandler:v22];
          }
          id v14 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
        }
        while (v14);
      }
    }
    else
    {
      [(TransitionViewController *)self _checkClearForIdleExit];
    }
  }
}

- (void)_checkClearForIdleExit
{
  objc_initWeak(&location, self);
  BOOL v3 = [(TransitionViewController *)self remoteUIHost];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000140C4;
  v4[3] = &unk_1000866E0;
  objc_copyWeak(&v5, &location);
  [v3 checkClearForIdleExitWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_handleIdleExitResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v11 = LALogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100061340();
    }
    goto LABEL_10;
  }
  [v6 timeIntervalSinceNow];
  double v9 = v8;
  id v10 = LALogForCategory();
  id v11 = v10;
  if (v9 >= 0.0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CoreAuthUI won't idle-exit", v19, 2u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1000613A8(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  [(TransitionViewController *)self _checkClearForIdleExit];
LABEL_11:
}

- (BOOL)isFullScreenController
{
  return 0;
}

- (BOOL)isRemoteViewController
{
  return 0;
}

- (BOOL)isUiReady
{
  uint64_t v2 = objc_opt_class();
  return v2 != objc_opt_class();
}

- (void)uiEvent:(int64_t)a3 options:(id)a4
{
  id v6 = (__CFString *)a4;
  id v7 = LALogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"with options: ";
    int v10 = 138544130;
    CFStringRef v9 = &stru_100088CF0;
    id v11 = self;
    __int16 v12 = 1024;
    if (v6) {
      CFStringRef v9 = v6;
    }
    else {
      CFStringRef v8 = &stru_100088CF0;
    }
    int v13 = a3;
    __int16 v14 = 2112;
    CFStringRef v15 = v8;
    __int16 v16 = 2114;
    CFStringRef v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ has generated UI event:%d %@%{public}@", (uint8_t *)&v10, 0x26u);
  }

  [(LAUIMechanism *)self->_mechanism uiEvent:a3 options:v6];
}

- (void)uiOpenURL:(id)a3
{
  id v3 = a3;
  id v4 = +[URLOpener sharedInstance];
  id v5 = [v4 openURL:v3];

  if (v5)
  {
    id v6 = LALogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      id v8 = v3;
      __int16 v9 = 2114;
      int v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unable to open URL: %{public}@ error: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)uiContinue
{
}

- (void)uiDismissed
{
  [(TransitionViewController *)self _setActivityWatchdog];

  [(TransitionViewController *)self uiEvent:11 options:0];
}

- (void)uiCancel
{
  [(TransitionViewController *)self _setActivityWatchdog];

  [(TransitionViewController *)self uiEvent:2 options:0];
}

- (void)uiCancelWithError:(id)a3
{
  id v4 = a3;
  [(TransitionViewController *)self _setActivityWatchdog];
  if (v4)
  {
    NSErrorUserInfoKey v6 = NSUnderlyingErrorKey;
    id v7 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  }
  else
  {
    id v5 = 0;
  }
  [(TransitionViewController *)self uiEvent:2 options:v5];
}

- (void)uiFallback
{
  [(TransitionViewController *)self _setActivityWatchdog];

  [(TransitionViewController *)self uiEvent:3 options:0];
}

- (void)uiSuccessWithResult:(id)a3
{
  id v4 = a3;
  id v5 = LALogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ UI success", (uint8_t *)&v6, 0xCu);
  }

  [(TransitionViewController *)self _setActivityWatchdog];
  [(LAUIMechanism *)self->_mechanism uiSuccessWithResult:v4];
}

- (void)uiFailureWithError:(id)a3
{
  id v4 = a3;
  id v5 = LALogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ UI failure: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(TransitionViewController *)self _setActivityWatchdog];
  [(LAUIMechanism *)self->_mechanism uiFailureWithError:v4];
}

- (void)externalizedContextWithReply:(id)a3
{
}

- (void)authMethodWithReply:(id)a3
{
  id v4 = a3;
  id v5 = +[LAErrorHelper internalErrorWithMessage:@"No auth blob on mechanism."];
  (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
}

- (void)_setActivityWatchdog
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 3000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000149E8;
  v3[3] = &unk_1000860D8;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)internalInfoWithReply:(id)a3
{
}

- (void)mechanismEvent:(int64_t)a3 reply:(id)a4
{
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014B8C;
  block[3] = &unk_100086708;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a3;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (void)_mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id v10 = LALogForCategory();
  id v11 = v10;
  if (self->_childController) {
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled(v10, v12))
  {
    id v13 = NSStringFromMechanismEventAndValue();
    int v15 = 138543874;
    __int16 v16 = self;
    __int16 v17 = 1024;
    int v18 = a3;
    __int16 v19 = 2112;
    unsigned __int8 v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}@ has received mechanism event %d (%@)", (uint8_t *)&v15, 0x1Cu);
  }
  childController = self->_childController;
  if (childController)
  {
    [(TransitionViewController *)childController mechanismEvent:a3 value:v8 reply:v9];
  }
  else
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFCLL) == 8) {
      self->_resetUiEvent = a3;
    }
    v9[2](v9);
  }
}

- (void)dismissChildWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = LALogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[TransitionViewController dismissChildWithCompletionHandler:]";
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  self->_BOOL awaitingDissappear = 1;
  BOOL v6 = [(TransitionViewController *)self isFullScreenController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014EA0;
  v8[3] = &unk_1000865C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(TransitionViewController *)self dismissViewControllerAnimated:v6 completion:v8];
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  id v5 = LALogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ is handling button action %@", (uint8_t *)&v6, 0x16u);
  }

  if (![(TransitionViewController *)self->_childController processHomeButtonPressed]) {
    [(TransitionViewController *)self uiCancel];
  }
}

- (BOOL)processHomeButtonPressed
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  p_BOOL allowsLandscape = &self->_allowsLandscape;
  BOOL allowsLandscape = self->_allowsLandscape;
  id v4 = LALogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10006148C(!allowsLandscape, p_allowsLandscape, v4);
  }
  if (allowsLandscape) {
    unint64_t v5 = 30;
  }
  else {
    unint64_t v5 = 2;
  }

  return v5;
}

- (int)_preferredStatusBarVisibility
{
  if (self->_hideStatusBar) {
    return 1;
  }
  if ([(TransitionViewController *)self isFullScreenController]) {
    return 2;
  }
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  dispatch_time_t v2 = [(TransitionViewController *)self traitCollection];
  id v3 = [v2 userInterfaceStyle];

  if (v3 == (id)2) {
    return 1;
  }
  else {
    return 3;
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  unint64_t v5 = (void (**)(void))a4;
  int v6 = LALogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = (TransitionViewController *)"-[TransitionViewController configureWithContext:completion:]";
    __int16 v11 = 2112;
    __int16 v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v9, 0x16u);
  }

  if (!self->_allowsLandscape)
  {
    id v7 = LALogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Enforcing portrait mode regardless of the current orientation", (uint8_t *)&v9, 0xCu);
    }

    __int16 v8 = [(TransitionViewController *)self _remoteViewControllerProxy];
    [v8 setLaunchingInterfaceOrientation:1];
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)noteActivatedWithPresentationMode:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TransitionViewController;
  -[TransitionViewController noteActivatedWithPresentationMode:](&v12, "noteActivatedWithPresentationMode:");
  self->_presentationMode = a3;
  if (_os_feature_enabled_impl())
  {
    if (a3)
    {
      unint64_t v5 = LALogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "We are in multiscreen environment. Initializing TransitionViewModel.", v11, 2u);
      }

      int v6 = +[TransitionViewModel shared];
      viewModel = self->_viewModel;
      self->_viewModel = v6;

      __int16 v8 = [(TransitionViewModel *)self->_viewModel delegates];
      [v8 addObject:self];

      int v9 = [(TransitionViewModel *)self->_viewModel delegates];
      id v10 = [v9 count];

      if ((unint64_t)v10 >= 2) {
        [(TransitionViewModel *)self->_viewModel setupConnection];
      }
    }
    else
    {
      [(TransitionViewController *)self _setupConnection];
    }
  }
}

- (void)_dismissChild:(id)a3 andRoot:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000155E8;
  v29[3] = &unk_100086730;
  objc_copyWeak(&v32, &location);
  id v13 = v11;
  id v30 = v13;
  id v14 = v12;
  id v31 = v14;
  int v15 = objc_retainBlock(v29);
  unsigned int v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  long long v23 = sub_1000156CC;
  long long v24 = &unk_100086758;
  BOOL v28 = a4;
  objc_copyWeak(&v27, &location);
  id v16 = v13;
  id v25 = v16;
  __int16 v17 = v15;
  id v26 = v17;
  int v18 = objc_retainBlock(&v21);
  __int16 v19 = v18;
  if (v10)
  {
    unsigned __int8 v20 = LALogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      int64_t v35 = self;
      __int16 v36 = 2114;
      id v37 = v10;
      __int16 v38 = 2114;
      id v39 = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ will dismiss %{public}@ (%{public}@)", buf, 0x20u);
    }

    [v10 dismissChildWithCompletionHandler:v19, v21, v22, v23, v24, v25];
  }
  else
  {
    ((void (*)(void ***))v18[2])(v18);
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

- (void)_dismissRootWithReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  __int16 v8 = [(TransitionViewController *)self _remoteViewControllerProxy];
  if (v8)
  {
    int v9 = LALogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = self;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ RVC proxy was dismissed (%{public}@)", (uint8_t *)&v10, 0x16u);
    }

    [v8 dismiss];
  }
  [(TransitionViewController *)self _scheduleIdleExit];
  if (v7) {
    v7[2](v7);
  }
}

- (BOOL)_shouldSkipStaleRootControllerRecovery
{
  return [(TransitionViewController *)self _internalBooleanDefaultNamed:@"LA.SkipStaleRootControllerRecovery"];
}

- (BOOL)_shouldSimulateStaleRootController
{
  return [(TransitionViewController *)self _internalBooleanDefaultNamed:@"LA.StaleRootControllerSimulation"];
}

- (BOOL)_internalBooleanDefaultNamed:(id)a3
{
  id v3 = a3;
  if (os_variant_allows_internal_security_policies())
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    unint64_t v5 = [v4 persistentDomainForName:NSGlobalDomain];

    id v6 = [v5 objectForKeyedSubscript:v3];
    id v7 = v6;
    if (!v6) {
      id v6 = &__kCFBooleanFalse;
    }
    unsigned __int8 v8 = [v6 BOOLValue];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)_sceneSessions
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = +[UIApplication sharedApplication];
  id v4 = [v3 openSessions];

  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        [v2 addObject:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v9 = +[UIApplication sharedApplication];
  int v10 = [v9 connectedScenes];

  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)j) session];
        [v2 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  return v2;
}

- (void)_cancelForApplicationChangeIfNeeded
{
  if ([(TransitionViewController *)self _shouldCancelForApplicationChange])
  {
    id v3 = LALogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Canceling %{public}@ due to application change.", (uint8_t *)&v4, 0xCu);
    }

    [(TransitionViewController *)self uiCancel];
  }
}

- (BOOL)_shouldRegisterForApplicationChange
{
  id v2 = +[LACDevice sharedInstance];
  unsigned __int8 v3 = [v2 isClarityBoardRunning];

  return v3;
}

- (BOOL)_shouldCancelForApplicationChange
{
  if (![(TransitionViewController *)self _shouldRegisterForApplicationChange]) {
    return 0;
  }
  unsigned __int8 v3 = +[TransitionViewController rootController];
  BOOL v4 = v3 == self;

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)showWithController:(int64_t)a3 internalInfo:(id)a4 completionHandler:(id)a5
{
}

- (void)viewModelDidReceiveAuthenticationDataWithInternalInfo:(id)a3 mechanism:(id)a4
{
  id v6 = (NSDictionary *)a3;
  objc_storeStrong((id *)&self->_mechanism, a4);
  id v7 = a4;
  internalInfo = self->_internalInfo;
  self->_internalInfo = v6;

  [(TransitionViewController *)self didReceiveAuthenticationData];
}

- (LAUIMechanism)mechanism
{
  return self->_mechanism;
}

- (LARemoteUIHost)remoteUIHost
{
  return self->_remoteUIHost;
}

- (int64_t)policy
{
  return self->_policy;
}

- (NSDictionary)options
{
  return self->_options;
}

- (LABackoffCounter)backoffCounter
{
  return self->_backoffCounter;
}

- (void)setBackoffCounter:(id)a3
{
}

- (NSString)callerName
{
  return self->_callerName;
}

- (BOOL)callerNameOverride
{
  return self->_callerNameOverride;
}

- (NSString)callerBundleId
{
  return self->_callerBundleId;
}

- (LACachedExternalizedContext)cachedExternalizedContext
{
  return self->_cachedExternalizedContext;
}

- (NSDictionary)internalInfo
{
  return self->_internalInfo;
}

- (NSString)authenticationTitle
{
  return self->_authenticationTitle;
}

- (void)setAuthenticationTitle:(id)a3
{
}

- (NSString)authenticationSubtitle
{
  return self->_authenticationSubtitle;
}

- (void)setAuthenticationSubtitle:(id)a3
{
}

- (BOOL)awaitingDissappear
{
  return self->_awaitingDissappear;
}

- (void)setAwaitingDissappear:(BOOL)a3
{
  self->_BOOL awaitingDissappear = a3;
}

- (BOOL)disappeared
{
  return self->_disappeared;
}

- (void)setDisappeared:(BOOL)a3
{
  self->_disappeared = a3;
}

- (BOOL)appeared
{
  return self->_appeared;
}

- (void)setAppeared:(BOOL)a3
{
  self->_appeared = a3;
}

- (id)disappearedNotification
{
  return self->_disappearedNotification;
}

- (void)setDisappearedNotification:(id)a3
{
}

- (id)appearedNotification
{
  return self->_appearedNotification;
}

- (void)setAppearedNotification:(id)a3
{
}

- (unsigned)instanceId
{
  return self->_instanceId;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appearedNotification, 0);
  objc_storeStrong(&self->_disappearedNotification, 0);
  objc_storeStrong((id *)&self->_authenticationSubtitle, 0);
  objc_storeStrong((id *)&self->_authenticationTitle, 0);
  objc_storeStrong((id *)&self->_internalInfo, 0);
  objc_storeStrong((id *)&self->_cachedExternalizedContext, 0);
  objc_storeStrong((id *)&self->_callerBundleId, 0);
  objc_storeStrong((id *)&self->_callerName, 0);
  objc_storeStrong((id *)&self->_backoffCounter, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_remoteUIHost, 0);
  objc_storeStrong((id *)&self->_mechanism, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_storeStrong((id *)&self->_childController, 0);
}

@end