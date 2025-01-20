@interface AKDaemonConnectionManager
+ (id)sharedInstance;
- (AAFService)appleIDPasskeyDaemonService;
- (AAFService)fidoDaemonService;
- (AAFService)inheritanceDaemonService;
- (AAFService)signInWithAppleDaemonService;
- (AAFService)walrusDaemonService;
- (AKAppleIDPasskeyAuthenticationController)passkeyAuthenticationController;
- (AKAuthorizationEndorserRapportClient)authorizationEndorserRapportClient;
- (AKDaemonConnectionManager)init;
- (BOOL)_isBiometricRatchetStatusChangeDarwinNotification:(id)a3;
- (BOOL)_isDeviceScreenUnlockNotification:(id)a3;
- (BOOL)_isKeychainSharingGroupUpdateDarwinNotification:(id)a3;
- (BOOL)_isPasscodeChangeNotification:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAllowClient:(id)a3 logging:(id *)a4;
- (NSXPCListener)anisetteServiceListener;
- (NSXPCListener)authServiceListener;
- (NSXPCListener)authorizationServiceListener;
- (NSXPCListener)custodianServiceListener;
- (NSXPCListener)privateEmailServiceListener;
- (id)passwordResetPresenter;
- (void)_beginObservingLanguageChangeNotfication;
- (void)_beginObservingRegulatoryEligibilityChangeNotification;
- (void)_checkKeybagUnlockState;
- (void)_checkScreenUnlockStateFromNotificationDictionary:(id)a3;
- (void)_enrollPasskeyIfEligible;
- (void)_exitForSIGTERM;
- (void)_handleKeychainSharingGroupUpdateNotification;
- (void)_monitorXPCEvents;
- (void)_performPasskeyCleanupWithPasskeyValidator:(id)a3 authenticationController:(id)a4 accountManager:(id)a5;
- (void)_setupServices;
- (void)_startListeningForMessagesFromPairedDevice;
- (void)_startMonitoringPushEvents;
- (void)_stopObservingLanguageChangeNotification;
- (void)_stopObservingRegulatoryEligibilityChangeNotification;
- (void)_updatePasskeyKeychainStatusForAccount:(id)a3;
- (void)_updateRestrictedSharingMode;
- (void)dealloc;
- (void)setAnisetteServiceListener:(id)a3;
- (void)setAppleIDPasskeyDaemonService:(id)a3;
- (void)setAuthServiceListener:(id)a3;
- (void)setAuthorizationEndorserRapportClient:(id)a3;
- (void)setAuthorizationServiceListener:(id)a3;
- (void)setCustodianServiceListener:(id)a3;
- (void)setFidoDaemonService:(id)a3;
- (void)setInheritanceDaemonService:(id)a3;
- (void)setPasskeyAuthenticationController:(id)a3;
- (void)setPrivateEmailServiceListener:(id)a3;
- (void)setSignInWithAppleDaemonService:(id)a3;
- (void)setWalrusDaemonService:(id)a3;
- (void)start;
- (void)startForTesting;
@end

@implementation AKDaemonConnectionManager

