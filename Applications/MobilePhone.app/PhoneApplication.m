@interface PhoneApplication
+ (id)sharedNumberFormatter;
- (BOOL)_activeFaceTimeCallExists;
- (BOOL)_faceTimeInvitationExists;
- (BOOL)activeFaceTimeCallExists;
- (BOOL)alwaysShowLocalVideo;
- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4;
- (BOOL)applicationSuspendWithSettings:(id)a3;
- (BOOL)audioButtonAllowsPhoneCallsAndFaceTimeAudio;
- (BOOL)badgesMissedFaceTimeAudio;
- (BOOL)badgesMissedFaceTimeVideo;
- (BOOL)badgesMissedTelephonyCalls;
- (BOOL)contentViewAnimationsFadeInsteadOfMove;
- (BOOL)contentViewCanRotate;
- (BOOL)defaultActionIsFaceTimeAudio;
- (BOOL)defaultActionIsFaceTimeVideo;
- (BOOL)dialVoicemail;
- (BOOL)dialVoicemailWithAccountID:(id)a3;
- (BOOL)faceTimeAudioIsAvailable;
- (BOOL)faceTimeInvitationExists;
- (BOOL)faceTimeVideoIsAvailable;
- (BOOL)hasEnhancedVoicemail;
- (BOOL)headerViewShowsAllRecentCalls;
- (BOOL)inCall;
- (BOOL)inFaceTime;
- (BOOL)isDeviceCapableOfFaceTimeAudio;
- (BOOL)isDeviceCapableOfFaceTimeVideo;
- (BOOL)isDeviceCapableOfTelephonyCalls;
- (BOOL)isLowGraphicsPerformanceDevice;
- (BOOL)openURL:(id)a3;
- (BOOL)resumingApplication;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (BOOL)shouldSnapshot;
- (BOOL)shouldUseCompactHorizontalLayout;
- (BOOL)showSplashScreenOnSignin;
- (BOOL)showsCallsFromService:(int)a3;
- (BOOL)showsFaceTimeAudio;
- (BOOL)showsFaceTimeAudioFavorites;
- (BOOL)showsFaceTimeAudioRecents;
- (BOOL)showsFaceTimeVideo;
- (BOOL)showsFaceTimeVideoFavorites;
- (BOOL)showsFaceTimeVideoRecents;
- (BOOL)showsPhoneDialer;
- (BOOL)showsPhoneVoicemail;
- (BOOL)showsTelephonyCalls;
- (BOOL)showsTelephonyFavorites;
- (BOOL)showsTelephonyRecents;
- (BOOL)showsThirdPartyRecents;
- (BOOL)suspendingApplication;
- (BOOL)tabBarCanSlide;
- (BOOL)tabBarFillsScreen;
- (BOOL)telephonyCallingIsAvailable;
- (BOOL)usesBlendModes;
- (BOOL)usesUnifiedInterface;
- (CGRect)phoneViewTabBarContentFrame;
- (PHRecentsController)recentsController;
- (PhoneApplication)init;
- (PhoneRootViewController)rootViewController;
- (TUFeatureFlags)featureFlags;
- (UIColor)applicationTintColor;
- (double)launchTime;
- (id)_createRecentCallWithCallerId:(id)a3;
- (id)_tableFromViewController:(id)a3;
- (id)callHistoryController;
- (id)callHistoryControllerWithCoalescingStrategy:(unint64_t)a3;
- (id)firstScrollViewInView:(id)a3;
- (id)nameOfDefaultImageToUpdateAtSuspension;
- (id)scrollTestsWithCount:(int64_t)a3 forScrollView:(id)a4;
- (id)swiftui_rootViewForSimplifiedApplicationProvider;
- (int)defaultAction;
- (int)userInterfaceScreenType;
- (int64_t)backdropStyle;
- (int64_t)headerViewNumberOfCallsToShow;
- (unint64_t)callHistoryControllerOptions;
- (unsigned)contentViewOffscreenEdge;
- (unsigned)userInterfaceStyle;
- (void)TestAddUnknownFavorite;
- (void)_localeChangedNotification:(id)a3;
- (void)_scroll;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)applicationOpenURL:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)failTestOnMainThread:(id)a3 reason:(id)a4;
- (void)finishTestOnMainThread:(id)a3;
- (void)handleApplicationFinishedSnapshottingNotification:(id)a3;
- (void)handleIDSServiceAvailabilityDidChangeNotification:(id)a3;
- (void)openURL:(id)a3 withCompletionHandler:(id)a4;
- (void)prepareForDefaultImageSnapshotForScreen:(id)a3;
- (void)runSwitchTabTestWithTabViewController:(id)a3 fromTab:(int)a4 switchTo:(int)a5 numberOfIterations:(int64_t)a6 testNameReference:(const void *)a7;
- (void)setIgnoresInteractionEvents:(BOOL)a3;
- (void)setRootViewController:(id)a3;
- (void)showInitialView;
- (void)startScrollTest;
- (void)startScrollVoicemailWithInteractionTest;
- (void)startScrollWithInteractionTest;
- (void)startSwitchTest:(int)a3;
- (void)startTestOnMainThread:(id)a3;
- (void)tabBarControllerViewDidAppear:(id)a3;
- (void)warmInCallServiceIfNecessary;
@end

@implementation PhoneApplication

- (void)tabBarControllerViewDidAppear:(id)a3
{
  v4 = [a3 object];
  unsigned int v5 = [v4 currentTabViewType];

  v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "tabBarControllerViewDidAppear with tab: %d", (uint8_t *)v7, 8u);
  }

  if (v5 == 2) {
    [(PhoneApplication *)self warmInCallServiceIfNecessary];
  }
}

