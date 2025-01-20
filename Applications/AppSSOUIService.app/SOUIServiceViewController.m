@interface SOUIServiceViewController
- (BOOL)_checkScreenLockStatus;
- (BOOL)shouldAutorotate;
- (OS_xpc_object)xpcDaemonEndpoint;
- (SOUIServiceViewController)init;
- (int)_preferredStatusBarVisibility;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelAuthorization;
- (void)_dismiss;
- (void)_extensionCleanup;
- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)connectToDaemonWithXpcEndpoint:(id)a3 requestInfo:(id)a4;
- (void)extensionCleanupWithCompletion:(id)a3;
- (void)finishAuthorization:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)presentAuthorizationViewControllerWithHints:(id)a3 requestIdentifier:(id)a4 completion:(id)a5;
- (void)setXpcDaemonEndpoint:(id)a3;
- (void)viewControllerDidCancel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SOUIServiceViewController

- (SOUIServiceViewController)init
{
  v3 = sub_1000049A4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[SOUIServiceViewController init]";
    __int16 v8 = 2112;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)SOUIServiceViewController;
  return [(SOUIServiceViewController *)&v5 init];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = sub_1000049A4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v8 = "-[SOUIServiceViewController viewWillAppear:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIServiceViewController;
  [(SOUIServiceViewController *)&v6 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = sub_1000049A4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v8 = "-[SOUIServiceViewController viewDidAppear:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIServiceViewController;
  [(SOUIServiceViewController *)&v6 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = sub_1000049A4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v8 = "-[SOUIServiceViewController viewWillDisappear:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIServiceViewController;
  [(SOUIServiceViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = sub_1000049A4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    extensionViewController = self->_extensionViewController;
    *(_DWORD *)buf = 136315650;
    __int16 v9 = "-[SOUIServiceViewController viewDidDisappear:]";
    __int16 v10 = 2114;
    v11 = extensionViewController;
    __int16 v12 = 2112;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s extensionViewController = %{public}@ on %@", buf, 0x20u);
  }

  v7.receiver = self;
  v7.super_class = (Class)SOUIServiceViewController;
  [(SOUIServiceViewController *)&v7 viewDidDisappear:v3];
  if (self->_extensionViewController) {
    [(SOUIServiceViewController *)self _cancelAuthorization];
  }
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  objc_super v5 = (void (**)(void))a4;
  objc_super v6 = sub_1000049A4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100007634((uint64_t)self, v6);
  }

  [(SOUIServiceViewController *)self _checkScreenLockStatus];
  if (v5) {
    v5[2](v5);
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = sub_1000049A4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[SOUIServiceViewController configureWithContext:completion:]";
    __int16 v21 = 2114;
    id v22 = v6;
    __int16 v23 = 2112;
    v24 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s context: %{public}@ on %@", buf, 0x20u);
  }

  __int16 v9 = [v6 xpcEndpoint];
  __int16 v10 = [v6 userInfo];
  [(SOUIServiceViewController *)self connectToDaemonWithXpcEndpoint:v9 requestInfo:v10];

  v11 = [(SOUIServiceViewController *)self _remoteViewControllerProxy];
  [v11 setDesiredHardwareButtonEvents:16];

  __int16 v12 = [(SOUIServiceViewController *)self _remoteViewControllerProxy];
  [v12 setDismissalAnimationStyle:1];

  v13 = [(SOUIServiceViewController *)self _remoteViewControllerProxy];
  [v13 setAllowsAlertStacking:1];

  v14 = [(SOUIServiceViewController *)self _remoteViewControllerProxy];
  v15 = [(SOUIServiceViewController *)self view];
  v16 = [v15 window];
  v17 = [v16 windowScene];
  [v14 setLaunchingInterfaceOrientation:[v17 interfaceOrientation]];

  v18.receiver = self;
  v18.super_class = (Class)SOUIServiceViewController;
  [(SOUIServiceViewController *)&v18 configureWithContext:v6 completion:v7];
}

- (void)connectToDaemonWithXpcEndpoint:(id)a3 requestInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = sub_1000049A4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316163;
    v69 = "-[SOUIServiceViewController connectToDaemonWithXpcEndpoint:requestInfo:]";
    __int16 v70 = 2114;
    id v71 = v7;
    __int16 v72 = 2160;
    uint64_t v73 = 1752392040;
    __int16 v74 = 2117;
    id v75 = v8;
    __int16 v76 = 2112;
    v77 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s xpcEndpoint: %{public}@, requestInfo: %{sensitive, mask.hash}@ on %@", buf, 0x34u);
  }

  objc_storeStrong((id *)&self->_xpcDaemonEndpoint, a3);
  __int16 v10 = [[SOUIDaemonConnection alloc] initWithViewController:self];
  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = v10;

  if (self->_daemonConnection)
  {
    if (v8) {
      goto LABEL_5;
    }
LABEL_11:
    objc_super v18 = [sub_100005778() parameterErrorWithMessage:@"no requestInfo for UI service"];
    [(SOUIServiceViewController *)self authorization:0 didCompleteWithCredential:0 error:v18];
LABEL_22:

    goto LABEL_23;
  }
  v17 = sub_1000049A4();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_1000076C0();
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_5:
  if (![(SOUIServiceViewController *)self _checkScreenLockStatus])
  {
    uint64_t v12 = [v8 valueForKey:@"extensionBundleIdentifier"];
    uint64_t v13 = [v8 valueForKey:@"httpHeaders"];
    uint64_t v14 = [v8 valueForKey:@"httpBody"];
    uint64_t v15 = [v8 valueForKey:@"url"];
    v64 = (void *)v14;
    v65 = (void *)v13;
    v59 = (void *)v15;
    if (v15)
    {
      uint64_t v16 = +[NSURL URLWithString:v15];
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v63 = [v8 valueForKey:@"realm"];
    v62 = [v8 valueForKey:@"extensionData"];
    v61 = [v8 valueForKey:@"callerBundleIdentifier"];
    uint64_t v55 = [v8 valueForKey:@"auditTokenData"];
    uint64_t v54 = [v8 valueForKey:@"requestedOperation"];
    uint64_t v56 = [v8 valueForKey:@"authorizationOptions"];
    v19 = [v8 valueForKey:@"useInternalExtensions"];
    unsigned int v20 = [v19 BOOLValue];

    __int16 v21 = [v8 valueForKey:@"cfNetworkInterception"];
    unsigned int v50 = [v21 BOOLValue];

    id v22 = [v8 valueForKey:@"callerManaged"];
    unsigned int v49 = [v22 BOOLValue];

    uint64_t v53 = [v8 valueForKey:@"callerTeamIdentifier"];
    uint64_t v52 = [v8 valueForKey:@"localizedCallerDisplayName"];
    __int16 v23 = [v8 valueForKey:@"enableUserInteraction"];
    unsigned int v48 = [v23 BOOLValue];

    uint64_t v24 = [v8 valueForKey:@"impersonationBundleIdentifier"];
    v25 = [v8 valueForKey:@"screenLockedBehavior"];
    self->_screenLockedBehavior = (int64_t)[v25 integerValue];

    uint64_t v60 = [v8 valueForKey:@"identifier"];
    v26 = [v8 valueForKey:@"showOnCoverScreen"];
    self->_showOnCoverScreen = [v26 BOOLValue];

    v27 = +[SOExtensionManager sharedInstance];
    v28 = v27;
    v58 = (void *)v12;
    if (v20) {
      [v27 loadInternalExtension];
    }
    else {
    v29 = [v27 loadExtensionWithBundleIdentifier:v12];
    }
    extension = self->_extension;
    self->_extension = v29;
    v31 = (void *)v16;

    v32 = sub_1000049A4();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [(SOExtension *)self->_extension localizedExtensionDisplayName];
      *(_DWORD *)buf = 138543362;
      v69 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "loadedExtensionWithBundleIdentifer: extension = %{public}@", buf, 0xCu);
    }
    v34 = (void *)v63;
    v35 = (void *)v56;
    v36 = (void *)v24;
    id v57 = v7;

    v37 = self->_extension;
    v51 = v31;
    if (v37)
    {
      [(SOExtension *)v37 saveDelegate:self forRequestIdentifier:v60];
      id v38 = objc_alloc_init((Class)SOAuthorizationRequestParameters);
      [v38 setIdentifier:v60];
      [v38 setUrl:v31];
      [v38 setHttpHeaders:v65];
      [v38 setHttpBody:v64];
      [v38 setRealm:v63];
      [v38 setExtensionData:v62];
      [v38 setCallerBundleIdentifier:v61];
      [v38 setRequestedOperation:v54];
      [v38 setAuthorizationOptions:v35];
      [v38 setCfNetworkInterception:v50];
      [v38 setCallerManaged:v49];
      v39 = (void *)v53;
      [v38 setCallerTeamIdentifier:v53];
      v40 = (void *)v52;
      [v38 setLocalizedCallerDisplayName:v52];
      v41 = (void *)v54;
      v42 = (void *)v55;
      [v38 setAuditTokenData:v55];
      [v38 setEnableUserInteraction:v48];
      [v38 setImpersonationBundleIdentifier:v36];
      v43 = self->_extension;
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_10000585C;
      v66[3] = &unk_10000C408;
      v66[4] = self;
      id v67 = v38;
      v44 = (void *)v60;
      id v45 = v38;
      v46 = v43;
      v34 = (void *)v63;
      [(SOExtension *)v46 requestAuthorizationViewControllerWithCompletion:v66];
    }
    else
    {
      id v45 = [sub_100005778() internalErrorWithMessage:@"No active AppSSO IdP extension"];
      v47 = self;
      v44 = (void *)v60;
      [(SOUIServiceViewController *)v47 authorization:v60 didCompleteWithCredential:0 error:v45];
      v41 = (void *)v54;
      v42 = (void *)v55;
      v40 = (void *)v52;
      v39 = (void *)v53;
    }

    id v7 = v57;
    objc_super v18 = v58;
    goto LABEL_22;
  }
