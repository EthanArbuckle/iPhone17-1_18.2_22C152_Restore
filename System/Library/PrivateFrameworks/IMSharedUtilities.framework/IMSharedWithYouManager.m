@interface IMSharedWithYouManager
+ (BOOL)_isBundleIDAllowed:(id)a3;
+ (id)_hiddenBundleIDs;
+ (id)appBundleIDsFromDefaults;
+ (id)collaborationAppBundleIDs;
+ (id)onboardingAppBundleIDs;
+ (id)sharedManager;
+ (id)tvAppBundleID;
+ (id)wolfHiddenSWYUIBundleIDs;
- (BOOL)defaultCollaborationAppsEnabled;
- (BOOL)isDataDetectedLinkAllowedForSWY:(id)a3;
- (BOOL)isSharedWithYouEnabled;
- (BOOL)isSharedWithYouEnabledForApplicationWithBundleID:(id)a3;
- (BOOL)isSharedWithYouSetUpForApplicationWithBundleID:(id)a3;
- (BOOL)sharedWithYouKeyExists;
- (BOOL)showPinningStatusTextForBundleID:(id)a3;
- (IMSharedWithYouManager)init;
- (LSApplicationWorkspace)_applicationWorkspace;
- (NSArray)sharedWithYouApplicationBundleIDs;
- (NSMutableDictionary)swyPinsPerBundleID;
- (NSNumber)cachedSharedWithYouEnabledValue;
- (NSSet)enabledBundleIDs;
- (id)_installedLSAppRecordFromBundleIDs:(id)a3;
- (id)_supportedDataDetectedURLSchemes;
- (id)appNameFromSharingURL:(id)a3;
- (id)appStoreIDFromSharingURL:(id)a3;
- (id)appStoreURLFromSharingURL:(id)a3;
- (id)defaultAppBundleIDs;
- (id)enabledApps;
- (id)lsAppRecordForAppStoreShareURL:(id)a3;
- (id)lsAppRecordForShareBearURL:(id)a3;
- (id)lsAppRecordForURL:(id)a3;
- (id)lsAppRecordForURL:(id)a3 checkInstalledAppsOnly:(BOOL)a4;
- (id)sharedWithYouApps;
- (id)swyPublicEntitlementAppBundleIDs;
- (id)urlMinusFragment:(id)a3 onlyCKURL:(BOOL)a4;
- (int)settingHasChangedNotificationToken;
- (int64_t)getPinCountForBundleID:(id)a3;
- (void)appNameAndBundleIDFoURL:(id)a3 outAppName:(id *)a4 outBundleID:(id *)a5;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)decrementPinCountForBundleID:(id)a3;
- (void)deleteSharedWithYouPreferences;
- (void)incrementPinCountForBundleID:(id)a3;
- (void)setCachedSharedWithYouEnabledValue:(id)a3;
- (void)setEnabledBundleIDs:(id)a3;
- (void)setSettingHasChangedNotificationToken:(int)a3;
- (void)setSharedWithYouEnabled:(BOOL)a3;
- (void)setSharedWithYouEnabled:(BOOL)a3 forApplicationWithBundleID:(id)a4;
- (void)setSharedWithYouEnabledForAllApplicationsIndividually:(BOOL)a3;
- (void)setSwyPinsPerBundleID:(id)a3;
- (void)updateEnabledApps;
@end

@implementation IMSharedWithYouManager

- (BOOL)defaultCollaborationAppsEnabled
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = +[IMSharedWithYouManager collaborationAppBundleIDs];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    char v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        if (v6)
        {
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          v9 = +[IMSharedWithYouManager sharedManager];
          char v6 = [v9 isSharedWithYouEnabledForApplicationWithBundleID:v8];
        }
        else
        {
          char v6 = 0;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isSharedWithYouEnabledForApplicationWithBundleID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(IMSharedWithYouManager *)self isSharedWithYouEnabled])
  {
    if (![v4 length] && IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Invalid bundleID:%@", (uint8_t *)&v12, 0xCu);
      }
    }
    char v6 = (void *)CFPreferencesCopyAppValue(@"SharedWithYouApps", @"com.apple.SocialLayer");
    v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 objectForKey:v4];

      if (v8)
      {
        v9 = [v7 objectForKey:v4];
        LOBYTE(v8) = [v9 BOOLValue];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v12 = 138412290;
          id v13 = v4;
          _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Failed to find bundleID:%@ in the SharedWithYouApp's", (uint8_t *)&v12, 0xCu);
        }
      }
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