+ (id)sharedNumberFormatter
{
  v2 = (void *)_sharedNumberFormatter;
  if (!_sharedNumberFormatter)
  {
    id v3 = objc_alloc_init((Class)NSNumberFormatter);
    v4 = (void *)_sharedNumberFormatter;
    _sharedNumberFormatter = (uint64_t)v3;

    v2 = (void *)_sharedNumberFormatter;
  }

  return v2;
}

- (void)applicationDidFinishLaunching:(id)a3
{
  id v12 = a3;
  if ((__HasInitialized & 1) == 0)
  {
    v4 = +[IDSServiceAvailabilityController sharedInstance];
    [v4 addListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameCalling];

    unsigned int v5 = +[IDSServiceAvailabilityController sharedInstance];
    [v5 addListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameFaceTime];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"_localeChangedNotification:" name:NSCurrentLocaleDidChangeNotification object:0];
    [v6 addObserver:self selector:"handleIDSServiceAvailabilityDidChangeNotification:" name:IDSServiceAvailabilityDidChangeNotification object:0];
    [v6 addObserver:self selector:"handleApplicationFinishedSnapshottingNotification:" name:_UIApplicationDidFinishSuspensionSnapshotNotification object:0];
    [v6 addObserver:self selector:"tabBarControllerViewDidAppear:" name:@"PHPhoneTabBarControllerViewDidAppearNotification" object:0];
    [(PhoneApplication *)self setReceivesMemoryWarnings:1];
    v7 = +[UIApplication sharedApplication];
    [v7 setDelegate:self];

    getenv("LogPhoneTransitionTimes");
    self->_launchTime = CFAbsoluteTimeGetCurrent();
    __HasInitialized = 1;
  }
  v8 = +[NSUserDefaults standardUserDefaults];
  [v8 registerDefaults:&off_10028D058];

  v9 = +[UIDevice currentDevice];
  id v10 = [v9 userInterfaceIdiom];

  if (v10 != (id)1) {
    ABAddressBookSetAutorotationEnabled();
  }
  if ([UIApp userInterfaceStyle] == 1)
  {
    v11 = +[UIColor clearColor];
    [(PhoneApplication *)self _setDefaultTopNavBarTintColor:v11];
  }
}

- (void)setIgnoresInteractionEvents:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Called setIgnoresInteractionEvents: %d", buf, 8u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PhoneApplication;
  [(PhoneApplication *)&v6 setIgnoresInteractionEvents:v3];
}

void __48__PhoneApplication_warmInCallServiceIfNecessary__block_invoke(id a1)
{
  v1 = PHDefaultLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "prewarming InCallService...", buf, 2u);
  }

  id v2 = objc_alloc_init((Class)CUTWeakLinkClass());
  uint64_t v3 = TUBundleIdentifierInCallServiceApplication;
  if ([v2 pidForApplication:TUBundleIdentifierInCallServiceApplication] == -1)
  {
    [v2 openApplication:v3 options:&__NSDictionary0__struct withResult:&__block_literal_global_96];
  }
  else
  {
    v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InCallService is already running...", v5, 2u);
    }
  }
}

- (void)warmInCallServiceIfNecessary
{
  id v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  unsigned int v4 = [v3 isEqualToString:TUBundleIdentifierMobilePhoneApplication];

  unsigned int v5 = PHDefaultLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "asking to prewarm InCallService...", buf, 2u);
    }

    unsigned int v5 = dispatch_get_global_queue(-32768, 0);
    dispatch_async(v5, &__block_literal_global_0);
  }
  else if (v6)
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "prewarming InCallService...", v7, 2u);
  }
}

- (BOOL)usesUnifiedInterface
{
  return 0;
}

- (void)showInitialView
{
}

- (void)setRootViewController:(id)a3
{
}

- (id)callHistoryController
{
  return [(PhoneApplication *)self callHistoryControllerWithCoalescingStrategy:1];
}

- (id)callHistoryControllerWithCoalescingStrategy:(unint64_t)a3
{
  unint64_t v4 = [(PhoneApplication *)self callHistoryControllerOptions];

  return +[TUCallHistoryController sharedControllerWithCoalescingStrategy:a3 options:v4];
}

- (unint64_t)callHistoryControllerOptions
{
  unint64_t v3 = [(PhoneApplication *)self showsFaceTimeAudioRecents];
  if ([(PhoneApplication *)self showsFaceTimeVideoRecents]) {
    v3 |= 2uLL;
  }
  if ([(PhoneApplication *)self showsTelephonyRecents]) {
    v3 |= 4uLL;
  }
  if ([(PhoneApplication *)self showsThirdPartyRecents]) {
    return v3 | 8;
  }
  else {
    return v3;
  }
}

- (UIColor)applicationTintColor
{
  return +[UIColor systemBlueColor];
}

- (BOOL)isDeviceCapableOfFaceTimeVideo
{
  return +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls];
}

- (BOOL)isDeviceCapableOfFaceTimeAudio
{
  return +[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls];
}

- (PhoneApplication)init
{
  v6.receiver = self;
  v6.super_class = (Class)PhoneApplication;
  id v2 = [(PhoneApplication *)&v6 init];
  if (v2)
  {
    unint64_t v3 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v3;
  }
  return v2;
}

- (BOOL)shouldSnapshot
{
  return ![UIApp alwaysShowLocalVideo]
      || ([UIApp tabBarCanSlide] & 1) == 0;
}

