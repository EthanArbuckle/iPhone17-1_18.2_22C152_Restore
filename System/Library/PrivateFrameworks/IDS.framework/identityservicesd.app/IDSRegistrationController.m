@interface IDSRegistrationController
+ (BOOL)_isPhoneNumberAuthenticationDuringBuddyAllowed;
+ (BOOL)canCompleteRegistration;
+ (BOOL)canStartRegistrationForAccountType:(int)a3;
+ (BOOL)isBuddyBlockingRegistration;
+ (BOOL)isBuddyShowing;
+ (BOOL)systemSupportsPhoneNumberRegistration;
+ (BOOL)systemSupportsRegistrationInfo:(id)a3;
+ (BOOL)systemSupportsServiceType:(id)a3 accountType:(int)a4 isTemporary:(BOOL)a5;
+ (BOOL)systemSupportsServiceType:(id)a3 registrationType:(int)a4;
+ (BOOL)validSIMStateForRegistration;
+ (IDSRegistrationController)sharedInstance;
+ (id)registeredPhoneNumbers;
+ (void)initialize;
- (BOOL)_performCorrectServerRequestForTemporaryPhoneRegistration:(id)a3 sentAuthentication:(BOOL *)a4 sentIDSAction:(BOOL *)a5;
- (BOOL)_pnrOngoing;
- (BOOL)_sendIDSAuthenticationForRegistration:(id)a3;
- (BOOL)_sendIDSAuthenticationOrRegistrationIfNeeded:(id)a3;
- (BOOL)_shouldSubmitRegistrationCompletedMetricForRegistration:(id)a3;
- (BOOL)displayingAddNumberPrompt;
- (BOOL)registerInfo:(id)a3;
- (BOOL)registerInfo:(id)a3 requireSilentAuth:(BOOL)a4;
- (BOOL)registrationSupportedForRegistration:(id)a3;
- (BOOL)systemSupportsPhoneNumberRegistration;
- (BOOL)systemSupportsRegistrationInfo:(id)a3;
- (BOOL)systemSupportsServiceType:(id)a3 accountType:(int)a4 isTemporary:(BOOL)a5;
- (BOOL)systemSupportsServiceType:(id)a3 registrationType:(int)a4;
- (BOOL)unregisterInfo:(id)a3;
- (IDSKeychainWrapper)keychainWrapper;
- (IDSRateLimiter)simDeactivationRequestRateLimiter;
- (IDSRegistrationController)init;
- (IDSRegistrationController)initWithUserStore:(id)a3;
- (IDSUserStore)userStore;
- (NSArray)activeRegistrations;
- (NSArray)activeRegistrationsToRegister;
- (NSArray)trackedRegistrations;
- (double)simDeactivationInfoRateLimitInterval;
- (id)_phoneUserWithCredentials;
- (id)_provisionedTemporaryUser;
- (id)activeRegistrationsMatchingUserID:(id)a3;
- (id)activeRegistrationsOfType:(int)a3;
- (int64_t)simDeactivationInfoRateLimitCount;
- (void)SIM:(id)a3 didDeactivateWithInfo:(id)a4;
- (void)_alertForHomeNumberIfNeededForSIMIdentifier:(id)a3 withPhoneNumber:(id)a4;
- (void)_captureDiagnosticsForFailedRegistration:(id)a3 registrationError:(int64_t)a4;
- (void)_ensureProfileQueriesAreReadyForRegistratration:(id)a3;
- (void)_notifyAllRegistrationSuccess:(id)a3;
- (void)_notifyDeregistrationStarting:(id)a3;
- (void)_notifyHomeNumberSuccessForUser:(id)a3;
- (void)_notifyNeedsNewRegistration;
- (void)_notifyRegistrationFailure:(id)a3 error:(int64_t)a4 info:(id)a5;
- (void)_notifyRegistrationStarting:(id)a3;
- (void)_notifyRegistrationSuccess:(id)a3;
- (void)_notifyRegistrationUpdated:(id)a3;
- (void)_postHomeNumberNotificationBeforeAlertForIdentifier:(id)a3 forcefully:(BOOL)a4;
- (void)_submitRegistrationCompletedMetricWithRegistration:(id)a3 success:(BOOL)a4 registrationError:(int64_t)a5;
- (void)_systemConfigurationPrefsChanged;
- (void)_updateNotifyState;
- (void)addListener:(id)a3;
- (void)cancelActionsForRegistrationInfo:(id)a3;
- (void)center:(id)a3 allSucceededRegistrations:(id)a4;
- (void)center:(id)a3 failedAuthentication:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)center:(id)a3 failedCurrentEmailsRequest:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)center:(id)a3 failedIDSAuthentication:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)center:(id)a3 failedIdentification:(id)a4 error:(int64_t)a5;
- (void)center:(id)a3 failedRegistration:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)center:(id)a3 succeededAuthentication:(id)a4;
- (void)center:(id)a3 succeededCurrentEmailsRequest:(id)a4 emailInfo:(id)a5;
- (void)center:(id)a3 succeededIDSAuthentication:(id)a4;
- (void)center:(id)a3 succeededIdentification:(id)a4 phoneNumber:(id)a5 token:(id)a6;
- (void)center:(id)a3 succeededInitialRegionQuery:(id)a4;
- (void)center:(id)a3 succeededLinkHandlesConfirmation:(id)a4 emailAddress:(id)a5;
- (void)center:(id)a3 succeededRegionValidation:(id)a4 regionID:(id)a5 phoneNumber:(id)a6 extraContext:(id)a7 verified:(BOOL)a8;
- (void)center:(id)a3 succeededRegistration:(id)a4;
- (void)centerNeedsNewIdentification:(id)a3;
- (void)dealloc;
- (void)noteManateeAvailabilityTime;
- (void)noteiCloudSignInTime;
- (void)removeListener:(id)a3;
- (void)reportClientEvent:(id)a3 registration:(id)a4 completion:(id)a5;
- (void)reportMessage:(id)a3 toURI:(id)a4 registration:(id)a5;
- (void)reportSpamWithMessages:(id)a3 toURI:(id)a4 registration:(id)a5;
- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8 registration:(id)a9;
- (void)setDisplayingAddNumberPrompt:(BOOL)a3;
- (void)setKeychainWrapper:(id)a3;
- (void)setSimDeactivationRequestRateLimiter:(id)a3;
- (void)setUserStore:(id)a3;
- (void)startTrackingActiveRegistration:(id)a3;
- (void)startTrackingRegistration:(id)a3;
- (void)stopTrackingActiveRegistration:(id)a3;
- (void)stopTrackingRegistration:(id)a3;
- (void)systemDidLeaveFirstDataProtectionLock;
@end

@implementation IDSRegistrationController

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    +[IDSRegistrationKeyManager setupKeys];
  }
}

+ (BOOL)isBuddyShowing
{
  uint64_t v2 = +[IMSystemMonitor sharedInstance];
  char v3 = [v2 isSetup] ^ 1;

  return v3;
}

+ (BOOL)isBuddyBlockingRegistration
{
  if (_os_feature_enabled_impl()) {
    return 0;
  }

  return [a1 isBuddyShowing];
}

+ (BOOL)canStartRegistrationForAccountType:(int)a3
{
  if (_os_feature_enabled_impl())
  {
    v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RegisterDuringBuddy feature flag set to YES.  Allowing registration.", (uint8_t *)&v18, 2u);
    }
    LOBYTE(v6) = 1;
  }
  else
  {
    unsigned int v7 = [a1 isBuddyBlockingRegistration];
    int v6 = v7 ^ 1;
    unsigned int v8 = [a1 _isPhoneNumberAuthenticationDuringBuddyAllowed];
    v9 = +[IDSPairingManager sharedInstance];
    unsigned int v10 = [v9 isCurrentDeviceTinkerConfiguredWatch];

    if (a3 == 1)
    {
      v6 |= v10;
    }
    else if (!a3)
    {
      v6 |= v8;
    }
    v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      uint64_t v12 = _StringForIDSAccountType();
      v13 = (void *)v12;
      int v18 = 138413314;
      if (v7) {
        CFStringRef v14 = @"NO";
      }
      else {
        CFStringRef v14 = @"YES";
      }
      CFStringRef v19 = v11;
      if (v8) {
        CFStringRef v15 = @"YES";
      }
      else {
        CFStringRef v15 = @"NO";
      }
      __int16 v20 = 2112;
      if (v10) {
        CFStringRef v16 = @"YES";
      }
      else {
        CFStringRef v16 = @"NO";
      }
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      CFStringRef v23 = v14;
      __int16 v24 = 2112;
      CFStringRef v25 = v15;
      __int16 v26 = 2112;
      CFStringRef v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checked whether system setup dependencies are complete { haveDependenciesCompleted: %@, accountType: %@, hasSetupCompleted: %@, isPhoneNumberAuthenticationDuringSetupAllowed: %@, isAppleIDRegistrationDuringSetupAllowed: %@ }", (uint8_t *)&v18, 0x34u);
    }
  }

  return v6;
}

+ (BOOL)canCompleteRegistration
{
  uint64_t v2 = +[IDSPairingManager sharedInstance];
  unsigned __int8 v3 = [v2 activePairedDeviceHasPairingType:1];

  v4 = +[IDSDependencyProvider systemMonitorAdapter];
  unsigned __int8 v5 = [v4 isUnderFirstDataProtectionLock];

  if ((v5 & 1) == 0 && (v3 & 1) == 0) {
    unsigned __int8 v5 = +[IDSRegistrationController isBuddyBlockingRegistration];
  }
  return v5 ^ 1;
}

+ (BOOL)_isPhoneNumberAuthenticationDuringBuddyAllowed
{
  uint64_t v2 = +[IDSServerBag sharedInstanceForBagType:0];
  unsigned __int8 v3 = [v2 objectForKey:@"setup-phone-auth-enabled"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

+ (BOOL)validSIMStateForRegistration
{
  if (!+[IDSRegistrationController systemSupportsPhoneNumberRegistration])return 1; {
  uint64_t v2 = +[IDSCTAdapter sharedInstance];
  }
  unsigned __int8 v3 = [v2 isAnySIMUsable];

  if ((v3 & 1) == 0)
  {
    unsigned __int8 v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      int v6 = " SIM State says cannot register";
      unsigned int v7 = (uint8_t *)&v12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
LABEL_11:

    return 0;
  }
  unsigned __int8 v4 = +[IDSCTAdapter sharedInstance];
  if (![v4 isAnySIMUsable])
  {
    unsigned int v8 = +[IMMobileNetworkManager sharedInstance];
    unsigned int v9 = [v8 requiresSIMInserted];

    if (!v9) {
      return 1;
    }
    unsigned __int8 v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      int v6 = " SIM is not inserted, cannot register";
      unsigned int v7 = (uint8_t *)&v11;
      goto LABEL_10;
    }
    goto LABEL_11;
  }

  return 1;
}

+ (id)registeredPhoneNumbers
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  unsigned __int8 v3 = +[IDSRegistrationController sharedInstance];
  unsigned __int8 v4 = [v3 trackedRegistrations];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007046C;
  v8[3] = &unk_10097FE80;
  id v9 = v2;
  id v5 = v2;
  [v4 enumerateObjectsUsingBlock:v8];

  id v6 = [v5 copy];

  return v6;
}