- (BOOL)isSharedWithYouEnabled
{
  BOOL v3 = +[IMDeviceUtilities supportsSharedWithYou];
  if (v3)
  {
    if (IMIsRunningInUnitTesting())
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      id v4 = [(IMSharedWithYouManager *)self cachedSharedWithYouEnabledValue];
      char v5 = [v4 BOOLValue];

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (NSNumber)cachedSharedWithYouEnabledValue
{
  cachedSharedWithYouEnabledValue = self->_cachedSharedWithYouEnabledValue;
  if (!cachedSharedWithYouEnabledValue)
  {
    id v4 = (void *)CFPreferencesCopyAppValue(@"SharedWithYouEnabled", @"com.apple.SocialLayer");
    char v5 = (NSNumber *)[v4 copy];
    char v6 = self->_cachedSharedWithYouEnabledValue;
    self->_cachedSharedWithYouEnabledValue = v5;

    cachedSharedWithYouEnabledValue = self->_cachedSharedWithYouEnabledValue;
  }

  return cachedSharedWithYouEnabledValue;
}

+ (id)sharedManager
{
  if (qword_1EB4A61F0 != -1) {
    dispatch_once(&qword_1EB4A61F0, &unk_1EF2BF620);
  }
  v2 = (void *)qword_1EB4A6218;

  return v2;
}

+ (id)collaborationAppBundleIDs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObjectsFromArray:&unk_1EF305BB0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend((id)objc_opt_class(), "_isBundleIDAllowed:", v9, (void)v11)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)_isBundleIDAllowed:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    id v22 = 0;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v22];
    id v5 = v22;
    uint64_t v6 = [v4 applicationState];
    int v7 = [v6 isRestricted];

    uint64_t v8 = [(id)objc_opt_class() tvAppBundleID];
    LODWORD(v6) = [v3 isEqualToString:v8];

    if (v6)
    {
      if (qword_1EB4A5DC8 != -1) {
        dispatch_once(&qword_1EB4A5DC8, &unk_1EF2BE278);
      }
      if (!qword_1EB4A5DC0 && IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Unable to weaklink WLKURLBagUtilities", buf, 2u);
        }
      }
      v10 = [(id)qword_1EB4A5DC0 isFullTVAppEnabledCachedValue];
      if (IMOSLoggingEnabled())
      {
        long long v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v10;
          _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "isFullTVAppEnabledCachedValue %@", buf, 0xCu);
        }
      }
      if (v10) {
        int v12 = [v10 BOOLValue];
      }
      else {
        int v12 = 1;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = @"NO";
          if (v7) {
            v18 = @"YES";
          }
          else {
            v18 = @"NO";
          }
          *(_DWORD *)buf = 138412802;
          id v24 = v3;
          v26 = v18;
          __int16 v25 = 2112;
          if (v12) {
            v17 = @"YES";
          }
          __int16 v27 = 2112;
          v28 = v17;
          _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "BundleID Allowed check for bundle ID %@ isAppRestricted %@ isFullTVAppEnabled %@", buf, 0x20u);
        }
      }
      char v13 = v12 & ~(_BYTE)v7;
    }
    else
    {
      char v13 = v7 ^ 1;
      if (IMOSLoggingEnabled())
      {
        long long v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = @"NO";
          if (v7) {
            v15 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          id v24 = v3;
          __int16 v25 = 2112;
          v26 = v15;
          _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "BundleID Allowed check for bundle ID %@ isAppRestricted %@", buf, 0x16u);
        }
      }
    }
    if (v5)
    {
      if (IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = [v5 localizedDescription];
          *(_DWORD *)buf = 138412546;
          id v24 = v3;
          __int16 v25 = 2112;
          v26 = v20;
          _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Failed to create the Application record for bundle: %@. Error: %@", buf, 0x16u);
        }
      }
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

