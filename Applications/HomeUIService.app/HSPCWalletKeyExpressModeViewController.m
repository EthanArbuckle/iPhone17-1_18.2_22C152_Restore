@interface HSPCWalletKeyExpressModeViewController
+ (id)_expresssModePassConflictError:(id)a3;
- (HMHomeWalletKeyDeviceState)walletKeyDeviceState;
- (HSPCWalletKeyExpressModeViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (HUIconView)iconImageView;
- (PRXAction)continueAction;
- (id)_addWalletKeyWithExpressMode;
- (id)_addWalletKeyWithiPhoneExpressModeOptions:(int64_t)a3 pairedWatchesExpressModeOptions:(int64_t)a4;
- (id)_addWalletKeyWithoutExpressMode;
- (id)_enableExpressModeButtonTapped;
- (id)_requireAuthenticationButtonTapped;
- (id)_shouldShowSingleContinueButton;
- (id)commitConfiguration;
- (id)dismissButtonBlock;
- (void)_enableExpressModeAfterAuthWithPromise:(id)a3;
- (void)_sendAnalytics:(unint64_t)a3;
- (void)_setAllowsAlertStacking:(BOOL)a3;
- (void)_updateHasOnboardedForWalletKey:(id)a3;
- (void)setConfig:(id)a3;
- (void)setContinueAction:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setWalletKeyDeviceState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HSPCWalletKeyExpressModeViewController

- (HSPCWalletKeyExpressModeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)HUIconView) initWithFrame:1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v27.receiver = self;
  v27.super_class = (Class)HSPCWalletKeyExpressModeViewController;
  v10 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v27, "initWithCenterContentView:size:", v9, 120.0, 132.0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_config, a4);
    objc_storeStrong((id *)&v11->_coordinator, a3);
    objc_storeStrong((id *)&v11->_iconImageView, v9);
    v12 = sub_100060C64(@"HSProximityCardWalletKeyExpressModeTapToUnlockTitle");
    [(HSPCWalletKeyExpressModeViewController *)v11 setTitle:v12];

    objc_initWeak(&location, v11);
    v13 = [v8 home];
    v14 = [v13 hf_fetchWalletKeyDeviceStateForCurrentDevice];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100025508;
    v24[3] = &unk_1000A9CC0;
    objc_copyWeak(&v25, &location);
    v15 = [v14 flatMap:v24];
    id v16 = [v15 recover:&stru_1000A9CE0];

    v17 = [v8 home];
    v18 = +[HFWalletUtilities walletKeyIconDescriptorForHome:v17 shouldUseKeyholeAsset:0 foriPhoneDevice:1];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100025990;
    v21[3] = &unk_1000A9D08;
    v22 = v11;
    id v23 = v9;
    id v19 = [v18 addCompletionBlock:v21];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCWalletKeyExpressModeViewController;
  [(HSPCWalletKeyExpressModeViewController *)&v4 viewDidAppear:a3];
  [(HSPCWalletKeyExpressModeViewController *)self _setAllowsAlertStacking:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCWalletKeyExpressModeViewController;
  [(HSPCWalletKeyExpressModeViewController *)&v4 viewWillDisappear:a3];
  [(HSPCWalletKeyExpressModeViewController *)self _setAllowsAlertStacking:0];
}

- (id)commitConfiguration
{
  objc_super v4 = [(HSPCWalletKeyExpressModeViewController *)self continueAction];

  if (v4)
  {
    v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSStringFromSelector(a2);
      int v9 = 138412546;
      v10 = self;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped Continue button", (uint8_t *)&v9, 0x16u);
    }
    [(HSPCWalletKeyExpressModeViewController *)self _sendAnalytics:2];
    [(HSPCWalletKeyExpressModeViewController *)self _updateHasOnboardedForWalletKey:0];
    id v7 = +[NAFuture futureWithResult:&off_1000B01A8];
  }
  else
  {
    id v7 = [(HSPCWalletKeyExpressModeViewController *)self _enableExpressModeButtonTapped];
  }

  return v7;
}

