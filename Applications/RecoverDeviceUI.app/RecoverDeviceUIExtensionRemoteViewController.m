@interface RecoverDeviceUIExtensionRemoteViewController
- (BOOL)extendedMode;
- (BOOL)ignoreAdditionalCodes;
- (BOOL)isCompanionSameDevice;
- (BOOL)matchesRecentlyRecoveredDevice;
- (BOOL)performingEACS;
- (BOOL)recoveryCompleted;
- (BOOL)setupCompleted;
- (BOOL)showingProgress;
- (BOOL)useAlternateStringForWiFI;
- (CBDevice)deviceObj;
- (NSDictionary)serverConfig;
- (NSString)kLocalizedDeviceType;
- (NSTimer)setupTimer;
- (OS_dispatch_queue)recoverDeviceOperationsQueue;
- (PRXCardContentViewController)eacsApprovalCard;
- (PRXCardContentViewController)eacsCard;
- (PRXCardContentViewController)enterCodeCard;
- (PRXCardContentViewController)initialCard;
- (PRXCardContentViewController)learnMoreCard;
- (PRXCardContentViewController)menuCard;
- (PRXCardContentViewController)overallResultCard;
- (PRXCardContentViewController)progressCard;
- (PRXCardContentViewController)recoveryCard;
- (PRXCardContentViewController)settingUpDeviceCard;
- (RecoverDeviceMenuViewController)menuViewController;
- (SKDevice)setupkitDevice;
- (SKSetupClient)setupkitClient;
- (SUCoreLog)logger;
- (UILabel)progressText;
- (UINavigationController)proxCardNavController;
- (UIProgressView)progressView;
- (id)backToMenuButton;
- (id)deviceKey;
- (id)getOverallResultActionForError:(id)a3 resultType:(int)a4;
- (id)getOverallResultSubTitleStringForError:(id)a3 resultType:(int)a4;
- (id)getOverallResultTitleStringForError:(id)a3 resultType:(int)a4;
- (id)getOverallResultUIImageForError:(id)a3 resultType:(int)a4;
- (id)learnMoreButtonAction;
- (id)menuEACSButton;
- (id)menuRebootButton;
- (id)menuSystemRecoveryButton;
- (id)notNowButtonAction;
- (id)overallResultOKButtonAction;
- (id)overallResultSUButtonAction;
- (id)progressDismissButtonAction;
- (id)recoverButtonAction;
- (id)uiImage;
- (id)uiImageEACS;
- (unint64_t)authenticationAttempt;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)runningInStoreDemoMode;
- (void)_setupKitEventHandler:(id)a3;
- (void)cleanupOldRecoveredDevices;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)doneWaitingForServerResponse;
- (void)handleOSRMessage:(id)a3;
- (void)menuOptionChosen:(int)a3;
- (void)persistRecoveringDevice;
- (void)proxCardFlowDidDismiss;
- (void)proxCardFlowWillPresent;
- (void)recoverButtonPressed;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setAuthenticationAttempt:(unint64_t)a3;
- (void)setDeviceObj:(id)a3;
- (void)setEacsApprovalCard:(id)a3;
- (void)setEacsCard:(id)a3;
- (void)setEnterCodeCard:(id)a3;
- (void)setExtendedMode:(BOOL)a3;
- (void)setIgnoreAdditionalCodes:(BOOL)a3;
- (void)setInitialCard:(id)a3;
- (void)setInitialCardForResume;
- (void)setInitialCardForSetup;
- (void)setKLocalizedDeviceType:(id)a3;
- (void)setLearnMoreCard:(id)a3;
- (void)setLogger:(id)a3;
- (void)setMenuCard:(id)a3;
- (void)setMenuViewController:(id)a3;
- (void)setOverallResultCard:(id)a3;
- (void)setPerformingEACS:(BOOL)a3;
- (void)setProgressCard:(id)a3;
- (void)setProgressText:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setProxCardNavController:(id)a3;
- (void)setRecoveryCard:(id)a3;
- (void)setRecoveryCompleted:(BOOL)a3;
- (void)setServerConfig:(id)a3;
- (void)setSettingUpDeviceCard:(id)a3;
- (void)setSetupCompleted:(BOOL)a3;
- (void)setSetupTimer:(id)a3;
- (void)setSetupkitClient:(id)a3;
- (void)setSetupkitDevice:(id)a3;
- (void)setShowingProgress:(BOOL)a3;
- (void)setupStop;
- (void)showCollectCodeCard:(int)a3 inFlags:(unsigned int)a4 inThrottleSeconds:(int)a5;
- (void)showEACSApprovalCard;
- (void)showEACSCard;
- (void)showLearnMoreCard;
- (void)showMenuCard;
- (void)showOverallResultCard:(id)a3 resultType:(int)a4;
- (void)showProgressCard:(id)a3;
- (void)showRecoveryCard;
- (void)updateCodeCardToSettingUpState;
- (void)updateProgressCardOnMainQueueWithInfo:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)waitForServerResponse;
@end

@implementation RecoverDeviceUIExtensionRemoteViewController

- (BOOL)useAlternateStringForWiFI
{
  return _MGGetBoolAnswer(@"wapi", a2);
}

- (unsigned)runningInStoreDemoMode
{
  return CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  id location = 0;
  objc_initWeak(&location, self);
  id v8 = [objc_alloc((Class)SUCoreLog) initWithCategory:@"RecoverDeviceUI"];
  [(RecoverDeviceUIExtensionRemoteViewController *)self setLogger:v8];

  if ([(RecoverDeviceUIExtensionRemoteViewController *)self runningInStoreDemoMode] == 1)
  {
    v9 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Skipping tap-to-recover prompt for device running in StoreDemoMode", buf, 2u);
    }
LABEL_89:

    goto LABEL_90;
  }
  v11 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
  v12 = [v11 oslog];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device running in regular mode. Proceeding with tap-to-recover prompt", buf, 2u);
  }

  [(RecoverDeviceUIExtensionRemoteViewController *)self setSetupCompleted:0];
  [(RecoverDeviceUIExtensionRemoteViewController *)self setOverallResultCard:0];
  [(RecoverDeviceUIExtensionRemoteViewController *)self setAuthenticationAttempt:0];
  id v13 = objc_alloc_init((Class)SKDevice);
  [(RecoverDeviceUIExtensionRemoteViewController *)self setSetupkitDevice:v13];

  id v14 = objc_alloc_init((Class)SKSetupClient);
  [(RecoverDeviceUIExtensionRemoteViewController *)self setSetupkitClient:v14];

  v15 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitClient];
  [v15 setSetupType:1];

  v16 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitClient];
  [v16 setSkipWifi:0];

  v17 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitClient];
  [v17 setPasswordType:2];

  v18 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitClient];
  [v18 setConditionalPersistent:1];

  v121[0] = @"NeRDVersionKey";
  v19 = +[NSNumber numberWithInteger:2];
  v122[0] = v19;
  v122[1] = &__kCFBooleanTrue;
  v121[1] = @"NeRDSupportsMessaging";
  v121[2] = @"NeRDSupportsOOBMessaging";
  v122[2] = &__kCFBooleanTrue;
  v20 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:3];
  v21 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitClient];
  [v21 setClientConfig:v20];

  v22 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.RecoverDeviceUI.mainOperationsQueue", 0);
  recoverDeviceOperationsQueue = self->_recoverDeviceOperationsQueue;
  self->_recoverDeviceOperationsQueue = v22;

  v24 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
  v25 = [v24 oslog];

  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "ConfigureWithContext invoked", buf, 2u);
  }

  if (!v6
    || ([v6 userInfo],
        v26 = objc_claimAutoreleasedReturnValue(),
        BOOL v27 = v26 == 0,
        v26,
        v27))
  {
    v34 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    v31 = [v34 oslog];

    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Invalid userinfo object passed to RecoverDeviceUI", buf, 2u);
    }
  }
  else
  {
    v28 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    v29 = [v28 oslog];

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Valid context/info object", buf, 2u);
    }

    v30 = [v6 userInfo];
    v31 = [v30 objectForKeyedSubscript:@"device"];

    if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v32 = objc_alloc((Class)CBDevice);
      if (objc_opt_respondsToSelector())
      {
        v33 = [v32 initWithDictionary:v31 error:0];
        [(RecoverDeviceUIExtensionRemoteViewController *)self setDeviceObj:v33];
      }
      else
      {
        v36 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
        v33 = [v36 oslog];

        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "CBDevice implementation missing appropriate initialization function", buf, 2u);
        }
      }
    }
    else
    {
      v35 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
      v32 = [v35 oslog];

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Invalid dictionary in userinfo object passed to RecoverDeviceUI", buf, 2u);
      }
    }
  }
  v37 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
  BOOL v38 = v37 == 0;

  if (v38)
  {
    v51 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    v10 = [v51 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to initialize deviceObj for RecoverDeviceUI", buf, 2u);
    }
    goto LABEL_89;
  }
  v39 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
  v40 = [v39 oslog];

  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
    unsigned int v42 = [v41 nearbyActionType];
    v43 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
    unsigned int v44 = [v43 nearbyActionFlags];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v119 = v42;
    *(_WORD *)&v119[4] = 1024;
    *(_DWORD *)&v119[6] = v44;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "nearbyActionType:%d nearbyActionFlags:%d", buf, 0xEu);
  }
  if (os_variant_has_internal_content())
  {
    v45 = +[NSUserDefaults standardUserDefaults];
    v46 = [v45 stringForKey:@"ForceAuthTag"];

    if (v46)
    {
      v47 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
      unsigned __int8 v48 = [v47 nearbyActionFlags];

      if ((v48 & 0x80) == 0)
      {
        v49 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
        v50 = [v49 oslog];

        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "ForceAuthTag default is set, but server don't have auth tag, ignoring", buf, 2u);
        }
LABEL_70:

        goto LABEL_90;
      }
      v52 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
      v53 = [v52 nearbyAuthTag];
      v54 = [v46 dataUsingEncoding:4];
      unsigned int v55 = [v53 isEqual:v54];

      if (!v55)
      {
        v85 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
        v50 = [v85 oslog];

        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          id v86 = [v46 dataUsingEncoding:4];
          v87 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
          v88 = [v87 nearbyAuthTag];
          *(_DWORD *)buf = 138412546;
          *(void *)v119 = v86;
          *(_WORD *)&v119[8] = 2112;
          v120 = v88;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "ForceAuthTag default is set to %@, but server have different auth tag %@, ignoring", buf, 0x16u);
        }
        goto LABEL_70;
      }
      v56 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
      v57 = [v56 oslog];

      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "ForceAuthTag default is set, and server have matching auth tag, continue", buf, 2u);
      }
    }
  }
  v58 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
  BOOL v59 = [v58 nearbyActionType] == 85;

  if (v59)
  {
    v60 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    v61 = [v60 oslog];

    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "extended mode detected", buf, 2u);
    }

    [(RecoverDeviceUIExtensionRemoteViewController *)self setExtendedMode:1];
  }
  v62 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
  if ([v62 nearbyActionDeviceClass] == 1)
  {
  }
  else
  {
    v63 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
    BOOL v64 = [v63 nearbyActionDeviceClass] == 3;

    if (!v64) {
      goto LABEL_52;
    }
  }
  v65 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
  BOOL v66 = (int)[v65 rssi] < -45;

  if (v66)
  {
    v67 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    v68 = [v67 oslog];

    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
      unsigned int v70 = [v69 rssi];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v119 = v70;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "showing prox card, but rssi is %d", buf, 8u);
    }
  }
LABEL_52:
  v71 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
  BOOL v72 = [v71 nearbyActionDeviceClass] == 6;

  if (v72)
  {
    v73 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    v74 = [v73 oslog];

    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Device needing recovery is an Apple Watch", buf, 2u);
    }
    CFStringRef v75 = @"DEVICE_TYPE_WATCH";
  }
  else
  {
    v76 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
    BOOL v77 = [v76 nearbyActionDeviceClass] == 11;

    if (v77)
    {
      v78 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
      v74 = [v78 oslog];

      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Device needing recovery was found", buf, 2u);
      }
      CFStringRef v75 = @"DEVICE_TYPE_VISION";
    }
    else
    {
      v79 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
      BOOL v80 = [v79 nearbyActionDeviceClass] == 4;

      if (v80)
      {
        v81 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
        v74 = [v81 oslog];

        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Device needing recovery is an Apple TV", buf, 2u);
        }
        CFStringRef v75 = @"DEVICE_TYPE_ATV";
      }
      else
      {
        v82 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
        BOOL v83 = [v82 nearbyActionDeviceClass] == 1;

        if (v83)
        {
          v84 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
          v74 = [v84 oslog];

          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Device needing recovery is an iPhone", buf, 2u);
          }
          CFStringRef v75 = @"DEVICE_TYPE_IPHONE";
        }
        else
        {
          v89 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
          BOOL v90 = [v89 nearbyActionDeviceClass] == 3;

          if (!v90)
          {
            v111 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
            v112 = [v111 oslog];

            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
            {
              v113 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
              unsigned int v114 = [v113 nearbyActionDeviceClass];
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v119 = v114;
              _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "Device needing recovery is unknown/unsupported: %d", buf, 8u);
            }
            goto LABEL_90;
          }
          v91 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
          v74 = [v91 oslog];

          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Device needing recovery is an iPad", buf, 2u);
          }
          CFStringRef v75 = @"DEVICE_TYPE_IPAD";
        }
      }
    }
  }

  [(RecoverDeviceUIExtensionRemoteViewController *)self setKLocalizedDeviceType:v75];
  v92 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
  BOOL v93 = ([v92 nearbyActionFlags] & 0x40) == 0;

  if (v93)
  {
    v94 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    v95 = [v94 oslog];

    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Device already recovering, skipping wifi setup step", buf, 2u);
    }

    if (![(RecoverDeviceUIExtensionRemoteViewController *)self matchesRecentlyRecoveredDevice])
    {
      v110 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
      v10 = [v110 oslog];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device isn't known to us. Bailing", buf, 2u);
      }
      goto LABEL_89;
    }
    v96 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitClient];
    [v96 setSkipWifi:1];

    v97 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    v98 = [v97 oslog];

    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Device is known to us", buf, 2u);
    }
  }
  v99 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
  v100 = [v99 identifier];
  v101 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitDevice];
  [v101 setIdentifier:v100];

  v102 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitDevice];
  [v102 setBlePSM:130];

  v103 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitDevice];
  v104 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitClient];
  [v104 setPeerDevice:v103];

  objc_copyWeak(&v116, &location);
  v105 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitClient];
  [v105 setEventHandler:&v115];

  v106 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
  v107 = [v106 oslog];

  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    v108 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
    v109 = [v108 identifier];
    *(_DWORD *)buf = 138412290;
    *(void *)v119 = v109;
    _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "RecoverDeviceUI successfully initialized. Identifier is %@", buf, 0xCu);
  }
  if (v7) {
    v7[2](v7);
  }
  objc_destroyWeak(&v116);
LABEL_90:
  objc_destroyWeak(&location);
}

void __80__RecoverDeviceUIExtensionRemoteViewController_configureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setupKitEventHandler:v3];
}

- (void)_setupKitEventHandler:(id)a3
{
  id v4 = a3;
  v5 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __70__RecoverDeviceUIExtensionRemoteViewController__setupKitEventHandler___block_invoke;
  v7[3] = &unk_10001C430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__RecoverDeviceUIExtensionRemoteViewController__setupKitEventHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) logger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [*(id *)(a1 + 40) eventType];
    int v5 = [*(id *)(a1 + 40) eventType];
    if (v5 > 109)
    {
      if (v5 > 199)
      {
        if (v5 <= 201)
        {
          if (v5 == 200) {
            CFStringRef v6 = @"CaptiveNetworkPresent";
          }
          else {
            CFStringRef v6 = @"CaptiveNetworkNavigation";
          }
          goto LABEL_40;
        }
        if (v5 == 202)
        {
          CFStringRef v6 = @"CaptiveNetworkAuthenticated";
          goto LABEL_40;
        }
        if (v5 == 300)
        {
          CFStringRef v6 = @"BasicConfigUpdated";
          goto LABEL_40;
        }
      }
      else if (v5 > 129)
      {
        if (v5 == 130)
        {
          CFStringRef v6 = @"AuthenticationResponse";
          goto LABEL_40;
        }
        if (v5 == 140)
        {
          CFStringRef v6 = @"AuthenticationCompleted";
          goto LABEL_40;
        }
      }
      else
      {
        if (v5 == 110)
        {
          CFStringRef v6 = @"AuthenticationPresent";
          goto LABEL_40;
        }
        if (v5 == 120)
        {
          CFStringRef v6 = @"AuthenticationRequest";
          goto LABEL_40;
        }
      }
    }
    else if (v5 > 39)
    {
      if (v5 <= 41)
      {
        if (v5 == 40) {
          CFStringRef v6 = @"ConnectionStarted";
        }
        else {
          CFStringRef v6 = @"ConnectionEnded";
        }
        goto LABEL_40;
      }
      if (v5 == 42)
      {
        CFStringRef v6 = @"Error";
        goto LABEL_40;
      }
      if (v5 == 100)
      {
        CFStringRef v6 = @"AuthenticationTypeChanged";
        goto LABEL_40;
      }
    }
    else if (v5 > 19)
    {
      if (v5 == 20)
      {
        CFStringRef v6 = @"Completed";
        goto LABEL_40;
      }
      if (v5 == 30)
      {
        CFStringRef v6 = @"Invalidated";
        goto LABEL_40;
      }
    }
    else
    {
      if (!v5)
      {
        CFStringRef v6 = @"Unknown";
        goto LABEL_40;
      }
      if (v5 == 10)
      {
        CFStringRef v6 = @"Started";
LABEL_40:
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v94 = v4;
        *(_WORD *)&v94[4] = 2112;
        *(void *)&v94[6] = v6;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SetupKitEventHandler invoked for event : %d (%@)", buf, 0x12u);
        goto LABEL_41;
      }
    }
    CFStringRef v6 = @"?";
    goto LABEL_40;
  }
