@interface CSLNotificationsDataSource
- (BOOL)isSecondPartyApp:(id)a3;
- (BOOL)watchSupportsAOT;
- (CSLNotificationsDataSource)init;
- (NPSDomainAccessor)bbAppsSettings;
- (NSArray)bbSections;
- (NSArray)unfilteredBBSections;
- (NSDictionary)inheritedAllowList;
- (NSMutableArray)internalSpecifiers;
- (NSOperationQueue)localIconLoadingQueue;
- (id)_showOnGizmoStateForBundleID:(id)a3;
- (id)additionalSpecifiers;
- (id)appBacklightPrivacyLinkSpecifiers;
- (id)currentDevice;
- (id)deniedNotificationApps;
- (id)hardcodedSpecifiers;
- (id)localizedPrefsStringForString:(id)a3;
- (id)notificationsIndicatorActive:(id)a3;
- (id)secondPartyApps;
- (id)showOnGizmoState:(id)a3;
- (id)specifiersForWatchKitAppsWithNotifications;
- (id)specifiersFromBBSections;
- (id)watchAppSpecifierWithDisplayName:(id)a3 specifierID:(id)a4 identifier:(id)a5;
- (void)_clockStatusBarSettingsChanged:(id)a3;
- (void)_setShowOnGizmoState:(id)a3 forBundleID:(id)a4;
- (void)_valueChangedNotificationForSpecifier:(id)a3;
- (void)_writeSectionState:(id)a3 forBundleID:(id)a4;
- (void)becomeActive:(id)a3;
- (void)cleanBBSections;
- (void)dealloc;
- (void)lazyLoadBundle:(id)a3;
- (void)loadSpecifiers;
- (void)refreshBBSections;
- (void)reloadSpecifiers;
- (void)setBbAppsSettings:(id)a3;
- (void)setBbSections:(id)a3;
- (void)setInheritedAllowList:(id)a3;
- (void)setInternalSpecifiers:(id)a3;
- (void)setNotificationsIndicatorActive:(id)a3 specifier:(id)a4;
- (void)setShowOnGizmoState:(id)a3 specifier:(id)a4;
- (void)setUnfilteredBBSections:(id)a3;
- (void)setupAllowlistFromInheritedSpecifiers;
@end

@implementation CSLNotificationsDataSource

- (CSLNotificationsDataSource)init
{
  v11.receiver = self;
  v11.super_class = (Class)CSLNotificationsDataSource;
  v2 = [(CSLNotificationsDataSource *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NPSDomainAccessor);
    v4 = (NPSDomainAccessor *)[v3 initWithDomain:BPSBulletinBoardAppsSettingsDomain];
    bbAppsSettings = v2->_bbAppsSettings;
    v2->_bbAppsSettings = v4;

    [(CSLNotificationsDataSource *)v2 refreshBBSections];
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"becomeActive:" name:@"com.apple.PreferencesApp.willBecomeActive" object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_4F88, @"NanoAlwaysOnTimePreferencesChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v8 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    localIconLoadingQueue = v2->_localIconLoadingQueue;
    v2->_localIconLoadingQueue = v8;

    [(NSOperationQueue *)v2->_localIconLoadingQueue setMaxConcurrentOperationCount:8];
  }
  return v2;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_localIconLoadingQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)CSLNotificationsDataSource;
  [(CSLNotificationsDataSource *)&v3 dealloc];
}

- (void)becomeActive:(id)a3
{
}

- (void)reloadSpecifiers
{
  [(CSLNotificationsDataSource *)self refreshBBSections];
  v3.receiver = self;
  v3.super_class = (Class)CSLNotificationsDataSource;
  [(CSLNotificationsDataSource *)&v3 reloadSpecifiers];
}

- (id)currentDevice
{
  v2 = +[BPSBridgeAppContext shared];
  objc_super v3 = [v2 activeDevice];

  return v3;
}

- (BOOL)watchSupportsAOT
{
  if (!self->_checkedIfWatchSupportsAOT)
  {
    objc_super v3 = [(CSLNotificationsDataSource *)self currentDevice];
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6AABB66B-8E1B-4CAB-8FC4-AC577BA0AFB0"];
    self->_watchSupportsAOT = [v3 supportsCapability:v4];

    self->_checkedIfWatchSupportsAOT = 1;
  }
  return self->_watchSupportsAOT;
}

