@interface NSURL(HFAdditions)
+ (id)_localeString;
+ (id)hf_appStoreURLForBundleIdentifier:()HFAdditions;
+ (id)hf_learnAboutNetworksRequiringProfilesURL;
+ (id)hf_learnAboutUnshareableNetworksURL;
+ (id)hf_learnToAddAccessoriesURL;
+ (id)hf_learnToUpdateAppleTVURL;
+ (id)hf_locationFromURL:()HFAdditions;
+ (id)hf_locationServicesSettingsURL;
+ (id)hf_notificationSettingsURL;
+ (id)hf_openiCloudPreferencesURL;
+ (id)hf_setupHomeHubLearnMoreURL;
+ (id)hf_systemSoftwareUpdate;
+ (id)hf_wifiSettingsURL;
+ (uint64_t)hf_allowAccessWhileLockedSettingsURL;
+ (uint64_t)hf_applePrivacyURL;
+ (uint64_t)hf_cameraRecordingURL;
+ (uint64_t)hf_faceRecognitionPrivacyURL;
+ (uint64_t)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;
+ (uint64_t)hf_homeHubRequiredLearnMoreURL;
+ (uint64_t)hf_learnAboutActivityLogsURL;
+ (uint64_t)hf_learnAboutNetworkProtectionURL;
+ (uint64_t)hf_locationDeviceSettingsURL;
+ (uint64_t)hf_losslessURL;
+ (uint64_t)hf_matterAccessoriesInSettingsApp;
+ (uint64_t)hf_openiCloudKeychainPreferences;
+ (uint64_t)hf_openiCloudPasswordAndSecurityURL;
+ (uint64_t)hf_photosLibraryPeopleAlbumURL;
+ (uint64_t)hf_threadNetworkRequiredLearnMoreURL;
- (uint64_t)hf_isHomeKnowledgeBasedArticleURL;
@end

@implementation NSURL(HFAdditions)