+ (IDSRegistrationController)sharedInstance
{
  if (qword_100A4A5A8 != -1) {
    dispatch_once(&qword_100A4A5A8, &stru_100980808);
  }
  id v2 = (void *)qword_100A4A5B0;

  return (IDSRegistrationController *)v2;
}

- (IDSRegistrationController)init
{
  return [(IDSRegistrationController *)self initWithUserStore:0];
}

- (IDSUserStore)userStore
{
  userStore = self->_userStore;
  if (userStore)
  {
    unsigned __int8 v3 = userStore;
  }
  else
  {
    unsigned __int8 v4 = +[IDSDaemon sharedInstance];
    id v5 = [v4 registrationConductor];
    unsigned __int8 v3 = [v5 userStore];
  }

  return v3;
}

- (IDSRegistrationController)initWithUserStore:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)IDSRegistrationController;
  id v6 = [(IDSRegistrationController *)&v30 init];
  unsigned int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userStore, a3);
    unsigned int v8 = +[FTDeviceSupport sharedInstance];
    uint64_t v9 = [v8 deviceName];
    deviceName = v7->_deviceName;
    v7->_deviceName = (NSString *)v9;

    __int16 v11 = +[IMRGLog registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = +[FTDeviceSupport sharedInstance];
      v13 = [v12 deviceInformationString];
      LODWORD(buf.version) = 138412290;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Registration controller starting up (%@)", (uint8_t *)&buf, 0xCu);
    }
    memset(&buf, 0, sizeof(buf));
    SCDynamicStoreRef v14 = SCDynamicStoreCreate(kCFAllocatorDefault, @"com.apple.IDSRegistrationController", (SCDynamicStoreCallBack)sub_100070968, &buf);
    if (v14)
    {
      CFStringRef v15 = v14;
      CFStringRef ComputerName = SCDynamicStoreKeyCreateComputerName(kCFAllocatorDefault);
      CFStringRef v31 = ComputerName;
      CFArrayRef v17 = +[NSArray arrayWithObjects:&v31 count:1];
      if (ComputerName) {
        CFRelease(ComputerName);
      }
      if (!SCDynamicStoreSetNotificationKeys(v15, v17, 0))
      {
        int v18 = SCError();
        SCErrorString(v18);
        _IMWarn();
      }
      CFStringRef v19 = im_primary_queue();
      SCDynamicStoreSetDispatchQueue(v15, v19);
    }
    else
    {
      _IMWarn();
    }
    __int16 v20 = objc_alloc_init(IDSKeychainWrapper);
    keychainWrapper = v7->_keychainWrapper;
    v7->_keychainWrapper = v20;

    __int16 v22 = +[IDSAppleIDRegistrationCenter sharedInstance];
    [v22 addListener:v7];

    CFStringRef v23 = +[IDSRegistrationCenter sharedInstance];
    [v23 addListener:v7];

    __int16 v24 = +[IDSSMSRegistrationCenter sharedInstance];
    [v24 addListener:v7];

    if (_IDSRunningInDaemon())
    {
      CFStringRef v25 = (const char *)IMUserScopedNotification();
      notify_register_check(v25, &v7->_screenSharingToken);
      __int16 v26 = (const char *)IMUserScopedNotification();
      notify_register_check(v26, &v7->_iMessageToken);
      CFStringRef v27 = (const char *)IMUserScopedNotification();
      notify_register_check(v27, &v7->_faceTimeToken);
      v28 = (const char *)IMUserScopedNotification();
      notify_register_check(v28, &v7->_callingToken);
      [(IDSRegistrationController *)v7 _updateNotifyState];
    }
  }

  return v7;
}

- (void)dealloc
{
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:0 object:0];

  unsigned __int8 v4 = +[IDSAppleIDRegistrationCenter sharedInstance];
  [v4 removeListener:self];

  id v5 = +[IDSRegistrationCenter sharedInstance];
  [v5 removeListener:self];

  id v6 = +[IDSSMSRegistrationCenter sharedInstance];
  [v6 removeListener:self];

  v7.receiver = self;
  v7.super_class = (Class)IDSRegistrationController;
  [(IDSRegistrationController *)&v7 dealloc];
}

- (BOOL)registrationSupportedForRegistration:(id)a3
{
  unsigned __int8 v3 = +[IMLockdownManager sharedInstance];
  unsigned int v4 = [v3 isExpired];

  if (v4)
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "*** Lockdown state is expired, not allowing registration", (uint8_t *)&v10, 2u);
    }
    LOBYTE(v6) = 0;
  }
  else
  {
    objc_super v7 = +[FTDeviceSupport sharedInstance];
    unsigned int v6 = [v7 registrationSupported];

    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = @"NO";
      if (v6) {
        CFStringRef v8 = @"YES";
      }
      int v10 = 138412290;
      CFStringRef v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Returning device support registration supported: %@", (uint8_t *)&v10, 0xCu);
    }
  }

  return v6;
}

+ (BOOL)systemSupportsServiceType:(id)a3 accountType:(int)a4 isTemporary:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (v6 != 1)
  {
    if (v6)
    {
      unsigned __int8 v9 = 1;
      goto LABEL_8;
    }
    if (v5) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  unsigned __int8 v9 = [a1 systemSupportsServiceType:v8 registrationType:v6];
LABEL_8:

  return v9;
}

+ (BOOL)systemSupportsServiceType:(id)a3 registrationType:(int)a4
{
  id v5 = a3;
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      unsigned __int8 v9 = +[FTDeviceSupport sharedInstance];
      unsigned __int8 v10 = [v9 supportsAppleIDIdentification];

      if ((v10 & 1) == 0)
      {
        uint64_t v6 = +[IMRGLog registration];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v29 = 0;
          objc_super v7 = "System does not support Apple ID identification";
          id v8 = (uint8_t *)&v29;
          goto LABEL_36;
        }
        goto LABEL_37;
      }
    }
    else
    {
      if (a4)
      {
        v13 = +[IMRGLog warning];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          sub_10070BCA4(a4, v13);
        }

        goto LABEL_38;
      }
      if (!+[IDSRegistrationController systemSupportsPhoneNumberRegistration])
      {
        uint64_t v6 = +[IMRGLog registration];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v30 = 0;
          objc_super v7 = "System does not support SMS identification";
          id v8 = (uint8_t *)&v30;
LABEL_36:
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
          goto LABEL_37;
        }
        goto LABEL_37;
      }
    }
  }
  if (IDSIsFaceTimeRegistrationServiceType())
  {
    CFStringRef v11 = +[FTDeviceSupport sharedInstance];
    unsigned __int8 v12 = [v11 faceTimeSupported];

    if ((v12 & 1) == 0)
    {
      uint64_t v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v28 = 0;
        objc_super v7 = "System does not support FaceTime";
        id v8 = (uint8_t *)&v28;
        goto LABEL_36;
      }
LABEL_37:

LABEL_38:
      BOOL v22 = 0;
      goto LABEL_39;
    }
    goto LABEL_31;
  }
  if (IDSIsCallingRegistrationServiceType())
  {
    SCDynamicStoreRef v14 = +[FTDeviceSupport sharedInstance];
    unsigned __int8 v15 = [v14 callingSupported];

    if ((v15 & 1) == 0)
    {
      uint64_t v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v27 = 0;
        objc_super v7 = "System does not support Calling";
        id v8 = (uint8_t *)&v27;
        goto LABEL_36;
      }
      goto LABEL_37;
    }
    goto LABEL_31;
  }
  if (IDSIsMultiwayRegistrationServiceType())
  {
    CFStringRef v16 = +[FTDeviceSupport sharedInstance];
    unsigned __int8 v17 = [v16 multiwaySupported];

    if ((v17 & 1) == 0)
    {
      uint64_t v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = 0;
        objc_super v7 = "System does not support Multiway";
        id v8 = (uint8_t *)&v26;
        goto LABEL_36;
      }
      goto LABEL_37;
    }
    goto LABEL_31;
  }
  if (IDSIsiMessageRegistrationServiceType())
  {
    int v18 = +[FTDeviceSupport sharedInstance];
    unsigned __int8 v19 = [v18 iMessageSupported];

    if ((v19 & 1) == 0)
    {
      uint64_t v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = 0;
        objc_super v7 = "System does not support iMessage";
        id v8 = (uint8_t *)&v25;
        goto LABEL_36;
      }
      goto LABEL_37;
    }
    goto LABEL_31;
  }
  if (IDSIsAlloyRegistrationServiceType())
  {
    __int16 v20 = +[FTDeviceSupport sharedInstance];
    unsigned __int8 v21 = [v20 identityServicesSupported];

    if ((v21 & 1) == 0)
    {
      uint64_t v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = 0;
        objc_super v7 = "System does not support IDS";
        id v8 = (uint8_t *)&v24;
        goto LABEL_36;
      }
      goto LABEL_37;
    }
LABEL_31:
    BOOL v22 = 1;
    goto LABEL_39;
  }
  if (!IDSIsStewieRegistrationServiceType())
  {
    uint64_t v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10070BD1C((uint64_t)v5, v6);
    }
    goto LABEL_37;
  }
  BOOL v22 = a4 == 0;
LABEL_39:

  return v22;
}

+ (BOOL)systemSupportsRegistrationInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 serviceType];
  unsigned __int8 v6 = objc_msgSend(a1, "systemSupportsServiceType:registrationType:", v5, objc_msgSend(v4, "registrationType"));
  if ((v6 & 1) == 0)
  {
    objc_super v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "We can't register this: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

+ (BOOL)systemSupportsPhoneNumberRegistration
{
  id v2 = +[FTDeviceSupport sharedInstance];
  id v3 = [v2 deviceType];

  id v4 = +[IDSPairingManager sharedInstance];
  unsigned __int8 v5 = [v4 isCurrentDeviceTinkerConfiguredWatch];

  if (v3 == (id)6) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  if (v3 == (id)2) {
    char v7 = 1;
  }
  else {
    char v7 = v6;
  }
  id v8 = +[IDSCTAdapter sharedInstance];
  char v9 = [v8 supportsIdentification] & v7;

  return v9;
}

- (BOOL)systemSupportsPhoneNumberRegistration
{
  id v2 = objc_opt_class();

  return [v2 systemSupportsPhoneNumberRegistration];
}

- (BOOL)systemSupportsServiceType:(id)a3 accountType:(int)a4 isTemporary:(BOOL)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  LOBYTE(v5) = [(id)objc_opt_class() systemSupportsServiceType:v7 accountType:v6 isTemporary:v5];

  return v5;
}

- (BOOL)systemSupportsServiceType:(id)a3 registrationType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  LOBYTE(v4) = [(id)objc_opt_class() systemSupportsServiceType:v5 registrationType:v4];

  return v4;
}

- (BOOL)systemSupportsRegistrationInfo:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [(id)objc_opt_class() systemSupportsRegistrationInfo:v3];

  return v4;
}

- (BOOL)registerInfo:(id)a3
{
  return [(IDSRegistrationController *)self registerInfo:a3 requireSilentAuth:0];
}