+ (id)tvAppBundleID
{
  return @"com.apple.tv";
}

- (void)updateEnabledApps
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  [v3 setFilter:&unk_1EF2BE238];
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "bundleIdentifier", (void)v13);
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  long long v11 = [(IMSharedWithYouManager *)self enabledBundleIDs];
  char v12 = [v4 isEqualToSet:v11];

  if ((v12 & 1) == 0) {
    [(IMSharedWithYouManager *)self setEnabledBundleIDs:v4];
  }
}

- (BOOL)sharedWithYouKeyExists
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(@"SharedWithYouEnabled", @"com.apple.SocialLayer", &keyExistsAndHasValidFormat);
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      if (keyExistsAndHasValidFormat) {
        id v3 = @"Yes";
      }
      else {
        id v3 = @"No";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = v3;
      _os_log_impl(&dword_1A0772000, v2, OS_LOG_TYPE_INFO, "SharedWithYouKeyExists = %@ for", buf, 0xCu);
    }
  }
  return keyExistsAndHasValidFormat != 0;
}

- (void)setEnabledBundleIDs:(id)a3
{
}

- (IMSharedWithYouManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)IMSharedWithYouManager;
  v2 = [(IMSharedWithYouManager *)&v20 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
    id v4 = [v3 objectForKey:@"SharedWithYouPinsCache"];
    uint64_t v5 = [v4 mutableCopy];
    swyPinsPerBundleID = v2->_swyPinsPerBundleID;
    v2->_swyPinsPerBundleID = (NSMutableDictionary *)v5;

    if (!v2->_swyPinsPerBundleID)
    {
      uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = v2->_swyPinsPerBundleID;
      v2->_swyPinsPerBundleID = v7;
    }
    id location = 0;
    objc_initWeak(&location, v2);
    uint64_t v9 = (const char *)[@"SLSharedWithYouSettingHasChanged" UTF8String];
    v10 = MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    long long v16 = sub_1A080B080;
    v17 = &unk_1E5A12960;
    objc_copyWeak(&v18, &location);
    notify_register_dispatch(v9, &v2->_settingHasChangedNotificationToken, v10, &v14);

    char v12 = [(IMSharedWithYouManager *)v2 _applicationWorkspace];
    [v12 addObserver:v2];

    [(IMSharedWithYouManager *)v2 updateEnabledApps];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (NSSet)enabledBundleIDs
{
  return self->_enabledBundleIDs;
}

- (LSApplicationWorkspace)_applicationWorkspace
{
  return (LSApplicationWorkspace *)[MEMORY[0x1E4F223E0] defaultWorkspace];
}

- (void)dealloc
{
  notify_cancel(self->_settingHasChangedNotificationToken);
  id v3 = [(IMSharedWithYouManager *)self _applicationWorkspace];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
  uint64_t v5 = [(IMSharedWithYouManager *)self swyPinsPerBundleID];
  [v4 setObject:v5 forKey:@"SharedWithYouPinsCache"];

  v6.receiver = self;
  v6.super_class = (Class)IMSharedWithYouManager;
  [(IMSharedWithYouManager *)&v6 dealloc];
}

- (void)setSharedWithYouEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  CFPreferencesSetAppValue(@"SharedWithYouEnabled", (CFPropertyListRef)objc_msgSend(NSNumber, "numberWithBool:"), @"com.apple.SocialLayer");
  CFPreferencesAppSynchronize(@"com.apple.SocialLayer");
  uint64_t v5 = [NSNumber numberWithBool:v3];
  [(IMSharedWithYouManager *)self setCachedSharedWithYouEnabledValue:v5];

  objc_super v6 = (const char *)[@"SLSharedWithYouSettingHasChanged" UTF8String];

  notify_post(v6);
}

