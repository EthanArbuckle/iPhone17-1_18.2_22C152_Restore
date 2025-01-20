@interface FMDMagSafeSetupRemoteUIViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)isFMFAllowed;
- (BOOL)isFindMyAppInstalled;
- (BOOL)isFindMyEnabled;
- (BOOL)isLocked;
- (BOOL)isRestrictedSKU;
- (BOOL)launchedFromFindMyApp;
- (CLLocationManager)locationManager;
- (FMDCoreAccessoryManager)caAccessoryManager;
- (FMDMagSafeAccessory)magSafeAccessory;
- (FMDMagSafeProtocol)physicalAccessory;
- (FMDispatchTimer)showAttachScreenTimer;
- (FMDispatchTimer)timeoutTimer;
- (IXAppInstallCoordinator)appInstallCoordinator;
- (MKMapView)mapView;
- (MKPointAnnotation)deviceAnnotation;
- (MKPointAnnotation)userLocationAnnotation;
- (NSDictionary)launchContext;
- (NSString)mapDeviceImagePath;
- (NSString)presentingAccessorySerialNumber;
- (PRXCardContentViewController)presentedCard;
- (SBUIRemoteAlertHostInterface)remoteVCProxy;
- (SFClient)sharingClient;
- (id)_computeName;
- (id)featurePlatterView:(id)a3 backgrounColor:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)proxCardAddToDevice;
- (id)proxCardAlreadyAttached;
- (id)proxCardAttachAccessory;
- (id)proxCardLockedFindMyNotPaired;
- (id)proxCardNoAccount;
- (id)proxCardNonOwnerLockedDevice;
- (id)proxCardNonOwnerUnlocked;
- (id)proxCardNotImplemeted;
- (id)proxCardSetupComplete;
- (id)proxCardSetupError;
- (id)proxCardSetupFindmy;
- (id)proxCardSpinner;
- (id)proxCardUnlockedStartFlow;
- (id)proxCardUnsupportedAccessory;
- (id)proxCardUpgradeAccountSecurity;
- (id)proxCardUpgradeAccountSecurityError;
- (int)deviceLockState;
- (int)lockStateNotifyToken;
- (unint64_t)accountState;
- (unint64_t)magSafeState;
- (unint64_t)prevProxCardState;
- (unint64_t)proxCardState;
- (unint64_t)stateForAccessory:(id)a3;
- (void)_addAccessorytoDataStore:(id)a3;
- (void)_removeAccessoryToDataStoreWithID:(id)a3;
- (void)accessoryDidConnect:(id)a3;
- (void)accessoryDidDisconnect:(id)a3;
- (void)addDismissButtonAction:(id)a3;
- (void)addDynamicMapToCard:(id)a3;
- (void)addImagetoCard:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)continueWithAccountValidationFlow;
- (void)enableFindMyWithCompletion:(id)a3;
- (void)launchSettingsAppUpgradeFlow;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)postNotification:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)prepareForSetupFlowFor:(id)a3;
- (void)progressFlowWithState:(unint64_t)a3;
- (void)proxCardFlowDidDismiss;
- (void)proxCardFlowWillPresent;
- (void)setAppInstallCoordinator:(id)a3;
- (void)setCaAccessoryManager:(id)a3;
- (void)setDeviceAnnotation:(id)a3;
- (void)setDeviceLockState:(int)a3;
- (void)setLaunchContext:(id)a3;
- (void)setLaunchedFromFindMyApp:(BOOL)a3;
- (void)setLocationManager:(id)a3;
- (void)setLockStateNotifyToken:(int)a3;
- (void)setMagSafeAccessory:(id)a3;
- (void)setMagSafeState:(unint64_t)a3;
- (void)setMapDeviceImagePath:(id)a3;
- (void)setMapView:(id)a3;
- (void)setPhysicalAccessory:(id)a3;
- (void)setPresentedCard:(id)a3;
- (void)setPresentingAccessorySerialNumber:(id)a3;
- (void)setPrevProxCardState:(unint64_t)a3;
- (void)setProxCardState:(unint64_t)a3;
- (void)setRemoteVCProxy:(id)a3;
- (void)setSharingClient:(id)a3;
- (void)setShowAttachScreenTimer:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setUpFindMyWithCompletion:(id)a3;
- (void)setUserLocationAnnotation:(id)a3;
- (void)setupEnded;
- (void)storeAccessoryAsNotFindmyEnabled:(id)a3;
- (void)triggerFindMyAppInstallation;
- (void)upgradeAccountButtonPressedOn:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMDMagSafeSetupRemoteUIViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = [(FMDMagSafeSetupRemoteUIViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_100034718];
  [(FMDMagSafeSetupRemoteUIViewController *)self setRemoteVCProxy:v8];

  v9 = sub_100003338();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v6 userInfo];
    int v13 = 138412290;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "configContext = %@", (uint8_t *)&v13, 0xCu);
  }
  v11 = [(FMDMagSafeSetupRemoteUIViewController *)self remoteVCProxy];
  [v11 setReachabilityDisabled:1];

  v12 = [(FMDMagSafeSetupRemoteUIViewController *)self remoteVCProxy];
  [v12 setAllowsAlertStacking:1];

  if (v7) {
    v7[2](v7);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = a3;
  v8 = [(FMDMagSafeSetupRemoteUIViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_100034738];
  [(FMDMagSafeSetupRemoteUIViewController *)self setRemoteVCProxy:v8];

  v9 = [v7 userInfo];

  v10 = [v9 objectForKeyedSubscript:@"FMLaunchContext"];
  [(FMDMagSafeSetupRemoteUIViewController *)self setLaunchContext:v10];

  v11 = [(FMDMagSafeSetupRemoteUIViewController *)self launchContext];
  v12 = [v11 objectForKeyedSubscript:@"launchedFromFindMyApp"];
  -[FMDMagSafeSetupRemoteUIViewController setLaunchedFromFindMyApp:](self, "setLaunchedFromFindMyApp:", [v12 BOOLValue]);

  int v13 = sub_100003338();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(FMDMagSafeSetupRemoteUIViewController *)self launchContext];
    int v15 = 138412290;
    v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "launchContext = %@", (uint8_t *)&v15, 0xCu);
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)FMDMagSafeSetupRemoteUIViewController;
  [(FMDMagSafeSetupRemoteUIViewController *)&v14 viewWillAppear:a3];
  v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[FMDMagSafeSetupRemoteUIViewController viewWillAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "alert %s", buf, 0xCu);
  }

  [(FMDMagSafeSetupRemoteUIViewController *)self setLockStateNotifyToken:0xFFFFFFFFLL];
  [(FMDMagSafeSetupRemoteUIViewController *)self setProxCardState:0];
  [(FMDMagSafeSetupRemoteUIViewController *)self setPrevProxCardState:0];
  unsigned int v5 = [(FMDMagSafeSetupRemoteUIViewController *)self launchedFromFindMyApp];
  id v6 = objc_alloc((Class)FMDispatchTimer);
  if (v5)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100005368;
    v13[3] = &unk_100034760;
    v13[4] = self;
    id v7 = [v6 initWithQueue:&_dispatch_main_q timeout:v13 completion:0.01];
    [(FMDMagSafeSetupRemoteUIViewController *)self setShowAttachScreenTimer:v7];

    v8 = [(FMDMagSafeSetupRemoteUIViewController *)self showAttachScreenTimer];
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000053E0;
    v12[3] = &unk_100034760;
    v12[4] = self;
    id v9 = [v6 initWithQueue:&_dispatch_main_q timeout:v12 completion:10.0];
    [(FMDMagSafeSetupRemoteUIViewController *)self setTimeoutTimer:v9];

    v8 = [(FMDMagSafeSetupRemoteUIViewController *)self timeoutTimer];
  }
  v10 = v8;
  [v8 start];

  v11 = [[FMDCoreAccessoryManager alloc] initWithDelegate:self];
  [(FMDMagSafeSetupRemoteUIViewController *)self setCaAccessoryManager:v11];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)FMDMagSafeSetupRemoteUIViewController;
  [(FMDMagSafeSetupRemoteUIViewController *)&v3 viewDidLoad];
  v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v5 = "-[FMDMagSafeSetupRemoteUIViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "alert %s", buf, 0xCu);
  }
}

+ (BOOL)_isSecureForRemoteViewService
{
  v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    unsigned int v5 = "+[FMDMagSafeSetupRemoteUIViewController _isSecureForRemoteViewService]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "alert %s", (uint8_t *)&v4, 0xCu);
  }

  return 1;
}

- (BOOL)_canShowWhileLocked
{
  v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    unsigned int v5 = "-[FMDMagSafeSetupRemoteUIViewController _canShowWhileLocked]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "alert %s", (uint8_t *)&v4, 0xCu);
  }

  return 1;
}

- (void)proxCardFlowWillPresent
{
  v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "presenting magSafe setup card", v3, 2u);
  }
}

- (void)proxCardFlowDidDismiss
{
  objc_super v3 = sub_100003338();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDMagSafeSetupRemoteUIViewController: proxCardFlowDidDismiss get called", v6, 2u);
  }

  int v4 = [(FMDMagSafeSetupRemoteUIViewController *)self locationManager];

  if (v4)
  {
    unsigned int v5 = [(FMDMagSafeSetupRemoteUIViewController *)self locationManager];
    [v5 stopUpdatingLocation];

    [(FMDMagSafeSetupRemoteUIViewController *)self setLocationManager:0];
  }
  [(FMDMagSafeSetupRemoteUIViewController *)self setupEnded];
}