LABEL_41:

  [*(id *)(a1 + 32) doneWaitingForServerResponse];
  v7 = [*(id *)(a1 + 40) error];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) logger];
    v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [*(id *)(a1 + 40) error];
      *(_DWORD *)buf = 138412290;
      *(void *)v94 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Got error from SetupKit: %@", buf, 0xCu);
    }
    if ([*(id *)(a1 + 32) setupCompleted]) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 0;
    }
    v12 = *(void **)(a1 + 32);
    id v13 = [*(id *)(a1 + 40) error];
    [v12 showOverallResultCard:v13 resultType:v11];

    return;
  }
  int v14 = [*(id *)(a1 + 40) eventType];
  if (v14 <= 139)
  {
    if (v14 != 20)
    {
      if (v14 == 120)
      {
        v15 = [*(id *)(a1 + 32) logger];
        v16 = [v15 oslog];

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Handling request to show authentication prompt", buf, 2u);
        }

        v17 = [*(id *)(a1 + 32) setupkitClient];
        unsigned int v18 = [v17 skipWifi];

        if (v18)
        {
          v19 = [*(id *)(a1 + 32) logger];
          v20 = [v19 oslog];

          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found recovering device that while similar to a device we recovered, wasn't recovered by us. Can't show progress", buf, 2u);
          }

          uint64_t v21 = 10001;
        }
        else
        {
          objc_opt_class();
          int isKindOfClass = objc_opt_isKindOfClass();
          v43 = [*(id *)(a1 + 32) logger];
          unsigned int v44 = [v43 oslog];

          BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
          if (isKindOfClass)
          {
            if (v45)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Attempting to display auth screen", buf, 2u);
            }

            uint64_t v47 = a1 + 32;
            v46 = *(void **)(a1 + 32);
            v22 = *(id *)(v47 + 8);
            [v46 showCollectCodeCard:[v22 passwordType] inFlags:[v22 pairingFlags] inThrottleSeconds:[v22 throttleSeconds]];
            goto LABEL_157;
          }
          if (v45)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "SKEventTypeAuthenticationRequest does not match expected class.", buf, 2u);
          }

          uint64_t v21 = 10002;
        }
        v22 = +[NSError errorWithDomain:@"TapToRecoverProxCardError" code:v21 userInfo:0];
        [*(id *)(a1 + 32) showOverallResultCard:v22 resultType:0];
LABEL_157:

        return;
      }
LABEL_72:
      BOOL v38 = [*(id *)(a1 + 32) logger];
      v22 = [v38 oslog];

      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_157;
      }
      unsigned int v39 = [*(id *)(a1 + 40) eventType];
      int v40 = [*(id *)(a1 + 40) eventType];
      if (v40 > 109)
      {
        if (v40 > 199)
        {
          if (v40 <= 201)
          {
            if (v40 == 200) {
              CFStringRef v41 = @"CaptiveNetworkPresent";
            }
            else {
              CFStringRef v41 = @"CaptiveNetworkNavigation";
            }
            goto LABEL_156;
          }
          if (v40 == 202)
          {
            CFStringRef v41 = @"CaptiveNetworkAuthenticated";
            goto LABEL_156;
          }
          if (v40 == 300)
          {
            CFStringRef v41 = @"BasicConfigUpdated";
            goto LABEL_156;
          }
        }
        else if (v40 > 129)
        {
          if (v40 == 130)
          {
            CFStringRef v41 = @"AuthenticationResponse";
            goto LABEL_156;
          }
          if (v40 == 140)
          {
            CFStringRef v41 = @"AuthenticationCompleted";
            goto LABEL_156;
          }
        }
        else
        {
          if (v40 == 110)
          {
            CFStringRef v41 = @"AuthenticationPresent";
            goto LABEL_156;
          }
          if (v40 == 120)
          {
            CFStringRef v41 = @"AuthenticationRequest";
            goto LABEL_156;
          }
        }
      }
      else if (v40 > 39)
      {
        if (v40 <= 41)
        {
          if (v40 == 40) {
            CFStringRef v41 = @"ConnectionStarted";
          }
          else {
            CFStringRef v41 = @"ConnectionEnded";
          }
          goto LABEL_156;
        }
        if (v40 == 42)
        {
          CFStringRef v41 = @"Error";
          goto LABEL_156;
        }
        if (v40 == 100)
        {
          CFStringRef v41 = @"AuthenticationTypeChanged";
          goto LABEL_156;
        }
      }
      else if (v40 > 19)
      {
        if (v40 == 20)
        {
          CFStringRef v41 = @"Completed";
          goto LABEL_156;
        }
        if (v40 == 30)
        {
          CFStringRef v41 = @"Invalidated";
          goto LABEL_156;
        }
      }
      else
      {
        if (!v40)
        {
          CFStringRef v41 = @"Unknown";
          goto LABEL_156;
        }
        if (v40 == 10)
        {
          CFStringRef v41 = @"Started";
LABEL_156:
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v94 = v39;
          *(_WORD *)&v94[4] = 2112;
          *(void *)&v94[6] = v41;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Unhandled event %d (%@) recieved by setupKitEventHandler", buf, 0x12u);
          goto LABEL_157;
        }
      }
      CFStringRef v41 = @"?";
      goto LABEL_156;
    }
    v34 = [*(id *)(a1 + 32) serverConfig];
    v35 = [v34 objectForKeyedSubscript:@"NeRDIntent"];
    if ([v35 isEqual:@"NeRDIntentStatus"])
    {
    }
    else
    {
      v57 = [*(id *)(a1 + 32) serverConfig];
      v58 = [v57 objectForKeyedSubscript:@"NeRDIntent"];
      unsigned int v59 = [v58 isEqual:@"NeRDIntentRecovery"];

      if (!v59) {
        goto LABEL_90;
      }
    }
    [*(id *)(a1 + 32) persistRecoveringDevice];
LABEL_90:
    v60 = [*(id *)(a1 + 32) serverConfig];
    v61 = [v60 objectForKeyedSubscript:@"NeRDIntent"];
    unsigned int v62 = [v61 isEqual:@"NeRDIntentRecoveryMenu"];

    v63 = *(void **)(a1 + 32);
    if (v62)
    {
      if (([v63 setupCompleted] & 1) == 0)
      {
        [*(id *)(a1 + 32) setSetupCompleted:1];
        BOOL v64 = [*(id *)(a1 + 32) logger];
        v65 = [v64 oslog];

        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Remote device setup complete, showing menu", buf, 2u);
        }

        [*(id *)(a1 + 32) showMenuCard];
      }
    }
    else
    {
      BOOL v66 = [v63 serverConfig];
      v67 = [v66 objectForKeyedSubscript:@"NeRDSupportsMessaging"];
      unsigned int v68 = [v67 BOOLValue];

      v69 = *(void **)(a1 + 32);
      if (v68)
      {
        if (([v69 setupCompleted] & 1) == 0)
        {
          [*(id *)(a1 + 32) setSetupCompleted:1];
          unsigned int v70 = [*(id *)(a1 + 32) logger];
          v71 = [v70 oslog];

          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Remote device setup complete, showing progress", buf, 2u);
          }

          [*(id *)(a1 + 32) showProgressCard:0];
        }
      }
      else
      {
        BOOL v77 = [v69 logger];
        v78 = [v77 oslog];

        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Remote device setup complete, messaging not supported, finish", buf, 2u);
        }

        [*(id *)(a1 + 32) showOverallResultCard:0 resultType:1];
      }
    }
    return;
  }
  if (v14 != 140)
  {
    if (v14 != 300) {
      goto LABEL_72;
    }
    v22 = *(id *)(a1 + 40);
    v23 = [*(id *)(a1 + 32) logger];
    v24 = [v23 oslog];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [v22 basicConfig];
      *(_DWORD *)buf = 138412290;
      *(void *)v94 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Remote device sent config: %@", buf, 0xCu);
    }
    v26 = [v22 basicConfig];
    [*(id *)(a1 + 32) setServerConfig:v26];

    BOOL v27 = [v22 basicConfig];
    v28 = [v27 objectForKeyedSubscript:@"NeRDVersionKey"];
    uint64_t v29 = (uint64_t)[v28 integerValue];

    if (v29 >= 3)
    {
      v30 = [*(id *)(a1 + 32) logger];
      v31 = [v30 oslog];

      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v94 = v29;
        *(_WORD *)&v94[8] = 2048;
        *(void *)&v94[10] = 2;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Remote device got higher version: %ld, our version is: %ld", buf, 0x16u);
      }

LABEL_65:
      uint64_t v32 = 10003;
LABEL_66:
      v33 = +[NSError errorWithDomain:@"TapToRecoverProxCardError" code:v32 userInfo:0];
      [*(id *)(a1 + 32) showOverallResultCard:v33 resultType:0];
LABEL_120:

      goto LABEL_157;
    }
    unsigned __int8 v48 = [v22 basicConfig];
    v49 = [v48 objectForKeyedSubscript:@"NeRDIntent"];
    if ([v49 isEqual:@"NeRDIntentStatus"])
    {
      v50 = [*(id *)(a1 + 32) setupkitClient];
      unsigned int v51 = [v50 skipWifi];

      if (v51)
      {
        v52 = [*(id *)(a1 + 32) logger];
        v53 = [v52 oslog];

        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Remote device wants to send status, showing progress", buf, 2u);
        }

        [*(id *)(a1 + 32) setSetupCompleted:1];
        v54 = *(void **)(a1 + 32);
        unsigned int v55 = [v22 basicConfig];
        [v54 showProgressCard:v55];

        v56 = *(void **)(a1 + 32);
        CFStringRef v91 = @"NeRDOOBCommand";
        CFStringRef v92 = @"NeRDOOBCommandStatus";
        v33 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
        [v56 sendMessage:v33 completionHandler:0];
        goto LABEL_120;
      }
    }
    else
    {
    }
    BOOL v72 = [v22 basicConfig];
    v73 = [v72 objectForKeyedSubscript:@"NeRDIntent"];
    unsigned int v74 = [v73 isEqual:@"NeRDIntentRecovery"];

    if (v74)
    {
      CFStringRef v75 = [*(id *)(a1 + 32) logger];
      v33 = [v75 oslog];

      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_120;
      }
      *(_WORD *)buf = 0;
      v76 = "Remote device wants to do recovery";
    }
    else
    {
      v79 = [v22 basicConfig];
      BOOL v80 = [v79 objectForKeyedSubscript:@"NeRDIntent"];
      unsigned int v81 = [v80 isEqual:@"NeRDIntentRecoveryMenu"];

      if (v81)
      {
        v82 = [*(id *)(a1 + 32) logger];
        v33 = [v82 oslog];

        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_120;
        }
        *(_WORD *)buf = 0;
        v76 = "Remote device wants to show recovery menu";
      }
      else
      {
        BOOL v83 = [v22 basicConfig];
        v84 = [v83 objectForKeyedSubscript:@"NeRDIntent"];

        v85 = *(void **)(a1 + 32);
        if (v84)
        {
          id v86 = [v85 logger];
          v87 = [v86 oslog];

          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Remote device got unknown intent, failing", buf, 2u);
          }

          goto LABEL_65;
        }
        unsigned int v88 = [v85 extendedMode];
        v89 = [*(id *)(a1 + 32) logger];
        v33 = [v89 oslog];

        BOOL v90 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        if (v88)
        {
          if (v90)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Remote device got no intent and in extended mode, failing", buf, 2u);
          }

          uint64_t v32 = 10005;
          goto LABEL_66;
        }
        if (!v90) {
          goto LABEL_120;
        }
        *(_WORD *)buf = 0;
        v76 = "Remote device got no intent and in regular mode, assuming recovery intent";
      }
    }
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v76, buf, 2u);
    goto LABEL_120;
  }
  v36 = [*(id *)(a1 + 32) logger];
  v37 = [v36 oslog];

  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "AuthCompletionHandler called with success", buf, 2u);
  }

  [*(id *)(a1 + 32) updateCodeCardToSettingUpState];
}

- (id)progressDismissButtonAction
{
  id v3 = +[NSBundle mainBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"OK" value:&stru_10001C720 table:@"Localizable"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __75__RecoverDeviceUIExtensionRemoteViewController_progressDismissButtonAction__block_invoke;
  v7[3] = &unk_10001C480;
  v7[4] = self;
  int v5 = +[PRXAction actionWithTitle:v4 style:0 handler:v7];

  return v5;
}

void __75__RecoverDeviceUIExtensionRemoteViewController_progressDismissButtonAction__block_invoke(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__RecoverDeviceUIExtensionRemoteViewController_progressDismissButtonAction__block_invoke_2;
  block[3] = &unk_10001C458;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __75__RecoverDeviceUIExtensionRemoteViewController_progressDismissButtonAction__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) logger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing card after setup completion", v6, 2u);
  }

  unsigned int v4 = [*(id *)(a1 + 32) proxCardNavController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  return [*(id *)(a1 + 32) setShowingProgress:0];
}

- (id)deviceKey
{
  id v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
  unsigned int v4 = [v3 stableIdentifier];

  if (v4)
  {
    int v5 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceObj];
    CFStringRef v6 = [v5 stableIdentifier];
  }
  else
  {
    CFStringRef v6 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  }

  return v6;
}

- (void)cleanupOldRecoveredDevices
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 dictionaryForKey:@"com.apple.RecoverDeviceUI.RecoveringDeviceKey"];

  int v5 = +[NSMutableDictionary dictionary];
  v23 = +[NSDate date];
  if (v4)
  {
    uint64_t v21 = v4;
    v22 = v5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v12 = [v6 objectForKeyedSubscript:v11, v21];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([v23 timeIntervalSinceDate:v12], v13 < 28800.0))
          {
            int v14 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
            v15 = [v14 oslog];

            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v29 = v11;
              __int16 v30 = 2112;
              v31 = v12;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Keeping key for device %@, which was added on: %@", buf, 0x16u);
            }

            [v22 setObject:v12 forKeyedSubscript:v11];
          }
          else
          {
            v16 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
            v17 = [v16 oslog];

            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v29 = v11;
              __int16 v30 = 2112;
              v31 = v12;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Cleaning up key for device %@, which was added on: %@", buf, 0x16u);
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v8);
    }

    unsigned int v18 = +[NSUserDefaults standardUserDefaults];
    int v5 = v22;
    v19 = +[NSDictionary dictionaryWithDictionary:v22];
    [v18 setObject:v19 forKey:@"com.apple.RecoverDeviceUI.RecoveringDeviceKey"];

    v20 = +[NSUserDefaults standardUserDefaults];
    [v20 synchronize];

    unsigned int v4 = v21;
  }
}

- (void)persistRecoveringDevice
{
  [(RecoverDeviceUIExtensionRemoteViewController *)self cleanupOldRecoveredDevices];
  id v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceKey];
  if (v3)
  {
    unsigned int v4 = +[NSDate date];
    int v5 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    id v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      v16 = v3;
      __int16 v17 = 2112;
      unsigned int v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Persisting recovered device: %@ with current time: %@", (uint8_t *)&v15, 0x16u);
    }

    id v7 = +[NSUserDefaults standardUserDefaults];
    id v8 = [v7 dictionaryForKey:@"com.apple.RecoverDeviceUI.RecoveringDeviceKey"];
    id v9 = [v8 mutableCopy];

    if (!v9)
    {
      v10 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
      uint64_t v11 = [v10 oslog];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No recovered device ids found, Creating a new dictionary", (uint8_t *)&v15, 2u);
      }

      id v9 = +[NSMutableDictionary dictionary];
    }
    [v9 setObject:v4 forKeyedSubscript:v3];
    v12 = +[NSUserDefaults standardUserDefaults];
    [v12 setObject:v9 forKey:@"com.apple.RecoverDeviceUI.RecoveringDeviceKey"];

    double v13 = +[NSUserDefaults standardUserDefaults];
    [v13 synchronize];
  }
  else
  {
    int v14 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    unsigned int v4 = [v14 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No key to identify the device was found, not persisting", (uint8_t *)&v15, 2u);
    }
  }
}

