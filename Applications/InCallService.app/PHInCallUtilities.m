@interface PHInCallUtilities
+ (__CFPhoneNumber)newPhoneNumberRefForDestinationID:(id)a3 useNetworkCountryCode:(BOOL)a4;
+ (id)formattedPhoneNumberFromString:(id)a3;
+ (id)sharedInstance;
+ (id)wifiSettingsURL;
+ (void)performBlockWithSharedInstanceOverride:(id)a3 block:(id)a4;
+ (void)setSharedInstanceOverride:(id)a3;
+ (void)unsetSharedInstanceOverride;
- (BOOL)canSendText;
- (BOOL)faceTimeAudioIsAvailable;
- (BOOL)faceTimeAudioIsSupported;
- (BOOL)faceTimeVideoIsAvailable;
- (BOOL)faceTimeVideoIsSupported;
- (BOOL)hasStatusBarSuppressionReasons;
- (BOOL)isIPadIdiom;
- (BOOL)isInLostMode;
- (BOOL)isLockScreenMessagingAllowed;
- (BOOL)isLockToEndCallEnabled;
- (BOOL)isSMSRestricted;
- (BOOL)isSetupAssistantRunning;
- (BOOL)requestedVCPresentationWithStatusBar;
- (NSMutableSet)inCallStatusBarSuppressionReasons;
- (PHInCallUtilities)init;
- (void)dealloc;
- (void)requestPasscodeUnlockWithCompletion:(id)a3;
- (void)setInCallStatusBarSuppressionReasons:(id)a3;
- (void)setRequestedVCPresentationWithStatusBar:(BOOL)a3 withReasonLog:(id)a4;
- (void)startAllowingRingingCallStatusIndicator;
- (void)startSuppressingInCallStatusBarForReason:(id)a3;
- (void)stopAllowingRingingCallStatusIndicator;
- (void)stopSuppressingInCallStatusBar;
- (void)stopSuppressingInCallStatusBarForReason:(id)a3;
- (void)updateInCallStatusBarSuppression;
@end

@implementation PHInCallUtilities

+ (id)sharedInstance
{
  if (qword_100325E38 != -1) {
    dispatch_once(&qword_100325E38, &stru_1002CE270);
  }
  if (qword_100325E30) {
    v2 = (void *)qword_100325E30;
  }
  else {
    v2 = (void *)qword_100325E28;
  }

  return v2;
}

+ (void)setSharedInstanceOverride:(id)a3
{
}

+ (void)unsetSharedInstanceOverride
{
}

+ (void)performBlockWithSharedInstanceOverride:(id)a3 block:(id)a4
{
  v6 = (void (**)(void))a4;
  [a1 setSharedInstanceOverride:a3];
  if (v6) {
    v6[2]();
  }
  [a1 unsetSharedInstanceOverride];
}