LABEL_23:
}

- (void)viewDidLoad
{
  BOOL v3 = sub_1000049A4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v9 = "-[SOUIServiceViewController viewDidLoad]";
    __int16 v10 = 2112;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v7.receiver = self;
  v7.super_class = (Class)SOUIServiceViewController;
  [(SOUIServiceViewController *)&v7 viewDidLoad];
  v4 = +[UIColor clearColor];
  objc_super v5 = [(SOUIServiceViewController *)self view];
  [v5 setBackgroundColor:v4];

  id v6 = [(SOUIServiceViewController *)self view];
  [v6 setHidden:1];
}

- (int)_preferredStatusBarVisibility
{
  BOOL v3 = +[UIDevice currentDevice];
  unint64_t v4 = (unint64_t)[v3 userInterfaceIdiom];

  unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFBLL;
  id v6 = [(SOUIServiceViewController *)self view];
  objc_super v7 = [v6 window];
  id v8 = [v7 windowScene];
  __int16 v9 = (char *)[v8 interfaceOrientation] - 3;

  return v5 != 1 && (unint64_t)v9 < 2;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (BOOL)_checkScreenLockStatus
{
  if (!SBSGetScreenLockStatus()) {
    return 0;
  }
  if (self->_showOnCoverScreen || [sub_100005E40() isInternalBuild])
  {
    __int16 v9 = sub_1000049A4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000076F4();
    }
    BOOL v8 = 0;
  }
  else
  {
    int64_t screenLockedBehavior = self->_screenLockedBehavior;
    unint64_t v4 = sub_1000049A4();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (screenLockedBehavior == 2)
    {
      if (v5) {
        sub_100007734();
      }

      id v6 = sub_100005778();
      uint64_t v7 = -5;
    }
    else
    {
      if (v5) {
        sub_100007768();
      }

      id v6 = sub_100005778();
      uint64_t v7 = -3;
    }
    __int16 v9 = [v6 errorWithCode:v7];
    [(SOUIServiceViewController *)self authorization:0 didCompleteWithCredential:0 error:v9];
    BOOL v8 = 1;
  }

  return v8;
}