- (BOOL)isSharedWithYouSetUpForApplicationWithBundleID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(IMSharedWithYouManager *)self isSharedWithYouEnabled])
  {
    if (![v4 length] && IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Invalid bundleID: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    objc_super v6 = (void *)CFPreferencesCopyAppValue(@"SharedWithYouApps", @"com.apple.SocialLayer");
    uint64_t v7 = [v6 objectForKey:v4];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)onboardingAppBundleIDs
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [&unk_1EF305B98 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(&unk_1EF305B98);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        if ([(id)objc_opt_class() _isBundleIDAllowed:v7]) {
          [v2 addObject:v7];
        }
      }
      uint64_t v4 = [&unk_1EF305B98 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return v2;
}

- (id)defaultAppBundleIDs
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(id)objc_opt_class() onboardingAppBundleIDs];
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = [(id)objc_opt_class() collaborationAppBundleIDs];
  [v3 addObjectsFromArray:v5];

  objc_super v6 = [MEMORY[0x1E4F1CA80] setWithArray:v3];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA80];
  BOOL v8 = +[IMSharedWithYouManager sharedManager];
  long long v9 = [v8 sharedWithYouApplicationBundleIDs];
  long long v10 = [v7 setWithArray:v9];

  [v10 minusSet:v6];
  long long v11 = [(IMSharedWithYouManager *)self swyPublicEntitlementAppBundleIDs];
  if ([v11 count]) {
    [v3 addObjectsFromArray:v11];
  }
  long long v12 = [v10 allObjects];
  [v3 addObjectsFromArray:v12];

  long long v13 = +[IMSharedWithYouManager _hiddenBundleIDs];
  [v3 removeObjectsInArray:v13];

  return v3;
}

+ (id)_hiddenBundleIDs
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1EF305BC8];
  [v2 addObjectsFromArray:&unk_1EF305BE0];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

+ (id)wolfHiddenSWYUIBundleIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)enabledApps
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(IMSharedWithYouManager *)self enabledBundleIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * i) allowPlaceholder:0 error:0];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)swyPublicEntitlementAppBundleIDs
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v26 = [MEMORY[0x1E4F1CA48] array];
  [(IMSharedWithYouManager *)self enabledApps];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v28;
    *(void *)&long long v5 = 138412290;
    long long v25 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v9 = objc_msgSend(v8, "applicationState", v25);
        char v10 = [v9 isRestricted];

        if (v10)
        {
          if (!IMOSLoggingEnabled()) {
            continue;
          }
          long long v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            long long v12 = [v8 bundleIdentifier];
            long long v13 = [v8 applicationState];
            int v14 = [v13 isRestricted];
            *(_DWORD *)buf = 138412546;
            uint64_t v15 = @"NO";
            if (v14) {
              uint64_t v15 = @"YES";
            }
            v32 = v12;
            __int16 v33 = 2112;
            v34 = v15;
            _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Not including bundleID %@ since isAppRestricted %@", buf, 0x16u);
          }
          goto LABEL_12;
        }
        uint64_t v16 = +[IMSharedWithYouManager _hiddenBundleIDs];
        v17 = [v8 bundleIdentifier];
        if ([v16 containsObject:v17])
        {
        }
        else
        {
          id v18 = +[IMSharedWithYouManager collaborationAppBundleIDs];
          v19 = [v8 bundleIdentifier];
          char v20 = [v18 containsObject:v19];

          if ((v20 & 1) == 0)
          {
            id v22 = [v8 bundleIdentifier];
            [v26 addObject:v22];

            continue;
          }
        }
        if (IMOSLoggingEnabled())
        {
          long long v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v21 = [v8 bundleIdentifier];
            *(_DWORD *)buf = v25;
            v32 = v21;
            _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Not including bundleID %@ since its to be hidden or is a default collaboration app", buf, 0xCu);
          }
LABEL_12:

          continue;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v4);
  }

  v23 = (void *)[v26 copy];

  return v23;
}

+ (id)appBundleIDsFromDefaults
{
  v2 = (void *)CFPreferencesCopyAppValue(@"SharedWithYouApps", @"com.apple.SocialLayer");
  id v3 = [v2 allKeys];

  return v3;
}