- (id)deniedNotificationApps
{
  v19[0] = @"com.apple.mobiletimer";
  v19[1] = @"com.apple.NanoContactsBridgeSettingsPaired";
  v19[2] = @"com.apple.NanoContactsBridgeSettingsTinker";
  v19[3] = @"com.apple.NanoMusicBridgeSettings";
  v19[4] = @"com.apple.NanoBedtimeBridgeSettings";
  v19[5] = @"com.apple.StocksBridgeSettings";
  v19[6] = @"com.apple.SessionTrackerAppSettings";
  v19[7] = @"com.apple.BridgeHealthSettings";
  v19[8] = @"com.apple.BridgeRemoteAccounts";
  uint64_t v3 = +[NSArray arrayWithObjects:v19 count:9];
  id v4 = +[NSMutableArray arrayWithArray:v3];

  v5 = [(CSLNotificationsDataSource *)self currentDevice];
  LOBYTE(v3) = BPSDeviceHasCapabilityForString();

  if ((v3 & 1) == 0) {
    [v4 addObject:@"com.apple.DeepBreathingSettings"];
  }
  v6 = [(CSLNotificationsDataSource *)self currentDevice];
  char HasCapabilityForString = BPSDeviceHasCapabilityForString();

  if ((HasCapabilityForString & 1) == 0) {
    [v4 addObject:@"com.apple.private.PodcastsBridgeSettings"];
  }
  v8 = [(CSLNotificationsDataSource *)self currentDevice];
  char v9 = BPSDeviceHasCapabilityForString();

  if ((v9 & 1) == 0) {
    [v4 addObject:@"com.apple.HeartRateSettings"];
  }
  v10 = [(CSLNotificationsDataSource *)self currentDevice];
  char v11 = BPSDeviceHasCapabilityForString();

  if ((v11 & 1) == 0) {
    [v4 addObject:@"com.apple.tincan.settings"];
  }
  v12 = [(CSLNotificationsDataSource *)self currentDevice];
  char v13 = BPSDeviceHasCapabilityForString();

  if ((v13 & 1) == 0) {
    [v4 addObject:@"com.apple.NanoBooks.BridgeSettings"];
  }
  v14 = [(CSLNotificationsDataSource *)self currentDevice];
  char v15 = BPSDeviceHasCapabilityForString();

  if ((v15 & 1) == 0) {
    [v4 addObject:@"com.apple.Noise.settings"];
  }
  [v4 addObject:@"com.apple.OxygenSaturationSettings"];
  v16 = [(CSLNotificationsDataSource *)self currentDevice];
  char v17 = BPSDeviceHasCapabilityForString();

  if ((v17 & 1) == 0) {
    [v4 addObject:@"com.apple.BrookBridgeSettings"];
  }

  return v4;
}

