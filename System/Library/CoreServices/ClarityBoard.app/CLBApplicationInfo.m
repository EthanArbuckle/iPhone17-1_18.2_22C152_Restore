@interface CLBApplicationInfo
+ (BOOL)isCarrierInstall;
+ (BOOL)isInternalInstall;
+ (id)deviceClass;
+ (id)disallowedBundleIdentifiers;
- (BOOL)alwaysLaunchesInBackground;
- (BOOL)canBeLaunched;
- (BOOL)canShowBadge;
- (BOOL)isAppRestricted;
- (BOOL)isArcadeApp;
- (BOOL)isDeletable;
- (BOOL)isHidden;
- (BOOL)isHiddenByUser;
- (BOOL)isThirdPartyApp;
- (BOOL)isUnavailable;
- (BOOL)isUpdatingIcon;
- (BOOL)needsIconImageUpdate;
- (BOOL)requiresPreflight;
- (BOOL)shouldShield;
- (BOOL)shouldSkipCheckingDataStore;
- (BOOL)supportsClarityUI;
- (BOOL)wantsFullScreenInClarityUI;
- (FBSApplicationDataStore)dataStore;
- (NSHashTable)badgeStringObservers;
- (NSHashTable)iconImageObservers;
- (NSString)badgeString;
- (NSString)clarityDisplayName;
- (NSString)defaultSceneIdentifier;
- (NSString)localizedName;
- (NSString)userInterfaceStyle;
- (UIImage)iconImage;
- (id)_iconCache;
- (id)_iconKey;
- (id)_weakPointersHashTable;
- (id)badgeValue;
- (int64_t)_visibilityOverrideForProxy:(id)a3;
- (int64_t)displayStyle;
- (void)_fetchHighResIconWithCompletion:(id)a3;
- (void)_fetchIconServicesIconWithScreenScale:(double)a3 completion:(id)a4;
- (void)_loadFromProxy:(id)a3;
- (void)_notifyObserversOfBadgeStringChange;
- (void)_notifyObserversOfIconImageChange;
- (void)_significantTimeChangeOccurred:(id)a3;
- (void)_updateIcon;
- (void)addBadgeStringObserver:(id)a3;
- (void)addIconImageObserver:(id)a3;
- (void)handleFirstUnlockIfNeeded;
- (void)removeBadgeStringObserver:(id)a3;
- (void)removeIconImageObserver:(id)a3;
- (void)setBadgeStringObservers:(id)a3;
- (void)setBadgeValue:(id)a3;
- (void)setCanShowBadge:(BOOL)a3;
- (void)setClarityDisplayName:(id)a3;
- (void)setIconImageObservers:(id)a3;
- (void)setIsUpdatingIcon:(BOOL)a3;
- (void)setNeedsIconImageUpdate;
- (void)setNeedsIconImageUpdate:(BOOL)a3;
- (void)setShouldShield:(BOOL)a3;
- (void)setShouldSkipCheckingDataStore:(BOOL)a3;
@end

@implementation CLBApplicationInfo

+ (BOOL)isInternalInstall
{
  if (qword_100181070 != -1) {
    dispatch_once(&qword_100181070, &stru_10015CA30);
  }
  return byte_100181068;
}

+ (BOOL)isCarrierInstall
{
  if (qword_100181080 != -1) {
    dispatch_once(&qword_100181080, &stru_10015CA50);
  }
  return byte_100181078;
}

+ (id)deviceClass
{
  if (qword_100181090 != -1) {
    dispatch_once(&qword_100181090, &stru_10015CA70);
  }
  v2 = (void *)qword_100181088;

  return v2;
}

+ (id)disallowedBundleIdentifiers
{
  if (qword_1001810A0 != -1) {
    dispatch_once(&qword_1001810A0, &stru_10015CA90);
  }
  v2 = (void *)qword_100181098;

  return v2;
}

- (int64_t)displayStyle
{
  return !self->_supportsClarityUI && !self->_wantsFullScreenInClarityUI;
}

