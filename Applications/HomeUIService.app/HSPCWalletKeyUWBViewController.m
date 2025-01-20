@interface HSPCWalletKeyUWBViewController
- (BOOL)_shouldIncludeTapToUnlock;
- (HMHomeWalletKeyDeviceState)walletKeyDeviceState;
- (HSPCWalletKeyUWBViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (PRXAction)continueAction;
- (UIImageView)door;
- (UIImageView)figureStand;
- (id)_addWalletKeyWithUWB;
- (id)_addWalletKeyWithiPhoneUWBOptions:(int64_t)a3 pairedWatchesUWBOptions:(int64_t)a4;
- (id)_addWalletKeyWithoutUWB;
- (id)_notNowTapped;
- (id)_shouldShowSingleContinueButton;
- (id)_turnOnUnlockOnApproach;
- (id)commitConfiguration;
- (id)dismissButtonBlock;
- (void)_enableUWBOfExistingWalletKeyAfterAuthWithPromise:(id)a3;
- (void)_setAllowsAlertStacking:(BOOL)a3;
- (void)_updateHasOnboardedForWalletKey:(id)a3;
- (void)setConfig:(id)a3;
- (void)setContinueAction:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDoor:(id)a3;
- (void)setFigureStand:(id)a3;
- (void)setWalletKeyDeviceState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HSPCWalletKeyUWBViewController

- (HSPCWalletKeyUWBViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v55 = a3;
  id v7 = a4;
  v8 = +[PRXImageView imageViewWithStyle:0];
  [v8 setContentMode:1];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setSemanticContentAttribute:3];
  v61.receiver = self;
  v61.super_class = (Class)HSPCWalletKeyUWBViewController;
  v9 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v61, "initWithCenterContentView:size:", v8, 200.0, 132.0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    uint64_t v11 = objc_opt_new();
    door = v10->_door;
    v10->_door = (UIImageView *)v11;

    v13 = +[UIColor lightGrayColor];
    v62[0] = v13;
    v14 = +[UIColor lightGrayColor];
    v62[1] = v14;
    v15 = +[NSArray arrayWithObjects:v62 count:2];
    v54 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v15];

    v16 = +[UIImage systemImageNamed:@"door.right.hand.closed"];
    v17 = [v16 imageByApplyingSymbolConfiguration:v54];
    [(UIImageView *)v10->_door setImage:v17];

    [(UIImageView *)v10->_door setContentMode:1];
    [(UIImageView *)v10->_door setSemanticContentAttribute:3];
    [v8 addSubview:v10->_door];
    v18 = [(UIImageView *)v10->_door centerYAnchor];
    v19 = [v8 centerYAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [(UIImageView *)v10->_door centerXAnchor];
    v22 = [v8 centerXAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    v24 = [(UIImageView *)v10->_door widthAnchor];
    v25 = [v8 widthAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [(UIImageView *)v10->_door heightAnchor];
    v28 = [v8 heightAnchor];
    v29 = [v27 constraintEqualToAnchor:v28 multiplier:0.85];
    [v29 setActive:1];

    [(UIImageView *)v10->_door setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v30 = objc_opt_new();
    figureStand = v10->_figureStand;
    v10->_figureStand = (UIImageView *)v30;

    v32 = +[UIImage systemImageNamed:@"figure.stand"];
    [(UIImageView *)v10->_figureStand setImage:v32];

    [(UIImageView *)v10->_figureStand setContentMode:1];
    v33 = v10->_figureStand;
    v34 = +[UIColor labelColor];
    [(UIImageView *)v33 setTintColor:v34];

    [v8 addSubview:v10->_figureStand];
    v35 = [(UIImageView *)v10->_figureStand centerXAnchor];
    v36 = [v8 centerXAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    [v37 setActive:1];

    v38 = [(UIImageView *)v10->_figureStand bottomAnchor];
    v39 = [v8 bottomAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    [v40 setActive:1];

    v41 = [(UIImageView *)v10->_figureStand widthAnchor];
    v42 = [v8 widthAnchor];
    v43 = [v41 constraintEqualToAnchor:v42 multiplier:0.5];
    [v43 setActive:1];

    v44 = [(UIImageView *)v10->_figureStand heightAnchor];
    v45 = [v8 heightAnchor];
    v46 = [v44 constraintEqualToAnchor:v45 multiplier:0.6];
    [v46 setActive:1];

    [(UIImageView *)v10->_figureStand setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 bringSubviewToFront:v10->_figureStand];
    v47 = sub_100060C64(@"HSProximityCardWalletKeyUWBLockTitle");
    [(HSPCWalletKeyUWBViewController *)v10 setTitle:v47];

    v48 = sub_100060C64(@"HSProximityCardWalletKeyUWBLockSubtitle");
    [(HSPCWalletKeyUWBViewController *)v10 setSubtitle:v48];

    objc_initWeak(&location, v10);
    v49 = [v7 home];
    v50 = [v49 hf_fetchWalletKeyDeviceStateForCurrentDevice];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100034048;
    v58[3] = &unk_1000A9CC0;
    objc_copyWeak(&v59, &location);
    v51 = [v50 flatMap:v58];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100034238;
    v56[3] = &unk_1000A90D8;
    v57 = v10;
    id v52 = [v51 recover:v56];

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);
  }
  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCWalletKeyUWBViewController;
  [(HSPCWalletKeyUWBViewController *)&v4 viewDidAppear:a3];
  [(HSPCWalletKeyUWBViewController *)self _setAllowsAlertStacking:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCWalletKeyUWBViewController;
  [(HSPCWalletKeyUWBViewController *)&v4 viewWillDisappear:a3];
  [(HSPCWalletKeyUWBViewController *)self _setAllowsAlertStacking:0];
}

- (id)commitConfiguration
{
  objc_super v4 = [(HSPCWalletKeyUWBViewController *)self continueAction];

  if (v4)
  {
    v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(id)objc_opt_class() description];
      id v7 = NSStringFromSelector(a2);
      int v10 = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped Continue button", (uint8_t *)&v10, 0x16u);
    }
    [(HSPCWalletKeyUWBViewController *)self _updateHasOnboardedForWalletKey:0];
    v8 = +[NAFuture futureWithResult:&off_1000B02F8];
  }
  else
  {
    v8 = [(HSPCWalletKeyUWBViewController *)self _turnOnUnlockOnApproach];
  }

  return v8;
}

- (id)_turnOnUnlockOnApproach
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2080;
    v24 = "-[HSPCWalletKeyUWBViewController _turnOnUnlockOnApproach]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped turn on unlock on approach button", buf, 0x16u);
  }

  objc_super v4 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
  v5 = [v4 walletKey];
  unsigned int v6 = [v5 isUWBUnlockEnabled];

  if (v6)
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
      *(_DWORD *)buf = 138412802;
      v22 = self;
      __int16 v23 = 2080;
      v24 = "-[HSPCWalletKeyUWBViewController _turnOnUnlockOnApproach]";
      __int16 v25 = 2112;
      v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Wallet key exists and UWB is enabled. Continuing to next prox card.\nDevice state = %@", buf, 0x20u);
    }
    uint64_t v9 = +[NAFuture futureWithResult:&off_1000B02F8];
