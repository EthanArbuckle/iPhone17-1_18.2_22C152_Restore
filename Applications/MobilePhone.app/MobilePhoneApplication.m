@interface MobilePhoneApplication
- (BOOL)_isIPad;
- (BOOL)alwaysShowLocalVideo;
- (BOOL)audioButtonAllowsPhoneCallsAndFaceTimeAudio;
- (BOOL)badgesMissedTelephonyCalls;
- (BOOL)contentViewCanRotate;
- (BOOL)headerViewShowsAllRecentCalls;
- (BOOL)notificationCategoryIsAllowed:(id)a3;
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
- (BOOL)tabBarCanSlide;
- (BOOL)tabBarFillsScreen;
- (BOOL)usesBlendModes;
- (IMNicknameProvider)prewarmProvider;
- (MobilePhoneApplication)init;
- (UNUserNotificationCenter)notificationCenter;
- (id)recentsController;
- (id)rootViewController;
- (int)defaultAction;
- (int64_t)headerViewNumberOfCallsToShow;
- (unsigned)userInterfaceStyle;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)dealloc;
- (void)refreshDynamicApplicationShortcuts;
- (void)setNotificationCenter:(id)a3;
- (void)setPrewarmProvider:(id)a3;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation MobilePhoneApplication

- (void)applicationDidFinishLaunching:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MobilePhoneApplication;
  [(PhoneApplication *)&v10 applicationDidFinishLaunching:a3];
  [(MobilePhoneApplication *)self refreshDynamicApplicationShortcuts];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"refreshDynamicApplicationShortcuts" name:VMVoicemailSubscriptionStateStatusChangedNotification object:0];

  v5 = +[UNUserNotificationCenter currentNotificationCenter];
  [(MobilePhoneApplication *)self setNotificationCenter:v5];

  v6 = [(MobilePhoneApplication *)self notificationCenter];
  [v6 setDelegate:self];

  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  v8 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __56__MobilePhoneApplication_applicationDidFinishLaunching___block_invoke;
  block[3] = &unk_10027C670;
  block[4] = self;
  dispatch_after(v7, v8, block);
}

- (void)refreshDynamicApplicationShortcuts
{
}

- (void)setNotificationCenter:(id)a3
{
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

void __60__MobilePhoneApplication_refreshDynamicApplicationShortcuts__block_invoke_3(uint64_t a1)
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 shortcutItems];

  v4 = +[NSPredicate predicateWithFormat:@"type == %@", @"com.apple.mobilephone.voicemail"];
  v5 = [v3 filteredArrayUsingPredicate:v4];
  id v6 = [v5 count];

  int v7 = *(unsigned __int8 *)(a1 + 32);
  if (v7 && !v6)
  {
    v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding voicemail application shortcut", buf, 2u);
    }

    id v9 = objc_alloc((Class)UIMutableApplicationShortcutItem);
    objc_super v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"OPEN_VOICEMAIL" value:&stru_100285990 table:@"InfoPlist"];
    v12 = +[UIApplicationShortcutIcon iconWithTemplateImageName:@"VoicemailShortcutIcon"];
    v13 = [v9 initWithType:@"com.apple.mobilephone.voicemail" localizedTitle:v11 localizedSubtitle:0 icon:v12 userInfo:0];

    id v14 = [v3 mutableCopy];
    [v14 addObject:v13];
    v15 = +[UIApplication sharedApplication];
    [v15 setShortcutItems:v14];

LABEL_11:
    goto LABEL_12;
  }
  v13 = PHDefaultLog();
  BOOL v16 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v7 && v6)
  {
    if (v16)
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removing voicemail application shortcut", v19, 2u);
    }

    v13 = [v3 mutableCopy];
    v17 = [v13 filteredArrayUsingPredicate:v4];
    [v13 removeObjectsInArray:v17];

    id v14 = +[UIApplication sharedApplication];
    [v14 setShortcutItems:v13];
    goto LABEL_11;
  }
  if (v16)
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Voicemail application shortcut unchanged", v18, 2u);
  }
LABEL_12:
}

- (unsigned)userInterfaceStyle
{
  return 0;
}

void __60__MobilePhoneApplication_refreshDynamicApplicationShortcuts__block_invoke(id a1)
{
}

- (BOOL)contentViewCanRotate
{
  return 0;
}

- (id)recentsController
{
  recentsController = self->_recentsController;
  if (!recentsController)
  {
    v4 = +[PHApplicationServices sharedInstance];
    v5 = [PHRecentsController alloc];
    id v6 = [(PhoneApplication *)self callHistoryController];
    int v7 = [v4 callProviderManager];
    v8 = [v4 contactStore];
    id v9 = [v4 suggestedContactStore];
    objc_super v10 = [v4 metadataCache];
    v11 = [(PHRecentsController *)v5 initWithCallHistoryController:v6 callProviderManager:v7 contactStore:v8 suggestedContactStore:v9 metadataCache:v10];
    v12 = self->_recentsController;
    self->_recentsController = v11;

    recentsController = self->_recentsController;
  }

  return recentsController;
}