- (id)nameOfDefaultImageToUpdateAtSuspension
{
  if ([(PhoneApplication *)self shouldSnapshot])
  {
    unint64_t v3 = [(PhoneApplication *)self rootViewController];
    unint64_t v4 = [v3 baseViewController];

    if ([v4 shouldSnapshot])
    {
      unsigned int v5 = [(id)objc_opt_class() defaultPNGName];
    }
    else
    {
      unsigned int v5 = 0;
    }
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  id v4 = a3;
  unsigned int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "-prepareForDefaultImageShapshotForScreen:%@", (uint8_t *)&v13, 0xCu);
  }

  id v6 = +[UIScreen mainScreen];

  if (v6 == v4)
  {
    unsigned int v7 = [(PhoneApplication *)self shouldSnapshot];
    BOOL v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109120;
      LODWORD(v14) = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "-prepareForDefaultImageShapshotForScreen: is considering snapshotting for main screen, shouldSnapshot=%d", (uint8_t *)&v13, 8u);
    }

    if (v7)
    {
      v9 = [(PhoneApplication *)self rootViewController];
      id v10 = [v9 baseViewController];

      unsigned int v11 = [v10 shouldSnapshot];
      id v12 = PHDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412546;
        id v14 = v10;
        __int16 v15 = 1024;
        unsigned int v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "-prepareForDefaultImageShapshotForScreen: view controller %@ should snapshot=%d", (uint8_t *)&v13, 0x12u);
      }

      if (v11) {
        [v10 prepareForSnapshot];
      }
    }
  }
}

- (void)handleApplicationFinishedSnapshottingNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "-handleApplicationFinishedSnapshottingNotification:%@", (uint8_t *)&v6, 0xCu);
  }

  [(PhoneApplication *)self _resetCurrentViewController];
}

void __48__PhoneApplication_warmInCallServiceIfNecessary__block_invoke_93(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    unint64_t v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __48__PhoneApplication_warmInCallServiceIfNecessary__block_invoke_93_cold_1(v2, v3);
    }
  }
}

- (BOOL)applicationSuspendWithSettings:(id)a3
{
  id v4 = a3;
  if ([UIApp usesUnifiedInterface])
  {
    unsigned int v5 = @"Default";
  }
  else
  {
    int v6 = [(PhoneRootViewController *)self->_rootController baseViewController];
    unsigned int v5 = [(id)objc_opt_class() defaultPNGName];

    if (!v5)
    {
      [v4 removeObjectForKey:kUISuspendedDefaultPNGKey];
      goto LABEL_6;
    }
  }
  [v4 setObject:v5 forKey:kUISuspendedDefaultPNGKey];

LABEL_6:
  return 0;
}

- (CGRect)phoneViewTabBarContentFrame
{
  id v2 = [(PhoneRootViewController *)self->_rootController contentView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)dealloc
{
  [(PhoneApplication *)self _resetCurrentViewController];
  double v3 = +[IDSServiceAvailabilityController sharedInstance];
  [v3 removeListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameCalling];

  double v4 = +[IDSServiceAvailabilityController sharedInstance];
  [v4 removeListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameFaceTime];

  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveObserver();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  double v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)PhoneApplication;
  [(PhoneApplication *)&v7 dealloc];
}

- (double)launchTime
{
  return self->_launchTime;
}

- (void)_localeChangedNotification:(id)a3
{
  double v3 = (void *)_sharedNumberFormatter;
  _sharedNumberFormatter = 0;

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"PhoneApplicationLocaleChangedNotification" object:0];
}

- (void)handleIDSServiceAvailabilityDidChangeNotification:(id)a3
{
  unint64_t v4 = [(PhoneApplication *)self callHistoryControllerOptions];
  double v5 = [(PhoneApplication *)self callHistoryController];
  [v5 setOptions:v4];

  if ((![(PhoneApplication *)self showsTelephonyCalls]
     || ![(PhoneApplication *)self telephonyCallingIsAvailable])
    && (![(PhoneApplication *)self showsFaceTimeAudio]
     || ![(PhoneApplication *)self faceTimeAudioIsAvailable])
    && (![(PhoneApplication *)self showsFaceTimeVideo]
     || ![(PhoneApplication *)self faceTimeVideoIsAvailable]))
  {
    rootController = self->_rootController;
    [(PhoneRootViewController *)rootController showFaceTimeFirstRunViewIfNeeded];
  }
}

- (void)didReceiveMemoryWarning
{
  double v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PhoneApplication didReceiveMemoryWarning", v5, 2u);
  }

  if ([(PhoneApplication *)self isSuspended])
  {
    if (([(PhoneApplication *)self isSuspendedEventsOnly] & 1) == 0)
    {
      unint64_t v4 = (void *)_sharedNumberFormatter;
      _sharedNumberFormatter = 0;
    }
  }
}

- (BOOL)openURL:(id)a3
{
  return 1;
}

- (void)openURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = PHDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"non-nil";
    if (!v7) {
      CFStringRef v9 = @"nil";
    }
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    CFStringRef v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
  }

  v10.receiver = self;
  v10.super_class = (Class)PhoneApplication;
  [(PhoneApplication *)&v10 openURL:v6 withCompletionHandler:v7];
}

- (void)applicationOpenURL:(id)a3
{
  id v4 = a3;
  double v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "applicationOpenURL %@", buf, 0xCu);
  }

  id v6 = [v4 scheme];
  id v7 = [v6 lowercaseString];

  double v8 = [(PhoneApplication *)self rootViewController];
  CFStringRef v9 = [v8 baseViewController];

  if ([v7 isEqualToString:@"vmshow"])
  {
    objc_super v10 = [v4 voicemailMessageUUID];
    if (![(PhoneApplication *)self hasEnhancedVoicemail] && !v10)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __39__PhoneApplication_applicationOpenURL___block_invoke;
      block[3] = &unk_10027C670;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      CFStringRef v9 = 0;
    }
  }
  if (v9)
  {
    double v11 = [(PhoneApplication *)self rootViewController];
    id v12 = [v11 view];
    [v12 setAlpha:1.0];

    if (objc_opt_respondsToSelector()) {
      [v9 handleURL:v4];
    }
  }
}

