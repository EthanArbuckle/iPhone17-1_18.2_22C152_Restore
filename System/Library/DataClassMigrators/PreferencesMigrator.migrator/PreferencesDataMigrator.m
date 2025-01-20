@interface PreferencesDataMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
- (void)_migrateKey:(id)a3 domain:(id)a4 toKey:(id)a5 toDomain:(id)a6 migrateCloud:(BOOL)a7;
- (void)_performCombinedLocationSettingsMigrationForBundles:(id)a3 key:(id)a4;
- (void)_performCombinedLocationSettingsMigrationForBundles:(id)a3 key:(id)a4 enable:(id)a5;
- (void)_performImproveMapsSettingsMigration;
- (void)_performIsAppAndAccessoryAnalyticsAllowedRemovalMigration;
- (void)_performLocationBasedAlertSettingsMigration;
- (void)_performLocationHomeKitSettingsMigration;
- (void)_performLocationRoutingAndTrafficSettingsMigration;
- (void)_performLocationWifiBluetoothUWBSettingsMigration;
- (void)_performLockdownModeMigration;
- (void)_performPeaceRestrictionsPinMigration;
- (void)_performSydneyHTTP3DeveloperOptInMigration;
- (void)_performSystemCustomizationSettingsMigration;
- (void)_performTigrisAutoBrightnessMigration;
- (void)_performTigrisHWAutoLockMigration;
- (void)_performTigrisSoundSettingsMigration;
- (void)_performYukonRevertSoundSettingsMigration;
@end

@implementation PreferencesDataMigrator

- (id)dataClassName
{
  return @"preferences";
}

- (float)estimatedDuration
{
  return 0.1;
}

- (float)migrationProgress
{
  float result = 1.0;
  if (!self->_done) {
    return 0.0;
  }
  return result;
}

- (void)_performTigrisAutoBrightnessMigration
{
  if ((([(PreferencesDataMigrator *)self didUpgrade] & 1) != 0
     || [(PreferencesDataMigrator *)self didRestoreFromBackup])
    && !CFPreferencesGetAppBooleanValue(@"ranTigrisAutoBrightnessMigrator11.0", @"com.apple.Preferences", 0))
  {
    v3 = PSUILogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Running Auto-Brightness migration", v4, 2u);
    }

    CFPreferencesSetAppValue(@"BKEnableALS", 0, @"com.apple.backboardd");
    CFPreferencesSynchronize(@"com.apple.backboardd", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  }
  CFPreferencesSetAppValue(@"ranTigrisAutoBrightnessMigrator11.0", kCFBooleanTrue, @"com.apple.Preferences");
}

- (void)_performTigrisHWAutoLockMigration
{
  if (PSIsPearlAvailable())
  {
    if ((([(PreferencesDataMigrator *)self didUpgrade] & 1) != 0
       || [(PreferencesDataMigrator *)self didRestoreFromBackup])
      && !CFPreferencesGetAppBooleanValue(@"ranTigrisHWAutoLockMigrator11.0", @"com.apple.Preferences", 0))
    {
      v3 = PSUILogForCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Running Auto-Lock migration.", v7, 2u);
      }

      v4 = +[MCProfileConnection sharedConnection];
      uint64_t v5 = MCFeatureAutoLockTime;
      v6 = [v4 defaultValueForSetting:MCFeatureAutoLockTime];
      [v4 setValue:v6 forSetting:v5];
    }
    CFPreferencesSetAppValue(@"ranTigrisHWAutoLockMigrator11.0", kCFBooleanTrue, @"com.apple.Preferences");
  }
}

- (void)_performLocationBasedAlertSettingsMigration
{
  id v3 = +[PUILocationSystemServicesListController locationBasedAlertBundles];
  [(PreferencesDataMigrator *)self _performCombinedLocationSettingsMigrationForBundles:v3 key:@"locationBasedAlertsMigrationVersionHash"];
}

- (void)_performLocationHomeKitSettingsMigration
{
  id v3 = +[PUILocationSystemServicesListController homeKitBundles];
  [(PreferencesDataMigrator *)self _performCombinedLocationSettingsMigrationForBundles:v3 key:@"locationHomeKitMigrationVersionHash"];
}