- (void)loadSpecifiers
{
  v86 = [(CSLNotificationsDataSource *)self specifiers];
  v91 = +[NSBundle bundleForClass:objc_opt_class()];
  v2 = +[PSSpecifierDataSource loadSpecifiersFromPlist:@"Notifications" inBundle:v91 target:self stringsTable:@"Notifications"];
  id v95 = [v2 mutableCopy];

  v92 = [(CSLNotificationsDataSource *)self currentDevice];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0F0D81BB-499A-4556-AA06-3616ECDC6BBB"];
  unsigned __int8 v4 = [v92 supportsCapability:v3];

  if ((v4 & 1) == 0)
  {
    v5 = objc_opt_new();
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id v6 = v95;
    id v7 = [v6 countByEnumeratingWithState:&v116 objects:v122 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v117;
      uint64_t v9 = PSIDKey;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v117 != v8) {
            objc_enumerationMutation(v6);
          }
          char v11 = *(void **)(*((void *)&v116 + 1) + 8 * i);
          v12 = [v11 propertyForKey:v9];
          unsigned int v13 = [v12 hasPrefix:@"NOTIFICATION_SHOW_SHORTLOOK"];

          if (v13) {
            [v5 addObject:v11];
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v116 objects:v122 count:16];
      }
      while (v7);
    }

    [v6 removeObjectsInArray:v5];
  }
  LOBYTE(keyExistsAndHasValidFormat) = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AOTEnabled", @"com.apple.system.prefs", (Boolean *)&keyExistsAndHasValidFormat);
  if ((!(_BYTE)keyExistsAndHasValidFormat || AppBooleanValue)
    && [(CSLNotificationsDataSource *)self watchSupportsAOT])
  {
    char v15 = [(CSLNotificationsDataSource *)self appBacklightPrivacyLinkSpecifiers];
    [v95 addObjectsFromArray:v15];
    v16 = +[NSMutableArray array];
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472;
    v114[2] = sub_60DC;
    v114[3] = &unk_C478;
    id v100 = v16;
    id v115 = v100;
    [v15 enumerateObjectsUsingBlock:v114];
  }
  else
  {
    id v100 = 0;
  }
  id v17 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0E581E21-36BA-4770-9408-0467585E8495"];
  unsigned int v18 = [v92 supportsCapability:v17];

  if (v18)
  {
    v19 = [v95 specifierForID:@"NOTIFICATION_PRIVACY_DESCRIPTION_ID"];
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"NOTIFICATION_PRIVACY_DESCRIPTION_DOUBLE_TAP" value:&stru_C650 table:@"Notifications"];
    [v19 setProperty:v21 forKey:PSFooterTextGroupKey];
  }
  v93 = +[NSMutableDictionary dictionary];
  v94 = +[NSMutableArray array];
  v22 = +[NSFileManager defaultManager];
  v99 = [v22 contentsOfDirectoryAtPath:@"/System/Library/NanoPreferenceBundles/Applications/" error:0];

  id v23 = [v99 count];
  if (v23)
  {
    uint64_t v24 = 0;
    uint64_t v96 = PSTitleKey;
    uint64_t v89 = PSIDKey;
    uint64_t v87 = PSTableCellClassKey;
    location = (id *)PSBundleHasIconKey;
    uint64_t v84 = PSSearchNanoApplicationsBundlePath;
    uint64_t v83 = PSBundlePathKey;
    id obj = (id)PSDataSourceClassKey;
    while (1)
    {
      v25 = [v99 objectAtIndex:v24];
      v26 = [v25 pathExtension];
      unsigned __int8 v27 = [v26 isEqualToString:@"dSYM"];

      if ((v27 & 1) == 0) {
        break;
      }
LABEL_37:

      if (v23 == (id)++v24) {
        goto LABEL_38;
      }
    }
    v28 = [v25 stringByDeletingPathExtension];
    if (![v28 length])
    {
LABEL_36:

      goto LABEL_37;
    }
    v29 = [v99 objectAtIndex:v24];
    uint64_t v30 = [@"/System/Library/NanoPreferenceBundles/Applications/" stringByAppendingPathComponent:v29];
    v31 = [(id)v30 stringByResolvingSymlinksInPath];

    v32 = +[NSBundle bundleWithPath:v31];
    v33 = [(CSLNotificationsDataSource *)self deniedNotificationApps];
    v34 = [v32 bundleIdentifier];
    LOBYTE(v30) = [v33 containsObject:v34];

    if ((v30 & 1) == 0)
    {
      v35 = [v32 bundleIdentifier];
      if ([@"com.apple.tincan.settings" isEqualToString:v35])
      {
        char v36 = BPSIsWalkieTalkieAppInstalled();

        if ((v36 & 1) == 0) {
          goto LABEL_35;
        }
      }
      else
      {
      }
      v37 = [v32 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
      v38 = [v32 bundleIdentifier];
      unsigned int v39 = [@"com.apple.NanoBedtimeBridgeSettings" isEqualToString:v38];

      if (v39)
      {
        v40 = +[NSBundle mainBundle];
        uint64_t v41 = [v40 localizedStringForKey:v28 value:&stru_C650 table:@"Localizable-burrito"];

        v37 = (void *)v41;
      }
      if (![v37 length])
      {
        uint64_t v42 = [(CSLNotificationsDataSource *)self localizedPrefsStringForString:v28];

        v37 = (void *)v42;
      }
      id v43 = objc_alloc((Class)NSMutableDictionary);
      v44 = [v32 bundleIdentifier];
      id v45 = objc_msgSend(v43, "initWithObjectsAndKeys:", v37, v96, v44, v89, @"PSLinkCell", v87, kCFBooleanTrue, location, kCFBooleanTrue, v84, v28, v83, kCFBooleanTrue, @"isController", 0);

      v46 = [v32 objectForInfoDictionaryKey:obj];
      if (v46) {
        [v45 setObject:v46 forKey:obj];
      }
      [v94 addObject:v45];
    }
LABEL_35:

    goto LABEL_36;
  }
LABEL_38:
  [v93 setObject:v94 forKey:@"items"];
  v47 = [v93 objectForKey:@"title"];
  v97 = SpecifiersFromPlist();

  v48 = [(CSLNotificationsDataSource *)self currentDevice];
  char HasStandaloneAppsCapability = BPSDeviceHasStandaloneAppsCapability();

  if (HasStandaloneAppsCapability)
  {
    BPSRemoveSystemDeletedAppBundleSettingsFromSpecifiers();
    v88 = [(CSLNotificationsDataSource *)self hardcodedSpecifiers];
    BPSRemoveSystemDeletedAppBundleIDsFromSpecifiers();
  }
  else
  {
    v88 = [(CSLNotificationsDataSource *)self hardcodedSpecifiers];
  }
  [v97 addObjectsFromArray:v88];
  v50 = [(CSLNotificationsDataSource *)self specifiersForWatchKitAppsWithNotifications];
  [v97 addObjectsFromArray:v50];

  BPSRemoveHiddenAppsFromSpecifiers();
  v51 = [v97 sortedArrayUsingComparator:&stru_C4B8];
  id v52 = [v51 mutableCopy];

  id v90 = v52;
  v53 = +[PSSpecifier emptyGroupSpecifier];
  [v95 addObject:v53];

  [v95 addObjectsFromArray:v90];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id obja = v95;
  id v54 = [obja countByEnumeratingWithState:&v110 objects:v121 count:16];
  if (v54)
  {
    uint64_t v55 = *(void *)v111;
    uint64_t v56 = PSLazyIconLoading;
    uint64_t v57 = PSLazyIconAppID;
    uint64_t v58 = PSCellClassKey;
    do
    {
      for (j = 0; j != v54; j = (char *)j + 1)
      {
        if (*(void *)v111 != v55) {
          objc_enumerationMutation(obja);
        }
        v60 = *(void **)(*((void *)&v110 + 1) + 8 * (void)j);
        if ([v60 cellType] == (char *)&dword_0 + 1)
        {
          v61 = [v60 identifier];
          unsigned __int8 v62 = [v100 containsObject:v61];

          if ((v62 & 1) == 0)
          {
            v63 = +[NSNumber numberWithBool:1];
            [v60 setProperty:v63 forKey:v56];

            v64 = [v60 identifier];
            v65 = BPSMappedNanoBundleIDForNanoSettingsBundleID();

            [v60 setProperty:v65 forKey:v57];
            v66 = BPSIsIconForBundleIDRemote();
            if (([v66 BOOLValue] & 1) == 0)
            {
              v67 = BPSLocalIconName();
              [v60 setProperty:v67 forKey:@"squareIconName"];
            }
            [v60 setProperty:objc_opt_class() forKey:v58];
          }
        }
      }
      id v54 = [obja countByEnumeratingWithState:&v110 objects:v121 count:16];
    }
    while (v54);
  }

  objc_initWeak(&keyExistsAndHasValidFormat, self);
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472;
  v107[2] = sub_61C0;
  v107[3] = &unk_C508;
  objc_copyWeak(&v108, &keyExistsAndHasValidFormat);
  v107[4] = self;
  v68 = objc_retainBlock(v107);
  if ((BPSStockholmSupportedInGizmoRegion() & 1) == 0)
  {
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v69 = obja;
    id v70 = [v69 countByEnumeratingWithState:&v103 objects:v120 count:16];
    if (v70)
    {
      uint64_t v71 = *(void *)v104;
      uint64_t v72 = PSIDKey;
      uint64_t v73 = PassbookSettingsBundleID;
      while (2)
      {
        for (k = 0; k != v70; k = (char *)k + 1)
        {
          if (*(void *)v104 != v71) {
            objc_enumerationMutation(v69);
          }
          v75 = *(void **)(*((void *)&v103 + 1) + 8 * (void)k);
          v76 = [v75 propertyForKey:v72];
          unsigned int v77 = [v76 isEqual:v73];

          if (v77)
          {
            v78 = sub_62C0(@"NanoPassbookBridgeSettings_NoStockholm");
            [v75 setName:v78];

            goto LABEL_64;
          }
        }
        id v70 = [v69 countByEnumeratingWithState:&v103 objects:v120 count:16];
        if (v70) {
          continue;
        }
        break;
      }
    }
LABEL_64:
  }
  objc_storeStrong((id *)&self->_internalSpecifiers, v95);
  v79 = [(CSLNotificationsDataSource *)self additionalSpecifiers];
  [obja addObjectsFromArray:v79];

  [v86 addObjectsFromArray:obja];
  v80 = +[NSNotificationCenter defaultCenter];
  uint64_t v81 = NTKClockStatusBarSettingsDidChangeNotification;
  [v80 removeObserver:self name:NTKClockStatusBarSettingsDidChangeNotification object:0];

  v82 = +[NSNotificationCenter defaultCenter];
  [v82 addObserver:self selector:"_clockStatusBarSettingsChanged:" name:v81 object:0];

  objc_destroyWeak(&v108);
  objc_destroyWeak(&keyExistsAndHasValidFormat);
}