- (BOOL)shouldAllowClient:(id)a3 logging:(id *)a4
{
  id v5 = a3;
  if ([v5 hasWriteAccess])
  {
    +[NSString stringWithFormat:@"New connection from client %@ with the AK write entitlment.", v5];
  }
  else if ([v5 hasInternalAccess])
  {
    +[NSString stringWithFormat:@"New connection from client %@ (internal).", v5];
  }
  else if ([v5 hasPrivateAccess])
  {
    +[NSString stringWithFormat:@"New connection from client %@ (private).", v5];
  }
  else if ([v5 hasPublicAccess])
  {
    +[NSString stringWithFormat:@"New connection from client %@ (public).", v5];
  }
  else if ([v5 hasSiwaEntitlement])
  {
    +[NSString stringWithFormat:@"New connection from client %@ (beleverde).", v5];
  }
  else
  {
    if (![v5 hasPrivateSignedAccess])
    {
      v6 = +[NSString stringWithFormat:@"Rejecting connection from client %@ because it is not entitled.", v5];
      BOOL v7 = 0;
      if (!a4) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    +[NSString stringWithFormat:@"New connection from client %@ because of internal code signing.", v5];
  v6 = };
  BOOL v7 = 1;
  if (a4) {
LABEL_14:
  }
    *a4 = v6;
LABEL_15:

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  v8 = [[AKClient alloc] initWithConnection:v7];
  if (self->_authorizationServiceListener == v6)
  {
    id v10 = 0;
LABEL_5:
    if (self->_authServiceListener == v6)
    {
      v13 = [AKAppleIDAuthenticationService alloc];
      v14 = [(AKDaemonConnectionManager *)self passwordResetPresenter];
      v12 = [(AKAppleIDAuthenticationService *)v13 initWithClient:v8 passwordResetPresenter:v14];

      [v7 setExportedObject:v12];
      v15 = +[AKAppleIDAuthenticationDaemonInterface XPCInterface];
      [v7 setExportedInterface:v15];

      v16 = AKAppleIDAuthenticationClientInterface;
    }
    else if (self->_anisetteServiceListener == v6)
    {
      v17 = _AKTrafficLogSubsystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_1001905EC();
      }

      v12 = [[AKAnisetteProvisioningService alloc] initWithClient:v8];
      [v7 setExportedObject:v12];
      v18 = +[AKAnisetteProvisioningDaemonInterface XPCInterface];
      [v7 setExportedInterface:v18];

      v16 = AKAnisetteProvisioningClientInterface;
    }
    else if (self->_authorizationServiceListener == v6)
    {
      v12 = [[AKAuthorizationDaemonService alloc] initWithClient:v8];
      [v7 setExportedObject:v12];
      v19 = +[AKAuthorizationDaemonInterface XPCInterface];
      [v7 setExportedInterface:v19];

      v16 = AKAuthorizationClientInterface;
    }
    else
    {
      if (self->_custodianServiceListener == v6)
      {
        v12 = [[AKCustodianDaemonService alloc] initWithClient:v8];
        [v7 setExportedObject:v12];
        v20 = +[AKCustodianDaemonInterface XPCInterface];
        [v7 setExportedInterface:v20];
LABEL_20:

LABEL_21:
        [v7 resume];
        BOOL v11 = 1;
        goto LABEL_22;
      }
      if (self->_privateEmailServiceListener != v6)
      {
        _AKLogSystem();
        v12 = (AKAnisetteProvisioningService *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
          sub_100190654();
        }
        goto LABEL_21;
      }
      v12 = [[AKPrivateEmailDaemonService alloc] initWithClient:v8];
      [v7 setExportedObject:v12];
      v21 = +[AKPrivateEmailDaemonInterface XPCInterface];
      [v7 setExportedInterface:v21];

      v16 = AKPrivateEmailClientInterface;
    }
    v20 = [v16 XPCInterface];
    [v7 setRemoteObjectInterface:v20];
    goto LABEL_20;
  }
  id v23 = 0;
  unsigned int v9 = [(AKDaemonConnectionManager *)self shouldAllowClient:v8 logging:&v23];
  id v10 = v23;
  if (v9) {
    goto LABEL_5;
  }
  BOOL v11 = 0;
LABEL_22:

  return v11;
}

+ (id)sharedInstance
{
  if (qword_100272588 != -1) {
    dispatch_once(&qword_100272588, &stru_10022AD40);
  }
  v2 = (void *)qword_100272580;

  return v2;
}