- (void)_performLocationRoutingAndTrafficSettingsMigration
{
  id v3 = +[PUILocationSystemServicesListController routingAndTrafficBundles];
  [(PreferencesDataMigrator *)self _performCombinedLocationSettingsMigrationForBundles:v3 key:@"locationRoutingAndTrafficMigrationVersionHash"];
}

- (void)_performLocationWifiBluetoothUWBSettingsMigration
{
  id v3 = +[PUILocationSystemServicesListController wirelessBundles];
  [(PreferencesDataMigrator *)self _performCombinedLocationSettingsMigrationForBundles:v3 key:@"locationWifiBluetoothUWBMigrationVersionHash"];
}

- (void)_performSystemCustomizationSettingsMigration
{
  id v3 = +[PUILocationSystemServicesListController systemCustomizationBundles];
  [(PreferencesDataMigrator *)self _performCombinedLocationSettingsMigrationForBundles:v3 key:@"locationSystemCustomizationMigrationVersionHash"];
}

- (void)_performImproveMapsSettingsMigration
{
  BOOL v3 = GEOGetDefaultInteger() == 2;
  id v5 = +[PUILocationSystemServicesListController improveMapsBundles];
  v4 = +[NSNumber numberWithBool:v3];
  [(PreferencesDataMigrator *)self _performCombinedLocationSettingsMigrationForBundles:v5 key:@"locationImproveMapsMigrationVersionHash" enable:v4];
}

- (void)_performCombinedLocationSettingsMigrationForBundles:(id)a3 key:(id)a4
{
}

- (void)_performCombinedLocationSettingsMigrationForBundles:(id)a3 key:(id)a4 enable:(id)a5
{
  v51 = self;
  id v7 = a3;
  CFStringRef key = (const __CFString *)a4;
  id v52 = a5;
  v8 = objc_opt_new();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v65;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v65 != v11) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v13 = *(const __CFString **)(*((void *)&v64 + 1) + 8 * i);
        v14 = +[NSFileManager defaultManager];
        unsigned int v15 = [v14 fileExistsAtPath:v13];

        if (v15)
        {
          [v8 addObject:v13];
        }
        else
        {
          v16 = PSUILogForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            CFStringRef v71 = key;
            __int16 v72 = 2114;
            CFStringRef v73 = v13;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Bundle for key %{public}@ in the bundle list but not on disk: %{public}@", buf, 0x16u);
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
    }
    while (v10);
  }

  if ([v8 count])
  {
    v17 = [v8 componentsJoinedByString:@","];
    id v18 = [v17 hash];

    v19 = (__CFString *)key;
    if (([(PreferencesDataMigrator *)v51 didUpgrade] & 1) != 0
      || [(PreferencesDataMigrator *)v51 didRestoreFromBackup])
    {
      CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(key, @"com.apple.Preferences", 0);
      v21 = PSUILogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = +[NSNumber numberWithInteger:AppIntegerValue];
        *(_DWORD *)buf = 138543618;
        CFStringRef v71 = key;
        __int16 v72 = 2114;
        CFStringRef v73 = v22;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Running combined location settings migration for key: %{public}@ from hash %{public}@", buf, 0x16u);
      }
      v23 = (PreferencesDataMigrator *)CLCopyAppsUsingLocation();
      id v53 = v18;
      if (v52)
      {
        unsigned int v24 = [v52 BOOLValue];
      }
      else
      {
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        v26 = v23;
        id v27 = [(PreferencesDataMigrator *)v26 countByEnumeratingWithState:&v60 objects:v69 count:16];
        if (v27)
        {
          id v28 = v27;
          v51 = v23;
          uint64_t v29 = *(void *)v61;
          while (2)
          {
            for (j = 0; j != v28; j = (char *)j + 1)
            {
              if (*(void *)v61 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
              v32 = -[PreferencesDataMigrator objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v31, v51);
              v33 = [v32 objectForKeyedSubscript:@"BundlePath"];

              v34 = [v8 objectAtIndexedSubscript:0];
              unsigned int v35 = [v33 isEqualToString:v34];

              if (v35)
              {
                v36 = [(PreferencesDataMigrator *)v26 objectForKeyedSubscript:v31];
                unsigned int v24 = +[CLLocationManager isEntityAuthorizedForLocationDictionary:v36];

                goto LABEL_32;
              }
            }
            id v28 = [(PreferencesDataMigrator *)v26 countByEnumeratingWithState:&v60 objects:v69 count:16];
            if (v28) {
              continue;
            }
            break;
          }
          unsigned int v24 = 0;
LABEL_32:
          v19 = (__CFString *)key;
          v23 = v51;
        }
        else
        {
          unsigned int v24 = 0;
        }
      }
      v37 = PSUILogForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v38 = @"OFF";
        if (v24) {
          CFStringRef v38 = @"ON";
        }
        *(_DWORD *)buf = 138543618;
        CFStringRef v71 = v19;
        __int16 v72 = 2114;
        CFStringRef v73 = v38;
        _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "State for key %{public}@ was %{public}@", buf, 0x16u);
      }

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v39 = v23;
      id v40 = [(PreferencesDataMigrator *)v39 countByEnumeratingWithState:&v56 objects:v68 count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v57;
        if (v24) {
          uint64_t v43 = 4;
        }
        else {
          uint64_t v43 = 1;
        }
        do
        {
          for (k = 0; k != v41; k = (char *)k + 1)
          {
            if (*(void *)v57 != v42) {
              objc_enumerationMutation(v39);
            }
            uint64_t v45 = *(void *)(*((void *)&v56 + 1) + 8 * (void)k);
            v46 = -[PreferencesDataMigrator objectForKeyedSubscript:](v39, "objectForKeyedSubscript:", v45, v51);
            v47 = [v46 objectForKeyedSubscript:@"BundlePath"];

            if ([v8 containsObject:v47])
            {
              v48 = [(PreferencesDataMigrator *)v39 objectForKeyedSubscript:v45];
              +[CLLocationManager setEntityAuthorization:v43 forLocationDictionary:v48];
            }
          }
          id v41 = [(PreferencesDataMigrator *)v39 countByEnumeratingWithState:&v56 objects:v68 count:16];
        }
        while (v41);
      }

      v19 = (__CFString *)key;
      id v18 = v53;
    }
    v49 = PSUILogForCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = +[NSNumber numberWithInteger:v18];
      *(_DWORD *)buf = 138543618;
      CFStringRef v71 = v19;
      __int16 v72 = 2114;
      CFStringRef v73 = v50;
      _os_log_impl(&dword_0, v49, OS_LOG_TYPE_DEFAULT, "Ran combined location settings migration for key %{public}@ for version hash %{public}@", buf, 0x16u);
    }
    v25 = +[NSNumber numberWithInteger:v18];
    CFPreferencesSetAppValue(v19, v25, @"com.apple.Preferences");
  }
  else
  {
    v25 = PSUILogForCategory();
    v19 = (__CFString *)key;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v71 = key;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "Skipping combined location settings migration for key: %{public}@ because there are no bundles on disk", buf, 0xCu);
    }
  }
}