- (id)secondPartyApps
{
  id v3 = objc_opt_new();
  unsigned __int8 v4 = [(CSLNotificationsDataSource *)self currentDevice];
  int HasCapabilityForString = BPSDeviceHasCapabilityForString();

  if (HasCapabilityForString) {
    [v3 addObject:@"com.apple.findmy"];
  }

  return v3;
}

- (BOOL)isSecondPartyApp:(id)a3
{
  id v4 = a3;
  v5 = [(CSLNotificationsDataSource *)self secondPartyApps];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (id)watchAppSpecifierWithDisplayName:(id)a3 specifierID:(id)a4 identifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  [v10 setProperty:v8 forKey:@"SpecifierID"];
  [v10 setIdentifier:v7];

  return v10;
}

- (id)specifiersForWatchKitAppsWithNotifications
{
  id v3 = objc_opt_new();
  [(CSLNotificationsDataSource *)self cleanBBSections];
  id v4 = +[BPSBridgeAppContext shared];
  v5 = [v4 installedWatchkitApps];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_65F8;
  v10[3] = &unk_C530;
  v10[4] = self;
  id v6 = v3;
  id v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];
  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (id)hardcodedSpecifiers
{
  v2 = +[NSMutableArray array];
  id v3 = sub_62C0(@"REMINDERS");
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
  [v4 setIdentifier:@"com.apple.NanoReminders"];
  [v4 setProperty:@"com.apple.reminders" forKey:@"bundleID"];
  [v4 setProperty:v3 forKey:@"localizedName"];
  [v2 addObject:v4];
  if (BPSIsNewsAllowed())
  {
    v5 = sub_62C0(@"NEWS");
    id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    [v6 setProperty:v5 forKey:@"localizedName"];
    [v6 setProperty:@"com.apple.news" forKey:@"bundleID"];
    [v6 setIdentifier:@"com.apple.nanonews"];
    [v2 addObject:v6];
  }

  return v2;
}

