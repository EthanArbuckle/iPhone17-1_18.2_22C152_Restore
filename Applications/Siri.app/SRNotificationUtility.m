@interface SRNotificationUtility
+ (id)_deviceSpecificStringForDefaultString:(id)a3;
+ (id)_downloadAssetsNotificationRequest;
+ (id)_downloadSiriAdvancedFeaturesAssetsNotificationRequest;
+ (id)_siriUnvailableNotificationRequest;
+ (id)_userNotificationCenter;
+ (void)_postNotificationRequest:(id)a3 notificationCenter:(id)a4 destinations:(unint64_t)a5;
+ (void)postSiriAdvancedFeaturesAssetsDownloadNotification;
+ (void)postSiriUnavailableNotification:(unint64_t)a3;
+ (void)postStorageLowNotification;
@end

@implementation SRNotificationUtility

+ (id)_userNotificationCenter
{
  id v2 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.siri"];

  return v2;
}

+ (id)_siriUnvailableNotificationRequest
{
  v3 = +[NSBundle bundleWithIdentifier:@"com.apple.siri"];
  id v4 = objc_alloc_init((Class)UNMutableNotificationContent);
  v5 = [v3 siriUILocalizedStringForKey:@"ASSISTANT_NOT_AVAILABLE_TITLE"];
  [v4 setTitle:v5];

  [v4 setShouldSuppressDefaultAction:1];
  [v4 setShouldIgnoreDoNotDisturb:1];
  v6 = [a1 _deviceSpecificStringForDefaultString:@"ASSISTANT_NO_NETWORK_SUBTITLE_NOTIFICATION"];
  v7 = +[SRUIFCachedPreferences sharedInstance];
  unsigned int v8 = [v7 understandingOnDeviceAssetsAvailable];

  v9 = +[UIDevice currentDevice];
  unsigned int v10 = [v9 sf_isChinaRegionCellularDevice];

  if (+[AFSystemAssistantExperienceStatusManager isSAEEnabled](AFSystemAssistantExperienceStatusManager, "isSAEEnabled"))unsigned int v8 = +[GMSCompatabilityWrapper siriGMAssetsAvailable]; {
  if (!+[AFFeatureFlags isNLServerFallbackDisabled]|| (v8 & 1) != 0)
  }
  {
    if (+[AFConnection isAvailable]
      && ((+[AFConnection isNetworkAvailable] | v8) & 1) == 0)
    {
      if (v10)
      {
        v14 = [@"ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION" stringByAppendingString:@"_CHINA"];
      }
      else
      {
        v14 = @"ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION";
      }
      uint64_t v18 = [v3 siriUILocalizedStringForKey:v14];

      v6 = (void *)v18;
    }
  }
  else
  {
    v11 = +[SRUIFCachedPreferences sharedInstance];
    unsigned __int8 v12 = [v11 assetsDownloading];

    if (v12)
    {
      CFStringRef v13 = @"ASSISTANT_NO_LOCAL_ASSETS_DOWNLOADING_SUBTITLE_NOTIFICATION";
    }
    else
    {
      v15 = +[SRUIFCachedPreferences sharedInstance];
      unsigned int v16 = [v15 assetsNeedSpace];

      if (v16) {
        CFStringRef v13 = @"ASSISTANT_NO_LOCAL_ASSETS_NO_SPACE_SUBTITLE_NOTIFICATION";
      }
      else {
        CFStringRef v13 = @"ASSISTANT_NO_LOCAL_ASSETS_NO_WIFI_SUBTITLE_NOTIFICATION_CHINA";
      }
      if (((v16 | v10) & 1) == 0)
      {
        if (+[AFSystemAssistantExperienceStatusManager isSAEEnabled])
        {
          v17 = [v3 siriUILocalizedStringForKey:@"ASSISTANT_NO_LOCAL_ASSETS_SAE_TITLE"];
          [v4 setTitle:v17];

          CFStringRef v13 = @"ASSISTANT_NO_LOCAL_ASSETS_SAE_SUBTITLE_NOTIFICATION";
        }
        else
        {
          CFStringRef v13 = @"ASSISTANT_NO_LOCAL_ASSETS_NO_WIFI_SUBTITLE_NOTIFICATION";
        }
      }
    }
    uint64_t v19 = [v3 siriUILocalizedStringForKey:v13];

    v20 = +[NSURL URLWithString:@"prefs:root=SIRI"];
    [v4 setDefaultActionURL:v20];

    [v4 setHasDefaultAction:1];
    v6 = (void *)v19;
  }
  [v4 setBody:v6];
  v21 = +[UNNotificationRequest requestWithIdentifier:@"com.apple.siri.notification.unavailablecontent" content:v4 trigger:0];

  return v21;
}