- (void)_performTigrisSoundSettingsMigration
{
  if (!CFPreferencesGetAppBooleanValue(@"ranSoundMigrator11.0", @"com.apple.Preferences", 0)
    && [(PreferencesDataMigrator *)self didMigrateBackupFromDifferentDevice])
  {
    CFStringRef v3 = (const __CFString *)SHSSoundsPreferencesDomain;
    CFPreferencesSetAppValue(SHSCanAdjustVolumeUsingButtonsPreferencesKey, 0, SHSSoundsPreferencesDomain);
    CFPreferencesSynchronize(v3, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.preferences.sounds.buttons-can-change-ringer-volume.changed", 0, 0, 1u);
    CFPreferencesSetAppValue(@"ranSoundMigrator11.0", kCFBooleanTrue, @"com.apple.Preferences");
  }
}

- (void)_performYukonRevertSoundSettingsMigration
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ranSoundMigrator13.0", @"com.apple.Preferences", 0);
  CFStringRef v3 = PSUILogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = AppBooleanValue != 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "PreferencesMigrator: _performYukonRevertSoundSettingsMigration: %{BOOL}d", buf, 8u);
  }

  if (!AppBooleanValue)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFStringRef v4 = (const __CFString *)SHSSoundsPreferencesDomain;
    uint64_t v5 = CFPreferencesGetAppBooleanValue(SHSCanAdjustVolumeUsingButtonsPreferencesForSpringBoardKey, SHSSoundsPreferencesDomain, &keyExistsAndHasValidFormat);
    v6 = PSUILogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v9 = keyExistsAndHasValidFormat;
      __int16 v10 = 1024;
      int v11 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "PreferencesMigrator: isNewDefaultValid: %{BOOL}d newDefault: %{BOOL}d", buf, 0xEu);
    }

    if (keyExistsAndHasValidFormat) {
      CFPreferencesSetValue(SHSCanAdjustVolumeUsingButtonsPreferencesKey, +[NSNumber numberWithUnsignedChar:v5], v4, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    }
  }
  CFPreferencesSetAppValue(@"ranSoundMigrator13.0", kCFBooleanTrue, @"com.apple.Preferences");
  CFPreferencesSetAppValue(@"ranSoundMigrator12.0", 0, @"com.apple.Preferences");
}