- (id)localizedPrefsStringForString:(id)a3
{
  return sub_62C0(a3);
}

- (id)additionalSpecifiers
{
  id v3 = +[NSMutableArray array];
  [(CSLNotificationsDataSource *)self setupAllowlistFromInheritedSpecifiers];
  id v4 = [(CSLNotificationsDataSource *)self specifiersFromBBSections];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (id)appBacklightPrivacyLinkSpecifiers
{
  v19[0] = PSTitleKey;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"NOTIFICATION_AOT_PRIVACY_TITLE" value:&stru_C650 table:@"Notifications"];
  v20[0] = v3;
  v20[1] = @"NOTIFICATION_AOT_PRIVACY_ID";
  v19[1] = PSIDKey;
  v19[2] = PSTableCellClassKey;
  v20[2] = @"PSLinkCell";
  v20[3] = @"CompanionAppBacklightPrivacySettings";
  v19[3] = PSBundlePathKey;
  v19[4] = PSBundleIsControllerKey;
  v20[4] = &__kCFBooleanTrue;
  v20[5] = &__kCFBooleanTrue;
  v19[5] = PSSearchNanoSettingsBundlePath;
  v19[6] = PSBundleHasIconKey;
  v19[7] = @"CSLPRFAppBacklightPrivacyType";
  v20[6] = &__kCFBooleanFalse;
  v20[7] = @"notifications";
  id v4 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:8];

  v16 = v4;
  CFStringRef v17 = @"items";
  v5 = +[NSArray arrayWithObjects:&v16 count:1];
  unsigned int v18 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v7 = +[NSBundle mainBundle];
  id v8 = SpecifiersFromPlist();

  id v9 = +[PSSpecifier groupSpecifierWithID:@"NOTIFICATION_AOT_PRIVACY_GROUP_ID", 0];
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"NOTIFICATION_AOT_PRIVACY_FOOTER" value:&stru_C650 table:@"Notifications"];
  [v9 setProperty:v11 forKey:PSFooterTextGroupKey];

  v15[0] = v9;
  v12 = [v8 firstObject];
  v15[1] = v12;
  unsigned int v13 = +[NSArray arrayWithObjects:v15 count:2];

  return v13;
}

