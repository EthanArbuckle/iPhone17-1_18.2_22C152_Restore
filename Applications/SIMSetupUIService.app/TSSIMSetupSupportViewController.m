@interface TSSIMSetupSupportViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)shouldAutorotate;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelButtonTapped;
- (void)_deactivate;
- (void)_presentDeviceInfoViewController;
- (void)_presentFirstController:(id)a3 isRemoteSignup:(BOOL)a4;
- (void)_presentPolicyRejectionViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)screenLockDidUpdate:(BOOL)a3;
- (void)setIdleTimerDisabled:(BOOL)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)userDidTapCancel;
- (void)viewDidLoad;
@end

@implementation TSSIMSetupSupportViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = [(TSSIMSetupSupportViewController *)self _remoteViewControllerProxy];
  [v8 setWallpaperTunnelActive:0];
  [v8 setWallpaperStyle:1 withDuration:0.0];
  [v8 setDesiredHardwareButtonEvents:16];
  [v8 setAllowsMenuButtonDismissal:0];
  [v8 setAllowsAlertStacking:1];
  v9 = [v6 userInfo];
  v10 = +[NSMutableDictionary dictionary];
  options = self->_options;
  self->_options = v10;

  v12 = self->_options;
  uint64_t v13 = TSUserInfoForceDualSIMSetupKey;
  v14 = [v9 objectForKeyedSubscript:TSUserInfoForceDualSIMSetupKey];
  [(NSMutableDictionary *)v12 setValue:v14 forKey:v13];

  v15 = self->_options;
  uint64_t v16 = TSUserInfoFlowTypeKey;
  v17 = [v9 objectForKeyedSubscript:TSUserInfoFlowTypeKey];
  [(NSMutableDictionary *)v15 setValue:v17 forKey:v16];

  v18 = self->_options;
  uint64_t v19 = TSUserInfoWebsheetURLKey;
  v20 = [v9 objectForKeyedSubscript:TSUserInfoWebsheetURLKey];
  [(NSMutableDictionary *)v18 setValue:v20 forKey:v19];

  v21 = self->_options;
  uint64_t v22 = TSUserInfoWebsheetPostdataKey;
  v23 = [v9 objectForKeyedSubscript:TSUserInfoWebsheetPostdataKey];
  [(NSMutableDictionary *)v21 setValue:v23 forKey:v22];

  v24 = self->_options;
  uint64_t v25 = TSUserInfoConfirmationCodeRequiredKey;
  v26 = [v9 objectForKeyedSubscript:TSUserInfoConfirmationCodeRequiredKey];
  [(NSMutableDictionary *)v24 setValue:v26 forKey:v25];

  v27 = self->_options;
  uint64_t v28 = TSUserInfoWebsheetRequestTypeKey;
  v29 = [v9 objectForKeyedSubscript:TSUserInfoWebsheetRequestTypeKey];
  [(NSMutableDictionary *)v27 setValue:v29 forKey:v28];

  v30 = self->_options;
  uint64_t v31 = TSUserInfoEidKey;
  v32 = [v9 objectForKeyedSubscript:TSUserInfoEidKey];
  [(NSMutableDictionary *)v30 setValue:v32 forKey:v31];

  v33 = self->_options;
  uint64_t v34 = TSUserInfoImeiKey;
  v35 = [v9 objectForKeyedSubscript:TSUserInfoImeiKey];
  [(NSMutableDictionary *)v33 setValue:v35 forKey:v34];

  v36 = self->_options;
  uint64_t v37 = TSUserInfoImei2Key;
  v38 = [v9 objectForKeyedSubscript:TSUserInfoImei2Key];
  [(NSMutableDictionary *)v36 setValue:v38 forKey:v37];

  v39 = self->_options;
  uint64_t v40 = TSUserInfoMeidKey;
  v41 = [v9 objectForKeyedSubscript:TSUserInfoMeidKey];
  [(NSMutableDictionary *)v39 setValue:v41 forKey:v40];

  v42 = self->_options;
  uint64_t v43 = TSUserInfoCarrierNameKey;
  v44 = [v9 objectForKeyedSubscript:TSUserInfoCarrierNameKey];
  [(NSMutableDictionary *)v42 setValue:v44 forKey:v43];

  v45 = self->_options;
  uint64_t v46 = TSUserInfoSubscriptionContextKey;
  v47 = [v9 objectForKeyedSubscript:TSUserInfoSubscriptionContextKey];
  [(NSMutableDictionary *)v45 setValue:v47 forKey:v46];

  v48 = self->_options;
  uint64_t v49 = TSUserInfoRequireSetupDebugKey;
  v50 = [v9 objectForKeyedSubscript:TSUserInfoRequireSetupDebugKey];
  [(NSMutableDictionary *)v48 setValue:v50 forKey:v49];

  v51 = self->_options;
  uint64_t v52 = TSUserInfoPlanLaunchOptionLiveIDKey;
  v53 = [v9 objectForKeyedSubscript:TSUserInfoPlanLaunchOptionLiveIDKey];
  [(NSMutableDictionary *)v51 setValue:v53 forKey:v52];

  v54 = self->_options;
  uint64_t v55 = TSUserInfoPlanIccidKey;
  v56 = [v9 objectForKeyedSubscript:TSUserInfoPlanIccidKey];
  [(NSMutableDictionary *)v54 setValue:v56 forKey:v55];

  v57 = self->_options;
  uint64_t v58 = TSUserInfoSkipIntroPaneForWebsheetFlowKey;
  v59 = [v9 objectForKeyedSubscript:TSUserInfoSkipIntroPaneForWebsheetFlowKey];
  [(NSMutableDictionary *)v57 setValue:v59 forKey:v58];

  v60 = self->_options;
  uint64_t v61 = TSUserInfoIccidKey;
  v62 = [v9 objectForKeyedSubscript:TSUserInfoIccidKey];
  [(NSMutableDictionary *)v60 setValue:v62 forKey:v61];

  v63 = self->_options;
  uint64_t v64 = TSUserInfoPhoneNumberKey;
  v65 = [v9 objectForKeyedSubscript:TSUserInfoPhoneNumberKey];
  [(NSMutableDictionary *)v63 setValue:v65 forKey:v64];

  v66 = self->_options;
  uint64_t v67 = TSUserInfoWaitForServiceKey;
  v68 = [v9 objectForKeyedSubscript:TSUserInfoWaitForServiceKey];
  [(NSMutableDictionary *)v66 setValue:v68 forKey:v67];

  v69 = self->_options;
  uint64_t v70 = TSUserInfoFallbackToActivationCodeKey;
  v71 = [v9 objectForKeyedSubscript:TSUserInfoFallbackToActivationCodeKey];
  [(NSMutableDictionary *)v69 setValue:v71 forKey:v70];

  v72 = self->_options;
  uint64_t v73 = TSUserInfoIgnoreTransportKey;
  v74 = [v9 objectForKeyedSubscript:TSUserInfoIgnoreTransportKey];
  [(NSMutableDictionary *)v72 setValue:v74 forKey:v73];

  v75 = self->_options;
  uint64_t v76 = TSUserInfoExternalizedContextKey;
  v77 = [v9 objectForKeyedSubscript:TSUserInfoExternalizedContextKey];
  [(NSMutableDictionary *)v75 setValue:v77 forKey:v76];

  v78 = self->_options;
  uint64_t v79 = TSUserInfoIsLocalConvertKey;
  v80 = [v9 objectForKeyedSubscript:TSUserInfoIsLocalConvertKey];
  [(NSMutableDictionary *)v78 setValue:v80 forKey:v79];

  v81 = self->_options;
  uint64_t v82 = TSIsLocalConvertKey;
  v83 = [v9 objectForKeyedSubscript:TSIsLocalConvertKey];
  [(NSMutableDictionary *)v81 setValue:v83 forKey:v82];

  v84 = self->_options;
  uint64_t v85 = TSHasLocalPlanKey;
  v86 = [v9 objectForKeyedSubscript:TSHasLocalPlanKey];
  [(NSMutableDictionary *)v84 setValue:v86 forKey:v85];

  v87 = self->_options;
  uint64_t v88 = TSHostViewControllerKey;
  v89 = [v9 objectForKeyedSubscript:TSHostViewControllerKey];
  [(NSMutableDictionary *)v87 setValue:v89 forKey:v88];

  v90 = v9;
  if (([v9 isEqualToDictionary:self->_options] & 1) == 0)
  {
    v108 = v8;
    v109 = v7;
    id v110 = v6;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    v91 = [v9 allKeys];
    id v92 = [v91 countByEnumeratingWithState:&v111 objects:v121 count:16];
    if (v92)
    {
      id v93 = v92;
      uint64_t v94 = *(void *)v112;
      do
      {
        for (i = 0; i != v93; i = (char *)i + 1)
        {
          if (*(void *)v112 != v94) {
            objc_enumerationMutation(v91);
          }
          uint64_t v96 = *(void *)(*((void *)&v111 + 1) + 8 * i);
          v97 = [(NSMutableDictionary *)self->_options allKeys];
          unsigned __int8 v98 = [v97 containsObject:v96];

          if ((v98 & 1) == 0)
          {
            v99 = sub_100010734();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
            {
              v100 = [v90 objectForKeyedSubscript:v96];
              *(_DWORD *)buf = 138412802;
              uint64_t v116 = v96;
              __int16 v117 = 2112;
              v118 = v100;
              __int16 v119 = 2080;
              v120 = "-[TSSIMSetupSupportViewController configureWithContext:completion:]";
              _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "[I] sanitized user option: {%@ : %@} @%s", buf, 0x20u);
            }
          }
        }
        id v93 = [v91 countByEnumeratingWithState:&v111 objects:v121 count:16];
      }
      while (v93);
    }

    v7 = v109;
    id v6 = v110;
    v8 = v108;
  }
  v101 = [[TSScreenLockObserver alloc] initWithDelegate:self];
  screenLockObserver = self->_screenLockObserver;
  self->_screenLockObserver = v101;

  v103 = [SSRemoteAlertMonitor alloc];
  v104 = +[NSBundle mainBundle];
  v105 = [v104 bundleIdentifier];
  v106 = [(SSRemoteAlertMonitor *)v103 initWithBundleID:v105 dismissHandler:&stru_100020978];
  remoteAlertMonitor = self->_remoteAlertMonitor;
  self->_remoteAlertMonitor = v106;

  if (v7) {
    v7[2](v7);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (Block_layout *)a4;
  if (!v7)
  {
    v8 = sub_100010734();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100013BF0(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    v7 = &stru_100020998;
  }
  uint64_t v16 = TSUserInfoFlowTypeKey;
  v17 = [(NSMutableDictionary *)self->_options valueForKey:TSUserInfoFlowTypeKey];
  unsigned int v18 = [v17 intValue];

  if (v18 == 6)
  {
    [(TSSIMSetupSupportViewController *)self _presentDeviceInfoViewController];
    goto LABEL_7;
  }
  uint64_t v19 = [(NSMutableDictionary *)self->_options valueForKey:v16];
  unsigned int v20 = [v19 intValue];

  options = self->_options;
  if (v20 == 10)
  {
    uint64_t v22 = options;
    uint64_t v23 = TSUserInfoExternalizedContextKey;
    v24 = [(NSMutableDictionary *)v22 objectForKeyedSubscript:TSUserInfoExternalizedContextKey];

    if (v24)
    {
      uint64_t v25 = v22;
    }
    else
    {
      uint64_t v25 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_options mutableCopy];
      uint64_t v89 = 0;
      v90 = &v89;
      uint64_t v91 = 0x2050000000;
      v39 = (void *)qword_10002B8A8;
      uint64_t v92 = qword_10002B8A8;
      if (!qword_10002B8A8)
      {
        location[0] = _NSConcreteStackBlock;
        location[1] = (id)3221225472;
        location[2] = sub_1000126BC;
        location[3] = &unk_100020A10;
        location[4] = &v89;
        sub_1000126BC((uint64_t)location);
        v39 = (void *)v90[3];
      }
      uint64_t v40 = v39;
      _Block_object_dispose(&v89, 8);
      v41 = (LAContext *)objc_alloc_init(v40);
      laContext = self->_laContext;
      self->_laContext = v41;

      uint64_t v43 = [(LAContext *)self->_laContext externalizedContext];
      [(NSMutableDictionary *)v25 setObject:v43 forKeyedSubscript:v23];

      v44 = sub_100010734();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_100013B00(v44, v45, v46, v47, v48, v49, v50, v51);
      }
    }
    uint64_t v52 = +[TSSIMSetupFlow flowWithOptions:v25];
    setupFlow = self->_setupFlow;
    self->_setupFlow = v52;

    [(TSSIMSetupFlow *)self->_setupFlow setDelegate:self];
    objc_initWeak(location, self);
    v54 = self->_setupFlow;
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_100011844;
    v85[3] = &unk_1000208D8;
    v32 = &v87;
    objc_copyWeak(&v87, location);
    v86 = v7;
    [(TSSIMSetupFlow *)v54 firstViewController:v85];
    v33 = v86;
    goto LABEL_22;
  }
  v26 = [(NSMutableDictionary *)options valueForKey:v16];
  unsigned int v27 = [v26 intValue];

  uint64_t v28 = self->_options;
  if (v27 == 20)
  {
    uint64_t v25 = v28;
    v29 = +[TSSIMSetupFlow flowWithOptions:v25];
    v30 = self->_setupFlow;
    self->_setupFlow = v29;

    [(TSSIMSetupFlow *)self->_setupFlow setDelegate:self];
    objc_initWeak(location, self);
    uint64_t v31 = self->_setupFlow;
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_10001192C;
    v82[3] = &unk_1000208D8;
    v32 = &v84;
    objc_copyWeak(&v84, location);
    v83 = v7;
    [(TSSIMSetupFlow *)v31 firstViewController:v82];
    v33 = v83;
LABEL_22:

    objc_destroyWeak(v32);
    objc_destroyWeak(location);

    goto LABEL_23;
  }
  uint64_t v34 = [(NSMutableDictionary *)v28 valueForKey:v16];
  unsigned int v35 = [v34 intValue];

  if (v35 == 12)
  {
    v36 = +[TSSIMSetupFlow flowWithOptions:self->_options];
    uint64_t v37 = self->_setupFlow;
    self->_setupFlow = v36;

    [(TSSIMSetupFlow *)self->_setupFlow setDelegate:self];
    v38 = self->_setupFlow;
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_100011A14;
    v81[3] = &unk_1000209C0;
    v81[4] = self;
    [(TSSIMSetupFlow *)v38 firstViewController:v81];
    goto LABEL_7;
  }
  uint64_t v55 = [(NSMutableDictionary *)self->_options valueForKey:v16];
  unsigned int v56 = [v55 intValue];
  uint64_t v57 = TSFlowTypeActivationPolicyMismatch;

  if (v57 == v56)
  {
    [(TSSIMSetupSupportViewController *)self _presentPolicyRejectionViewController];
    goto LABEL_7;
  }
  uint64_t v58 = [(NSMutableDictionary *)self->_options valueForKey:v16];
  if ([v58 intValue] == 13) {
    goto LABEL_31;
  }
  v59 = [(NSMutableDictionary *)self->_options valueForKey:v16];
  if ([v59 intValue] == 3)
  {
LABEL_30:

LABEL_31:
LABEL_32:
    uint64_t v61 = +[TSSIMSetupFlow flowWithOptions:self->_options];
    v62 = self->_setupFlow;
    self->_setupFlow = v61;

    [(TSSIMSetupFlow *)self->_setupFlow setDelegate:self];
    v63 = self->_setupFlow;
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_100011A20;
    v79[3] = &unk_1000209E8;
    v79[4] = self;
    v80 = v7;
    [(TSSIMSetupFlow *)v63 firstViewController:v79];

    goto LABEL_23;
  }
  v60 = [(NSMutableDictionary *)self->_options valueForKey:v16];
  if ([v60 intValue] == 18)
  {

    goto LABEL_30;
  }
  uint64_t v64 = [(NSMutableDictionary *)self->_options valueForKey:v16];
  unsigned int v65 = [v64 intValue];

  if (v65 == 21) {
    goto LABEL_32;
  }
  v66 = +[TSSIMSetupFlow flowWithOptions:self->_options];
  uint64_t v67 = self->_setupFlow;
  self->_setupFlow = v66;

  [(TSSIMSetupFlow *)self->_setupFlow setDelegate:self];
  uint64_t v68 = [(TSSIMSetupFlow *)self->_setupFlow firstViewController];
  if (!v68)
  {
    v71 = sub_100010734();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
      sub_100013B78(v71, v72, v73, v74, v75, v76, v77, v78);
    }

    [(TSSIMSetupSupportViewController *)self _deactivate];
    goto LABEL_8;
  }
  v69 = (void *)v68;
  uint64_t v70 = [(NSMutableDictionary *)self->_options objectForKeyedSubscript:v16];
  -[TSSIMSetupSupportViewController _presentFirstController:isRemoteSignup:](self, "_presentFirstController:isRemoteSignup:", v69, [v70 intValue] == 7);