- (void)_performPeaceRestrictionsPinMigration
{
  if ((([(PreferencesDataMigrator *)self didUpgrade] & 1) != 0
     || [(PreferencesDataMigrator *)self didRestoreFromBackup])
    && !CFPreferencesGetAppBooleanValue(@"ranRestrictionsPINMigrator12.0", @"com.apple.Preferences", 0))
  {
    +[SFRestrictionsPasscodeController migrateRestrictionsPasscode];
  }

  CFPreferencesSetAppValue(@"ranRestrictionsPINMigrator12.0", kCFBooleanTrue, @"com.apple.Preferences");
}

- (void)_performSydneyHTTP3DeveloperOptInMigration
{
  if ((([(PreferencesDataMigrator *)self didUpgrade] & 1) != 0
     || [(PreferencesDataMigrator *)self didRestoreFromBackup])
    && !CFPreferencesGetAppBooleanValue(@"ranHTTP3DeveloperOptInMigrator16.0", @"com.apple.Preferences", 0))
  {
    CFStringRef v3 = PSUILogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Running HTTP/3 developer opt-in migration", v4, 2u);
    }

    CFPreferencesSetAppValue(@"CFNetworkHTTP3Override", 0, @"Apple Global Domain");
  }
  CFPreferencesSetAppValue(@"ranHTTP3DeveloperOptInMigrator16.0", kCFBooleanTrue, @"com.apple.Preferences");
}

- (void)_performLockdownModeMigration
{
  v2 = PSUILogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Running Lockdown Mode's migrateIfNeeded…", (uint8_t *)v6, 2u);
  }

  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  CFStringRef v3 = (void *)qword_C2F8;
  uint64_t v10 = qword_C2F8;
  if (!qword_C2F8)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_5FE4;
    v6[3] = &unk_8278;
    v6[4] = &v7;
    sub_5FE4((uint64_t)v6);
    CFStringRef v3 = (void *)v8[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);
  uint64_t v5 = [v4 shared];
  [v5 migrateIfNeededWithCompletion:&stru_8250];
}

- (void)_performIsAppAndAccessoryAnalyticsAllowedRemovalMigration
{
  if ((([(PreferencesDataMigrator *)self didUpgrade] & 1) != 0
     || [(PreferencesDataMigrator *)self didRestoreFromBackup])
    && !CFPreferencesGetAppBooleanValue(@"isAppAndAccessoryAnalyticsAllowedRemoval", @"com.apple.Preferences", 0))
  {
    CFStringRef v3 = +[MCProfileConnection sharedConnection];
    [v3 removeBoolSetting:MCFeatureAppAndAccessoryAnalyticsAllowed];
  }

  CFPreferencesSetAppValue(@"isAppAndAccessoryAnalyticsAllowedRemoval", kCFBooleanTrue, @"com.apple.Preferences");
}