- (NSString)localizedName
{
  v3 = [(CLBApplicationInfo *)self clarityDisplayName];
  id v4 = [v3 length];

  if (v4)
  {
    v5 = [(CLBApplicationInfo *)self clarityDisplayName];
  }
  else
  {
    id v6 = objc_alloc((Class)LSApplicationRecord);
    v7 = [(CLBApplicationInfo *)self bundleIdentifier];
    id v12 = 0;
    id v8 = [v6 initWithBundleIdentifier:v7 allowPlaceholder:1 error:&v12];
    id v9 = v12;

    if (v9)
    {
      v10 = +[CLFLog commonLog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001001D4(v9, v10);
      }

      v5 = &stru_100167328;
    }
    else
    {
      v5 = [v8 localizedName];
    }
  }

  return (NSString *)v5;
}

- (BOOL)requiresPreflight
{
  v3 = +[CLFAppAvailabilityChecker sharedInstance];
  id v4 = [(CLBApplicationInfo *)self bundleIdentifier];
  unsigned __int8 v5 = [v3 requiresPreflightForBundleIdentifier:v4];

  return v5;
}

- (BOOL)isHiddenByUser
{
  v3 = +[CLFAppAvailabilityChecker sharedInstance];
  id v4 = [(CLBApplicationInfo *)self bundleIdentifier];
  unsigned __int8 v5 = [v3 isHiddenByUserForBundleIdentifier:v4];

  return v5;
}

- (BOOL)isUnavailable
{
  v3 = +[CLFAppAvailabilityChecker sharedInstance];
  id v4 = [(CLBApplicationInfo *)self bundleIdentifier];
  char v5 = [v3 isAppAvailableForBundleIdentifier:v4] ^ 1;

  return v5;
}

- (BOOL)isAppRestricted
{
  v3 = [(CLBApplicationInfo *)self bundleIdentifier];
  unsigned int v4 = [v3 isEqualToString:AX_ClarityCameraBundleName];

  if (v4)
  {
    char v5 = (id *)&AX_CameraBundleName;
LABEL_5:
    id v8 = *v5;
    goto LABEL_7;
  }
  id v6 = [(CLBApplicationInfo *)self bundleIdentifier];
  unsigned int v7 = [v6 isEqualToString:AX_ClarityPhotosBundleName];

  if (v7)
  {
    char v5 = (id *)&AX_PhotosBundleName;
    goto LABEL_5;
  }
  id v8 = [(CLBApplicationInfo *)self bundleIdentifier];
LABEL_7:
  id v9 = v8;
  id v15 = 0;
  id v10 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v8 allowPlaceholder:1 error:&v15];
  id v11 = v15;
  if (v11)
  {
    id v12 = +[CLFLog commonLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001002E4((uint64_t)v9, (uint64_t)v11, v12);
    }
  }
  else
  {
    if (v10)
    {
      id v12 = [v10 applicationState];
      unsigned __int8 v13 = [v12 isRestricted];
      goto LABEL_13;
    }
    id v12 = +[CLFLog commonLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10010026C((uint64_t)v9, v12);
    }
  }
  unsigned __int8 v13 = 0;
LABEL_13:

  return v13;
}