- (void)dealloc
{
  authServiceListener = self->_authServiceListener;
  if (authServiceListener)
  {
    [(NSXPCListener *)authServiceListener invalidate];
    [(NSXPCListener *)self->_authServiceListener setDelegate:0];
    v4 = self->_authServiceListener;
    self->_authServiceListener = 0;
  }
  anisetteServiceListener = self->_anisetteServiceListener;
  if (anisetteServiceListener)
  {
    [(NSXPCListener *)anisetteServiceListener invalidate];
    [(NSXPCListener *)self->_anisetteServiceListener setDelegate:0];
    v6 = self->_anisetteServiceListener;
    self->_anisetteServiceListener = 0;
  }
  authorizationServiceListener = self->_authorizationServiceListener;
  if (authorizationServiceListener)
  {
    [(NSXPCListener *)authorizationServiceListener invalidate];
    [(NSXPCListener *)self->_authorizationServiceListener setDelegate:0];
    v8 = self->_authorizationServiceListener;
    self->_authorizationServiceListener = 0;
  }
  authorizationEndorserRapportClient = self->_authorizationEndorserRapportClient;
  if (authorizationEndorserRapportClient)
  {
    [(AKAuthorizationEndorserRapportClient *)authorizationEndorserRapportClient setDelegate:0];
    id v10 = self->_authorizationEndorserRapportClient;
    self->_authorizationEndorserRapportClient = 0;
  }
  privateEmailServiceListener = self->_privateEmailServiceListener;
  if (privateEmailServiceListener)
  {
    [(NSXPCListener *)privateEmailServiceListener invalidate];
    [(NSXPCListener *)self->_privateEmailServiceListener setDelegate:0];
    v12 = self->_privateEmailServiceListener;
    self->_privateEmailServiceListener = 0;
  }
  custodianServiceListener = self->_custodianServiceListener;
  if (custodianServiceListener)
  {
    [(NSXPCListener *)custodianServiceListener invalidate];
    [(NSXPCListener *)self->_custodianServiceListener setDelegate:0];
    v14 = self->_custodianServiceListener;
    self->_custodianServiceListener = 0;
  }
  inheritanceDaemonService = self->_inheritanceDaemonService;
  if (inheritanceDaemonService)
  {
    self->_inheritanceDaemonService = 0;
  }
  walrusDaemonService = self->_walrusDaemonService;
  if (walrusDaemonService)
  {
    self->_walrusDaemonService = 0;
  }
  appleIDPasskeyDaemonService = self->_appleIDPasskeyDaemonService;
  if (appleIDPasskeyDaemonService)
  {
    self->_appleIDPasskeyDaemonService = 0;
  }
  passkeyAuthenticationController = self->_passkeyAuthenticationController;
  if (passkeyAuthenticationController)
  {
    self->_passkeyAuthenticationController = 0;
  }
  signInWithAppleDaemonService = self->_signInWithAppleDaemonService;
  if (signInWithAppleDaemonService)
  {
    self->_signInWithAppleDaemonService = 0;
  }
  [(AKDaemonConnectionManager *)self _stopObservingLanguageChangeNotification];
  [(AKDaemonConnectionManager *)self _stopObservingSharingModePolicyChangeNotfication];
  [(AKDaemonConnectionManager *)self _stopObservingRegulatoryEligibilityChangeNotification];
  v20.receiver = self;
  v20.super_class = (Class)AKDaemonConnectionManager;
  [(AKDaemonConnectionManager *)&v20 dealloc];
}

