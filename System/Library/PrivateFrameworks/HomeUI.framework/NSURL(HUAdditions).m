@interface NSURL(HUAdditions)
+ (id)_localeString;
+ (id)hu_appStoreURLForBundleIdentifier:()HUAdditions;
+ (id)hu_learnAboutNetworksRequiringProfilesURL;
+ (id)hu_learnAboutUnshareableNetworksURL;
+ (id)hu_learnToAddAccessoriesURL;
+ (id)hu_locationServicesSettingsURL;
+ (id)hu_notificationSettingsURL;
+ (id)hu_openiCloudPreferencesURL;
+ (id)hu_wifiSettingsURL;
+ (uint64_t)hu_allowAccessWhileLockedSettingsURL;
+ (uint64_t)hu_applePrivacyURL;
+ (uint64_t)hu_cameraRecordingURL;
+ (uint64_t)hu_faceRecognitionPrivacyURL;
+ (uint64_t)hu_learnAboutNetworkProtectionURL;
+ (uint64_t)hu_locationDeviceSettingsURL;
+ (uint64_t)hu_losslessURL;
+ (uint64_t)hu_openiCloudKeychainPreferences;
+ (uint64_t)hu_photosLibraryPeopleAlbumURL;
- (uint64_t)hu_isHomeKnowledgeBasedArticleURL;
@end

@implementation NSURL(HUAdditions)

+ (id)_localeString
{
  v0 = [MEMORY[0x1E4F1CA20] currentLocale];
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

+ (id)hu_notificationSettingsURL
{
  if ([MEMORY[0x1E4F69758] isAMac]) {
    v0 = @"x-apple.systempreferences:com.apple.preference.notifications?id=com.apple.home";
  }
  else {
    v0 = @"prefs:root=NOTIFICATIONS_ID&path=com.apple.Home";
  }
  uint64_t v1 = [MEMORY[0x1E4F1CB10] URLWithString:v0];

  return v1;
}

+ (id)hu_wifiSettingsURL
{
  if ([MEMORY[0x1E4F69758] isAMac]) {
    v0 = @"x-apple.systempreferences:com.apple.preference.network";
  }
  else {
    v0 = @"prefs:root=WIFI";
  }
  uint64_t v1 = [MEMORY[0x1E4F1CB10] URLWithString:v0];

  return v1;
}

+ (uint64_t)hu_allowAccessWhileLockedSettingsURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=TOUCHID_PASSCODE&path=TOUCHID_PASSCODE#HOME_CONTROL_SWITCH"];
}

+ (uint64_t)hu_locationDeviceSettingsURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=LOCATION_SHARING"];
}

+ (id)hu_locationServicesSettingsURL
{
  if ([MEMORY[0x1E4F69758] isAMac]) {
    v0 = @"x-apple.systempreferences:com.apple.preference.security?Privacy";
  }
  else {
    v0 = @"prefs:root=Privacy&path=LOCATION";
  }
  uint64_t v1 = [MEMORY[0x1E4F1CB10] URLWithString:v0];

  return v1;
}

+ (id)hu_learnToAddAccessoriesURL
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
  v2 = NSString;
  v3 = [a1 _localeString];
  v4 = [v2 stringWithFormat:@"https://support.apple.com/%@/HT204893#add", v3];
  v5 = [v1 URLWithString:v4];

  return v5;
}

+ (id)hu_learnAboutUnshareableNetworksURL
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
  v2 = NSString;
  v3 = [a1 _localeString];
  v4 = [v2 stringWithFormat:@"https://support.apple.com/%@/HT209643", v3];
  v5 = [v1 URLWithString:v4];

  return v5;
}

+ (id)hu_learnAboutNetworksRequiringProfilesURL
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
  v2 = NSString;
  v3 = [a1 _localeString];
  v4 = [v2 stringWithFormat:@"https://support.apple.com/%@/HT209643", v3];
  v5 = [v1 URLWithString:v4];

  return v5;
}

+ (uint64_t)hu_applePrivacyURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"http://www.apple.com/privacy"];
}

+ (id)hu_openiCloudPreferencesURL
{
  if ([MEMORY[0x1E4F69758] isAMac]) {
    v0 = @"x-apple.systempreferences:com.apple.preferences.AppleIDPrefPane?iCloud";
  }
  else {
    v0 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE";
  }
  uint64_t v1 = [MEMORY[0x1E4F1CB10] URLWithString:v0];

  return v1;
}

+ (uint64_t)hu_openiCloudKeychainPreferences
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync"];
}

+ (uint64_t)hu_cameraRecordingURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"cameraRecordingLearnMore"];
}

+ (uint64_t)hu_learnAboutNetworkProtectionURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/HT210544?cid=iOS_UI_HomeKit_article_HT210544"];
}

+ (uint64_t)hu_photosLibraryPeopleAlbumURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"photos://people"];
}

+ (uint64_t)hu_faceRecognitionPrivacyURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"faceRecognitionLearnMore"];
}

+ (uint64_t)hu_losslessURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/HT212183"];
}

- (uint64_t)hu_isHomeKnowledgeBasedArticleURL
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "hu_learnToAddAccessoriesURL");
  if ([a1 isEqual:v2])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "hu_learnAboutUnshareableNetworksURL");
    if ([a1 isEqual:v4])
    {
      uint64_t v3 = 1;
    }
    else
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "hu_learnAboutNetworksRequiringProfilesURL");
      if ([a1 isEqual:v5])
      {
        uint64_t v3 = 1;
      }
      else
      {
        v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "hu_learnAboutNetworkProtectionURL");
        uint64_t v3 = [a1 isEqual:v6];
      }
    }
  }
  return v3;
}

+ (id)hu_appStoreURLForBundleIdentifier:()HUAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setScheme:@"itms-apps"];
  [v5 setHost:&stru_1F18F92B8];
  v6 = [MEMORY[0x1E4F290C8] queryItemWithName:@"bundleIdentifier" value:v4];

  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 setQueryItems:v7];

  v8 = [v5 URL];

  return v8;
}

@end