LABEL_14:
    v16 = (void *)v9;
    goto LABEL_15;
  }
  int v10 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
  uint64_t v11 = [v10 walletKey];
  BOOL v12 = v11 == 0;

  v13 = HFLogForCategory();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v17 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
      *(_DWORD *)buf = 138412802;
      v22 = self;
      __int16 v23 = 2080;
      v24 = "-[HSPCWalletKeyUWBViewController _turnOnUnlockOnApproach]";
      __int16 v25 = 2112;
      v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(%@:%s) Wallet key does NOT exist.\nDevice state = %@", buf, 0x20u);
    }
    uint64_t v9 = [(HSPCWalletKeyUWBViewController *)self _addWalletKeyWithUWB];
    goto LABEL_14;
  }
  if (v14)
  {
    v15 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
    *(_DWORD *)buf = 138412802;
    v22 = self;
    __int16 v23 = 2080;
    v24 = "-[HSPCWalletKeyUWBViewController _turnOnUnlockOnApproach]";
    __int16 v25 = 2112;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(%@:%s) Wallet key exists, but UWB is NOT enabled. Enabling UBW of existing wallet key after auth.\nDevice state = %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000348B8;
  v19[3] = &unk_1000A9D58;
  objc_copyWeak(&v20, (id *)buf);
  v16 = +[NAFuture futureWithBlock:v19];
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
LABEL_15:

  return v16;
}