- (void)_loadFromProxy:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CLBApplicationInfo;
  [(CLBApplicationInfo *)&v36 _loadFromProxy:v4];
  char v5 = +[CLFSettings sharedInstance];
  id v6 = [v5 overrideNonClarityApplicationBundleIdentifiers];

  self->_deletable = [v4 isDeletable];
  int64_t v7 = [(CLBApplicationInfo *)self _visibilityOverrideForProxy:v4];
  if (v7)
  {
    self->_hidden = v7 == 2;
  }
  else
  {
    id v8 = [(id)objc_opt_class() disallowedBundleIdentifiers];
    id v9 = [(CLBApplicationInfo *)self bundleIdentifier];
    unsigned int v10 = [v8 containsObject:v9];

    if (v10)
    {
      self->_hidden = 1;
    }
    else
    {
      id v11 = [v4 appTags];
      self->_hidden = [v11 containsObject:@"hidden"];
    }
  }
  id v12 = [v4 objectForInfoDictionaryKey:CLFSupportsClarityUIKey ofClass:objc_opt_class()];
  if ([v12 BOOLValue])
  {
    unsigned __int8 v13 = [v4 bundleIdentifier];
    self->_supportsClarityUI = [v6 containsObject:v13] ^ 1;
  }
  else
  {
    self->_supportsClarityUI = 0;
  }

  v14 = [v4 objectForInfoDictionaryKey:CLFSupportsFullScreenInAssistiveAccessKey ofClass:objc_opt_class()];
  self->_wantsFullScreenInClarityUI = [v14 BOOLValue];

  id v15 = [v4 objectForInfoDictionaryKey:@"UIUserInterfaceStyle" ofClass:objc_opt_class()];
  self->_userInterfaceStyle = (NSString *)[v15 stringValue];

  v16 = [v4 applicationType];
  unsigned int v17 = [v16 isEqualToString:@"User"];
  self->_isThirdPartyApp = v17;
  if (v17)
  {
    p_alwaysLaunchesInBackground = &self->_alwaysLaunchesInBackground;
    self->_alwaysLaunchesInBackground = 0;
  }
  else
  {
    v19 = [v4 objectForInfoDictionaryKey:@"SBLaunchSuspendedAlways" ofClass:objc_opt_class()];
    p_alwaysLaunchesInBackground = &self->_alwaysLaunchesInBackground;
    self->_alwaysLaunchesInBackground = [v19 BOOLValue];
  }
  v20 = [(CLBApplicationInfo *)self bundleIdentifier];
  unsigned int v21 = [v20 hasSuffix:@".xctrunner"];

  if (v21) {
    BOOL *p_alwaysLaunchesInBackground = 1;
  }
  v22 = [v4 bundleURL];
  v23 = +[NSBundle bundleWithURL:v22];

  v24 = [v4 bundleURL];

  if (!v24 || v23)
  {
    v27 = [v23 localizedInfoDictionary];
    uint64_t v28 = CLFClarityDisplayNameKey;
    v29 = [v27 objectForKeyedSubscript:CLFClarityDisplayNameKey];

    if (![v29 length])
    {
      v30 = [v23 infoDictionary];
      uint64_t v31 = [v30 objectForKeyedSubscript:v28];

      v29 = (void *)v31;
    }
    clarityDisplayName = self->_clarityDisplayName;
    self->_clarityDisplayName = (NSString *)v29;
  }
  else
  {
    clarityDisplayName = +[CLFLog commonLog];
    if (os_log_type_enabled(clarityDisplayName, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v4 bundleURL];
      *(_DWORD *)buf = 138412290;
      v38 = v26;
      _os_log_impl((void *)&_mh_execute_header, clarityDisplayName, OS_LOG_TYPE_DEFAULT, "Unable to retrieve bundle for bundle URL %@", buf, 0xCu);
    }
  }

  self->_isArcadeApp = [v4 isArcadeApp];
  [(CLBApplicationInfo *)self setNeedsIconImageUpdate:1];
  v32 = [(CLBApplicationInfo *)self bundleIdentifier];
  unsigned int v33 = [v32 isEqualToString:CLBCalendarBundleIdentifier];

  if (v33)
  {
    v34 = +[CLFLog commonLog];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Observing significant time changes for Calendar icon.", buf, 2u);
    }

    v35 = +[NSNotificationCenter defaultCenter];
    [v35 addObserver:self selector:"_significantTimeChangeOccurred:" name:UIApplicationSignificantTimeChangeNotification object:0];
  }
  else
  {
    v35 = +[NSNotificationCenter defaultCenter];
    [v35 removeObserver:self name:UIApplicationSignificantTimeChangeNotification object:0];
  }
}