- (void)setupEnded
{
  objc_super v3 = sub_100003338();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDMagSafeSetupRemoteUIViewController: setupEnded get called", buf, 2u);
  }

  [(FMDMagSafeSetupRemoteUIViewController *)self setCaAccessoryManager:0];
  [(FMDMagSafeSetupRemoteUIViewController *)self setPhysicalAccessory:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005864;
  block[3] = &unk_100034760;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)accessoryDidConnect:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FMDMagSafeSetupRemoteUIViewController *)self launchContext];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"serialNumber"];
  if (v6)
  {
    id v7 = (void *)v6;
    v8 = [(FMDMagSafeSetupRemoteUIViewController *)self launchContext];
    id v9 = [v8 objectForKeyedSubscript:@"serialNumber"];
    unsigned int v10 = [v4 isEqualToString:v9];

    if (!v10) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  v11 = sub_100003338();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v67 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "magsafe accessory with serial number %@ connected", buf, 0xCu);
  }

  v12 = [(FMDMagSafeSetupRemoteUIViewController *)self timeoutTimer];

  if (v12)
  {
    int v13 = [(FMDMagSafeSetupRemoteUIViewController *)self timeoutTimer];
    [v13 cancel];

    [(FMDMagSafeSetupRemoteUIViewController *)self setTimeoutTimer:0];
  }
  objc_super v14 = [(FMDMagSafeSetupRemoteUIViewController *)self showAttachScreenTimer];

  if (v14)
  {
    int v15 = [(FMDMagSafeSetupRemoteUIViewController *)self showAttachScreenTimer];
    [v15 cancel];

    [(FMDMagSafeSetupRemoteUIViewController *)self setShowAttachScreenTimer:0];
  }
  v16 = [(FMDMagSafeSetupRemoteUIViewController *)self presentingAccessorySerialNumber];

  if (v16)
  {
    v17 = [(FMDMagSafeSetupRemoteUIViewController *)self presentingAccessorySerialNumber];
    unsigned int v18 = [v17 isEqualToString:v4];

    v19 = sub_100003338();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20) {
        sub_10001EB34();
      }
    }
    else if (v20)
    {
      sub_10001EB68();
    }
    goto LABEL_41;
  }
  [(FMDMagSafeSetupRemoteUIViewController *)self setPresentingAccessorySerialNumber:v4];
  v21 = [(FMDMagSafeSetupRemoteUIViewController *)self caAccessoryManager];
  v22 = [v21 accessoryRawInfo];
  v23 = [v22 allValues];
  v19 = [v23 firstObject];

  if (v4)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v24 = [(FMDMagSafeSetupRemoteUIViewController *)self caAccessoryManager];
    v25 = [v24 accessoryRawInfo];
    v26 = [v25 allValues];

    id v27 = [v26 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v62;
      while (2)
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v62 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          v32 = [v31 serialNumber];
          unsigned int v33 = [v32 isEqualToString:v4];

          if (v33)
          {
            v34 = v31;

            v19 = v34;
            goto LABEL_28;
          }
        }
        id v28 = [v26 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
LABEL_28:
  }
  v35 = [(FMDMagSafeSetupRemoteUIViewController *)self launchContext];
  uint64_t v36 = [v35 objectForKeyedSubscript:@"serialNumber"];
  if (!v36) {
    goto LABEL_36;
  }
  v37 = (void *)v36;
  v38 = [v19 serialNumber];
  v39 = [(FMDMagSafeSetupRemoteUIViewController *)self launchContext];
  v40 = [v39 objectForKeyedSubscript:@"serialNumber"];
  if (![v38 isEqualToString:v40])
  {
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
  v41 = [(FMDMagSafeSetupRemoteUIViewController *)self launchContext];
  uint64_t v42 = [v41 objectForKeyedSubscript:@"isNVMSetup"];
  if (!v42)
  {

    goto LABEL_35;
  }
  v43 = (void *)v42;
  v56 = [(FMDMagSafeSetupRemoteUIViewController *)self launchContext];
  v57 = v41;
  v44 = [v56 objectForKeyedSubscript:@"keysAvailable"];

  if (!v44)
  {
LABEL_37:
    v54 = sub_100010114();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "launching spinner", buf, 2u);
    }

    [(FMDMagSafeSetupRemoteUIViewController *)self progressFlowWithState:14];
    v55 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006024;
    block[3] = &unk_100034838;
    v59 = v19;
    v60 = self;
    dispatch_async(v55, block);

    v53 = v59;
    goto LABEL_40;
  }
  v45 = [(FMDMagSafeSetupRemoteUIViewController *)self launchContext];
  v46 = [v45 objectForKeyedSubscript:@"isNVMSetup"];
  -[NSObject setIsNVMSetup:](v19, "setIsNVMSetup:", [v46 BOOLValue]);

  v47 = [(FMDMagSafeSetupRemoteUIViewController *)self launchContext];
  v48 = [v47 objectForKeyedSubscript:@"keysAvailable"];
  -[NSObject setKeysAvailable:](v19, "setKeysAvailable:", [v48 BOOLValue]);

  v49 = [(FMDMagSafeSetupRemoteUIViewController *)self launchContext];
  v50 = [v49 objectForKeyedSubscript:@"phoneNumber"];
  [v19 setPhoneNumber:v50];

  v51 = [(FMDMagSafeSetupRemoteUIViewController *)self launchContext];
  v52 = [v51 objectForKeyedSubscript:@"email"];
  [v19 setEmail:v52];

  [(FMDMagSafeSetupRemoteUIViewController *)self setPhysicalAccessory:v19];
  v53 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  [(FMDMagSafeSetupRemoteUIViewController *)self prepareForSetupFlowFor:v53];
LABEL_40:

LABEL_41:
LABEL_42:
}

- (void)accessoryDidDisconnect:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100010114();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "accessory with serialNumber %@ disconnected", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v6 = [(FMDMagSafeSetupRemoteUIViewController *)self presentingAccessorySerialNumber];
  if (!v6
    || (id v7 = (void *)v6,
        -[FMDMagSafeSetupRemoteUIViewController presentingAccessorySerialNumber](self, "presentingAccessorySerialNumber"), v8 = objc_claimAutoreleasedReturnValue(), unsigned int v9 = [v8 isEqualToString:v4], v8, v7, v9))
  {
    [(FMDMagSafeSetupRemoteUIViewController *)self setPresentingAccessorySerialNumber:0];
    [(FMDMagSafeSetupRemoteUIViewController *)self setupEnded];
  }
}

- (void)prepareForSetupFlowFor:(id)a3
{
  id v4 = a3;
  [(FMDMagSafeSetupRemoteUIViewController *)self setDeviceLockState:MKBGetDeviceLockState()];
  unsigned int v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v28) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "initialising prepareForSetupFlowFor", (uint8_t *)&v28, 2u);
  }

  [(FMDMagSafeSetupRemoteUIViewController *)self setMagSafeState:[(FMDMagSafeSetupRemoteUIViewController *)self stateForAccessory:v4]];
  if ((id)[(FMDMagSafeSetupRemoteUIViewController *)self magSafeState] == (id)3)
  {
    uint64_t v6 = +[FMDMagSafeDataStore sharedInstance];
    id v7 = [v6 readAllAccessoriesFromDisk];

    v8 = [v4 serialNumber];
    unsigned int v9 = +[FMDExtHelper deviceIDFromAddress:v8];

    uint64_t v10 = [v7 objectForKeyedSubscript:v9];
    if (!v10
      || (id v11 = (void *)v10,
          [v7 objectForKeyedSubscript:v9],
          v12 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v13 = [v12 findMyEnabled],
          v12,
          v11,
          (v13 & 1) == 0))
    {
      [(FMDMagSafeSetupRemoteUIViewController *)self _addAccessorytoDataStore:v4];
    }
    [(FMDMagSafeSetupRemoteUIViewController *)self postNotification:@"com.apple.icloud.findmydeviced.findkit.magSafe.added"];
  }
  objc_super v14 = sub_100003338();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = [(FMDMagSafeSetupRemoteUIViewController *)self deviceLockState];
    unint64_t v16 = [(FMDMagSafeSetupRemoteUIViewController *)self magSafeState];
    int v28 = 67109632;
    unsigned int v29 = v15;
    __int16 v30 = 2048;
    unint64_t v31 = v16;
    __int16 v32 = 2048;
    uint64_t v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Device lock state = %d magSafeState = %lu proxCardState = %lu", (uint8_t *)&v28, 0x1Cu);
  }

  if ([(FMDMagSafeSetupRemoteUIViewController *)self launchedFromFindMyApp])
  {
    if ((id)[(FMDMagSafeSetupRemoteUIViewController *)self magSafeState] == (id)3)
    {
      v17 = self;
      uint64_t v18 = 2;
LABEL_35:
      [(FMDMagSafeSetupRemoteUIViewController *)v17 progressFlowWithState:v18];
      goto LABEL_36;
    }
    if ((id)[(FMDMagSafeSetupRemoteUIViewController *)self magSafeState] == (id)6)
    {
LABEL_14:
      v17 = self;
      uint64_t v18 = 3;
      goto LABEL_35;
    }
    if ((id)[(FMDMagSafeSetupRemoteUIViewController *)self magSafeState] == (id)5)
    {
      [(FMDMagSafeSetupRemoteUIViewController *)self setMagSafeState:1];
    }
    else if (![(FMDMagSafeSetupRemoteUIViewController *)self magSafeState])
    {
      id v27 = sub_100003338();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10001ECC0();
      }

      goto LABEL_14;
    }
  }
  if ((id)[(FMDMagSafeSetupRemoteUIViewController *)self magSafeState] != (id)3
    && [(FMDMagSafeSetupRemoteUIViewController *)self magSafeState]
    && (id)[(FMDMagSafeSetupRemoteUIViewController *)self magSafeState] != (id)5
    && (id)[(FMDMagSafeSetupRemoteUIViewController *)self magSafeState] != (id)6)
  {
    BOOL v20 = sub_100003338();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v21 = [(FMDMagSafeSetupRemoteUIViewController *)self deviceLockState];
      unint64_t v22 = [(FMDMagSafeSetupRemoteUIViewController *)self magSafeState];
      int v28 = 67109632;
      unsigned int v29 = v21;
      __int16 v30 = 2048;
      unint64_t v31 = v22;
      __int16 v32 = 2048;
      uint64_t v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Device lock state = %d magSafeState = %lu proxCardState = %lu", (uint8_t *)&v28, 0x1Cu);
    }

    if ([(FMDMagSafeSetupRemoteUIViewController *)self deviceLockState] == 1
      || [(FMDMagSafeSetupRemoteUIViewController *)self deviceLockState] == 2)
    {
      if ((id)[(FMDMagSafeSetupRemoteUIViewController *)self magSafeState] == (id)2) {
        uint64_t v23 = 9;
      }
      else {
        uint64_t v23 = 4;
      }
    }
    else if ((id)[(FMDMagSafeSetupRemoteUIViewController *)self magSafeState] == (id)2)
    {
      uint64_t v23 = 10;
    }
    else if ((id)[(FMDMagSafeSetupRemoteUIViewController *)self magSafeState] == (id)1)
    {
      uint64_t v23 = 5;
    }
    else if ((id)[(FMDMagSafeSetupRemoteUIViewController *)self magSafeState] == (id)4)
    {
      uint64_t v23 = 6;
    }
    else
    {
      uint64_t v23 = 0;
    }
    v24 = sub_100003338();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v25 = [(FMDMagSafeSetupRemoteUIViewController *)self deviceLockState];
      unint64_t v26 = [(FMDMagSafeSetupRemoteUIViewController *)self magSafeState];
      int v28 = 67109632;
      unsigned int v29 = v25;
      __int16 v30 = 2048;
      unint64_t v31 = v26;
      __int16 v32 = 2048;
      uint64_t v33 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Device lock state = %d magSafeState = %lu proxCardState = %lu", (uint8_t *)&v28, 0x1Cu);
    }

    v17 = self;
    uint64_t v18 = v23;
    goto LABEL_35;
  }
  v19 = sub_100003338();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10001EC38(self, v19);
  }

  [(FMDMagSafeSetupRemoteUIViewController *)self setupEnded];