+ (__CFPhoneNumber)newPhoneNumberRefForDestinationID:(id)a3 useNetworkCountryCode:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 destinationIdIsPhoneNumber])
  {
    if (v4 && (TUNetworkCountryCode(), (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (void *)v6;
      v8 = TUNetworkCountryCode();
    }
    else
    {
      v8 = TUHomeCountryCode();
    }
    v9 = 0;
    if (v5 && v8) {
      v9 = (__CFPhoneNumber *)CFPhoneNumberCreate();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)formattedPhoneNumberFromString:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[PHInCallUtilities newPhoneNumberRefForDestinationID:v3 useNetworkCountryCode:1];
  String = v3;
  if (v4)
  {
    uint64_t v6 = v4;
    String = (void *)CFPhoneNumberCreateString();

    CFRelease(v6);
  }

  return String;
}

+ (id)wifiSettingsURL
{
  return +[NSURL URLWithString:@"prefs:root=WIFI"];
}

- (PHInCallUtilities)init
{
  v11.receiver = self;
  v11.super_class = (Class)PHInCallUtilities;
  v2 = [(PHInCallUtilities *)&v11 init];
  if (v2)
  {
    id v3 = +[NSMutableSet set];
    [(PHInCallUtilities *)v2 setInCallStatusBarSuppressionReasons:v3];

    [(PHInCallUtilities *)v2 updateInCallStatusBarSuppression];
    BOOL v4 = +[FTCServiceAvailabilityCenter sharedInstance];
    [v4 addListenerID:@"com.apple.InCallService.FTCServiceAvailabilityListenerID" forService:2];

    id v5 = +[FTCServiceAvailabilityCenter sharedInstance];
    [v5 addListenerID:@"com.apple.InCallService.FTCServiceAvailabilityListenerID" forService:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100046124, @"com.apple.mobilephone.LockScreenMessagingChanged", 0, CFNotificationSuspensionBehaviorDrop);
    if (!qword_100325E40)
    {
      v7 = (void **)CUTWeakLinkSymbol();
      if (v7) {
        v8 = *v7;
      }
      else {
        v8 = 0;
      }
      objc_storeStrong((id *)&qword_100325E40, v8);
    }
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v2, (CFNotificationCallback)sub_100046194, (CFStringRef)qword_100325E40, 0, CFNotificationSuspensionBehaviorDrop);
  }
  return v2;
}

- (void)dealloc
{
  id v3 = +[FTCServiceAvailabilityCenter sharedInstance];
  [v3 removeListenerID:@"com.apple.InCallService.FTCServiceAvailabilityListenerID" forService:2];

  BOOL v4 = +[FTCServiceAvailabilityCenter sharedInstance];
  [v4 removeListenerID:@"com.apple.InCallService.FTCServiceAvailabilityListenerID" forService:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)PHInCallUtilities;
  [(PHInCallUtilities *)&v7 dealloc];
}

- (void)startSuppressingInCallStatusBarForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(PHInCallUtilities *)self inCallStatusBarSuppressionReasons];
  unsigned __int8 v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    objc_super v7 = [(PHInCallUtilities *)self inCallStatusBarSuppressionReasons];
    [v7 addObject:v4];

    v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(PHInCallUtilities *)self inCallStatusBarSuppressionReasons];
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "added reason: %@, reasons: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  [(PHInCallUtilities *)self updateInCallStatusBarSuppression];
}

- (void)stopSuppressingInCallStatusBarForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(PHInCallUtilities *)self inCallStatusBarSuppressionReasons];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    objc_super v7 = [(PHInCallUtilities *)self inCallStatusBarSuppressionReasons];
    [v7 removeObject:v4];

    v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(PHInCallUtilities *)self inCallStatusBarSuppressionReasons];
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "removed reason: %@, reasons: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  [(PHInCallUtilities *)self updateInCallStatusBarSuppression];
}

- (void)stopSuppressingInCallStatusBar
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PHInCallUtilities *)self inCallStatusBarSuppressionReasons];
    int v6 = 138412290;
    objc_super v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "removing all status bar suppression reasons: %@", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(PHInCallUtilities *)self inCallStatusBarSuppressionReasons];
  [v5 removeAllObjects];

  [(PHInCallUtilities *)self updateInCallStatusBarSuppression];
}

- (void)startAllowingRingingCallStatusIndicator
{
  id v2 = +[TUCallCenter sharedInstance];
  [v2 shouldAllowRingingCallStatusIndicator:1];
}

- (void)stopAllowingRingingCallStatusIndicator
{
  id v2 = +[TUCallCenter sharedInstance];
  [v2 shouldAllowRingingCallStatusIndicator:0];
}

- (BOOL)hasStatusBarSuppressionReasons
{
  id v2 = [(PHInCallUtilities *)self inCallStatusBarSuppressionReasons];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)updateInCallStatusBarSuppression
{
  BOOL v2 = [(PHInCallUtilities *)self hasStatusBarSuppressionReasons];
  if (dword_10031EAC0 != v2)
  {
    BOOL v3 = v2;
    id v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v5 = @"NO";
      if (v3) {
        CFStringRef v5 = @"YES";
      }
      int v7 = 138412290;
      CFStringRef v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting PIP presence token to %@", (uint8_t *)&v7, 0xCu);
    }

    int v6 = +[TUCallCenter sharedInstance];
    [v6 shouldSuppressInCallStatusBar:v3];

    dword_10031EAC0 = v3;
  }
}

- (void)requestPasscodeUnlockWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    if (+[PHInCallUIUtilities isSpringBoardPasscodeLocked])
    {
      CFStringRef v5 = sub_1000D5130();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting passcode", buf, 2u);
      }

      SBSRequestPasscodeUnlockAlertUI();
    }
    else if ([(PHInCallUtilities *)self isInLostMode])
    {
      int v6 = sub_1000D5130();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "In lost mode and no passcode, not displaying UI", v7, 2u);
      }

      v4[2](v4, 0);
    }
    else
    {
      v4[2](v4, 1);
    }
  }
}

