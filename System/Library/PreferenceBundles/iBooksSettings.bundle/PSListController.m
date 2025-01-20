@interface PSListController
+ (id)bk_groupContainerURL;
- (id)bk_appLocalDefaults;
- (id)bk_syncKeyForKey:(id)a3;
- (void)bk_setAndSyncPreferenceToWatch:(id)a3 specifier:(id)a4;
@end

@implementation PSListController

+ (id)bk_groupContainerURL
{
  if (qword_1E680 != -1) {
    dispatch_once(&qword_1E680, &stru_187E8);
  }
  v2 = (void *)qword_1E678;

  return v2;
}

- (id)bk_syncKeyForKey:(id)a3
{
  return [@"watchSynced-" stringByAppendingString:a3];
}

- (void)bk_setAndSyncPreferenceToWatch:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 target];
  [v8 setPreferenceValue:v6 specifier:v7];

  v9 = [v7 objectForKeyedSubscript:PSKeyNameKey];

  id v10 = objc_alloc_init((Class)NPSManager);
  id v11 = objc_alloc((Class)NSUserDefaults);
  v12 = +[PSListController bk_groupContainerURL];
  id v13 = [v11 _initWithSuiteName:@"group.com.apple.iBooks" container:v12];

  v14 = [(PSListController *)self bk_syncKeyForKey:v9];
  [v13 setObject:v6 forKey:v14];
  v15 = +[NSSet setWithObject:v14];
  [v10 synchronizeUserDefaultsDomain:@"group.com.apple.iBooks" keys:v15 container:@"com.apple.iBooks" appGroupContainer:@"group.com.apple.iBooks"];

  v16 = BKSettingsLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412802;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v14;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Synced setting to watch: %@(%@) = %@", (uint8_t *)&v17, 0x20u);
  }
}

- (id)bk_appLocalDefaults
{
  id v8 = 0;
  v2 = +[LSBundleRecord bundleRecordWithApplicationIdentifier:@"com.apple.iBooks" error:&v8];
  id v3 = v8;
  if (v3)
  {
    v4 = BKSettingsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_F56C((uint64_t)v3, v4);
    }
    id v5 = 0;
  }
  else
  {
    id v6 = objc_alloc((Class)NSUserDefaults);
    v4 = [v2 dataContainerURL];
    id v5 = [v6 _initWithSuiteName:@"com.apple.iBooks" container:v4];
  }

  return v5;
}

@end