- (NSString)defaultSceneIdentifier
{
  v2 = [(CLBApplicationInfo *)self bundleIdentifier];
  v3 = +[NSString stringWithFormat:@"%@-default", v2];

  return (NSString *)v3;
}

- (id)_weakPointersHashTable
{
  return +[NSHashTable hashTableWithOptions:517];
}

- (int64_t)_visibilityOverrideForProxy:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForInfoDictionaryKey:@"SBIconVisibilitySetByAppPreference" ofClass:objc_opt_class()];
  unsigned int v5 = [v4 BOOLValue];

  if (v5
    && ((unsigned int v6 = [(id)objc_opt_class() isInternalInstall],
         unsigned int v7 = [(id)objc_opt_class() isCarrierInstall],
         unsigned int v8 = v7,
         (v6 & 1) != 0)
     || (v7 & 1) != 0
     || ([v3 entitlementValueForKey:@"com.apple.springboard.allowIconVisibilityChanges" ofClass:objc_opt_class()], id v9 = objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "BOOLValue"), v9, v10)))
  {
    id v11 = [v3 objectForInfoDictionaryKey:@"SBIconVisibilityDefaultVisible" ofClass:objc_opt_class()];
    id v12 = v11;
    if (v11)
    {
      if ([v11 BOOLValue]) {
        int64_t v13 = 1;
      }
      else {
        int64_t v13 = 2;
      }
    }
    else
    {
      uint64_t v14 = objc_opt_class();
      id v15 = [v3 objectForInfoDictionaryKey:@"SBIconVisibilityDefaultVisibleInstallTypes" ofClass:v14 valuesOfClass:objc_opt_class()];
      v16 = v15;
      if (v15)
      {
        CFStringRef v17 = @"user";
        if (v8) {
          CFStringRef v17 = @"carrier";
        }
        if (v6) {
          CFStringRef v18 = @"internal";
        }
        else {
          CFStringRef v18 = v17;
        }
        unsigned int v19 = [v15 containsObject:v18];
        int v20 = v19 ^ 1;
      }
      else
      {
        unsigned int v19 = 0;
        int v20 = 0;
      }
      uint64_t v21 = objc_opt_class();
      v22 = [v3 objectForInfoDictionaryKey:@"SBIconVisibilityDefaultVisiblePlatforms" ofClass:v21 valuesOfClass:objc_opt_class()];
      if (v22)
      {
        v23 = [(id)objc_opt_class() deviceClass];
        unsigned int v24 = [v22 containsObject:v23];
        v19 |= v24;
        v20 |= v24 ^ 1;
      }
      if ((v19 & (v20 ^ 1)) != 0) {
        int64_t v13 = 1;
      }
      else {
        int64_t v13 = 2;
      }
    }
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

- (NSString)badgeString
{
  if (![(CLBApplicationInfo *)self canShowBadge])
  {
    unsigned int v5 = &stru_100167328;
    goto LABEL_15;
  }
  id v3 = [(CLBApplicationInfo *)self badgeValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v3)
      {
        unsigned int v6 = +[CLFLog commonLog];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          sub_10010036C(self, (uint64_t)v3, v6);
        }
      }
      goto LABEL_13;
    }
    AXFormatNumber();
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  unsigned int v5 = v4;
  if (!v4) {
LABEL_13:
  }
    unsigned int v5 = &stru_100167328;

LABEL_15:

  return (NSString *)v5;
}

- (void)setCanShowBadge:(BOOL)a3
{
  if (self->_canShowBadge != a3)
  {
    self->_canShowBadge = a3;
    [(CLBApplicationInfo *)self _notifyObserversOfBadgeStringChange];
  }
}

- (void)addBadgeStringObserver:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CLBApplicationInfo *)self badgeStringObservers];

  if (!v5)
  {
    unsigned int v6 = [(CLBApplicationInfo *)self _weakPointersHashTable];
    [(CLBApplicationInfo *)self setBadgeStringObservers:v6];
  }
  id v7 = [(CLBApplicationInfo *)self badgeStringObservers];
  [v7 addObject:v4];
}