- (BOOL)registerInfo:(id)a3 requireSilentAuth:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v89 = _os_activity_create((void *)&_mh_execute_header, "Registration controller register", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v89, &state);
  id v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = +[FTDeviceSupport sharedInstance];
    char v9 = [v8 deviceInformationString];
    *(_DWORD *)SCDynamicStoreContext buf = 138412546;
    unint64_t v92 = (unint64_t)v6;
    __int16 v93 = 2112;
    v94 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Registration request: %@  (Environment: %@)", buf, 0x16u);
  }
  if ([(IDSRegistrationController *)self registrationSupportedForRegistration:v6])
  {
    id v10 = [v6 pushToken];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      unsigned __int8 v15 = +[IMRGLog registration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)SCDynamicStoreContext buf = 138412290;
        unint64_t v92 = (unint64_t)v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cannot register, invalid push token: %@", buf, 0xCu);
      }
      uint64_t v19 = 14;
      goto LABEL_21;
    }
    if ([(IDSRegistrationController *)self systemSupportsRegistrationInfo:v6])
    {
      if (![v6 registrationType]
        && !+[IMUserDefaults bypassRegistrationControlStatusCheck])
      {
        unsigned __int8 v12 = +[IDSDRegistrationControl sharedInstance];
        unint64_t v13 = (unint64_t)[v12 registrationStateForRegistrationType:0 error:0];

        if ((v13 & 0xFFFFFFFFFFFFFFFDLL) == 1)
        {
          SCDynamicStoreRef v14 = +[IMRGLog registration];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCDynamicStoreContext buf = 134217984;
            unint64_t v92 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cannot register, phone number registration or authentication are disabled { controlStatus: %lld }", buf, 0xCu);
          }

          [(IDSRegistrationController *)self _notifyRegistrationFailure:v6 error:39 info:0];
          goto LABEL_22;
        }
      }
      __int16 v87 = 0;
      [v6 setRunningSimpleAuthentication:0];
      unsigned int v22 = [v6 registrationType];
      if (v22)
      {
        if (v22 != 1)
        {
          if (v22 != 2)
          {
            v42 = +[IMRGLog warning];
            if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
              sub_10070BD94((uint64_t)v6, buf, (int)[v6 registrationType], v42);
            }

            uint64_t v24 = 1;
            goto LABEL_55;
          }
          CFStringRef v23 = +[IMRGLog registration];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCDynamicStoreContext buf = 138412290;
            unint64_t v92 = (unint64_t)v6;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Request to register Home Number for info: %@", buf, 0xCu);
          }

          if (![(IDSRegistrationController *)self _performCorrectServerRequestForTemporaryPhoneRegistration:v6 sentAuthentication:(char *)&v87 + 1 sentIDSAction:&v87])
          {
            uint64_t v24 = 11;
LABEL_55:
            [(IDSRegistrationController *)self _notifyRegistrationFailure:v6 error:v24 info:0];
            goto LABEL_22;
          }
LABEL_79:
          v82 = [v6 authenticationToken];
          if ([v6 registrationType] != 1) {
            goto LABEL_102;
          }
          v58 = [v6 authenticationCert];
          if (!v58) {
            goto LABEL_102;
          }
          v59 = [v6 regionID];
          if ([v59 length])
          {
            v60 = [v6 regionBasePhoneNumber];
            BOOL v61 = [v60 length] == 0;

            if (!v61) {
              goto LABEL_102;
            }
          }
          else
          {
          }
          v62 = +[IMRGLog registration];
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCDynamicStoreContext buf = 138412290;
            unint64_t v92 = (unint64_t)v6;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "This registration is missing region information, despite being already authenticated, let's fix that: %@", buf, 0xCu);
          }

          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          v63 = self->_trackedRegistrations;
          id v64 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v83 objects:v90 count:16];
          if (v64)
          {
            uint64_t v65 = *(void *)v84;
            do
            {
              for (i = 0; i != v64; i = (char *)i + 1)
              {
                if (*(void *)v84 != v65) {
                  objc_enumerationMutation(v63);
                }
                id v67 = *(id *)(*((void *)&v83 + 1) + 8 * i);
                if (v67 != v6
                  && [*(id *)(*((void *)&v83 + 1) + 8 * i) registrationType] == 1)
                {
                  v68 = [v67 regionID];
                  if (v68)
                  {
                    v69 = [v67 regionBasePhoneNumber];
                    BOOL v70 = v69 == 0;

                    if (!v70)
                    {
                      v71 = +[IMRGLog registration];
                      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)SCDynamicStoreContext buf = 138412290;
                        unint64_t v92 = (unint64_t)v67;
                        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "  => We found a good one we can pull from, let's fix ourselves using that: %@", buf, 0xCu);
                      }

                      v72 = [v67 regionID];
                      [v6 setRegionID:v72];

                      v73 = [v67 regionBasePhoneNumber];
                      [v6 setRegionBasePhoneNumber:v73];

                      [v6 saveToKeychain];
                    }
                  }
                }
              }
              id v64 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v83 objects:v90 count:16];
            }
            while (v64);
          }

LABEL_102:
          if (v82)
          {
            BOOL v74 = 1;
          }
          else
          {
            v75 = [v6 authenticationCert];
            BOOL v74 = v75 != 0;
          }
          if (v87 || !v74)
          {
            if (HIBYTE(v87)) {
              char v79 = 1;
            }
            else {
              char v79 = v74;
            }
            if ((v79 & 1) == 0)
            {
              v80 = +[IMRGLog registration];
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)SCDynamicStoreContext buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "...we didn't authenticate, and we can't ids authentcate or register. not good!", buf, 2u);
              }
            }
          }
          else
          {
            if (!v82)
            {
              v76 = [v6 authenticationCert];
              BOOL v77 = v76 == 0;

              if (v77)
              {
                v81 = +[IMRGLog registration];
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)SCDynamicStoreContext buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "We were told that we're done authentication here, but we have no token... bailing register", buf, 2u);
                }

                [(IDSRegistrationController *)self _notifyRegistrationFailure:v6 error:11 info:0];
                goto LABEL_124;
              }
            }
            v78 = +[IMRGLog registration];
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)SCDynamicStoreContext buf = 138412290;
              unint64_t v92 = (unint64_t)v6;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "...trying to IDS Auth or Register: %@", buf, 0xCu);
            }

            if (!sub_10007216C(v6))
            {
LABEL_124:
              BOOL v20 = 0;
              goto LABEL_125;
            }
          }
          [(IDSRegistrationController *)self _notifyRegistrationStarting:v6];
          [(IDSRegistrationController *)self startTrackingActiveRegistration:v6];
          BOOL v20 = 1;
LABEL_125:

          goto LABEL_23;
        }
        v34 = +[IMRGLog registration];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)SCDynamicStoreContext buf = 138412290;
          unint64_t v92 = (unint64_t)v6;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Request to register apple ID based info: %@", buf, 0xCu);
        }

        v35 = [v6 authenticationToken];
        v36 = [v6 profileID];
        if ([v36 length])
        {
          if (v35)
          {

            v37 = [v6 authenticationCert];
            BOOL v38 = v37 == 0;

            if (v38)
            {
              v57 = +[IMRGLog registration];
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)SCDynamicStoreContext buf = 138412290;
                unint64_t v92 = (unint64_t)v6;
                _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Sending IDS authentication for registration with existing auth token: %@", buf, 0xCu);
              }

              LOBYTE(v87) = [(IDSRegistrationController *)self _sendIDSAuthenticationForRegistration:v6];
              goto LABEL_78;
            }
            v39 = [v6 authenticationCert];
            BOOL v40 = v39 == 0;

            if (!v40)
            {
              v41 = +[IMRGLog registration];
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)SCDynamicStoreContext buf = 138412290;
                unint64_t v92 = (unint64_t)v6;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Sending IDS authentication for registration with existing auth token/cert: %@", buf, 0xCu);
              }

              if ([(IDSRegistrationController *)self _sendIDSAuthenticationOrRegistrationIfNeeded:v6])
              {
                LOBYTE(v87) = 1;
LABEL_78:

                goto LABEL_79;
              }
              v51 = +[IMRGLog registration];
              if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
LABEL_77:

                [(IDSRegistrationController *)self _ensureProfileQueriesAreReadyForRegistratration:v6];
                goto LABEL_78;
              }
              *(_DWORD *)SCDynamicStoreContext buf = 138412290;
              unint64_t v92 = (unint64_t)v6;
              v52 = "Ensuring validation checks for: %@";
LABEL_76:
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 0xCu);
              goto LABEL_77;
            }
LABEL_63:
            v48 = [v6 authenticationCert];
            if (!v48) {
              goto LABEL_78;
            }
            v49 = [v6 regionID];
            BOOL v50 = [v49 length] == 0;

            if (v50) {
              goto LABEL_78;
            }
            v51 = +[IMRGLog registration];
            if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_77;
            }
            *(_DWORD *)SCDynamicStoreContext buf = 138412290;
            unint64_t v92 = (unint64_t)v6;
            v52 = "Registration looks correct, ensuring validation checks: %@";
            goto LABEL_76;
          }
          v46 = [v6 authenticationCert];
          BOOL v47 = v46 == 0;

          if (!v47) {
            goto LABEL_63;
          }
        }
        else
        {
        }
        v43 = +[IMRGLog registration];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)SCDynamicStoreContext buf = 138412290;
          unint64_t v92 = (unint64_t)v6;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Sending authentication for registration for new auth token and auth cert: %@", buf, 0xCu);
        }

        v44 = +[IDSAppleIDRegistrationCenter sharedInstance];
        [v44 authenticateRegistration:v6 requireSilentAuth:v4];

        HIBYTE(v87) = 1;
        goto LABEL_78;
      }
      __int16 v25 = +[IMRGLog registration];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)SCDynamicStoreContext buf = 138412290;
        unint64_t v92 = (unint64_t)v6;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Request to register sms identified info: %@", buf, 0xCu);
      }

      __int16 v26 = [v6 authenticationToken];
      if (!v26)
      {
        __int16 v27 = [v6 migrationContext];
        BOOL v28 = v27 == 0;

        if (v28) {
          goto LABEL_39;
        }
        __int16 v29 = +[IMRGLog registration];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)SCDynamicStoreContext buf = 138412290;
          unint64_t v92 = (unint64_t)v6;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "We can try to migrate this guy: %@", buf, 0xCu);
        }

        __int16 v30 = [v6 migrationContext];
        CFStringRef v31 = [v30 objectForKey:@"signature"];
        __int16 v26 = [v31 _FTStringFromBaseData];

        [v6 setAuthenticationToken:v26];
      }

