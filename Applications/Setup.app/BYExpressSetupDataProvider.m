@interface BYExpressSetupDataProvider
+ (BOOL)_shouldAddFeatureDeviceAndAppAnalyticsForDataSource:(id)a3;
+ (BOOL)_shouldAllowEnablingSiriWithVoiceTriggerEnabledSetting:(id)a3 hasNeededTrainingData:(BOOL)a4;
+ (id)featuresArrayForDataSource:(id)a3 eligibleForChlorine:(BOOL)a4;
+ (id)stringForDataSourceType:(unint64_t)a3;
- (BFFSettingsManager)settingsManager;
- (BOOL)_countrySupportsFastDeviceAnalyticsOptIn;
- (BOOL)_eligibleForChlorine;
- (BOOL)_fetchSiriVoiceProfileAvailability;
- (BOOL)_hasiCloudSiriTrainingDataForLanguage:(id)a3 withMetadata:(id)a4;
- (BOOL)_isControllerSkippedForFeature:(unint64_t)a3;
- (BOOL)_isRestrictedForFeature:(unint64_t)a3;
- (BOOL)_isStolenDeviceProtectionRestricted;
- (BOOL)_siriWantsToRun;
- (BOOL)_supportsAlwaysOnHeySiri;
- (BOOL)dataAvailable;
- (BOOL)hasVoiceProfileIniCloud;
- (BOOL)willRestoreOrMigrate;
- (BOOL)willRestoreOrReallyMigrate;
- (BYCapabilities)capabilities;
- (BYChronicle)chronicle;
- (BYDeviceProvider)deviceProvider;
- (BYExpressSettingsSetupCache)expressSettingsCache;
- (BYExpressSetupBackupSource)backupDataSource;
- (BYExpressSetupCloudSource)cloudDataSource;
- (BYExpressSetupDataProvider)initWithChronicle:(id)a3 displayZoomExecutor:(id)a4 capabilities:(id)a5 settingsManager:(id)a6 buddyPreferences:(id)a7 buddyPreferencesExcludedFromBackup:(id)a8 managedConfiguration:(id)a9 deviceProvider:(id)a10 expressSettingsCache:(id)a11;
- (BYExpressSetupDataSource)resolvedDataSource;
- (BYExpressSetupDefaultSource)defaultSource;
- (BYExpressSetupProximityDataSource)proximitySetupDataSource;
- (BYPreferencesController)buddyPreferences;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyDisplayZoomExecutor)displayZoomExecutor;
- (BuddyMiscState)miscState;
- (MCProfileConnection)managedConfiguration;
- (NSString)description;
- (OS_dispatch_queue)voiceProfileQueue;
- (PKPaymentSetupAssistantProvisioningContext)walletProvisioningContext;
- (id)_cloudConfigManager;
- (id)_countryCode;
- (id)_descriptionForDataSource:(id)a3;
- (id)_stringForFeature:(unint64_t)a3;
- (id)actionButtonData;
- (id)appAnalyticsOptIn;
- (id)dataSource;
- (id)deviceAnalyticsOptIn;
- (id)expressSetupFeatures;
- (id)locationServicesOptIn;
- (id)locationServicesSettings;
- (id)pairedWatches;
- (id)screenTimeEnabled;
- (id)siriDataSharingOptIn;
- (id)siriOptIn;
- (id)siriVoiceProfileAvailabilityMetadata;
- (id)siriVoiceTriggerEnabled;
- (id)softwareUpdateAutoDownloadEnabled;
- (id)softwareUpdateAutoUpdateEnabled;
- (id)sourceDeviceClass;
- (id)stolenDeviceProtectionEnabled;
- (id)stolenDeviceProtectionStrictModeEnabled;
- (id)stringForDataSourceFeatures:(id)a3;
- (id)underlyingDataSource;
- (id)walletMetadata;
- (id)watchMigrationData;
- (int64_t)userInterfaceStyleModeValue;
- (unint64_t)dataSourceType;
- (void)_applyDataSourceSetting:(BOOL)a3 forFeature:(unint64_t)a4;
- (void)applyDataSourceSetting:(BOOL)a3 forFeature:(unint64_t)a4;
- (void)applyExpressSettings;
- (void)prepare:(id)a3;
- (void)revertExpressSettings;
- (void)setBackupDataSource:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setChronicle:(id)a3;
- (void)setCloudDataSource:(id)a3;
- (void)setDefaultSource:(id)a3;
- (void)setDeviceProvider:(id)a3;
- (void)setDisplayZoomExecutor:(id)a3;
- (void)setExpressSettingsCache:(id)a3;
- (void)setHasVoiceProfileIniCloud:(BOOL)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setProximitySetupDataSource:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)setVoiceProfileQueue:(id)a3;
- (void)setWalletProvisioningContext:(id)a3;
- (void)setWillRestoreOrMigrate:(BOOL)a3;
- (void)setWillRestoreOrReallyMigrate:(BOOL)a3;
@end

@implementation BYExpressSetupDataProvider

- (BYExpressSetupDataProvider)initWithChronicle:(id)a3 displayZoomExecutor:(id)a4 capabilities:(id)a5 settingsManager:(id)a6 buddyPreferences:(id)a7 buddyPreferencesExcludedFromBackup:(id)a8 managedConfiguration:(id)a9 deviceProvider:(id)a10 expressSettingsCache:(id)a11
{
  id v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  id v29 = 0;
  objc_storeStrong(&v29, a6);
  id v28 = 0;
  objc_storeStrong(&v28, a7);
  id v27 = 0;
  objc_storeStrong(&v27, a8);
  id v26 = 0;
  objc_storeStrong(&v26, a9);
  id v25 = 0;
  objc_storeStrong(&v25, a10);
  id v24 = 0;
  objc_storeStrong(&v24, a11);
  id v16 = v33;
  id v33 = 0;
  v23.receiver = v16;
  v23.super_class = (Class)BYExpressSetupDataProvider;
  id v33 = [(BYExpressSetupDataProvider *)&v23 init];
  objc_storeStrong(&v33, v33);
  if (v33)
  {
    objc_storeStrong((id *)v33 + 11, location[0]);
    uint64_t v17 = objc_opt_new();
    v18 = (void *)*((void *)v33 + 3);
    *((void *)v33 + 3) = v17;

    objc_storeStrong((id *)v33 + 12, obj);
    objc_storeStrong((id *)v33 + 13, v30);
    objc_storeStrong((id *)v33 + 14, v29);
    objc_storeStrong((id *)v33 + 15, v28);
    objc_storeStrong((id *)v33 + 16, v27);
    objc_storeStrong((id *)v33 + 17, v26);
    objc_storeStrong((id *)v33 + 18, v25);
    dispatch_queue_t v19 = dispatch_queue_create("Siri Voice Profile Queue", 0);
    v20 = (void *)*((void *)v33 + 20);
    *((void *)v33 + 20) = v19;

    *((unsigned char *)v33 + 33) = 0;
    objc_storeStrong((id *)v33 + 19, v24);
  }
  v21 = (BYExpressSetupDataProvider *)v33;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v33, 0);
  return v21;
}