- (id)sharedWithYouApps
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(IMSharedWithYouManager *)self defaultAppBundleIDs];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v8 = objc_alloc(MEMORY[0x1E4F223C8]);
        id v17 = 0;
        long long v9 = (void *)[v8 initWithBundleIdentifier:v7 allowPlaceholder:0 error:&v17];
        id v10 = v17;
        if (v10)
        {
          if (IMOSLoggingEnabled())
          {
            long long v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              long long v12 = [v10 localizedDescription];
              *(_DWORD *)buf = 138412546;
              uint64_t v23 = v7;
              __int16 v24 = 2112;
              long long v25 = v12;
              _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Failed to create an Application record for bundle: %@. Error: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          long long v13 = [v9 localizedName];
          [v16 setValue:v7 forKey:v13];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v4);
  }

  int v14 = (void *)[v16 copy];

  return v14;
}

- (NSArray)sharedWithYouApplicationBundleIDs
{
  v2 = (void *)CFPreferencesCopyAppValue(@"SharedWithYouApps", @"com.apple.SocialLayer");
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 allKeys];
    uint64_t v5 = (void *)[v4 mutableCopy];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v12 = 0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "No apps found in SharedWithYouApp's", v12, 2u);
      }
    }
    uint64_t v5 = 0;
  }
  uint64_t v7 = +[IMSharedWithYouManager _hiddenBundleIDs];
  [v5 removeObjectsInArray:v7];

  id v8 = (void *)[v5 copy];
  long long v9 = v8;
  if (!v8) {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v8;

  return v10;
}

- (void)setSharedWithYouEnabled:(BOOL)a3 forApplicationWithBundleID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (![v5 length] && IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Invalid bundleID:%@", (uint8_t *)&v14, 0xCu);
    }
  }
  uint64_t v7 = (void *)CFPreferencesCopyAppValue(@"SharedWithYouApps", @"com.apple.SocialLayer");
  id v8 = v7;
  if (v7)
  {
    long long v9 = (void *)[v7 mutableCopy];
  }
  else
  {
    long long v9 = [MEMORY[0x1E4F1CA60] dictionary];
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v5;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Adding bundleID:%@ to the Shared With You Preferences", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = @"No";
      if (v4) {
        long long v12 = @"Yes";
      }
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Setting bundleID:%@ to enabled:%@ in SharedWithYouApp Preferences", (uint8_t *)&v14, 0x16u);
    }
  }
  long long v13 = [NSNumber numberWithBool:v4];
  [v9 setObject:v13 forKey:v5];

  CFPreferencesSetAppValue(@"SharedWithYouApps", v9, @"com.apple.SocialLayer");
  CFPreferencesAppSynchronize(@"com.apple.SocialLayer");
  notify_post((const char *)[@"SLSharedWithYouAppSettingHasChanged" UTF8String]);
}

- (void)setSharedWithYouEnabledForAllApplicationsIndividually:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(IMSharedWithYouManager *)self sharedWithYouApplicationBundleIDs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(IMSharedWithYouManager *)self setSharedWithYouEnabled:v3 forApplicationWithBundleID:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)showPinningStatusTextForBundleID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 length])
  {
    if (IMOSLoggingEnabled())
    {
      long long v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "nil bundleID passed in. bundleID:%@", (uint8_t *)&v12, 0xCu);
      }
    }
    goto LABEL_8;
  }
  id v5 = [(IMSharedWithYouManager *)self swyPublicEntitlementAppBundleIDs];
  int v6 = [v5 containsObject:v4];

  if (!v6)
  {
LABEL_8:
    char v9 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = +[IMSharedWithYouManager sharedManager];
  char v8 = [v7 isSharedWithYouEnabledForApplicationWithBundleID:v4];

  char v9 = v8 ^ 1;
LABEL_9:

  return v9;
}