LABEL_36:
}

- (unint64_t)stateForAccessory:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  unsigned int v5 = +[FMDAccessoryTypeValidator sharedInstance];
  uint64_t v6 = [v4 accessoryType];
  if (![v5 isAllowedAccessoryWithType:v6])
  {

    goto LABEL_10;
  }
  unsigned __int8 v7 = [v4 isMF4i];

  if ((v7 & 1) == 0)
  {
LABEL_10:
    unint64_t v10 = 6;
    goto LABEL_11;
  }
  unsigned int v8 = [v4 isNVMSetup];
  unsigned int v9 = [v4 keysAvailable];
  if (v8)
  {
    if (v9) {
      unint64_t v10 = 3;
    }
    else {
      unint64_t v10 = 2;
    }
  }
  else
  {
    v12 = +[FMDMagSafeDataStore sharedInstance];
    unsigned __int8 v13 = [v12 readAllAccessoriesFromDisk];

    objc_super v14 = [v4 serialNumber];
    unsigned int v15 = +[FMDExtHelper deviceIDFromAddress:v14];

    unint64_t v16 = [v13 objectForKeyedSubscript:v15];

    if (v16)
    {
      v17 = [v13 objectForKeyedSubscript:v15];
      unsigned int v18 = [v17 findMyEnabled];

      if (v18)
      {
        [(FMDMagSafeSetupRemoteUIViewController *)self _removeAccessoryToDataStoreWithID:v15];
        unint64_t v10 = 0;
      }
      else
      {
        unint64_t v10 = 5;
      }
    }
    else
    {
      unint64_t v10 = 1;
    }
  }
LABEL_11:

  return v10;
}

- (void)_removeAccessoryToDataStoreWithID:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  unsigned int v5 = +[FMDMagSafeDataStore sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007338;
  v8[3] = &unk_100034860;
  unsigned int v9 = v4;
  uint64_t v6 = v4;
  [v5 removeAccessoryWithId:v3 withCompletion:v8];

  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v6, v7);
}

- (void)_addAccessorytoDataStore:(id)a3
{
  id v4 = a3;
  unsigned int v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  uint64_t v25 = 0;
  unint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  int v28 = sub_1000076F4;
  unsigned int v29 = sub_100007704;
  id v30 = 0;
  uint64_t v6 = [v4 name];

  if (!v6)
  {
    dispatch_time_t v7 = [(FMDMagSafeSetupRemoteUIViewController *)self _computeName];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000770C;
    v22[3] = &unk_100034888;
    v24 = &v25;
    uint64_t v23 = v5;
    [v4 setName:v7 withCompletion:v22];
  }
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  intptr_t v9 = dispatch_group_wait(v5, v8);
  if (v26[5]) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (v10)
  {
    v12 = [[FMDMagSafeAccessory alloc] initWithPhysicalAccessory:v4 fmEnabled:1];
    [(FMDMagSafeSetupRemoteUIViewController *)self setMagSafeAccessory:v12];

    dispatch_group_enter(v5);
    unsigned __int8 v13 = +[FMDMagSafeDataStore sharedInstance];
    objc_super v14 = [(FMDMagSafeSetupRemoteUIViewController *)self magSafeAccessory];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000077E8;
    v19[3] = &unk_100034888;
    unsigned int v21 = &v25;
    unsigned int v15 = v5;
    BOOL v20 = v15;
    [v13 addAccessory:v14 withCompletion:v19];

    dispatch_time_t v16 = dispatch_time(0, 1000000000);
    intptr_t v17 = dispatch_group_wait(v15, v16);
    if (v26[5] || v17)
    {
      unsigned int v18 = sub_100003338();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10001ED5C();
      }
    }
    id v11 = v20;
  }
  else
  {
    id v11 = sub_100003338();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001ECF4();
    }
  }

  _Block_object_dispose(&v25, 8);
}

- (void)progressFlowWithState:(unint64_t)a3
{
  unsigned int v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "flow with state = %lu", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000079CC;
  v6[3] = &unk_1000348B0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (id)proxCardUnlockedStartFlow
{
  id v3 = [FMDRemoteAsset alloc];
  id v4 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  unsigned int v5 = [v4 accessoryType];
  uint64_t v6 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  dispatch_time_t v7 = [v6 style];
  uint64_t v33 = [(FMDRemoteAsset *)v3 initWithAccessoryType:v5 style:v7 type:0];

  unint64_t v8 = [FMDRemoteAsset alloc];
  intptr_t v9 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  BOOL v10 = [v9 accessoryType];
  id v11 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  v12 = [v11 style];
  unsigned __int8 v13 = [(FMDRemoteAsset *)v8 initWithAccessoryType:v10 style:v12 type:1];

  objc_super v14 = [(FMDRemoteAsset *)v33 getStoredAssetLocation];
  uint64_t v15 = [(FMDRemoteAsset *)v13 getStoredAssetLocation];
  dispatch_time_t v16 = (void *)v15;
  if (v14) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  v19 = sub_100010114();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412546;
      v37 = v14;
      __int16 v38 = 2112;
      v39 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "using video = %@ and adjustmensts = %@", buf, 0x16u);
    }

    unsigned int v21 = +[NSURL fileURLWithPath:v14];
    unint64_t v22 = +[NSURL fileURLWithPath:v16];
  }
  else
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "using default video", buf, 2u);
    }

    uint64_t v23 = +[NSBundle mainBundle];
    unsigned int v21 = [v23 URLForResource:@"wallet1-pairing-video.mov" withExtension:0];

    v24 = +[NSBundle mainBundle];
    unint64_t v22 = [v24 URLForResource:@"wallet1-pairing-video-adjustments.plist" withExtension:0];
  }
  uint64_t v25 = -[FMDMovieProxCardViewController initWithMovieURL:adjustmentsURL:movieDimensions:productHeight:]([FMDMovieProxCardViewController alloc], "initWithMovieURL:adjustmentsURL:movieDimensions:productHeight:", v21, v22, 176.0, 304.0, 176.0);
  unint64_t v26 = +[NSBundle mainBundle];
  uint64_t v27 = [v26 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ACCESSORY_TITLE" value:&stru_100036130 table:0];
  [(FMDMovieProxCardViewController *)v25 setTitle:v27];

  [(FMDMovieProxCardViewController *)v25 setDismissalType:3];
  objc_initWeak((id *)buf, self);
  int v28 = +[NSBundle mainBundle];
  unsigned int v29 = [v28 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_CONTINUE" value:&stru_100036130 table:0];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100008140;
  v34[3] = &unk_1000348D8;
  objc_copyWeak(&v35, (id *)buf);
  id v30 = +[PRXAction actionWithTitle:v29 style:0 handler:v34];
  id v31 = [(FMDMovieProxCardViewController *)v25 addAction:v30];

  objc_destroyWeak(&v35);
  objc_destroyWeak((id *)buf);

  return v25;
}

- (void)continueWithAccountValidationFlow
{
  unint64_t v3 = [(FMDMagSafeSetupRemoteUIViewController *)self accountState];
  if (v3 <= 3)
  {
    uint64_t v4 = qword_100025D78[v3];
    [(FMDMagSafeSetupRemoteUIViewController *)self progressFlowWithState:v4];
  }
}

- (void)setUpFindMyWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000082D0;
  v7[3] = &unk_100034970;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)storeAccessoryAsNotFindmyEnabled:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [FMDMagSafeAccessory alloc];
  id v6 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  dispatch_time_t v7 = [(FMDMagSafeAccessory *)v5 initWithPhysicalAccessory:v6 fmEnabled:0];
  [(FMDMagSafeSetupRemoteUIViewController *)self setMagSafeAccessory:v7];

  id v9 = +[FMDMagSafeDataStore sharedInstance];
  id v8 = [(FMDMagSafeSetupRemoteUIViewController *)self magSafeAccessory];
  [v9 addAccessory:v8 withCompletion:v4];
}