- (BOOL)_eligibleForChlorine
{
  v2 = self;
  objc_sync_enter(v2);
  if (!self->_didCacheEligibleForChlorine)
  {
    v3 = [(BYExpressSetupDataProvider *)self capabilities];
    self->_BOOL cachedEligibleForChlorine = [(BYCapabilities *)v3 eligibleForChlorine] & 1;

    self->_didCacheEligibleForChlorine = 1;
  }
  BOOL cachedEligibleForChlorine = self->_cachedEligibleForChlorine;
  objc_sync_exit(v2);

  return cachedEligibleForChlorine;
}

- (NSString)description
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)NSMutableString);
  [location[0] appendFormat:@"<%@: %p>\n", objc_opt_class(), v8];
  id v2 = [(BYExpressSetupDataProvider *)v8 _descriptionForDataSource:v8];
  [location[0] appendFormat:@"Resolved: %@\n", v2];

  id v3 = [(BYExpressSetupDataProvider *)v8 dataSource];
  id v4 = [(BYExpressSetupDataProvider *)v8 _descriptionForDataSource:v3];
  [location[0] appendFormat:@"Data source: %@\n", v4];

  v5 = (NSString *)location[0];
  objc_storeStrong(location, 0);
  return v5;
}

- (id)dataSource
{
  id v2 = [(BYExpressSetupDataProvider *)self backupDataSource];
  unsigned __int8 v3 = [(BYExpressSetupBackupSource *)v2 dataAvailable];

  if (v3)
  {
    v12 = [(BYExpressSetupDataProvider *)self backupDataSource];
  }
  else
  {
    id v4 = [(BYExpressSetupDataProvider *)self proximitySetupDataSource];
    unsigned __int8 v5 = [(BYExpressSetupProximityDataSource *)v4 dataAvailable];

    if (v5)
    {
      v12 = [(BYExpressSetupDataProvider *)self proximitySetupDataSource];
    }
    else
    {
      v6 = [(BYExpressSetupDataProvider *)self cloudDataSource];
      unsigned __int8 v7 = [(BYExpressSetupCloudSource *)v6 dataAvailable];

      if (v7)
      {
        v12 = [(BYExpressSetupDataProvider *)self cloudDataSource];
      }
      else
      {
        v8 = [(BYExpressSetupDataProvider *)self defaultSource];

        if (!v8)
        {
          v9 = objc_alloc_init(BYExpressSetupDefaultSource);
          [(BYExpressSetupDataProvider *)self setDefaultSource:v9];
        }
        v12 = [(BYExpressSetupDataProvider *)self defaultSource];
      }
    }
  }

  return v12;
}

- (unint64_t)dataSourceType
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = [(BYExpressSetupDataProvider *)self dataSource];
  if (!location[0]) {
    goto LABEL_10;
  }
  id v2 = [(BYExpressSetupDataProvider *)v8 cloudDataSource];

  if (location[0] != v2)
  {
    unsigned __int8 v3 = [(BYExpressSetupDataProvider *)v8 proximitySetupDataSource];

    if (location[0] == v3)
    {
      unint64_t v9 = 3;
      goto LABEL_11;
    }
    id v4 = [(BYExpressSetupDataProvider *)v8 backupDataSource];

    if (location[0] == v4)
    {
      unint64_t v9 = 2;
      goto LABEL_11;
    }
    unsigned __int8 v5 = [(BYExpressSetupDataProvider *)v8 defaultSource];

    if (location[0] == v5)
    {
      unint64_t v9 = 1;
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  unint64_t v9 = 4;
LABEL_11:
  objc_storeStrong(location, 0);
  return v9;
}

- (id)pairedWatches
{
  id v2 = +[NRMigrator sharedMigrator];
  id v3 = [(BYExpressSetupDataProvider *)self watchMigrationData];
  id v4 = [v2 devicesFromMigrationConsentRequestData:v3];

  return v4;
}

- (id)expressSetupFeatures
{
  v6 = self;
  obj[1] = (id)a2;
  if (!self->_listedFeatures)
  {
    id v2 = [objc_opt_class() featuresArrayForDataSource:v6 eligibleForChlorine:[self _eligibleForChlorine]];
    obj[0] = [v2 mutableCopy];

    if (![(BYExpressSetupDataProvider *)v6 willRestoreOrMigrate]) {
      [obj[0] removeObject:&off_1002C17D8];
    }
    if (![(BYExpressSetupDataProvider *)v6 willRestoreOrReallyMigrate]) {
      [obj[0] removeObject:&off_1002C17F0];
    }
    objc_storeStrong((id *)&v6->_listedFeatures, obj[0]);
    objc_storeStrong(obj, 0);
  }
  listedFeatures = v6->_listedFeatures;

  return listedFeatures;
}

- (BYExpressSetupDataSource)resolvedDataSource
{
  return self;
}

- (id)underlyingDataSource
{
  return [(BYExpressSetupDataProvider *)self dataSource];
}

+ (id)stringForDataSourceType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v4 = @"Undefined";
      break;
    case 1uLL:
      id v4 = @"Default";
      break;
    case 2uLL:
      id v4 = @"Backup";
      break;
    case 3uLL:
      id v4 = @"Proximity";
      break;
    case 4uLL:
      id v4 = @"iCloud";
      break;
    default:
      break;
  }

  return v4;
}

+ (id)featuresArrayForDataSource:(id)a3 eligibleForChlorine:(BOOL)a4
{
  id v35 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v33 = a4;
  id v32 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [location[0] siriOptIn];

  if (v5)
  {
    [v32 addObject:&off_1002C1808];
    id v6 = [location[0] siriDataSharingOptIn];

    if (v6) {
      [v32 addObject:&off_1002C1820];
    }
  }
  id v7 = [location[0] locationServicesOptIn];
  char v30 = 0;
  BOOL v8 = 1;
  if (!v7)
  {
    id v31 = [location[0] locationServicesSettings];
    char v30 = 1;
    BOOL v8 = v31 != 0;
  }
  if (v30) {

  }
  if (v8) {
    [v32 addObject:&off_1002C1838];
  }
  if (v33)
  {
    if ([v35 _shouldAddFeatureDeviceAndAppAnalyticsForDataSource:location[0]]) {
      [v32 addObject:&off_1002C1850];
    }
  }
  else
  {
    id v9 = [location[0] deviceAnalyticsOptIn];

    if (v9) {
      [v32 addObject:&off_1002C1868];
    }
    id v10 = [location[0] appAnalyticsOptIn];

    if (v10) {
      [v32 addObject:&off_1002C1880];
    }
  }
  id v11 = [location[0] screenTimeEnabled];

  if (v11) {
    [v32 addObject:&off_1002C1898];
  }
  id v12 = [location[0] softwareUpdateAutoDownloadEnabled];
  char v28 = 0;
  unsigned __int8 v13 = 0;
  if ([v12 BOOLValue])
  {
    id v29 = [location[0] softwareUpdateAutoUpdateEnabled];
    char v28 = 1;
    unsigned __int8 v13 = [v29 BOOLValue];
  }
  if (v28) {

  }
  if (v13) {
    [v32 addObject:&off_1002C18B0];
  }
  if ([location[0] userInterfaceStyleModeValue]) {
    [v32 addObject:&off_1002C18C8];
  }
  id v14 = [location[0] watchMigrationData];

  if (v14)
  {
    id v15 = +[NRMigrator sharedMigrator];
    id v16 = [location[0] watchMigrationData];
    id v27 = [v15 devicesFromMigrationConsentRequestData:v16];

    if ([v27 count]) {
      [v32 addObject:&off_1002C17D8];
    }
    objc_storeStrong(&v27, 0);
  }
  id v17 = [location[0] walletProvisioningContext];
  id v18 = [v17 setupAssistantCredentials];
  id v19 = [v18 count];

  if (v19) {
    [v32 addObject:&off_1002C18E0];
  }
  id v20 = [location[0] actionButtonData];

  if (v20) {
    [v32 addObject:&off_1002C18F8];
  }
  id v21 = [location[0] stolenDeviceProtectionEnabled];
  char v25 = 0;
  unsigned __int8 v22 = 0;
  if (v21)
  {
    id v26 = [location[0] stolenDeviceProtectionEnabled];
    char v25 = 1;
    unsigned __int8 v22 = [v26 BOOLValue];
  }
  if (v25) {

  }
  if (v22) {
    [v32 addObject:&off_1002C17F0];
  }
  id v23 = [v32 copy];
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);

  return v23;
}