- (BOOL)matchesRecentlyRecoveredDevice
{
  [(RecoverDeviceUIExtensionRemoteViewController *)self cleanupOldRecoveredDevices];
  id v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self deviceKey];
  if (v3)
  {
    unsigned int v4 = +[NSUserDefaults standardUserDefaults];
    int v5 = [v4 dictionaryForKey:@"com.apple.RecoverDeviceUI.RecoveringDeviceKey"];

    if (v5
      && ([v5 objectForKeyedSubscript:v3],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      id v7 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
      id v8 = [v7 oslog];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v5 objectForKeyedSubscript:v3];
        int v14 = 138412546;
        int v15 = v3;
        __int16 v16 = 2112;
        __int16 v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device %@ found in recovered device ids (added on: %@)", (uint8_t *)&v14, 0x16u);
      }
      BOOL v10 = 1;
    }
    else
    {
      uint64_t v11 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
      id v8 = [v11 oslog];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        int v15 = v3;
        __int16 v16 = 2112;
        __int16 v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device %@ is not a recently recovered device. Recently recovered: %@", (uint8_t *)&v14, 0x16u);
      }
      BOOL v10 = 0;
    }
  }
  else
  {
    v12 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    int v5 = [v12 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No key to identify the device was found, not persisting", (uint8_t *)&v14, 2u);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (id)overallResultSUButtonAction
{
  id v3 = +[NSBundle mainBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"UPDATE_NOW" value:&stru_10001C720 table:@"Localizable"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __75__RecoverDeviceUIExtensionRemoteViewController_overallResultSUButtonAction__block_invoke;
  v7[3] = &unk_10001C480;
  v7[4] = self;
  int v5 = +[PRXAction actionWithTitle:v4 style:0 handler:v7];

  return v5;
}

void __75__RecoverDeviceUIExtensionRemoteViewController_overallResultSUButtonAction__block_invoke(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__RecoverDeviceUIExtensionRemoteViewController_overallResultSUButtonAction__block_invoke_2;
  block[3] = &unk_10001C458;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __75__RecoverDeviceUIExtensionRemoteViewController_overallResultSUButtonAction__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) logger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Moving to software update pane", v6, 2u);
  }

  unsigned int v4 = [*(id *)(a1 + 32) proxCardNavController];
  [v4 dismissViewControllerAnimated:1 completion:&__block_literal_global];

  return [*(id *)(a1 + 32) setOverallResultCard:0];
}

void __75__RecoverDeviceUIExtensionRemoteViewController_overallResultSUButtonAction__block_invoke_423(id a1)
{
  +[NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK&ShowDefaultAudiencePane=YES"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = +[LSApplicationWorkspace defaultWorkspace];
  [v1 openSensitiveURL:v2 withOptions:0];
}

- (id)overallResultOKButtonAction
{
  id v3 = +[NSBundle mainBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"OK" value:&stru_10001C720 table:@"Localizable"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __75__RecoverDeviceUIExtensionRemoteViewController_overallResultOKButtonAction__block_invoke;
  v7[3] = &unk_10001C480;
  v7[4] = self;
  int v5 = +[PRXAction actionWithTitle:v4 style:0 handler:v7];

  return v5;
}

void __75__RecoverDeviceUIExtensionRemoteViewController_overallResultOKButtonAction__block_invoke(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__RecoverDeviceUIExtensionRemoteViewController_overallResultOKButtonAction__block_invoke_2;
  block[3] = &unk_10001C458;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __75__RecoverDeviceUIExtensionRemoteViewController_overallResultOKButtonAction__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) logger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing card after setup completion", v6, 2u);
  }

  unsigned int v4 = [*(id *)(a1 + 32) proxCardNavController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  return [*(id *)(a1 + 32) setOverallResultCard:0];
}

- (id)getOverallResultTitleStringForError:(id)a3 resultType:(int)a4
{
  id v6 = a3;
  id v7 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  dispatch_assert_queue_V2(v7);

  if (!v6)
  {
    if (a4 == 4)
    {
      v12 = +[NSBundle mainBundle];
      uint64_t v13 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
      uint64_t v11 = (void *)v13;
      CFStringRef v14 = @"OVERALL_RESULT_RECOVERY_SUCCESS_TITLE";
    }
    else if (a4 == 8)
    {
      v12 = +[NSBundle mainBundle];
      uint64_t v13 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
      uint64_t v11 = (void *)v13;
      CFStringRef v14 = @"OVERALL_RESULT_REBOOT_SUCCESS_TITLE";
    }
    else
    {
      v12 = +[NSBundle mainBundle];
      uint64_t v13 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
      if (a4 == 6)
      {
        uint64_t v11 = (void *)v13;
        CFStringRef v14 = @"OVERALL_RESULT_EACS_SUCCESS_TITLE";
      }
      else
      {
        uint64_t v11 = (void *)v13;
        CFStringRef v14 = @"OVERALL_RESULT_SUCCESS_TITLE";
      }
    }
    long long v27 = +[NSString stringWithFormat:@"%@_%@", v14, v13];
    v28 = [v12 localizedStringForKey:v27 value:&stru_10001C720 table:@"Localizable"];
    uint64_t v19 = +[NSString stringWithFormat:v28];

    goto LABEL_28;
  }
  switch(a4)
  {
    case 2:
      id v8 = +[NSBundle mainBundle];
      id v9 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
      BOOL v10 = +[NSString stringWithFormat:@"%@_%@", @"OVERALL_RESULT_RECOVERY_FAILURE_TITLE", v9];
      uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_10001C720 table:@"Localizable"];

      goto LABEL_10;
    case 3:
      int v15 = +[NSBundle mainBundle];
      id v8 = v15;
      CFStringRef v16 = @"OVERALL_RESULT_RECOVERY_DISCONNECT_TITLE";
      goto LABEL_13;
    case 5:
      int v15 = +[NSBundle mainBundle];
      id v8 = v15;
      CFStringRef v16 = @"OVERALL_RESULT_EACS_FAILURE_TITLE";
      goto LABEL_13;
    case 7:
      int v15 = +[NSBundle mainBundle];
      id v8 = v15;
      CFStringRef v16 = @"OVERALL_RESULT_REBOOT_FAILURE_TITLE";
LABEL_13:
      uint64_t v11 = [v15 localizedStringForKey:v16 value:&stru_10001C720 table:@"Localizable"];
      break;
    default:
      id v8 = +[NSBundle mainBundle];
      id v9 = [v8 localizedStringForKey:@"OVERALL_RESULT_SETUP_FAILURE_TITLE" value:&stru_10001C720 table:@"Localizable"];
      uint64_t v11 = +[NSString stringWithFormat:v9];
LABEL_10:

      break;
  }

  __int16 v17 = [v6 domain];
  unsigned int v18 = [v17 isEqualToString:@"TapToRecoverProxCardError"];

  if (v18)
  {
    if ([v6 code] != (id)10003) {
      goto LABEL_29;
    }
    v12 = +[NSBundle mainBundle];
    uint64_t v19 = [v12 localizedStringForKey:@"SOFTWARE_UPDATE" value:&stru_10001C720 table:@"Localizable"];
    goto LABEL_28;
  }
  v20 = [v6 domain];
  unsigned int v21 = [v20 isEqualToString:NSOSStatusErrorDomain];

  if (v21)
  {
    v22 = (char *)[v6 code];
    if ((unint64_t)(v22 - 301000) <= 0x22 && ((1 << (v22 + 56)) & 0x400000011) != 0)
    {
      unsigned int v23 = [(RecoverDeviceUIExtensionRemoteViewController *)self useAlternateStringForWiFI];
      v12 = +[NSBundle mainBundle];
      uint64_t v24 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
      long long v25 = (void *)v24;
      if (v23) {
        CFStringRef v26 = @"OVERALL_RESULT_FAILURE_WLAN_TITLE";
      }
      else {
        CFStringRef v26 = @"OVERALL_RESULT_FAILURE_WIFI_TITLE";
      }
      uint64_t v29 = +[NSString stringWithFormat:@"%@_%@", v26, v24];
      uint64_t v19 = [v12 localizedStringForKey:v29 value:&stru_10001C720 table:@"Localizable"];

      uint64_t v11 = v25;
LABEL_28:

      uint64_t v11 = (void *)v19;
    }
  }
LABEL_29:

  return v11;
}

- (id)getOverallResultSubTitleStringForError:(id)a3 resultType:(int)a4
{
  id v6 = a3;
  id v7 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    switch(a4)
    {
      case 2:
        id v8 = +[NSBundle mainBundle];
        uint64_t v9 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
        BOOL v10 = (void *)v9;
        CFStringRef v11 = @"OVERALL_RESULT_RECOVERY_FAILURE_DESCRIPTION";
        goto LABEL_15;
      case 3:
        unsigned int v16 = [(RecoverDeviceUIExtensionRemoteViewController *)self useAlternateStringForWiFI];
        id v8 = +[NSBundle mainBundle];
        if (v16) {
          CFStringRef v17 = @"OVERALL_RESULT_RECOVERY_DISCONNECT_DESCRIPTION_WLAN";
        }
        else {
          CFStringRef v17 = @"OVERALL_RESULT_RECOVERY_DISCONNECT_DESCRIPTION";
        }
        BOOL v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v17];
        unsigned int v18 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
        unsigned int v23 = +[NSString stringWithFormat:@"%@_%@", v10, v18];
        uint64_t v19 = [v8 localizedStringForKey:v23 value:&stru_10001C720 table:@"Localizable"];

        goto LABEL_22;
      case 5:
        id v8 = +[NSBundle mainBundle];
        uint64_t v9 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
        BOOL v10 = (void *)v9;
        CFStringRef v11 = @"OVERALL_RESULT_EACS_FAILURE_DESCRIPTION";
        goto LABEL_15;
      case 7:
        id v8 = +[NSBundle mainBundle];
        uint64_t v9 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
        BOOL v10 = (void *)v9;
        CFStringRef v11 = @"OVERALL_RESULT_REBOOT_FAILURE_DESCRIPTION";
        goto LABEL_15;
      default:
        id v8 = +[NSBundle mainBundle];
        uint64_t v9 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
        BOOL v10 = (void *)v9;
        CFStringRef v11 = @"OVERALL_RESULT_FAILURE_DESCRIPTION";
LABEL_15:
        unsigned int v18 = +[NSString stringWithFormat:@"%@_%@", v11, v9];
        uint64_t v19 = [v8 localizedStringForKey:v18 value:&stru_10001C720 table:@"Localizable"];
LABEL_22:

        uint64_t v24 = [v6 domain];
        unsigned int v25 = [v24 isEqualToString:@"TapToRecoverProxCardError"];

        if (!v25)
        {
          v33 = [v6 domain];
          unsigned int v34 = [v33 isEqualToString:NSOSStatusErrorDomain];

          if (!v34) {
            goto LABEL_56;
          }
          v35 = (char *)[v6 code];
          if ((unint64_t)(v35 - 301000) <= 0x22 && ((1 << (v35 + 56)) & 0x400000011) != 0
            || v35 == (char *)-71158)
          {
            v36 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
            v37 = [v36 oslog];

            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              id v67 = [v6 code];
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Error Description: WiFi is unavailable/unsupported/not connected to network : %ld", buf, 0xCu);
            }

            unsigned int v38 = [(RecoverDeviceUIExtensionRemoteViewController *)self useAlternateStringForWiFI];
            uint64_t v29 = +[NSBundle mainBundle];
            if (v38) {
              CFStringRef v39 = @"OVERALL_RESULT_FAILURE_WLAN_UNAVAILABLE";
            }
            else {
              CFStringRef v39 = @"OVERALL_RESULT_FAILURE_WIFI_UNAVAILABLE";
            }
            v46 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v39];
            uint64_t v47 = [v29 localizedStringForKey:v46 value:&stru_10001C720 table:@"Localizable"];

            uint64_t v19 = (void *)v47;
            goto LABEL_55;
          }
          v61 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
          uint64_t v29 = [v61 oslog];

          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            id v67 = [v6 code];
            v49 = "Error Description: Generic/Unsupported error code from NSOSStatusErrorDomain(%ld). Using default subtitle";
            unsigned int v51 = v29;
            uint32_t v52 = 12;
            goto LABEL_50;
          }
          goto LABEL_55;
        }
        uint64_t v26 = (uint64_t)[v6 code];
        if (v26 <= 10000)
        {
          if (!v26)
          {
            v50 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
            uint64_t v29 = [v50 oslog];

            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v49 = "Error Description: No error code specified. Using default subtitle";
              goto LABEL_49;
            }
LABEL_55:

            goto LABEL_56;
          }
          if (v26 == 10000)
          {
            long long v27 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
            v28 = [v27 oslog];

            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Error Description: Too many code entry attempts", buf, 2u);
            }

            uint64_t v29 = +[NSBundle mainBundle];
            uint64_t v30 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
            v31 = (void *)v30;
            CFStringRef v32 = @"OVERALL_RESULT_FAILURE_TOO_MANY_CODE_ATTEMPTS_DESCRIPTION";
            goto LABEL_54;
          }
LABEL_45:
          unsigned __int8 v48 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
          uint64_t v29 = [v48 oslog];

          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v49 = "Error Description: Generic error code. Using default subtitle";
LABEL_49:
            unsigned int v51 = v29;
            uint32_t v52 = 2;
LABEL_50:
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, v49, buf, v52);
            goto LABEL_55;
          }
          goto LABEL_55;
        }
        if (v26 == 10001)
        {
          v53 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
          v54 = [v53 oslog];

          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Error Description: Expected a paired device but BLE server sent auth request", buf, 2u);
          }

          uint64_t v29 = +[NSBundle mainBundle];
          uint64_t v30 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
          v31 = (void *)v30;
          CFStringRef v32 = @"OVERALL_RESULT_FAILURE_CONNECTED_TO_ANOTHER";
          goto LABEL_54;
        }
        if (v26 != 10003) {
          goto LABEL_45;
        }
        int v40 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
        CFStringRef v41 = [v40 oslog];

        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Error Description: version mismatch", buf, 2u);
        }

        unsigned int v42 = +[UIDevice currentDevice];
        v43 = [v42 model];
        unsigned int v44 = [v43 uppercaseString];
        unsigned int v45 = [v44 containsString:@"IPHONE"];

        if (v45)
        {
          uint64_t v29 = +[NSBundle mainBundle];
          uint64_t v30 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
          v31 = (void *)v30;
          CFStringRef v32 = @"OVERALL_RESULT_FAILURE_VERSION_IPHONE";
LABEL_54:
          unsigned int v55 = +[NSString stringWithFormat:@"%@_%@", v32, v30];
          uint64_t v56 = [v29 localizedStringForKey:v55 value:&stru_10001C720 table:@"Localizable"];

          uint64_t v19 = (void *)v56;
          goto LABEL_55;
        }
        unsigned int v62 = +[UIDevice currentDevice];
        v63 = [v62 model];
        BOOL v64 = [v63 uppercaseString];
        unsigned int v65 = [v64 containsString:@"IPAD"];

        if (v65)
        {
          uint64_t v29 = +[NSBundle mainBundle];
          uint64_t v30 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
          v31 = (void *)v30;
          CFStringRef v32 = @"OVERALL_RESULT_FAILURE_VERSION_IPAD";
          goto LABEL_54;
        }
LABEL_56:
        if (os_variant_has_internal_content())
        {
          v57 = [v6 description];
          uint64_t v58 = [v19 stringByAppendingFormat:@"\n[Internal Only]: %@", v57];

          uint64_t v19 = (void *)v58;
        }
        unsigned int v59 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
        CFStringRef v14 = [v59 oslog];

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v67 = v19;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Subtitle is: %@", buf, 0xCu);
        }
        break;
    }
  }
  else
  {
    v12 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    uint64_t v13 = [v12 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No error object passed in to covert to subtitle string", buf, 2u);
    }

    if (a4 == 8)
    {
      CFStringRef v14 = +[NSBundle mainBundle];
      CFStringRef v15 = @"OVERALL_RESULT_REBOOT_DESCRIPTION";
    }
    else if (a4 == 6)
    {
      CFStringRef v14 = +[NSBundle mainBundle];
      CFStringRef v15 = @"OVERALL_RESULT_EACS_DESCRIPTION";
    }
    else
    {
      CFStringRef v14 = +[NSBundle mainBundle];
      if (a4 == 4) {
        CFStringRef v15 = @"OVERALL_RESULT_RECOVERY_DESCRIPTION";
      }
      else {
        CFStringRef v15 = @"OVERALL_RESULT_SUCCESS_DESCRIPTION";
      }
    }
    v20 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v15];
    unsigned int v21 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
    v22 = +[NSString stringWithFormat:@"%@_%@", v20, v21];
    uint64_t v19 = [v14 localizedStringForKey:v22 value:&stru_10001C720 table:@"Localizable"];
  }

  return v19;
}

- (id)getOverallResultActionForError:(id)a3 resultType:(int)a4
{
  id v5 = a3;
  id v6 = [v5 domain];
  unsigned int v7 = [v6 isEqualToString:@"TapToRecoverProxCardError"];

  if (v7 && [v5 code] == (id)10003)
  {
    id v8 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    uint64_t v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error Description: version mismatch", v13, 2u);
    }

    uint64_t v10 = [(RecoverDeviceUIExtensionRemoteViewController *)self overallResultSUButtonAction];
  }
  else
  {
    uint64_t v10 = [(RecoverDeviceUIExtensionRemoteViewController *)self overallResultOKButtonAction];
  }
  CFStringRef v11 = (void *)v10;

  return v11;
}