- (void)_dismiss
{
  BOOL v3 = sub_1000049A4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "-[SOUIServiceViewController _dismiss]";
    __int16 v8 = 2112;
    __int16 v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  extensionViewController = self->_extensionViewController;
  self->_extensionViewController = 0;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006048;
  block[3] = &unk_10000C430;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_extensionCleanup
{
  BOOL v3 = sub_1000049A4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    extension = self->_extension;
    int v7 = 136315650;
    __int16 v8 = "-[SOUIServiceViewController _extensionCleanup]";
    __int16 v9 = 2114;
    __int16 v10 = extension;
    __int16 v11 = 2112;
    uint64_t v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s extension = %{public}@ on %@", (uint8_t *)&v7, 0x20u);
  }

  BOOL v5 = self->_extension;
  if (v5)
  {
    [(SOExtension *)v5 unload];
    id v6 = self->_extension;
    self->_extension = 0;
  }
}

- (void)_cancelAuthorization
{
  BOOL v3 = sub_1000049A4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    extension = self->_extension;
    int v7 = 136315650;
    __int16 v8 = "-[SOUIServiceViewController _cancelAuthorization]";
    __int16 v9 = 2112;
    __int16 v10 = extension;
    __int16 v11 = 2112;
    uint64_t v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s extension = %@ on %@", (uint8_t *)&v7, 0x20u);
  }

  [(SOExtension *)self->_extension cancelAuthorization:self->_requestThatPresentedViewController completion:&stru_10000C470];
  requestThatPresentedViewController = self->_requestThatPresentedViewController;
  id v6 = [sub_100005778() errorWithCode:-2];
  [(SOUIServiceViewController *)self authorization:requestThatPresentedViewController didCompleteWithCredential:0 error:v6];
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000049A4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    int v7 = "-[SOUIServiceViewController handleButtonActions:]";
    __int16 v8 = 2114;
    id v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", (uint8_t *)&v6, 0x20u);
  }

  [(SOUIServiceViewController *)self _cancelAuthorization];
}