- (void)appNameAndBundleIDFoURL:(id)a3 outAppName:(id *)a4 outBundleID:(id *)a5
{
  id v8 = a3;
  if (v8)
  {
    char v9 = [(IMSharedWithYouManager *)self lsAppRecordForURL:v8 checkInstalledAppsOnly:1];
    long long v10 = [v9 bundleIdentifier];

    if (!v10) {
      goto LABEL_23;
    }
    long long v11 = [v9 bundleIdentifier];
    BOOL v12 = [(IMSharedWithYouManager *)self showPinningStatusTextForBundleID:v11];

    if (!v12) {
      goto LABEL_23;
    }
    id v13 = [v9 localizedName];
    uint64_t v14 = [v9 bundleIdentifier];
    if (a4 && v13)
    {
      *a4 = v13;
      if (!a5) {
        goto LABEL_18;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v18 = 0;
          _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Failed to get App Name for URL", v18, 2u);
        }
      }
      if (!a5) {
        goto LABEL_18;
      }
    }
    if (v14)
    {
      *a5 = v14;
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
LABEL_18:
    if (IMOSLoggingEnabled())
    {
      __int16 v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v17 = 0;
        _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Failed to get Bundle ID for URL", v17, 2u);
      }
    }
    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    char v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Invalid URL passed in to add lookup name and bundleID", buf, 2u);
    }
    goto LABEL_23;
  }
LABEL_24:
}

- (id)lsAppRecordForURL:(id)a3
{
  return [(IMSharedWithYouManager *)self lsAppRecordForURL:a3 checkInstalledAppsOnly:0];
}

- (id)lsAppRecordForURL:(id)a3 checkInstalledAppsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    long long v19 = 0;
    goto LABEL_25;
  }
  id v25 = 0;
  uint64_t v7 = [MEMORY[0x1E4F22398] appLinksWithURL:v6 limit:1 includeLinksForCurrentApplication:1 error:&v25];
  id v8 = v25;
  if (!v7 && IMOSLoggingEnabled())
  {
    char v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "LSAppLink URL query error: %@", buf, 0xCu);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (!v11)
  {
    long long v19 = 0;
    BOOL v12 = v10;
    goto LABEL_23;
  }
  BOOL v12 = 0;
  uint64_t v13 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      if (objc_msgSend(v15, "isEnabled", (void)v21))
      {
        uint64_t v16 = [v15 targetApplicationRecord];

        BOOL v12 = (void *)v16;
      }
    }
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
  }
  while (v11);

  if (v4)
  {
    if (v12)
    {
      id v17 = [v12 bundleIdentifier];
      int v18 = [v17 isEqualToString:@"com.apple.CloudKit.ShareBear"];

      if (v18)
      {
        long long v19 = [(IMSharedWithYouManager *)self lsAppRecordForShareBearURL:v6];
LABEL_23:

        goto LABEL_24;
      }
    }
  }
  long long v19 = v12;
LABEL_24:

LABEL_25:

  return v19;
}

- (id)_installedLSAppRecordFromBundleIDs:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v10 = objc_alloc(MEMORY[0x1E4F223C8]);
          uint64_t v11 = objc_msgSend(v10, "initWithBundleIdentifier:allowPlaceholder:error:", v9, 0, 0, (void)v19);

          id v5 = v11;
          BOOL v12 = [v11 applicationState];
          if ([v12 isInstalled])
          {
            uint64_t v13 = [v5 URL];
            BOOL v14 = v13 == 0;

            if (!v14)
            {
              if (IMOSLoggingEnabled())
              {
                id v17 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v24 = v9;
                  _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Found LSAppRecord for bundleID: %@", buf, 0xCu);
                }
              }
              goto LABEL_23;
            }
          }
          else
          {
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_23:
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "no bundleIDs passed in", buf, 2u);
      }
    }
    id v5 = 0;
  }

  return v5;
}

- (id)lsAppRecordForShareBearURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(IMSyndicationUtilities);
  uint64_t v6 = [(IMSyndicationUtilities *)v5 bundleIDsForShareBearURL:v4];

  uint64_t v7 = [(IMSharedWithYouManager *)self _installedLSAppRecordFromBundleIDs:v6];

  return v7;
}

- (void)incrementPinCountForBundleID:(id)a3
{
  id v12 = a3;
  if ([v12 length])
  {
    id v4 = [(IMSharedWithYouManager *)self swyPinsPerBundleID];
    id v5 = [v4 objectForKey:v12];
    uint64_t v6 = [v5 integerValue];

    uint64_t v7 = [(IMSharedWithYouManager *)self swyPinsPerBundleID];
    id v8 = [NSNumber numberWithInteger:v6 + 1];
    [v7 setObject:v8 forKey:v12];

    uint64_t v9 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
    id v10 = [(IMSharedWithYouManager *)self swyPinsPerBundleID];
    [v9 setObject:v10 forKey:@"SharedWithYouPinsCache"];

    uint64_t v11 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
    [v11 synchronize];
  }
}

