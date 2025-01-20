@interface NCBSMainMenuDataSource
- (NCBSMainMenuDataSource)init;
- (id)_currentLocale;
- (id)_getAlertsActive:(id)a3;
- (id)_getFaceSupportNotificationEnabled;
- (id)_getFastFaceSwitchingEnabled;
- (id)_getMonogram:(id)a3;
- (id)_getNotificationsIndicatorActive:(id)a3;
- (id)_getTimeTravelEnabled:(id)a3;
- (id)_is24HourTime:(id)a3;
- (id)_tapToSpeakTimeEnabled;
- (id)_tapticChimesCurrentSounds;
- (id)_tapticChimesEnabled;
- (id)applicationBundleIdentifier;
- (void)_checkAndUpdateSettings;
- (void)_loadSectionInfo;
- (void)_set24HourTime:(id)a3 withSpecifier:(id)a4;
- (void)_setAlertsActive:(id)a3 withSpecifier:(id)a4;
- (void)_setFaceSupportNotificationEnabled:(id)a3;
- (void)_setFastFaceSwitchingEnabled:(id)a3;
- (void)_setNotificationsIndicatorActive:(id)a3 withSpecifier:(id)a4;
- (void)_setTapToSpeakTimeEnabled:(id)a3;
- (void)_setTapticChimesEnabled:(id)a3;
- (void)_setTimeTravelEnabled:(id)a3 withSpecifier:(id)a4;
- (void)_writeSectionState;
- (void)dealloc;
- (void)handleCustomMonogramChange:(id)a3;
- (void)loadSpecifiers;
@end

@implementation NCBSMainMenuDataSource

- (NCBSMainMenuDataSource)init
{
  v11.receiver = self;
  v11.super_class = (Class)NCBSMainMenuDataSource;
  v2 = [(NCBSMainMenuDataSource *)&v11 init];
  if (v2)
  {
    v3 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@".GlobalPreferences"];
    gizmoGlobalDomain = v2->_gizmoGlobalDomain;
    v2->_gizmoGlobalDomain = v3;

    v5 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.NanoTimeKit.face"];
    faceSupportDomain = v2->_faceSupportDomain;
    v2->_faceSupportDomain = v5;

    v7 = (NPSManager *)objc_alloc_init((Class)NPSManager);
    syncManager = v2->_syncManager;
    v2->_syncManager = v7;

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"handleCustomMonogramChange:" name:NTKCustomMonogramChangedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NCBSMainMenuDataSource;
  [(NCBSMainMenuDataSource *)&v4 dealloc];
}

- (void)_writeSectionState
{
  sectionInfo = self->_sectionInfo;
  objc_super v4 = +[NSDate date];
  [(NSMutableDictionary *)sectionInfo setObject:v4 forKey:BPSNanoBulletinUpdateTimestamp];

  id v5 = objc_alloc((Class)NPSDomainAccessor);
  id v10 = [v5 initWithDomain:BPSBulletinBoardAppsSettingsDomain];
  v6 = self->_sectionInfo;
  v7 = [(NCBSMainMenuDataSource *)self applicationBundleIdentifier];
  [v10 setObject:v6 forKey:v7];

  id v8 = [v10 synchronize];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, BPSBulletinDistributorBBSectionsDidChangeNotification, 0, 0, 0);
}

- (void)_checkAndUpdateSettings
{
  uint64_t v3 = BPSNanoBulletinShowsAlerts;
  uint64_t v4 = [(NSMutableDictionary *)self->_sectionInfo objectForKey:BPSNanoBulletinShowsAlerts];
  BOOL v5 = v4 == 0;
  id v18 = (id)v4;
  if (!v4)
  {
    sectionInfo = self->_sectionInfo;
    v7 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)sectionInfo setObject:v7 forKey:v3];
  }
  uint64_t v8 = BPSNanoBulletinShowsPreview;
  v9 = [(NSMutableDictionary *)self->_sectionInfo objectForKey:BPSNanoBulletinShowsPreview];
  id v10 = v9;
  if (!v9 || [v9 BOOLValue])
  {
    objc_super v11 = self->_sectionInfo;
    v12 = +[NSNumber numberWithBool:0];
    [(NSMutableDictionary *)v11 setObject:v12 forKey:v8];

    BOOL v5 = 1;
  }
  uint64_t v13 = BPSNanoBulletinShowsCustomSettings;
  v14 = [(NSMutableDictionary *)self->_sectionInfo objectForKey:BPSNanoBulletinShowsCustomSettings];
  v15 = v14;
  if (!v14 || ([v14 BOOLValue] & 1) == 0)
  {
    v16 = self->_sectionInfo;
    v17 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)v16 setObject:v17 forKey:v13];

    goto LABEL_11;
  }
  if (v5) {
LABEL_11:
  }
    [(NCBSMainMenuDataSource *)self _writeSectionState];
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.mobiletimer";
}