- (void)removeBadgeStringObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CLBApplicationInfo *)self badgeStringObservers];
  [v5 removeObject:v4];
}

- (FBSApplicationDataStore)dataStore
{
  dataStore = self->_dataStore;
  if (!dataStore)
  {
    id v4 = [(CLBApplicationInfo *)self bundleIdentifier];
    id v5 = +[FBSApplicationDataStore storeForApplication:v4];
    unsigned int v6 = self->_dataStore;
    self->_dataStore = v5;

    dataStore = self->_dataStore;
  }

  return dataStore;
}

- (void)_notifyObserversOfBadgeStringChange
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(CLBApplicationInfo *)self badgeStringObservers];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) didUpdateBadgeStringForApplicationInfo:self];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)badgeValue
{
  if ([(CLBApplicationInfo *)self shouldSkipCheckingDataStore])
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [(CLBApplicationInfo *)self dataStore];
    id v3 = [v4 safeObjectForKey:@"CLBApplicationBadgeKey" ofType:objc_opt_class()];

    [(CLBApplicationInfo *)self setShouldSkipCheckingDataStore:v3 == 0];
  }

  return v3;
}

- (void)setBadgeValue:(id)a3
{
  id v4 = a3;
  if (!v4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v4 isEqual:&off_100169188])
    {
      id v5 = +[CLFLog commonLog];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = [(CLBApplicationInfo *)self bundleIdentifier];
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Clearing zero badge for %@.", (uint8_t *)&v14, 0xCu);
      }
      id v4 = 0;
    }
    id v7 = [(CLBApplicationInfo *)self badgeValue];
    long long v8 = +[CLFLog commonLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      long long v9 = [(CLBApplicationInfo *)self bundleIdentifier];
      int v14 = 138412802;
      id v15 = v9;
      __int16 v16 = 2112;
      CFStringRef v17 = v7;
      __int16 v18 = 2112;
      unsigned int v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Set badge for %@: %@ => %@", (uint8_t *)&v14, 0x20u);
    }
    if (v7 != v4 && ([v7 isEqual:v4] & 1) == 0)
    {
      long long v10 = +[CLFLog commonLog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        long long v11 = [(CLBApplicationInfo *)self bundleIdentifier];
        int v14 = 138412546;
        id v15 = v11;
        __int16 v16 = 2112;
        CFStringRef v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updated badge for %@: %@", (uint8_t *)&v14, 0x16u);
      }
      id v12 = [(CLBApplicationInfo *)self dataStore];
      int64_t v13 = v12;
      if (v4) {
        [v12 setObject:v4 forKey:@"CLBApplicationBadgeKey"];
      }
      else {
        [v12 removeObjectForKey:@"CLBApplicationBadgeKey"];
      }

      [(CLBApplicationInfo *)self setShouldSkipCheckingDataStore:v4 == 0];
      [(CLBApplicationInfo *)self _notifyObserversOfBadgeStringChange];
    }
  }
  else
  {
    id v7 = +[CLFLog commonLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10010040C(self, (uint64_t)v4, v7);
    }
  }
}