- (void)_migrateKey:(id)a3 domain:(id)a4 toKey:(id)a5 toDomain:(id)a6 migrateCloud:(BOOL)a7
{
  BOOL v7 = a7;
  int v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  CFStringRef v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  CFPropertyListRef v15 = CFPreferencesCopyAppValue(v11, v12);
  CFPropertyListRef v16 = CFPreferencesCopyAppValue(v13, v14);
  if (v15)
  {
    v17 = PSUILogForCategory();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        int v25 = 138412546;
        v26 = v12;
        __int16 v27 = 2112;
        id v28 = v11;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Removing defunct pref '%@' '%@'", (uint8_t *)&v25, 0x16u);
      }
    }
    else
    {
      if (v18)
      {
        int v25 = 138413058;
        v26 = v12;
        __int16 v27 = 2112;
        id v28 = v11;
        __int16 v29 = 2112;
        v30 = v14;
        __int16 v31 = 2112;
        v32 = v13;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Migrating pref '%@' '%@' => '%@' '%@'", (uint8_t *)&v25, 0x2Au);
      }

      CFPreferencesSetAppValue(v13, v15, v14);
    }
    CFPreferencesSetAppValue(v11, 0, v12);
    CFRelease(v15);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v7)
  {
    id v19 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:v12];
    v20 = [v19 objectForKey:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:v14];
      v22 = [v21 objectForKey:v13];
      v23 = PSUILogForCategory();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v24)
        {
          int v25 = 138412546;
          v26 = v12;
          __int16 v27 = 2112;
          id v28 = v11;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Removing defunct cloud pref '%@' '%@'", (uint8_t *)&v25, 0x16u);
        }
      }
      else
      {
        if (v24)
        {
          int v25 = 138413058;
          v26 = v12;
          __int16 v27 = 2112;
          id v28 = v11;
          __int16 v29 = 2112;
          v30 = v14;
          __int16 v31 = 2112;
          v32 = v13;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Migrating cloud pref from '%@' '%@' => '%@' %@'", (uint8_t *)&v25, 0x2Au);
        }

        objc_msgSend(v21, "setBool:forKey:", objc_msgSend(v20, "BOOLValue"), v13);
      }
      [v19 removeObjectForKey:v11];
    }
  }
}

- (BOOL)performMigration
{
  unsigned int v3 = [(PreferencesDataMigrator *)self didRestoreFromBackup];
  unsigned int v4 = [(PreferencesDataMigrator *)self didUpgrade];
  unsigned int v5 = [(PreferencesDataMigrator *)self didMigrateBackupFromDifferentDevice];
  v6 = PSUILogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109632;
    DWORD1(buf) = v3;
    WORD4(buf) = 1024;
    *(_DWORD *)((char *)&buf + 10) = v4;
    HIWORD(buf) = 1024;
    LODWORD(v20) = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "PreferencesMigrator: didRestore=%d, didUpgrade=%d, didMigrateFromDifferentDevice=%d", (uint8_t *)&buf, 0x14u);
  }

  BOOL v7 = PSUILogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)CFCopySystemVersionString();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Running %@", (uint8_t *)&buf, 0xCu);
  }
  [(PreferencesDataMigrator *)self _performTigrisAutoBrightnessMigration];
  [(PreferencesDataMigrator *)self _performTigrisHWAutoLockMigration];
  [(PreferencesDataMigrator *)self _performPeaceRestrictionsPinMigration];
  uint64_t v15 = 0;
  CFPropertyListRef v16 = &v15;
  uint64_t v17 = 0x2050000000;
  uint64_t v9 = (void *)qword_C308;
  uint64_t v18 = qword_C308;
  if (!qword_C308)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v20 = sub_619C;
    id v21 = &unk_8278;
    v22 = &v15;
    sub_619C((uint64_t)&buf);
    uint64_t v9 = (void *)v16[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v15, 8);
  int v11 = objc_msgSend(v10, "sharedManager", v15);
  unsigned __int8 v12 = [v11 isMultiUser];

  if ((v12 & 1) == 0) {
    PSMigrateSoundsDefaults_10_0();
  }
  [(PreferencesDataMigrator *)self _performTigrisSoundSettingsMigration];
  [(PreferencesDataMigrator *)self _performYukonRevertSoundSettingsMigration];
  [(PreferencesDataMigrator *)self _performLocationHomeKitSettingsMigration];
  [(PreferencesDataMigrator *)self _performLocationBasedAlertSettingsMigration];
  [(PreferencesDataMigrator *)self _performLocationRoutingAndTrafficSettingsMigration];
  [(PreferencesDataMigrator *)self _performLocationWifiBluetoothUWBSettingsMigration];
  [(PreferencesDataMigrator *)self _performSystemCustomizationSettingsMigration];
  [(PreferencesDataMigrator *)self _performImproveMapsSettingsMigration];
  [(PreferencesDataMigrator *)self _performSydneyHTTP3DeveloperOptInMigration];
  [(PreferencesDataMigrator *)self _performLockdownModeMigration];
  [(PreferencesDataMigrator *)self _performIsAppAndAccessoryAnalyticsAllowedRemovalMigration];
  self->_done = 1;
  CFStringRef v13 = PSUILogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "PreferencesMigrator: Finished.", (uint8_t *)&buf, 2u);
  }

  return 1;
}

@end