- (BOOL)isInLostMode
{
  if ((byte_100325E48 & 1) == 0)
  {
    BOOL v2 = [(id)CUTWeakLinkClass() sharedInstance];
    byte_100325E49 = [v2 lostModeIsActive];

    byte_100325E48 = 1;
  }
  return byte_100325E49;
}

- (BOOL)isLockScreenMessagingAllowed
{
  if ((byte_100325E4A & 1) == 0)
  {
    BOOL v2 = (void *)TUBundleIdentifierMobilePhoneApplication;
    CFPreferencesAppSynchronize(TUBundleIdentifierMobilePhoneApplication);
    BOOL v3 = sub_10000FA3C(@"LockScreenMessaging", v2);
    unsigned __int8 v4 = [v3 BOOLValue];
    if (v3) {
      char v5 = v4;
    }
    else {
      char v5 = 1;
    }
    byte_100325E4B = v5;
    byte_100325E4A = 1;
  }
  return byte_100325E4B;
}

- (BOOL)faceTimeVideoIsSupported
{
  BOOL v2 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v3 = [v2 faceTimeSupported];

  return v3;
}

- (BOOL)faceTimeVideoIsAvailable
{
  if (![(PHInCallUtilities *)self faceTimeVideoIsSupported]) {
    return 0;
  }
  BOOL v2 = +[FTCServiceAvailabilityCenter sharedInstance];
  BOOL v3 = [v2 availabilityForListenerID:@"com.apple.InCallService.FTCServiceAvailabilityListenerID" forService:0] == (id)1;

  return v3;
}

- (BOOL)faceTimeAudioIsSupported
{
  BOOL v2 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v3 = [v2 callingSupported];

  return v3;
}

- (BOOL)faceTimeAudioIsAvailable
{
  if (![(PHInCallUtilities *)self faceTimeAudioIsSupported]) {
    return 0;
  }
  BOOL v2 = +[FTCServiceAvailabilityCenter sharedInstance];
  BOOL v3 = [v2 availabilityForListenerID:@"com.apple.InCallService.FTCServiceAvailabilityListenerID" forService:2] == (id)1;

  return v3;
}

- (BOOL)isIPadIdiom
{
  BOOL v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

- (BOOL)isSetupAssistantRunning
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046BC8;
  block[3] = &unk_1002CD518;
  block[4] = self;
  if (qword_100325E50 != -1) {
    dispatch_once(&qword_100325E50, block);
  }
  return byte_100325E58;
}

- (BOOL)canSendText
{
  return +[MFMessageComposeViewController canSendText];
}

- (BOOL)isSMSRestricted
{
  id v2 = TUBundleIdentifierMessagesApplication;
  id v9 = 0;
  id v3 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v2 allowPlaceholder:0 error:&v9];
  id v4 = v9;
  char v5 = v4;
  if (v3)
  {
    int v6 = [v3 applicationState];
    unsigned __int8 v7 = [v6 isRestricted];
  }
  else
  {
    if (!v4)
    {
      unsigned __int8 v7 = 0;
      goto LABEL_8;
    }
    int v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001E995C((uint64_t)v2, (uint64_t)v5, v6);
    }
    unsigned __int8 v7 = 0;
  }

LABEL_8:
  return v7;
}

- (void)setRequestedVCPresentationWithStatusBar:(BOOL)a3 withReasonLog:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_requestedVCPresentationWithStatusBar != v4)
  {
    self->_requestedVCPresentationWithStatusBar = v4;
    unsigned __int8 v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = NSStringFromBOOL();
      int v9 = 138412546;
      int v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "set requestedPresentationWithStatusBar: %@ because: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (BOOL)isLockToEndCallEnabled
{
  if (!sub_100046F44() || !sub_100047074()) {
    return 1;
  }
  id v2 = (uint64_t (*)(void))sub_100047074();
  if (!v2) {
    sub_1001E99E4();
  }
  int v3 = v2();
  BOOL v4 = v3 != 0;
  char v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3 != 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accessibility lock to end: %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (BOOL)requestedVCPresentationWithStatusBar
{
  return self->_requestedVCPresentationWithStatusBar;
}

- (NSMutableSet)inCallStatusBarSuppressionReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInCallStatusBarSuppressionReasons:(id)a3
{
}

- (void).cxx_destruct
{
}

@end