id __39__PhoneApplication_applicationOpenURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dialVoicemail];
}

- (BOOL)dialVoicemail
{
  return [(PhoneApplication *)self dialVoicemailWithAccountID:0];
}

- (BOOL)dialVoicemailWithAccountID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)TUCallProviderManager);
  id v6 = objc_alloc((Class)TUDialRequest);
  id v7 = [v5 telephonyProvider];
  id v8 = [v6 initWithProvider:v7];

  [v8 setDialType:2];
  if (v4) {
    [v8 setLocalSenderIdentityAccountUUID:v4];
  }
  [v8 setOriginatingUIType:41];
  uint64_t v9 = (uint64_t)[v8 dialType];
  objc_super v10 = [v8 localSenderIdentityUUID];
  LOBYTE(v9) = PHShouldAttemptTelephonyCallWithDialTypeAndSenderIdentityUUID(v9, v10);

  if ((v9 & 1) == 0)
  {
    CFStringRef v14 = PHDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Aborting voicemail call, the device is in airplane mode", v18, 2u);
    }

    id v15 = [v8 provider];
    double v11 = +[UIAlertController networkUnavailableAlertControllerWithCallProvider:dialType:senderIdentityUUID:](UIAlertController, "networkUnavailableAlertControllerWithCallProvider:dialType:senderIdentityUUID:", v15, [v8 dialType], 0);

    if (!v11) {
      goto LABEL_16;
    }
    unsigned int v16 = [(PhoneApplication *)self rootViewController];
    [v16 presentViewController:v11 animated:1 completion:0];
    goto LABEL_15;
  }
  if (![v8 isValid])
  {
    double v11 = PHDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PhoneApplication dialVoicemailWithAccountID:]((uint64_t)v8, v11);
    }
    goto LABEL_16;
  }
  double v11 = [v8 URL];
  if (!v11)
  {
    unsigned int v16 = PHDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PhoneApplication dialVoicemailWithAccountID:]((uint64_t)v8, v16);
    }
LABEL_15:

LABEL_16:
    BOOL v13 = 0;
    goto LABEL_17;
  }
  id v12 = +[UIApplication sharedApplication];
  [v12 openURL:v11 withCompletionHandler:0];

  BOOL v13 = 1;
LABEL_17:

  return v13;
}

- (int)userInterfaceScreenType
{
  if (userInterfaceScreenType_onceToken != -1) {
    dispatch_once(&userInterfaceScreenType_onceToken, &__block_literal_global_119);
  }
  return userInterfaceScreenType_cachedUserInterfaceScreenType;
}

void __43__PhoneApplication_userInterfaceScreenType__block_invoke(id a1)
{
  v1 = +[UIDevice currentDevice];
  unint64_t v2 = (unint64_t)[v1 userInterfaceIdiom];

  if ((v2 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v3 = 1024.0;
  }
  else {
    double v3 = 480.0;
  }
  id v4 = +[UIScreen mainScreen];
  [v4 bounds];
  double v6 = v5;

  userInterfaceScreenType_cachedUserInterfaceScreenType = v6 > v3;
}

- (BOOL)faceTimeVideoIsAvailable
{
  if (![(PhoneApplication *)self isDeviceCapableOfFaceTimeVideo]) {
    return 0;
  }
  unint64_t v2 = +[IDSServiceAvailabilityController sharedInstance];
  BOOL v3 = [v2 availabilityForListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameFaceTime] == (id)1;

  return v3;
}

- (BOOL)isDeviceCapableOfTelephonyCalls
{
  return +[TUCallCapabilities supportsPrimaryCalling];
}

- (BOOL)telephonyCallingIsAvailable
{
  return [UIApp isDeviceCapableOfTelephonyCalls];
}

- (BOOL)faceTimeAudioIsAvailable
{
  if (![(PhoneApplication *)self isDeviceCapableOfFaceTimeAudio]) {
    return 0;
  }
  unint64_t v2 = +[IDSServiceAvailabilityController sharedInstance];
  BOOL v3 = [v2 availabilityForListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameCalling] == (id)1;

  return v3;
}

- (BOOL)isLowGraphicsPerformanceDevice
{
  if (isLowGraphicsPerformanceDevice_onceToken != -1) {
    dispatch_once(&isLowGraphicsPerformanceDevice_onceToken, &__block_literal_global_122);
  }
  return isLowGraphicsPerformanceDevice_graphicsQuality == 10;
}

void __50__PhoneApplication_isLowGraphicsPerformanceDevice__block_invoke(id a1)
{
  id v1 = +[UIDevice currentDevice];
  isLowGraphicsPerformanceDevice_graphicsQuality = (uint64_t)[v1 _graphicsQuality];
}

- (unsigned)userInterfaceStyle
{
  return 0;
}

- (int64_t)backdropStyle
{
  return -2;
}

- (int)defaultAction
{
  return 0;
}

- (BOOL)defaultActionIsFaceTimeAudio
{
  return [UIApp defaultAction] == 2;
}

- (BOOL)defaultActionIsFaceTimeVideo
{
  return [UIApp defaultAction] == 1;
}

- (BOOL)showsCallsFromService:(int)a3
{
  if (a3 == 2) {
    return [UIApp showsFaceTimeAudio];
  }
  if (a3 == 1) {
    return [UIApp showsTelephonyCalls];
  }
  return 0;
}

- (unsigned)contentViewOffscreenEdge
{
  return 0;
}

- (BOOL)contentViewAnimationsFadeInsteadOfMove
{
  return 0;
}

- (BOOL)shouldUseCompactHorizontalLayout
{
  return 0;
}

- (BOOL)usesBlendModes
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("usesBlendModes");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 531, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)alwaysShowLocalVideo
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("alwaysShowLocalVideo");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 532, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)contentViewCanRotate
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("contentViewCanRotate");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 533, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)tabBarFillsScreen
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("tabBarFillsScreen");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 534, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)tabBarCanSlide
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("tabBarCanSlide");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 535, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showSplashScreenOnSignin
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showSplashScreenOnSignin");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 536, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsTelephonyCalls
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showsTelephonyCalls");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 537, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsFaceTimeAudio
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showsFaceTimeAudio");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 538, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsFaceTimeVideo
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showsFaceTimeVideo");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 539, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsTelephonyFavorites
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showsTelephonyFavorites");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 540, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsFaceTimeAudioFavorites
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showsFaceTimeAudioFavorites");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 541, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsFaceTimeVideoFavorites
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showsFaceTimeVideoFavorites");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 542, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsTelephonyRecents
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showsTelephonyRecents");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 543, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsThirdPartyRecents
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showsThirdPartyRecents");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 544, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsFaceTimeAudioRecents
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showsFaceTimeAudioRecents");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 545, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsFaceTimeVideoRecents
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showsFaceTimeVideoRecents");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 546, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)badgesMissedTelephonyCalls
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("badgesMissedTelephonyCalls");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 547, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)badgesMissedFaceTimeAudio
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("badgesMissedFaceTimeAudio");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 548, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)badgesMissedFaceTimeVideo
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("badgesMissedFaceTimeVideo");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 549, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsPhoneDialer
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showsPhoneDialer");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 550, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsPhoneVoicemail
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("showsPhoneVoicemail");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 551, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)hasEnhancedVoicemail
{
  id v4 = +[NSAssertionHandler currentHandler];
  double v5 = NSStringFromSelector("hasEnhancedVoicemail");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 552, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4 = a4;
  double v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity continuity - Will continue with type = %@", (uint8_t *)&v7, 0xCu);
  }

  return 1;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)headerViewShowsAllRecentCalls
{
  return self->_headerViewShowsAllRecentCalls;
}