- (id)_computeName
{
  id v2 = objc_alloc_init((Class)ACAccountStore);
  unint64_t v3 = [v2 aa_primaryAppleAccount];
  id v4 = [v3 aa_firstName];
  unsigned int v5 = [v3 aa_lastName];
  id v6 = +[NSBundle mainBundle];
  dispatch_time_t v7 = [v6 localizedStringForKey:@"MAGSAFE_PAIRING_WALLET_NAME_PATTERN" value:&stru_100036130 table:0];

  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"MAGSAFE_PAIRING_WALLET_DEFAULT_NAME" value:&stru_100036130 table:0];

  BOOL v10 = sub_100003338();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10001EED4();
  }

  if ([v7 containsString:@"<firstName>"])
  {
    if (!v4) {
      goto LABEL_10;
    }
    uint64_t v11 = [v7 stringByReplacingOccurrencesOfString:@"<firstName>" withString:v4];

    dispatch_time_t v7 = (void *)v11;
  }
  if (![v7 containsString:@"<lastName>"])
  {
    v12 = v7;
    goto LABEL_11;
  }
  if (v5)
  {
    v12 = [v7 stringByReplacingOccurrencesOfString:@"<lastName>" withString:v5];

    dispatch_time_t v7 = v12;
    goto LABEL_11;
  }
LABEL_10:
  v12 = v9;
LABEL_11:
  id v13 = v12;

  return v13;
}