- (void)presentAuthorizationViewControllerWithHints:(id)a3 requestIdentifier:(id)a4 completion:(id)a5
{
  __int16 v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = sub_1000049A4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    extensionViewController = self->_extensionViewController;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[SOUIServiceViewController presentAuthorizationViewControllerWithHints:requestIdentifier:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = extensionViewController;
    *(_WORD *)&buf[22] = 2114;
    v36 = v8;
    LOWORD(v37) = 2112;
    *(void *)((char *)&v37 + 2) = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s extension viewController = %{public}@, hints = %{public}@ on %@", buf, 0x2Au);
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000068A0;
  v33[3] = &unk_10000C498;
  id v13 = v10;
  id v34 = v13;
  uint64_t v14 = objc_retainBlock(v33);
  char v32 = 0;
  if (!SBSGetScreenLockStatus()
    || self->_showOnCoverScreen
    || ([sub_100005E40() isInternalBuild] & 1) != 0)
  {
    v17 = self->_extensionViewController;
    if (v17)
    {
      objc_super v18 = [(SOUIServiceViewController *)self childViewControllers];
      v19 = [v18 lastObject];
      BOOL v20 = v17 == v19;

      if (v20)
      {
        id v16 = [sub_100005778() internalErrorWithMessage:@"extension authorization view controller already presented"];
        ((void (*)(void *, void, id))v14[2])(v14, 0, v16);
      }
      else
      {
        __int16 v21 = [(SOUIServiceViewController *)self view];
        [v21 setHidden:0];

        id v16 = [objc_alloc((Class)SOUIAuthorizationViewController) initWithExtensionViewController:self->_extensionViewController hints:v8];
        [v16 setDelegate:self];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v36 = sub_1000068B8;
        *(void *)&long long v37 = sub_1000068C8;
        *((void *)&v37 + 1) = 0;
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1000068D0;
        v29[3] = &unk_10000C4C0;
        v31 = buf;
        v29[4] = self;
        id v22 = v14;
        id v30 = v22;
        uint64_t v23 = +[NSTimer timerWithTimeInterval:0 repeats:v29 block:3.0];
        uint64_t v24 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v23;

        v25 = +[NSRunLoop mainRunLoop];
        [v25 addTimer:*(void *)(*(void *)&buf[8] + 40) forMode:NSRunLoopCommonModes];

        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100006978;
        v26[3] = &unk_10000C4E8;
        v28 = buf;
        v27 = v22;
        [(SOUIServiceViewController *)self presentViewController:v16 animated:1 completion:v26];

        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      id v16 = [sub_100005778() internalErrorWithMessage:@"no extension authorization view controller"];
      ((void (*)(void *, void, id))v14[2])(v14, 0, v16);
    }
  }
  else
  {
    uint64_t v15 = sub_1000049A4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000779C();
    }

    id v16 = [sub_100005778() errorWithCode:-8 subcode:1 message:@"presentation of authorization view controller was denied because the device screen is locked"];
    ((void (*)(void *, void, id))v14[2])(v14, 0, v16);
  }
}

- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_1000049A4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v13 = "-[SOUIServiceViewController authorization:didCompleteWithCredential:error:]";
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 2112;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s credential: %{public}@, %{public}@ on %@", buf, 0x2Au);
  }

  daemonConnection = self->_daemonConnection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006B4C;
  v11[3] = &unk_10000C510;
  v11[4] = self;
  [(SOUIDaemonConnection *)daemonConnection authorizationDidCompleteWithCredential:v7 error:v8 completion:v11];
  [(SOUIServiceViewController *)self _dismiss];
}

