@interface ICQLinkAppDelegate_iOS
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)handleAMSLinkWithURL:(id)a3;
- (BOOL)handleSkipCFUWithURL:(id)a3;
- (BOOL)launchURLWithDeviceUnlockPrompt:(id)a3;
- (void)launchFlowWithContext:(id)a3;
- (void)launchFlowWithContext:(id)a3 offer:(id)a4;
- (void)launchSettingsDeeplink;
- (void)launchURL:(id)a3;
- (void)launchpostPurchaseFlowWithLink:(id)a3 offer:(id)a4;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
- (void)upgradeFlowManagerDidFail:(id)a3 error:(id)a4;
@end

@implementation ICQLinkAppDelegate_iOS

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6 = a4;
  v7 = objc_opt_new();
  int64_t v8 = +[ICQLinkHandler resultFromURL:v6 store:v7];

  LOBYTE(self) = [(ICQLinkAppDelegate *)self handleICQLinkResult:v8 url:v6];
  return (char)self;
}

- (void)launchSettingsDeeplink
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User is not logged in. Redirect to Settings", v5, 2u);
  }

  v4 = +[NSURL URLWithString:ICQChangeStoragePlanPreferencesURL];
  [(ICQLinkAppDelegate_iOS *)self launchURL:v4];
}

- (void)launchFlowWithContext:(id)a3
{
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Launching freshmint flow with context: %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = objc_alloc((Class)ICQOffer);
  id v7 = objc_alloc_init((Class)NSDictionary);
  int64_t v8 = +[NSDate date];
  id v9 = [v6 initWithServerDictionary:v7 accountAltDSID:&stru_100008330 notificationID:&stru_100008330 retrievalDate:v8 callbackInterval:0 appLaunchLink:ICQBundleId bundleIdentifier:978307200.0];

  [(ICQLinkAppDelegate_iOS *)self launchFlowWithContext:v4 offer:v9];
}

- (void)launchpostPurchaseFlowWithLink:(id)a3 offer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = (ICQUpgradeFlowManager *)[objc_alloc((Class)ICQUpgradeFlowManager) initSubclassWithOffer:v7];
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = v8;

  [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setIcqLink:v6];
  [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setDelegate:self];
  [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setFlowOptions:0];
  int v10 = [v6 actionURL];
  id v11 = [v10 absoluteString];
  [v7 setContext:v11];

  v12 = [v7 universalSuccessLink];
  if (v12)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100001EA8;
    block[3] = &unk_100008230;
    block[4] = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100003F34(v13);
    }
  }
}

- (void)launchFlowWithContext:(id)a3 offer:(id)a4
{
  id v6 = a4;
  [v6 setContext:a3];
  id v7 = (ICQUpgradeFlowManager *)[objc_alloc((Class)ICQUpgradeFlowManager) initSubclassWithOffer:v6];

  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = v7;

  [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setDelegate:self];
  [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setFlowOptions:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001FA8;
  block[3] = &unk_100008258;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  return [(ICQLinkAppDelegate *)self handleUniversalLinkWithUserActivity:a4];
}

- (void)launchURL:(id)a3
{
  id v3 = a3;
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (BOOL)launchURLWithDeviceUnlockPrompt:(id)a3
{
  id v3 = a3;
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v8 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  id v9 = &__kCFBooleanTrue;
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  unsigned __int8 v6 = [v4 openSensitiveURL:v3 withOptions:v5];

  return v6;
}

- (BOOL)handleSkipCFUWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ICQActionParameterFollowUpIdentifierKey;
  unsigned __int8 v6 = [v4 icq_queryItemForName:ICQActionParameterFollowUpIdentifierKey];
  id v7 = [v6 value];
  uint64_t v8 = (void *)ICQiCloudSettingsUniversalURL;
  id v9 = +[NSString stringWithFormat:@"/%@", ICQActionParameterSkipCFUKey];
  int v10 = [v8 stringByAppendingString:v9];

  id v11 = +[NSURL URLWithString:v10];
  v12 = [v11 icq_URLByAppendingQueryParamName:v5 value:v7];

  uint64_t v13 = ICQActionParameterServerLinkIdentifierKey;
  v14 = [v4 icq_queryItemForName:ICQActionParameterServerLinkIdentifierKey];
  id v15 = v14;
  if (v14)
  {
    id v16 = [v14 value];
    v17 = +[NSURL URLWithString:v10];
    uint64_t v18 = [v17 icq_URLByAppendingQueryParamName:v13 value:v16];

    v12 = (void *)v18;
  }
  BOOL v19 = [(ICQLinkAppDelegate_iOS *)self launchURLWithDeviceUnlockPrompt:v12];
  if (v19)
  {
    v20 = [v4 icq_queryItemForName:ICQActionParameterDismissLockScreenKey];
    v21 = [v20 value];

    if ([v21 isEqualToString:@"true"]) {
      +[FLFollowUpController icq_dismissFollowUpWithIdentifier:v7];
    }
  }
  else
  {
    v21 = _ICQGetLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100003F78((uint64_t)v12, v21, v22, v23, v24, v25, v26, v27);
    }
  }

  return v19;
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Upgrade flow cancelled.", v4, 2u);
  }
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Upgrade flow completed.", v4, 2u);
  }
}

- (void)upgradeFlowManagerDidFail:(id)a3 error:(id)a4
{
  id v4 = a4;
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100003FE4((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (BOOL)handleAMSLinkWithURL:(id)a3
{
  id v3 = a3;
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000425C(v3, v4);
  }

  if (v3)
  {
    uint64_t v5 = +[ICQDeeplinkHelper deeplinkFromURL:v3];
    if (v5)
    {
      uint64_t v6 = +[LSApplicationWorkspace defaultWorkspace];
      id v19 = 0;
      unsigned __int8 v7 = [v6 openSensitiveURL:v5 withOptions:0 error:&v19];
      uint64_t v8 = v19;

      uint64_t v9 = _ICQGetLogSystem();
      uint64_t v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000041DC();
        }
        unsigned __int8 v7 = 0;
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        sub_10000414C(v7, v10);
      }
    }
    else
    {
      uint64_t v8 = _ICQGetLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000040D4(v8, v11, v12, v13, v14, v15, v16, v17);
      }
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    uint64_t v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100004050(v5);
    }
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end