- (id)stringForDataSourceFeatures:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = [objc_opt_class() featuresArrayForDataSource:location[0] eligibleForChlorine:[self _eligibleForChlorine]];
  id v14 = objc_alloc_init((Class)NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id v3 = v15;
  id v4 = [v3 countByEnumeratingWithState:__b objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(v3);
        }
        id v13 = *(id *)(__b[1] + 8 * i);
        id v7 = [v13 unsignedIntegerValue];
        id v8 = v14;
        id v9 = -[BYExpressSetupDataProvider _stringForFeature:](v17, "_stringForFeature:", v7, v7);
        [v8 addObject:v9];
      }
      id v4 = [v3 countByEnumeratingWithState:__b objects:v18 count:16];
    }
    while (v4);
  }

  id v10 = [v14 componentsJoinedByString:@","];
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);

  return v10;
}

- (BOOL)dataAvailable
{
  return 1;
}

- (id)sourceDeviceClass
{
  id v2 = [(BYExpressSetupDataProvider *)self dataSource];
  id v3 = [v2 sourceDeviceClass];

  return v3;
}

- (id)locationServicesOptIn
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:1])
  {
    id v5 = 0;
  }
  else
  {
    id v2 = [(BYExpressSetupDataProvider *)self dataSource];
    id v5 = [v2 locationServicesOptIn];
  }

  return v5;
}

- (id)locationServicesSettings
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:1])
  {
    id v5 = 0;
  }
  else
  {
    id v2 = [(BYExpressSetupDataProvider *)self dataSource];
    id v5 = [v2 locationServicesSettings];
  }

  return v5;
}

- (id)appAnalyticsOptIn
{
  id v6 = self;
  location[1] = (id)a2;
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:3])
  {
    id v7 = 0;
  }
  else if ([(BYExpressSetupDataProvider *)v6 _isRestrictedForFeature:3])
  {
    id v7 = 0;
  }
  else
  {
    location[0] = [(BYExpressSetupDataProvider *)v6 deviceAnalyticsOptIn];
    if (location[0])
    {
      if ([location[0] BOOLValue])
      {
        id v2 = [(BYExpressSetupDataProvider *)v6 dataSource];
        id v7 = [v2 appAnalyticsOptIn];
      }
      else
      {
        id v7 = &__kCFBooleanFalse;
      }
    }
    else
    {
      id v7 = 0;
    }
    objc_storeStrong(location, 0);
  }
  id v3 = v7;

  return v3;
}

- (id)deviceAnalyticsOptIn
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:2])
  {
    id v7 = 0;
  }
  else
  {
    char v5 = [(BYExpressSetupDataProvider *)self _countrySupportsFastDeviceAnalyticsOptIn];
    char v4 = [(BYExpressSetupDataProvider *)self _isRestrictedForFeature:2];
    if (v5 & 1) == 0 || (v4)
    {
      id v7 = 0;
    }
    else
    {
      id v2 = [(BYExpressSetupDataProvider *)self dataSource];
      id v7 = [v2 deviceAnalyticsOptIn];
    }
  }

  return v7;
}

- (id)siriOptIn
{
  v49 = self;
  location[1] = (id)a2;
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:5])
  {
    id v50 = 0;
  }
  else
  {
    id v2 = [(BYExpressSetupDataProvider *)v49 dataSource];
    id v3 = [v2 siriOptIn];
    BOOL v4 = v3 == 0;

    if (v4)
    {
      location[0] = (id)_BYLoggingFacility();
      os_log_type_t v47 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
      {
        char v5 = location[0];
        os_log_type_t v6 = v47;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Express Data Provider: Siri is nil", buf, 2u);
      }
      objc_storeStrong(location, 0);
      id v50 = 0;
    }
    else
    {
      char v45 = [(BYExpressSetupDataProvider *)v49 _isRestrictedForFeature:5];
      char v44 = 0;
      id v7 = [(BYExpressSetupDataProvider *)v49 capabilities];
      unsigned __int8 v8 = 0;
      if ([(BYCapabilities *)v7 canShowSiriScreen]) {
        unsigned __int8 v8 = [(BYExpressSetupDataProvider *)v49 _siriWantsToRun];
      }

      char v44 = v8 & 1;
      id v9 = [(BYExpressSetupDataProvider *)v49 dataSource];
      id v10 = [v9 siriOptIn];
      char v11 = [v10 BOOLValue] ^ 1;

      if (v11)
      {
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          sub_10004F3FC((uint64_t)v52, v44 & 1, v45 & 1);
          _os_log_impl((void *)&_mh_execute_header, oslog, v42, "Express Data Provider: Siri is disabled. Siri conditions: wantsToRun = %d, restricted = %d", v52, 0xEu);
        }
        objc_storeStrong((id *)&oslog, 0);
        if ((v45 & 1) != 0 || (v44 & 1) == 0)
        {
          id v50 = 0;
        }
        else
        {
          id v12 = [(BYExpressSetupDataProvider *)v49 dataSource];
          id v50 = [v12 siriOptIn];
        }
      }
      else
      {
        uint64_t v37 = 0;
        v38 = &v37;
        int v39 = 0x20000000;
        int v40 = 32;
        char v41 = 0;
        id v13 = [(BYExpressSetupDataProvider *)v49 voiceProfileQueue];
        block = _NSConcreteStackBlock;
        int v32 = -1073741824;
        int v33 = 0;
        v34 = sub_10014E604;
        id v35 = &unk_1002B1D70;
        v36[1] = &v37;
        v36[0] = v49;
        dispatch_sync(v13, &block);

        id v14 = [sub_10014E64C() sharedPreferences];
        id v15 = [v14 allSiriLanguageCodesForSystemLanguageCode:0 isGoodFit:0];
        id v30 = [v15 count];

        char v29 = [(BYExpressSetupDataProvider *)v49 _supportsAlwaysOnHeySiri];
        char v28 = 0;
        char v16 = 1;
        if (v29) {
          char v16 = *((unsigned char *)v38 + 24);
        }
        char v28 = v16 & 1;
        id v17 = [sub_10014E64C() sharedPreferences];
        id v27 = [v17 languageCode];

        char v26 = 0;
        char v18 = 0;
        if ((unint64_t)v30 > 1)
        {
          char v18 = 0;
          if (!v27) {
            char v18 = *((unsigned char *)v38 + 24) ^ 1;
          }
        }
        char v26 = v18 & 1;
        id v19 = [(BYExpressSetupDataProvider *)v49 dataSource];
        id v25 = [v19 siriVoiceTriggerEnabled];

        char v24 = +[BYExpressSetupDataProvider _shouldAllowEnablingSiriWithVoiceTriggerEnabledSetting:v25 hasNeededTrainingData:v28 & 1];
        os_log_t v23 = (os_log_t)(id)_BYLoggingFacility();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          sub_10014E764((uint64_t)v51, v44 & 1, v26 & 1, v45 & 1, v29 & 1, v38[3] & 1, (uint64_t)v25, v24 & 1);
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Express Data Provider: Siri conditions: wantsToRun = %d, needsLanguageDisambiguation = %d, restricted = %d, supportsAOP = %d, hasVoiceProfileIniCloud = %d, voiceTriggerEnabledSetting = %@, shouldAllowEnablingSiriWithVoiceTriggerDetails = %d", v51, 0x30u);
        }
        objc_storeStrong((id *)&v23, 0);
        if ((v45 & 1) != 0 || (v44 & 1) == 0 || (v26 & 1) != 0 || (v24 & 1) == 0)
        {
          id v50 = 0;
        }
        else
        {
          id v20 = [(BYExpressSetupDataProvider *)v49 dataSource];
          id v50 = [v20 siriOptIn];
        }
        objc_storeStrong(&v25, 0);
        objc_storeStrong(&v27, 0);
        objc_storeStrong(v36, 0);
        _Block_object_dispose(&v37, 8);
      }
    }
  }
  id v21 = v50;

  return v21;
}