LABEL_39:
      v32 = [v6 mainID];
      if ([v32 length])
      {
        v33 = [v6 authenticationToken];
        if (v33)
        {

LABEL_68:
          v55 = [v6 authenticationToken];
          BOOL v56 = v55 == 0;

          if (!v56 && (uint64_t)[v6 registrationStatus] <= 5) {
            [v6 setRegistrationStatus:6];
          }
          goto LABEL_79;
        }
        v53 = [v6 authenticationCert];
        BOOL v54 = v53 == 0;

        if (!v54) {
          goto LABEL_68;
        }
      }
      else
      {
      }
      [v6 setRegistrationStatus:4];
      v45 = +[IDSSMSRegistrationCenter sharedInstance];
      [v45 sendRegistration:v6];

      HIBYTE(v87) = 1;
      goto LABEL_79;
    }
    unsigned __int8 v15 = +[IMRGLog registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      unint64_t v92 = (unint64_t)v6;
      CFStringRef v16 = "Unsupported registration on this system: %@";
      unsigned __int8 v17 = v15;
      uint32_t v18 = 12;
      goto LABEL_19;
    }
  }
  else
  {
    unsigned __int8 v15 = +[IMRGLog registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      CFStringRef v16 = "Cannot register, unsupported";
      unsigned __int8 v17 = v15;
      uint32_t v18 = 2;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    }
  }
  uint64_t v19 = 1;
LABEL_21:

  [(IDSRegistrationController *)self _notifyRegistrationFailure:v6 error:v19 info:0];
LABEL_22:
  BOOL v20 = 0;
LABEL_23:
  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v20;
}

- (BOOL)unregisterInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = IMGetEnvironmentName();
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    unint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Request to unregister: %@  (Environment: %@)", (uint8_t *)&v10, 0x16u);
  }
  id v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing registration info from keychain", (uint8_t *)&v10, 2u);
  }

  [v4 removeFromKeychain];
  [v4 setRegistrationStatus:0];
  [v4 setRunningSimpleAuthentication:0];
  [v4 setRegistrationCert:0];
  [(IDSRegistrationController *)self stopTrackingActiveRegistration:v4];
  id v8 = +[IDSRegistrationCenter sharedInstance];
  [v8 sendDeregistration:v4];

  [(IDSRegistrationController *)self _notifyDeregistrationStarting:v4];
  return 1;
}

- (void)cancelActionsForRegistrationInfo:(id)a3
{
  id v6 = a3;
  id v3 = +[IDSRegistrationCenter sharedInstance];
  [v3 cancelActionsForRegistrationInfo:v6];

  id v4 = +[IDSAppleIDRegistrationCenter sharedInstance];
  [v4 cancelActionsForRegistrationInfo:v6];

  id v5 = +[IDSSMSRegistrationCenter sharedInstance];
  [v5 cancelActionsForRegistrationInfo:v6];

  [v6 setRunningSimpleAuthentication:0];
}

- (void)reportSpamWithMessages:(id)a3 toURI:(id)a4 registration:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[IDSRegistrationCenter sharedInstance];
  [v10 reportSpamWithMessages:v9 selfURI:v8 registration:v7];
}

- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8 registration:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a4;
  id v19 = a3;
  id v20 = +[IDSRegistrationCenter sharedInstance];
  [v20 reportiMessageUnknownSender:v19 messageID:v18 isBlackholed:v12 isJunked:v11 messageServerTimestamp:v17 selfURI:v16 registration:v15];
}

- (void)reportMessage:(id)a3 toURI:(id)a4 registration:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];
  uint64_t v11 = kIDSGeneralReportingTypeKey;
  BOOL v12 = [v9 objectForKey:kIDSGeneralReportingTypeKey];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v13 = [v12 unsignedIntegerValue];
  [v10 removeObjectForKey:v11];
  if (v13 == (id)1)
  {
    uint64_t v15 = kIDSGeneralSpamReportRecipientURIKey;
    id v16 = [v10 objectForKey:kIDSGeneralSpamReportRecipientURIKey];

    if (v16) {
      [v10 removeObjectForKey:v15];
    }
    SCDynamicStoreRef v14 = +[IDSRegistrationCenter sharedInstance];
    [v14 reportUnknownSenderMessage:v10 selfURI:v7 registration:v8];
    goto LABEL_5;
  }
  if (!v13)
  {
LABEL_4:
    SCDynamicStoreRef v14 = +[IDSRegistrationCenter sharedInstance];
    [v14 reportSpamMessage:v10 selfURI:v7 registration:v8];
LABEL_5:

    goto LABEL_6;
  }
  id v17 = +[IMRGLog registration];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    id v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Invalid reporting type provided, we shouldn't be here... { reportingType: %lu }", (uint8_t *)&v18, 0xCu);
  }

LABEL_6:
}

- (void)reportClientEvent:(id)a3 registration:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[IDSRegistrationCenter sharedInstance];
  [v10 reportClientEvent:v9 registration:v8 completion:v7];
}

- (BOOL)_performCorrectServerRequestForTemporaryPhoneRegistration:(id)a3 sentAuthentication:(BOOL *)a4 sentIDSAction:(BOOL *)a5
{
  id v8 = a3;
  if (CUTIsInternalInstall() && _os_feature_enabled_impl())
  {
    id v9 = +[IDSDaemon sharedInstance];
    id v10 = [v9 registrationConductor];
    uint64_t v11 = [v10 userStore];

    BOOL v12 = [v8 userUniqueIdentifier];
    id v13 = [v11 userWithUniqueIdentifier:v12];

    SCDynamicStoreRef v14 = [v11 credentialForUser:v13];
    uint64_t v15 = v14;
    if (v14 && [v14 realm] == (id)2)
    {
      id v16 = [v15 phoneAuthenticationCertificate];
      id v17 = [v16 dataRepresentation];
      [v8 setAuthenticationCert:v17];

      int64_t v18 = +[IMUserDefaults homeNumberSecondsUntilExpiration];
      uint64_t v19 = 3888000;
      if (v18) {
        uint64_t v19 = v18;
      }
      id v20 = +[NSDate dateWithTimeIntervalSinceNow:(double)v19];
      unsigned __int8 v21 = [v13 temporaryPhoneUserWithUpdatedExpirationDate:v20];
      [v11 updateUser:v21];
    }
    int v22 = 1;
  }
  else
  {
    int v22 = 0;
  }
  CFStringRef v23 = [v8 authenticationCert];

  if (v23)
  {
    int v24 = 1;
    unsigned int v25 = 1;
  }
  else
  {
    uint64_t v26 = [v8 authenticationToken];
    if (v26
      && (__int16 v27 = (void *)v26,
          [v8 profileID],
          BOOL v28 = objc_claimAutoreleasedReturnValue(),
          id v29 = [v28 length],
          v28,
          v27,
          v29))
    {
      int v24 = 0;
      unsigned int v25 = [v8 needsRenewal] ^ 1;
    }
    else
    {
      unsigned int v25 = 0;
      int v24 = 1;
    }
  }
  __int16 v30 = [v8 email];
  id v31 = [v30 length];

  if (((v22 | v25) & 1) != 0 || !v31)
  {
    if (v23) {
      int v35 = 1;
    }
    else {
      int v35 = v22;
    }
    if ((v35 | v24))
    {
      if (v23)
      {
        v36 = +[IDSRegistrationCenter sharedInstance];
        [v36 sendRegistration:v8];

        BOOL v34 = 1;
        if (a5) {
          *a5 = 1;
        }
      }
      else
      {
        BOOL v38 = +[IMRGLog registration];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_10070BDEC((uint64_t)v8, v38);
        }

        BOOL v34 = 0;
      }
    }
    else
    {
      BOOL v37 = [(IDSRegistrationController *)self _sendIDSAuthenticationForRegistration:v8];
      if (a5) {
        *a5 = v37;
      }
      BOOL v34 = 1;
    }
  }
  else
  {
    v32 = +[IMRGLog registration];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 138412290;
      id v41 = v8;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Sending authentication for registration for new auth token and auth cert: %@", (uint8_t *)&v40, 0xCu);
    }

    v33 = +[IDSAppleIDRegistrationCenter sharedInstance];
    BOOL v34 = 1;
    [v33 authenticateRegistration:v8 forceNewToken:1 requireSilentAuth:1];

    [v8 setNeedsRenewal:0];
    [v8 saveToKeychain];
    if (a4) {
      *a4 = 1;
    }
  }

  return v34;
}

- (void)_notifyNeedsNewRegistration
{
  id v3 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 registrationControllerNeedsNewRegistration:self];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyRegistrationUpdated:(id)a3
{
  id v4 = a3;
  if ([v4 isDisabled])
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ignoring registration updated, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    id v6 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v6;
    id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        long long v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
          if (objc_opt_respondsToSelector()) {
            [v10 registrationController:self registrationUpdated:v4];
          }
          long long v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)_notifyRegistrationStarting:(id)a3
{
  id v4 = a3;
  if ([v4 isDisabled])
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ignoring registration starting, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    id v6 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v6;
    id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        long long v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
          if (objc_opt_respondsToSelector()) {
            [v10 registrationController:self registrationWillStart:v4];
          }
          long long v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)_notifyRegistrationFailure:(id)a3 error:(int64_t)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  CFStringRef v23 = _os_activity_create((void *)&_mh_execute_header, "Registration controller notify registration failure", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v23, &state);
  if ([v8 isDisabled])
  {
    long long v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ignoring registration failure, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    [v8 setRegistrationStatus:-1];
    if ([v8 registrationType] == 1)
    {
      long long v11 = +[IMRGLog registration];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)SCDynamicStoreContext buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing registration info from keychain", buf, 2u);
      }

      [v8 removeFromKeychain];
    }
    id v12 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v19;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v16);
          if (objc_opt_respondsToSelector()) {
            [v17 registrationController:self registrationFailed:v8 error:a4 info:v9];
          }
          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v14);
    }

    [(IDSRegistrationController *)self _submitRegistrationCompletedMetricWithRegistration:v8 success:0 registrationError:a4];
    [(IDSRegistrationController *)self _captureDiagnosticsForFailedRegistration:v8 registrationError:a4];
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_notifyRegistrationSuccess:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  long long v18 = _os_activity_create((void *)&_mh_execute_header, "Registration controller notify registration success", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v18, &state);
  if ([v4 isDisabled])
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ignoring registration success, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    id v6 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        long long v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
          if (objc_opt_respondsToSelector()) {
            [v11 registrationController:self registrationSucceeded:v4];
          }
          long long v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v8);
    }

    if (![v4 registrationType])
    {
      id v12 = +[IDSSMSRegistrationCenter sharedInstance];
      [v12 notePhoneNumberRegistrationReset];
    }
    [(IDSRegistrationController *)self _submitRegistrationCompletedMetricWithRegistration:v4 success:1 registrationError:-1];
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_notifyAllRegistrationSuccess:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v10 isDisabled])
        {
          long long v11 = +[IMRGLog registration];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCDynamicStoreContext buf = 138412290;
            BOOL v28 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ignoring succeeded registration, registration is disabled: %@", buf, 0xCu);
          }

          [v5 removeObject:v10];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
    }
    while (v7);
  }

  id v12 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
        if (objc_opt_respondsToSelector()) {
          [v17 registrationController:self allRegistrationsSucceeded:v5];
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
}