- (id)_notNowTapped
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(id)objc_opt_class() description];
    int v12 = 138412546;
    v13 = v4;
    __int16 v14 = 2080;
    v15 = "-[HSPCWalletKeyUWBViewController _notNowTapped]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped \"not now\" button", (uint8_t *)&v12, 0x16u);
  }
  v5 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
  unsigned int v6 = [v5 walletKey];

  if (v6)
  {
    id v7 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
    v8 = [v7 walletKey];
    uint64_t v9 = [v8 UUID];
    [(HSPCWalletKeyUWBViewController *)self _updateHasOnboardedForWalletKey:v9];
  }
  int v10 = +[NAFuture futureWithResult:&off_1000B02F8];

  return v10;
}

- (id)_shouldShowSingleContinueButton
{
  if (!+[HFUtilities isAnIPad])
  {
    if ((+[HFUtilities isInternalTest] & 1) == 0)
    {
      id v5 = objc_alloc_init((Class)LAContext);
      uint64_t v21 = 0;
      unsigned int v6 = [v5 canEvaluatePolicy:2 error:&v21];
      id v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v8 = @"Showing single continue button because cannot";
        if (v6) {
          CFStringRef v8 = @"This device can";
        }
        *(_DWORD *)buf = 136315394;
        __int16 v23 = (HSPCWalletKeyUWBViewController *)"-[HSPCWalletKeyUWBViewController _shouldShowSingleContinueButton]";
        __int16 v24 = 2112;
        __int16 v25 = (const char *)v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) %@ do local authentication.", buf, 0x16u);
      }

      if (!v6)
      {
        v19 = &__kCFBooleanTrue;
LABEL_19:
        objc_super v4 = +[NAFuture futureWithResult:v19];

        goto LABEL_20;
      }
    }
    uint64_t v9 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
    int v10 = [v9 walletKey];
    id v11 = [v10 isUWBUnlockEnabled];

    int v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v11) {
        CFStringRef v13 = @"single continue button";
      }
      else {
        CFStringRef v13 = @"two buttons";
      }
      __int16 v14 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
      v15 = [v14 walletKey];
      v16 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
      v17 = [v16 walletKey];
      unsigned int v18 = [v17 isUWBUnlockEnabled];
      *(_DWORD *)buf = 138413314;
      __int16 v23 = self;
      __int16 v24 = 2080;
      __int16 v25 = "-[HSPCWalletKeyUWBViewController _shouldShowSingleContinueButton]";
      __int16 v26 = 2112;
      CFStringRef v27 = v13;
      __int16 v28 = 2112;
      v29 = v15;
      __int16 v30 = 1024;
      unsigned int v31 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing %@ because walletKeyDeviceState.walletKey = %@. isUWBUnlockEnabled = %{BOOL}d", buf, 0x30u);
    }
    id v5 = +[NSNumber numberWithBool:v11];
    v19 = v5;
    goto LABEL_19;
  }
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v23 = self;
    __int16 v24 = 2080;
    __int16 v25 = "-[HSPCWalletKeyUWBViewController _shouldShowSingleContinueButton]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing single continue button for iPad", buf, 0x16u);
  }

  objc_super v4 = +[NAFuture futureWithResult:&__kCFBooleanTrue];
LABEL_20:

  return v4;
}

- (void)_setAllowsAlertStacking:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  id v5 = [(HSPCWalletKeyUWBViewController *)self coordinator];
  unsigned int v6 = [v5 delegate];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 _remoteViewControllerProxy];

  [v9 setAllowsAlertStacking:v3];
}

- (id)_addWalletKeyWithUWB
{
  if ([(HSPCWalletKeyUWBViewController *)self _shouldIncludeTapToUnlock]) {
    uint64_t v3 = 7;
  }
  else {
    uint64_t v3 = 5;
  }
  objc_super v4 = [(HSPCWalletKeyUWBViewController *)self config];
  id v5 = [v4 delegate];
  unsigned int v6 = [(HSPCWalletKeyUWBViewController *)self config];
  id v7 = [v5 stateMachineConfigurationGetLaunchReason:v6];

  if (v7) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v3;
  }

  return [(HSPCWalletKeyUWBViewController *)self _addWalletKeyWithiPhoneUWBOptions:v3 pairedWatchesUWBOptions:v8];
}