- (id)notificationsIndicatorActive:(id)a3
{
  id v3 = +[NTKClockStatusBarSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isNotificationsIndicatorEnabled]);

  return v4;
}

- (void)setNotificationsIndicatorActive:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[NTKClockStatusBarSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setNotificationsIndicatorEnabled:v5];
}

- (void)setupAllowlistFromInheritedSpecifiers
{
  id v3 = +[NSMutableDictionary dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_internalSpecifiers;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v8), "identifier", (void)v12);
        v10 = MappedPhoneBundleIDForNanoSettingsBundleID(v9);

        if (v10) {
          [(NSDictionary *)v3 setObject:&__kCFBooleanTrue forKey:v10];
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  inheritedAllowList = self->_inheritedAllowList;
  self->_inheritedAllowList = v3;
}

- (void)refreshBBSections
{
  id v3 = +[PBBGatewayManager sharedManager];
  [v3 loadBBSections];

  id v4 = +[PBBGatewayManager sharedManager];
  id v5 = [v4 bbSections];
  id v6 = (NSArray *)[v5 copy];
  bbSections = self->_bbSections;
  self->_bbSections = v6;

  self->_unfilteredBBSections = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:self->_bbSections copyItems:0];

  _objc_release_x1();
}

- (void)cleanBBSections
{
  if (qword_11080 != -1) {
    dispatch_once(&qword_11080, &stru_C570);
  }
  +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v2 = self->_bbSections;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v6);
        if ([v7 allowsNotifications]
          && ([v7 alertType] || objc_msgSend(v7, "lockScreenSetting") == (char *)&dword_0 + 2)
          && ([v7 suppressFromSettings] & 1) == 0)
        {
          id v8 = (void *)qword_11078;
          id v9 = [v7 sectionID];
          if (([v8 containsObject:v9] & 1) != 0
            || [v7 sectionType] == (char *)&dword_0 + 1)
          {
          }
          else
          {
            inheritedAllowList = self->_inheritedAllowList;
            id v11 = [v7 sectionID];
            long long v12 = [(NSDictionary *)inheritedAllowList objectForKey:v11];
            unsigned __int8 v13 = [v12 BOOLValue];

            if ((v13 & 1) == 0) {
              [(NSArray *)v16 addObject:v7];
            }
          }
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v14 = [(NSArray *)v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
      id v4 = v14;
    }
    while (v14);
  }

  bbSections = self->_bbSections;
  self->_bbSections = v16;
}