- (id)getOverallResultUIImageForError:(id)a3 resultType:(int)a4
{
  id v6 = a3;
  if (v6)
  {
    if (a4 == 3)
    {
      id v7 = objc_alloc((Class)UIImageView);
      id v8 = +[UIImage systemImageNamed:@"wifi.exclamationmark"];
      id v9 = [v7 initWithImage:v8];

      uint64_t v10 = +[UIColor systemGray3Color];
      [v9 setTintColor:v10];

      CFStringRef v11 = +[UIImageSymbolConfiguration configurationWithPointSize:80.0];
      [v9 setPreferredSymbolConfiguration:v11];
    }
    else
    {
      id v9 = 0;
    }
    CFStringRef v15 = [v6 domain];
    unsigned int v16 = [v15 isEqualToString:@"TapToRecoverProxCardError"];

    if (v16)
    {
      if ([v6 code] != (id)10003) {
        goto LABEL_16;
      }
      id v17 = objc_alloc((Class)UIImageView);
      CFStringRef v18 = @"gear";
    }
    else
    {
      uint64_t v19 = [v6 domain];
      unsigned int v20 = [v19 isEqualToString:NSOSStatusErrorDomain];

      if (!v20
        || ((unsigned int v21 = (char *)[v6 code], (unint64_t)(v21 - 301000) > 0x22)
         || ((1 << (v21 + 56)) & 0x400000011) == 0)
        && v21 != (char *)-71158)
      {
LABEL_16:
        if (!v9)
        {
          id v9 = [(RecoverDeviceUIExtensionRemoteViewController *)self uiImage];
        }
        goto LABEL_22;
      }
      id v17 = objc_alloc((Class)UIImageView);
      CFStringRef v18 = @"wifi.slash";
    }
    v22 = +[UIImage systemImageNamed:v18];
    id v23 = [v17 initWithImage:v22];

    uint64_t v24 = +[UIColor systemGray3Color];
    [v23 setTintColor:v24];

    unsigned int v25 = +[UIImageSymbolConfiguration configurationWithPointSize:80.0];
    [v23 setPreferredSymbolConfiguration:v25];

    id v9 = v23;
    goto LABEL_16;
  }
  int v12 = a4 - 1;
  id v9 = 0;
  switch(v12)
  {
    case 0:
    case 5:
      break;
    case 3:
      id v13 = objc_alloc((Class)UIImageView);
      CFStringRef v14 = @"gear";
      goto LABEL_20;
    case 7:
      id v13 = objc_alloc((Class)UIImageView);
      CFStringRef v14 = @"arrowtriangle.backward.circle";
LABEL_20:
      uint64_t v29 = +[UIImage systemImageNamed:v14];
      id v9 = [v13 initWithImage:v29];

      uint64_t v28 = +[UIColor systemGrayColor];
      goto LABEL_21;
    default:
      id v26 = objc_alloc((Class)UIImageView);
      long long v27 = +[UIImage systemImageNamed:@"checkmark.circle.fill"];
      id v9 = [v26 initWithImage:v27];

      uint64_t v28 = +[UIColor systemGreenColor];
LABEL_21:
      uint64_t v30 = (void *)v28;
      [v9 setTintColor:v28];

      v31 = +[UIImageSymbolConfiguration configurationWithPointSize:64.0];
      [v9 setPreferredSymbolConfiguration:v31];

      break;
  }
LABEL_22:

  return v9;
}

- (void)updateProgressCardOnMainQueueWithInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = [v4 objectForKeyedSubscript:@"NeRDState"];
  id v6 = [v4 objectForKeyedSubscript:@"NeRDProgress"];

  if (!v5)
  {
    id v7 = +[NSBundle mainBundle];
    id v8 = v7;
    CFStringRef v9 = @"PROGRESS_FETCHING";
    goto LABEL_11;
  }
  if ([v5 isEqual:@"NeRDStateScanning"])
  {
    id v7 = +[NSBundle mainBundle];
    id v8 = v7;
    CFStringRef v9 = @"PROGRESS_STATE_SCANNING";
LABEL_11:
    uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_10001C720 table:@"Localizable"];
    CFStringRef v11 = [(RecoverDeviceUIExtensionRemoteViewController *)self progressText];
    [v11 setText:v10];

LABEL_12:
    goto LABEL_13;
  }
  if ([v5 isEqual:@"NeRDStateDownloading"])
  {
    id v7 = +[NSBundle mainBundle];
    id v8 = v7;
    CFStringRef v9 = @"PROGRESS_STATE_DOWNLOADING";
    goto LABEL_11;
  }
  if ([v5 isEqual:@"NeRDStatePreparing"])
  {
    id v7 = +[NSBundle mainBundle];
    id v8 = v7;
    CFStringRef v9 = @"PROGRESS_STATE_PREPARING";
    goto LABEL_11;
  }
  if ([v5 isEqual:@"NeRDStateInstalling"])
  {
    id v7 = +[NSBundle mainBundle];
    id v8 = v7;
    CFStringRef v9 = @"PROGRESS_STATE_INSTALLING";
    goto LABEL_11;
  }
  if (([v5 isEqual:@"NeRDStateInstalled"] & 1) == 0)
  {
    unsigned int v16 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    id v8 = [v16 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      CFStringRef v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknown state (%@)!  file a bug", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:
  if (v6)
  {
    float v12 = (double)(unint64_t)[v6 unsignedIntegerValue] * 0.01;
    id v13 = [(RecoverDeviceUIExtensionRemoteViewController *)self progressView];
    *(float *)&double v14 = v12;
    [v13 setProgress:1 animated:v14];

    CFStringRef v15 = [(RecoverDeviceUIExtensionRemoteViewController *)self progressView];
    [v15 setNeedsLayout];
  }
}

- (void)showProgressCard:(id)a3
{
  id v4 = a3;
  id v5 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __65__RecoverDeviceUIExtensionRemoteViewController_showProgressCard___block_invoke;
  v7[3] = &unk_10001C430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__RecoverDeviceUIExtensionRemoteViewController_showProgressCard___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)PRXIconContentViewController);
  [*(id *)(a1 + 32) setProgressCard:v2];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __65__RecoverDeviceUIExtensionRemoteViewController_showProgressCard___block_invoke_2;
  v4[3] = &unk_10001C430;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void __65__RecoverDeviceUIExtensionRemoteViewController_showProgressCard___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowingProgress:1];
  id v2 = [*(id *)(a1 + 32) progressCard];
  [v2 setDismissalType:3];

  id v3 = +[NSBundle mainBundle];
  id v4 = [*(id *)(a1 + 32) kLocalizedDeviceType];
  id v5 = +[NSString stringWithFormat:@"%@_%@", @"PROGRESS_CARD_TITLE", v4];
  id v6 = [v3 localizedStringForKey:v5 value:&stru_10001C720 table:@"Localizable"];
  id v7 = [*(id *)(a1 + 32) progressCard];
  [v7 setTitle:v6];

  id v8 = +[NSBundle mainBundle];
  CFStringRef v9 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PROGRESS_CARD_USAGE_INSTRUCTIONS"];
  uint64_t v10 = [*(id *)(a1 + 32) kLocalizedDeviceType];
  CFStringRef v11 = +[NSString stringWithFormat:@"%@_%@", v9, v10];
  float v12 = [v8 localizedStringForKey:v11 value:&stru_10001C720 table:@"Localizable"];
  id v13 = [*(id *)(a1 + 32) progressCard];
  [v13 setSubtitle:v12];

  id v14 = [objc_alloc((Class)UIProgressView) initWithProgressViewStyle:0];
  [*(id *)(a1 + 32) setProgressView:v14];

  id v15 = [objc_alloc((Class)PRXLabel) initWithStyle:1];
  LODWORD(v12) = [*(id *)(a1 + 32) isCompanionSameDevice];
  unsigned int v16 = +[NSBundle mainBundle];
  if (v12)
  {
    int v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PROGRESS_CARD_VIEW_AGAIN_OTHER"];
    CFStringRef v18 = [v16 localizedStringForKey:v17 value:&stru_10001C720 table:@"Localizable"];
    [v15 setText:v18];
  }
  else
  {
    int v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PROGRESS_CARD_VIEW_AGAIN"];
    CFStringRef v18 = [*(id *)(a1 + 32) kLocalizedDeviceType];
    uint64_t v19 = +[NSString stringWithFormat:@"%@_%@", v17, v18];
    unsigned int v20 = [v16 localizedStringForKey:v19 value:&stru_10001C720 table:@"Localizable"];
    [v15 setText:v20];
  }
  id v21 = objc_alloc_init((Class)UILabel);
  [*(id *)(a1 + 32) setProgressText:v21];

  v22 = [*(id *)(a1 + 32) progressText];
  [v22 setTextAlignment:1];

  id v23 = +[UIColor systemGrayColor];
  uint64_t v24 = [*(id *)(a1 + 32) progressText];
  [v24 setTextColor:v23];

  +[UIFont smallSystemFontSize];
  unsigned int v25 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  id v26 = [*(id *)(a1 + 32) progressText];
  [v26 setFont:v25];

  id v27 = objc_alloc((Class)UIStackView);
  v64[0] = v15;
  uint64_t v28 = [*(id *)(a1 + 32) progressView];
  v64[1] = v28;
  uint64_t v29 = [*(id *)(a1 + 32) progressText];
  v64[2] = v29;
  uint64_t v30 = +[NSArray arrayWithObjects:v64 count:3];
  id v31 = [v27 initWithArrangedSubviews:v30];

  [v31 setCustomSpacing:v15 afterView:30.0];
  [v31 setAxis:1];
  [v31 setSpacing:6.0];
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  CFStringRef v32 = [*(id *)(a1 + 32) progressCard];
  v33 = [v32 contentView];
  [v33 addSubview:v31];

  unsigned int v34 = [*(id *)(a1 + 32) progressCard];
  v35 = [v34 contentView];
  v36 = [v35 mainContentGuide];

  unsigned int v62 = [v31 topAnchor];
  v61 = [v36 topAnchor];
  unsigned int v59 = [v62 constraintGreaterThanOrEqualToAnchor:v61];
  v63[0] = v59;
  v57 = [v31 bottomAnchor];
  uint64_t v56 = [v36 bottomAnchor];
  unsigned int v55 = [v57 constraintLessThanOrEqualToAnchor:v56];
  v63[1] = v55;
  v54 = [v31 centerYAnchor];
  v53 = [v36 centerYAnchor];
  uint32_t v52 = [v54 constraintEqualToAnchor:v53];
  v63[2] = v52;
  unsigned int v51 = [v31 centerXAnchor];
  v50 = [v36 centerXAnchor];
  v37 = [v51 constraintEqualToAnchor:v50];
  v63[3] = v37;
  unsigned int v38 = [v31 trailingAnchor];
  uint64_t v58 = v36;
  CFStringRef v39 = [v36 trailingAnchor];
  int v40 = [v38 constraintEqualToAnchor:v39];
  v63[4] = v40;
  CFStringRef v41 = [v31 leadingAnchor];
  [v36 leadingAnchor];
  unsigned int v42 = v60 = v15;
  v43 = [v41 constraintEqualToAnchor:v42];
  v63[5] = v43;
  unsigned int v44 = +[NSArray arrayWithObjects:v63 count:6];
  +[NSLayoutConstraint activateConstraints:v44];

  [*(id *)(a1 + 32) updateProgressCardOnMainQueueWithInfo:*(void *)(a1 + 40)];
  unsigned int v45 = [*(id *)(a1 + 32) progressCard];
  v46 = [*(id *)(a1 + 32) progressDismissButtonAction];
  id v47 = [v45 addAction:v46];

  unsigned __int8 v48 = [*(id *)(a1 + 32) proxCardNavController];
  v49 = [*(id *)(a1 + 32) progressCard];
  [v48 pushViewController:v49 animated:1];
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_10001C560;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) setupkitClient];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v11 = SKOptionTimeoutSeconds;
    id v12 = &off_10001DCA0;
    id v4 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke_582;
    v9[3] = &unk_10001C510;
    id v5 = &v10;
    id v6 = *(id *)(a1 + 48);
    v9[4] = *(void *)(a1 + 40);
    id v10 = v6;
    [v2 sendEventID:@"osrEventID" eventMessage:v3 options:v4 completionHandler:v9];
  }
  else
  {
    if (!*(void *)(a1 + 48)) {
      return;
    }
    id v2 = [*(id *)(a1 + 40) recoverDeviceOperationsQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke_3;
    v7[3] = &unk_10001C538;
    id v5 = &v8;
    id v8 = *(id *)(a1 + 48);
    dispatch_async(v2, v7);
  }
}

void __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke_582(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) recoverDeviceOperationsQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke_2;
    v5[3] = &unk_10001C4E8;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)backToMenuButton
{
  +[PRXButton buttonWithProximityType:0];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __64__RecoverDeviceUIExtensionRemoteViewController_backToMenuButton__block_invoke;
  v17[3] = &unk_10001C588;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v3;
  uint64_t v19 = self;
  id v4 = +[UIAction actionWithHandler:v17];
  [v3 addAction:v4 forControlEvents:0x2000];

  id v5 = +[UIButtonConfiguration plainButtonConfiguration];
  [v5 setTitleAlignment:2];
  id v6 = objc_alloc((Class)NSAttributedString);
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"GO_BACK" value:&stru_10001C720 table:@"Localizable"];
  NSAttributedStringKey v20 = NSFontAttributeName;
  id v9 = +[UIFontMetrics defaultMetrics];
  id v10 = +[UIFont systemFontOfSize:17.0 weight:UIFontWeightMedium];
  uint64_t v11 = [v9 scaledFontForFont:v10 compatibleWithTraitCollection:0];
  id v21 = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v13 = [v6 initWithString:v8 attributes:v12];

  [v5 setAttributedTitle:v13];
  id v14 = +[UIColor systemBlueColor];
  [v5 setBaseForegroundColor:v14];

  [v3 setConfiguration:v5];
  id v15 = v3;

  return v15;
}

id __64__RecoverDeviceUIExtensionRemoteViewController_backToMenuButton__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 showMenuCard];
}

- (void)showRecoveryCard
{
  id v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke;
  block[3] = &unk_10001C458;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)PRXIconContentViewController);
  [*(id *)(a1 + 32) setRecoveryCard:v2];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke_2;
  block[3] = &unk_10001C458;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recoveryCard];
  [v2 setDismissalType:3];

  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"MENU_SYSTEM_RECOVERY_BUTTON_TITLE" value:&stru_10001C720 table:@"Localizable"];
  id v5 = [*(id *)(a1 + 32) recoveryCard];
  [v5 setTitle:v4];

  id v6 = +[NSBundle mainBundle];
  id v7 = [*(id *)(a1 + 32) kLocalizedDeviceType];
  id v8 = +[NSString stringWithFormat:@"%@_%@", @"SYSTEM_RECOVERY_DETAILS", v7];
  id v9 = [v6 localizedStringForKey:v8 value:&stru_10001C720 table:@"Localizable"];
  id v10 = [*(id *)(a1 + 32) recoveryCard];
  [v10 setSubtitle:v9];

  id v11 = objc_alloc((Class)UIImageView);
  id v12 = +[UIImage systemImageNamed:@"gear"];
  id v13 = [v11 initWithImage:v12];

  id v14 = +[UIColor systemGray3Color];
  [v13 setTintColor:v14];

  id v15 = +[UIImageSymbolConfiguration configurationWithPointSize:80.0];
  [v13 setPreferredSymbolConfiguration:v15];

  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  unsigned int v16 = [*(id *)(a1 + 32) recoveryCard];
  int v17 = [v16 contentView];
  [v17 addSubview:v13];

  id v18 = [*(id *)(a1 + 32) recoveryCard];
  uint64_t v19 = [v18 contentView];
  NSAttributedStringKey v20 = [v19 mainContentGuide];

  id v21 = v13;
  v43 = [v13 topAnchor];
  v22 = [v20 topAnchor];
  id v23 = [v43 constraintGreaterThanOrEqualToAnchor:v22];
  v48[0] = v23;
  unsigned int v45 = v13;
  uint64_t v24 = [v13 centerYAnchor];
  unsigned int v44 = v20;
  unsigned int v25 = [v20 centerYAnchor];
  id v26 = [v24 constraintEqualToAnchor:v25];
  v48[1] = v26;
  id v27 = [v21 centerXAnchor];
  uint64_t v28 = [v20 centerXAnchor];
  uint64_t v29 = [v27 constraintEqualToAnchor:v28];
  v48[2] = v29;
  uint64_t v30 = +[NSArray arrayWithObjects:v48 count:3];
  +[NSLayoutConstraint activateConstraints:v30];

  id v31 = [*(id *)(a1 + 32) recoveryCard];
  CFStringRef v32 = +[NSBundle mainBundle];
  v33 = [v32 localizedStringForKey:@"START_RECOVERY_BUTTON_TEXT" value:&stru_10001C720 table:@"Localizable"];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke_3;
  v47[3] = &unk_10001C480;
  v47[4] = *(void *)(a1 + 32);
  unsigned int v34 = +[PRXAction actionWithTitle:v33 style:0 handler:v47];
  id v35 = [v31 addAction:v34];

  v36 = [*(id *)(a1 + 32) recoveryCard];
  v37 = +[NSBundle mainBundle];
  unsigned int v38 = [v37 localizedStringForKey:@"GO_BACK" value:&stru_10001C720 table:@"Localizable"];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke_605;
  v46[3] = &unk_10001C480;
  v46[4] = *(void *)(a1 + 32);
  CFStringRef v39 = +[PRXAction actionWithTitle:v38 style:1 handler:v46];
  id v40 = [v36 addAction:v39];

  CFStringRef v41 = [*(id *)(a1 + 32) proxCardNavController];
  unsigned int v42 = [*(id *)(a1 + 32) recoveryCard];
  [v41 pushViewController:v42 animated:1];
}