- (void)_loadSectionInfo
{
  id v3 = objc_alloc((Class)NPSDomainAccessor);
  id v9 = [v3 initWithDomain:BPSBulletinBoardAppsSettingsDomain];
  id v4 = [v9 synchronize];
  BOOL v5 = [(NCBSMainMenuDataSource *)self applicationBundleIdentifier];
  v6 = [v9 dictionaryForKey:v5];

  if (v6) {
    v7 = (NSMutableDictionary *)[v6 mutableCopy];
  }
  else {
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  sectionInfo = self->_sectionInfo;
  self->_sectionInfo = v7;

  [(NCBSMainMenuDataSource *)self _checkAndUpdateSettings];
}

- (void)loadSpecifiers
{
  v2 = self;
  v112 = [(NCBSMainMenuDataSource *)self specifiers];
  id v3 = +[NSMutableArray array];
  [(NCBSMainMenuDataSource *)v2 _loadSectionInfo];
  if ([(NCBSMainMenuDataSource *)v2 _currentLocale]) {
    v2->_localeForces24HourTime = PSLocaleUses24HourClock();
  }
  id v4 = &CFNotificationCenterAddObserver_ptr;
  v111 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  objc_msgSend(v3, "addObject:");
  BOOL v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"TWENTY_FOUR_HOUR_TIME_FORMAT" value:&stru_C500 table:@"NanoClockBridgeSettings"];
  uint64_t v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, 24);

  v110 = (void *)v7;
  v109 = +[PSSpecifier preferenceSpecifierNamed:v7 target:v2 set:"_set24HourTime:withSpecifier:" get:"_is24HourTime:" detail:0 cell:6 edit:0];
  objc_msgSend(v3, "addObject:");
  uint64_t v8 = +[PSSpecifier emptyGroupSpecifier];
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"FACE_FACE_SWITCHING_SECTION_FOOTER" value:&stru_C500 table:@"NanoClockBridgeSettings"];
  uint64_t v114 = PSFooterTextGroupKey;
  objc_msgSend(v8, "setProperty:forKey:", v10);

  v108 = v8;
  [v3 addObject:v8];
  objc_super v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"FAST_FACE_SWITCHING_CELL_TITLE" value:&stru_C500 table:@"NanoClockBridgeSettings"];
  uint64_t v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:v2 set:"_setFastFaceSwitchingEnabled:" get:"_getFastFaceSwitchingEnabled" detail:0 cell:6 edit:0];

  v107 = (void *)v13;
  [v3 addObject:v13];
  v14 = +[NRPairedDeviceRegistry sharedInstance];
  v15 = [v14 getActivePairedDevice];
  id v16 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"78E1881C-F6E1-421F-BC90-A1EBF1784BB1"];
  LODWORD(v11) = [v15 supportsCapability:v16];

  v113 = v3;
  v122 = v2;
  if (v11)
  {
    v17 = +[NSMutableArray array];
    id v18 = +[AXTimeOutputPreferences sharedInstance];
    v19 = +[PSSpecifier emptyGroupSpecifier];
    v20 = [v18 tapticChimesLocalizedDescription];
    [v19 setProperty:v20 forKey:v114];

    v105 = v19;
    [v17 addObject:v19];
    v21 = [v18 tapticChimesLocalizedTitle];
    uint64_t v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:v2 set:"_setTapticChimesEnabled:" get:"_tapticChimesEnabled" detail:0 cell:6 edit:0];

    v103 = (void *)v22;
    [v17 addObject:v22];
    v23 = [v18 tapticChimesSoundsLocalizedTitle];
    v24 = v18;
    uint64_t v25 = +[PSSpecifier preferenceSpecifierNamed:v23 target:v2 set:0 get:"_tapticChimesCurrentSounds" detail:objc_opt_class() cell:2 edit:0];

    v101 = (void *)v25;
    [v17 addObject:v25];
    v26 = +[PSSpecifier emptyGroupSpecifier];
    v27 = [v24 tapToSpeakTimeLocalizedDescription];
    [v26 setProperty:v27 forKey:v114];

    [v26 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    [v26 setIdentifier:@"TapToSpeakTimeSettingsGroupID"];
    [v17 addObject:v26];
    v28 = [v24 tapToSpeakTimeLocalizedTitle];
    uint64_t v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:v2 set:"_setTapToSpeakTimeEnabled:" get:"_tapToSpeakTimeEnabled" detail:0 cell:6 edit:0];

    v120 = v17;
    v99 = (void *)v29;
    [v17 addObject:v29];
    uint64_t v30 = v114;
    if ([v24 tapToSpeakTimeEnabled])
    {
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      v118 = v24;
      id obj = [v24 tapToSpeakAvailabilityOptions];
      id v31 = [obj countByEnumeratingWithState:&v123 objects:v128 count:16];
      if (v31)
      {
        id v32 = v31;
        v116 = 0;
        uint64_t v33 = *(void *)v124;
        uint64_t v34 = PSValueKey;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            v36 = v26;
            if (*(void *)v124 != v33) {
              objc_enumerationMutation(obj);
            }
            id v37 = [*(id *)(*((void *)&v123 + 1) + 8 * i) integerValue];
            v38 = v4;
            v39 = v4[86];
            v40 = [v118 localizedStringForTapToSpeakTimeAvailability:v37];
            v41 = [v39 preferenceSpecifierNamed:v40 target:v122 set:0 get:0 detail:0 cell:3 edit:0];

            v42 = +[NSNumber numberWithInteger:v37];
            [v41 setProperty:v42 forKey:v34];

            [v120 addObject:v41];
            if ([v118 tapToSpeakTimeAvailability] == v37)
            {
              id v43 = v41;

              v116 = v43;
            }
            v26 = v36;

            id v4 = v38;
          }
          id v32 = [obj countByEnumeratingWithState:&v123 objects:v128 count:16];
        }
        while (v32);
      }
      else
      {
        v116 = 0;
      }

      [v26 setProperty:v116 forKey:PSRadioGroupCheckedSpecifierKey];
      id v3 = v113;
      uint64_t v30 = v114;
      v2 = v122;
      v24 = v118;
    }
    v44 = [v4[86] emptyGroupSpecifier];
    v45 = [v24 tapticTimeLocalizedDescription];
    [v44 setProperty:v45 forKey:v30];

    [v120 addObject:v44];
    v46 = v4[86];
    v47 = [v24 tapticTimeLocalizedTitle];
    v48 = [v46 preferenceSpecifierNamed:v47 target:v2 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v120 addObject:v48];
    [v3 addObjectsFromArray:v120];
  }
  v49 = [v4[86] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  [v3 addObject:v49];
  v50 = v4[86];
  v51 = +[NSBundle bundleForClass:objc_opt_class()];
  v52 = [v51 localizedStringForKey:@"MIRROR_ALERTS" value:&stru_C500 table:@"NanoClockBridgeSettings"];
  uint64_t v53 = [v50 preferenceSpecifierNamed:v52 target:v2 set:"_setAlertsActive:withSpecifier:" get:"_getAlertsActive:" detail:0 cell:6 edit:0];

  v119 = (void *)v53;
  [v3 addObject:v53];
  v54 = +[NSBundle bundleForClass:objc_opt_class()];
  v55 = [v54 localizedStringForKey:@"MIRROR_DESCRIPTION" value:&stru_C500 table:@"NanoClockBridgeSettings"];
  v121 = v49;
  [v49 setProperty:v55 forKey:v114];

  v56 = [v4[86] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  v57 = v4[86];
  uint64_t v58 = +[NSBundle bundleForClass:objc_opt_class()];
  v59 = [(id)v58 localizedStringForKey:@"NOTIFICATIONS_INDICATOR" value:&stru_C500 table:@"NanoClockBridgeSettings"];
  v60 = [v57 preferenceSpecifierNamed:v59 target:v2 set:"_setNotificationsIndicatorActive:withSpecifier:" get:"_getNotificationsIndicatorActive:" detail:0 cell:6 edit:0];

  v61 = +[NSBundle bundleForClass:objc_opt_class()];
  v62 = [v61 localizedStringForKey:@"NOTIFICATIONS_DESCRIPTION" value:&stru_C500 table:@"NanoClockBridgeSettings"];
  [v56 setProperty:v62 forKey:v114];

  v117 = v56;
  [v113 addObject:v56];
  [v113 addObject:v60];
  v63 = +[NRPairedDeviceRegistry sharedInstance];
  v64 = [v63 getActivePairedDevice];
  id v65 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"21FFC697-E29F-4C65-878E-2AC90BAF5B9E"];
  LOBYTE(v58) = [v64 supportsCapability:v65];

  if ((v58 & 1) == 0)
  {
    v66 = [v4[86] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    v67 = v4[86];
    v68 = +[NSBundle bundleForClass:objc_opt_class()];
    v69 = [v68 localizedStringForKey:@"TIME_TRAVEL" value:&stru_C500 table:@"NanoClockBridgeSettings"];
    v70 = [v67 preferenceSpecifierNamed:v69 target:v122 set:"_setTimeTravelEnabled:withSpecifier:" get:"_getTimeTravelEnabled:" detail:0 cell:6 edit:0];

    v71 = +[NSBundle bundleForClass:objc_opt_class()];
    v72 = [v71 localizedStringForKey:@"TIME_TRAVEL_DESCRIPTION" value:&stru_C500 table:@"NanoClockBridgeSettings"];
    [v66 setProperty:v72 forKey:v114];

    [v113 addObject:v66];
    [v113 addObject:v70];
  }
  v73 = [v4[86] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  v74 = v4[86];
  v75 = [(id)NTKCompanionMonogramEntryViewControllerClass() localizedTitle];
  v76 = [v74 preferenceSpecifierNamed:v75 target:v122 set:0 get:"_getMonogram:" detail:NTKCompanionMonogramEntryViewControllerClass() cell:2 edit:0];

  [v76 setIdentifier:@"MONOGRAM_ID"];
  v77 = [(id)NTKCompanionMonogramEntryViewControllerClass() localizedDescription];
  [v73 setProperty:v77 forKey:v114];

  v106 = v73;
  [v113 addObject:v73];
  v104 = v76;
  [v113 addObject:v76];
  v78 = [v4[86] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  v79 = +[NSBundle bundleForClass:objc_opt_class()];
  v98 = objc_msgSend(v79, "localizedStringForKey:value:table:", @"FACE_NOTIFICATION_CELL_TITLE");
  uint64_t v80 = objc_msgSend(v4[86], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
  [(id)v80 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v78 setIdentifier:@"faceSupportID"];
  v100 = v79;
  v96 = [v79 localizedStringForKey:@"FACE_NOTIFICATION_SECTION_FOOTER" value:&stru_C500 table:@"NanoClockBridgeSettings-argon"];
  objc_msgSend(v78, "setProperty:forKey:");
  v102 = v78;
  [v113 addObject:v78];
  v97 = (void *)v80;
  [v113 addObject:v80];
  v81 = [v4[86] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  v82 = v4[86];
  v83 = +[NSBundle bundleForClass:objc_opt_class()];
  v84 = [v83 localizedStringForKey:@"CITY_ABBREVIATIONS" value:&stru_C500 table:@"NanoClockBridgeSettings"];
  v85 = [v82 preferenceSpecifierNamed:v84 target:v122 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  v86 = +[NSBundle bundleForClass:objc_opt_class()];
  v87 = [v86 localizedStringForKey:@"CITY_ABBREVIATIONS_DESCRIPTION" value:&stru_C500 table:@"NanoClockBridgeSettings"];
  [v81 setProperty:v87 forKey:v114];

  [v113 addObject:v81];
  [v113 addObject:v85];
  v88 = +[NRPairedDeviceRegistry sharedInstance];
  v89 = [v88 getActivePairedDevice];
  id v90 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  LOBYTE(v80) = [v89 supportsCapability:v90];

  if ((v80 & 1) == 0)
  {
    v91 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    v92 = +[NSBundle bundleForClass:objc_opt_class()];
    v93 = [v92 localizedStringForKey:@"SIRI_DATA_SOURCES" value:&stru_C500 table:@"NanoClockBridgeSettings"];
    v94 = +[PSSpecifier preferenceSpecifierNamed:v93 target:v122 set:0 get:0 detail:NTKCUpNextDataSourcesViewControllerClass() cell:2 edit:0];

    v127[0] = v91;
    v127[1] = v94;
    v95 = +[NSArray arrayWithObjects:v127 count:2];
    [v113 addObjectsFromArray:v95];
  }
  [v112 removeAllObjects];
  [v112 addObjectsFromArray:v113];
}

- (void)_set24HourTime:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL localeForces24HourTime = self->_localeForces24HourTime;
  unsigned int v9 = [v6 BOOLValue];
  if (localeForces24HourTime) {
    int v10 = v9;
  }
  else {
    int v10 = 1;
  }
  if ((!localeForces24HourTime & v9) != 0) {
    objc_super v11 = &__kCFBooleanTrue;
  }
  else {
    objc_super v11 = 0;
  }
  if (v10) {
    v12 = 0;
  }
  else {
    v12 = &__kCFBooleanTrue;
  }
  [(NPSDomainAccessor *)self->_gizmoGlobalDomain setObject:v12 forKey:@"AppleICUForce12HourTime"];
  [(NPSDomainAccessor *)self->_gizmoGlobalDomain setObject:v11 forKey:@"AppleICUForce24HourTime"];
  id v13 = [(NPSDomainAccessor *)self->_gizmoGlobalDomain synchronize];
  v18[0] = @"AppleICUForce12HourTime";
  v18[1] = @"AppleICUForce24HourTime";
  v14 = +[NSArray arrayWithObjects:v18 count:2];
  syncManager = self->_syncManager;
  id v16 = [(NPSDomainAccessor *)self->_gizmoGlobalDomain domain];
  v17 = +[NSSet setWithArray:v14];
  [(NPSManager *)syncManager synchronizeNanoDomain:v16 keys:v17];
}

- (id)_is24HourTime:(id)a3
{
  BOOL localeForces24HourTime = self->_localeForces24HourTime;
  gizmoGlobalDomain = self->_gizmoGlobalDomain;
  if (localeForces24HourTime) {
    id v5 = (id)([(NPSDomainAccessor *)gizmoGlobalDomain BOOLForKey:@"AppleICUForce12HourTime"] ^ 1);
  }
  else {
    id v5 = [(NPSDomainAccessor *)gizmoGlobalDomain BOOLForKey:@"AppleICUForce24HourTime"];
  }

  return +[NSNumber numberWithBool:v5];
}

- (id)_currentLocale
{
  id v3 = [(NPSDomainAccessor *)self->_gizmoGlobalDomain synchronize];
  uint64_t v4 = [(NPSDomainAccessor *)self->_gizmoGlobalDomain objectForKey:@"AppleLocale"];
  if (v4) {
    id v5 = (__CFString *)v4;
  }
  else {
    id v5 = @"en_US";
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = +[NSLocale localeWithLocaleIdentifier:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_setAlertsActive:(id)a3 withSpecifier:(id)a4
{
  [(NSMutableDictionary *)self->_sectionInfo setObject:a3 forKey:BPSNanoBulletinShowsAlerts];

  [(NCBSMainMenuDataSource *)self _writeSectionState];
}

- (id)_getAlertsActive:(id)a3
{
  return [(NSMutableDictionary *)self->_sectionInfo objectForKey:BPSNanoBulletinShowsAlerts];
}

- (void)_setNotificationsIndicatorActive:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  id v6 = +[NTKClockStatusBarSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setNotificationsIndicatorEnabled:v5];
}

- (id)_getNotificationsIndicatorActive:(id)a3
{
  id v3 = +[NTKClockStatusBarSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isNotificationsIndicatorEnabled]);

  return v4;
}

- (void)_setTimeTravelEnabled:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  id v6 = +[NTKTimeTravelSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setTimeTravelEnabled:v5];
}

- (id)_getTimeTravelEnabled:(id)a3
{
  id v3 = +[NTKTimeTravelSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isTimeTravelEnabled]);

  return v4;
}

- (id)_getMonogram:(id)a3
{
  return +[NTKMonogram monogram];
}

- (void)handleCustomMonogramChange:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_76BC;
  v3[3] = &unk_C378;
  v3[4] = self;
  [(NCBSMainMenuDataSource *)self performUpdatesAnimated:0 usingBlock:v3];
}

- (id)_getFastFaceSwitchingEnabled
{
  id v3 = [(NPSDomainAccessor *)self->_faceSupportDomain synchronize];
  char v7 = 0;
  id v4 = [(NPSDomainAccessor *)self->_faceSupportDomain BOOLForKey:@"FaceSupportFastSwitching" keyExistsAndHasValidFormat:&v7];
  if (v7)
  {
    id v5 = +[NSNumber numberWithBool:v4];
  }
  else
  {
    id v5 = &__kCFBooleanFalse;
  }

  return v5;
}

- (void)_setFastFaceSwitchingEnabled:(id)a3
{
  [(NPSDomainAccessor *)self->_faceSupportDomain setObject:a3 forKey:@"FaceSupportFastSwitching"];
  id v4 = [(NPSDomainAccessor *)self->_faceSupportDomain synchronize];
  syncManager = self->_syncManager;
  CFStringRef v8 = @"FaceSupportFastSwitching";
  id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  char v7 = +[NSSet setWithArray:v6];
  [(NPSManager *)syncManager synchronizeNanoDomain:@"com.apple.NanoTimeKit.face" keys:v7];
}

- (id)_getFaceSupportNotificationEnabled
{
  id v3 = [(NPSDomainAccessor *)self->_faceSupportDomain synchronize];
  char v7 = 0;
  id v4 = [(NPSDomainAccessor *)self->_faceSupportDomain BOOLForKey:@"FaceSupportNotifications" keyExistsAndHasValidFormat:&v7];
  if (v7)
  {
    id v5 = +[NSNumber numberWithBool:v4];
  }
  else
  {
    id v5 = &__kCFBooleanTrue;
  }

  return v5;
}

- (void)_setFaceSupportNotificationEnabled:(id)a3
{
  [(NPSDomainAccessor *)self->_faceSupportDomain setObject:a3 forKey:@"FaceSupportNotifications"];
  id v4 = [(NPSDomainAccessor *)self->_faceSupportDomain synchronize];
  CFStringRef v9 = @"FaceSupportNotifications";
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  syncManager = self->_syncManager;
  char v7 = [(NPSDomainAccessor *)self->_faceSupportDomain domain];
  CFStringRef v8 = +[NSSet setWithArray:v5];
  [(NPSManager *)syncManager synchronizeNanoDomain:v7 keys:v8];
}

- (void)_setTapticChimesEnabled:(id)a3
{
  id v3 = [a3 BOOLValue];
  id v4 = +[AXTimeOutputPreferences sharedInstance];
  [v4 setVoiceOverTapticChimesEnabled:v3];
}

- (id)_tapticChimesEnabled
{
  v2 = +[AXTimeOutputPreferences sharedInstance];
  id v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 voiceOverTapticChimesEnabled]);

  return v3;
}

- (id)_tapticChimesCurrentSounds
{
  v2 = +[AXTimeOutputPreferences sharedInstance];
  id v3 = [v2 tapticChimesLocalizedCurrentSounds];

  return v3;
}

- (void)_setTapToSpeakTimeEnabled:(id)a3
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXTimeOutputPreferences sharedInstance];
  [v5 setTapToSpeakTimeEnabled:v4];

  [(NCBSMainMenuDataSource *)self reloadSpecifiers];
}

- (id)_tapToSpeakTimeEnabled
{
  v2 = +[AXTimeOutputPreferences sharedInstance];
  id v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 tapToSpeakTimeEnabled]);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceSupportDomain, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_gizmoGlobalDomain, 0);

  objc_storeStrong((id *)&self->_sectionInfo, 0);
}

@end