- (id)specifiersFromBBSections
{
  v40 = +[NSMutableArray array];
  unsigned int v39 = +[NSMutableArray array];
  [(CSLNotificationsDataSource *)self cleanBBSections];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v42 = self;
  id obj = self->_bbSections;
  id v44 = [(NSArray *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v47;
    uint64_t v38 = PSLazyIconAppID;
    uint64_t v37 = PSLazyIconLoading;
    uint64_t v35 = BPSNotificationAppBBDisplayName;
    uint64_t v36 = BPSNotificationAppBBSectionInfo;
    uint64_t v34 = PSCellClassKey;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v47 != v43) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v5 = [v4 sectionID];
        id v6 = [v4 sectionID];
        id v7 = objc_alloc((Class)LSApplicationRecord);
        id v45 = 0;
        id v8 = [v7 initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v45];
        id v9 = v45;
        if (v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "error while retrieving application record %@ with error %@", buf, 0x16u);
        }
        v10 = [v8 counterpartIdentifiers];
        id v11 = [v10 firstObject];

        long long v12 = BPSMappedNanoSettingsBundleIDForNanoBundleID();
        *(void *)buf = @"com.apple.facetime";
        *(void *)&buf[8] = @"com.apple.tips";
        *(void *)&buf[16] = @"com.apple.TapToRadar";
        CFStringRef v52 = @"com.apple.Bridge";
        CFStringRef v53 = @"com.apple.Sharing.Remote";
        unsigned __int8 v13 = +[NSArray arrayWithObjects:buf count:5];
        if ([v13 containsObject:v6])
        {

LABEL_12:
          if (([v6 isEqualToString:@"com.apple.tips"] & 1) != 0
            || [v6 isEqualToString:@"com.apple.TapToRadar"])
          {
            [(CSLNotificationsDataSource *)v42 _setShowOnGizmoState:&__kCFBooleanFalse forBundleID:v6];
          }
          goto LABEL_30;
        }
        char IsRemoved = BPSSystemAppIsRemoved();

        if (IsRemoved) {
          goto LABEL_12;
        }
        long long v15 = [(NSDictionary *)v42->_inheritedAllowList objectForKey:v11];

        if (v15) {
          goto LABEL_30;
        }
        v16 = [(NSMutableArray *)v42->_internalSpecifiers specifierForID:v11];
        if (v16)
        {

          goto LABEL_30;
        }
        CFStringRef v17 = [(NSMutableArray *)v42->_internalSpecifiers specifierForID:v12];

        if (!v17)
        {
          long long v18 = [(CSLNotificationsDataSource *)v42 deniedNotificationApps];
          unsigned __int8 v19 = [v18 containsObject:v12];

          if ((v19 & 1) == 0)
          {
            long long v20 = [v4 displayName];

            if (v20)
            {
              uint64_t v21 = [v4 displayName];
              goto LABEL_24;
            }
            if (v6)
            {
              uint64_t v21 = [v8 localizedName];
LABEL_24:
              v22 = (void *)v21;

              uint64_t v5 = v22;
            }
            if (v5)
            {
              id v23 = +[PSSpecifier preferenceSpecifierNamed:v5 target:v42 set:"setShowOnGizmoState:specifier:" get:"showOnGizmoState:" detail:0 cell:6 edit:0];
              uint64_t v24 = [v4 sectionID];
              [v23 setProperty:v24 forKey:v38];

              [v23 setProperty:&__kCFBooleanTrue forKey:v37];
              [v23 setProperty:v4 forKey:v36];
              [v23 setProperty:v5 forKey:v35];
              [v23 setProperty:objc_opt_class() forKey:v34];
              [v23 setProperty:v42->_localIconLoadingQueue forKey:@"CSLNotificationCellIconQueue"];
              if ([v4 isAppClip]) {
                v25 = v39;
              }
              else {
                v25 = v40;
              }
              [v25 addObject:v23];
            }
          }
        }
LABEL_30:
      }
      id v44 = [(NSArray *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v44);
  }

  [v40 sortUsingComparator:&stru_C590];
  [v39 sortUsingComparator:&stru_C5B0];
  if ([v39 count])
  {
    v26 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v27 = [v26 localizedStringForKey:@"APP_CLIPS_TITLE" value:&stru_C650 table:@"Notifications-DimSum"];
    v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    v29 = +[UIImage imageNamed:@"AppClips-DimSum"];
    [v28 setProperty:v29 forKey:PSIconImageKey];

    [v28 setProperty:v39 forKey:@"AppClipSpecifiers"];
    [v40 insertObject:v28 atIndex:0];
  }
  if ([v40 count])
  {
    uint64_t v30 = +[NSBundle bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:@"MIRROR_IPHONE_ALERTS" value:&stru_C650 table:@"Notifications"];
    v32 = +[PSSpecifier groupSpecifierWithID:@"NOTIFICATION_APPS_GROUP" name:v31];

    [v40 insertObject:v32 atIndex:0];
  }

  return v40;
}

- (void)_writeSectionState:(id)a3 forBundleID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = BPSNanoBulletinSectionId;
  id v8 = [v12 objectForKey:BPSNanoBulletinSectionId];

  if (!v8) {
    [v12 setObject:v6 forKey:v7];
  }
  id v9 = +[NSDate date];
  [v12 setObject:v9 forKey:BPSNanoBulletinUpdateTimestamp];

  [(NPSDomainAccessor *)self->_bbAppsSettings setObject:v12 forKey:v6];
  id v10 = [(NPSDomainAccessor *)self->_bbAppsSettings synchronize];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, BPSBulletinDistributorBBSectionsDidChangeNotification, 0, 0, 0);
}