- (int64_t)headerViewNumberOfCallsToShow
{
  return self->_headerViewNumberOfCallsToShow;
}

- (BOOL)audioButtonAllowsPhoneCallsAndFaceTimeAudio
{
  return self->_audioButtonAllowsPhoneCallsAndFaceTimeAudio;
}

- (BOOL)suspendingApplication
{
  return self->_suspendingApplication;
}

- (BOOL)resumingApplication
{
  return self->_resumingApplication;
}

- (PHRecentsController)recentsController
{
  return self->_recentsController;
}

- (PhoneRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_cachedApplicationBadgeString, 0);

  objc_storeStrong((id *)&self->_rootController, 0);
}

- (BOOL)inCall
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v2 = +[TUCallCenter sharedInstance];
  BOOL v3 = [v2 displayedCalls];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(UIApp, "showsCallsFromService:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "service")))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (id)scrollTestsWithCount:(int64_t)a3 forScrollView:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if (a3 >= 2)
  {
    uint64_t v7 = 0;
    do
    {
      id v8 = objc_alloc((Class)RPTScrollViewTestParameters);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __64__PhoneApplication_Testing__scrollTestsWithCount_forScrollView___block_invoke;
      v14[3] = &__block_descriptor_40_e5_v8__0l;
      v14[4] = v7;
      id v9 = [v8 initWithTestName:__CurrentTestName scrollView:v5 completionHandler:v14];
      [v9 setShouldFlick:0];
      [v6 addObject:v9];

      ++v7;
    }
    while (a3 - 1 != v7);
  }
  id v10 = objc_alloc((Class)RPTScrollViewTestParameters);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __64__PhoneApplication_Testing__scrollTestsWithCount_forScrollView___block_invoke_60;
  v13[3] = &__block_descriptor_40_e5_v8__0l;
  v13[4] = a3;
  id v11 = [v10 initWithTestName:__CurrentTestName scrollView:v5 completionHandler:v13];
  [v6 addObject:v11];

  return v6;
}

void __64__PhoneApplication_Testing__scrollTestsWithCount_forScrollView___block_invoke(uint64_t a1)
{
  unint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32) + 1;
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished test %ld", (uint8_t *)&v4, 0xCu);
  }
}

void __64__PhoneApplication_Testing__scrollTestsWithCount_forScrollView___block_invoke_60(uint64_t a1)
{
  unint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished test %ld", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_scroll
{
  uint64_t v3 = [UIApp rootViewController];
  int v4 = [v3 baseViewController];

  if ([__CurrentTestName rangeOfString:@"ScrollFavorites"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v4 favoritesViewController];
  }
  if ([__CurrentTestName rangeOfString:@"ScrollRecents"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [v4 recentsTableViewController];

    uint64_t v5 = (void *)v6;
  }
  if ([__CurrentTestName rangeOfString:@"ScrollRecents"] != (id)0x7FFFFFFFFFFFFFFFLL && !v5)
  {
    uint64_t v5 = [v4 recentsViewController];
  }
  if ([__CurrentTestName rangeOfString:@"ScrollVoicemail"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v4 voicemailViewController];
    id v8 = [v7 viewControllers];
    uint64_t v9 = [v8 firstObject];

    uint64_t v5 = (void *)v9;
  }
  if (objc_opt_respondsToSelector())
  {
    id v10 = [v5 collectionView];
  }
  else
  {
    id v10 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v5 tableView];

    id v10 = v11;
  }
  if (v10
    || ([v5 view],
        id v12 = objc_claimAutoreleasedReturnValue(),
        [(PhoneApplication *)self firstScrollViewInView:v12],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v12,
        v10))
  {
    [(PhoneApplication *)self startedTest:__CurrentTestName];
    BOOL v13 = [(id)__CurrentTestOptions objectForKey:@"recapBased"];
    if ([v13 BOOLValue])
    {
      unsigned int v14 = +[RPTTestRunner isRecapAvailable];

      if (v14)
      {
        id v15 = PHDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Running recap based scroll view test", (uint8_t *)&v19, 2u);
        }

        unsigned int v16 = __CurrentTestName;
        v17 = [(PhoneApplication *)self scrollTestsWithCount:__TestIterations forScrollView:v10];
        id v18 = +[RPTGroupScrollTestParameters newWithTestName:v16 parameters:v17 completionHandler:&__block_literal_global_2];

        +[RPTTestRunner runTestWithParameters:v18];
        goto LABEL_25;
      }
    }
    else
    {
    }
    [v10 _performScrollTest:__CurrentTestName iterations:__TestIterations delta:__YDelta];
    goto LABEL_25;
  }
  id v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Could not perform the scroll test, a scroll view does not exist for view controller (%@).", (uint8_t *)&v19, 0xCu);
  }