+ (id)_localeString
{
  v0 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v1 = [v0 localeIdentifier];
  v2 = (void *)v1;
  v3 = @"en_us";
  if (v1) {
    v3 = (__CFString *)v1;
  }
  v4 = v3;

  v5 = [(__CFString *)v4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  v6 = [v5 lowercaseString];

  return v6;
}

+ (id)hf_notificationSettingsURL
{
  if (+[HFUtilities isAMac]) {
    v0 = @"x-apple.systempreferences:com.apple.preference.notifications?id=com.apple.home";
  }
  else {
    v0 = @"prefs:root=NOTIFICATIONS_ID&path=com.apple.Home";
  }
  uint64_t v1 = [NSURL URLWithString:v0];
  return v1;
}

+ (id)hf_wifiSettingsURL
{
  if (+[HFUtilities isAMac]) {
    v0 = @"x-apple.systempreferences:com.apple.preference.network";
  }
  else {
    v0 = @"prefs:root=WIFI";
  }
  uint64_t v1 = [NSURL URLWithString:v0];
  return v1;
}

+ (uint64_t)hf_allowAccessWhileLockedSettingsURL
{
  return [NSURL URLWithString:@"prefs:root=TOUCHID_PASSCODE&path=TOUCHID_PASSCODE#HOME_CONTROL_SWITCH"];
}

+ (uint64_t)hf_locationDeviceSettingsURL
{
  return [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=LOCATION_SHARING"];
}

+ (id)hf_locationServicesSettingsURL
{
  if (+[HFUtilities isAMac]) {
    v0 = @"x-apple.systempreferences:com.apple.preference.security?Privacy";
  }
  else {
    v0 = @"prefs:root=Privacy&path=LOCATION";
  }
  uint64_t v1 = [NSURL URLWithString:v0];
  return v1;
}

+ (id)hf_learnToAddAccessoriesURL
{
  uint64_t v1 = NSURL;
  v2 = NSString;
  v3 = [a1 _localeString];
  v4 = [v2 stringWithFormat:@"https://support.apple.com/%@/HT204893#add", v3];
  v5 = [v1 URLWithString:v4];

  return v5;
}

+ (id)hf_learnAboutUnshareableNetworksURL
{
  uint64_t v1 = NSURL;
  v2 = NSString;
  v3 = [a1 _localeString];
  v4 = [v2 stringWithFormat:@"https://support.apple.com/%@/HT209643", v3];
  v5 = [v1 URLWithString:v4];

  return v5;
}

+ (id)hf_learnAboutNetworksRequiringProfilesURL
{
  uint64_t v1 = NSURL;
  v2 = NSString;
  v3 = [a1 _localeString];
  v4 = [v2 stringWithFormat:@"https://support.apple.com/%@/HT209643", v3];
  v5 = [v1 URLWithString:v4];

  return v5;
}

+ (id)hf_learnToUpdateAppleTVURL
{
  uint64_t v1 = NSURL;
  v2 = NSString;
  v3 = [a1 _localeString];
  v4 = [v2 stringWithFormat:@"https://support.apple.com/%@/HT202716", v3];
  v5 = [v1 URLWithString:v4];

  return v5;
}

+ (uint64_t)hf_learnAboutActivityLogsURL
{
  return [NSURL URLWithString:@"https://support.apple.com/ht213743?cid=mc-ols-homeapp-article_ht213743-homeappui-04252023"];
}

+ (uint64_t)hf_applePrivacyURL
{
  return [NSURL URLWithString:@"http://www.apple.com/privacy"];
}

+ (id)hf_openiCloudPreferencesURL
{
  if (+[HFUtilities isAMac]) {
    v0 = @"x-apple.systempreferences:com.apple.preferences.AppleIDPrefPane?iCloud";
  }
  else {
    v0 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE";
  }
  uint64_t v1 = [NSURL URLWithString:v0];
  return v1;
}

+ (uint64_t)hf_openiCloudPasswordAndSecurityURL
{
  if (+[HFUtilities isAMac]) {
    v0 = @"x-apple.systempreferences:com.apple.preferences.icloud";
  }
  else {
    v0 = @"prefs:root=APPLE_ACCOUNT&path=PASSWORD_AND_SECURITY";
  }
  uint64_t v1 = NSURL;
  return [v1 URLWithString:v0];
}

+ (uint64_t)hf_openiCloudKeychainPreferences
{
  return [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync"];
}

+ (uint64_t)hf_cameraRecordingURL
{
  return [NSURL URLWithString:@"cameraRecordingLearnMore"];
}

+ (uint64_t)hf_learnAboutNetworkProtectionURL
{
  return [NSURL URLWithString:@"https://support.apple.com/HT210544?cid=iOS_UI_HomeKit_article_HT210544"];
}

+ (uint64_t)hf_photosLibraryPeopleAlbumURL
{
  return [NSURL URLWithString:@"photos://people"];
}

+ (uint64_t)hf_faceRecognitionPrivacyURL
{
  return [NSURL URLWithString:@"faceRecognitionLearnMore"];
}

+ (uint64_t)hf_losslessURL
{
  return [NSURL URLWithString:@"https://support.apple.com/HT212183"];
}

+ (id)hf_setupHomeHubLearnMoreURL
{
  uint64_t v1 = NSURL;
  v2 = NSString;
  v3 = [a1 _localeString];
  v4 = [v2 stringWithFormat:@"https://support.apple.com/%@/HT207057", v3];
  v5 = [v1 URLWithString:v4];

  return v5;
}

+ (uint64_t)hf_homeHubRequiredLearnMoreURL
{
  return [NSURL URLWithString:@"https://support.apple.com/ht213214?cid=mc-ols-homekit-article_ht213214-ios_ui-03292022"];
}

+ (uint64_t)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
{
  return [NSURL URLWithString:@"https://support.apple.com/ht213429?cid=mc-ols-homekit-article_ht213429-homeappui-08232022"];
}

+ (uint64_t)hf_threadNetworkRequiredLearnMoreURL
{
  return [NSURL URLWithString:@"https://support.apple.com/ht210213?cid=mc-ols-homekit-article_ht210213-ios_ui-04142022"];
}

+ (id)hf_systemSoftwareUpdate
{
  if (+[HFUtilities isAMac]) {
    v0 = @"x-apple.systempreferences:com.apple.Software-Update-Settings.extension";
  }
  else {
    v0 = @"prefs:root=General%23-64&path=SOFTWARE_UPDATE_LINK%23-64";
  }
  uint64_t v1 = [NSURL URLWithString:v0];
  return v1;
}

+ (uint64_t)hf_matterAccessoriesInSettingsApp
{
  return [NSURL URLWithString:@"prefs:root=General&path=MATTER_ACCESSORIES"];
}

- (uint64_t)hf_isHomeKnowledgeBasedArticleURL
{
  v2 = objc_msgSend(NSURL, "hf_learnToAddAccessoriesURL");
  if ([a1 isEqual:v2])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = objc_msgSend(NSURL, "hf_learnAboutUnshareableNetworksURL");
    if ([a1 isEqual:v4])
    {
      uint64_t v3 = 1;
    }
    else
    {
      v5 = objc_msgSend(NSURL, "hf_learnAboutNetworksRequiringProfilesURL");
      if ([a1 isEqual:v5])
      {
        uint64_t v3 = 1;
      }
      else
      {
        v6 = objc_msgSend(NSURL, "hf_learnAboutNetworkProtectionURL");
        if ([a1 isEqual:v6])
        {
          uint64_t v3 = 1;
        }
        else
        {
          v7 = objc_msgSend(NSURL, "hf_losslessURL");
          if ([a1 isEqual:v7])
          {
            uint64_t v3 = 1;
          }
          else
          {
            v8 = objc_msgSend(NSURL, "hf_homeHubRequiredLearnMoreURL");
            if ([a1 isEqual:v8])
            {
              uint64_t v3 = 1;
            }
            else
            {
              v9 = objc_msgSend(NSURL, "hf_threadNetworkRequiredLearnMoreURL");
              uint64_t v3 = [a1 isEqual:v9];
            }
          }
        }
      }
    }
  }

  return v3;
}

+ (id)hf_appStoreURLForBundleIdentifier:()HFAdditions
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)MEMORY[0x263F08BA0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setScheme:@"itms-apps"];
  [v5 setHost:&stru_26C081158];
  v6 = [MEMORY[0x263F08BD0] queryItemWithName:@"bundleIdentifier" value:v4];

  v10[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v5 setQueryItems:v7];

  v8 = [v5 URL];

  return v8;
}

+ (id)hf_locationFromURL:()HFAdditions
{
  id v3 = a3;
  id v4 = [[HFURLComponents alloc] initWithURL:v3];

  id v5 = [(HFURLComponents *)v4 valueForParameter:@"latitude"];
  uint64_t v6 = [(HFURLComponents *)v4 valueForParameter:@"longitude"];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v13 = 0;
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x263F00A50]);
    [v5 doubleValue];
    double v11 = v10;
    [v7 doubleValue];
    v13 = (void *)[v9 initWithLatitude:v11 longitude:v12];
  }

  return v13;
}

@end