- (BOOL)canBeLaunched
{
  if ([(CLBApplicationInfo *)self requiresPreflight])
  {
    id v3 = +[CLFLog commonLog];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CLBApplicationInfo *)self bundleIdentifier];
      int v12 = 138412290;
      v13[0] = v4;
      id v5 = "Unable to include application %@ because it needs preflighting for privacy.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v12, 0xCu);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ([(CLBApplicationInfo *)self isHiddenByUser])
  {
    id v3 = +[CLFLog commonLog];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CLBApplicationInfo *)self bundleIdentifier];
      int v12 = 138412290;
      v13[0] = v4;
      id v5 = "Unable to include application %@ because it was hidden by the user.";
      goto LABEL_10;
    }
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_12;
  }
  if ([(CLBApplicationInfo *)self isAppRestricted])
  {
    id v3 = +[CLFLog commonLog];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CLBApplicationInfo *)self bundleIdentifier];
      int v12 = 138412290;
      v13[0] = v4;
      id v5 = "Unable to include application %@ because it is restricted.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if ([(CLBApplicationInfo *)self isUnavailable])
  {
    id v3 = +[CLFLog commonLog];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1001004AC(v3);
    }
    goto LABEL_11;
  }
  if (![(CLBApplicationInfo *)self isArcadeApp]) {
    return 1;
  }
  id v3 = [(CLBApplicationInfo *)self executableURL];
  [v3 fileSystemRepresentation];
  sub_1000F61DC();
  BOOL v6 = v8 == 0;
  if (v8)
  {
    int v9 = v8;
    long long v10 = +[CLFLog commonLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = [(CLBApplicationInfo *)self bundleIdentifier];
      int v12 = 67109378;
      LODWORD(v13[0]) = v9;
      WORD2(v13[0]) = 2114;
      *(void *)((char *)v13 + 6) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received FairPlay error %d while trying to launch Arcade app %{public}@", (uint8_t *)&v12, 0x12u);
    }
    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

- (void)setNeedsIconImageUpdate
{
  [(CLBApplicationInfo *)self setNeedsIconImageUpdate:1];

  [(CLBApplicationInfo *)self _notifyObserversOfIconImageChange];
}

- (void)addIconImageObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CLBApplicationInfo *)self iconImageObservers];

  if (!v5)
  {
    BOOL v6 = [(CLBApplicationInfo *)self _weakPointersHashTable];
    [(CLBApplicationInfo *)self setIconImageObservers:v6];
  }
  id v7 = [(CLBApplicationInfo *)self iconImageObservers];
  [v7 addObject:v4];
}

- (void)removeIconImageObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CLBApplicationInfo *)self iconImageObservers];
  [v5 removeObject:v4];
}

- (UIImage)iconImage
{
  id v3 = [(CLBApplicationInfo *)self _iconCache];
  id v4 = [(CLBApplicationInfo *)self _iconKey];
  id v5 = [v3 objectForKey:v4];

  if ([(CLBApplicationInfo *)self needsIconImageUpdate] || !v5) {
    [(CLBApplicationInfo *)self _updateIcon];
  }

  return (UIImage *)v5;
}

- (void)_notifyObserversOfIconImageChange
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(CLBApplicationInfo *)self iconImageObservers];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) didUpdateIconImageForApplicationInfo:self];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_iconKey
{
  v2 = [(CLBApplicationInfo *)self bundleIdentifier];
  id v3 = +[NSString stringWithFormat:@"%@", v2];

  return v3;
}

- (id)_iconCache
{
  if (qword_1001810B0 != -1) {
    dispatch_once(&qword_1001810B0, &stru_10015CAB0);
  }
  v2 = (void *)qword_1001810A8;

  return v2;
}

- (void)_updateIcon
{
  BSDispatchQueueAssertMain();
  if ([(CLBApplicationInfo *)self isUpdatingIcon])
  {
    id v3 = +[CLFLog commonLog];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CLBApplicationInfo *)self bundleIdentifier];
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not updating icon for %@ because an update was already in progress.", buf, 0xCu);
    }
  }
  else
  {
    [(CLBApplicationInfo *)self setIsUpdatingIcon:1];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    void v13[2] = sub_10001D470;
    v13[3] = &unk_10015CB00;
    v13[4] = self;
    id v3 = objc_retainBlock(v13);
    id v5 = +[UIScreen mainScreen];
    [v5 scale];
    double v7 = v6;

    long long v8 = [(CLBApplicationInfo *)self bundleIdentifier];
    unsigned int v9 = [v8 isEqualToString:CLBCalendarBundleIdentifier];

    if (v9)
    {
      [(CLBApplicationInfo *)self _fetchIconServicesIconWithScreenScale:v3 completion:v7];
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10001D5A0;
      v10[3] = &unk_10015CB50;
      v10[4] = self;
      double v12 = v7;
      long long v11 = v3;
      [(CLBApplicationInfo *)self _fetchHighResIconWithCompletion:v10];
    }
  }
}

