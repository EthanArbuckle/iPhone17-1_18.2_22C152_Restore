@interface CSLPRFBackgroundAppRefreshSettingsViewController
- (CSLPRFBackgroundAppRefreshSettingsViewController)init;
- (CSLPRFDefaultAppDataProvider)appLibrary;
- (NPSDomainAccessor)backgroundAppRefreshDomainAccessor;
- (NPSManager)syncManager;
- (NSArray)sortedAppList;
- (NSMutableArray)disabledAppList;
- (id)backgroundAppRefreshState:(id)a3;
- (id)specifiers;
- (void)_appsLoaded:(id)a3;
- (void)_loadApps;
- (void)dataProviderDidChange:(id)a3;
- (void)dealloc;
- (void)setAppLibrary:(id)a3;
- (void)setBackgroundAppRefreshDomainAccessor:(id)a3;
- (void)setBackgroundAppRefreshState:(id)a3 specifier:(id)a4;
- (void)setDisabledAppList:(id)a3;
- (void)setSortedAppList:(id)a3;
- (void)setSyncManager:(id)a3;
@end

@implementation CSLPRFBackgroundAppRefreshSettingsViewController

- (CSLPRFBackgroundAppRefreshSettingsViewController)init
{
  v14.receiver = self;
  v14.super_class = (Class)CSLPRFBackgroundAppRefreshSettingsViewController;
  v2 = [(CSLPRFBackgroundAppRefreshSettingsViewController *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v3;

    v5 = [(CSLPRFBackgroundAppRefreshSettingsViewController *)v2 backgroundAppRefreshDomainAccessor];
    v6 = [v5 arrayForKey:@"DisabledBackgroundAppUpdateBundleIDs"];
    uint64_t v7 = +[NSMutableArray arrayWithArray:v6];
    disabledAppList = v2->_disabledAppList;
    v2->_disabledAppList = (NSMutableArray *)v7;

    v9 = (CSLPRFDefaultAppDataProvider *)objc_alloc_init((Class)CSLPRFDefaultAppDataProvider);
    appLibrary = v2->_appLibrary;
    v2->_appLibrary = v9;

    [(CSLPRFDefaultAppDataProvider *)v2->_appLibrary setDelegate:v2];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_2320, @"com.apple.Carousel.DisableBackgroundAppUpdates", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, v2, (CFNotificationCallback)sub_2320, @"com.apple.Carousel.DisabledBackgroundAppUpdateBundleIDs", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(CSLPRFBackgroundAppRefreshSettingsViewController *)v2 _loadApps];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"NARApplicationsChangedNotification", 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"com.apple.Carousel.DisableBackgroundAppUpdates", 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, @"com.apple.Carousel.DisabledBackgroundAppUpdateBundleIDs", 0);
  v6.receiver = self;
  v6.super_class = (Class)CSLPRFBackgroundAppRefreshSettingsViewController;
  [(CSLPRFBackgroundAppRefreshSettingsViewController *)&v6 dealloc];
}

- (void)_loadApps
{
  objc_initWeak(&location, self);
  appLibrary = self->_appLibrary;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2480;
  v4[3] = &unk_41A0;
  objc_copyWeak(&v5, &location);
  [(CSLPRFDefaultAppDataProvider *)appLibrary loadAppsWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_appsLoaded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = [v4 sortedArrayUsingComparator:&stru_41E0];

  sortedAppList = self->_sortedAppList;
  self->_sortedAppList = v5;

  [(CSLPRFBackgroundAppRefreshSettingsViewController *)self reloadSpecifiers];
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc((Class)NSMutableArray);
    objc_super v6 = [(CSLPRFBackgroundAppRefreshSettingsViewController *)v2 loadSpecifiersFromPlistName:@"BackgroundAppRefresh" target:v2];
    id v7 = [v5 initWithArray:v6];

    v8 = +[PSSpecifier emptyGroupSpecifier];
    [v8 setIdentifier:@"INSTALLED_APP_GROUP_ID"];
    [v7 addObject:v8];
    if (v2->_sortedAppList)
    {
      uint64_t v24 = v3;
      v28 = v7;
      v9 = [(CSLPRFBackgroundAppRefreshSettingsViewController *)v2 backgroundAppRefreshDomainAccessor];
      unsigned int v27 = [v9 BOOLForKey:@"DisableBackgroundAppUpdates"];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v29 = v2;
      obj = v2->_sortedAppList;
      id v10 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v26 = *(void *)v31;
        uint64_t v12 = PSLazyIconAppID;
        uint64_t v13 = PSLazyIconLoading;
        uint64_t v14 = PSCellClassKey;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v31 != v26) {
              objc_enumerationMutation(obj);
            }
            v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v17 = [v16 name];
            v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:v29 set:"setBackgroundAppRefreshState:specifier:" get:"backgroundAppRefreshState:" detail:0 cell:6 edit:0];

            v19 = [v16 bundleID];
            [v18 setProperty:v19 forKey:v12];

            [v18 setProperty:&__kCFBooleanTrue forKey:v13];
            [v18 setProperty:objc_opt_class() forKey:v14];
            v20 = +[NSNumber numberWithBool:v27];
            [v18 setProperty:v20 forKey:@"GlobalBARStateKey"];

            [v18 setProperty:v16 forKey:@"CSLPRFAppKey"];
            [v28 addObject:v18];
          }
          id v11 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v11);
      }

      id v7 = v28;
      v2 = v29;
      uint64_t v3 = v24;
    }
    else
    {
      v21 = +[PSSpecifier preferenceSpecifierNamed:0 target:v2 set:0 get:0 detail:0 cell:15 edit:0];
      [v7 addObject:v21];
    }
    v22 = *(void **)&v2->PSListController_opaque[v3];
    *(void *)&v2->PSListController_opaque[v3] = v7;

    id v4 = *(void **)&v2->PSListController_opaque[v3];
  }

  return v4;
}