LABEL_25:
}

void __36__PhoneApplication_Testing___scroll__block_invoke(id a1)
{
  id v1 = PHDefaultLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Finished test", v2, 2u);
  }
}

- (void)startScrollTest
{
  uint64_t v3 = [(id)__CurrentTestOptions objectForKey:@"offset"];
  __YDelta = [v3 intValue];

  int v4 = [(id)__CurrentTestOptions objectForKey:@"iterations"];
  __TestIterations = [v4 intValue];

  if ([__CurrentTestName rangeOfString:@"ScrollFavorites"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [(PhoneRootViewController *)self->_rootController baseViewController];
    [v5 switchToTab:1];
  }
  if ([__CurrentTestName rangeOfString:@"ScrollRecents"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [(PhoneRootViewController *)self->_rootController baseViewController];
    [v6 switchToTab:2];
  }
  if ([__CurrentTestName rangeOfString:@"ScrollVoicemail"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(PhoneRootViewController *)self->_rootController baseViewController];
    [v7 switchToTab:5];
  }

  [(PhoneApplication *)self performSelector:"_scroll" withObject:0 afterDelay:0.5];
}

- (void)startScrollWithInteractionTest
{
  if ([__CurrentTestName rangeOfString:@"ScrollVoicemail"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[PhoneApplication(Testing) startScrollWithInteractionTest](v3);
    }
  }
  else
  {
    [(PhoneApplication *)self startScrollVoicemailWithInteractionTest];
  }
}

- (void)startScrollVoicemailWithInteractionTest
{
  uint64_t v3 = [(PhoneApplication *)self rootViewController];
  int v4 = [v3 baseViewController];

  uint64_t v5 = [v4 voicemailViewController];
  uint64_t v6 = [v5 inboxViewController];

  [v4 switchToTab:5];
  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __68__PhoneApplication_Testing__startScrollVoicemailWithInteractionTest__block_invoke;
  v9[3] = &unk_10027C940;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);
}

void __68__PhoneApplication_Testing__startScrollVoicemailWithInteractionTest__block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) tableView];
  uint64_t v3 = [v2 indexPathsForVisibleRows];

  if ((unint64_t)[v3 count] < 2)
  {
    dispatch_time_t v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) tableView];
      *(_DWORD *)buf = 138412290;
      BOOL v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not perform the scroll test, the voicemail tableview has no visible rows (%@)", buf, 0xCu);
    }
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __68__PhoneApplication_Testing__startScrollVoicemailWithInteractionTest__block_invoke_2;
    v9[3] = &unk_10027C940;
    uint64_t v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v10 = v5;
    uint64_t v11 = v6;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v9);
    dispatch_time_t v7 = v10;
  }
}

void __68__PhoneApplication_Testing__startScrollVoicemailWithInteractionTest__block_invoke_2(uint64_t a1)
{
  unint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) tableView];
    *(_DWORD *)buf = 138412290;
    unsigned int v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Creating scroll view test parameters with view: %@", buf, 0xCu);
  }
  id v4 = objc_alloc((Class)RPTScrollViewTestParameters);
  uint64_t v5 = __CurrentTestName;
  uint64_t v6 = [*(id *)(a1 + 32) tableView];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __68__PhoneApplication_Testing__startScrollVoicemailWithInteractionTest__block_invoke_85;
  v12[3] = &unk_10027C670;
  v12[4] = *(void *)(a1 + 40);
  id v7 = [v4 initWithTestName:v5 scrollView:v6 completionHandler:v12];

  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __68__PhoneApplication_Testing__startScrollVoicemailWithInteractionTest__block_invoke_2_86;
  v10[3] = &unk_10027C670;
  id v11 = v7;
  id v9 = v7;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v10);
}

id __68__PhoneApplication_Testing__startScrollVoicemailWithInteractionTest__block_invoke_85(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName waitForCommit:1 extraResults:0];
}

id __68__PhoneApplication_Testing__startScrollVoicemailWithInteractionTest__block_invoke_2_86(uint64_t a1)
{
  return +[RPTTestRunner runTestWithParameters:*(void *)(a1 + 32)];
}

- (id)firstScrollViewInView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v4 subviews];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [(PhoneApplication *)self firstScrollViewInView:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          if (v11)
          {
            id v5 = (id)v11;
            goto LABEL_13;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v5 = 0;
LABEL_13:
  }

  return v5;
}