- (void)_fetchHighResIconWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D754;
  v7[3] = &unk_10015C2A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_fetchIconServicesIconWithScreenScale:(double)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = [(CLBApplicationInfo *)self bundleIdentifier];
  unsigned int v8 = [v7 isEqualToString:CLBCalendarBundleIdentifier];
  id v9 = objc_alloc((Class)ISIcon);
  long long v10 = v9;
  if (v8)
  {
    long long v11 = +[NSDate date];
    double v12 = +[NSCalendar currentCalendar];
    id v13 = [v10 initWithDate:v11 calendar:v12 format:0];
  }
  else
  {
    id v13 = [v9 initWithBundleIdentifier:v7];
  }
  id v14 = objc_msgSend(objc_alloc((Class)ISImageDescriptor), "initWithSize:scale:", 1024.0 / a3, 1024.0 / a3, a3);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001D998;
  v16[3] = &unk_10015CB78;
  id v17 = v6;
  id v15 = v6;
  [v13 getImageForImageDescriptor:v14 completion:v16];
}

- (void)_significantTimeChangeOccurred:(id)a3
{
  id v4 = +[CLFLog commonLog];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Significant time change occurred. Updating Calendar icon.", v5, 2u);
  }

  [(CLBApplicationInfo *)self setNeedsIconImageUpdate];
}

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)supportsClarityUI
{
  return self->_supportsClarityUI;
}

- (BOOL)wantsFullScreenInClarityUI
{
  return self->_wantsFullScreenInClarityUI;
}

- (NSString)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (BOOL)isThirdPartyApp
{
  return self->_isThirdPartyApp;
}

- (BOOL)alwaysLaunchesInBackground
{
  return self->_alwaysLaunchesInBackground;
}

- (BOOL)canShowBadge
{
  return self->_canShowBadge;
}

- (BOOL)isArcadeApp
{
  return self->_isArcadeApp;
}

- (BOOL)shouldShield
{
  return self->_shouldShield;
}

- (void)setShouldShield:(BOOL)a3
{
  self->_shouldShield = a3;
}

- (BOOL)shouldSkipCheckingDataStore
{
  return self->_shouldSkipCheckingDataStore;
}

- (void)setShouldSkipCheckingDataStore:(BOOL)a3
{
  self->_shouldSkipCheckingDataStore = a3;
}

- (NSHashTable)badgeStringObservers
{
  return self->_badgeStringObservers;
}

- (void)setBadgeStringObservers:(id)a3
{
}

- (NSHashTable)iconImageObservers
{
  return self->_iconImageObservers;
}

- (void)setIconImageObservers:(id)a3
{
}

- (BOOL)needsIconImageUpdate
{
  return self->_needsIconImageUpdate;
}

- (void)setNeedsIconImageUpdate:(BOOL)a3
{
  self->_needsIconImageUpdate = a3;
}

- (BOOL)isUpdatingIcon
{
  return self->_isUpdatingIcon;
}

- (void)setIsUpdatingIcon:(BOOL)a3
{
  self->_isUpdatingIcon = a3;
}

- (NSString)clarityDisplayName
{
  return self->_clarityDisplayName;
}

- (void)setClarityDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clarityDisplayName, 0);
  objc_storeStrong((id *)&self->_iconImageObservers, 0);
  objc_storeStrong((id *)&self->_badgeStringObservers, 0);

  objc_storeStrong((id *)&self->_dataStore, 0);
}

- (void)handleFirstUnlockIfNeeded
{
  v2 = self;
  BSDispatchQueueAssertMain();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  id v4 = v2;
  sub_10009D0C8((uint64_t)sub_100064C1C, v3);

  swift_release();
}

@end