- (void)decrementPinCountForBundleID:(id)a3
{
  id v14 = a3;
  if ([v14 length])
  {
    id v4 = [(IMSharedWithYouManager *)self swyPinsPerBundleID];
    id v5 = [v4 objectForKey:v14];
    uint64_t v6 = [v5 integerValue];

    uint64_t v7 = v6 - (v6 > 0);
    id v8 = [(IMSharedWithYouManager *)self swyPinsPerBundleID];
    uint64_t v9 = v8;
    if (v7 <= 0)
    {
      [v8 removeObjectForKey:v14];
    }
    else
    {
      id v10 = [NSNumber numberWithInteger:v7];
      [v9 setObject:v10 forKey:v14];
    }
    uint64_t v11 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
    id v12 = [(IMSharedWithYouManager *)self swyPinsPerBundleID];
    [v11 setObject:v12 forKey:@"SharedWithYouPinsCache"];

    uint64_t v13 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
    [v13 synchronize];
  }
}

- (int64_t)getPinCountForBundleID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(IMSharedWithYouManager *)self swyPinsPerBundleID];
    uint64_t v6 = [v5 objectForKey:v4];
    int64_t v7 = [v6 integerValue];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)deleteSharedWithYouPreferences
{
  CFPreferencesSetAppValue(@"SharedWithYouApps", 0, @"com.apple.SocialLayer");
  CFPreferencesSetAppValue(@"SharedWithYouEnabled", 0, @"com.apple.SocialLayer");
  CFPreferencesAppSynchronize(@"com.apple.SocialLayer");
  v2 = (const char *)[@"SLSharedWithYouAppSettingHasChanged" UTF8String];

  notify_post(v2);
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "-[IMSharedWithYouManager applicationInstallsDidInstall:%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  [(IMSharedWithYouManager *)self updateEnabledApps];
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "-[IMSharedWithYouManager applicationsDidUninstall:%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  [(IMSharedWithYouManager *)self updateEnabledApps];
}

- (id)lsAppRecordForAppStoreShareURL:(id)a3
{
  id v4 = a3;
  id v5 = [(IMSharedWithYouManager *)self lsAppRecordForURL:v4 checkInstalledAppsOnly:0];
  if (v5)
  {
    int v6 = v5;
    id v7 = [v5 bundleIdentifier];
    int v8 = [v7 isEqualToString:@"com.apple.CloudKit.ShareBear"];

    if (v8)
    {
      uint64_t v9 = +[IMSharedWithYouManager sharedManager];
      uint64_t v10 = [v9 lsAppRecordForShareBearURL:v4];

      int v6 = (void *)v10;
    }
  }
  else
  {
    uint64_t v11 = IMLogHandleForCategory("IMSharedWithYouManager");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1A09F0B44();
    }

    int v6 = 0;
  }

  return v6;
}

- (id)appStoreIDFromSharingURL:(id)a3
{
  if (a3)
  {
    id v3 = -[IMSharedWithYouManager lsAppRecordForAppStoreShareURL:](self, "lsAppRecordForAppStoreShareURL:");
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 iTunesMetadata];
      int v6 = v5;
      if (v5)
      {
        if ([v5 storeItemIdentifier])
        {
          id v7 = objc_msgSend(NSString, "stringWithFormat:", @"id%ld", -[NSObject storeItemIdentifier](v6, "storeItemIdentifier"));
LABEL_17:

          goto LABEL_18;
        }
        int v8 = IMLogHandleForCategory("IMSharedWithYouManager");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1A09F0C14();
        }
      }
      else
      {
        int v8 = IMLogHandleForCategory("IMSharedWithYouManager");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1A09F0BE0();
        }
      }
    }
    else
    {
      int v6 = IMLogHandleForCategory("IMSharedWithYouManager");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1A09F0BAC();
      }
    }
    id v7 = 0;
    goto LABEL_17;
  }
  id v4 = IMLogHandleForCategory("IMSharedWithYouManager");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1A09F0B78();
  }
  id v7 = 0;