- (void)startSwitchTest:(int)a3
{
  if ([__CurrentTestName rangeOfString:@"Favorites"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 1;
LABEL_15:
    uint64_t v8 = 4;
    goto LABEL_16;
  }
  if ([__CurrentTestName rangeOfString:@"Recents"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "startSwitchTest - switch to recents", (uint8_t *)&v9, 2u);
    }

    uint64_t v6 = 2;
    goto LABEL_15;
  }
  if ([__CurrentTestName rangeOfString:@"Voicemail"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 5;
    goto LABEL_15;
  }
  if ([__CurrentTestName rangeOfString:@"Keypad"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 4;
    uint64_t v8 = 2;
LABEL_16:
    id v5 = [(PhoneRootViewController *)self->_rootController baseViewController];
    [(PhoneApplication *)self startedTest:__CurrentTestName];
    [(PhoneApplication *)self runSwitchTabTestWithTabViewController:v5 fromTab:v8 switchTo:v6 numberOfIterations:a3 testNameReference:&__CurrentTestName];
    goto LABEL_17;
  }
  if ([__CurrentTestName rangeOfString:@"Contacts"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 3;
    goto LABEL_15;
  }
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = __CurrentTestName;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find a valid view type for test name \"%@\"", (uint8_t *)&v9, 0xCu);
  }
LABEL_17:
}

- (id)_createRecentCallWithCallerId:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)CHRecentCall);
  id v5 = +[NSUUID UUID];
  uint64_t v6 = [v5 UUIDString];
  [v4 setUniqueId:v6];

  id v7 = +[NSDate date];
  [v4 setDate:v7];

  [v4 setMediaType:1];
  [v4 setTtyType:0];
  [v4 setServiceProvider:kCHServiceProviderTelephony];
  [v4 setDuration:1.0];
  [v4 setCallStatus:kCHCallStatusConnectedOutgoing];
  [v4 setCallerId:v3];

  [v4 setRead:1];

  return v4;
}

- (void)TestAddUnknownFavorite
{
  id v4 = dispatch_get_global_queue(0, 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __51__PhoneApplication_Testing__TestAddUnknownFavorite__block_invoke;
  v5[3] = &unk_10027CA40;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __51__PhoneApplication_Testing__TestAddUnknownFavorite__block_invoke(uint64_t a1)
{
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__1;
  v46 = __Block_byref_object_dispose__1;
  dispatch_semaphore_t v47 = dispatch_semaphore_create(0);
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  [v2 startTestOnMainThread:v3];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) baseViewController];
  id v5 = [v4 favoritesNavigationController];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__PhoneApplication_Testing__TestAddUnknownFavorite__block_invoke_106;
  block[3] = &unk_10027C940;
  id v31 = v4;
  id v40 = v31;
  id v6 = v5;
  id v41 = v6;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  id v7 = +[NSNotificationCenter defaultCenter];
  uint64_t v8 = +[NSOperationQueue mainQueue];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = __51__PhoneApplication_Testing__TestAddUnknownFavorite__block_invoke_2;
  v38[3] = &unk_10027CB70;
  v38[4] = &v42;
  int v9 = [v7 addObserverForName:TPFavoritesControllerFavoritesEntriesDidChangeNotification object:0 queue:v8 usingBlock:v38];

  id v10 = objc_alloc_init((Class)CNMutableContact);
  uint64_t v11 = +[CNPhoneNumber phoneNumberWithStringValue:@"+14089619342"];
  id v12 = +[CNLabeledValue labeledValueWithLabel:0 value:v11];

  v48 = v12;
  long long v13 = +[NSArray arrayWithObjects:&v48 count:1];
  [v10 setValue:v13 forKey:CNContactPhoneNumbersKey];

  id v14 = objc_alloc((Class)CNFavoritesEntry);
  long long v15 = [v12 identifier];
  id v16 = [v14 initWithContact:v10 propertyKey:CNContactPhoneNumbersKey labeledValueIdentifier:v15 actionType:CNActionTypeAudioCall bundleIdentifier:CNActionBundleIdentifierPhone store:0];

  v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472;
  v35 = __51__PhoneApplication_Testing__TestAddUnknownFavorite__block_invoke_3;
  v36 = &unk_10027C670;
  id v17 = v16;
  id v37 = v17;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &v33);

  id v18 = v43[5];
  dispatch_time_t v19 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v18, v19))
  {
    unsigned int v20 = 0;
    CFStringRef v21 = @"TimeoutOccured";
  }
  else
  {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_123);

    v22 = [v6 visibleViewController:v31, v33, v34, v35, v36];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v22;
      v24 = [v23 favoritesEntries];
      v25 = [v24 firstObject];
    }
    else
    {
      v25 = 0;
    }
    unsigned int v26 = [v25 isEqual:v17];
    unsigned int v20 = v26;
    CFStringRef v27 = @"IncorrectFavoriteEntry";
    if (!v25) {
      CFStringRef v27 = @"NoFavorites";
    }
    if (v26) {
      CFStringRef v21 = 0;
    }
    else {
      CFStringRef v21 = v27;
    }
  }
  v28 = +[NSNotificationCenter defaultCenter];
  [v28 removeObserver:v9];

  v29 = *(void **)(a1 + 32);
  v30 = NSStringFromSelector(*(SEL *)(a1 + 40));
  if (v20) {
    [v29 finishTestOnMainThread:v30];
  }
  else {
    [v29 failTestOnMainThread:v30 reason:v21];
  }

  _Block_object_dispose(&v42, 8);
}

id __51__PhoneApplication_Testing__TestAddUnknownFavorite__block_invoke_106(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedViewController:*(void *)(a1 + 40)];
}

intptr_t __51__PhoneApplication_Testing__TestAddUnknownFavorite__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