- (id)_addWalletKeyWithoutUWB
{
  return [(HSPCWalletKeyUWBViewController *)self _addWalletKeyWithiPhoneUWBOptions:1 pairedWatchesUWBOptions:1];
}

- (id)_addWalletKeyWithiPhoneUWBOptions:(int64_t)a3 pairedWatchesUWBOptions:(int64_t)a4
{
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(id)objc_opt_class() description];
    id v9 = HMHomeAddWalletKeyOptionsDescription();
    int v10 = HMHomeAddWalletKeyOptionsDescription();
    *(_DWORD *)buf = 138413058;
    unsigned int v31 = v8;
    __int16 v32 = 2080;
    v33 = "-[HSPCWalletKeyUWBViewController _addWalletKeyWithiPhoneUWBOptions:pairedWatchesUWBOptions:]";
    __int16 v34 = 2112;
    v35 = v9;
    __int16 v36 = 2112;
    v37 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) iPhone Wallet Key Options = %@. Paired Apple Watches Options = %@", buf, 0x2Au);
  }
  id v11 = [(HSPCWalletKeyUWBViewController *)self config];
  int v12 = [v11 home];
  CFStringRef v13 = [v12 hf_addWalletKeyWithOptions:a3];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10003523C;
  v29[3] = &unk_1000A9E20;
  v29[4] = self;
  __int16 v14 = [v13 addCompletionBlock:v29];

  v15 = [(HSPCWalletKeyUWBViewController *)self config];
  v16 = [v15 home];
  v17 = [v16 hf_addWalletKeyToPairedWatchesWithOptions:a4 | 1];
  unsigned int v18 = [v17 recoverIgnoringError];
  v19 = [v18 flatMap:&stru_1000AA598];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10003525C;
  v27[3] = &unk_1000A9840;
  v27[4] = self;
  id v20 = v19;
  id v28 = v20;
  uint64_t v21 = [v14 flatMap:v27];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100035360;
  v25[3] = &unk_1000AA5C0;
  v25[4] = self;
  id v26 = v20;
  id v22 = v20;
  __int16 v23 = [v21 recover:v25];

  return v23;
}

- (void)_enableUWBOfExistingWalletKeyAfterAuthWithPromise:(id)a3
{
  id v4 = a3;
  id v5 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
  unsigned int v6 = [v5 walletKey];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)LAContext);
    id v20 = 0;
    unsigned __int8 v8 = [v7 canEvaluatePolicy:2 error:&v20];
    id v9 = v20;
    if (v8)
    {
      int v10 = sub_100060C64(@"HSProximityCardWalletKeyUWB_AuthString");
      objc_initWeak((id *)location, self);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100035898;
      v16[3] = &unk_1000A9DF8;
      objc_copyWeak(&v19, (id *)location);
      id v17 = v7;
      id v18 = v4;
      [v17 evaluatePolicy:2 localizedReason:v10 reply:v16];

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)location);
    }
    else
    {
      __int16 v14 = HFLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(id)objc_opt_class() description];
        *(_DWORD *)id location = 138412802;
        *(void *)&location[4] = v15;
        __int16 v22 = 2080;
        __int16 v23 = "-[HSPCWalletKeyUWBViewController _enableUWBOfExistingWalletKeyAfterAuthWithPromise:]";
        __int16 v24 = 2112;
        id v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "(%@:%s) Cannot local authenticate. Error = %@", location, 0x20u);
      }
      [v4 finishWithResult:&off_1000B0310];
    }
  }
  else
  {
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(HSPCWalletKeyUWBViewController *)self config];
      CFStringRef v13 = [v12 home];
      *(_DWORD *)id location = 138412802;
      *(void *)&location[4] = self;
      __int16 v22 = 2080;
      __int16 v23 = "-[HSPCWalletKeyUWBViewController _enableUWBOfExistingWalletKeyAfterAuthWithPromise:]";
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%@:%s) wallet key does not exist for home %@.", location, 0x20u);
    }
    [v4 finishWithResult:&off_1000B02F8];
  }
}