- (AKDaemonConnectionManager)init
{
  v32.receiver = self;
  v32.super_class = (Class)AKDaemonConnectionManager;
  v2 = [(AKDaemonConnectionManager *)&v32 init];
  if (v2)
  {
    v3 = +[AKURLBagService sharedBagService];
    +[AKURLBag setSharedMemorySpaceBagProvider:v3];
    id v4 = objc_alloc((Class)NSXPCListener);
    id v5 = (NSXPCListener *)[v4 initWithMachServiceName:AKAppleIDAuthenticationMachService];
    authServiceListener = v2->_authServiceListener;
    v2->_authServiceListener = v5;

    id v7 = objc_alloc((Class)NSXPCListener);
    v8 = (NSXPCListener *)[v7 initWithMachServiceName:AKAnisetteProvisioningMachService];
    anisetteServiceListener = v2->_anisetteServiceListener;
    v2->_anisetteServiceListener = v8;

    id v10 = objc_alloc((Class)NSXPCListener);
    BOOL v11 = (NSXPCListener *)[v10 initWithMachServiceName:AKAuthorizationMachService];
    authorizationServiceListener = v2->_authorizationServiceListener;
    v2->_authorizationServiceListener = v11;

    id v13 = objc_alloc((Class)NSXPCListener);
    v14 = (NSXPCListener *)[v13 initWithMachServiceName:AKCustodianMachService];
    custodianServiceListener = v2->_custodianServiceListener;
    v2->_custodianServiceListener = v14;

    v16 = objc_alloc_init(AKInheritanceDaemonService);
    inheritanceDaemonService = v2->_inheritanceDaemonService;
    v2->_inheritanceDaemonService = (AAFService *)v16;

    id v18 = objc_alloc((Class)NSXPCListener);
    v19 = (NSXPCListener *)[v18 initWithMachServiceName:AKPrivateEmailMachService];
    privateEmailServiceListener = v2->_privateEmailServiceListener;
    v2->_privateEmailServiceListener = v19;

    v21 = objc_alloc_init(AKFidoDaemonService);
    fidoDaemonService = v2->_fidoDaemonService;
    v2->_fidoDaemonService = (AAFService *)v21;

    id v23 = objc_alloc_init(AKWalrusDaemonService);
    walrusDaemonService = v2->_walrusDaemonService;
    v2->_walrusDaemonService = (AAFService *)v23;

    v25 = objc_alloc_init(AKAppleIDPasskeyDaemonService);
    appleIDPasskeyDaemonService = v2->_appleIDPasskeyDaemonService;
    v2->_appleIDPasskeyDaemonService = (AAFService *)v25;

    v27 = (AKAppleIDPasskeyAuthenticationController *)objc_alloc_init((Class)AKAppleIDPasskeyAuthenticationController);
    passkeyAuthenticationController = v2->_passkeyAuthenticationController;
    v2->_passkeyAuthenticationController = v27;

    v29 = objc_alloc_init(AKSignInWithAppleDaemonService);
    signInWithAppleDaemonService = v2->_signInWithAppleDaemonService;
    v2->_signInWithAppleDaemonService = (AAFService *)v29;
  }
  return v2;
}

- (id)passwordResetPresenter
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = +[AKFeatureManager sharedManager];
  unsigned __int8 v4 = [v3 isForgotPasswordNativeTakeoverEnabled];

  if (v4)
  {
    passwordResetPresenter = v2->_passwordResetPresenter;
    if (!passwordResetPresenter)
    {
      v6 = objc_alloc_init(AKPasswordResetPresenter);
      id v7 = v2->_passwordResetPresenter;
      v2->_passwordResetPresenter = v6;

      passwordResetPresenter = v2->_passwordResetPresenter;
    }
    v8 = passwordResetPresenter;
  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v2);

  return v8;
}

- (void)start
{
  +[NSXPCListener enableTransactions];
  [(AKDaemonConnectionManager *)self _startMonitoringPushEvents];
  v3 = +[AKAppleIDCheckInHelperService sharedService];
  [v3 start];

  unsigned __int8 v4 = +[AKAuthorizationListUpdateService sharedService];
  [v4 start];

  id v5 = +[AKAppleIDPasskeyHealthCheckService sharedService];
  [v5 start];

  v6 = +[AKSignInWithAppleHealthCheckService sharedService];
  [v6 registerService];

  id v7 = +[AKPostInstallService sharedService];
  [v7 start];

  [(AKDaemonConnectionManager *)self _setupServices];
  [(AKDaemonConnectionManager *)self _startListeningForMessagesFromPairedDevice];
  [(AKDaemonConnectionManager *)self _monitorXPCEvents];
  [(AKDaemonConnectionManager *)self _beginObservingLanguageChangeNotfication];
  [(AKDaemonConnectionManager *)self _beginObservingSharingModePolicyChangeNotfication];
  [(AKDaemonConnectionManager *)self _beginObservingRegulatoryEligibilityChangeNotification];
  [(AKDaemonConnectionManager *)self _exitForSIGTERM];
  v8 = dispatch_get_global_queue(21, 0);
  dispatch_async(v8, &stru_10022AD60);
}

- (void)startForTesting
{
  v3 = +[AKURLBag bagForAltDSID:0];
  unsigned __int8 v4 = +[AKURLBagService sharedBagService];
  [v3 setBagProvider:v4];

  [(AKDaemonConnectionManager *)self _setupServices];
}