id __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke_3(uint64_t a1, void *a2)
{
  [a2 setEnabled:0];
  id v3 = [*(id *)(a1 + 32) recoveryCard];
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"MENU_SYSTEM_RECOVERY_IN_PROGRESS_TEXT" value:&stru_10001C720 table:@"Localizable"];
  [v3 showActivityIndicatorWithStatus:v5];

  id v6 = *(void **)(a1 + 32);
  CFStringRef v15 = @"NeRDCommand";
  CFStringRef v16 = @"NeRDCommandRecover";
  id v7 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  [v6 sendMessage:v7 completionHandler:0];

  [*(id *)(a1 + 32) persistRecoveringDevice];
  id v8 = [*(id *)(a1 + 32) serverConfig];
  id v9 = [v8 objectForKeyedSubscript:@"NeRDSupportsMessaging"];
  LODWORD(v5) = [v9 BOOLValue];

  id v10 = [*(id *)(a1 + 32) logger];
  id v11 = [v10 oslog];

  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v12)
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "recovery button pressed, showing progress", v14, 2u);
    }

    return [*(id *)(a1 + 32) showProgressCard:0];
  }
  else
  {
    if (v12)
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "recovery button pressed, messaging not supported, finish", v14, 2u);
    }

    return [*(id *)(a1 + 32) showOverallResultCard:0 resultType:1];
  }
}

id __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke_605(uint64_t a1, void *a2)
{
  [a2 setEnabled:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 showMenuCard];
}

- (id)menuSystemRecoveryButton
{
  +[PRXButton buttonWithProximityType:1];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __72__RecoverDeviceUIExtensionRemoteViewController_menuSystemRecoveryButton__block_invoke;
  v18[3] = &unk_10001C588;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v3;
  NSAttributedStringKey v20 = self;
  id v4 = +[UIAction actionWithHandler:v18];
  [v3 addAction:v4 forControlEvents:0x2000];

  id v5 = +[UIButtonConfiguration plainButtonConfiguration];
  [v5 setTitleAlignment:2];
  id v6 = objc_alloc((Class)NSAttributedString);
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"MENU_SYSTEM_RECOVERY_BUTTON_TEXT" value:&stru_10001C720 table:@"Localizable"];
  NSAttributedStringKey v21 = NSFontAttributeName;
  id v9 = +[UIFontMetrics defaultMetrics];
  id v10 = +[UIFont systemFontOfSize:17.0 weight:UIFontWeightMedium];
  id v11 = [v9 scaledFontForFont:v10 compatibleWithTraitCollection:0];
  v22 = v11;
  BOOL v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v13 = [v6 initWithString:v8 attributes:v12];

  [v5 setAttributedTitle:v13];
  id v14 = +[UIColor labelColor];
  [v5 setBaseForegroundColor:v14];

  CFStringRef v15 = +[UIImage systemImageNamed:@"chevron.forward"];
  [v5 setImage:v15];

  [v5 setImagePlacement:8];
  [v5 setImagePadding:10.0];
  [v3 setConfiguration:v5];
  id v16 = v3;

  return v16;
}

id __72__RecoverDeviceUIExtensionRemoteViewController_menuSystemRecoveryButton__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 showRecoveryCard];
}

- (void)showEACSApprovalCard
{
  id v3 = objc_alloc_init((Class)PRXIconContentViewController);
  [(RecoverDeviceUIExtensionRemoteViewController *)self setEacsApprovalCard:v3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __68__RecoverDeviceUIExtensionRemoteViewController_showEACSApprovalCard__block_invoke;
  block[3] = &unk_10001C458;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __68__RecoverDeviceUIExtensionRemoteViewController_showEACSApprovalCard__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eacsApprovalCard];
  [v2 setDismissalType:3];

  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"MENU_EACS_BUTTON_TITLE" value:&stru_10001C720 table:@"Localizable"];
  id v5 = [*(id *)(a1 + 32) eacsApprovalCard];
  [v5 setTitle:v4];

  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"EACS_APPROVAL_SUBTITLE" value:&stru_10001C720 table:@"Localizable"];
  id v8 = [*(id *)(a1 + 32) eacsApprovalCard];
  [v8 setSubtitle:v7];

  id v9 = +[PRXButton buttonWithProximityType:1];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = __68__RecoverDeviceUIExtensionRemoteViewController_showEACSApprovalCard__block_invoke_2;
  v32[3] = &unk_10001C588;
  uint64_t v10 = *(void *)(a1 + 32);
  id v33 = v9;
  uint64_t v34 = v10;
  id v31 = v9;
  id v11 = +[UIAction actionWithHandler:v32];
  [v31 addAction:v11 forControlEvents:0x2000];

  BOOL v12 = +[UIButtonConfiguration plainButtonConfiguration];
  [v12 setTitleAlignment:2];
  id v13 = objc_alloc((Class)NSAttributedString);
  uint64_t v30 = +[NSBundle mainBundle];
  id v14 = [*(id *)(a1 + 32) kLocalizedDeviceType];
  CFStringRef v15 = +[NSString stringWithFormat:@"%@_%@", @"EACS_APPROVAL_BUTTON_YES", v14];
  id v16 = [v30 localizedStringForKey:v15 value:&stru_10001C720 table:@"Localizable"];
  NSAttributedStringKey v36 = NSFontAttributeName;
  int v17 = +[UIFontMetrics defaultMetrics];
  id v18 = +[UIFont systemFontOfSize:17.0 weight:UIFontWeightMedium];
  id v19 = [v17 scaledFontForFont:v18 compatibleWithTraitCollection:0];
  v37 = v19;
  NSAttributedStringKey v20 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  id v21 = [v13 initWithString:v16 attributes:v20];

  v22 = v21;
  [v12 setAttributedTitle:v21];
  id v23 = +[UIColor systemRedColor];
  [v12 setBaseForegroundColor:v23];

  [v31 setConfiguration:v12];
  uint64_t v24 = [*(id *)(a1 + 32) eacsApprovalCard];
  unsigned int v25 = [v24 contentView];
  v35[0] = v31;
  id v26 = [*(id *)(a1 + 32) backToMenuButton];
  v35[1] = v26;
  id v27 = +[NSArray arrayWithObjects:v35 count:2];
  [v25 setActionButtons:v27];

  uint64_t v28 = [*(id *)(a1 + 32) proxCardNavController];
  uint64_t v29 = [*(id *)(a1 + 32) eacsApprovalCard];
  [v28 pushViewController:v29 animated:1];
}

void __68__RecoverDeviceUIExtensionRemoteViewController_showEACSApprovalCard__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:0];
  id v2 = [*(id *)(a1 + 40) eacsApprovalCard];
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"MENU_EACS_IN_PROGRESS_TEXT" value:&stru_10001C720 table:@"Localizable"];
  [v2 showActivityIndicatorWithStatus:v4];

  [*(id *)(a1 + 40) setPerformingEACS:1];
  id v5 = *(void **)(a1 + 40);
  CFStringRef v7 = @"NeRDCommand";
  CFStringRef v8 = @"NeRDCommandEACS";
  id v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v5 sendMessage:v6 completionHandler:0];
}

- (void)showEACSCard
{
  id v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke;
  block[3] = &unk_10001C458;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)PRXIconContentViewController);
  [*(id *)(a1 + 32) setEacsCard:v2];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke_2;
  block[3] = &unk_10001C458;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eacsCard];
  [v2 setDismissalType:3];

  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"MENU_EACS_BUTTON_TITLE" value:&stru_10001C720 table:@"Localizable"];
  id v5 = [*(id *)(a1 + 32) eacsCard];
  [v5 setTitle:v4];

  id v6 = +[NSBundle mainBundle];
  CFStringRef v7 = [*(id *)(a1 + 32) kLocalizedDeviceType];
  CFStringRef v8 = +[NSString stringWithFormat:@"%@_%@", @"EACS_DETAILS", v7];
  id v9 = [v6 localizedStringForKey:v8 value:&stru_10001C720 table:@"Localizable"];
  uint64_t v10 = [*(id *)(a1 + 32) eacsCard];
  [v10 setSubtitle:v9];

  id v11 = [*(id *)(a1 + 32) uiImageEACS];
  BOOL v12 = +[UIColor systemGray3Color];
  [v11 setTintColor:v12];

  id v13 = +[UIImageSymbolConfiguration configurationWithPointSize:80.0];
  [v11 setPreferredSymbolConfiguration:v13];

  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v14 = [*(id *)(a1 + 32) eacsCard];
  CFStringRef v15 = [v14 contentView];
  [v15 addSubview:v11];

  id v16 = [*(id *)(a1 + 32) eacsCard];
  int v17 = [v16 contentView];
  id v18 = [v17 mainContentGuide];

  id v19 = v11;
  CFStringRef v41 = [v11 topAnchor];
  NSAttributedStringKey v20 = [v18 topAnchor];
  id v21 = [v41 constraintGreaterThanOrEqualToAnchor:v20];
  v46[0] = v21;
  v43 = v11;
  v22 = [v11 centerYAnchor];
  unsigned int v42 = v18;
  id v23 = [v18 centerYAnchor];
  uint64_t v24 = [v22 constraintEqualToAnchor:v23];
  v46[1] = v24;
  unsigned int v25 = [v19 centerXAnchor];
  id v26 = [v18 centerXAnchor];
  id v27 = [v25 constraintEqualToAnchor:v26];
  v46[2] = v27;
  uint64_t v28 = +[NSArray arrayWithObjects:v46 count:3];
  +[NSLayoutConstraint activateConstraints:v28];

  uint64_t v29 = [*(id *)(a1 + 32) eacsCard];
  uint64_t v30 = +[NSBundle mainBundle];
  id v31 = [v30 localizedStringForKey:@"START_EACS_BUTTON_TEXT" value:&stru_10001C720 table:@"Localizable"];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke_3;
  v45[3] = &unk_10001C480;
  v45[4] = *(void *)(a1 + 32);
  CFStringRef v32 = +[PRXAction actionWithTitle:v31 style:0 handler:v45];
  id v33 = [v29 addAction:v32];

  uint64_t v34 = [*(id *)(a1 + 32) eacsCard];
  id v35 = +[NSBundle mainBundle];
  NSAttributedStringKey v36 = [v35 localizedStringForKey:@"GO_BACK" value:&stru_10001C720 table:@"Localizable"];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke_4;
  v44[3] = &unk_10001C480;
  v44[4] = *(void *)(a1 + 32);
  v37 = +[PRXAction actionWithTitle:v36 style:1 handler:v44];
  id v38 = [v34 addAction:v37];

  CFStringRef v39 = [*(id *)(a1 + 32) proxCardNavController];
  id v40 = [*(id *)(a1 + 32) eacsCard];
  [v39 pushViewController:v40 animated:1];
}

id __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke_3(uint64_t a1, void *a2)
{
  [a2 setEnabled:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 showEACSApprovalCard];
}

id __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke_4(uint64_t a1, void *a2)
{
  [a2 setEnabled:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 showMenuCard];
}

- (id)menuEACSButton
{
  +[PRXButton buttonWithProximityType:1];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __62__RecoverDeviceUIExtensionRemoteViewController_menuEACSButton__block_invoke;
  v18[3] = &unk_10001C588;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v3;
  NSAttributedStringKey v20 = self;
  id v4 = +[UIAction actionWithHandler:v18];
  [v3 addAction:v4 forControlEvents:0x2000];

  id v5 = +[UIButtonConfiguration plainButtonConfiguration];
  [v5 setTitleAlignment:2];
  id v6 = objc_alloc((Class)NSAttributedString);
  CFStringRef v7 = +[NSBundle mainBundle];
  CFStringRef v8 = [v7 localizedStringForKey:@"MENU_EACS_BUTTON_TEXT" value:&stru_10001C720 table:@"Localizable"];
  NSAttributedStringKey v21 = NSFontAttributeName;
  id v9 = +[UIFontMetrics defaultMetrics];
  uint64_t v10 = +[UIFont systemFontOfSize:17.0 weight:UIFontWeightMedium];
  id v11 = [v9 scaledFontForFont:v10 compatibleWithTraitCollection:0];
  v22 = v11;
  BOOL v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v13 = [v6 initWithString:v8 attributes:v12];

  [v5 setAttributedTitle:v13];
  id v14 = +[UIColor labelColor];
  [v5 setBaseForegroundColor:v14];

  CFStringRef v15 = +[UIImage systemImageNamed:@"chevron.forward"];
  [v5 setImage:v15];

  [v5 setImagePlacement:8];
  [v5 setImagePadding:10.0];
  [v3 setConfiguration:v5];
  id v16 = v3;

  return v16;
}

id __62__RecoverDeviceUIExtensionRemoteViewController_menuEACSButton__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 showEACSCard];
}

- (id)menuRebootButton
{
  +[PRXButton buttonWithProximityType:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __64__RecoverDeviceUIExtensionRemoteViewController_menuRebootButton__block_invoke;
  v17[3] = &unk_10001C588;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v3;
  id v19 = self;
  id v4 = +[UIAction actionWithHandler:v17];
  [v3 addAction:v4 forControlEvents:0x2000];

  id v5 = +[UIButtonConfiguration plainButtonConfiguration];
  [v5 setTitleAlignment:2];
  id v6 = objc_alloc((Class)NSAttributedString);
  CFStringRef v7 = +[NSBundle mainBundle];
  CFStringRef v8 = [v7 localizedStringForKey:@"MENU_REBOOT_BUTTON_TEXT" value:&stru_10001C720 table:@"Localizable"];
  NSAttributedStringKey v20 = NSFontAttributeName;
  id v9 = +[UIFontMetrics defaultMetrics];
  uint64_t v10 = +[UIFont systemFontOfSize:17.0 weight:UIFontWeightMedium];
  id v11 = [v9 scaledFontForFont:v10 compatibleWithTraitCollection:0];
  NSAttributedStringKey v21 = v11;
  BOOL v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v13 = [v6 initWithString:v8 attributes:v12];

  [v5 setAttributedTitle:v13];
  id v14 = +[UIColor labelColor];
  [v5 setBaseForegroundColor:v14];

  [v3 setConfiguration:v5];
  id v15 = v3;

  return v15;
}

void __64__RecoverDeviceUIExtensionRemoteViewController_menuRebootButton__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:0];
  id v2 = [*(id *)(a1 + 40) menuCard];
  id v3 = +[NSBundle mainBundle];
  id v4 = [*(id *)(a1 + 40) kLocalizedDeviceType];
  id v5 = +[NSString stringWithFormat:@"%@_%@", @"MENU_REBOOT_IN_PROGRESS_TEXT", v4];
  id v6 = [v3 localizedStringForKey:v5 value:&stru_10001C720 table:@"Localizable"];
  [v2 showActivityIndicatorWithStatus:v6];

  CFStringRef v7 = *(void **)(a1 + 40);
  CFStringRef v10 = @"NeRDCommand";
  CFStringRef v11 = @"NeRDCommandReboot";
  CFStringRef v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __64__RecoverDeviceUIExtensionRemoteViewController_menuRebootButton__block_invoke_2;
  v9[3] = &unk_10001C5B0;
  v9[4] = *(void *)(a1 + 40);
  [v7 sendMessage:v8 completionHandler:v9];
}

void __64__RecoverDeviceUIExtensionRemoteViewController_menuRebootButton__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 logger];
    id v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failed to send reboot command", v9, 2u);
    }

    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    uint64_t v8 = 7;
  }
  else
  {
    id v7 = 0;
    uint64_t v8 = 8;
  }
  [v4 showOverallResultCard:v7 resultType:v8];
}

- (void)menuOptionChosen:(int)a3
{
  switch(a3)
  {
    case 4:
      id v4 = [(RecoverDeviceUIExtensionRemoteViewController *)self menuCard];
      id v5 = +[NSBundle mainBundle];
      id v6 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
      id v7 = +[NSString stringWithFormat:@"%@_%@", @"MENU_REBOOT_IN_PROGRESS_TEXT", v6];
      uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_10001C720 table:@"Localizable"];
      [v4 showActivityIndicatorWithStatus:v8];

      CFStringRef v11 = @"NeRDCommand";
      CFStringRef v12 = @"NeRDCommandReboot";
      id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = __65__RecoverDeviceUIExtensionRemoteViewController_menuOptionChosen___block_invoke;
      v10[3] = &unk_10001C5B0;
      v10[4] = self;
      [(RecoverDeviceUIExtensionRemoteViewController *)self sendMessage:v9 completionHandler:v10];

      break;
    case 2:
      [(RecoverDeviceUIExtensionRemoteViewController *)self showEACSCard];
      break;
    case 1:
      [(RecoverDeviceUIExtensionRemoteViewController *)self showRecoveryCard];
      break;
  }
}