+ (BOOL)_shouldAllowEnablingSiriWithVoiceTriggerEnabledSetting:(id)a3 hasNeededTrainingData:(BOOL)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0]) {
    BOOL v7 = ([location[0] BOOLValue] & 1) == 0 || a4;
  }
  else {
    BOOL v7 = 0;
  }
  objc_storeStrong(location, 0);
  return v7;
}

- (id)siriVoiceProfileAvailabilityMetadata
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:5])
  {
    id v5 = 0;
  }
  else
  {
    id v2 = [(BYExpressSetupDataProvider *)self dataSource];
    id v5 = [v2 siriVoiceProfileAvailabilityMetadata];
  }

  return v5;
}

- (id)siriDataSharingOptIn
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:5])
  {
    id v5 = 0;
  }
  else
  {
    id v2 = [(BYExpressSetupDataProvider *)self dataSource];
    id v5 = [v2 siriDataSharingOptIn];
  }

  return v5;
}

- (id)siriVoiceTriggerEnabled
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:5])
  {
    id v5 = 0;
  }
  else
  {
    id v2 = [(BYExpressSetupDataProvider *)self dataSource];
    id v5 = [v2 siriVoiceTriggerEnabled];
  }

  return v5;
}

- (id)screenTimeEnabled
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:7])
  {
    id v5 = 0;
  }
  else
  {
    id v2 = [(BYExpressSetupDataProvider *)self dataSource];
    id v5 = [v2 screenTimeEnabled];
  }

  return v5;
}

- (id)softwareUpdateAutoUpdateEnabled
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:8])
  {
    id v5 = 0;
  }
  else
  {
    id v2 = [(BYExpressSetupDataProvider *)self dataSource];
    id v5 = [v2 softwareUpdateAutoUpdateEnabled];
  }

  return v5;
}

- (id)softwareUpdateAutoDownloadEnabled
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:8])
  {
    id v5 = 0;
  }
  else
  {
    id v2 = [(BYExpressSetupDataProvider *)self dataSource];
    id v5 = [v2 softwareUpdateAutoDownloadEnabled];
  }

  return v5;
}

- (int64_t)userInterfaceStyleModeValue
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:9]) {
    return 0;
  }
  id v2 = [(BYExpressSetupDataProvider *)self dataSource];
  id v5 = [v2 userInterfaceStyleModeValue];

  return (int64_t)v5;
}

- (id)watchMigrationData
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:10])
  {
    id v7 = 0;
  }
  else
  {
    id v2 = [(BYExpressSetupDataProvider *)self capabilities];
    char v3 = [(BYCapabilities *)v2 supportsAppleWatch] ^ 1;

    if (v3)
    {
      id v7 = 0;
    }
    else
    {
      id v4 = [(BYExpressSetupDataProvider *)self dataSource];
      id v7 = [v4 watchMigrationData];
    }
  }

  return v7;
}

- (PKPaymentSetupAssistantProvisioningContext)walletProvisioningContext
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:11]) {
    id v4 = 0;
  }
  else {
    id v4 = self->_walletProvisioningContext;
  }

  return v4;
}

- (id)walletMetadata
{
  id v2 = [(BYExpressSetupDataProvider *)self dataSource];
  id v3 = [v2 walletMetadata];

  return v3;
}

- (id)actionButtonData
{
  if ([(BYExpressSetupDataProvider *)self _isControllerSkippedForFeature:12])
  {
    id v7 = 0;
  }
  else
  {
    id v2 = [(BYExpressSetupDataProvider *)self deviceProvider];
    char v3 = [(BYDeviceProvider *)v2 hasActionButton] ^ 1;

    if (v3)
    {
      id v7 = 0;
    }
    else
    {
      id v4 = [(BYExpressSetupDataProvider *)self dataSource];
      id v7 = [v4 actionButtonData];
    }
  }

  return v7;
}

- (id)stolenDeviceProtectionEnabled
{
  if ([(BYExpressSetupDataProvider *)self _isRestrictedForFeature:13])
  {
    id v5 = 0;
  }
  else
  {
    id v2 = [(BYExpressSetupDataProvider *)self dataSource];
    id v5 = [v2 stolenDeviceProtectionEnabled];
  }

  return v5;
}