- (void)_setupServices
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100190564((uint64_t)self);
  }

  [(NSXPCListener *)self->_authServiceListener setDelegate:self];
  [(NSXPCListener *)self->_authServiceListener resume];
  unsigned __int8 v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1001904DC((uint64_t)self);
  }

  [(NSXPCListener *)self->_anisetteServiceListener setDelegate:self];
  [(NSXPCListener *)self->_anisetteServiceListener resume];
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100190454((uint64_t)self);
  }

  [(NSXPCListener *)self->_authorizationServiceListener setDelegate:self];
  [(NSXPCListener *)self->_authorizationServiceListener resume];
  v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1001903CC((uint64_t)self);
  }

  [(NSXPCListener *)self->_custodianServiceListener setDelegate:self];
  [(NSXPCListener *)self->_custodianServiceListener resume];
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100190344((uint64_t)self);
  }

  [(AAFService *)self->_inheritanceDaemonService startup];
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1001902BC((uint64_t)self);
  }

  [(NSXPCListener *)self->_privateEmailServiceListener setDelegate:self];
  [(NSXPCListener *)self->_privateEmailServiceListener resume];
  unsigned int v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100190234((uint64_t)self);
  }

  [(AAFService *)self->_fidoDaemonService startup];
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1001901AC((uint64_t)self);
  }

  [(AAFService *)self->_walrusDaemonService startup];
  BOOL v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100190124((uint64_t)self);
  }

  [(AAFService *)self->_appleIDPasskeyDaemonService startup];
  [(AAFService *)self->_signInWithAppleDaemonService startup];
}

- (void)_startMonitoringPushEvents
{
  id v11 = +[NSMutableArray array];
  v2 = +[AKPiggybackController sharedController];
  [v11 addObject:v2];

  v3 = +[AKFollowUpManagerFactory sharedAuthKitFollowupPushDelegate];
  [v11 addObject:v3];

  unsigned __int8 v4 = +[AKTTRController sharedController];
  [v11 addObject:v4];

  id v5 = +[AKDeviceListController sharedController];
  [v11 addObject:v5];

  v6 = +[AKUserInfoController sharedController];
  [v11 addObject:v6];

  id v7 = +[AKAppleIDCheckInHelperService sharedService];
  [v11 addObject:v7];

  v8 = +[AKUserConfigController sharedController];
  [v11 addObject:v8];

  unsigned int v9 = +[AKSignOutManager sharedManager];
  [v11 addObject:v9];

  id v10 = +[AKAppleIDPushHelperService sharedService];
  [v10 startWithDelegates:v11];
}

- (void)_monitorXPCEvents
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000AE7F0;
  handler[3] = &unk_100227FF0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AEB44;
  v5[3] = &unk_100227FF0;
  v5[4] = self;
  xpc_set_event_stream_handler("com.apple.rapport.matching", (dispatch_queue_t)&_dispatch_main_q, v5);

  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registered for XPC events", v4, 2u);
  }
}

- (BOOL)_isPasscodeChangeNotification:(id)a3
{
  return [a3 isEqual:MCPasscodeChangedNotification];
}

- (BOOL)_isBiometricRatchetStatusChangeDarwinNotification:(id)a3
{
  return [a3 isEqualToString:@"com.apple.LocalAuthentication.ratchet.StateDidChange"];
}

- (BOOL)_isDeviceScreenUnlockNotification:(id)a3
{
  uint64_t v3 = kSBSLockStateNotifyKey;
  id v4 = a3;
  id v5 = +[NSString stringWithUTF8String:v3];
  LOBYTE(v3) = [v4 isEqual:v5];

  return v3;
}

- (void)_checkScreenUnlockStateFromNotificationDictionary:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "_State");
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = +[NSNumber numberWithUnsignedLongLong:uint64];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Lockscreen state: %@ ", (uint8_t *)&v7, 0xCu);
  }
  if (!uint64)
  {
    +[AKAppleIDCheckInHelperService setCheckInAllowedForAllAccountsToValue:1];
    [(AKDaemonConnectionManager *)self _enrollPasskeyIfEligible];
  }
}

- (void)_checkKeybagUnlockState
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Checking lock state", v5, 2u);
  }

  uint64_t v3 = +[AKDevice currentDevice];
  unsigned int v4 = [v3 isUnlocked];

  if (v4) {
    +[AKAppleIDCheckInHelperService setCheckInAllowedForAllAccountsToValue:1];
  }
}