- (void)_notifyDeregistrationStarting:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 registrationController:self deregistrationWillStart:v4];
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_submitRegistrationCompletedMetricWithRegistration:(id)a3 success:(BOOL)a4 registrationError:(int64_t)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  if (-[IDSRegistrationController _shouldSubmitRegistrationCompletedMetricForRegistration:](self, "_shouldSubmitRegistrationCompletedMetricForRegistration:"))
  {
    id v8 = objc_alloc((Class)IDSRegistrationCompletedMetric);
    id v9 = [v15 registrationType];
    long long v10 = [v15 serviceIdentifier];
    id v11 = [v8 initWithRegistrationType:v9 serviceIdentifier:v10 wasSuccessful:v6 registrationError:a5];

    long long v12 = +[IDSAWDLogger logger];
    [v12 logMetric:v11];

    long long v13 = +[IDSRTCLogger loggerWithCategory:4000];
    [v13 logMetric:v11];

    long long v14 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v14 logMetric:v11];
  }
}

- (BOOL)_shouldSubmitRegistrationCompletedMetricForRegistration:(id)a3
{
  id v3 = [a3 serviceIdentifier];
  unsigned __int8 v4 = [&off_1009D2B60 containsObject:v3];

  return v4;
}

- (void)_captureDiagnosticsForFailedRegistration:(id)a3 registrationError:(int64_t)a4
{
  id v5 = a3;
  if (+[IDSAutoBugCapture isSupported])
  {
    id v6 = [v5 serviceIdentifier];
    if (![v6 isEqualToString:@"com.apple.madrid"]
      || [v5 registrationType] != 1)
    {
      goto LABEL_6;
    }

    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0x2A)
    {
      id v7 = sub_10014877C(a4);
      id v8 = [v5 serviceIdentifier];
      id v9 = _StringForIDSRegistrationType([v5 registrationType]);
      long long v10 = +[NSString stringWithFormat:@"(%@, %@, %@)", v7, v8, v9];

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100074230;
      v11[3] = &unk_100980830;
      id v12 = v10;
      id v6 = v10;
      +[IDSAutoBugCapture triggerCaptureWithEvent:200 context:v6 completion:v11];

LABEL_6:
    }
  }
}

- (void)center:(id)a3 succeededRegistration:(id)a4
{
  id v5 = a4;
  if (_IMWillLog())
  {
    +[NSString stringWithFormat:@"Succeeded HTTP registration with info: %@", v5];
    v20 = long long v19 = "-[IDSRegistrationController center:succeededRegistration:]";
    _IMAlwaysLog();
  }
  if (!objc_msgSend(v5, "isDisabled", v19, v20))
  {
    if ([v5 registrationType] == 1)
    {
      uint64_t v7 = [v5 vettedEmails];
      if (!v7) {
        goto LABEL_11;
      }
      id v8 = (void *)v7;
      if (([v5 shouldRegisterUsingDSHandle] & 1) == 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      id v9 = [v5 dsHandle];
      id v10 = [v9 length];

      if (!v10)
      {
LABEL_11:
        id v11 = +[IMRGLog registration];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)SCDynamicStoreContext buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "** Empty vetted emails, we should make sure to query them", buf, 2u);
        }

        id v8 = +[IDSRegistrationCenter sharedInstance];
        [v8 queryValidatedEmailsForRegistration:v5 allowPasswordPrompt:0 completionBlock:0];
        goto LABEL_24;
      }
    }
    else if ([v5 registrationType] == 2)
    {
      id v12 = [(IDSRegistrationController *)self userStore];
      long long v13 = [v5 userUniqueIdentifier];
      id v8 = [v12 userWithUniqueIdentifier:v13];

      if (([v8 finishedRegistration] & 1) == 0)
      {
        long long v14 = [(IDSRegistrationController *)self _phoneUserWithCredentials];
        id v15 = [v8 temporaryPhoneUserWithFinishedRegistration];
        long long v16 = [(IDSRegistrationController *)self userStore];
        [v16 updateUser:v15];

        id v17 = [(IDSRegistrationController *)self userStore];
        [v17 persistUsersImmediately];

        unsigned __int8 v18 = [(IDSRegistrationController *)self displayingAddNumberPrompt];
        if (v14)
        {
          if ((v18 & 1) == 0 && ([v8 hasNotifiedSuccess] & 1) == 0) {
            [(IDSRegistrationController *)self _notifyHomeNumberSuccessForUser:v15];
          }
        }
        else if ((v18 & 1) == 0 && ([v8 hasNotifiedSuccess] & 1) == 0)
        {
          id v21 = v5;
          im_dispatch_after_primary_queue();
        }
      }
      goto LABEL_24;
    }
LABEL_25:
    [(IDSRegistrationController *)self _notifyRegistrationSuccess:v5];
    goto LABEL_26;
  }
  id v6 = +[IMRGLog registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)SCDynamicStoreContext buf = 138412290;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring succeeded registration, registration is disabled: %@", buf, 0xCu);
  }

LABEL_26:
}

- (void)center:(id)a3 failedRegistration:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 1024;
    int v15 = a5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed HTTP registration with info: %@       error: %d", (uint8_t *)&v12, 0x12u);
  }

  [(IDSRegistrationController *)self _notifyRegistrationFailure:v9 error:a5 info:v10];
}

- (void)center:(id)a3 allSucceededRegistrations:(id)a4
{
  id v7 = a4;
  if (_IMWillLog())
  {
    +[NSString stringWithFormat:@"All succeeded HTTP registrations: %@", v7];
    id v6 = v5 = "-[IDSRegistrationController center:allSucceededRegistrations:]";
    _IMAlwaysLog();
  }
  -[IDSRegistrationController _notifyAllRegistrationSuccess:](self, "_notifyAllRegistrationSuccess:", v7, v5, v6);
}

- (void)center:(id)a3 succeededIdentification:(id)a4 phoneNumber:(id)a5 token:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  if (_IMWillLog())
  {
    +[NSString stringWithFormat:@"Succeeded SMS identification with info: %@", v8];
    __int16 v14 = v13 = "-[IDSRegistrationController center:succeededIdentification:phoneNumber:token:]";
    _IMAlwaysLog();
  }
  if (objc_msgSend(v8, "isDisabled", v13, v14))
  {
    id v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ignoring need for new identification, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    sub_10007216C(v8);
    if (![v8 registrationType])
    {
      id v11 = [(IDSRegistrationController *)self _provisionedTemporaryUser];
      if ([v9 length]
        && v11
        && ![(IDSRegistrationController *)self displayingAddNumberPrompt])
      {
        int v12 = [v8 userUniqueIdentifier];
        [(IDSRegistrationController *)self _alertForHomeNumberIfNeededForSIMIdentifier:v12 withPhoneNumber:v9];
      }
    }
  }
}

- (void)center:(id)a3 failedIdentification:(id)a4 error:(int64_t)a5
{
  id v7 = a4;
  if (_IMWillLog())
  {
    +[NSString stringWithFormat:@"Failed SMS identification with info: %@ error: %d", v7, a5];
    id v10 = v9 = "-[IDSRegistrationController center:failedIdentification:error:]";
    _IMAlwaysLog();
  }
  if (objc_msgSend(v7, "isDisabled", v9, v10))
  {
    id v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring failed identification, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    [(IDSRegistrationController *)self _notifyRegistrationFailure:v7 error:a5 info:0];
  }
}

- (void)centerNeedsNewIdentification:(id)a3
{
  unsigned __int8 v4 = +[IMRGLog registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SMS agent requested new identification", v5, 2u);
  }

  [(IDSRegistrationController *)self _notifyNeedsNewRegistration];
}

- (void)center:(id)a3 succeededIDSAuthentication:(id)a4
{
  id v5 = a4;
  if (_IMWillLog())
  {
    +[NSString stringWithFormat:@"Succeeded IDS Authentication with info: %@", v5];
    v12 = id v11 = "-[IDSRegistrationController center:succeededIDSAuthentication:]";
    _IMAlwaysLog();
  }
  if (objc_msgSend(v5, "isDisabled", v11, v12))
  {
    id v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring succeeded IDS Authentication, registration is disabled: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  [(IDSRegistrationController *)self _ensureProfileQueriesAreReadyForRegistratration:v5];
  [(IDSRegistrationController *)self _sendIDSAuthenticationOrRegistrationIfNeeded:v5];
  if (![v5 registrationType])
  {
    id v6 = +[IDSRegistrationCenter sharedInstance];
    [v6 sendRegistration:v5];
LABEL_12:

    goto LABEL_13;
  }
  if ([v5 registrationType] == 2)
  {
    id v7 = [(IDSRegistrationController *)self _phoneUserWithCredentials];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 uniqueIdentifier];
      id v10 = [v8 phoneNumber];
      [(IDSRegistrationController *)self _alertForHomeNumberIfNeededForSIMIdentifier:v9 withPhoneNumber:v10];
    }
  }
LABEL_13:
}

- (void)center:(id)a3 failedIDSAuthentication:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)SCDynamicStoreContext buf = 138412802;
    *(void *)BOOL v50 = v9;
    *(_WORD *)&v50[8] = 1024;
    *(_DWORD *)&v50[10] = a5;
    __int16 v51 = 2112;
    id v52 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed IDS Authentication with info: %@ error: %d info: %@", buf, 0x1Cu);
  }

  if ([v9 isDisabled])
  {
    id v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      *(void *)BOOL v50 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring failed IDS Authentication, registration is disabled: %@", buf, 0xCu);
    }
    goto LABEL_52;
  }
  if ((unint64_t)(a5 - 10) >= 2)
  {
    if (a5 != 37)
    {
      if (a5 == 18)
      {
        id v13 = +[IMRGLog registration];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)SCDynamicStoreContext buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "IDS Authentication failed - Login failed", buf, 2u);
        }

        if (![v9 registrationType])
        {
          v33 = +[IMRGLog registration];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)SCDynamicStoreContext buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "  This was an SMS reg", buf, 2u);
          }

          BOOL v34 = +[IDSRegistrationReasonTracker sharedInstance];
          int v35 = [v9 userUniqueIdentifier];
          [v34 setPNRReason:6 forUserUniqueIdentifier:v35];

          id v12 = +[IDSSMSRegistrationCenter sharedInstance];
          [v12 sendRegistration:v9];
          goto LABEL_52;
        }
        if ([v9 registrationType] == 1)
        {
          id v14 = +[IMRGLog registration];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)SCDynamicStoreContext buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "This was an apple ID reg", buf, 2u);
          }

          if ((int)[v9 retries] <= 2)
          {
            [v9 setAuthenticationToken:0];
            objc_msgSend(v9, "setRetries:", objc_msgSend(v9, "retries") + 1);
            int v15 = +[IMRGLog registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v16 = [v9 retries];
              *(_DWORD *)SCDynamicStoreContext buf = 67109120;
              *(_DWORD *)BOOL v50 = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Let's re-auth, retry %d", buf, 8u);
            }

            [v9 setRegistrationStatus:3];
            id v12 = +[IDSAppleIDRegistrationCenter sharedInstance];
            [v12 authenticateRegistration:v9 forceNewToken:1];
            goto LABEL_52;
          }
          BOOL v38 = +[IMRGLog registration];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)SCDynamicStoreContext buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Too many retries, failing", buf, 2u);
          }

          [v9 setRetries:0];
        }
      }