- (void)_updateHasOnboardedForWalletKey:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(HSPCWalletKeyUWBViewController *)self config];
    id v7 = [v6 home];
    *(_DWORD *)buf = 136315650;
    v16 = "-[HSPCWalletKeyUWBViewController _updateHasOnboardedForWalletKey:]";
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Updating hasOnboarded for Wallet Key (%@) for home %@", buf, 0x20u);
  }
  unsigned __int8 v8 = [(HSPCWalletKeyUWBViewController *)self config];
  id v9 = [v8 home];
  id v10 = [v9 hf_setHasOnboardedForWalletKey];

  objc_initWeak((id *)buf, self);
  id v11 = [(HSPCWalletKeyUWBViewController *)self config];
  int v12 = [v11 home];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000362E0;
  v13[3] = &unk_1000A93E0;
  objc_copyWeak(&v14, (id *)buf);
  [v12 setDismissedWalletKeyUWBUnlockOnboardingWithCompletion:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (BOOL)_shouldIncludeTapToUnlock
{
  uint64_t v3 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
  id v4 = [v3 walletKey];

  if (v4)
  {
    id v5 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
    unsigned int v6 = [v5 walletKey];
    unsigned int v7 = [v6 isExpressEnabled];

    unsigned __int8 v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
      id v10 = [v9 walletKey];
      id v11 = [(HSPCWalletKeyUWBViewController *)self config];
      int v12 = [v11 home];
      uint64_t v13 = [v12 name];
      id v14 = (void *)v13;
      int v22 = 138413570;
      CFStringRef v15 = @"NOT";
      __int16 v23 = self;
      __int16 v24 = 2080;
      id v25 = "-[HSPCWalletKeyUWBViewController _shouldIncludeTapToUnlock]";
      if (v7) {
        CFStringRef v15 = &stru_1000ABBA8;
      }
      CFStringRef v16 = @"YES";
      __int16 v26 = 2112;
      CFStringRef v27 = v10;
      __int16 v28 = 2112;
      if (v7) {
        CFStringRef v16 = @"NO";
      }
      uint64_t v29 = v13;
      __int16 v30 = 2112;
      CFStringRef v31 = v15;
      __int16 v32 = 2112;
      CFStringRef v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%@:%s) Wallet key exists (%@) for home %@. Express is %@ enabled. Returning %@.", (uint8_t *)&v22, 0x3Eu);
    }
    return v7 ^ 1;
  }
  else
  {
    id v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = [(HSPCWalletKeyUWBViewController *)self config];
      id v20 = [v19 home];
      uint64_t v21 = [v20 name];
      int v22 = 138412802;
      __int16 v23 = self;
      __int16 v24 = 2080;
      id v25 = "-[HSPCWalletKeyUWBViewController _shouldIncludeTapToUnlock]";
      __int16 v26 = 2112;
      CFStringRef v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "(%@:%s) Wallet key does NOT exist for home %@. Including both UWB and NFC for this prox card.", (uint8_t *)&v22, 0x20u);
    }
    return 1;
  }
}

- (id)dismissButtonBlock
{
  uint64_t v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HSPCWalletKeyUWBViewController *)self walletKeyDeviceState];
    id v5 = [v4 walletKey];
    *(_DWORD *)buf = 138412802;
    id v10 = self;
    __int16 v11 = 2080;
    int v12 = "-[HSPCWalletKeyUWBViewController dismissButtonBlock]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%@:%s) User tapped dismiss button. walletKey = %@", buf, 0x20u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100036730;
  v8[3] = &unk_1000A90B0;
  v8[4] = self;
  unsigned int v6 = objc_retainBlock(v8);

  return v6;
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

- (UIImageView)figureStand
{
  return self->_figureStand;
}

- (void)setFigureStand:(id)a3
{
}

- (UIImageView)door
{
  return self->_door;
}

- (void)setDoor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_door, 0);
  objc_storeStrong((id *)&self->_figureStand, 0);
  objc_storeStrong((id *)&self->_walletKeyDeviceState, 0);
  objc_storeStrong((id *)&self->_continueAction, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end