- (id)_enableExpressModeButtonTapped
{
  objc_super v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped Enable Express Mode button", buf, 0x16u);
  }
  [(HSPCWalletKeyExpressModeViewController *)self _sendAnalytics:0];
  v6 = [(HSPCWalletKeyExpressModeViewController *)self walletKeyDeviceState];
  id v7 = [v6 walletKey];
  unsigned int v8 = [v7 isExpressEnabled];

  if (v8)
  {
    int v9 = +[NAFuture futureWithResult:&off_1000B01A8];
  }
  else
  {
    v10 = [(HSPCWalletKeyExpressModeViewController *)self walletKeyDeviceState];
    __int16 v11 = [v10 walletKey];
    BOOL v12 = v11 == 0;

    v13 = [(HSPCWalletKeyExpressModeViewController *)self walletKeyDeviceState];
    v14 = [v13 expressEnablementConflictingPassDescription];

    if (v12)
    {
      if (v14)
      {
        objc_initWeak((id *)buf, self);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000260B0;
        v22[3] = &unk_1000A9D30;
        objc_copyWeak(&v24, (id *)buf);
        id v23 = v14;
        int v9 = +[NAFuture futureWithBlock:v22];

        objc_destroyWeak(&v24);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        int v9 = [(HSPCWalletKeyExpressModeViewController *)self _addWalletKeyWithExpressMode];
      }
    }
    else
    {
      objc_initWeak((id *)buf, self);
      if (v14)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100026278;
        v19[3] = &unk_1000A9D30;
        v15 = &v21;
        objc_copyWeak(&v21, (id *)buf);
        id v20 = v14;
        int v9 = +[NAFuture futureWithBlock:v19];
      }
      else
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000263D8;
        v17[3] = &unk_1000A9D58;
        v15 = &v18;
        objc_copyWeak(&v18, (id *)buf);
        int v9 = +[NAFuture futureWithBlock:v17];
      }
      objc_destroyWeak(v15);
      objc_destroyWeak((id *)buf);
    }
  }

  return v9;
}

- (void)_enableExpressModeAfterAuthWithPromise:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)LAContext);
  id v15 = 0;
  unsigned int v6 = [v5 canEvaluatePolicy:2 error:&v15];
  id v7 = v15;
  if (v6)
  {
    unsigned int v8 = sub_100060C64(@"HSProximityCardWalletKeyExpressModeTapToUnlock_ExpressModeAuthString");
    objc_initWeak((id *)location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100026678;
    v11[3] = &unk_1000A9DF8;
    objc_copyWeak(&v14, (id *)location);
    id v12 = v5;
    id v13 = v4;
    [v12 evaluatePolicy:2 localizedReason:v8 reply:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)location);
  }
  else
  {
    int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 138412802;
      *(void *)&location[4] = self;
      __int16 v17 = 2080;
      id v18 = "-[HSPCWalletKeyExpressModeViewController _enableExpressModeAfterAuthWithPromise:]";
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%@:%s) cannot local authenticate. error = %@", location, 0x20u);
    }

    if (v7)
    {
      v10 = +[HFErrorHandler sharedHandler];
      [v10 handleError:v7];
    }
    [v5 invalidate];
    [v4 finishWithResult:&off_1000B01C0];
  }
}

- (id)_requireAuthenticationButtonTapped
{
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    int v13 = 138412546;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped \"Require Authentication\" button", (uint8_t *)&v13, 0x16u);
  }
  [(HSPCWalletKeyExpressModeViewController *)self _sendAnalytics:1];
  unsigned int v6 = [(HSPCWalletKeyExpressModeViewController *)self walletKeyDeviceState];
  id v7 = [v6 walletKey];

  if (v7)
  {
    unsigned int v8 = [(HSPCWalletKeyExpressModeViewController *)self walletKeyDeviceState];
    int v9 = [v8 walletKey];
    v10 = [v9 UUID];
    [(HSPCWalletKeyExpressModeViewController *)self _updateHasOnboardedForWalletKey:v10];

    +[NAFuture futureWithResult:&off_1000B01A8];
  }
  else
  {
    [(HSPCWalletKeyExpressModeViewController *)self _addWalletKeyWithoutExpressMode];
  __int16 v11 = };

  return v11;
}