- (void)_startListeningForMessagesFromPairedDevice
{
  if (getenv("__OSINSTALL_ENVIRONMENT"))
  {
    v2 = _AKLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      uint64_t v3 = "We are running in recovery. Leaving IDS alone.";
      unsigned int v4 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (getenv("__AKSYNCBUBBLE"))
  {
    v2 = _AKLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v3 = "We are running in the sync bubble. Leaving IDS alone.";
      unsigned int v4 = buf;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  id v5 = +[AKPeerIDSAnisetteService sharedService];
  [v5 startListeningForMessagesFromPairedDevice];
}

- (void)_beginObservingLanguageChangeNotfication
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000AEFDC, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopObservingLanguageChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.language.changed", 0);
}

- (void)_exitForSIGTERM
{
  object = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  dispatch_source_set_event_handler(object, &stru_10022ADC0);
  dispatch_resume(object);
}

- (void)_beginObservingRegulatoryEligibilityChangeNotification
{
  uint64_t v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Begin observing eligibility status change.", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000AF1EC, @"com.apple.os-eligibility-domain.change", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopObservingRegulatoryEligibilityChangeNotification
{
  uint64_t v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop observing eligibility status change.", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.os-eligibility-domain.change", 0);
}

- (void)_updateRestrictedSharingMode
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating current sharing mode.", v4, 2u);
  }

  uint64_t v3 = +[AKDevice currentDevice];
  [v3 _setCurrentSharingMode];
}

- (void)_enrollPasskeyIfEligible
{
  uint64_t v3 = +[AKAccountManager sharedInstance];
  unsigned int v4 = [v3 primaryAuthKitAccount];
  id v5 = _AKLogPasskey();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      sub_1001907CC();
    }

    id v5 = [v3 altDSIDForAccount:v4];
    id v7 = [objc_alloc((Class)AKAppleIDPasskeySetupContext) initWithAltDSID:v5];
    v8 = [AKAppleIDPasskeyValidator alloc];
    unsigned int v9 = +[AKFeatureManager sharedManager];
    id v10 = objc_opt_new();
    id v11 = +[AKDevice currentDevice];
    v12 = objc_opt_new();
    val = self;
    id v13 = [(AKAppleIDPasskeyValidator *)v8 initWithAccount:v4 accountManager:v3 featureManager:v9 configuration:v10 device:v11 cdpFactory:v12 authenticationController:self->_passkeyAuthenticationController];

    uint64_t v14 = +[AKAppleIDPasskeyEnrollController challengeProviderWithContext:v7 client:0];
    uint64_t v15 = +[AKAppleIDPasskeyEnrollController registrationProviderWithContext:v7 client:0];
    v16 = [AKAppleIDPasskeyCredentialProvider alloc];
    v17 = objc_opt_new();
    id v18 = [(AKAppleIDPasskeyCredentialProvider *)v16 initWithAuthorizationController:v17];

    v19 = [AKAppleIDPasskeyEnrollController alloc];
    v25 = (void *)v14;
    uint64_t v20 = v14;
    v21 = (void *)v15;
    v22 = v18;
    id v23 = [(AKAppleIDPasskeyEnrollController *)v19 initWithPasskeyValidator:v13 challengeProvider:v20 credentialProvider:v18 registrationProvider:v21];
    objc_initWeak(&location, val);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000AF664;
    v27[3] = &unk_10022ADE8;
    objc_copyWeak(&v31, &location);
    id v28 = v4;
    v24 = v13;
    v29 = v24;
    id v30 = v3;
    [(AKAppleIDPasskeyEnrollController *)v23 setupPasskeyWithContext:v7 forced:0 completion:v27];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  else if (v6)
  {
    sub_100190798();
  }
}

- (void)_updatePasskeyKeychainStatusForAccount:(id)a3
{
}

- (void)_performPasskeyCleanupWithPasskeyValidator:(id)a3 authenticationController:(id)a4 accountManager:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[AKAppleIDPasskeyCleanupController alloc] initWithPasskeyValidator:v9 authenticationController:v8 accountManager:v7];

  [(AKAppleIDPasskeyCleanupController *)v10 cleanupPasskeysFromKeychainWithcompletion:&stru_10022AE28];
}