- (id)stolenDeviceProtectionStrictModeEnabled
{
  id v2 = [(BYExpressSetupDataProvider *)self stolenDeviceProtectionEnabled];
  unsigned __int8 v3 = [v2 BOOLValue];

  if (v3)
  {
    id v4 = [(BYExpressSetupDataProvider *)self dataSource];
    id v7 = [v4 stolenDeviceProtectionStrictModeEnabled];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)prepare:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_10014F07C;
  unsigned __int8 v8 = &unk_1002B0CD0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_fetchSiriVoiceProfileAvailability
{
  id v17 = self;
  v16[1] = (id)a2;
  if ([(BYExpressSetupDataProvider *)self _supportsAlwaysOnHeySiri])
  {
    id v2 = [sub_10014E64C() sharedPreferences];
    v16[0] = [v2 languageCode];

    if (!v16[0])
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_10004B238((uint64_t)buf, (uint64_t)v16[0]);
        _os_log_impl((void *)&_mh_execute_header, oslog, v14, "Language code from AFPreferences = %@", buf, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      unsigned __int8 v3 = +[NSLocale currentLocale];
      id v4 = [(NSLocale *)v3 localeIdentifier];
      int v5 = +[NSLocale canonicalLanguageIdentifierFromString:v4];
      id v6 = v16[0];
      v16[0] = v5;

      os_log_t v13 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        sub_10004B238((uint64_t)v20, (uint64_t)v16[0]);
        _os_log_impl((void *)&_mh_execute_header, v13, v12, "Canonical language identifier from NSLocale = %@", v20, 0xCu);
      }
      objc_storeStrong((id *)&v13, 0);
    }
    id location = [(BYExpressSetupDataProvider *)v17 siriVoiceProfileAvailabilityMetadata];
    char v10 = [(BYExpressSetupDataProvider *)v17 _hasiCloudSiriTrainingDataForLanguage:v16[0] withMetadata:location];
    os_log_t v9 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = [(BYExpressSetupDataProvider *)v17 hasVoiceProfileIniCloud];
      sub_10006E000((uint64_t)v19, v7 & 1, (uint64_t)v16[0]);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Has stored voice profile = %d, language = %@", v19, 0x12u);
    }
    objc_storeStrong((id *)&v9, 0);
    char v18 = v10 & 1;
    objc_storeStrong(&location, 0);
    objc_storeStrong(v16, 0);
  }
  else
  {
    char v18 = 0;
  }
  return v18 & 1;
}

- (void)applyExpressSettings
{
  os_log_type_t v14 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v12;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Apply express settings...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  memset(__b, 0, sizeof(__b));
  id v4 = [(BYExpressSetupDataProvider *)v14 expressSetupFeatures];
  id v5 = [v4 countByEnumeratingWithState:__b objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v5; ++i)
      {
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(id *)(__b[1] + 8 * i);
        id v8 = [v10 unsignedIntegerValue];
        -[BYExpressSetupDataProvider applyDataSourceSetting:forFeature:](v14, "applyDataSourceSetting:forFeature:", 1, v8, v8);
      }
      id v5 = [v4 countByEnumeratingWithState:__b objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)revertExpressSettings
{
  os_log_type_t v14 = self;
  oslog[1] = (os_log_t)a2;
  if ([(NSMutableArray *)self->_appliedFeatures count])
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v2 = oslog[0];
      os_log_type_t v3 = v12;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Revert express settings", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    memset(__b, 0, sizeof(__b));
    id v4 = v14->_appliedFeatures;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:__b objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v5; ++i)
        {
          if (*(void *)__b[2] != v6) {
            objc_enumerationMutation(v4);
          }
          id v10 = *(id *)(__b[1] + 8 * i);
          id v8 = [v10 unsignedIntegerValue];
          -[BYExpressSetupDataProvider _applyDataSourceSetting:forFeature:](v14, "_applyDataSourceSetting:forFeature:", 0, v8, v8);
        }
        id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:__b objects:v15 count:16];
      }
      while (v5);
    }

    [(NSMutableArray *)v14->_appliedFeatures removeAllObjects];
  }
}

- (id)_stringForFeature:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id v4 = @"Location Services";
      break;
    case 2uLL:
      id v4 = @"Device Analytics";
      break;
    case 3uLL:
      id v4 = @"App Analytics";
      break;
    case 4uLL:
      id v4 = @"Device And App Analytics";
      break;
    case 5uLL:
      id v4 = @"Siri";
      break;
    case 6uLL:
      id v4 = @"Siri Data Sharing";
      break;
    case 7uLL:
      id v4 = @"Screen Time";
      break;
    case 8uLL:
      id v4 = @"Auto Update";
      break;
    case 9uLL:
      id v4 = @"Appearance";
      break;
    case 0xAuLL:
      id v4 = @"Watch";
      break;
    case 0xBuLL:
      id v4 = @"Apple Wallet";
      break;
    case 0xCuLL:
      id v4 = @"Action Button";
      break;
    case 0xDuLL:
      id v4 = @"Stolen Device Protection";
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (void)applyDataSourceSetting:(BOOL)a3 forFeature:(unint64_t)a4
{
  os_log_type_t v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  unint64_t v9 = a4;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id location = [(BYExpressSetupDataProvider *)v12 _stringForFeature:v9];
    sub_10004BB7C((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v7, "Applying value from data source for %{public}@...", buf, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BYExpressSetupDataProvider *)v12 _applyDataSourceSetting:v10 forFeature:v9];
  if (v10)
  {
    appliedFeatures = v12->_appliedFeatures;
    id v5 = +[NSNumber numberWithUnsignedInteger:v9];
    [(NSMutableArray *)appliedFeatures addObject:v5];
  }
}

- (id)_descriptionForDataSource:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = objc_alloc_init((Class)NSMutableString);
  [v22 appendFormat:@"<%@: %p {\n", objc_opt_class(), location[0]];
  id v3 = [location[0] locationServicesOptIn];
  id v4 = [location[0] locationServicesSettings];
  [v22 appendFormat:@"\tLocation Services: (opt-in: %@, data: %@)\n", v3, v4];

  id v5 = [location[0] deviceAnalyticsOptIn];
  [v22 appendFormat:@"\tDevice Analytics: %@\n", v5];

  id v6 = [location[0] appAnalyticsOptIn];
  [v22 appendFormat:@"\tApp Analytics: %@\n", v6];

  id v7 = [location[0] siriOptIn];
  id v8 = [location[0] siriVoiceProfileAvailabilityMetadata];
  id v9 = [location[0] siriDataSharingOptIn];
  id v10 = [location[0] siriVoiceTriggerEnabled];
  [v22 appendFormat:@"\tSiri: (opt-in: %@, metadata: %@, data sharing: %@, voice trigger enabled: %@)\n", v7, v8, v9, v10];

  id v11 = [location[0] screenTimeEnabled];
  [v22 appendFormat:@"\tScreen Time: %@\n", v11];

  id v12 = [location[0] softwareUpdateAutoUpdateEnabled];
  id v13 = [location[0] softwareUpdateAutoDownloadEnabled];
  [v22 appendFormat:@"\tAuto Update: (update: %@, download: %@)\n", v12, v13];

  id v14 = [location[0] stolenDeviceProtectionEnabled];
  [v22 appendFormat:@"\tStolen Device Protection: %@\n", v14];

  id v15 = [location[0] stolenDeviceProtectionStrictModeEnabled];
  [v22 appendFormat:@"\tStolen Device Protection Strict Mode: %@\n", v15];

  [v22 appendFormat:@"\tAppearance: %ld\n", [location[0] userInterfaceStyleModeValue]];
  id v16 = [location[0] watchMigrationData];
  [v22 appendFormat:@"\tWatch: %@\n", v16];

  id v17 = [location[0] walletProvisioningContext];
  id v18 = [v17 setupAssistantCredentials];
  [v22 appendFormat:@"\tApple Wallet: %lu credentials\n", [v18 count]];

  id v19 = [location[0] actionButtonData];
  [v22 appendFormat:@"\tAction Button: %@\n", v19];

  [v22 appendString:@"}>"];
  id v20 = v22;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v20;
}