void __65__RecoverDeviceUIExtensionRemoteViewController_menuOptionChosen___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 logger];
    id v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failed to send reboot command", v9, 2u);
    }

    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    uint64_t v8 = 7;
  }
  else
  {
    id v7 = 0;
    uint64_t v8 = 8;
  }
  [v4 showOverallResultCard:v7 resultType:v8];
}

- (void)showMenuCard
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__RecoverDeviceUIExtensionRemoteViewController_showMenuCard__block_invoke;
  block[3] = &unk_10001C458;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __60__RecoverDeviceUIExtensionRemoteViewController_showMenuCard__block_invoke(uint64_t a1)
{
  id v2 = [RecoverDeviceMenuViewController alloc];
  id v3 = [*(id *)(a1 + 32) kLocalizedDeviceType];
  id v4 = [(RecoverDeviceMenuViewController *)v2 initWithOptions:5 forDevice:v3];
  [*(id *)(a1 + 32) setMenuViewController:v4];

  id v5 = objc_alloc((Class)PRXScrollableContentView);
  id v6 = [*(id *)(a1 + 32) menuViewController];
  id v7 = [v6 tableView];
  id v60 = [v5 initWithCardStyle:0 scrollView:v7];

  id v8 = [objc_alloc((Class)PRXCardContentViewController) initWithContentView:v60];
  [*(id *)(a1 + 32) setMenuCard:v8];

  id v9 = [*(id *)(a1 + 32) menuCard];
  [v9 setDismissalType:3];

  CFStringRef v10 = +[NSBundle mainBundle];
  CFStringRef v11 = [v10 localizedStringForKey:@"MENU_CARD_TITLE" value:&stru_10001C720 table:@"Localizable"];
  CFStringRef v12 = [*(id *)(a1 + 32) menuCard];
  [v12 setTitle:v11];

  id v13 = +[NSBundle mainBundle];
  id v14 = [*(id *)(a1 + 32) kLocalizedDeviceType];
  id v15 = +[NSString stringWithFormat:@"%@_%@", @"MENU_CARD_SUBTITLE", v14];
  id v16 = [v13 localizedStringForKey:v15 value:&stru_10001C720 table:@"Localizable"];
  int v17 = [*(id *)(a1 + 32) menuCard];
  [v17 setSubtitle:v16];

  id v18 = [*(id *)(a1 + 32) menuCard];
  id v19 = [*(id *)(a1 + 32) menuViewController];
  [v18 addChildViewController:v19];

  NSAttributedStringKey v20 = [*(id *)(a1 + 32) menuViewController];
  NSAttributedStringKey v21 = [v20 tableView];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = [*(id *)(a1 + 32) menuViewController];
  id v23 = [*(id *)(a1 + 32) menuCard];
  [v22 didMoveToParentViewController:v23];

  uint64_t v24 = [*(id *)(a1 + 32) menuCard];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = __60__RecoverDeviceUIExtensionRemoteViewController_showMenuCard__block_invoke_2;
  v61[3] = &unk_10001C480;
  v61[4] = *(void *)(a1 + 32);
  unsigned int v25 = +[PRXAction actionWithTitle:@"Continue" style:0 handler:v61];
  id v26 = [v24 addAction:v25];

  id v27 = [*(id *)(a1 + 32) menuCard];
  uint64_t v28 = [v27 contentView];
  uint64_t v29 = [v28 actionButtons];
  uint64_t v30 = [v29 objectAtIndexedSubscript:0];

  id v31 = [*(id *)(a1 + 32) menuCard];
  CFStringRef v32 = [v31 contentView];
  id v33 = [v32 mainContentGuide];

  unsigned int v59 = [*(id *)(a1 + 32) menuViewController];
  v57 = [v59 tableView];
  uint64_t v56 = [v57 topAnchor];
  uint64_t v58 = v33;
  unsigned int v55 = [v33 topAnchor];
  v54 = [v56 constraintGreaterThanOrEqualToAnchor:v55];
  v62[0] = v54;
  v53 = [*(id *)(a1 + 32) menuViewController];
  uint32_t v52 = [v53 tableView];
  v50 = [v52 bottomAnchor];
  v49 = [v33 bottomAnchor];
  unsigned __int8 v48 = [v50 constraintGreaterThanOrEqualToAnchor:v49];
  v62[1] = v48;
  id v47 = [*(id *)(a1 + 32) menuViewController];
  v46 = [v47 tableView];
  uint64_t v34 = [v46 trailingAnchor];
  id v35 = v30;
  unsigned int v51 = v30;
  NSAttributedStringKey v36 = [v30 trailingAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  v62[2] = v37;
  id v38 = [*(id *)(a1 + 32) menuViewController];
  CFStringRef v39 = [v38 tableView];
  id v40 = [v39 leadingAnchor];
  CFStringRef v41 = [v35 leadingAnchor];
  unsigned int v42 = [v40 constraintEqualToAnchor:v41];
  v62[3] = v42;
  v43 = +[NSArray arrayWithObjects:v62 count:4];
  +[NSLayoutConstraint activateConstraints:v43];

  unsigned int v44 = [*(id *)(a1 + 32) proxCardNavController];
  unsigned int v45 = [*(id *)(a1 + 32) menuCard];
  [v44 pushViewController:v45 animated:1];
}

void __60__RecoverDeviceUIExtensionRemoteViewController_showMenuCard__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 menuViewController];
  [v1 menuOptionChosen:[v2 selectedOption]];
}

- (void)handleOSRMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
  id v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Got OSR message %@", buf, 0xCu);
  }

  if ([(RecoverDeviceUIExtensionRemoteViewController *)self setupCompleted])
  {
    id v7 = [v4 objectForKeyedSubscript:@"NeRDState"];
    if ([v7 isEqual:@"NeRDStateEACSSuccess"])
    {
      if (![(RecoverDeviceUIExtensionRemoteViewController *)self performingEACS])
      {
        id v8 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
        id v9 = [v8 oslog];

        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not performing EACS, bug?", buf, 2u);
        }
      }
      [(RecoverDeviceUIExtensionRemoteViewController *)self showOverallResultCard:0 resultType:6];
    }
    if ([v7 isEqual:@"NeRDStateInstalled"])
    {
      [(RecoverDeviceUIExtensionRemoteViewController *)self showOverallResultCard:0 resultType:4];
      goto LABEL_27;
    }
    if ([v7 isEqual:@"NeRDStateEACSFailed"])
    {
      CFStringRef v11 = [v4 objectForKeyedSubscript:@"NeRDError"];
      CFStringRef v12 = v11;
      if (v11)
      {
        id v13 = [v11 objectForKeyedSubscript:@"NeRDErrorDomain"];
        id v14 = [v12 objectForKeyedSubscript:@"NeRDErrorCode"];
        id v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, [v14 integerValue], 0);
      }
      else
      {
        id v15 = +[NSError errorWithDomain:@"TapToRecoverProxCardError" code:10005 userInfo:0];
      }
      id v19 = self;
      NSAttributedStringKey v20 = v15;
      uint64_t v21 = 5;
LABEL_26:
      [(RecoverDeviceUIExtensionRemoteViewController *)v19 showOverallResultCard:v20 resultType:v21];

      goto LABEL_27;
    }
    if ([v7 isEqual:@"NeRDStateFailed"])
    {
      id v16 = [v4 objectForKeyedSubscript:@"NeRDError"];
      CFStringRef v12 = v16;
      if (v16)
      {
        int v17 = [v16 objectForKeyedSubscript:@"NeRDErrorDomain"];
        id v18 = [v12 objectForKeyedSubscript:@"NeRDErrorCode"];
        id v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v17, [v18 integerValue], 0);
      }
      else
      {
        id v15 = +[NSError errorWithDomain:@"TapToRecoverProxCardError" code:10005 userInfo:0];
      }
      id v19 = self;
      NSAttributedStringKey v20 = v15;
      uint64_t v21 = 2;
      goto LABEL_26;
    }
    if ([(RecoverDeviceUIExtensionRemoteViewController *)self showingProgress])
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = __65__RecoverDeviceUIExtensionRemoteViewController_handleOSRMessage___block_invoke;
      v22[3] = &unk_10001C430;
      v22[4] = self;
      id v23 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);
    }
  }
  else
  {
    CFStringRef v10 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
    id v7 = [v10 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setup not completed, dropping message", buf, 2u);
    }
  }
LABEL_27:
}

id __65__RecoverDeviceUIExtensionRemoteViewController_handleOSRMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateProgressCardOnMainQueueWithInfo:*(void *)(a1 + 40)];
}

- (void)showOverallResultCard:(id)a3 resultType:(int)a4
{
  id v6 = a3;
  id v7 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __81__RecoverDeviceUIExtensionRemoteViewController_showOverallResultCard_resultType___block_invoke;
  block[3] = &unk_10001C600;
  void block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __81__RecoverDeviceUIExtensionRemoteViewController_showOverallResultCard_resultType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowingProgress:0];
  uint64_t v19 = 0;
  NSAttributedStringKey v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  int v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) getOverallResultTitleStringForError:*(void *)(a1 + 40) resultType:*(unsigned int *)(a1 + 48)];
  id v3 = (void *)v20[5];
  v20[5] = v2;

  uint64_t v4 = [*(id *)(a1 + 32) getOverallResultSubTitleStringForError:*(void *)(a1 + 40) resultType:*(unsigned int *)(a1 + 48)];
  id v5 = (void *)v14[5];
  v14[5] = v4;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __81__RecoverDeviceUIExtensionRemoteViewController_showOverallResultCard_resultType___block_invoke_651;
  block[3] = &unk_10001C5D8;
  id v6 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v6;
  int v12 = *(_DWORD *)(a1 + 48);
  id v9 = v7;
  id v10 = &v19;
  int v11 = &v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

void __81__RecoverDeviceUIExtensionRemoteViewController_showOverallResultCard_resultType___block_invoke_651(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) overallResultCard];

  id v3 = [*(id *)(a1 + 32) logger];
  uint64_t v4 = [v3 oslog];

  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already showing overall status, not showing again", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      CFStringRef v7 = @"Failure";
      int v8 = *(_DWORD *)(a1 + 64);
      if (!v6) {
        CFStringRef v7 = @"Success";
      }
      *(_DWORD *)buf = 138412802;
      CFStringRef v40 = v7;
      __int16 v41 = 1024;
      int v42 = v8;
      __int16 v43 = 2112;
      uint64_t v44 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Overall status is %@, type:%d, err:%@", buf, 0x1Cu);
    }

    uint64_t v4 = objc_alloc_init((Class)PRXIconContentViewController);
    [*(id *)(a1 + 32) setOverallResultCard:v4];
    id v9 = [*(id *)(a1 + 32) overallResultCard];
    [v9 setDismissalType:3];

    id v10 = [*(id *)(a1 + 32) getOverallResultUIImageForError:*(void *)(a1 + 40) resultType:*(unsigned int *)(a1 + 64)];
    int v11 = *(void **)(a1 + 32);
    if (v10)
    {
      int v12 = [v11 overallResultCard];
      uint64_t v13 = [v12 contentView];
      [v13 addSubview:v10];

      [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v14 = +[UIImageSymbolConfiguration configurationWithPointSize:72.0];
      [v10 setPreferredSymbolConfiguration:v14];

      uint64_t v15 = [*(id *)(a1 + 32) overallResultCard];
      id v16 = [v15 contentView];
      int v17 = [v16 mainContentGuide];

      v37 = [v10 topAnchor];
      NSAttributedStringKey v36 = [v17 topAnchor];
      id v35 = [v37 constraintGreaterThanOrEqualToAnchor:v36];
      v38[0] = v35;
      uint64_t v34 = [v10 centerYAnchor];
      id v18 = [v17 centerYAnchor];
      uint64_t v19 = [v34 constraintEqualToAnchor:v18];
      v38[1] = v19;
      NSAttributedStringKey v20 = [v10 centerXAnchor];
      uint64_t v21 = [v17 centerXAnchor];
      v22 = [v20 constraintEqualToAnchor:v21];
      v38[2] = v22;
      id v23 = +[NSArray arrayWithObjects:v38 count:3];
      +[NSLayoutConstraint activateConstraints:v23];
    }
    else
    {
      id v24 = [v11 logger];
      int v17 = [v24 oslog];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to get overallResult UIImage", buf, 2u);
      }
    }

    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v26 = [*(id *)(a1 + 32) overallResultCard];
    [v26 setTitle:v25];

    uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v28 = [*(id *)(a1 + 32) overallResultCard];
    [v28 setSubtitle:v27];

    uint64_t v29 = [*(id *)(a1 + 32) overallResultCard];
    uint64_t v30 = [*(id *)(a1 + 32) getOverallResultActionForError:*(void *)(a1 + 40) resultType:*(unsigned int *)(a1 + 64)];
    id v31 = [v29 addAction:v30];

    CFStringRef v32 = [*(id *)(a1 + 32) proxCardNavController];
    id v33 = [*(id *)(a1 + 32) overallResultCard];
    [v32 pushViewController:v33 animated:1];
  }
}

- (void)updateCodeCardToSettingUpState
{
  id v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __78__RecoverDeviceUIExtensionRemoteViewController_updateCodeCardToSettingUpState__block_invoke;
  block[3] = &unk_10001C458;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __78__RecoverDeviceUIExtensionRemoteViewController_updateCodeCardToSettingUpState__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIgnoreAdditionalCodes:1];
  id v2 = objc_alloc_init((Class)PRXIconContentViewController);
  [*(id *)(a1 + 32) setSettingUpDeviceCard:v2];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __78__RecoverDeviceUIExtensionRemoteViewController_updateCodeCardToSettingUpState__block_invoke_2;
  block[3] = &unk_10001C458;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __78__RecoverDeviceUIExtensionRemoteViewController_updateCodeCardToSettingUpState__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) enterCodeCard];
  [v1 showActivityIndicatorWithStatus:&stru_10001C720];
}

- (BOOL)isCompanionSameDevice
{
  uint64_t v6 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  unsigned int v7 = [v6 containsString:@"IPHONE"];
  if (v7)
  {
    id v2 = +[UIDevice currentDevice];
    id v3 = [v2 model];
    uint64_t v4 = [v3 uppercaseString];
    if ([v4 containsString:@"IPHONE"])
    {
      unsigned __int8 v8 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  id v9 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  if ([v9 containsString:@"IPAD"])
  {
    id v10 = +[UIDevice currentDevice];
    int v11 = [v10 model];
    int v12 = [v11 uppercaseString];
    unsigned __int8 v8 = [v12 containsString:@"IPAD"];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  if (v7) {
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (void)showCollectCodeCard:(int)a3 inFlags:(unsigned int)a4 inThrottleSeconds:(int)a5
{
  unsigned __int8 v8 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __94__RecoverDeviceUIExtensionRemoteViewController_showCollectCodeCard_inFlags_inThrottleSeconds___block_invoke;
  v9[3] = &unk_10001C650;
  v9[4] = self;
  unsigned int v10 = a4;
  int v11 = a5;
  dispatch_async(v8, v9);
}

void __94__RecoverDeviceUIExtensionRemoteViewController_showCollectCodeCard_inFlags_inThrottleSeconds___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) logger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Got request to show code card", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __94__RecoverDeviceUIExtensionRemoteViewController_showCollectCodeCard_inFlags_inThrottleSeconds___block_invoke_658;
  v4[3] = &unk_10001C650;
  v4[4] = *(void *)(a1 + 32);
  void v4[5] = *(void *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void __94__RecoverDeviceUIExtensionRemoteViewController_showCollectCodeCard_inFlags_inThrottleSeconds___block_invoke_658(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) enterCodeCard];

  if (!v2)
  {
    id v3 = objc_alloc_init((Class)PRXPasscodeEntryViewController);
    [*(id *)(a1 + 32) setEnterCodeCard:v3];

    uint64_t v4 = [*(id *)(a1 + 32) enterCodeCard];
    BOOL v5 = +[NSBundle mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"AUTHENTICATION_CARD_TITLE" value:&stru_10001C720 table:@"Localizable"];
    [v4 setTitle:v6];

    LODWORD(v5) = [*(id *)(a1 + 32) isCompanionSameDevice];
    unsigned int v7 = [*(id *)(a1 + 32) enterCodeCard];
    unsigned __int8 v8 = +[NSBundle mainBundle];
    uint64_t v9 = [*(id *)(a1 + 32) kLocalizedDeviceType];
    unsigned int v10 = (void *)v9;
    CFStringRef v11 = @"AUTHENTICATION_CARD_DESCRIPTION";
    if (v5) {
      CFStringRef v11 = @"AUTHENTICATION_CARD_DESCRIPTION_OTHER";
    }
    int v12 = +[NSString stringWithFormat:@"%@_%@", v11, v9];
    uint64_t v13 = [v8 localizedStringForKey:v12 value:&stru_10001C720 table:@"Localizable"];
    [v7 setSubtitle:v13];

    id v14 = [*(id *)(a1 + 32) enterCodeCard];
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = __94__RecoverDeviceUIExtensionRemoteViewController_showCollectCodeCard_inFlags_inThrottleSeconds___block_invoke_2;
    v69[3] = &unk_10001C628;
    v69[4] = *(void *)(a1 + 32);
    [v14 setTextEntryCompletionHandler:v69];
    [v14 setNumberOfDigits:6];
    [v14 setDismissalType:3];
  }
  uint64_t v15 = [*(id *)(a1 + 32) proxCardNavController];
  id v16 = [v15 visibleViewController];
  int v17 = [*(id *)(a1 + 32) enterCodeCard];

  id v18 = *(void **)(a1 + 32);
  if (v16 == v17)
  {
    uint64_t v21 = [v18 logger];
    uint64_t v19 = [v21 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Passcode card already visible", buf, 2u);
    }
  }
  else
  {
    uint64_t v19 = [v18 proxCardNavController];
    NSAttributedStringKey v20 = [*(id *)(a1 + 32) enterCodeCard];
    [v19 pushViewController:v20 animated:1];
  }
  int v22 = *(_DWORD *)(a1 + 40);
  if ((v22 & 0x20000) != 0)
  {
    v37 = [*(id *)(a1 + 32) logger];
    id v38 = [v37 oslog];

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = *(_DWORD *)(a1 + 44);
      *(_DWORD *)buf = 67109120;
      LODWORD(v71) = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Additional authentication attempts throttled for an additional %d seconds", buf, 8u);
    }

    CFStringRef v40 = *(void **)(a1 + 32);
    if (*(int *)(a1 + 44) >= 1)
    {
      if (([v40 ignoreAdditionalCodes] & 1) == 0)
      {
        __int16 v41 = [*(id *)(a1 + 32) enterCodeCard];
        int v42 = [v41 passcodeEntryView];
        [v42 setText:&stru_10001C720];

        [*(id *)(a1 + 32) setIgnoreAdditionalCodes:1];
        objc_msgSend(*(id *)(a1 + 32), "setAuthenticationAttempt:", (char *)objc_msgSend(*(id *)(a1 + 32), "authenticationAttempt") - 1);
        __int16 v43 = [*(id *)(a1 + 32) logger];
        uint64_t v44 = [v43 oslog];

        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          id v45 = [*(id *)(a1 + 32) authenticationAttempt];
          *(_DWORD *)buf = 134217984;
          id v71 = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Passcode didn't get checked because of throttling, reducing the attempt count to %llu", buf, 0xCu);
        }
      }
      v46 = +[NSBundle mainBundle];
      id v47 = [*(id *)(a1 + 32) kLocalizedDeviceType];
      unsigned __int8 v48 = +[NSString stringWithFormat:@"%@_%@", @"INVALID_CODE_ENTERED_THROTTLED", v47];
      v49 = [v46 localizedStringForKey:v48 value:&stru_10001C720 table:@"Localizable"];
      uint64_t v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v49, *(unsigned int *)(a1 + 44));

      NSAttributedStringKey v36 = [*(id *)(a1 + 32) enterCodeCard];
      [v36 setSubtitle:v34];
      goto LABEL_32;
    }
    [v40 setIgnoreAdditionalCodes:0];
    v54 = [*(id *)(a1 + 32) logger];
    unsigned int v55 = [v54 oslog];

    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "No longer throttled. Can accept new code now", buf, 2u);
    }

    uint64_t v56 = [*(id *)(a1 + 32) enterCodeCard];
    v57 = +[NSBundle mainBundle];
    uint64_t v58 = [*(id *)(a1 + 32) kLocalizedDeviceType];
    unsigned int v59 = +[NSString stringWithFormat:@"%@_%@", @"INVALID_CODE_ENTERED", v58];
    id v60 = [v57 localizedStringForKey:v59 value:&stru_10001C720 table:@"Localizable"];
    [v56 setSubtitle:v60];

    uint64_t v34 = [*(id *)(a1 + 32) enterCodeCard];
    id v35 = [v34 passcodeEntryView];
    NSAttributedStringKey v36 = v35;