- (id)proxCardAttachAccessory
{
  id v3 = objc_alloc_init((Class)PRXIconContentViewController);
  id v4 = +[NSBundle mainBundle];
  unsigned int v5 = [v4 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ATTACH_WALLET_TITLE" value:&stru_100036130 table:0];
  [v3 setTitle:v5];

  id v6 = +[NSBundle mainBundle];
  dispatch_time_t v7 = [v6 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ATTACH_WALLET_MESSAGE" value:&stru_100036130 table:0];
  [v3 setSubtitle:v7];

  [v3 setDismissalType:3];
  id v8 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleLargeTitle scale:3];
  id v9 = +[UIImage systemImageNamed:@"plus.circle.fill" withConfiguration:v8];
  unint64_t v22 = v9;
  BOOL v10 = +[NSArray arrayWithObjects:&v22 count:1];
  [v3 setImages:v10];

  objc_initWeak(&location, self);
  uint64_t v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_CANCEL" value:&stru_100036130 table:0];
  dispatch_time_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  int v18 = sub_100009D58;
  v19 = &unk_1000348D8;
  objc_copyWeak(&v20, &location);
  id v13 = +[PRXAction actionWithTitle:v12 style:0 handler:&v16];
  id v14 = [v3 addAction:v13, v16, v17, v18, v19];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardUnsupportedAccessory
{
  id v3 = objc_alloc_init((Class)PRXIconContentViewController);
  id v4 = +[NSBundle mainBundle];
  unsigned int v5 = [v4 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_NOT_SUPPORTED_TITLE" value:&stru_100036130 table:0];
  [v3 setTitle:v5];

  id v6 = +[NSBundle mainBundle];
  dispatch_time_t v7 = [v6 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_NOT_SUPPORTED_MESSAGE" value:&stru_100036130 table:0];
  [v3 setSubtitle:v7];

  [v3 setDismissalType:3];
  id v8 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleLargeTitle scale:3];
  id v9 = +[UIImage systemImageNamed:@"exclamationmark.circle.fill" withConfiguration:v8];
  unint64_t v22 = v9;
  BOOL v10 = +[NSArray arrayWithObjects:&v22 count:1];
  [v3 setImages:v10];

  objc_initWeak(&location, self);
  uint64_t v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_CANCEL" value:&stru_100036130 table:0];
  dispatch_time_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  int v18 = sub_10000A08C;
  v19 = &unk_1000348D8;
  objc_copyWeak(&v20, &location);
  id v13 = +[PRXAction actionWithTitle:v12 style:0 handler:&v16];
  id v14 = [v3 addAction:v13, v16, v17, v18, v19];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardAlreadyAttached
{
  id v3 = objc_alloc_init((Class)PRXIconContentViewController);
  id v4 = +[NSBundle mainBundle];
  unsigned int v5 = [v4 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ALREADY_ATTACHED_TITLE" value:&stru_100036130 table:0];
  [v3 setTitle:v5];

  id v6 = +[NSBundle mainBundle];
  dispatch_time_t v7 = [v6 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ALREADY_ATTACHED_MESSAGE" value:&stru_100036130 table:0];
  [v3 setSubtitle:v7];

  [v3 setDismissalType:3];
  id v8 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleLargeTitle scale:3];
  id v9 = +[UIImage systemImageNamed:@"exclamationmark.circle.fill" withConfiguration:v8];
  unint64_t v22 = v9;
  BOOL v10 = +[NSArray arrayWithObjects:&v22 count:1];
  [v3 setImages:v10];

  objc_initWeak(&location, self);
  uint64_t v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_CANCEL" value:&stru_100036130 table:0];
  dispatch_time_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  int v18 = sub_10000A3C0;
  v19 = &unk_1000348D8;
  objc_copyWeak(&v20, &location);
  id v13 = +[PRXAction actionWithTitle:v12 style:0 handler:&v16];
  id v14 = [v3 addAction:v13, v16, v17, v18, v19];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardAddToDevice
{
  id v3 = objc_alloc_init((Class)PRXCardContentViewController);
  id v4 = +[NSBundle mainBundle];
  unsigned int v5 = [v4 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ACCESSORY_TITLE" value:&stru_100036130 table:0];
  [v3 setTitle:v5];

  [v3 setDismissalType:3];
  objc_initWeak(&location, self);
  id v6 = +[NSBundle mainBundle];
  dispatch_time_t v7 = [v6 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_CONTINUE" value:&stru_100036130 table:0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A60C;
  v11[3] = &unk_100034998;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  id v8 = +[PRXAction actionWithTitle:v7 style:0 handler:v11];
  id v9 = [v3 addAction:v8];

  [(FMDMagSafeSetupRemoteUIViewController *)self addImagetoCard:v3];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v3;
}

- (BOOL)isFindMyEnabled
{
  id v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v3 = +[FMDFMIPManager sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A7D4;
  v9[3] = &unk_1000349C0;
  uint64_t v11 = &v12;
  id v4 = v2;
  BOOL v10 = v4;
  [v3 fmipStateWithCompletion:v9];

  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v4, v5))
  {
    id v6 = sub_100003338();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001EF58();
    }
  }
  char v7 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)enableFindMyWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  id v4 = +[FMDFMIPManager sharedInstance];
  dispatch_time_t v5 = [v4 enableFMIPInContext:7];

  id v6 = sub_100003338();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "enable Findmy with error = %@", (uint8_t *)&v7, 0xCu);
  }

  v3[2](v3, v5);
}

- (id)proxCardSetupFindmy
{
  id v3 = objc_alloc_init((Class)PRXIconContentViewController);
  [v3 setImageStyle:1];
  id v4 = +[UIImage imageNamed:@"Find_My"];
  id v31 = v4;
  dispatch_time_t v5 = +[NSArray arrayWithObjects:&v31 count:1];
  [v3 setImages:v5];

  [v3 setDismissalType:1];
  LODWORD(v5) = [(FMDMagSafeSetupRemoteUIViewController *)self isRestrictedSKU];
  id v6 = +[NSBundle mainBundle];
  int v7 = v6;
  if (v5) {
    CFStringRef v8 = @"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ADD_TO_FIND_MY_MESSAGE_RESTRICTED_SKU";
  }
  else {
    CFStringRef v8 = @"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ADD_TO_FIND_MY_MESSAGE";
  }
  id v9 = [v6 localizedStringForKey:v8 value:&stru_100036130 table:0];
  [v3 setBodyText:v9];

  if ([(FMDMagSafeSetupRemoteUIViewController *)self isFindMyAppInstalled])
  {
    unsigned __int8 v10 = [(FMDMagSafeSetupRemoteUIViewController *)self isFindMyEnabled];
    uint64_t v11 = +[NSBundle mainBundle];
    uint64_t v12 = v11;
    if (v10) {
      [v11 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ADD_TO_FIND_MY?" value:&stru_100036130 table:0];
    }
    else {
    uint64_t v13 = [v11 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ENABLE_FINDMY_TITLE" value:&stru_100036130 table:0];
    }
  }
  else
  {
    uint64_t v12 = +[NSBundle mainBundle];
    uint64_t v13 = [v12 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_INSTALL_FIND_MY?" value:&stru_100036130 table:0];
  }
  uint64_t v14 = (void *)v13;
  [v3 setTitle:v13];

  if ([(FMDMagSafeSetupRemoteUIViewController *)self isFindMyAppInstalled])
  {
    if ([(FMDMagSafeSetupRemoteUIViewController *)self isFindMyEnabled]) {
      CFStringRef v15 = @"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ADD_TO_FIND_MY_ACTION";
    }
    else {
      CFStringRef v15 = @"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ENABLE_FINDMY_ACTION";
    }
  }
  else
  {
    CFStringRef v15 = @"MAGSAFE_PAIRING_UPSELL_PROX_CARD_INSTALL_FIND_MY_ACTION";
  }
  [(FMDMagSafeSetupRemoteUIViewController *)self addDismissButtonAction:v3];
  objc_initWeak(&location, self);
  dispatch_time_t v16 = +[NSBundle mainBundle];
  uint64_t v17 = [v16 localizedStringForKey:v15 value:&stru_100036130 table:0];
  uint64_t v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  uint64_t v25 = sub_10000AC60;
  unint64_t v26 = &unk_100034A10;
  id v18 = v3;
  id v27 = v18;
  int v28 = self;
  objc_copyWeak(&v29, &location);
  v19 = +[PRXAction actionWithTitle:v17 style:0 handler:&v23];
  id v20 = [v18 addAction:v19, v23, v24, v25, v26];

  id v21 = v18;
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);

  return v21;
}

- (id)featurePlatterView:(id)a3 backgrounColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v19 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody scale:1];
  id v18 = +[UIImage systemImageNamed:v6 withConfiguration:v19];

  id v7 = [objc_alloc((Class)UIImageView) initWithImage:v18];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  CFStringRef v8 = +[UIColor whiteColor];
  [v7 setTintColor:v8];

  [v7 setContentMode:4];
  [v7 setMaximumContentSizeCategory:UIContentSizeCategoryLarge];
  id v9 = objc_alloc_init((Class)UIView);
  [v9 _setLayoutDebuggingIdentifier:@"PRXFeaturePlatter"];
  [v9 setBackgroundColor:v5];

  [v9 _setContinuousCornerRadius:14.0];
  [v9 addSubview:v7];
  unsigned __int8 v10 = [v9 centerXAnchor];
  uint64_t v11 = [v7 centerXAnchor];
  uint64_t v12 = [v10 constraintEqualToAnchor:v11];
  v20[0] = v12;
  uint64_t v13 = [v9 centerYAnchor];
  uint64_t v14 = [v7 centerYAnchor];
  CFStringRef v15 = [v13 constraintEqualToAnchor:v14];
  v20[1] = v15;
  dispatch_time_t v16 = +[NSArray arrayWithObjects:v20 count:2];
  +[NSLayoutConstraint activateConstraints:v16];

  return v9;
}

- (BOOL)isRestrictedSKU
{
  id v2 = +[FMSystemInfo sharedInstance];
  if ([v2 isInternalBuild])
  {
    unsigned __int8 v3 = +[FMPreferencesUtil BOOLForKey:@"simulateRestrictedRegionPresence" inDomain:@"com.apple.icloud.findmydeviced.notbackedup"];

    if (v3) {
      return 1;
    }
  }
  else
  {
  }
  id v5 = (void *)qword_100042CE8;
  if (!qword_100042CE8)
  {
    uint64_t v6 = MGCopyAnswer();
    id v7 = (void *)qword_100042CE8;
    qword_100042CE8 = v6;

    id v5 = (void *)qword_100042CE8;
  }

  return [v5 isEqualToString:@"KH"];
}

- (id)proxCardSetupComplete
{
  id v3 = objc_alloc_init((Class)PRXFeatureListViewController);
  id v4 = [(FMDMagSafeSetupRemoteUIViewController *)self magSafeAccessory];
  id v5 = [v4 name];
  [v3 setTitle:v5];

  [v3 setDismissalType:3];
  objc_initWeak(&location, self);
  unsigned int v6 = [(FMDMagSafeSetupRemoteUIViewController *)self isRestrictedSKU];
  id v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v61 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "isRestrictedSKU %d", buf, 8u);
  }

  if (v6)
  {
    CFStringRef v8 = [FMDRemoteAsset alloc];
    id v9 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
    unsigned __int8 v10 = [v9 accessoryType];
    uint64_t v11 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
    uint64_t v12 = [v11 style];
    uint64_t v13 = [(FMDRemoteAsset *)v8 initWithAccessoryType:v10 style:v12 type:3];

    uint64_t v14 = [(FMDRemoteAsset *)v13 getStoredAssetLocation];
    if (!v14
      || (uint64_t v15 = v14,
          +[NSData dataWithContentsOfFile:v14],
          dispatch_time_t v16 = objc_claimAutoreleasedReturnValue(),
          +[UIImage imageWithData:v16 scale:3.0],
          v53 = objc_claimAutoreleasedReturnValue(),
          v16,
          uint64_t v14 = v15,
          !v53))
    {
      v53 = +[UIImage imageNamed:@"wallet1-pairing-non-owner"];
    }
    v52 = (void *)v14;
    id v17 = [objc_alloc((Class)UIImageView) initWithImage:v53];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v18 = [v3 contentView];
    [v18 addSubview:v17];

    v19 = [v3 tableView];
    [v19 setTableHeaderView:v17];

    id v20 = [v17 centerXAnchor];
    id v21 = [v3 tableView];
    unint64_t v22 = [v21 centerXAnchor];
    uint64_t v23 = [v20 constraintEqualToAnchor:v22];
    v59 = v23;
    uint64_t v24 = +[NSArray arrayWithObjects:&v59 count:1];
    +[NSLayoutConstraint activateConstraints:v24];
  }
  else
  {
    [(FMDMagSafeSetupRemoteUIViewController *)self addDynamicMapToCard:v3];
    uint64_t v25 = +[UIColor systemBlueColor];
    v53 = [(FMDMagSafeSetupRemoteUIViewController *)self featurePlatterView:@"location.fill" backgrounColor:v25];

    id v26 = objc_alloc((Class)PRXFeature);
    id v27 = +[NSBundle mainBundle];
    int v28 = [v27 localizedStringForKey:@"MAGSAFE_PAIRING_LOCATION_FEATURE_TITLE" value:&stru_100036130 table:0];
    id v29 = +[NSBundle mainBundle];
    id v30 = [v29 localizedStringForKey:@"MAGSAFE_PAIRING_LOCATION_FEATURE_MESSAGE" value:&stru_100036130 table:0];
    uint64_t v13 = (FMDRemoteAsset *)[v26 initWithTitle:v28 detailText:v30 imageView:v53 valueChangedBlock:0];

    [(FMDRemoteAsset *)v13 setImageViewSize:28.0];
    id v31 = [v3 addFeature:v13];
  }

  __int16 v32 = +[UIColor systemPinkColor];
  uint64_t v33 = [(FMDMagSafeSetupRemoteUIViewController *)self featurePlatterView:@"bell.fill" backgrounColor:v32];

  id v34 = objc_alloc((Class)PRXFeature);
  id v35 = +[NSBundle mainBundle];
  uint64_t v36 = [v35 localizedStringForKey:@"MAGSAFE_PAIRING_NOTIFY_WHEN_DETACHED_FEATURE_TITLE" value:&stru_100036130 table:0];
  v37 = +[NSBundle mainBundle];
  __int16 v38 = [v37 localizedStringForKey:@"MAGSAFE_PAIRING_NOTIFY_WHEN_DETACHED_FEATURE_MESSAGE" value:&stru_100036130 table:0];
  id v39 = [v34 initWithTitle:v36 detailText:v38 imageView:v33 valueChangedBlock:0];

  [v39 setImageViewSize:28.0];
  id v40 = [v3 addFeature:v39];
  v41 = [v3 tableView];
  [v41 setSeparatorStyle:0];

  if ([(FMDMagSafeSetupRemoteUIViewController *)self isFindMyAppInstalled])
  {
    uint64_t v42 = +[NSBundle mainBundle];
    v43 = [v42 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_VIEW_IN_FINDMY" value:&stru_100036130 table:0];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10000BAE8;
    v56[3] = &unk_100034998;
    objc_copyWeak(&v57, &location);
    v56[4] = self;
    v44 = +[PRXAction actionWithTitle:v43 style:0 handler:v56];

    id v45 = [v3 addAction:v44];
    objc_destroyWeak(&v57);
  }
  unsigned int v46 = [(FMDMagSafeSetupRemoteUIViewController *)self isFindMyAppInstalled];
  v47 = +[NSBundle mainBundle];
  v48 = [v47 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_DONE_ACTION" value:&stru_100036130 table:0];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10000BC2C;
  v54[3] = &unk_1000348D8;
  objc_copyWeak(&v55, &location);
  v49 = +[PRXAction actionWithTitle:v48 style:v46 handler:v54];
  id v50 = [v3 addAction:v49];

  objc_destroyWeak(&v55);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardNonOwnerUnlocked
{
  id v3 = objc_alloc_init((Class)PRXCardContentViewController);
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_NON_OWNER_TITLE" value:&stru_100036130 table:0];
  [v3 setTitle:v5];

  [v3 setDismissalType:3];
  objc_initWeak(&location, self);
  unsigned int v6 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  id v7 = [v6 phoneNumber];
  CFStringRef v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    unsigned __int8 v10 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
    id v9 = [v10 email];
  }
  uint64_t v11 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  uint64_t v12 = [v11 phoneNumber];
  BOOL v13 = v12 == 0;

  if (v9)
  {
    uint64_t v14 = +[NSBundle mainBundle];
    uint64_t v15 = [v14 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_ALERT_REGISTERED_TO" value:&stru_100036130 table:0];
    dispatch_time_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v9);
    [v3 setSubtitle:v16];

    id v17 = +[NSBundle mainBundle];
    id v18 = [v17 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_CONTACT_OWNER" value:&stru_100036130 table:0];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000C030;
    v29[3] = &unk_100034A38;
    objc_copyWeak(&v31, &location);
    BOOL v32 = v13;
    id v30 = v9;
    v19 = +[PRXAction actionWithTitle:v18 style:0 handler:v29];
    id v20 = [v3 addAction:v19];

    objc_destroyWeak(&v31);
    uint64_t v21 = 1;
  }
  else
  {
    uint64_t v21 = 0;
  }
  unint64_t v22 = +[NSBundle mainBundle];
  uint64_t v23 = [v22 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_LEARN_MORE" value:&stru_100036130 table:0];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000C204;
  v27[3] = &unk_1000348D8;
  objc_copyWeak(&v28, &location);
  uint64_t v24 = +[PRXAction actionWithTitle:v23 style:v21 handler:v27];
  id v25 = [v3 addAction:v24];

  [(FMDMagSafeSetupRemoteUIViewController *)self addImagetoCard:v3];
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardSetupError
{
  id v3 = objc_alloc_init((Class)PRXIconContentViewController);
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_SETUP_ERROR_TITLE" value:&stru_100036130 table:0];
  [v3 setTitle:v5];

  unsigned int v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_SETUP_ERROR_MESSAGE" value:&stru_100036130 table:0];
  [v3 setSubtitle:v7];

  [v3 setDismissalType:3];
  CFStringRef v8 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleLargeTitle scale:3];
  id v9 = +[UIImage systemImageNamed:@"exclamationmark.circle.fill" withConfiguration:v8];
  unint64_t v22 = v9;
  unsigned __int8 v10 = +[NSArray arrayWithObjects:&v22 count:1];
  [v3 setImages:v10];

  objc_initWeak(&location, self);
  uint64_t v11 = +[NSBundle mainBundle];
  uint64_t v12 = [v11 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_DISMISS" value:&stru_100036130 table:0];
  dispatch_time_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_10000C54C;
  v19 = &unk_1000348D8;
  objc_copyWeak(&v20, &location);
  BOOL v13 = +[PRXAction actionWithTitle:v12 style:0 handler:&v16];
  id v14 = [v3 addAction:v13, v16, v17, v18, v19];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardNotImplemeted
{
  id v3 = objc_alloc_init((Class)PRXCardContentViewController);
  [v3 setTitle:@"Not Implemented"];
  [v3 setDismissalType:3];
  objc_initWeak(&location, self);
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_10000C6D8;
  unsigned __int8 v10 = &unk_1000348D8;
  objc_copyWeak(&v11, &location);
  id v4 = +[PRXAction actionWithTitle:@"dismiss" style:0 handler:&v7];
  id v5 = [v3 addAction:v4, v7, v8, v9, v10];

  [(FMDMagSafeSetupRemoteUIViewController *)self addImagetoCard:v3];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardLockedFindMyNotPaired
{
  id v3 = [FMDRemoteAsset alloc];
  id v4 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  id v5 = [v4 accessoryType];
  unsigned int v6 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  id v7 = [v6 style];
  uint64_t v33 = [(FMDRemoteAsset *)v3 initWithAccessoryType:v5 style:v7 type:0];

  uint64_t v8 = [FMDRemoteAsset alloc];
  id v9 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  unsigned __int8 v10 = [v9 accessoryType];
  id v11 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  uint64_t v12 = [v11 style];
  BOOL v32 = [(FMDRemoteAsset *)v8 initWithAccessoryType:v10 style:v12 type:1];

  BOOL v13 = [(FMDRemoteAsset *)v33 getStoredAssetLocation];
  uint64_t v14 = [(FMDRemoteAsset *)v32 getStoredAssetLocation];
  uint64_t v15 = (void *)v14;
  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  int v17 = !v16;
  id v18 = sub_100010114();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412546;
      v37 = v13;
      __int16 v38 = 2112;
      id v39 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "using video = %@ and adjustmensts = %@", buf, 0x16u);
    }

    id v20 = +[NSURL fileURLWithPath:v13];
    uint64_t v21 = +[NSURL fileURLWithPath:v15];
  }
  else
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "using default video", buf, 2u);
    }

    unint64_t v22 = +[NSBundle mainBundle];
    id v20 = [v22 URLForResource:@"wallet1-pairing-video.mov" withExtension:0];

    uint64_t v23 = +[NSBundle mainBundle];
    uint64_t v21 = [v23 URLForResource:@"wallet1-pairing-video-adjustments.plist" withExtension:0];
  }
  uint64_t v24 = -[FMDMovieProxCardViewController initWithMovieURL:adjustmentsURL:movieDimensions:productHeight:]([FMDMovieProxCardViewController alloc], "initWithMovieURL:adjustmentsURL:movieDimensions:productHeight:", v20, v21, 176.0, 304.0, 176.0);
  id v25 = +[NSBundle mainBundle];
  id v26 = [v25 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ACCESSORY_TITLE" value:&stru_100036130 table:0];
  [(FMDMovieProxCardViewController *)v24 setTitle:v26];

  [(FMDMovieProxCardViewController *)v24 setDismissalType:3];
  objc_initWeak((id *)buf, self);
  id v27 = +[NSBundle mainBundle];
  id v28 = [v27 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_UNLOCK_ACTION" value:&stru_100036130 table:0];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000CBB8;
  v34[3] = &unk_100034998;
  objc_copyWeak(&v35, (id *)buf);
  void v34[4] = self;
  id v29 = +[PRXAction actionWithTitle:v28 style:0 handler:v34];
  id v30 = [(FMDMovieProxCardViewController *)v24 addAction:v29];

  objc_destroyWeak(&v35);
  objc_destroyWeak((id *)buf);

  return v24;
}

- (id)proxCardNonOwnerLockedDevice
{
  id v3 = objc_alloc_init((Class)PRXCardContentViewController);
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_NON_OWNER_TITLE" value:&stru_100036130 table:0];
  [v3 setTitle:v5];

  [v3 setDismissalType:3];
  unsigned int v6 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  uint64_t v7 = [v6 phoneNumber];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
  }
  else
  {
    id v9 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
    uint64_t v8 = [v9 email];

    if (!v8) {
      goto LABEL_5;
    }
  }
  unsigned __int8 v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_ALERT_REGISTERED_TO" value:&stru_100036130 table:0];
  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v8);
  [v3 setSubtitle:v12];

LABEL_5:
  objc_initWeak(&location, self);
  BOOL v13 = +[NSBundle mainBundle];
  uint64_t v14 = [v13 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_NON_OWNER_LOCK_ACTION" value:&stru_100036130 table:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000D0BC;
  v18[3] = &unk_100034AB0;
  v18[4] = self;
  objc_copyWeak(&v19, &location);
  uint64_t v15 = +[PRXAction actionWithTitle:v14 style:0 handler:v18];
  id v16 = [v3 addAction:v15];

  [(FMDMagSafeSetupRemoteUIViewController *)self addImagetoCard:v3];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardSpinner
{
  id v2 = objc_alloc_init((Class)PRXCardContentViewController);
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_WAIT_TITLE" value:&stru_100036130 table:0];
  [v2 setTitle:v4];

  [v2 setDismissalType:3];
  id v5 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 startAnimating];
  unsigned int v6 = [v2 contentView];
  [v6 addSubview:v5];

  uint64_t v7 = [v2 contentView];
  uint64_t v8 = [v7 mainContentGuide];

  uint64_t v24 = [v5 topAnchor];
  uint64_t v23 = [v8 topAnchor];
  unint64_t v22 = [v24 constraintGreaterThanOrEqualToAnchor:v23];
  v25[0] = v22;
  uint64_t v21 = [v5 bottomAnchor];
  id v20 = [v8 bottomAnchor];
  id v19 = [v21 constraintLessThanOrEqualToAnchor:v20];
  v25[1] = v19;
  id v9 = [v5 centerYAnchor];
  id v18 = v2;
  unsigned __int8 v10 = [v2 view];
  id v11 = [v10 centerYAnchor];
  uint64_t v12 = [v9 constraintEqualToAnchor:v11 constant:0.0];
  v25[2] = v12;
  BOOL v13 = [v5 centerXAnchor];
  uint64_t v14 = [v8 centerXAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14];
  v25[3] = v15;
  id v16 = +[NSArray arrayWithObjects:v25 count:4];
  +[NSLayoutConstraint activateConstraints:v16];

  return v18;
}

- (id)proxCardNoAccount
{
  id v3 = objc_alloc_init((Class)PRXIconContentViewController);
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_NO_ACCOUNT_ERROR_TITLE" value:&stru_100036130 table:0];
  [v3 setTitle:v5];

  unsigned int v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_NO_ACCOUNT_ERROR_MESSAGE" value:&stru_100036130 table:0];
  [v3 setSubtitle:v7];

  [v3 setDismissalType:1];
  [(FMDMagSafeSetupRemoteUIViewController *)self addDismissButtonAction:v3];
  uint64_t v8 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleLargeTitle scale:3];
  id v9 = +[UIImage systemImageNamed:@"exclamationmark.circle.fill" withConfiguration:v8];
  unint64_t v22 = v9;
  unsigned __int8 v10 = +[NSArray arrayWithObjects:&v22 count:1];
  [v3 setImages:v10];

  objc_initWeak(&location, self);
  id v11 = +[NSBundle mainBundle];
  uint64_t v12 = [v11 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_APPLE_ID_SETTINGS" value:&stru_100036130 table:0];
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_10000D8CC;
  id v19 = &unk_1000348D8;
  objc_copyWeak(&v20, &location);
  BOOL v13 = +[PRXAction actionWithTitle:v12 style:0 handler:&v16];
  id v14 = [v3 addAction:v13, v16, v17, v18, v19];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardUpgradeAccountSecurity
{
  id v3 = objc_alloc_init((Class)PRXIconContentViewController);
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_UPGRADE_ACCOUNT_ERROR_TITLE" value:&stru_100036130 table:0];
  [v3 setTitle:v5];

  unsigned int v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_UPGRADE_ACCOUNT_ERROR_MESSAGE" value:&stru_100036130 table:0];
  [v3 setSubtitle:v7];

  [v3 setDismissalType:1];
  [(FMDMagSafeSetupRemoteUIViewController *)self addDismissButtonAction:v3];
  uint64_t v8 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleLargeTitle scale:3];
  id v9 = +[UIImage systemImageNamed:@"lock.shield.fill" withConfiguration:v8];
  uint64_t v21 = v9;
  unsigned __int8 v10 = +[NSArray arrayWithObjects:&v21 count:1];
  [v3 setImages:v10];

  objc_initWeak(&location, self);
  id v11 = +[NSBundle mainBundle];
  uint64_t v12 = [v11 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_APPLE_ID_SETTINGS" value:&stru_100036130 table:0];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000DD48;
  v17[3] = &unk_100034998;
  objc_copyWeak(&v19, &location);
  id v13 = v3;
  id v18 = v13;
  id v14 = +[PRXAction actionWithTitle:v12 style:0 handler:v17];
  id v15 = [v13 addAction:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

- (id)proxCardUpgradeAccountSecurityError
{
  id v3 = objc_alloc_init((Class)PRXIconContentViewController);
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ACCOUNT_SETUP_ERROR_TITLE" value:&stru_100036130 table:0];
  [v3 setTitle:v5];

  unsigned int v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ACCOUNT_SETUP_ERROR_MESSAGE" value:&stru_100036130 table:0];
  [v3 setSubtitle:v7];

  [v3 setDismissalType:3];
  uint64_t v8 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleLargeTitle scale:3];
  id v9 = +[UIImage systemImageNamed:@"exclamationmark.circle.fill" withConfiguration:v8];
  id v20 = v9;
  unsigned __int8 v10 = +[NSArray arrayWithObjects:&v20 count:1];
  [v3 setImages:v10];

  objc_initWeak(&location, self);
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10000E008;
  uint64_t v17 = &unk_1000348D8;
  objc_copyWeak(&v18, &location);
  id v11 = +[PRXAction actionWithTitle:@"Dismiss" style:0 handler:&v14];
  id v12 = [v3 addAction:v11, v14, v15, v16, v17];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v3;
}

- (void)addImagetoCard:(id)a3
{
  id v4 = a3;
  id v5 = [FMDRemoteAsset alloc];
  unsigned int v6 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  uint64_t v7 = [v6 accessoryType];
  uint64_t v8 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  id v9 = [v8 style];
  unsigned __int8 v10 = [(FMDRemoteAsset *)v5 initWithAccessoryType:v7 style:v9 type:3];

  uint64_t v33 = v10;
  uint64_t v11 = [(FMDRemoteAsset *)v10 getStoredAssetLocation];
  if (!v11
    || (+[NSData dataWithContentsOfFile:v11],
        id v12 = objc_claimAutoreleasedReturnValue(),
        +[UIImage imageWithData:v12 scale:3.0],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    uint64_t v13 = +[UIImage imageNamed:@"wallet1-pairing-non-owner"];
  }
  BOOL v32 = (void *)v13;
  id v14 = [objc_alloc((Class)UIImageView) initWithImage:v13];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v15 = [v4 contentView];
  [v15 addSubview:v14];

  id v16 = [v4 contentView];

  uint64_t v17 = [v16 mainContentGuide];

  id v31 = [v14 topAnchor];
  id v30 = [v17 topAnchor];
  id v29 = [v31 constraintGreaterThanOrEqualToAnchor:v30];
  v34[0] = v29;
  id v27 = [v14 bottomAnchor];
  id v26 = [v17 bottomAnchor];
  id v18 = [v27 constraintLessThanOrEqualToAnchor:v26];
  v34[1] = v18;
  [v14 centerYAnchor];
  v19 = id v28 = (void *)v11;
  id v20 = [v17 centerYAnchor];
  uint64_t v21 = [v19 constraintEqualToAnchor:v20];
  v34[2] = v21;
  unint64_t v22 = [v14 centerXAnchor];
  uint64_t v23 = [v17 centerXAnchor];
  uint64_t v24 = [v22 constraintEqualToAnchor:v23];
  v34[3] = v24;
  id v25 = +[NSArray arrayWithObjects:v34 count:4];
  +[NSLayoutConstraint activateConstraints:v25];
}

- (void)addDynamicMapToCard:(id)a3
{
  id v4 = a3;
  id v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "adding dynamic map", v27, 2u);
  }

  id v6 = [objc_alloc((Class)MKMapView) initWithFrame:0.0, 0.0, 300.0, 200.0];
  uint64_t v7 = [FMDRemoteAsset alloc];
  uint64_t v8 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  id v9 = [v8 accessoryType];
  unsigned __int8 v10 = [(FMDMagSafeSetupRemoteUIViewController *)self physicalAccessory];
  uint64_t v11 = [v10 style];
  id v12 = [(FMDRemoteAsset *)v7 initWithAccessoryType:v9 style:v11 type:2];

  uint64_t v13 = [(FMDRemoteAsset *)v12 getStoredAssetLocation];
  [(FMDMagSafeSetupRemoteUIViewController *)self setMapDeviceImagePath:v13];

  [v6 setDelegate:self];
  [v6 setMapType:0];
  [v6 setUserInteractionEnabled:0];
  [v6 setShowsUserLocation:0];
  id v14 = [v6 layer];
  [v14 setCornerCurve:kCACornerCurveContinuous];

  uint64_t v15 = [v6 layer];
  [v15 setCornerRadius:16.0];

  [(FMDMagSafeSetupRemoteUIViewController *)self setMapView:v6];
  id v16 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
  id v17 = [objc_alloc((Class)CLLocationManager) initWithEffectiveBundle:v16];
  [(FMDMagSafeSetupRemoteUIViewController *)self setLocationManager:v17];

  id v18 = [(FMDMagSafeSetupRemoteUIViewController *)self locationManager];
  [v18 setDelegate:self];

  id v19 = [(FMDMagSafeSetupRemoteUIViewController *)self locationManager];
  [v19 setDesiredAccuracy:kCLLocationAccuracyBest];

  id v20 = [(FMDMagSafeSetupRemoteUIViewController *)self locationManager];
  [v20 setDistanceFilter:10.0];

  uint64_t v21 = [(FMDMagSafeSetupRemoteUIViewController *)self locationManager];
  [v21 startUpdatingLocation];

  unint64_t v22 = [v4 contentView];
  [v22 addSubview:v6];

  id v23 = objc_alloc((Class)UIView);
  id v24 = [v23 initWithFrame:0.0, 0.0, 300.0, PRXMainContentMargin + 200.0];
  [v6 setAutoresizingMask:5];
  [v24 bounds];
  double MidX = CGRectGetMidX(v28);
  [v6 bounds];
  [v6 setCenter:MidX, CGRectGetMidY(v29)];
  [v24 addSubview:v6];
  id v26 = [v4 tableView];

  [v26 setTableHeaderView:v24];
}

- (void)addDismissButtonAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E838;
  v6[3] = &unk_100034998;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v5 = +[PRXAction actionWithTitle:&stru_100036130 style:0 handler:v6];
  [v4 setDismissButtonAction:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (BOOL)isLocked
{
  int v2 = MKBGetDeviceLockState();
  id v3 = sub_100010114();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10001F1E0(v2, v3);
  }

  return v2 == 1 || v2 == 4;
}

- (void)postNotification:(id)a3
{
  id v3 = (__CFString *)a3;
  id v4 = sub_100010114();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setupModules posting notification %@", (uint8_t *)&v6, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
}

- (BOOL)isFMFAllowed
{
  if ((byte_100042CF0 & 1) == 0)
  {
    int v6 = 0;
    CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswerWithError();
    CFBooleanRef v3 = v2;
    if (v2)
    {
      byte_1000427D0 = CFBooleanGetValue(v2) != 0;
      byte_100042CF0 = 1;
LABEL_7:
      CFRelease(v3);
      return byte_1000427D0;
    }
    id v4 = sub_100010114();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10001F258(&v6, v4);
    }

    if (v3) {
      goto LABEL_7;
    }
  }
  return byte_1000427D0;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  int v6 = sub_100003338();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 firstObject];
    [v7 coordinate];
    uint64_t v9 = v8;
    unsigned __int8 v10 = [v5 firstObject];
    [v10 coordinate];
    int v31 = 134283777;
    uint64_t v32 = v9;
    __int16 v33 = 2049;
    uint64_t v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Map locationManager new didUpdateUserLocation %{private}f %{private}f", (uint8_t *)&v31, 0x16u);
  }
  id v12 = [v5 firstObject];
  [v12 coordinate];
  double v14 = v13;

  uint64_t v15 = [v5 firstObject];
  [v15 coordinate];
  double v17 = v16;

  id v18 = [(FMDMagSafeSetupRemoteUIViewController *)self mapView];
  [v18 setRegion:0, v14, v17, 0.001, 0.001];

  id v19 = [(FMDMagSafeSetupRemoteUIViewController *)self userLocationAnnotation];

  if (v19)
  {
    id v20 = [(FMDMagSafeSetupRemoteUIViewController *)self userLocationAnnotation];
    [v20 setCoordinate:v14, v17];
  }
  else
  {
    id v21 = [objc_alloc((Class)MKPointAnnotation) initWithCoordinate:0, 0, v14, v17];
    [(FMDMagSafeSetupRemoteUIViewController *)self setUserLocationAnnotation:v21];

    id v20 = [(FMDMagSafeSetupRemoteUIViewController *)self mapView];
    unint64_t v22 = [(FMDMagSafeSetupRemoteUIViewController *)self userLocationAnnotation];
    [v20 addAnnotation:v22];
  }
  id v23 = [(FMDMagSafeSetupRemoteUIViewController *)self deviceAnnotation];

  id v24 = [(FMDMagSafeSetupRemoteUIViewController *)self mapView];
  id v25 = v24;
  if (v23)
  {
    [v24 setRegion:1 animated:v14, v17, 0.001, 0.001];

    id v26 = [(FMDMagSafeSetupRemoteUIViewController *)self deviceAnnotation];
    [v26 setCoordinate:v14, v17];
  }
  else
  {
    [v24 setRegion:0, v14, v17, 0.001, 0.001];

    id v27 = [objc_alloc((Class)MKPointAnnotation) initWithCoordinate:0, 0, v14, v17];
    [(FMDMagSafeSetupRemoteUIViewController *)self setDeviceAnnotation:v27];

    CGRect v28 = [(FMDMagSafeSetupRemoteUIViewController *)self mapView];
    CGRect v29 = [(FMDMagSafeSetupRemoteUIViewController *)self deviceAnnotation];
    [v28 addAnnotation:v29];

    id v26 = [(FMDMagSafeSetupRemoteUIViewController *)self mapView];
    id v30 = [(FMDMagSafeSetupRemoteUIViewController *)self deviceAnnotation];
    [v26 selectAnnotation:v30 animated:1];
  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = a4;
  int v6 = sub_100003338();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Map viewForAnnotation %@", (uint8_t *)&v22, 0xCu);
  }

  id v7 = [(FMDMagSafeSetupRemoteUIViewController *)self deviceAnnotation];

  if (v7 == v5)
  {
    unsigned __int8 v10 = sub_100003338();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Map creating deviceAnnotation view %@", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v11 = [FMDeviceAnnotationView alloc];
    id v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    uint64_t v9 = [(FMDeviceAnnotationView *)v11 initWithAnnotation:v5 reuseIdentifier:v13];

    double v14 = [(FMDMagSafeSetupRemoteUIViewController *)self mapDeviceImagePath];

    if (!v14
      || ([(FMDMagSafeSetupRemoteUIViewController *)self mapDeviceImagePath],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          +[UIImage imageWithContentsOfFile:v15],
          double v16 = objc_claimAutoreleasedReturnValue(),
          v15,
          !v16))
    {
      double v16 = +[UIImage imageNamed:@"wallet1-pairing-map"];
    }
    [(FMDeviceAnnotationView *)v9 setDeviceImage:v16];
  }
  else
  {
    id v8 = [(FMDMagSafeSetupRemoteUIViewController *)self userLocationAnnotation];

    if (v8 == v5)
    {
      double v17 = sub_100003338();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#Map creating userLocationAnnotation view %@", (uint8_t *)&v22, 0xCu);
      }

      id v18 = objc_alloc((Class)MKUserLocationView);
      id v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);
      uint64_t v9 = (FMDeviceAnnotationView *)[v18 initWithAnnotation:v5 reuseIdentifier:v20];

      [(FMDeviceAnnotationView *)v9 setCanShowCallout:0];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (BOOL)isFindMyAppInstalled
{
  CFBooleanRef v3 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned int v4 = [v3 applicationIsInstalled:@"com.apple.findmy"];

  id v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Find My installed? %i", (uint8_t *)v10, 8u);
  }

  int v6 = [(FMDMagSafeSetupRemoteUIViewController *)self appInstallCoordinator];

  if (v6) {
    unsigned __int8 v7 = 0;
  }
  else {
    unsigned __int8 v7 = v4;
  }
  if (v6 && ((v4 ^ 1) & 1) == 0)
  {
    id v8 = [(FMDMagSafeSetupRemoteUIViewController *)self appInstallCoordinator];
    unsigned __int8 v7 = [v8 isComplete];
  }
  return v7;
}

- (void)triggerFindMyAppInstallation
{
  id v3 = [objc_alloc((Class)ASDSystemAppMetadata) initWithBundleID:@"com.apple.findmy"];
  [v3 setUserInitiated:1];
  unsigned int v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#Starting installation of Find My", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F5D8;
  v5[3] = &unk_100034B20;
  objc_copyWeak(&v6, buf);
  +[ASDInstallApps installApp:v3 withCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (unint64_t)accountState
{
  id v2 = objc_alloc_init((Class)ACAccountStore);
  id v3 = [v2 aa_primaryAppleAccount];
  if (v3)
  {
    unsigned int v4 = +[AKAccountManager sharedInstance];
    id v5 = [v3 accountPropertyForKey:@"altDSID"];
    if (v5)
    {
      id v6 = [v4 authKitAccountWithAltDSID:v5];
      if (v6)
      {
        unsigned __int8 v7 = [v4 additionalInfoForAccount:v6];
        id v8 = sub_100003338();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138412290;
          id v12 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "got additional Info = %@", (uint8_t *)&v11, 0xCu);
        }

        if ([v4 securityLevelForAccount:v6] == (id)4) {
          unint64_t v9 = 2;
        }
        else {
          unint64_t v9 = 1;
        }
      }
      else
      {
        unsigned __int8 v7 = sub_100003338();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10001F424();
        }
        unint64_t v9 = 3;
      }
    }
    else
    {
      id v6 = sub_100003338();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10001F3F0();
      }
      unint64_t v9 = 3;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)upgradeAccountButtonPressedOn:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"MAGSAFE_PAIRING_ACCPUNT_UPGRADE_SETUP_LATER_ALERT_TITLE" value:&stru_100036130 table:0];
  unsigned __int8 v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"MAGSAFE_PAIRING_ACCPUNT_UPGRADE_SETUP_LATER_ALERT_MESSAGE" value:&stru_100036130 table:0];
  unint64_t v9 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  unsigned __int8 v10 = +[NSBundle mainBundle];
  int v11 = [v10 localizedStringForKey:@"MAGSAFE_PAIRING_ACCPUNT_UPGRADE_SETUP_LATER_ALERT_ACTION" value:&stru_100036130 table:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000FA88;
  v13[3] = &unk_100034B48;
  v13[4] = self;
  id v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v13];

  [v9 addAction:v12];
  [v4 presentViewController:v9 animated:1 completion:0];
}