LABEL_54:
      [(IDSRegistrationController *)self _notifyRegistrationFailure:v9 error:a5 info:0];
      goto LABEL_55;
    }
    goto LABEL_46;
  }
  if (![v9 registrationType])
  {
    __int16 v30 = +[IDSRegistrationReasonTracker sharedInstance];
    id v31 = [v9 userUniqueIdentifier];
    [v30 setPNRReason:6 forUserUniqueIdentifier:v31];

    v32 = +[IDSSMSRegistrationCenter sharedInstance];
    [v32 sendRegistration:v9];

    char v29 = 1;
    goto LABEL_47;
  }
  if ([v9 registrationType] != 1)
  {
LABEL_46:
    char v29 = 0;
    goto LABEL_47;
  }
  id v17 = +[IMRGLog registration];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v18 = [v9 retries];
    *(_DWORD *)SCDynamicStoreContext buf = 67109120;
    *(_DWORD *)BOOL v50 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed, retry %d", buf, 8u);
  }

  if ((int)[v9 retries] > 2)
  {
    [v9 setRetries:0];
    goto LABEL_46;
  }
  objc_msgSend(v9, "setRetries:", objc_msgSend(v9, "retries") + 1);
  if (![v9 registrationType]) {
    [v9 setMainID:0];
  }
  long long v19 = [v9 confirmedEmails];
  [v9 setUris:0];
  unsigned int v20 = [v9 registrationType];
  if (a5 == 10 && v20 == 1)
  {
    id v41 = self;
    int64_t v42 = 10;
    id v43 = v10;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    int v40 = v19;
    id v21 = v19;
    id v22 = [v21 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v45;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v45 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          __int16 v27 = +[IMRGLog registration];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCDynamicStoreContext buf = 138412290;
            *(void *)BOOL v50 = v26;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, " => Added confirmed emails: %@", buf, 0xCu);
          }

          [v9 addCandidateEmail:v26];
        }
        id v23 = [v21 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v23);
    }

    a5 = v42;
    id v10 = v43;
    long long v19 = v40;
    self = v41;
  }
  BOOL v28 = objc_msgSend(v9, "authenticationToken", v40, v41, v42, v43);

  if (v28)
  {
    if ((uint64_t)[v9 registrationStatus] < 6)
    {
      char v29 = 0;
    }
    else
    {
      sub_10007216C(v9);
      char v29 = 1;
    }
  }
  else
  {
    [v9 setRegistrationStatus:3];
    v39 = +[IDSAppleIDRegistrationCenter sharedInstance];
    char v29 = 1;
    [v39 authenticateRegistration:v9 forceNewToken:1];
  }
LABEL_47:
  if ([v9 registrationType] != 2) {
    goto LABEL_53;
  }
  v36 = +[IMRGLog registration];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v37 = [v9 retries];
    *(_DWORD *)SCDynamicStoreContext buf = 67109378;
    *(_DWORD *)BOOL v50 = v37;
    *(_WORD *)&v50[4] = 2112;
    *(void *)&v50[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Home Number provision request had expired auth token, renewing {  retries: %d, registration: %@ }", buf, 0x12u);
  }

  if ((int)[v9 retries] > 2)
  {
LABEL_53:
    if (v29) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  objc_msgSend(v9, "setRetries:", objc_msgSend(v9, "retries") + 1);
  [v9 setRegistrationStatus:3];
  id v12 = +[IDSAppleIDRegistrationCenter sharedInstance];
  [v12 authenticateRegistration:v9 forceRenewal:1 requireSilentAuth:1];
LABEL_52:

LABEL_55:
}

- (BOOL)_sendIDSAuthenticationOrRegistrationIfNeeded:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 registrationType];
  if (v4)
  {
    id v5 = [v3 vettedEmails];

    if (!v5)
    {
      id v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)SCDynamicStoreContext buf = 138412290;
        id v24 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "We still have no vetted email response for: %@   waiting....", buf, 0xCu);
      }
    }
    id v7 = [v3 regionID];

    if (!v7)
    {
      id v12 = +[IMRGLog registration];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:

        goto LABEL_27;
      }
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v24 = v3;
      id v13 = "We still have no default profile response for: %@   waiting....";
      id v14 = v12;
      uint32_t v15 = 12;
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      goto LABEL_26;
    }
    if (!v5)
    {
LABEL_27:
      unsigned __int8 v9 = 0;
      goto LABEL_28;
    }
  }
  if ((uint64_t)[v3 registrationStatus] <= 5)
  {
    [v3 setRegistrationStatus:6];
    unsigned int v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    unsigned int v20 = sub_1000758A4;
    id v21 = &unk_10097E440;
    id v22 = v3;
    im_dispatch_after_primary_queue();
  }
  if (v4 || ([v3 runningSimpleAuthentication] & 1) == 0)
  {
    id v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "We already have a region ID, skipping query", buf, 2u);
    }

    id v11 = [v3 authenticationToken];
    if (v11)
    {

LABEL_22:
      unsigned __int8 v9 = sub_10007216C(v3);
      goto LABEL_28;
    }
    unsigned int v16 = [v3 authenticationCert];

    if (v16) {
      goto LABEL_22;
    }
    id v12 = +[IMRGLog registration];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_WORD *)SCDynamicStoreContext buf = 0;
    id v13 = "We were told that we're done authentication here, but we have no token... not doing anything";
    id v14 = v12;
    uint32_t v15 = 2;
    goto LABEL_25;
  }
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)SCDynamicStoreContext buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "This was just a simple auth, we're done here", buf, 2u);
  }

  unsigned __int8 v9 = 1;
LABEL_28:

  return v9;
}

- (void)center:(id)a3 succeededCurrentEmailsRequest:(id)a4 emailInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (_IMWillLog())
  {
    +[NSString stringWithFormat:@"Succeeded Validated Email Query info: %@    Emails: %@", v7, v8];
    id v14 = v13 = "-[IDSRegistrationController center:succeededCurrentEmailsRequest:emailInfo:]";
    _IMAlwaysLog();
  }
  if (objc_msgSend(v7, "isDisabled", v13, v14))
  {
    unsigned __int8 v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring succeeded current emails request, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    id v10 = [v7 vettedEmails];

    if (!v10)
    {
      id v11 = +[NSArray array];
      [v7 setVettedEmails:v11];
    }
    if ((uint64_t)[v7 registrationStatus] < 8
      || ([v7 authenticationCert],
          id v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          !v12))
    {
      [(IDSRegistrationController *)self _sendIDSAuthenticationOrRegistrationIfNeeded:v7];
    }
  }
}

- (void)center:(id)a3 failedCurrentEmailsRequest:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = a4;
  id v7 = a6;
  if (_IMWillLog())
  {
    id v8 = +[NSString stringWithFormat:@"Failed Validated Email Query info: %@  Info: %@", v9, v7];
    _IMAlwaysLog();
  }
}

- (void)_ensureProfileQueriesAreReadyForRegistratration:(id)a3
{
  id v4 = a3;
  if ([v4 registrationType] == 1)
  {
    id v5 = [v4 vettedEmails];

    if (!v5)
    {
      id v6 = [v4 authenticationCert];

      id v7 = +[IMRGLog registration];
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          LOWORD(v15) = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, " * Empty vetted emails, sending off handles gathering", (uint8_t *)&v15, 2u);
        }

        id v9 = +[IDSRegistrationCenter sharedInstance];
        [v9 queryValidatedEmailsForRegistration:v4 allowPasswordPrompt:1 completionBlock:0];
      }
      else
      {
        if (v8)
        {
          LOWORD(v15) = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, " **** missing auth cert, can't send vetted email request", (uint8_t *)&v15, 2u);
        }

        [(IDSRegistrationController *)self _sendIDSAuthenticationForRegistration:v4];
      }
    }
  }
  if ([v4 registrationType] == 1
    && ([v4 regionID],
        id v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v10 length],
        v10,
        !v11))
  {
    id v14 = +[IMRGLog registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Empty region ID, querying initial region", (uint8_t *)&v15, 2u);
    }

    id v12 = +[IDSAppleIDRegistrationCenter sharedInstance];
    [v12 queryInitialInvitationContextForRegistration:v4];
  }
  else
  {
    id v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v4 regionID];
      int v15 = 138412290;
      id v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Non empty region ID: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (BOOL)_sendIDSAuthenticationForRegistration:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ((uint64_t)[v3 registrationStatus] >= 6)
    {
      id v5 = +[IDSRegistrationCenter sharedInstance];
      [v5 buildValidationCredentialsIfNeeded];
    }
    if ([v4 registrationType] == 2
      && ([v4 authenticationCert], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
    {
      id v7 = +[IMRGLog registration];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not reprovisioning temporary phone because we already have an auth cert for %@", (uint8_t *)&v11, 0xCu);
      }
      unsigned __int8 v8 = 0;
    }
    else
    {
      id v9 = +[IMRGLog registration];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registration Controller - sending IDS authentication: %@", (uint8_t *)&v11, 0xCu);
      }

      id v7 = +[IDSRegistrationCenter sharedInstance];
      unsigned __int8 v8 = [v7 authenticateRegistration:v4];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)center:(id)a3 succeededInitialRegionQuery:(id)a4
{
  id v5 = a4;
  if (_IMWillLog())
  {
    +[NSString stringWithFormat:@"Succeeded Initial Region Query info: %@", v5];
    v9 = unsigned __int8 v8 = "-[IDSRegistrationController center:succeededInitialRegionQuery:]";
    _IMAlwaysLog();
  }
  if (objc_msgSend(v5, "isDisabled", v8, v9))
  {
    id v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring succeeded initial region query, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = [v5 regionID];

    if (!v7) {
      [v5 setRegionID:&stru_10099BE78];
    }
    if ((uint64_t)[v5 registrationStatus] <= 7) {
      [(IDSRegistrationController *)self _sendIDSAuthenticationOrRegistrationIfNeeded:v5];
    }
  }
}

- (void)center:(id)a3 succeededAuthentication:(id)a4
{
  id v5 = a4;
  id v6 = +[IMRGLog registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registration Controller - succeeded authentication: %@", (uint8_t *)&v8, 0xCu);
  }

  if ([v5 isDisabled])
  {
    id v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ignoring succeeded authentication, registration is disabled: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    [(IDSRegistrationController *)self _sendIDSAuthenticationForRegistration:v5];
  }
}