- (void)_setShowOnGizmoState:(id)a3 forBundleID:(id)a4
{
  bbAppsSettings = self->_bbAppsSettings;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NPSDomainAccessor *)bbAppsSettings dictionaryForKey:v7];
  id v14 = v9;
  if (v9)
  {
    id v10 = [v9 mutableCopy];
  }
  else
  {
    id v10 = +[NSMutableDictionary dictionary];
  }
  id v11 = v10;
  [v10 setObject:v8 forKey:BPSNanoBulletinShowsAlerts];
  unsigned int v12 = [v8 BOOLValue];

  unsigned __int8 v13 = +[NSNumber numberWithInt:v12 ^ 1];
  [v11 setObject:v13 forKey:BPSNanoBulletinShowsCustomSettings];

  [(CSLNotificationsDataSource *)self _writeSectionState:v11 forBundleID:v7];
}

- (void)setShowOnGizmoState:(id)a3 specifier:(id)a4
{
  uint64_t v6 = BPSNotificationAppBBSectionInfo;
  id v7 = a3;
  id v9 = [a4 propertyForKey:v6];
  id v8 = [v9 sectionID];
  [(CSLNotificationsDataSource *)self _setShowOnGizmoState:v7 forBundleID:v8];
}

- (id)_showOnGizmoStateForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NPSDomainAccessor *)self->_bbAppsSettings dictionaryForKey:v4];
  id v6 = [v5 mutableCopy];

  id v7 = [v6 objectForKey:BPSNanoBulletinShowsAlerts];
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {

    id v8 = &__kCFBooleanTrue;
    [(CSLNotificationsDataSource *)self _setShowOnGizmoState:&__kCFBooleanTrue forBundleID:v4];
  }
  else if (([v7 BOOLValue] & 1) == 0)
  {
    id v10 = [v6 objectForKey:BPSNanoBulletinShowsCustomSettings];
    if (!v10) {
      [(CSLNotificationsDataSource *)self _setShowOnGizmoState:v8 forBundleID:v4];
    }
  }

  return v8;
}

- (id)showOnGizmoState:(id)a3
{
  id v4 = [a3 propertyForKey:BPSNotificationAppBBSectionInfo];
  uint64_t v5 = [v4 sectionID];
  id v6 = [(CSLNotificationsDataSource *)self _showOnGizmoStateForBundleID:v5];

  return v6;
}

- (void)lazyLoadBundle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLNotificationsDataSource *)self observersOfClass:objc_opt_class()];
  id v6 = [v5 anyObject];

  [v6 lazyLoadBundle:v4];
}

- (void)_valueChangedNotificationForSpecifier:(id)a3
{
  uint64_t v4 = PSValueKey;
  id v5 = a3;
  [v5 setProperty:0 forKey:v4];
  id v6 = +[PSRootController readPreferenceValue:v5];
  id v7 = [(CSLNotificationsDataSource *)self specifiers];
  id v8 = +[PSSpecifierUpdates updatesWithSpecifiers:v7];

  [v8 reloadSpecifier:v5];
  [(CSLNotificationsDataSource *)self performUpdates:v8];
}

- (void)_clockStatusBarSettingsChanged:(id)a3
{
  id v5 = [(CSLNotificationsDataSource *)self specifiers];
  uint64_t v4 = [v5 specifierForID:@"NOTIFICATIONS_INDICATOR_ID"];
  [(CSLNotificationsDataSource *)self _valueChangedNotificationForSpecifier:v4];
}

- (NSMutableArray)internalSpecifiers
{
  return self->_internalSpecifiers;
}

- (void)setInternalSpecifiers:(id)a3
{
}

- (NSArray)bbSections
{
  return self->_bbSections;
}

- (void)setBbSections:(id)a3
{
}

- (NSArray)unfilteredBBSections
{
  return self->_unfilteredBBSections;
}

- (void)setUnfilteredBBSections:(id)a3
{
}

- (NSDictionary)inheritedAllowList
{
  return self->_inheritedAllowList;
}

- (void)setInheritedAllowList:(id)a3
{
}

- (NPSDomainAccessor)bbAppsSettings
{
  return self->_bbAppsSettings;
}

- (void)setBbAppsSettings:(id)a3
{
}

- (NSOperationQueue)localIconLoadingQueue
{
  return self->_localIconLoadingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localIconLoadingQueue, 0);
  objc_storeStrong((id *)&self->_bbAppsSettings, 0);
  objc_storeStrong((id *)&self->_inheritedAllowList, 0);
  objc_storeStrong((id *)&self->_unfilteredBBSections, 0);
  objc_storeStrong((id *)&self->_bbSections, 0);

  objc_storeStrong((id *)&self->_internalSpecifiers, 0);
}

@end