- (id)_shouldShowSingleContinueButton
{
  if (+[HFUtilities isAnIPad])
  {
    v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = self;
      __int16 v31 = 2080;
      v32 = "-[HSPCWalletKeyExpressModeViewController _shouldShowSingleContinueButton]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing single continue button for iPad", buf, 0x16u);
    }

    id v4 = +[NAFuture futureWithResult:&__kCFBooleanTrue];
  }
  else
  {
    id v5 = [(HSPCWalletKeyExpressModeViewController *)self config];
    unsigned int v6 = [v5 delegate];
    id v7 = [(HSPCWalletKeyExpressModeViewController *)self config];
    id v8 = [v6 stateMachineConfigurationGetLaunchReason:v7];

    if (v8)
    {
      id v9 = objc_alloc_init((Class)LAContext);
      id v28 = 0;
      unsigned __int8 v10 = [v9 canEvaluatePolicy:2 error:&v28];
      id v11 = v28;
      if (v10)
      {
        id v12 = [(HSPCWalletKeyExpressModeViewController *)self walletKeyDeviceState];
        int v13 = [v12 walletKey];
        id v14 = [v13 isExpressEnabled];

        __int16 v15 = HFLogForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          if (v14) {
            CFStringRef v16 = @"single continue button";
          }
          else {
            CFStringRef v16 = @"two buttons";
          }
          __int16 v17 = [(HSPCWalletKeyExpressModeViewController *)self walletKeyDeviceState];
          id v18 = [v17 walletKey];
          *(_DWORD *)buf = 138413058;
          v30 = self;
          __int16 v31 = 2080;
          v32 = "-[HSPCWalletKeyExpressModeViewController _shouldShowSingleContinueButton]";
          __int16 v33 = 2112;
          CFStringRef v34 = v16;
          __int16 v35 = 2112;
          CFStringRef v36 = v18;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing %@ because walletKeyState = %@", buf, 0x2Au);
        }
        __int16 v19 = +[NSNumber numberWithBool:v14];
        id v4 = +[NAFuture futureWithResult:v19];
      }
      else
      {
        v26 = HFLogForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v30 = self;
          __int16 v31 = 2080;
          v32 = "-[HSPCWalletKeyExpressModeViewController _shouldShowSingleContinueButton]";
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing single continue button because cannot do local authentication", buf, 0x16u);
        }

        id v4 = +[NAFuture futureWithResult:&__kCFBooleanTrue];
      }
    }
    else
    {
      id v20 = [(HSPCWalletKeyExpressModeViewController *)self walletKeyDeviceState];
      id v21 = [v20 walletKey];

      v22 = HFLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v23 = @"NO";
        if (v21) {
          CFStringRef v23 = @"YES";
        }
        *(_DWORD *)buf = 138413058;
        v30 = self;
        __int16 v31 = 2080;
        v32 = "-[HSPCWalletKeyExpressModeViewController _shouldShowSingleContinueButton]";
        __int16 v33 = 2112;
        CFStringRef v34 = v23;
        if (v21) {
          CFStringRef v24 = @"single continue button";
        }
        else {
          CFStringRef v24 = @"two buttons";
        }
        __int16 v35 = 2112;
        CFStringRef v36 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "(%@:%s) hasWalletKey is %@, so showing %@", buf, 0x2Au);
      }

      id v25 = +[NSNumber numberWithBool:v21 != 0];
      id v4 = +[NAFuture futureWithResult:v25];
    }
  }

  return v4;
}

- (id)_addWalletKeyWithExpressMode
{
  v3 = [(HSPCWalletKeyExpressModeViewController *)self config];
  id v4 = [v3 delegate];
  id v5 = [(HSPCWalletKeyExpressModeViewController *)self config];
  id v6 = [v4 stateMachineConfigurationGetLaunchReason:v5];

  if (v6) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 3;
  }

  return [(HSPCWalletKeyExpressModeViewController *)self _addWalletKeyWithiPhoneExpressModeOptions:3 pairedWatchesExpressModeOptions:v7];
}

- (id)_addWalletKeyWithoutExpressMode
{
  return [(HSPCWalletKeyExpressModeViewController *)self _addWalletKeyWithiPhoneExpressModeOptions:1 pairedWatchesExpressModeOptions:1];
}

- (id)_addWalletKeyWithiPhoneExpressModeOptions:(int64_t)a3 pairedWatchesExpressModeOptions:(int64_t)a4
{
  uint64_t v7 = [(HSPCWalletKeyExpressModeViewController *)self config];
  id v8 = [v7 home];
  [v8 hf_addWalletKeyWithOptions:a3];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002779C;
  v25[3] = &unk_1000A9E20;
  v25[4] = self;
  unsigned __int8 v10 = [v9 addCompletionBlock:v25];

  id v11 = [(HSPCWalletKeyExpressModeViewController *)self config];
  id v12 = [v11 home];
  int v13 = [v12 hf_addWalletKeyToPairedWatchesWithOptions:a4 | 1];
  id v14 = [v13 recoverIgnoringError];
  __int16 v15 = [v14 flatMap:&stru_1000A9E60];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000277BC;
  v23[3] = &unk_1000A9E88;
  id v16 = v15;
  id v24 = v16;
  __int16 v17 = [v10 flatMap:v23];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002789C;
  v21[3] = &unk_1000A90D8;
  id v22 = v16;
  id v18 = v16;
  __int16 v19 = [v17 recover:v21];

  return v19;
}