- (id)rootViewController
{
  rootController = self->super._rootController;
  if (!rootController)
  {
    v4 = objc_alloc_init(MPRootViewController);
    v5 = self->super._rootController;
    self->super._rootController = &v4->super;

    rootController = self->super._rootController;
  }

  return rootController;
}

- (BOOL)alwaysShowLocalVideo
{
  return 0;
}

- (BOOL)tabBarFillsScreen
{
  return 1;
}

- (BOOL)showsPhoneDialer
{
  return 1;
}

- (BOOL)tabBarCanSlide
{
  return 0;
}

- (BOOL)showsThirdPartyRecents
{
  return 1;
}

- (BOOL)showsTelephonyRecents
{
  return 1;
}

- (BOOL)showsPhoneVoicemail
{
  return 1;
}

- (BOOL)showsFaceTimeVideoRecents
{
  v2 = +[IDSServiceAvailabilityController sharedInstance];
  id v3 = [v2 availabilityForListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameFaceTime];

  BOOL result = [UIApp isDeviceCapableOfFaceTimeVideo];
  if (v3 != (id)1) {
    return 0;
  }
  return result;
}

- (BOOL)showsFaceTimeAudioRecents
{
  v2 = +[IDSServiceAvailabilityController sharedInstance];
  id v3 = [v2 availabilityForListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameCalling];

  BOOL result = [UIApp isDeviceCapableOfFaceTimeAudio];
  if (v3 != (id)1) {
    return 0;
  }
  return result;
}

void __60__MobilePhoneApplication_refreshDynamicApplicationShortcuts__block_invoke_2(id a1, BOOL a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__MobilePhoneApplication_refreshDynamicApplicationShortcuts__block_invoke_3;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v3 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (MobilePhoneApplication)init
{
  v5.receiver = self;
  v5.super_class = (Class)MobilePhoneApplication;
  v2 = [(PhoneApplication *)&v5 init];
  BOOL v3 = v2;
  if (v2) {
    [(MobilePhoneApplication *)v2 setDelegate:v2];
  }
  return v3;
}

- (BOOL)_isIPad
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

void __56__MobilePhoneApplication_applicationDidFinishLaunching___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)IMNicknameProvider);
  [*(id *)(a1 + 32) setPrewarmProvider:v2];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)MobilePhoneApplication;
  [(PhoneApplication *)&v5 dealloc];
}

- (BOOL)usesBlendModes
{
  return 0;
}

- (int)defaultAction
{
  if ([UIApp isDeviceCapableOfTelephonyCalls]) {
    return 0;
  }
  else {
    return 2;
  }
}

- (BOOL)showsTelephonyCalls
{
  return 1;
}

- (BOOL)showsFaceTimeVideo
{
  return 0;
}

- (BOOL)showsFaceTimeAudio
{
  return 0;
}

- (BOOL)showsTelephonyFavorites
{
  return 1;
}

- (BOOL)showsFaceTimeAudioFavorites
{
  return [UIApp isDeviceCapableOfFaceTimeAudio];
}

- (BOOL)showsFaceTimeVideoFavorites
{
  return [UIApp isDeviceCapableOfFaceTimeVideo];
}

- (BOOL)badgesMissedTelephonyCalls
{
  return 1;
}

- (BOOL)audioButtonAllowsPhoneCallsAndFaceTimeAudio
{
  return +[TUCallCapabilities supportsPrimaryCalling] ^ 1;
}

- (BOOL)headerViewShowsAllRecentCalls
{
  return 1;
}

- (int64_t)headerViewNumberOfCallsToShow
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  objc_super v10 = (void (**)(void))a5;
  int v7 = [a4 request];
  v8 = [v7 content];
  id v9 = [v8 categoryIdentifier];
  [(MobilePhoneApplication *)self notificationCategoryIsAllowed:v9];

  v10[2]();
}

- (BOOL)notificationCategoryIsAllowed:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:TUNotificationCategoryIdentifierNewVoicemailNoVisualVoicemail])unsigned __int8 v4 = 1; {
  else
  }
    unsigned __int8 v4 = [v3 isEqualToString:TUNotificationCategoryIdentifierCallRecording];
  if (![v3 length]) {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (IMNicknameProvider)prewarmProvider
{
  return self->_prewarmProvider;
}

- (void)setPrewarmProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);

  objc_storeStrong((id *)&self->_recentsController, 0);
}

@end