- (void)_applyDataSourceSetting:(BOOL)a3 forFeature:(unint64_t)a4
{
  v115 = self;
  SEL v114 = a2;
  BOOL v113 = a3;
  location[1] = (id)a4;
  switch(a4)
  {
    case 1uLL:
      id v4 = [(BYExpressSetupDataProvider *)v115 dataSource];
      id v5 = [v4 locationServicesSettings];

      if (v5)
      {
        location[0] = 0;
        if (v113)
        {
          id v6 = [(BYExpressSetupDataProvider *)v115 dataSource];
          id v7 = [v6 locationServicesSettings];
          id v8 = location[0];
          location[0] = v7;
        }
        id v9 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        +[BuddyLocationServicesController setSettingsFromArchivedPreferences:location[0] settingsManager:v9];

        objc_storeStrong(location, 0);
      }
      else
      {
        char v111 = 0;
        char v109 = 0;
        char v107 = 0;
        unsigned __int8 v10 = 0;
        if (v113)
        {
          id v110 = [(BYExpressSetupDataProvider *)v115 dataSource];
          char v109 = 1;
          id v108 = [v110 locationServicesOptIn];
          char v107 = 1;
          unsigned __int8 v10 = [v108 BOOLValue];
        }
        if (v107) {

        }
        if (v109) {
        char v111 = v10 & 1;
        }
        id v11 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        +[BuddyLocationServicesController setSettingEnabled:v10 & 1 presented:v113 settingsManager:v11];
      }
      break;
    case 2uLL:
      if (v113)
      {
        id v12 = [(BYExpressSetupDataProvider *)v115 dataSource];
        id v13 = [v12 deviceAnalyticsOptIn];
        unsigned __int8 v14 = [v13 BOOLValue];
        id v15 = [(BYExpressSetupDataProvider *)v115 chronicle];
        id v16 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        id v17 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyDiagnosticsController setDeviceAnalyticsSubmissionEnabled:v14 & 1 presented:1 chronicle:v15 settingsManager:v16 buddyPreferences:v17];
      }
      else
      {
        id v18 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        id v19 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyDiagnosticsController clearDeviceAnalyticsSettingWithSettingsManager:v18 buddyPreferences:v19];
      }
      break;
    case 3uLL:
      if (v113)
      {
        id v20 = [(BYExpressSetupDataProvider *)v115 dataSource];
        id v21 = [v20 appAnalyticsOptIn];
        unsigned __int8 v22 = [v21 BOOLValue];
        os_log_t v23 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        char v24 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyAppActivityController setAppActivityEnabled:v22 & 1 presented:1 settingsManager:v23 buddyPreferences:v24];
      }
      else
      {
        id v25 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        char v26 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyAppActivityController clearAppActivitySettingWithSettingsManager:v25 buddyPreferences:v26];
      }
      break;
    case 4uLL:
      if (v113)
      {
        id v27 = [(BYExpressSetupDataProvider *)v115 dataSource];
        id v28 = [v27 deviceAnalyticsOptIn];
        unsigned __int8 v29 = [v28 BOOLValue];

        char v106 = v29 & 1;
        char v30 = v29 & 1;
        id v31 = [(BYExpressSetupDataProvider *)v115 chronicle];
        int v32 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        int v33 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyDiagnosticsController setDeviceAnalyticsSubmissionEnabled:v30 & 1 presented:1 chronicle:v31 settingsManager:v32 buddyPreferences:v33];

        v34 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        id v35 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyAppActivityController setAppActivityEnabled:v106 & 1 presented:1 settingsManager:v34 buddyPreferences:v35];
      }
      else
      {
        v36 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        uint64_t v37 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyDiagnosticsController clearDeviceAnalyticsSettingWithSettingsManager:v36 buddyPreferences:v37];

        v34 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        id v35 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyAppActivityController clearAppActivitySettingWithSettingsManager:v34 buddyPreferences:v35];
      }

      break;
    case 5uLL:
      char v105 = 0;
      char v103 = 0;
      char v101 = 0;
      unsigned __int8 v38 = 0;
      if (v113)
      {
        id v104 = [(BYExpressSetupDataProvider *)v115 dataSource];
        char v103 = 1;
        id v102 = [v104 siriOptIn];
        char v101 = 1;
        unsigned __int8 v38 = [v102 BOOLValue];
      }
      if (v101) {

      }
      if (v103) {
      char v105 = v38 & 1;
      }
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v99 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_10005A060(buf, v105 & 1);
        _os_log_impl((void *)&_mh_execute_header, oslog, v99, "Setting Siri enabled to %d", buf, 8u);
      }
      objc_storeStrong((id *)&oslog, 0);
      char v39 = v105;
      int v40 = [(BYExpressSetupDataProvider *)v115 settingsManager];
      +[AssistantOptInController setAssistantEnabled:v39 & 1 settingsManager:v40];

      char v98 = 0;
      char v96 = 0;
      char v94 = 0;
      unsigned __int8 v41 = 0;
      if (v105)
      {
        id v97 = [(BYExpressSetupDataProvider *)v115 dataSource];
        char v96 = 1;
        id v95 = [v97 siriVoiceTriggerEnabled];
        char v94 = 1;
        unsigned __int8 v41 = [v95 BOOLValue];
      }
      if (v94) {

      }
      if (v96) {
      char v98 = v41 & 1;
      }
      os_log_t v93 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v92 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        sub_10005A060(v118, v98 & 1);
        _os_log_impl((void *)&_mh_execute_header, v93, v92, "Setting Siri voice trigger enabled to %d", v118, 8u);
      }
      objc_storeStrong((id *)&v93, 0);
      if (v98)
      {
        id v42 = [sub_10014E64C() sharedPreferences];
        id v91 = [v42 languageCode];

        os_log_t v90 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v89 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          sub_10004B238((uint64_t)v117, (uint64_t)v91);
          _os_log_impl((void *)&_mh_execute_header, v90, v89, "Will enable Voice Trigger upon sync for language: %@", v117, 0xCu);
        }
        objc_storeStrong((id *)&v90, 0);
        id v43 = [sub_1001511D4() sharedInstance];
        [v43 enableVoiceTriggerUponVoiceProfileSyncForLanguage:v91];

        objc_storeStrong(&v91, 0);
      }
      char v44 = [(BYExpressSetupDataProvider *)v115 settingsManager];
      [(BFFSettingsManager *)v44 setAssistantVoiceTriggerEnabled:v98 & 1];

      char v45 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
      v46 = +[NSNumber numberWithBool:v113];
      [(BYPreferencesController *)v45 setObject:v46 forKey:BYBuddyAssistantPresentedKey];

      if ([(BYExpressSetupDataProvider *)v115 _supportsAlwaysOnHeySiri])
      {
        os_log_type_t v47 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        v48 = +[NSNumber numberWithBool:v113];
        [(BYPreferencesController *)v47 setObject:v48 forKey:BYBuddyAssistantPHSOfferedKey];
      }
      break;
    case 6uLL:
      id v88 = objc_alloc_init((Class)sub_1001512EC());
      uint64_t v87 = 0;
      char v85 = 0;
      char v83 = 0;
      BOOL v49 = 0;
      if (v113)
      {
        id v86 = [(BYExpressSetupDataProvider *)v115 dataSource];
        char v85 = 1;
        id v84 = [v86 siriDataSharingOptIn];
        char v83 = 1;
        BOOL v49 = v84 != 0;
      }
      if (v83) {

      }
      if (v85) {
      if (v49)
      }
      {
        id v50 = [(BYExpressSetupDataProvider *)v115 dataSource];
        id v51 = [v50 siriDataSharingOptIn];
        unsigned __int8 v52 = [v51 BOOLValue];

        if (v52) {
          uint64_t v87 = 1;
        }
        else {
          uint64_t v87 = 2;
        }
      }
      os_log_t v82 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v81 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        sub_100151404((uint64_t)v116, v87);
        _os_log_impl((void *)&_mh_execute_header, v82, v81, "Setting Siri data sharing opt-in to %{public}ld", v116, 0xCu);
      }
      objc_storeStrong((id *)&v82, 0);
      id v53 = +[BYExpressSetupDataProvider stringForDataSourceType:[(BYExpressSetupDataProvider *)v115 dataSourceType]];
      id v80 = +[NSString stringWithFormat:@"express setup (%@)", v53];

      [v88 setSiriDataSharingOptInStatus:v87 propagateToHomeAccessories:0 source:1 reason:v80 completion:&stru_1002B3A38];
      objc_storeStrong(&v80, 0);
      objc_storeStrong(&v88, 0);
      break;
    case 7uLL:
      if (v113)
      {
        v54 = (BYPreferencesController *)[(BYExpressSetupDataProvider *)v115 dataSource];
        id v55 = [(BYPreferencesController *)v54 screenTimeEnabled];
        unsigned __int8 v56 = [v55 BOOLValue];
        v57 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyScreenTimeController setScreenTimeEnabled:v56 & 1 presented:1 buddyPreferences:v57];
      }
      else
      {
        v54 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyScreenTimeController clearScreenTimeSetting:v54];
      }
      goto LABEL_61;
    case 8uLL:
      if (v113)
      {
        v54 = (BYPreferencesController *)[(BYExpressSetupDataProvider *)v115 dataSource];
        id v58 = [(BYPreferencesController *)v54 softwareUpdateAutoUpdateEnabled];
        unsigned __int8 v59 = [v58 BOOLValue];
        v60 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyAutoUpdateController setAutoDownloadWithUpdateEnabled:v59 & 1 presented:1 buddyPreferences:v60];
      }
      else
      {
        v54 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyAutoUpdateController clearAutoDownloadWithUpdateSetting:v54];
      }