LABEL_31:
    [v35 setText:&stru_10001C720];
LABEL_32:

    goto LABEL_33;
  }
  id v23 = *(void **)(a1 + 32);
  if ((v22 & 0x10000) == 0)
  {
    id v24 = [v23 logger];
    uint64_t v25 = [v24 oslog];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Not throttled and no error. Setting subtitle back to default", buf, 2u);
    }

    [*(id *)(a1 + 32) setIgnoreAdditionalCodes:0];
    unsigned int v26 = [*(id *)(a1 + 32) isCompanionSameDevice];
    uint64_t v27 = [*(id *)(a1 + 32) enterCodeCard];
    uint64_t v28 = +[NSBundle mainBundle];
    uint64_t v29 = [*(id *)(a1 + 32) kLocalizedDeviceType];
    uint64_t v30 = (void *)v29;
    CFStringRef v31 = @"AUTHENTICATION_CARD_DESCRIPTION";
    if (v26) {
      CFStringRef v31 = @"AUTHENTICATION_CARD_DESCRIPTION_OTHER";
    }
    CFStringRef v32 = +[NSString stringWithFormat:@"%@_%@", v31, v29];
    id v33 = [v28 localizedStringForKey:v32 value:&stru_10001C720 table:@"Localizable"];
    [v27 setSubtitle:v33];

    uint64_t v34 = [*(id *)(a1 + 32) enterCodeCard];
    id v35 = [v34 passcodeEntryView];
    NSAttributedStringKey v36 = v35;
    goto LABEL_31;
  }
  id v50 = [v23 authenticationAttempt];
  unsigned int v51 = *(void **)(a1 + 32);
  if ((unint64_t)v50 < 5)
  {
    v61 = [v51 enterCodeCard];
    unsigned int v62 = [v61 passcodeEntryView];
    [v62 setText:&stru_10001C720];

    v63 = [*(id *)(a1 + 32) logger];
    BOOL v64 = [v63 oslog];

    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Previously entered passcode was incorrect", buf, 2u);
    }

    uint64_t v34 = [*(id *)(a1 + 32) enterCodeCard];
    unsigned int v65 = +[NSBundle mainBundle];
    BOOL v66 = [*(id *)(a1 + 32) kLocalizedDeviceType];
    id v67 = +[NSString stringWithFormat:@"%@_%@", @"INVALID_CODE_ENTERED", v66];
    unsigned int v68 = [v65 localizedStringForKey:v67 value:&stru_10001C720 table:@"Localizable"];
    [v34 setSubtitle:v68];
  }
  else
  {
    uint32_t v52 = [v51 logger];
    v53 = [v52 oslog];

    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Too many incorrect passcode attempts", buf, 2u);
    }

    uint64_t v34 = +[NSError errorWithDomain:@"TapToRecoverProxCardError" code:10000 userInfo:0];
    [*(id *)(a1 + 32) showOverallResultCard:v34 resultType:0];
  }
LABEL_33:
}

void __94__RecoverDeviceUIExtensionRemoteViewController_showCollectCodeCard_inFlags_inThrottleSeconds___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [*(id *)(a1 + 32) ignoreAdditionalCodes];
  BOOL v5 = [*(id *)(a1 + 32) logger];
  uint64_t v6 = [v5 oslog];

  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      int v15 = 138412290;
      id v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring user entered code %@ due to flag", (uint8_t *)&v15, 0xCu);
    }

    unsigned __int8 v8 = [*(id *)(a1 + 32) enterCodeCard];
    uint64_t v9 = [v8 passcodeEntryView];
    [v9 setText:&stru_10001C720];
  }
  else
  {
    if (v7)
    {
      id v10 = [*(id *)(a1 + 32) authenticationAttempt];
      int v15 = 138412546;
      id v16 = v3;
      __int16 v17 = 2048;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User entered code %@, attempt # %llu", (uint8_t *)&v15, 0x16u);
    }

    [*(id *)(a1 + 32) setAuthenticationAttempt:[*(id *)(a1 + 32) authenticationAttempt] + 1];
    id v11 = [*(id *)(a1 + 32) authenticationAttempt];
    int v12 = *(void **)(a1 + 32);
    if ((unint64_t)v11 < 6)
    {
      [v12 waitForServerResponse];
      unsigned __int8 v8 = [*(id *)(a1 + 32) setupkitClient];
      [v8 tryPassword:v3];
    }
    else
    {
      uint64_t v13 = [v12 logger];
      id v14 = [v13 oslog];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Too many passcode attempts", (uint8_t *)&v15, 2u);
      }

      unsigned __int8 v8 = +[NSError errorWithDomain:@"TapToRecoverProxCardError" code:10000 userInfo:0];
      [*(id *)(a1 + 32) showOverallResultCard:v8 resultType:0];
    }
  }
}

- (void)recoverButtonPressed
{
  id v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke;
  block[3] = &unk_10001C458;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) logger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User asked to recover remote device", buf, 2u);
  }

  unsigned int v4 = [*(id *)(a1 + 32) setupkitClient];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke_676;
  v6[3] = &unk_10001C678;
  uint64_t v7 = *(void *)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke_2;
  v5[3] = &unk_10001C5B0;
  void v5[4] = v7;
  [v4 registerEventID:@"osrEventID" options:0 eventHandler:v6 completionHandler:v5];
}

id __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke_676(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleOSRMessage:];
}

void __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    BOOL v5 = [v4 logger];
    uint64_t v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed registering for osr events", buf, 2u);
    }

    [*(id *)(a1 + 32) showOverallResultCard:v3 resultType:0];
  }
  else
  {
    uint64_t v7 = [v4 setupkitClient];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke_678;
    v8[3] = &unk_10001C5B0;
    v8[4] = *(void *)(a1 + 32);
    [v7 activateWithCompletion:v8];
  }
}

void __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke_678(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = v3;
  if (v3)
  {
    id v5 = [v3 code];
    uint64_t v6 = [*(id *)(a1 + 32) logger];
    uint64_t v7 = [v6 oslog];

    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5 == (id)-6721)
    {
      if (v8)
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setupkit client is already activated.", (uint8_t *)&v11, 2u);
      }
    }
    else
    {
      if (v8)
      {
        int v11 = 138412290;
        int v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to activate setupkit client: %@", (uint8_t *)&v11, 0xCu);
      }

      [*(id *)(a1 + 32) showOverallResultCard:v4 resultType:0];
    }
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) logger];
    id v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully activated setupkit client", (uint8_t *)&v11, 2u);
    }

    [*(id *)(a1 + 32) waitForServerResponse];
  }
}

- (id)notNowButtonAction
{
  id v3 = +[NSBundle mainBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"NOT_NOW" value:&stru_10001C720 table:@"Localizable"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __66__RecoverDeviceUIExtensionRemoteViewController_notNowButtonAction__block_invoke;
  v7[3] = &unk_10001C480;
  void v7[4] = self;
  id v5 = +[PRXAction actionWithTitle:v4 style:1 handler:v7];

  return v5;
}

void __66__RecoverDeviceUIExtensionRemoteViewController_notNowButtonAction__block_invoke(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __66__RecoverDeviceUIExtensionRemoteViewController_notNowButtonAction__block_invoke_2;
  block[3] = &unk_10001C458;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __66__RecoverDeviceUIExtensionRemoteViewController_notNowButtonAction__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) logger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing card by user request", v5, 2u);
  }

  unsigned int v4 = [*(id *)(a1 + 32) proxCardNavController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)showLearnMoreCard
{
  id v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__RecoverDeviceUIExtensionRemoteViewController_showLearnMoreCard__block_invoke;
  block[3] = &unk_10001C458;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __65__RecoverDeviceUIExtensionRemoteViewController_showLearnMoreCard__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)PRXIconContentViewController);
  [*(id *)(a1 + 32) setLearnMoreCard:v2];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__RecoverDeviceUIExtensionRemoteViewController_showLearnMoreCard__block_invoke_2;
  block[3] = &unk_10001C458;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __65__RecoverDeviceUIExtensionRemoteViewController_showLearnMoreCard__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) learnMoreCard];
  [v2 setDismissalType:3];

  id v3 = +[NSBundle mainBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"LEARN_MORE_TITLE" value:&stru_10001C720 table:@"Localizable"];
  id v5 = [*(id *)(a1 + 32) learnMoreCard];
  [v5 setTitle:v4];

  LODWORD(v4) = [*(id *)(a1 + 32) useAlternateStringForWiFI];
  uint64_t v6 = +[NSBundle mainBundle];
  if (v4) {
    CFStringRef v7 = @"LEARN_MORE_SUBTITLE_WLAN";
  }
  else {
    CFStringRef v7 = @"LEARN_MORE_SUBTITLE";
  }
  BOOL v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v7];
  uint64_t v9 = [*(id *)(a1 + 32) kLocalizedDeviceType];
  id v10 = +[NSString stringWithFormat:@"%@_%@", v8, v9];
  int v11 = [v6 localizedStringForKey:v10 value:&stru_10001C720 table:@"Localizable"];
  int v12 = [*(id *)(a1 + 32) learnMoreCard];
  [v12 setSubtitle:v11];

  uint64_t v13 = [*(id *)(a1 + 32) learnMoreCard];
  id v14 = [*(id *)(a1 + 32) recoverButtonAction];
  id v15 = [v13 addAction:v14];

  id v16 = [*(id *)(a1 + 32) learnMoreCard];
  __int16 v17 = [*(id *)(a1 + 32) notNowButtonAction];
  id v18 = [v16 addAction:v17];

  id v20 = [*(id *)(a1 + 32) proxCardNavController];
  uint64_t v19 = [*(id *)(a1 + 32) learnMoreCard];
  [v20 pushViewController:v19 animated:1];
}

- (id)recoverButtonAction
{
  id v3 = +[NSBundle mainBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"CONTINUE_BUTTON_TEXT" value:&stru_10001C720 table:@"Localizable"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __67__RecoverDeviceUIExtensionRemoteViewController_recoverButtonAction__block_invoke;
  v7[3] = &unk_10001C480;
  void v7[4] = self;
  id v5 = +[PRXAction actionWithTitle:v4 style:0 handler:v7];

  return v5;
}

id __67__RecoverDeviceUIExtensionRemoteViewController_recoverButtonAction__block_invoke(uint64_t a1, void *a2)
{
  [a2 setEnabled:0];
  id v3 = [*(id *)(a1 + 32) initialCard];
  unsigned int v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"MAIN_CARD_CONNECTING" value:&stru_10001C720 table:@"Localizable"];
  [v3 showActivityIndicatorWithStatus:v5];

  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 recoverButtonPressed];
}

- (id)learnMoreButtonAction
{
  id v3 = +[NSBundle mainBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"LEARN_MORE_BUTTON_TEXT" value:&stru_10001C720 table:@"Localizable"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __69__RecoverDeviceUIExtensionRemoteViewController_learnMoreButtonAction__block_invoke;
  v7[3] = &unk_10001C480;
  void v7[4] = self;
  id v5 = +[PRXAction actionWithTitle:v4 style:1 handler:v7];

  return v5;
}

id __69__RecoverDeviceUIExtensionRemoteViewController_learnMoreButtonAction__block_invoke(uint64_t a1, void *a2)
{
  [a2 setEnabled:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 showLearnMoreCard];
}

- (void)setInitialCardForSetup
{
  id v3 = +[NSBundle mainBundle];
  unsigned int v4 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  id v5 = +[NSString stringWithFormat:@"%@_%@", @"MAIN_CARD_TITLE", v4];
  uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_10001C720 table:@"Localizable"];

  if ([(RecoverDeviceUIExtensionRemoteViewController *)self extendedMode])
  {
    CFStringRef v7 = +[NSBundle mainBundle];
    BOOL v8 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
    uint64_t v9 = +[NSString stringWithFormat:@"%@_%@", @"MAIN_CARD_TITLE_EXT", v8];
    uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_10001C720 table:@"Localizable"];

    uint64_t v6 = (void *)v10;
  }
  int v11 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  [v11 setTitle:v6];

  int v12 = +[NSBundle mainBundle];
  uint64_t v13 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MAIN_CARD_DESCRIPTION"];
  id v14 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  id v15 = +[NSString stringWithFormat:@"%@_%@", v13, v14];
  id v16 = [v12 localizedStringForKey:v15 value:&stru_10001C720 table:@"Localizable"];

  v46 = v6;
  if (os_variant_has_internal_content())
  {
    __int16 v17 = +[NSBundle mainBundle];
    id v18 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
    uint64_t v19 = [v17 localizedStringForKey:v18 value:&stru_10001C720 table:@"Localizable"];
    uint64_t v20 = [v16 stringByAppendingFormat:@"[Internal Only]: Please put %@ into DFU and restore", v19];

    id v16 = (void *)v20;
  }
  __int16 v43 = v16;
  uint64_t v21 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  [v21 setSubtitle:v16];

  int v22 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  [v22 setDismissalType:3];

  id v23 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  id v24 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverButtonAction];
  id v25 = [v23 addAction:v24];

  unsigned int v26 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  uint64_t v27 = [(RecoverDeviceUIExtensionRemoteViewController *)self learnMoreButtonAction];
  id v28 = [v26 addAction:v27];

  uint64_t v29 = [(RecoverDeviceUIExtensionRemoteViewController *)self uiImage];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v30 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  CFStringRef v31 = [v30 contentView];
  [v31 addSubview:v29];

  CFStringRef v32 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  id v33 = [v32 contentView];
  uint64_t v34 = [v33 mainContentGuide];

  id v45 = [v29 topAnchor];
  uint64_t v44 = [v34 topAnchor];
  id v35 = [v45 constraintGreaterThanOrEqualToAnchor:v44];
  v47[0] = v35;
  NSAttributedStringKey v36 = [v29 centerYAnchor];
  v37 = [v34 centerYAnchor];
  id v38 = [v36 constraintEqualToAnchor:v37];
  v47[1] = v38;
  int v39 = [v29 centerXAnchor];
  CFStringRef v40 = [v34 centerXAnchor];
  __int16 v41 = [v39 constraintEqualToAnchor:v40];
  v47[2] = v41;
  int v42 = +[NSArray arrayWithObjects:v47 count:3];
  +[NSLayoutConstraint activateConstraints:v42];
}