LABEL_7:
  [(TSScreenLockObserver *)self->_screenLockObserver registerForLockNotifications];
LABEL_8:
  v7->invoke(v7);
LABEL_23:
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)handleButtonActions:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100011B14;
  v3[3] = &unk_100020788;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  v5 = sub_100010734();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100013D60(a3, v5);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011C94;
  v6[3] = &unk_1000207B0;
  v6[4] = self;
  [(TSSIMSetupSupportViewController *)self dismissViewControllerWithTransition:7 completion:v6];
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_100010734();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = v3;
    __int16 v8 = 2080;
    uint64_t v9 = "-[TSSIMSetupSupportViewController setIdleTimerDisabled:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "set idle timer disabled : %d @%s", (uint8_t *)v7, 0x12u);
  }

  id v6 = [(TSSIMSetupSupportViewController *)self _remoteViewControllerProxy];
  [v6 setIdleTimerDisabled:v3 forReason:@"SIMSetupUIService"];
}

- (void)userDidTapCancel
{
  BOOL v3 = sub_100010734();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100013DF8(v3);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100011E78;
  v4[3] = &unk_1000207B0;
  v4[4] = self;
  [(TSSIMSetupSupportViewController *)self dismissViewControllerWithTransition:7 completion:v4];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)TSSIMSetupSupportViewController;
  [(TSSIMSetupSupportViewController *)&v8 viewDidLoad];
  BOOL v3 = +[UIColor systemBackgroundColor];
  v4 = [(TSSIMSetupSupportViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  id v6 = +[UINavigationBar appearance];
  [v6 _setHidesShadow:1];

  v7 = +[UINavigationBar appearance];
  [v7 setTranslucent:0];
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

- (void)_presentFirstController:(id)a3 isRemoteSignup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];

  [v11 setModalTransitionStyle:0];
  if (v4)
  {
    [v11 setOverrideUserInterfaceStyle:2];
    [v11 setModalPresentationStyle:1];
    v7 = [v11 navigationBar];
    BPSApplyStyleToNavBar();
  }
  else if (+[SSServiceUtilities isPad])
  {
    objc_super v8 = [v11 navigationItem];
    uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"Cellular Data Account" value:&stru_100020AC8 table:@"Localizable"];
    [v8 setTitle:v10];

    [v11 setModalPresentationStyle:2];
  }
  [(TSSIMSetupSupportViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)_presentPolicyRejectionViewController
{
  BOOL v3 = [(TSSIMSetupSupportViewController *)self presentedViewController];

  if (v3)
  {
    [(TSSIMSetupSupportViewController *)self _deactivate];
  }
  else
  {
    BOOL v4 = +[TSSIMSetupFlow flowWithOptions:self->_options];
    setupFlow = self->_setupFlow;
    self->_setupFlow = v4;

    [(TSSIMSetupFlow *)self->_setupFlow setDelegate:self];
    id v6 = self->_setupFlow;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_100012214;
    v7[3] = &unk_1000209C0;
    v7[4] = self;
    [(TSSIMSetupFlow *)v6 firstViewController:v7];
  }
}

- (void)_presentDeviceInfoViewController
{
  BOOL v3 = [(TSSIMSetupSupportViewController *)self presentedViewController];

  if (v3)
  {
    [(TSSIMSetupSupportViewController *)self _deactivate];
  }
  else
  {
    BOOL v4 = [[TSDeviceInfoViewController alloc] initWithOptions:self->_options];
    id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonTapped"];
    v7 = [v5 topViewController];
    objc_super v8 = [v7 navigationItem];
    [v8 setLeftBarButtonItem:v6 animated:0];

    uint64_t v9 = [v5 topViewController];
    uint64_t v10 = [v9 navigationController];
    id v11 = [v10 navigationBar];
    uint64_t v12 = +[UIColor systemBackgroundColor];
    [v11 setBackgroundColor:v12];

    [v5 setModalPresentationStyle:2];
    [v5 setModalTransitionStyle:0];
    [(TSSIMSetupSupportViewController *)self presentViewController:v5 animated:1 completion:0];
    ct_green_tea_logger_create();
    uint64_t v13 = getCTGreenTeaOsLogHandle();
    uint64_t v14 = v13;
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Displaying device information", v15, 2u);
    }

    ct_green_tea_logger_destroy();
  }
}

- (void)_deactivate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012518;
  block[3] = &unk_1000207B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_cancelButtonTapped
{
  [(TSSIMSetupSupportViewController *)self dismissViewControllerWithTransition:7 completion:0];

  [(TSSIMSetupSupportViewController *)self _deactivate];
}

- (void)screenLockDidUpdate:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:TSNotificationUserCanceled object:TSNotificationUserCanceledReason_ScreenLockEvent];

    [(TSSIMSetupSupportViewController *)self _cancelButtonTapped];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertMonitor, 0);
  objc_storeStrong((id *)&self->_screenLockObserver, 0);
  objc_storeStrong((id *)&self->_laContext, 0);
  objc_storeStrong((id *)&self->_pkNavigationController, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_setupFlow, 0);
}

@end