LABEL_61:

      break;
    case 9uLL:
      if (v113)
      {
        id v61 = [(BYExpressSetupDataProvider *)v115 userInterfaceStyleModeValue];
        v62 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyUserInterfaceStyleSelector setUserInterfaceStyleModeValue:v61 presented:1 buddyPreferences:v62];
      }
      else
      {
        v63 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
        +[BuddyUserInterfaceStyleSelector clearUserInterfaceStyleMode:v63];
      }
      break;
    case 0xAuLL:
      if (v113)
      {
        id v64 = [(BYExpressSetupDataProvider *)v115 pairedWatches];
        id v79 = +[NRMigrator migrationDataPreRestoreForConsentedDevices:v64];

        v65 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        v66 = [(BYExpressSetupDataProvider *)v115 buddyPreferencesExcludedFromBackup];
        +[BuddyWatchMigrationController setWatchDataForMigration:v79 presented:1 settingsManager:v65 buddyPreferencesExcludedFromBackup:v66];

        objc_storeStrong(&v79, 0);
      }
      else
      {
        v67 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        v68 = [(BYExpressSetupDataProvider *)v115 buddyPreferencesExcludedFromBackup];
        +[BuddyWatchMigrationController clearWatchDataForMigrationWithSettingsManager:v67 buddyPreferencesExcludedFromBackup:v68];
      }
      break;
    case 0xBuLL:
      if (v113)
      {
        v69 = [(BYExpressSetupDataProvider *)v115 walletProvisioningContext];
        v70 = [(BYExpressSetupDataProvider *)v115 miscState];
        [(BuddyMiscState *)v70 setWalletProvisioningContext:v69];
      }
      else
      {
        v69 = [(BYExpressSetupDataProvider *)v115 miscState];
        [(PKPaymentSetupAssistantProvisioningContext *)v69 setWalletProvisioningContext:0];
      }
      goto LABEL_74;
    case 0xCuLL:
      if (v113)
      {
        id v71 = [(BYExpressSetupDataProvider *)v115 actionButtonData];
        +[BYActionButtonStore setCurrentData:v71];

        v72 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        id v73 = [(BYExpressSetupDataProvider *)v115 actionButtonData];
        [(BFFSettingsManager *)v72 stashActionButtonData:v73];
      }
      else
      {
        +[BYActionButtonStore setCurrentData:0];
        v72 = [(BYExpressSetupDataProvider *)v115 settingsManager];
        [(BFFSettingsManager *)v72 stashActionButtonData:0];
      }

      v74 = [(BYExpressSetupDataProvider *)v115 buddyPreferences];
      v75 = +[NSNumber numberWithBool:v113];
      [(BYPreferencesController *)v74 setObject:v75 forKey:@"ButtonConfigurationPresented"];

      break;
    case 0xDuLL:
      v76 = [(BYExpressSetupDataProvider *)v115 buddyPreferencesExcludedFromBackup];
      v77 = +[NSNumber numberWithBool:v113];
      [(BYPreferencesController *)v76 setObject:v77 forKey:@"StolenDeviceProtectionPresented"];

      v69 = [(BYExpressSetupDataProvider *)v115 expressSettingsCache];
      if (v113) {
        [(PKPaymentSetupAssistantProvisioningContext *)v69 setApplyHandlerFor:13];
      }
      else {
        [(PKPaymentSetupAssistantProvisioningContext *)v69 removeApplyHandlerFor:13];
      }
LABEL_74:

      break;
    default:
      break;
  }
  if (v113)
  {
    v78 = [(BYExpressSetupDataProvider *)v115 expressSettingsCache];
    [(BYExpressSettingsSetupCache *)v78 setExpressDataSource:v115];
  }
  else
  {
    v78 = [(BYExpressSetupDataProvider *)v115 expressSettingsCache];
    [(BYExpressSettingsSetupCache *)v78 setExpressDataSource:0];
  }
}

- (BOOL)_isControllerSkippedForFeature:(unint64_t)a3
{
  uint64_t v7 = 0;
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
      id v3 = [(BYExpressSetupDataProvider *)self _cloudConfigManager];
      break;
    case 0xDuLL:
      uint64_t v7 = objc_opt_class();
      goto LABEL_4;
    default:
LABEL_4:
      id v3 = [(BYExpressSetupDataProvider *)self _cloudConfigManager];
      break;
  }
  id v4 = v3;
  unsigned __int8 v5 = [v4 cloudConfigWantsToSkipControllerClass:v8];

  return v5 & 1;
}