- (void)center:(id)a3 succeededRegionValidation:(id)a4 regionID:(id)a5 phoneNumber:(id)a6 extraContext:(id)a7 verified:(BOOL)a8
{
  BOOL v8 = a8;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[IMRGLog registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    int v19 = 138413314;
    id v20 = v12;
    __int16 v21 = 2112;
    if (v8) {
      CFStringRef v17 = @"YES";
    }
    id v22 = v13;
    __int16 v23 = 2112;
    id v24 = v14;
    __int16 v25 = 2112;
    id v26 = v15;
    __int16 v27 = 2112;
    CFStringRef v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Registration Controller - succeeded region validation - registration info: %@   regionID: %@  phoneNumber: %@  extraContext: %@  verified: %@", (uint8_t *)&v19, 0x34u);
  }

  if ([v12 isDisabled])
  {
    unsigned int v18 = +[IMRGLog registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Ignoring succeeded region validation, registration is disabled: %@", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)center:(id)a3 failedAuthentication:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if (_IMWillLog())
  {
    +[NSString stringWithFormat:@"registration info: %@   error: %d  info: %@", v9, a5, v10];
    v17 = id v16 = "-[IDSRegistrationController center:failedAuthentication:error:info:]";
    _IMAlwaysLog();
  }
  if (objc_msgSend(v9, "isDisabled", v16, v17))
  {
    id v11 = +[IMRGLog registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v19 = v9;
      id v12 = "Ignoring failed authentication, registration is disabled: %@";
      id v13 = v11;
      uint32_t v14 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (+[IDSRegistrationController isBuddyBlockingRegistration])
  {
    id v11 = +[IMRGLog registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      id v12 = "System not setup, ignoring auth failure and not proceeding";
      id v13 = v11;
      uint32_t v14 = 2;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (a5 == 18
    && ([v9 runningSimpleAuthentication] & 1) == 0
    && [v9 registrationType] == 1)
  {
    if ((int)[v9 retries] <= 3)
    {
      objc_msgSend(v9, "setRetries:", objc_msgSend(v9, "retries") + 1);
      [v9 setRegistrationCert:0];
      [v9 setUris:0];
      [v9 setRegistrationStatus:3];
      id v11 = +[IDSAppleIDRegistrationCenter sharedInstance];
      [v11 authenticateRegistration:v9 forceNewToken:1];
      goto LABEL_10;
    }
    [v9 setRetries:0];
  }
  id v15 = +[IMRGLog registration];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)SCDynamicStoreContext buf = 138412290;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Authentication failed. Notifying, and unregistering %@", buf, 0xCu);
  }

  [(IDSRegistrationController *)self _notifyRegistrationFailure:v9 error:a5 info:v10];
  if ((uint64_t)[v9 registrationStatus] >= 7) {
    [(IDSRegistrationController *)self unregisterInfo:v9];
  }
LABEL_11:
}

- (void)center:(id)a3 succeededLinkHandlesConfirmation:(id)a4 emailAddress:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if (_IMWillLog())
  {
    +[NSString stringWithFormat:@"succeeded email confirmation: %@", v7];
    id v10 = v9 = "-[IDSRegistrationController center:succeededLinkHandlesConfirmation:emailAddress:]";
    _IMAlwaysLog();
  }
  if (objc_msgSend(v6, "isDisabled", v9, v10))
  {
    BOOL v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring succeeded link handles confirmation, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    sub_10007216C(v6);
  }
}

- (void)addListener:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      id v5 = +[NSMutableArray nonRetainingArray];
      id v6 = self->_handlers;
      self->_handlers = v5;

      handlers = self->_handlers;
    }
    [(NSMutableArray *)handlers addObject:v7];
  }
}

- (void)removeListener:(id)a3
{
  [(NSMutableArray *)self->_handlers removeObjectIdenticalTo:a3];
  if (![(NSMutableArray *)self->_handlers count])
  {
    handlers = self->_handlers;
    self->_handlers = 0;
  }
}

- (void)_updateNotifyState
{
  if (_IDSRunningInDaemon())
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v33 = self;
    obj = self->_trackedRegistrations;
    id v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v38;
      uint64_t v34 = kIDSServiceDefaultsSentinelAlias;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "serviceType", v33);
          if ([v11 registrationType] != 1) {
            goto LABEL_11;
          }
          id v13 = [v11 uris];
          uint64_t v36 = v7;
          uint64_t v14 = v8;
          uint64_t v15 = v6;
          id v16 = v4;
          uint64_t v17 = v5;
          uint64_t v18 = v9;
          id v19 = [v13 count];

          BOOL v20 = v19 == (id)1;
          uint64_t v9 = v18;
          uint64_t v5 = v17;
          id v4 = v16;
          uint64_t v6 = v15;
          uint64_t v8 = v14;
          uint64_t v7 = v36;
          if (!v20
            || ([v11 uris],
                __int16 v21 = objc_claimAutoreleasedReturnValue(),
                [v21 objectAtIndex:0],
                id v22 = objc_claimAutoreleasedReturnValue(),
                v21,
                id v23 = [v22 caseInsensitiveCompare:v34],
                v22,
                v23))
          {
LABEL_11:
            uint64_t v6 = IDSIsFaceTimeRegistrationServiceType() | v6;
            uint64_t v7 = IDSIsiMessageRegistrationServiceType() | v7;
            uint64_t v5 = IDSIsCallingRegistrationServiceType() | v5;
            uint64_t v8 = IDSIsScreenSharingRegistrationServiceType() | v8;
          }
        }
        id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v4);
    }
    else
    {
      LOBYTE(v5) = 0;
      LOBYTE(v6) = 0;
      LOBYTE(v7) = 0;
      LOBYTE(v8) = 0;
    }

    id v24 = +[IMRGLog registration];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v25 = @"NO";
      if (v5) {
        CFStringRef v26 = @"YES";
      }
      else {
        CFStringRef v26 = @"NO";
      }
      if (v6) {
        CFStringRef v27 = @"YES";
      }
      else {
        CFStringRef v27 = @"NO";
      }
      *(_DWORD *)SCDynamicStoreContext buf = 138413058;
      CFStringRef v42 = v26;
      if (v7) {
        CFStringRef v28 = @"YES";
      }
      else {
        CFStringRef v28 = @"NO";
      }
      __int16 v43 = 2112;
      CFStringRef v44 = v27;
      __int16 v45 = 2112;
      CFStringRef v46 = v28;
      if (v8) {
        CFStringRef v25 = @"YES";
      }
      __int16 v47 = 2112;
      CFStringRef v48 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Calculated states for _updateNotifyState {foundCalling: %@, foundFaceTime: %@, foundiMessage:%@, foundScreenSharing: %@}", buf, 0x2Au);
    }

    notify_set_state(v33->_iMessageToken, v7 & 1);
    char v29 = (const char *)IMUserScopedNotification();
    notify_post(v29);
    notify_set_state(v33->_screenSharingToken, v8 & 1);
    __int16 v30 = (const char *)IMUserScopedNotification();
    notify_post(v30);
    notify_set_state(v33->_faceTimeToken, v6 & 1);
    id v31 = (const char *)IMUserScopedNotification();
    notify_post(v31);
    notify_set_state(v33->_callingToken, v5 & 1);
    v32 = (const char *)IMUserScopedNotification();
    notify_post(v32);
  }
}

- (void)startTrackingRegistration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding registration to list of tracked registrations: %@", (uint8_t *)&v11, 0xCu);
  }

  if (v4)
  {
    if ([(NSMutableArray *)self->_trackedRegistrations containsObject:v4])
    {
      [(NSMutableArray *)self->_trackedRegistrations removeObject:v4];
    }
    else
    {
      uint64_t v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "  => Adding registration: %@", (uint8_t *)&v11, 0xCu);
      }

      uint64_t v7 = +[IDSHeartbeatCenter sharedInstance];
      [v7 updateHeartbeat];
    }
    trackedRegistrations = self->_trackedRegistrations;
    if (!trackedRegistrations)
    {
      uint64_t v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      id v10 = self->_trackedRegistrations;
      self->_trackedRegistrations = v9;

      trackedRegistrations = self->_trackedRegistrations;
    }
    [(NSMutableArray *)trackedRegistrations addObject:v4];
    [(IDSRegistrationController *)self _updateNotifyState];
  }
}

- (void)stopTrackingRegistration:(id)a3
{
  id v4 = a3;
  if (v4 && [(NSMutableArray *)self->_trackedRegistrations containsObject:v4])
  {
    uint64_t v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing registration from list of tracked registrations: %@", (uint8_t *)&v8, 0xCu);
    }

    [(NSMutableArray *)self->_trackedRegistrations removeObject:v4];
    if (![(NSMutableArray *)self->_trackedRegistrations count])
    {
      trackedRegistrations = self->_trackedRegistrations;
      self->_trackedRegistrations = 0;
    }
    [(IDSRegistrationController *)self _updateNotifyState];
    uint64_t v7 = +[IDSHeartbeatCenter sharedInstance];
    [v7 updateHeartbeat];
  }
}

- (void)startTrackingActiveRegistration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding registration to list of active registrations: %@", (uint8_t *)&v10, 0xCu);
  }

  if (v4)
  {
    if ([(NSMutableArray *)self->_activeRegistrations containsObject:v4])
    {
      [(NSMutableArray *)self->_activeRegistrations removeObject:v4];
    }
    else
    {
      uint64_t v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "  => Adding registration: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    activeRegistrations = self->_activeRegistrations;
    if (!activeRegistrations)
    {
      int v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      id v9 = self->_activeRegistrations;
      self->_activeRegistrations = v8;

      activeRegistrations = self->_activeRegistrations;
    }
    [(NSMutableArray *)activeRegistrations addObject:v4];
  }
}

- (void)stopTrackingActiveRegistration:(id)a3
{
  id v4 = a3;
  if (v4
    && [(NSMutableArray *)self->_activeRegistrations containsObjectIdenticalTo:v4])
  {
    uint64_t v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing registration from list of active registrations: %@", (uint8_t *)&v7, 0xCu);
    }

    [(NSMutableArray *)self->_activeRegistrations removeObjectIdenticalTo:v4];
    if (![(NSMutableArray *)self->_activeRegistrations count])
    {
      activeRegistrations = self->_activeRegistrations;
      self->_activeRegistrations = 0;
    }
  }
}

- (id)activeRegistrationsMatchingUserID:(id)a3
{
  id v4 = objc_msgSend(a3, "_im_normalizedURIString");
  uint64_t v5 = [(IDSRegistrationController *)self activeRegistrations];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007716C;
  v9[3] = &unk_100980858;
  id v10 = v4;
  id v6 = v4;
  int v7 = objc_msgSend(v5, "__imArrayByApplyingBlock:", v9);

  return v7;
}

- (id)activeRegistrationsOfType:(int)a3
{
  id v4 = [(IDSRegistrationController *)self activeRegistrations];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100077298;
  v7[3] = &unk_100980878;
  int v8 = a3;
  uint64_t v5 = objc_msgSend(v4, "__imArrayByApplyingBlock:", v7);

  return v5;
}

- (NSArray)activeRegistrationsToRegister
{
  id v2 = [(IDSRegistrationController *)self activeRegistrations];
  id v3 = objc_msgSend(v2, "__imArrayByApplyingBlock:", &stru_100980898);

  return (NSArray *)v3;
}