- (void)launchSettingsAppUpgradeFlow
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  id v3 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=upgradeSecurityLevel"];
  uint64_t v5 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  id v6 = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [v2 openSensitiveURL:v3 withOptions:v4];
}

- (SFClient)sharingClient
{
  return self->_sharingClient;
}

- (void)setSharingClient:(id)a3
{
}

- (SBUIRemoteAlertHostInterface)remoteVCProxy
{
  return self->_remoteVCProxy;
}

- (void)setRemoteVCProxy:(id)a3
{
}

- (FMDMagSafeProtocol)physicalAccessory
{
  return self->_physicalAccessory;
}

- (void)setPhysicalAccessory:(id)a3
{
}

- (FMDMagSafeAccessory)magSafeAccessory
{
  return self->_magSafeAccessory;
}

- (void)setMagSafeAccessory:(id)a3
{
}

- (PRXCardContentViewController)presentedCard
{
  return self->_presentedCard;
}

- (void)setPresentedCard:(id)a3
{
}

- (FMDCoreAccessoryManager)caAccessoryManager
{
  return self->_caAccessoryManager;
}

- (void)setCaAccessoryManager:(id)a3
{
}

- (NSString)presentingAccessorySerialNumber
{
  return self->_presentingAccessorySerialNumber;
}