- (BOOL)_isRestrictedForFeature:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
      char v14 = 0;
      break;
    case 2uLL:
      id v3 = [(BYExpressSetupDataProvider *)self capabilities];
      char v14 = [(BYCapabilities *)v3 isDeviceAnalyticsRestricted] & 1;

      break;
    case 3uLL:
      id v4 = [(BYExpressSetupDataProvider *)self capabilities];
      char v14 = [(BYCapabilities *)v4 isAppAnalyticsRestricted] & 1;

      break;
    case 4uLL:
      unsigned __int8 v5 = [(BYExpressSetupDataProvider *)self capabilities];
      unsigned __int8 v6 = [(BYCapabilities *)v5 isDeviceAnalyticsRestricted];
      char v11 = 0;
      unsigned __int8 v7 = 1;
      if ((v6 & 1) == 0)
      {
        id v12 = [(BYExpressSetupDataProvider *)self capabilities];
        char v11 = 1;
        unsigned __int8 v7 = [(BYCapabilities *)v12 isAppAnalyticsRestricted];
      }
      char v14 = v7 & 1;
      if (v11) {

      }
      break;
    case 5uLL:
    case 6uLL:
      uint64_t v8 = [(BYExpressSetupDataProvider *)self capabilities];
      char v14 = [(BYCapabilities *)v8 isSiriRestricted] & 1;

      break;
    case 7uLL:
      id v9 = [(BYExpressSetupDataProvider *)self capabilities];
      char v14 = [(BYCapabilities *)v9 isScreenTimeRestricted] & 1;

      break;
    case 0xDuLL:
      char v14 = [(BYExpressSetupDataProvider *)self _isStolenDeviceProtectionRestricted];
      break;
    default:
      return v14 & 1;
  }
  return v14 & 1;
}

- (id)_cloudConfigManager
{
  return +[BuddyCloudConfigManager sharedManager];
}

- (BOOL)_countrySupportsFastDeviceAnalyticsOptIn
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = [(BYExpressSetupDataProvider *)self _countryCode];
  id location = &off_1002C1518;
  BOOL v5 = ([location containsObject:v4[0]] & 1) == 0;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v4, 0);
  return v5;
}

- (id)_countryCode
{
  id v2 = +[NSLocale currentLocale];
  id v3 = [(NSLocale *)v2 countryCode];

  return v3;
}

- (BOOL)_siriWantsToRun
{
  return BYAssistantScreenShouldBeShownInSetupAssistant() & 1;
}

- (BOOL)_supportsAlwaysOnHeySiri
{
  return MGGetBoolAnswer() & 1;
}

- (BOOL)_hasiCloudSiriTrainingDataForLanguage:(id)a3 withMetadata:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v5 = [sub_1001511D4() sharedInstance];
  unsigned __int8 v6 = [v5 hasVoiceProfileIniCloudForLanguageCode:location[0] withBackupMetaBlob:v10];

  char v9 = v6 & 1;
  if ((v6 & 1) == 0)
  {
    id v7 = [sub_1001511D4() sharedInstance];
    char v9 = [v7 hasVoiceProfileIniCloudForLanguageCode:location[0]] & 1;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (BOOL)_isStolenDeviceProtectionRestricted
{
  id v17 = self;
  SEL v16 = a2;
  id v2 = [(BYExpressSetupDataProvider *)self capabilities];
  unsigned __int8 v3 = [(BYCapabilities *)v2 isPearlEnrolled];
  char v14 = 0;
  unsigned __int8 v4 = 1;
  if ((v3 & 1) == 0)
  {
    id v15 = [(BYExpressSetupDataProvider *)v17 capabilities];
    char v14 = 1;
    unsigned __int8 v4 = [v15 isTouchIDEnrolled];
  }
  char v5 = v4 ^ 1;
  if (v14) {

  }
  if (v5)
  {
    return 1;
  }
  else
  {
    unsigned __int8 v6 = +[LARatchetManager sharedInstance];
    char v7 = [(LARatchetManager *)v6 isFeatureAvailable] ^ 1;

    if (v7)
    {
      return 1;
    }
    else
    {
      uint64_t v8 = +[AKAccountManager sharedInstance];
      id location = [(AKAccountManager *)v8 primaryAuthKitAccount];

      char v11 = 0;
      BOOL v9 = 1;
      if (location)
      {
        id v12 = +[AKAccountManager sharedInstance];
        char v11 = 1;
        BOOL v9 = [(AKAccountManager *)v12 securityLevelForAccount:location] != (id)4;
      }
      if (v11) {

      }
      BOOL v18 = v9;
      objc_storeStrong(&location, 0);
    }
  }
  return v18;
}

+ (BOOL)_shouldAddFeatureDeviceAndAppAnalyticsForDataSource:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] deviceAnalyticsOptIn];
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  unsigned __int8 v4 = 0;
  if (v3)
  {
    id v11 = [location[0] appAnalyticsOptIn];
    char v10 = 1;
    unsigned __int8 v4 = 0;
    if (v11)
    {
      id v9 = [location[0] deviceAnalyticsOptIn];
      char v8 = 1;
      id v7 = [location[0] appAnalyticsOptIn];
      char v6 = 1;
      unsigned __int8 v4 = [v9 isEqualToNumber:];
    }
  }
  char v13 = v4 & 1;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  objc_storeStrong(location, 0);
  return v13 & 1;
}

- (BYExpressSetupCloudSource)cloudDataSource
{
  return self->_cloudDataSource;
}

- (void)setCloudDataSource:(id)a3
{
}

- (BYExpressSetupProximityDataSource)proximitySetupDataSource
{
  return self->_proximitySetupDataSource;
}

- (void)setProximitySetupDataSource:(id)a3
{
}

- (BYExpressSetupBackupSource)backupDataSource
{
  return self->_backupDataSource;
}

- (void)setBackupDataSource:(id)a3
{
}

- (BYExpressSetupDefaultSource)defaultSource
{
  return self->_defaultSource;
}

- (void)setDefaultSource:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (void)setWalletProvisioningContext:(id)a3
{
}

- (BOOL)willRestoreOrMigrate
{
  return self->_willRestoreOrMigrate;
}

- (void)setWillRestoreOrMigrate:(BOOL)a3
{
  self->_willRestoreOrMigrate = a3;
}

- (BOOL)willRestoreOrReallyMigrate
{
  return self->_willRestoreOrReallyMigrate;
}

- (void)setWillRestoreOrReallyMigrate:(BOOL)a3
{
  self->_willRestoreOrReallyMigrate = a3;
}

- (BYChronicle)chronicle
{
  return self->_chronicle;
}

- (void)setChronicle:(id)a3
{
}

- (BuddyDisplayZoomExecutor)displayZoomExecutor
{
  return self->_displayZoomExecutor;
}

- (void)setDisplayZoomExecutor:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
}

- (BYExpressSettingsSetupCache)expressSettingsCache
{
  return self->_expressSettingsCache;
}

- (void)setExpressSettingsCache:(id)a3
{
}

- (BOOL)hasVoiceProfileIniCloud
{
  return self->_hasVoiceProfileIniCloud;
}

- (void)setHasVoiceProfileIniCloud:(BOOL)a3
{
  self->_hasVoiceProfileIniCloud = a3;
}

- (OS_dispatch_queue)voiceProfileQueue
{
  return self->_voiceProfileQueue;
}

- (void)setVoiceProfileQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end