- (void)_systemConfigurationPrefsChanged
{
  id v3 = +[FTDeviceSupport sharedInstance];
  id v4 = [v3 deviceName];

  if (self->_deviceName != v4)
  {
    uint64_t v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      deviceName = self->_deviceName;
      *(_DWORD *)SCDynamicStoreContext buf = 138412546;
      id v31 = deviceName;
      __int16 v32 = 2112;
      v33 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device name changed from %@ to %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&self->_deviceName, v4);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [(NSMutableArray *)self->_trackedRegistrations _copyForEnumerating];
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v27;
    *(void *)&long long v9 = 138412802;
    long long v25 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "deviceName", v25);
        unsigned __int8 v15 = [v14 isEqualToString:v4];

        if ((v15 & 1) == 0)
        {
          id v16 = +[IMRGLog registration];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = [v13 deviceName];
            *(_DWORD *)SCDynamicStoreContext buf = v25;
            id v31 = v17;
            __int16 v32 = 2112;
            v33 = v4;
            __int16 v34 = 2112;
            int v35 = v13;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Device name was updated from %@ to %@  (Registration: %@)", buf, 0x20u);
          }
          uint64_t v18 = +[IMSystemMonitor sharedInstance];
          unsigned int v19 = [v18 isUnderFirstDataProtectionLock];

          BOOL v20 = +[IMRGLog registration];
          BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          if (v19)
          {
            if (v21)
            {
              *(_WORD *)SCDynamicStoreContext buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "  => Deferring registration for device name change, we're locked", buf, 2u);
            }

            deferredRegisters = self->_deferredRegisters;
            if (!deferredRegisters)
            {
              id v23 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
              id v24 = self->_deferredRegisters;
              self->_deferredRegisters = v23;

              deferredRegisters = self->_deferredRegisters;
            }
            [(NSMutableSet *)deferredRegisters addObject:v13];
          }
          else
          {
            if (v21)
            {
              *(_WORD *)SCDynamicStoreContext buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "  => Sending registration for device name change", buf, 2u);
            }

            [(IDSRegistrationController *)self registerInfo:v13];
          }
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v10);
  }
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  id v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(NSMutableSet *)self->_deferredRegisters count];
    *(_DWORD *)SCDynamicStoreContext buf = 67109120;
    LODWORD(v21) = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "First unlock, checking deferred registrations: %d", buf, 8u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(NSMutableSet *)self->_deferredRegisters allObjects];
  id v6 = [v5 _copyForEnumerating];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v17;
    *(void *)&long long v8 = 138412290;
    long long v15 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v11);
        id v13 = +[IMRGLog registration];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)SCDynamicStoreContext buf = v15;
          uint64_t v21 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "  => Sending deferred registration: %@", buf, 0xCu);
        }

        [(IDSRegistrationController *)self registerInfo:v12];
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v9);
  }

  deferredRegisters = self->_deferredRegisters;
  self->_deferredRegisters = 0;
}

- (void)_postHomeNumberNotificationBeforeAlertForIdentifier:(id)a3 forcefully:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = [(IDSRegistrationController *)self _phoneUserWithCredentials];
  long long v8 = [(IDSRegistrationController *)self userStore];
  id v9 = [v8 userWithUniqueIdentifier:v6];

  if (v7) {
    unsigned __int8 v10 = 1;
  }
  else {
    unsigned __int8 v10 = [(IDSRegistrationController *)self displayingAddNumberPrompt];
  }
  if ([v9 finishedRegistration]) {
    unsigned __int8 v11 = [v9 hasNotifiedSuccess];
  }
  else {
    unsigned __int8 v11 = 1;
  }
  unsigned int v12 = [(IDSRegistrationController *)self _pnrOngoing];
  id v13 = +[IMRGLog registration];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [(IDSRegistrationController *)self displayingAddNumberPrompt];
    CFStringRef v15 = @"NO";
    *(_DWORD *)SCDynamicStoreContext buf = 138413314;
    if (v14) {
      CFStringRef v16 = @"YES";
    }
    else {
      CFStringRef v16 = @"NO";
    }
    CFStringRef v20 = v16;
    __int16 v21 = 2112;
    if (v4) {
      CFStringRef v17 = @"YES";
    }
    else {
      CFStringRef v17 = @"NO";
    }
    CFStringRef v22 = v17;
    __int16 v23 = 2112;
    if (v12) {
      CFStringRef v15 = @"YES";
    }
    CFStringRef v24 = v15;
    __int16 v25 = 2112;
    long long v26 = v7;
    __int16 v27 = 2112;
    long long v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting to post Home Number notification before alert { displayingAddNumberPrompt: %@, bypassOngoingPNR: %@, ongoingPNR: %@, phoneUser: %@, tempUser: %@ }", buf, 0x34u);
  }

  if ((v10 | v11) & 1) != 0 || (v12 & ~v4)
  {
    if (((v10 | v11) & 1) == 0)
    {
      id v18 = v6;
      im_dispatch_after_primary_queue();
    }
  }
  else
  {
    [(IDSRegistrationController *)self _notifyHomeNumberSuccessForUser:v9];
  }
}

- (BOOL)_pnrOngoing
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = +[IDSSMSRegistrationCenter sharedInstance];
  id v3 = [v2 validators];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= ((unint64_t)[*(id *)(*((void *)&v10 + 1) + 8 * i) status] & 0xFFFFFFFFFFFFFFFELL) == 2;
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (id)_provisionedTemporaryUser
{
  id v2 = [(IDSRegistrationController *)self userStore];
  [v2 usersWithRealm:2];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "hasBeenProvisioned", (void)v9))
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_phoneUserWithCredentials
{
  id v2 = [(IDSRegistrationController *)self userStore];
  [v2 usersWithRealm:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        long long v8 = objc_msgSend(v2, "credentialForUser:", v7, (void)v10);

        if (v8)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_notifyHomeNumberSuccessForUser:(id)a3
{
  id v4 = a3;
  +[IDSTemporaryPhoneAlertManager presentSuccessAlertForUser:v4];
  id v6 = [v4 temporaryPhoneUserWithNotifiedSuccess];

  uint64_t v5 = [(IDSRegistrationController *)self userStore];
  [v5 updateUser:v6];
}

- (void)_alertForHomeNumberIfNeededForSIMIdentifier:(id)a3 withPhoneNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length]
    && ![(IDSRegistrationController *)self displayingAddNumberPrompt])
  {
    long long v8 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v9 = IMLocalizedStringFromTableInBundle();
    long long v10 = +[IDSTemporaryPhoneAlertManager serviceString];
    long long v11 = IMLocalizedStringFromTableInBundle();
    long long v12 = IMFormattedNumberForUnformattedNumber();
    long long v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12, v10);

    unsigned int v14 = IMLocalizedStringFromTableInBundle();
    CFStringRef v15 = IMLocalizedStringFromTableInBundle();
    CFStringRef v16 = +[IMRGLog registration];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Displaying should add phone number alert", buf, 2u);
    }

    CFStringRef v17 = +[IMUserNotification userNotificationWithIdentifier:@"HomeNumberAdd" title:v9 message:v13 defaultButton:v14 alternateButton:0 otherButton:v15];
    if (v17)
    {
      [(IDSRegistrationController *)self setDisplayingAddNumberPrompt:1];
      +[IMUserNotificationCenter sharedInstance];
      __int16 v23 = v15;
      id v18 = v14;
      long long v19 = v13;
      CFStringRef v20 = v10;
      v22 = __int16 v21 = v9;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100078228;
      v24[3] = &unk_1009808C0;
      id v25 = v6;
      long long v26 = self;
      [v22 addUserNotification:v17 listener:0 completionHandler:v24];

      long long v9 = v21;
      long long v10 = v20;
      long long v13 = v19;
      unsigned int v14 = v18;
      CFStringRef v15 = v23;
    }
  }
}

- (int64_t)simDeactivationInfoRateLimitCount
{
  id v2 = +[IDSServerBag sharedInstance];
  id v3 = [v2 objectForKey:@"sim-deactivation-rate-limit-count"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v4 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v4 = 5;
  }

  return v4;
}

- (double)simDeactivationInfoRateLimitInterval
{
  id v2 = +[IDSServerBag sharedInstance];
  id v3 = [v2 objectForKey:@"sim-deactivation-rate-limit-time"];

  double v4 = 86400.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      double v4 = v5;
    }
  }

  return v4;
}

- (void)SIM:(id)a3 didDeactivateWithInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(IDSRegistrationController *)self simDeactivationRequestRateLimiter];

  if (!v8)
  {
    id v9 = objc_alloc((Class)IDSRateLimiter);
    int64_t v10 = [(IDSRegistrationController *)self simDeactivationInfoRateLimitCount];
    [(IDSRegistrationController *)self simDeactivationInfoRateLimitInterval];
    id v11 = objc_msgSend(v9, "initWithLimit:timeLimit:", v10);
    [(IDSRegistrationController *)self setSimDeactivationRequestRateLimiter:v11];
  }
  uint64_t v12 = [v6 SIMIdentifier];
  long long v13 = (void *)v12;
  unsigned int v14 = @"SIM";
  if (v12) {
    unsigned int v14 = (__CFString *)v12;
  }
  CFStringRef v15 = v14;

  CFStringRef v16 = [(IDSRegistrationController *)self simDeactivationRequestRateLimiter];
  unsigned int v17 = [v16 underLimitForItem:v15];

  id v18 = +[IMRGLog registration];
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      CFStringRef v20 = [v6 SIMIdentifier];
      int v23 = 138412290;
      CFStringRef v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending SIM deactivation request for label ID %@", (uint8_t *)&v23, 0xCu);
    }
    __int16 v21 = [(IDSRegistrationController *)self simDeactivationRequestRateLimiter];
    [v21 noteItem:v15];

    id v18 = +[IDSRegistrationCenter sharedInstance];
    [v18 sendDeactivationRequestWithSIM:v6 Info:v7];
  }
  else if (v19)
  {
    CFStringRef v22 = [(IDSRegistrationController *)self simDeactivationRequestRateLimiter];
    int v23 = 138412290;
    CFStringRef v24 = v22;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Too many SIM deactivation events. Not sending request %@", (uint8_t *)&v23, 0xCu);
  }
}

- (void)noteiCloudSignInTime
{
  id v2 = +[IDSRegistrationKeyManager sharedInstance];
  [v2 noteiCloudSignInTime];
}

- (void)noteManateeAvailabilityTime
{
  id v2 = +[IDSRegistrationKeyManager sharedInstance];
  [v2 noteManateeAvailableTime];
}

- (NSArray)trackedRegistrations
{
  return &self->_trackedRegistrations->super;
}

- (NSArray)activeRegistrations
{
  return &self->_activeRegistrations->super;
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void)setKeychainWrapper:(id)a3
{
}

- (void)setUserStore:(id)a3
{
}

- (BOOL)displayingAddNumberPrompt
{
  return self->_displayingAddNumberPrompt;
}

- (void)setDisplayingAddNumberPrompt:(BOOL)a3
{
  self->_displayingAddNumberPrompt = a3;
}

- (IDSRateLimiter)simDeactivationRequestRateLimiter
{
  return self->_simDeactivationRequestRateLimiter;
}

- (void)setSimDeactivationRequestRateLimiter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simDeactivationRequestRateLimiter, 0);
  objc_storeStrong((id *)&self->_userStore, 0);
  objc_storeStrong((id *)&self->_keychainWrapper, 0);
  objc_storeStrong((id *)&self->_deferredRegisters, 0);
  objc_storeStrong((id *)&self->_trackedRegistrations, 0);
  objc_storeStrong((id *)&self->_activeRegistrations, 0);
  objc_storeStrong((id *)&self->_handlers, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end