- (void)setBackgroundAppRefreshState:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = [a4 propertyForKey:@"CSLPRFAppKey"];
  v8 = [v7 bundleID];
  unsigned int v9 = [v6 BOOLValue];

  disabledAppList = self->_disabledAppList;
  if (v9) {
    [(NSMutableArray *)disabledAppList removeObject:v8];
  }
  else {
    [(NSMutableArray *)disabledAppList addObject:v8];
  }
  id v11 = [(CSLPRFBackgroundAppRefreshSettingsViewController *)self backgroundAppRefreshDomainAccessor];
  [v11 setObject:self->_disabledAppList forKey:@"DisabledBackgroundAppUpdateBundleIDs"];

  uint64_t v12 = [(CSLPRFBackgroundAppRefreshSettingsViewController *)self backgroundAppRefreshDomainAccessor];
  id v13 = [v12 synchronize];

  syncManager = self->_syncManager;
  CFStringRef v17 = @"DisabledBackgroundAppUpdateBundleIDs";
  v15 = +[NSArray arrayWithObjects:&v17 count:1];
  v16 = +[NSSet setWithArray:v15];
  [(NPSManager *)syncManager synchronizeNanoDomain:@"com.apple.Carousel" keys:v16];
}

- (id)backgroundAppRefreshState:(id)a3
{
  id v4 = [a3 propertyForKey:@"CSLPRFAppKey"];
  disabledAppList = self->_disabledAppList;
  id v6 = [v4 bundleID];
  id v7 = +[NSNumber numberWithInt:[(NSMutableArray *)disabledAppList containsObject:v6] ^ 1];

  return v7;
}

- (NPSDomainAccessor)backgroundAppRefreshDomainAccessor
{
  backgroundAppRefreshDomainAccessor = self->_backgroundAppRefreshDomainAccessor;
  if (!backgroundAppRefreshDomainAccessor)
  {
    id v4 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel"];
    id v5 = self->_backgroundAppRefreshDomainAccessor;
    self->_backgroundAppRefreshDomainAccessor = v4;

    backgroundAppRefreshDomainAccessor = self->_backgroundAppRefreshDomainAccessor;
  }

  return backgroundAppRefreshDomainAccessor;
}

- (void)dataProviderDidChange:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2BFC;
  v3[3] = &unk_4208;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (CSLPRFDefaultAppDataProvider)appLibrary
{
  return self->_appLibrary;
}

- (void)setAppLibrary:(id)a3
{
}

- (NSArray)sortedAppList
{
  return self->_sortedAppList;
}

- (void)setSortedAppList:(id)a3
{
}

- (NSMutableArray)disabledAppList
{
  return self->_disabledAppList;
}

- (void)setDisabledAppList:(id)a3
{
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (void)setBackgroundAppRefreshDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundAppRefreshDomainAccessor, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_disabledAppList, 0);
  objc_storeStrong((id *)&self->_sortedAppList, 0);

  objc_storeStrong((id *)&self->_appLibrary, 0);
}

@end