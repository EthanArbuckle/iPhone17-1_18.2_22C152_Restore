@interface ENUITCCUtilities
+ (BOOL)hasExposureNotificationAppsFromTCC;
+ (BOOL)isExposureNotificationEnabledForBundleIdentifier:(id)a3;
+ (BOOL)isExposureNotificationFeatureActive;
+ (BOOL)isExposureNotificationsEnabledFromTCC;
+ (NSArray)enabledExposureNotificationApps;
+ (NSString)exposureServiceKey;
+ (__CFBundle)copyTCCBundleForBundleIdentifier:(id)a3;
+ (void)setExposureNotificationEnabled:(BOOL)a3 forBundleIdentifier:(id)a4;
@end

@implementation ENUITCCUtilities

+ (NSString)exposureServiceKey
{
  return (NSString *)kTCCServiceExposureNotification;
}

+ (BOOL)isExposureNotificationsEnabledFromTCC
{
  if (!TCCAccessGetOverride())
  {
    v2 = ENUILogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1D73C(v2);
    }
  }
  return 1;
}

+ (BOOL)hasExposureNotificationAppsFromTCC
{
  v2 = (void *)TCCAccessCopyInformation();
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (NSArray)enabledExposureNotificationApps
{
  v2 = (void *)TCCAccessCopyInformation();
  BOOL v3 = objc_msgSend(v2, "enui_filter:", &stru_2CF20);

  return (NSArray *)v3;
}

+ (BOOL)isExposureNotificationFeatureActive
{
  BOOL v3 = +[ENUITCCUtilities isExposureNotificationsEnabledFromTCC];
  v4 = [a1 enabledExposureNotificationApps];
  v5 = v4;
  if (v3) {
    LOBYTE(v3) = [v4 count] != 0;
  }

  return v3;
}

+ (BOOL)isExposureNotificationEnabledForBundleIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = (id)TCCAccessCopyInformation();
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v9 = (__CFBundle *)objc_msgSend(v8, "objectForKey:", kTCCInfoBundle, (void)v13);
          if (v9)
          {
            CFStringRef Identifier = CFBundleGetIdentifier(v9);
            if (CFEqual(v3, Identifier))
            {
              v11 = [v8 objectForKey:kTCCInfoGranted];
              LOBYTE(v5) = [v11 BOOLValue];

              goto LABEL_14;
            }
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

+ (void)setExposureNotificationEnabled:(BOOL)a3 forBundleIdentifier:(id)a4
{
  id v4 = [a1 copyTCCBundleForBundleIdentifier:a4];
  if (v4)
  {
    id v5 = v4;
    TCCAccessSetForBundle();
    CFRelease(v5);
  }
}

+ (__CFBundle)copyTCCBundleForBundleIdentifier:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)TCCAccessCopyInformation();
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (__CFBundle *)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v8), "objectForKey:", kTCCInfoBundle, (void)v13);
        if (v9)
        {
          v10 = v9;
          CFStringRef Identifier = CFBundleGetIdentifier(v9);
          if (CFEqual(v3, Identifier))
          {
            CFRetain(v10);
            goto LABEL_12;
          }
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

@end