LABEL_18:

  return v7;
}

- (id)appNameFromSharingURL:(id)a3
{
  if (a3)
  {
    id v3 = -[IMSharedWithYouManager lsAppRecordForAppStoreShareURL:](self, "lsAppRecordForAppStoreShareURL:");
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 localizedName];
      if (v5) {
        goto LABEL_13;
      }
      int v6 = IMLogHandleForCategory("IMSharedWithYouManager");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1A09F0C7C();
      }
    }
    else
    {
      int v6 = IMLogHandleForCategory("IMSharedWithYouManager");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1A09F0BAC();
      }
      id v5 = 0;
    }
  }
  else
  {
    id v4 = IMLogHandleForCategory("IMSharedWithYouManager");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1A09F0C48();
    }
    id v5 = 0;
  }
LABEL_13:

  return v5;
}

- (id)appStoreURLFromSharingURL:(id)a3
{
  id v4 = a3;
  id v5 = [(IMSharedWithYouManager *)self appNameFromSharingURL:v4];
  int v6 = [(IMSharedWithYouManager *)self appStoreIDFromSharingURL:v4];

  if (v5 && v6)
  {
    uint64_t v7 = [v5 lowercaseString];

    int v8 = [NSString stringWithFormat:@"https://apps.apple.com/us/app/%@/%@", v7, v6];
    uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];

    id v5 = (void *)v7;
  }
  else
  {
    uint64_t v10 = IMLogHandleForCategory("IMSharedWithYouManager");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1A09F0CB0();
    }

    uint64_t v9 = 0;
  }

  return v9;
}

- (id)urlMinusFragment:(id)a3 onlyCKURL:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  if (v4)
  {
    int v6 = +[IMSharedWithYouManager sharedManager];
    uint64_t v7 = [v6 lsAppRecordForURL:v5 checkInstalledAppsOnly:0];
    if (!v7)
    {
      uint64_t v11 = v5;
      goto LABEL_8;
    }
    int v8 = v7;
    uint64_t v9 = [v7 applicationIdentifier];
    int v10 = [v9 isEqualToString:@"com.apple.CloudKit.ShareBear"];

    uint64_t v11 = v5;
    if (!v10) {
      goto LABEL_9;
    }
  }
  int v6 = [v5 absoluteString];
  id v12 = [v6 componentsSeparatedByString:@"#"];
  uint64_t v13 = (void *)MEMORY[0x1E4F1CB10];
  id v14 = [v12 firstObject];
  uint64_t v11 = [v13 URLWithString:v14];

LABEL_8:
LABEL_9:

  return v11;
}

- (id)_supportedDataDetectedURLSchemes
{
  return &unk_1EF305BF8;
}

- (BOOL)isDataDetectedLinkAllowedForSWY:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [(IMSharedWithYouManager *)self _supportedDataDetectedURLSchemes];
    char v6 = 0;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = [v4 scheme];
          LOBYTE(v10) = [v11 isEqualToString:v10];

          v6 |= v10;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v7);
    }

    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = @"NO";
        if (v6) {
          uint64_t v13 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        long long v20 = v13;
        _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "shouldDonate: %@ URL", buf, 0xCu);
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (int)settingHasChangedNotificationToken
{
  return self->_settingHasChangedNotificationToken;
}

- (void)setSettingHasChangedNotificationToken:(int)a3
{
  self->_settingHasChangedNotificationToken = a3;
}

- (void)setCachedSharedWithYouEnabledValue:(id)a3
{
}

- (NSMutableDictionary)swyPinsPerBundleID
{
  return self->_swyPinsPerBundleID;
}

- (void)setSwyPinsPerBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledBundleIDs, 0);
  objc_storeStrong((id *)&self->_swyPinsPerBundleID, 0);

  objc_storeStrong((id *)&self->_cachedSharedWithYouEnabledValue, 0);
}

@end