void __51__PhoneApplication_Testing__TestAddUnknownFavorite__block_invoke_3(uint64_t a1)
{
  id v2 = +[CNFavorites sharedInstance];
  [v2 addEntry:*(void *)(a1 + 32)];
}

void __51__PhoneApplication_Testing__TestAddUnknownFavorite__block_invoke_4(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:TPFavoritesControllerFavoritesEntriesDidChangeNotification object:0];
}

- (id)_tableFromViewController:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  uint64_t v13 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __54__PhoneApplication_Testing___tableFromViewController___block_invoke;
  block[3] = &unk_10027CBB8;
  uint64_t v8 = self;
  int v9 = &v10;
  id v7 = a3;
  id v3 = v7;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  id v4 = (id)v11[3];

  _Block_object_dispose(&v10, 8);

  return v4;
}

id __54__PhoneApplication_Testing___tableFromViewController___block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) table];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)startTestOnMainThread:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __51__PhoneApplication_Testing__startTestOnMainThread___block_invoke;
  v4[3] = &unk_10027C940;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

id __51__PhoneApplication_Testing__startTestOnMainThread___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startedTest:*(void *)(a1 + 40)];
}

- (void)finishTestOnMainThread:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __52__PhoneApplication_Testing__finishTestOnMainThread___block_invoke;
  v4[3] = &unk_10027C940;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

id __52__PhoneApplication_Testing__finishTestOnMainThread___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:*(void *)(a1 + 40)];
}

- (void)failTestOnMainThread:(id)a3 reason:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __57__PhoneApplication_Testing__failTestOnMainThread_reason___block_invoke;
  block[3] = &unk_10027CBE0;
  void block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __57__PhoneApplication_Testing__failTestOnMainThread_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) failedTest:*(void *)(a1 + 40) withFailure:*(void *)(a1 + 48)];
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&__CurrentTestName, a3);
  objc_storeStrong((id *)&__CurrentTestOptions, a4);
  if ([v7 rangeOfString:@"Scroll"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v7 rangeOfString:@"Switch"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (![v7 isEqualToString:@"TestAddUnknownFavorite"])
      {
        v13.receiver = self;
        v13.super_class = (Class)PhoneApplication;
        BOOL v11 = [(PhoneApplication *)&v13 runTest:v7 options:v8];
        goto LABEL_10;
      }
      [(PhoneApplication *)self TestAddUnknownFavorite];
    }
    else
    {
      id v9 = [v8 objectForKey:@"iterations"];
      id v10 = [v9 intValue];

      [(PhoneApplication *)self startSwitchTest:v10];
    }
  }
  else if ([v7 rangeOfString:@"Interaction"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [(PhoneApplication *)self startScrollTest];
  }
  else
  {
    [(PhoneApplication *)self startScrollWithInteractionTest];
  }
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)_faceTimeInvitationExists
{
  id v2 = +[TUCallCenter sharedInstance];
  id v3 = [v2 incomingVideoCall];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_activeFaceTimeCallExists
{
  id v2 = +[TUCallCenter sharedInstance];
  id v3 = [v2 activeVideoCall];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)inFaceTime
{
  unsigned int v2 = [UIApp showsFaceTimeVideo];
  if (v2)
  {
    if ([UIApp _faceTimeInvitationExists])
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      id v3 = (void *)UIApp;
      LOBYTE(v2) = [v3 _activeFaceTimeCallExists];
    }
  }
  return v2;
}

- (BOOL)faceTimeInvitationExists
{
  unsigned int v2 = [UIApp showsFaceTimeVideo];
  if (v2)
  {
    id v3 = (void *)UIApp;
    LOBYTE(v2) = [v3 _faceTimeInvitationExists];
  }
  return v2;
}

- (BOOL)activeFaceTimeCallExists
{
  unsigned int v2 = [UIApp showsFaceTimeVideo];
  if (v2)
  {
    id v3 = (void *)UIApp;
    LOBYTE(v2) = [v3 _activeFaceTimeCallExists];
  }
  return v2;
}

- (id)swiftui_rootViewForSimplifiedApplicationProvider
{
  unsigned int v2 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();

  return v2;
}

- (void)runSwitchTabTestWithTabViewController:(id)a3 fromTab:(int)a4 switchTo:(int)a5 numberOfIterations:(int64_t)a6 testNameReference:(const void *)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v13 - 8);
  long long v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  type metadata accessor for MainActor();
  id v17 = a3;
  id v18 = self;
  id v19 = v17;
  unsigned int v20 = v18;
  uint64_t v21 = static MainActor.shared.getter();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v21;
  *(void *)(v22 + 24) = &protocol witness table for MainActor;
  *(void *)(v22 + 32) = a6;
  *(void *)(v22 + 40) = v19;
  *(void *)(v22 + 48) = v20;
  *(_DWORD *)(v22 + 56) = a4;
  *(void *)(v22 + 64) = 0x6154686374697753;
  *(void *)(v22 + 72) = 0xE900000000000062;
  *(void *)(v22 + 80) = a7;
  *(_DWORD *)(v22 + 88) = a5;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v15, (uint64_t)&closure #1 in PhoneApplication.runSwitchTabTest(_:initial:to:numberOfIterations:testNameRef:)partial apply, v22);

  swift_release();
}

void __48__PhoneApplication_warmInCallServiceIfNecessary__block_invoke_93_cold_1(void *a1, NSObject *a2)
{
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error launching InCallService: %@", (uint8_t *)&v4, 0xCu);
}

- (void)dialVoicemailWithAccountID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not initiate a voicemail call due to a nil URL from the dial request (%@).", (uint8_t *)&v2, 0xCu);
}

- (void)dialVoicemailWithAccountID:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not initiate a voicemail call due to an invalid dial request (%@).", (uint8_t *)&v2, 0xCu);
}

@end