- (void)setInitialCardForResume
{
  id v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  unsigned int v4 = +[NSBundle mainBundle];
  id v5 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  uint64_t v6 = +[NSString stringWithFormat:@"%@_%@", @"MAIN_CARD_TITLE_EXT", v5];
  CFStringRef v7 = [v4 localizedStringForKey:v6 value:&stru_10001C720 table:@"Localizable"];
  [v3 setTitle:v7];

  BOOL v8 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  [v8 setDismissalType:3];

  uint64_t v9 = [(RecoverDeviceUIExtensionRemoteViewController *)self uiImage];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v10 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  int v11 = [v10 contentView];
  [v11 addSubview:v9];

  int v12 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  uint64_t v13 = [v12 contentView];
  id v14 = [v13 mainContentGuide];

  uint64_t v27 = [v9 topAnchor];
  unsigned int v26 = [v14 topAnchor];
  id v15 = [v27 constraintGreaterThanOrEqualToAnchor:v26];
  v29[0] = v15;
  id v16 = [v9 centerYAnchor];
  id v28 = v14;
  __int16 v17 = [v14 centerYAnchor];
  id v18 = [v16 constraintEqualToAnchor:v17];
  v29[1] = v18;
  uint64_t v19 = [v9 centerXAnchor];
  uint64_t v20 = [v14 centerXAnchor];
  uint64_t v21 = [v19 constraintEqualToAnchor:v20];
  v29[2] = v21;
  int v22 = +[NSArray arrayWithObjects:v29 count:3];
  +[NSLayoutConstraint activateConstraints:v22];

  id v23 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  id v24 = +[NSBundle mainBundle];
  id v25 = [v24 localizedStringForKey:@"MAIN_CARD_CONNECTING" value:&stru_10001C720 table:@"Localizable"];
  [v23 showActivityIndicatorWithStatus:v25];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)RecoverDeviceUIExtensionRemoteViewController;
  [(RecoverDeviceUIExtensionRemoteViewController *)&v6 viewDidLoad];
  id v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
  unsigned int v4 = [v3 oslog];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "RecoverDeviceUI ViewDidLoad", v5, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
  objc_super v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "RecoverDeviceUI ViewDidAppear", buf, 2u);
  }

  id v7 = objc_alloc_init((Class)PRXIconContentViewController);
  [(RecoverDeviceUIExtensionRemoteViewController *)self setInitialCard:v7];
  BOOL v8 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitClient];
  unsigned __int8 v9 = [v8 skipWifi];

  if (v9) {
    [(RecoverDeviceUIExtensionRemoteViewController *)self setInitialCardForResume];
  }
  else {
    [(RecoverDeviceUIExtensionRemoteViewController *)self setInitialCardForSetup];
  }
  uint64_t v10 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
  int v11 = [v10 oslog];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to display first prox card", buf, 2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)RecoverDeviceUIExtensionRemoteViewController;
  [(RecoverDeviceUIExtensionRemoteViewController *)&v15 viewDidAppear:v3];
  int v12 = [(RecoverDeviceUIExtensionRemoteViewController *)self initialCard];
  uint64_t v13 = [(RecoverDeviceUIExtensionRemoteViewController *)self presentProxCardFlowWithDelegate:self initialViewController:v12];
  [(RecoverDeviceUIExtensionRemoteViewController *)self setProxCardNavController:v13];

  id v14 = [(RecoverDeviceUIExtensionRemoteViewController *)self setupkitClient];
  LODWORD(v13) = [v14 skipWifi];

  if (v13) {
    [(RecoverDeviceUIExtensionRemoteViewController *)self recoverButtonPressed];
  }
}

- (id)uiImage
{
  BOOL v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  unsigned int v4 = [v3 isEqualToString:@"DEVICE_TYPE_WATCH"];

  if (v4)
  {
    uint64_t v5 = +[UIImage systemImageNamed:@"exclamationmark.applewatch"];
    goto LABEL_12;
  }
  objc_super v6 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  unsigned int v7 = [v6 isEqualToString:@"DEVICE_TYPE_ATV"];

  if (v7)
  {
    CFStringRef v8 = @"appletv.badge.exclamationmark";
LABEL_11:
    uint64_t v5 = +[UIImage _systemImageNamed:v8];
LABEL_12:
    objc_super v15 = (void *)v5;
    if (v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  unsigned __int8 v9 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  unsigned int v10 = [v9 isEqualToString:@"DEVICE_TYPE_VISION"];

  if (v10)
  {
    CFStringRef v8 = @"visionpro.badge.exclamationmark";
    goto LABEL_11;
  }
  int v11 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  unsigned int v12 = [v11 isEqualToString:@"DEVICE_TYPE_IPHONE"];

  if (v12)
  {
    CFStringRef v8 = @"iphone.badge.exclamationmark";
    goto LABEL_11;
  }
  uint64_t v13 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  unsigned int v14 = [v13 isEqualToString:@"DEVICE_TYPE_IPAD"];

  if (v14)
  {
    CFStringRef v8 = @"ipad.badge.exclamationmark";
    goto LABEL_11;
  }
LABEL_13:
  objc_super v15 = +[UIImage systemImageNamed:@"xmark.octagon.fill"];
LABEL_14:
  id v16 = [objc_alloc((Class)UIImageView) initWithImage:v15];
  __int16 v17 = +[UIColor systemGray3Color];
  [v16 setTintColor:v17];

  id v18 = +[UIImageSymbolConfiguration configurationWithPointSize:120.0];
  [v16 setPreferredSymbolConfiguration:v18];

  return v16;
}

- (id)uiImageEACS
{
  BOOL v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  unsigned int v4 = [v3 isEqualToString:@"DEVICE_TYPE_WATCH"];

  if (v4)
  {
    uint64_t v5 = +[UIImage systemImageNamed:@"applewatch.slash"];
    goto LABEL_12;
  }
  objc_super v6 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  unsigned int v7 = [v6 isEqualToString:@"DEVICE_TYPE_ATV"];

  if (v7)
  {
    CFStringRef v8 = @"appletv.slash";
LABEL_11:
    uint64_t v5 = +[UIImage _systemImageNamed:v8];
LABEL_12:
    objc_super v15 = (void *)v5;
    if (v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  unsigned __int8 v9 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  unsigned int v10 = [v9 isEqualToString:@"DEVICE_TYPE_VISION"];

  if (v10)
  {
    CFStringRef v8 = @"visionpro.slash";
    goto LABEL_11;
  }
  int v11 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  unsigned int v12 = [v11 isEqualToString:@"DEVICE_TYPE_IPHONE"];

  if (v12)
  {
    CFStringRef v8 = @"iphone.slash";
    goto LABEL_11;
  }
  uint64_t v13 = [(RecoverDeviceUIExtensionRemoteViewController *)self kLocalizedDeviceType];
  unsigned int v14 = [v13 isEqualToString:@"DEVICE_TYPE_IPAD"];

  if (v14)
  {
    CFStringRef v8 = @"rectangle.portrait.slash";
    goto LABEL_11;
  }
LABEL_13:
  objc_super v15 = +[UIImage systemImageNamed:@"square.slash"];
LABEL_14:
  id v16 = [objc_alloc((Class)UIImageView) initWithImage:v15];

  return v16;
}

- (void)setupStop
{
  BOOL v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __57__RecoverDeviceUIExtensionRemoteViewController_setupStop__block_invoke;
  block[3] = &unk_10001C458;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __57__RecoverDeviceUIExtensionRemoteViewController_setupStop__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) setupkitClient];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) logger];
    unsigned int v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setupkitClient exist. Invalidating client", v8, 2u);
    }

    uint64_t v5 = [*(id *)(a1 + 32) setupkitClient];
    [v5 deregisterEventID:@"osrEventID" completionHandler:&__block_literal_global_754];

    objc_super v6 = [*(id *)(a1 + 32) setupkitClient];
    [v6 invalidate];

    [*(id *)(a1 + 32) setSetupkitClient:0];
    unsigned int v7 = [*(id *)(a1 + 32) setupTimer];
    [v7 invalidate];

    [*(id *)(a1 + 32) setSetupTimer:0];
  }
}

- (void)waitForServerResponse
{
  BOOL v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __69__RecoverDeviceUIExtensionRemoteViewController_waitForServerResponse__block_invoke;
  block[3] = &unk_10001C458;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __69__RecoverDeviceUIExtensionRemoteViewController_waitForServerResponse__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) logger];
  BOOL v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "will wait for server response", buf, 2u);
  }

  unsigned int v4 = [*(id *)(a1 + 32) setupTimer];
  [v4 invalidate];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __69__RecoverDeviceUIExtensionRemoteViewController_waitForServerResponse__block_invoke_756;
  v8[3] = &unk_10001C6E0;
  v8[4] = *(void *)(a1 + 32);
  uint64_t v5 = +[NSTimer timerWithTimeInterval:0 repeats:v8 block:10.0];
  [*(id *)(a1 + 32) setSetupTimer:v5];

  objc_super v6 = +[NSRunLoop mainRunLoop];
  unsigned int v7 = [*(id *)(a1 + 32) setupTimer];
  [v6 addTimer:v7 forMode:NSRunLoopCommonModes];
}

void __69__RecoverDeviceUIExtensionRemoteViewController_waitForServerResponse__block_invoke_756(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) logger];
  BOOL v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "timed out waiting for server response", buf, 2u);
  }

  [*(id *)(a1 + 32) setupStop];
  unsigned int v4 = [*(id *)(a1 + 32) recoverDeviceOperationsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __69__RecoverDeviceUIExtensionRemoteViewController_waitForServerResponse__block_invoke_757;
  block[3] = &unk_10001C458;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v4, block);
}

void __69__RecoverDeviceUIExtensionRemoteViewController_waitForServerResponse__block_invoke_757(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = +[NSError errorWithDomain:@"TapToRecoverProxCardError" code:10004 userInfo:0];
  [v1 showOverallResultCard:v2 resultType:3];
}

- (void)doneWaitingForServerResponse
{
  BOOL v3 = [(RecoverDeviceUIExtensionRemoteViewController *)self recoverDeviceOperationsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __76__RecoverDeviceUIExtensionRemoteViewController_doneWaitingForServerResponse__block_invoke;
  block[3] = &unk_10001C458;
  void block[4] = self;
  dispatch_async(v3, block);
}

id __76__RecoverDeviceUIExtensionRemoteViewController_doneWaitingForServerResponse__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) logger];
  BOOL v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "done waiting for server response", v6, 2u);
  }

  unsigned int v4 = [*(id *)(a1 + 32) setupTimer];
  [v4 invalidate];

  return [*(id *)(a1 + 32) setSetupTimer:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RecoverDeviceUIExtensionRemoteViewController;
  [(RecoverDeviceUIExtensionRemoteViewController *)&v7 viewDidDisappear:a3];
  unsigned int v4 = [(RecoverDeviceUIExtensionRemoteViewController *)self logger];
  uint64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RecoverDeviceUI ViewDidDissapear", v6, 2u);
  }

  [(RecoverDeviceUIExtensionRemoteViewController *)self setupStop];
}

- (void)proxCardFlowWillPresent
{
  id v2 = [(RecoverDeviceUIExtensionRemoteViewController *)self _remoteViewControllerProxy];
  [v2 setStatusBarHidden:1 withDuration:0.0];
}

- (void)proxCardFlowDidDismiss
{
  id v2 = [(RecoverDeviceUIExtensionRemoteViewController *)self _remoteViewControllerProxy];
  [v2 dismiss];
}

- (unint64_t)supportedInterfaceOrientations
{
  return _PRXSupportedInterfaceOrientations(self, 1);
}

- (UINavigationController)proxCardNavController
{
  return self->_proxCardNavController;
}

- (void)setProxCardNavController:(id)a3
{
}

- (CBDevice)deviceObj
{
  return self->_deviceObj;
}

- (void)setDeviceObj:(id)a3
{
}

- (NSString)kLocalizedDeviceType
{
  return self->_kLocalizedDeviceType;
}

- (void)setKLocalizedDeviceType:(id)a3
{
}

- (SKSetupClient)setupkitClient
{
  return self->_setupkitClient;
}

- (void)setSetupkitClient:(id)a3
{
}

- (SKDevice)setupkitDevice
{
  return self->_setupkitDevice;
}

- (void)setSetupkitDevice:(id)a3
{
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (OS_dispatch_queue)recoverDeviceOperationsQueue
{
  return self->_recoverDeviceOperationsQueue;
}

- (PRXCardContentViewController)initialCard
{
  return self->_initialCard;
}

- (void)setInitialCard:(id)a3
{
}

- (PRXCardContentViewController)learnMoreCard
{
  return self->_learnMoreCard;
}

- (void)setLearnMoreCard:(id)a3
{
}

- (PRXCardContentViewController)enterCodeCard
{
  return self->_enterCodeCard;
}

- (void)setEnterCodeCard:(id)a3
{
}

- (PRXCardContentViewController)settingUpDeviceCard
{
  return self->_settingUpDeviceCard;
}

- (void)setSettingUpDeviceCard:(id)a3
{
}

- (PRXCardContentViewController)progressCard
{
  return self->_progressCard;
}

- (void)setProgressCard:(id)a3
{
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (UILabel)progressText
{
  return self->_progressText;
}

- (void)setProgressText:(id)a3
{
}

- (PRXCardContentViewController)menuCard
{
  return self->_menuCard;
}

- (void)setMenuCard:(id)a3
{
}

- (RecoverDeviceMenuViewController)menuViewController
{
  return self->_menuViewController;
}

- (void)setMenuViewController:(id)a3
{
}

- (PRXCardContentViewController)recoveryCard
{
  return self->_recoveryCard;
}

- (void)setRecoveryCard:(id)a3
{
}

- (PRXCardContentViewController)eacsCard
{
  return self->_eacsCard;
}

- (void)setEacsCard:(id)a3
{
}

- (PRXCardContentViewController)eacsApprovalCard
{
  return self->_eacsApprovalCard;
}

- (void)setEacsApprovalCard:(id)a3
{
}

- (PRXCardContentViewController)overallResultCard
{
  return self->_overallResultCard;
}

- (void)setOverallResultCard:(id)a3
{
}

- (unint64_t)authenticationAttempt
{
  return self->_authenticationAttempt;
}

- (void)setAuthenticationAttempt:(unint64_t)a3
{
  self->_authenticationAttempt = a3;
}

- (BOOL)setupCompleted
{
  return self->_setupCompleted;
}

- (void)setSetupCompleted:(BOOL)a3
{
  self->_setupCompleted = a3;
}

- (BOOL)recoveryCompleted
{
  return self->_recoveryCompleted;
}

- (void)setRecoveryCompleted:(BOOL)a3
{
  self->_recoveryCompleted = a3;
}

- (BOOL)ignoreAdditionalCodes
{
  return self->_ignoreAdditionalCodes;
}

- (void)setIgnoreAdditionalCodes:(BOOL)a3
{
  self->_ignoreAdditionalCodes = a3;
}

- (BOOL)showingProgress
{
  return self->_showingProgress;
}

- (void)setShowingProgress:(BOOL)a3
{
  self->_showingProgress = a3;
}

- (BOOL)performingEACS
{
  return self->_performingEACS;
}

- (void)setPerformingEACS:(BOOL)a3
{
  self->_performingEACS = a3;
}

- (BOOL)extendedMode
{
  return self->_extendedMode;
}

- (void)setExtendedMode:(BOOL)a3
{
  self->_extendedMode = a3;
}

- (NSDictionary)serverConfig
{
  return self->_serverConfig;
}

- (void)setServerConfig:(id)a3
{
}

- (NSTimer)setupTimer
{
  return self->_setupTimer;
}

- (void)setSetupTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupTimer, 0);
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_storeStrong((id *)&self->_overallResultCard, 0);
  objc_storeStrong((id *)&self->_eacsApprovalCard, 0);
  objc_storeStrong((id *)&self->_eacsCard, 0);
  objc_storeStrong((id *)&self->_recoveryCard, 0);
  objc_storeStrong((id *)&self->_menuViewController, 0);
  objc_storeStrong((id *)&self->_menuCard, 0);
  objc_storeStrong((id *)&self->_progressText, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_progressCard, 0);
  objc_storeStrong((id *)&self->_settingUpDeviceCard, 0);
  objc_storeStrong((id *)&self->_enterCodeCard, 0);
  objc_storeStrong((id *)&self->_learnMoreCard, 0);
  objc_storeStrong((id *)&self->_initialCard, 0);
  objc_storeStrong((id *)&self->_recoverDeviceOperationsQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_setupkitDevice, 0);
  objc_storeStrong((id *)&self->_setupkitClient, 0);
  objc_storeStrong((id *)&self->_kLocalizedDeviceType, 0);
  objc_storeStrong((id *)&self->_deviceObj, 0);

  objc_storeStrong((id *)&self->_proxCardNavController, 0);
}

@end