+ (id)_deviceSpecificStringForDefaultString:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.siri"];
  v5 = +[SiriUIUtilities deviceSpecificKeyForDefaultKey:v3];

  v6 = [v4 siriUILocalizedStringForKey:v5];

  return v6;
}

+ (void)postSiriUnavailableNotification:(unint64_t)a3
{
  id v6 = [a1 _siriUnvailableNotificationRequest];
  v5 = [a1 _userNotificationCenter];
  [a1 _postNotificationRequest:v6 notificationCenter:v5 destinations:a3];
}

+ (void)_postNotificationRequest:(id)a3 notificationCenter:(id)a4 destinations:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  [v7 setDestinations:a5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100075E08;
  v10[3] = &unk_100142D98;
  id v11 = v7;
  id v9 = v7;
  [v8 addNotificationRequest:v9 withCompletionHandler:v10];
}

+ (id)_downloadAssetsNotificationRequest
{
  id v3 = +[NSBundle bundleWithIdentifier:@"com.apple.siri"];
  id v4 = objc_alloc_init((Class)UNMutableNotificationContent);
  v5 = [v3 siriUILocalizedStringForKey:@"DOWNLOAD_ASSETS_TITLE"];
  [v4 setTitle:v5];

  id v6 = [a1 _deviceSpecificStringForDefaultString:@"DOWNLOAD_ASSETS_SUBTITLE_NOTIFICATION"];
  id v7 = [v3 siriUILocalizedStringForKey:v6];
  [v4 setBody:v7];

  id v8 = +[NSURL URLWithString:@"prefs:root=SIRI"];
  [v4 setDefaultActionURL:v8];

  id v9 = +[UNNotificationRequest requestWithIdentifier:@"com.apple.siri.notification.downloadassets" content:v4 trigger:0];

  return v9;
}

+ (void)postStorageLowNotification
{
  id v4 = [a1 _downloadAssetsNotificationRequest];
  id v3 = [a1 _userNotificationCenter];
  [a1 _postNotificationRequest:v4 notificationCenter:v3 destinations:7];
}

+ (id)_downloadSiriAdvancedFeaturesAssetsNotificationRequest
{
  id v2 = +[NSBundle bundleWithIdentifier:@"com.apple.siri"];
  id v3 = objc_alloc_init((Class)UNMutableNotificationContent);
  id v4 = [v2 siriUILocalizedStringForKey:@"DOWNLOAD_ASSETS_TITLE"];
  [v3 setTitle:v4];

  v5 = [v2 siriUILocalizedStringForKey:@"DOWNLOAD_ADVANCED_FEATURES_ASSETS_SUBTITLE_NOTIFICATION"];
  [v3 setBody:v5];

  id v6 = +[NSURL URLWithString:@"prefs:root=SIRI"];
  [v3 setDefaultActionURL:v6];

  id v7 = +[UNNotificationRequest requestWithIdentifier:@"com.apple.siri.notification.downloadassets" content:v3 trigger:0];

  return v7;
}

+ (void)postSiriAdvancedFeaturesAssetsDownloadNotification
{
  id v4 = [a1 _downloadSiriAdvancedFeaturesAssetsNotificationRequest];
  id v3 = [a1 _userNotificationCenter];
  [a1 _postNotificationRequest:v4 notificationCenter:v3 destinations:7];
}

@end