- (void)setPresentingAccessorySerialNumber:(id)a3
{
}

- (FMDispatchTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (FMDispatchTimer)showAttachScreenTimer
{
  return self->_showAttachScreenTimer;
}

- (void)setShowAttachScreenTimer:(id)a3
{
}

- (IXAppInstallCoordinator)appInstallCoordinator
{
  return self->_appInstallCoordinator;
}

- (void)setAppInstallCoordinator:(id)a3
{
}

- (int)deviceLockState
{
  return self->_deviceLockState;
}

- (void)setDeviceLockState:(int)a3
{
  self->_deviceLockState = a3;
}

- (int)lockStateNotifyToken
{
  return self->_lockStateNotifyToken;
}

- (void)setLockStateNotifyToken:(int)a3
{
  self->_lockStateNotifyToken = a3;
}

- (unint64_t)magSafeState
{
  return self->_magSafeState;
}

- (void)setMagSafeState:(unint64_t)a3
{
  self->_magSafeState = a3;
}

- (unint64_t)proxCardState
{
  return self->_proxCardState;
}

- (void)setProxCardState:(unint64_t)a3
{
  self->_proxCardState = a3;
}

- (unint64_t)prevProxCardState
{
  return self->_prevProxCardState;
}

- (void)setPrevProxCardState:(unint64_t)a3
{
  self->_prevProxCardState = a3;
}

- (NSDictionary)launchContext
{
  return self->_launchContext;
}

- (void)setLaunchContext:(id)a3
{
}

- (BOOL)launchedFromFindMyApp
{
  return self->_launchedFromFindMyApp;
}

- (void)setLaunchedFromFindMyApp:(BOOL)a3
{
  self->_launchedFromFindMyApp = a3;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (MKPointAnnotation)deviceAnnotation
{
  return self->_deviceAnnotation;
}

- (void)setDeviceAnnotation:(id)a3
{
}

- (MKPointAnnotation)userLocationAnnotation
{
  return self->_userLocationAnnotation;
}

- (void)setUserLocationAnnotation:(id)a3
{
}

- (NSString)mapDeviceImagePath
{
  return self->_mapDeviceImagePath;
}

- (void)setMapDeviceImagePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapDeviceImagePath, 0);
  objc_storeStrong((id *)&self->_userLocationAnnotation, 0);
  objc_storeStrong((id *)&self->_deviceAnnotation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_launchContext, 0);
  objc_storeStrong((id *)&self->_appInstallCoordinator, 0);
  objc_storeStrong((id *)&self->_showAttachScreenTimer, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_presentingAccessorySerialNumber, 0);
  objc_storeStrong((id *)&self->_caAccessoryManager, 0);
  objc_storeStrong((id *)&self->_presentedCard, 0);
  objc_storeStrong((id *)&self->_magSafeAccessory, 0);
  objc_storeStrong((id *)&self->_physicalAccessory, 0);
  objc_storeStrong((id *)&self->_remoteVCProxy, 0);

  objc_storeStrong((id *)&self->_sharingClient, 0);
}

@end