- (void)viewControllerDidCancel:(id)a3
{
  id v4 = sub_1000049A4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    extensionViewController = self->_extensionViewController;
    int v6 = 136315650;
    id v7 = "-[SOUIServiceViewController viewControllerDidCancel:]";
    __int16 v8 = 2114;
    id v9 = extensionViewController;
    __int16 v10 = 2112;
    __int16 v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s extensionViewController = %{public}@ on %@", (uint8_t *)&v6, 0x20u);
  }

  if (self->_extensionViewController) {
    [(SOUIServiceViewController *)self _cancelAuthorization];
  }
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = sub_1000049A4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "-[SOUIServiceViewController viewServiceDidTerminateWithError:]";
    __int16 v9 = 2112;
    __int16 v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  requestThatPresentedViewController = self->_requestThatPresentedViewController;
  int v6 = [sub_100005778() errorWithCode:-3 message:@"connection to extension interrupted"];
  [(SOUIServiceViewController *)self authorization:requestThatPresentedViewController didCompleteWithCredential:0 error:v6];
}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = sub_1000049A4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    extension = self->_extension;
    int v10 = 136315650;
    __int16 v11 = "-[SOUIServiceViewController finishAuthorization:completion:]";
    __int16 v12 = 2112;
    id v13 = extension;
    __int16 v14 = 2112;
    id v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s extension = %@ on %@", (uint8_t *)&v10, 0x20u);
  }

  [(SOExtension *)self->_extension finishAuthorization:v7 completion:v6];
}

- (void)extensionCleanupWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  BOOL v5 = sub_1000049A4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100007858((uint64_t)self, v5);
  }

  [(SOUIServiceViewController *)self _extensionCleanup];
  if (v4) {
    v4[2](v4, 1, 0);
  }
}

- (OS_xpc_object)xpcDaemonEndpoint
{
  return self->_xpcDaemonEndpoint;
}

- (void)setXpcDaemonEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcDaemonEndpoint, 0);
  objc_storeStrong((id *)&self->_requestThatPresentedViewController, 0);
  objc_storeStrong((id *)&self->_extensionViewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);

  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

@end