- (BOOL)_isKeychainSharingGroupUpdateDarwinNotification:(id)a3
{
  return [a3 isEqualToString:@"com.apple.security.kcsharing.groupsupdated"];
}

- (void)_handleKeychainSharingGroupUpdateNotification
{
  v2 = _AKLogSiwa();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received KCSharingGroupUpdateNotification", buf, 2u);
  }

  uint64_t v3 = +[AKAccountManager sharedInstance];
  unsigned int v4 = [v3 primaryAuthKitAccount];
  id v5 = _AKLogSiwa();
  BOOL v6 = v5;
  if (!v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No primary AuthKit account found.", v9, 2u);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100190944();
  }

  id v7 = +[NSDate date];
  [v3 setSharingGroupLastNotificationDate:v7 forAccount:v4];

  uint64_t v8 = 0;
  [v3 saveAccount:v4 error:&v8];
  if (v8)
  {
    BOOL v6 = _AKLogSiwa();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100190904();
    }
LABEL_11:
  }
}

- (NSXPCListener)anisetteServiceListener
{
  return self->_anisetteServiceListener;
}

- (void)setAnisetteServiceListener:(id)a3
{
}

- (NSXPCListener)authServiceListener
{
  return self->_authServiceListener;
}

- (void)setAuthServiceListener:(id)a3
{
}

- (NSXPCListener)authorizationServiceListener
{
  return self->_authorizationServiceListener;
}

- (void)setAuthorizationServiceListener:(id)a3
{
}

- (NSXPCListener)custodianServiceListener
{
  return self->_custodianServiceListener;
}

- (void)setCustodianServiceListener:(id)a3
{
}

- (NSXPCListener)privateEmailServiceListener
{
  return self->_privateEmailServiceListener;
}

- (void)setPrivateEmailServiceListener:(id)a3
{
}

- (AKAuthorizationEndorserRapportClient)authorizationEndorserRapportClient
{
  return self->_authorizationEndorserRapportClient;
}

- (void)setAuthorizationEndorserRapportClient:(id)a3
{
}

- (AAFService)inheritanceDaemonService
{
  return self->_inheritanceDaemonService;
}

- (void)setInheritanceDaemonService:(id)a3
{
}

- (AAFService)fidoDaemonService
{
  return self->_fidoDaemonService;
}

- (void)setFidoDaemonService:(id)a3
{
}

- (AAFService)walrusDaemonService
{
  return self->_walrusDaemonService;
}

- (void)setWalrusDaemonService:(id)a3
{
}

- (AAFService)appleIDPasskeyDaemonService
{
  return self->_appleIDPasskeyDaemonService;
}

- (void)setAppleIDPasskeyDaemonService:(id)a3
{
}

- (AAFService)signInWithAppleDaemonService
{
  return self->_signInWithAppleDaemonService;
}

- (void)setSignInWithAppleDaemonService:(id)a3
{
}

- (AKAppleIDPasskeyAuthenticationController)passkeyAuthenticationController
{
  return self->_passkeyAuthenticationController;
}

- (void)setPasskeyAuthenticationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passkeyAuthenticationController, 0);
  objc_storeStrong((id *)&self->_signInWithAppleDaemonService, 0);
  objc_storeStrong((id *)&self->_appleIDPasskeyDaemonService, 0);
  objc_storeStrong((id *)&self->_walrusDaemonService, 0);
  objc_storeStrong((id *)&self->_fidoDaemonService, 0);
  objc_storeStrong((id *)&self->_inheritanceDaemonService, 0);
  objc_storeStrong((id *)&self->_authorizationEndorserRapportClient, 0);
  objc_storeStrong((id *)&self->_privateEmailServiceListener, 0);
  objc_storeStrong((id *)&self->_custodianServiceListener, 0);
  objc_storeStrong((id *)&self->_authorizationServiceListener, 0);
  objc_storeStrong((id *)&self->_authServiceListener, 0);
  objc_storeStrong((id *)&self->_anisetteServiceListener, 0);

  objc_storeStrong((id *)&self->_passwordResetPresenter, 0);
}

@end