- (void)_updateHasOnboardedForWalletKey:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HSPCWalletKeyExpressModeViewController *)self config];
    uint64_t v7 = [v6 home];
    int v19 = 136315650;
    id v20 = "-[HSPCWalletKeyExpressModeViewController _updateHasOnboardedForWalletKey:]";
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Updating hasOnboarded for Wallet Key (%@) for home %@", (uint8_t *)&v19, 0x20u);
  }
  id v8 = [(HSPCWalletKeyExpressModeViewController *)self config];
  id v9 = [v8 home];
  id v10 = [v9 hf_setHasOnboardedForWalletKey];

  id v11 = objc_alloc((Class)HFUserItem);
  id v12 = [(HSPCWalletKeyExpressModeViewController *)self config];
  int v13 = [v12 home];
  id v14 = [(HSPCWalletKeyExpressModeViewController *)self config];
  __int16 v15 = [v14 home];
  id v16 = [v15 currentUser];
  id v17 = [v11 initWithHome:v13 user:v16 nameStyle:0];

  id v18 = [v17 setDismissWalletKeyExpressModeOnboarding:1 forWalletKeyUUID:v4];
}

- (void)_sendAnalytics:(unint64_t)a3
{
  id v6 = [(HSPCWalletKeyExpressModeViewController *)self config];
  uint64_t v7 = [v6 delegate];
  id v8 = [(HSPCWalletKeyExpressModeViewController *)self config];
  unint64_t v9 = (unint64_t)[v7 stateMachineConfigurationGetLaunchReason:v8];

  if (v9 > 8) {
    goto LABEL_4;
  }
  if (((1 << v9) & 0x1CC) != 0)
  {
    id v10 = NSStringFromSelector(a2);
    NSLog(@"Encountered unexpected launchReason while in %@: %ld", v10, v9);

LABEL_4:
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  uint64_t v12 = 2;
  if (v9 != 5) {
    uint64_t v12 = 0;
  }
  if (v9 == 4) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v12;
  }
LABEL_10:
  if (a3 >= 4) {
    NSLog(@"(%@:%s) express mode selection %lu is invalid", self, "-[HSPCWalletKeyExpressModeViewController _sendAnalytics:]", a3);
  }
  id v15 = (id)objc_opt_new();
  int v13 = +[NSNumber numberWithUnsignedInteger:a3];
  [v15 na_safeSetObject:v13 forKey:HFAnalyticsWalletKeyExpressModeSelectionKey];

  id v14 = +[NSNumber numberWithUnsignedInteger:v11];
  [v15 na_safeSetObject:v14 forKey:HFAnalyticsWalletKeyExpressModeLocationKey];

  +[HFAnalytics sendEvent:27 withData:v15];
}

- (id)dismissButtonBlock
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100027EAC;
  v4[3] = &unk_1000A90B0;
  v4[4] = self;
  v2 = objc_retainBlock(v4);

  return v2;
}

- (void)_setAllowsAlertStacking:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  id v5 = [(HSPCWalletKeyExpressModeViewController *)self coordinator];
  id v6 = [v5 delegate];
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 _remoteViewControllerProxy];

  [v9 setAllowsAlertStacking:v3];
}

+ (id)_expresssModePassConflictError:(id)a3
{
  uint64_t v14 = HFErrorHandlerOptionFailedItemNameKey;
  id v15 = a3;
  id v3 = a3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v5 = [v4 mutableCopy];

  v12[0] = HFErrorUserInfoOptionsKey;
  id v6 = [v5 copy];
  v12[1] = HFErrorUserInfoOperationTypeKey;
  v13[0] = v6;
  v13[1] = HFOperationAddWalletKey;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v8 = [v7 mutableCopy];

  id v9 = objc_alloc((Class)NSError);
  id v10 = [v9 initWithDomain:HFErrorDomain code:81 userInfo:v8];

  return v10;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (PRXAction)continueAction
{
  return self->_continueAction;
}

- (void)setContinueAction:(id)a3
{
}

- (HMHomeWalletKeyDeviceState)walletKeyDeviceState
{
  return self->_walletKeyDeviceState;
}

- (void)setWalletKeyDeviceState:(id)a3
{
}

- (HUIconView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_walletKeyDeviceState, 0);
  objc_storeStrong((id *)&self->_continueAction, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end