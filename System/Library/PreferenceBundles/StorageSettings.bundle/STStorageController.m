@interface STStorageController
- (BOOL)cellIsSwiped;
- (BOOL)isMonitoring;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSArray)appSpecs;
- (NSArray)tipSpecs;
- (id)specifiers;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (void)_updateApps:(id)a3;
- (void)completionHandlerAction:(id)a3;
- (void)confirmDeleteApp:(id)a3 completionHandler:(id)a4;
- (void)confirmDemoteApp:(id)a3 completionHandler:(id)a4;
- (void)dayChanged:(id)a3;
- (void)dealloc;
- (void)deleteAppAfterConfirmation:(id)a3;
- (void)demoteAppAfterConfirmation:(id)a3;
- (void)logSplunkData;
- (void)reloadSpecifiers;
- (void)reloadTips:(id)a3;
- (void)removeSpecifier:(id)a3;
- (void)resumeApp:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setAppSpecs:(id)a3;
- (void)setCellIsSwiped:(BOOL)a3;
- (void)setIsMonitoring:(BOOL)a3;
- (void)setTipSpecs:(id)a3;
- (void)showAllPressed;
- (void)showFilterView;
- (void)startMonitor;
- (void)stopMonitor;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)updateApps:(id)a3;
- (void)updateCategories:(id)a3;
- (void)updateMedia:(id)a3;
- (void)updateOtherDataSize;
- (void)updatePhotos:(id)a3;
- (void)updateShowAllButton;
- (void)updateTips:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)whackObsoletePrefs;
@end

@implementation STStorageController

- (void)whackObsoletePrefs
{
  v2 = (void *)CFPreferencesCopyValue(@"CacheVersion", @"com.apple.settings.storage", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v2 integerValue] != (char *)&dword_4 + 1)
  {
    CFDictionaryRef v10 = CFPreferencesCopyMultiple(0, @"com.apple.settings.storage", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    v3 = [(__CFDictionary *)v10 allKeys];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(__CFString **)(*((void *)&v11 + 1) + 8 * i);
          if (([(__CFString *)v8 isEqualToString:@"StatsTime"] & 1) == 0) {
            CFPreferencesSetValue(v8, 0, @"com.apple.settings.storage", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    v9 = +[NSNumber numberWithInt:5];
    CFPreferencesSetValue(@"CacheVersion", v9, @"com.apple.settings.storage", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }
}

- (void)viewDidLoad
{
  qword_3A518 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v3 = +[STStorageAnalytics sharedInstance];
  [v3 trackDisplayStart];

  id v4 = (PSCapacityBarData *)objc_alloc_init((Class)PSCapacityBarData);
  barData = self->_barData;
  self->_barData = v4;

  [(STStorageController *)self whackObsoletePrefs];
  id v6 = +[STStorageCacheDelete sharedMonitor];
  v7 = +[NSCalendar currentCalendar];
  v8 = +[NSDate date];
  v9 = [v7 startOfDayForDate:v8];
  [v9 timeIntervalSinceReferenceDate];
  uint64_t v11 = (uint64_t)rint(v10);

  long long v12 = (void *)CFPreferencesCopyValue(@"StatsTime", @"com.apple.settings.storage", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  BOOL v13 = (uint64_t)[v12 longLongValue] > v11;
  self->_splunkUpdateUploaded = v13;
  self->_splunkUploaded = v13;
  v27.receiver = self;
  v27.super_class = (Class)STStorageController;
  [(STStorageController *)&v27 viewDidLoad];
  long long v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);
  v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.storage.queue.storagecontroller", v15);
  qUpdate = self->_qUpdate;
  self->_qUpdate = v16;

  id v18 = objc_alloc((Class)UIBarButtonItem);
  v19 = STStorageLocStr(@"BACK_BUTTON");
  id v20 = [v18 initWithTitle:v19 style:0 target:0 action:0];
  v21 = [(STStorageController *)self navigationItem];
  [v21 setBackBarButtonItem:v20];

  v22 = +[UIImage systemImageNamed:@"magnifyingglass"];
  id v23 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v22 style:0 target:self action:"showFilterView"];
  [v23 setEnabled:0];
  [v23 setAccessibilityIdentifier:@"AppSearch"];
  v24 = [(STStorageController *)self navigationItem];
  [v24 setRightBarButtonItem:v23];

  v25 = +[STStoragePluginManager sharedManager];
  [v25 setShowAllTips:0];
  v26 = +[NSNotificationCenter defaultCenter];
  [v26 addObserver:self selector:"resumeApp:" name:@"com.apple.PreferencesApp.willBecomeActive" object:0];
  [v26 addObserver:self selector:"suspendApp:" name:@"com.apple.PreferencesApp.willResignActive" object:0];
  [v26 addObserver:self selector:"dayChanged:" name:NSCalendarDayChangedNotification object:0];
}

- (void)reloadSpecifiers
{
  if ([(STStorageController *)self cellIsSwiped])
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
    [(STStorageController *)self performSelector:a2 withObject:0 afterDelay:0.5];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)STStorageController;
    [(STStorageController *)&v4 reloadSpecifiers];
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"com.apple.PreferencesApp.willBecomeActive" object:0];
  [v3 removeObserver:self name:@"com.apple.PreferencesApp.willResignActive" object:0];
  [v3 removeObserver:self name:NSCalendarDayChangedNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)STStorageController;
  [(STStorageController *)&v4 dealloc];
}

- (void)updateOtherDataSize
{
  v3 = [(PSCapacityBarData *)self->_barData categories];
  if ([v3 count])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v40;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v40 != v8) {
            objc_enumerationMutation(v4);
          }
          v7 += (uint64_t)[*(id *)(*((void *)&v39 + 1) + 8 * i) bytes];
        }
        id v6 = [v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }

    uint64_t v11 = +[STStorageDiskMonitor sharedMonitor];
    long long v12 = [v11 storageSpace];

    BOOL v13 = [v12 totalBytes];
    int64_t v10 = v13 - ((unsigned char *)[v12 availableBytes] + v7);
    STLog();
    [v12 totalBytes];
    long long v14 = STFormattedSize();
    [v12 usedBytes];
    v15 = STFormattedSize();
    [v12 availableBytes];
    v16 = STFormattedSize();
    [v12 purgeableBytes];
    v34 = STFormattedSize();
    STLog();

    objc_msgSend(v12, "totalBytes", v14, v15, v16, v34);
    STLogSize();
    [v12 usedBytes];
    STLogSize();
    [v12 availableBytes];
    STLogSize();
    [v12 purgeableBytes];
    STLogSize();
    STLog();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v17 = v4;
    id v18 = [v17 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
          [v22 bytes];
          id v23 = [v22 title];
          STTokenLogSize();
        }
        id v19 = [v17 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v19);
    }

    STTokenLogSize();
    if (v10 < 0 && !STStorageIsInternalInstall()) {
      int64_t v10 = 0;
    }
    v24 = (void *)CFPreferencesCopyValue(@"LogAppSizes", @"com.apple.settings.storage", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    if (([v24 BOOLValue] & 1) != 0 || v10 > 10000000000 || !v10)
    {
      v25 = +[STStorageAppsMonitor sharedMonitor];
      [v25 logAppSizes];
    }
  }
  else
  {
    int64_t v10 = 0;
  }
  if (self->_otherSize != v10)
  {
    self->_otherSize = v10;
    v26 = +[STStorageMediaMonitor sharedMonitor];
    unsigned int v27 = [v26 isAsynchronouslyLoaded];

    if (v27)
    {
      otherSpec = self->_otherSpec;
      v29 = +[NSNumber numberWithLongLong:self->_otherSize];
      [(PSSpecifier *)otherSpec setProperty:v29 forKey:PSValueKey];
    }
    if (STStorageIsInternalInstall())
    {
      v30 = +[NSNotificationCenter defaultCenter];
      uint64_t v31 = STStorageOtherDataSizeChangedNotification;
      uint64_t v43 = STStorageOtherDataSizeKey;
      v32 = +[NSNumber numberWithLongLong:v10];
      v44 = v32;
      v33 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      [v30 postNotificationName:v31 object:0 userInfo:v33];
    }
  }
}

- (void)updateCategories:(id)a3
{
  v45 = +[STStorageDiskMonitor sharedMonitor];
  uint64_t v43 = [v45 storageSpace];
  id v4 = +[STStorageAppsMonitor sharedMonitor];
  id v5 = [v4 categorySizes];
  v46 = [v5 dictionary];

  v44 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v46 count]);
  long long v42 = +[UIColor systemRedColor];
  v53[0] = v42;
  long long v41 = +[UIColor systemOrangeColor];
  v53[1] = v41;
  id v6 = +[UIColor systemYellowColor];
  v53[2] = v6;
  uint64_t v7 = +[UIColor systemGreenColor];
  v53[3] = v7;
  uint64_t v8 = +[UIColor systemMintColor];
  v53[4] = v8;
  v9 = +[UIColor systemTealColor];
  v53[5] = v9;
  int64_t v10 = +[UIColor systemCyanColor];
  v53[6] = v10;
  uint64_t v11 = +[UIColor systemBlueColor];
  v53[7] = v11;
  long long v12 = +[UIColor systemIndigoColor];
  v53[8] = v12;
  BOOL v13 = +[UIColor systemPurpleColor];
  v53[9] = v13;
  long long v14 = +[UIColor systemPinkColor];
  v53[10] = v14;
  long long v40 = +[NSArray arrayWithObjects:v53 count:11];

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_8F7C;
  v51[3] = &unk_2CC48;
  id v15 = v44;
  id v52 = v15;
  [v46 enumerateKeysAndObjectsUsingBlock:v51];
  [v15 sortUsingComparator:&stru_2CC88];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_9118;
  v49[3] = &unk_2CCB0;
  id v16 = v40;
  id v50 = v16;
  [v15 enumerateObjectsUsingBlock:v49];
  id v17 = [v45 deviceSize];
  id v18 = [v43 usedBytes];
  if ((uint64_t)v18 >= (uint64_t)v17) {
    id v19 = v17;
  }
  else {
    id v19 = v18;
  }
  if ((uint64_t)v18 >= 0) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }
  -[PSCapacityBarData setCapacity:](self->_barData, "setCapacity:", v17, v40);
  [(PSCapacityBarData *)self->_barData setBytesUsed:v20];
  [(PSCapacityBarData *)self->_barData setCategories:v15];
  [(PSSpecifier *)self->_diskSpec setProperty:self->_barData forKey:PSCapacityBarDataKey];
  v21 = +[STStorageMediaMonitor sharedMonitor];
  unsigned int v22 = [v21 isAsynchronouslyLoaded];

  diskSpec = self->_diskSpec;
  if (v22)
  {
    v24 = STStorageLocStr(@"OTHER");
    [(PSSpecifier *)diskSpec setProperty:v24 forKey:PSCapacityBarOtherDataLegendTextKey];

    otherSpec = self->_otherSpec;
    v26 = STStorageLocStr(@"OTHER");
    [(PSSpecifier *)otherSpec setProperty:v26 forKey:PSTitleKey];

    unsigned int v27 = self->_otherSpec;
    v28 = +[NSNumber numberWithBool:1];
    [(PSSpecifier *)v27 setProperty:v28 forKey:PSEnabledKey];

    v29 = +[STStorageAnalytics sharedInstance];
    [v29 trackDisplayEnd];

    v30 = +[STStorageAnalytics sharedInstance];
    barData = self->_barData;
    int64_t otherSize = self->_otherSize;
    v33 = [(STStorageAppsController *)self->_appsController apps];
    objc_msgSend(v30, "sendAnalyticsEventLaunchWithBarData:otherSize:andAppsCount:", barData, otherSize, objc_msgSend(v33, "count"));
  }
  else
  {
    v34 = STStorageLocStr(@"CALCULATING");
    [(PSSpecifier *)diskSpec setProperty:v34 forKey:PSCapacityBarOtherDataLegendTextKey];

    [(PSSpecifier *)self->_otherSpec setProperty:&off_2FED0 forKey:PSValueKey];
    long long v35 = self->_otherSpec;
    v30 = +[NSNumber numberWithBool:0];
    [(PSSpecifier *)v35 setProperty:v30 forKey:PSEnabledKey];
  }

  id v36 = [v15 count];
  long long v37 = self->_diskSpec;
  if (v36)
  {
    [(PSSpecifier *)self->_diskSpec removePropertyForKey:@"psCapBarForceLoading"];
    [(PSSpecifier *)self->_diskSpec setProperty:&stru_2D2C0 forKey:PSCapacityBarLoadingKey];
  }
  else
  {
    long long v38 = +[NSNumber numberWithBool:1];
    [(PSSpecifier *)v37 setProperty:v38 forKey:@"psCapBarForceLoading"];
  }
  [(STStorageController *)self updateOtherDataSize];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_91B4;
  block[3] = &unk_2CA90;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (!self->_splunkUploaded || !self->_splunkUpdateUploaded)
  {
    long long v39 = dispatch_get_global_queue(17, 0);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_9224;
    v47[3] = &unk_2CA90;
    v47[4] = self;
    dispatch_async(v39, v47);
  }
}

- (void)logSplunkData
{
  p_splunkLock = &self->_splunkLock;
  os_unfair_lock_lock(&self->_splunkLock);
  if (!self->_splunkUploaded || !self->_splunkUpdateUploaded)
  {
    id v4 = +[NSMutableDictionary dictionaryWithCapacity:20];
    v124 = +[NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
    id v5 = [v124 objectForKeyedSubscript:@"ProductBuildVersion"];
    [v4 setObject:v5 forKeyedSubscript:@"buildVersion"];

    if (STStorageIsInternalInstall()) {
      CFStringRef v6 = @"Internal";
    }
    else {
      CFStringRef v6 = @"Release";
    }
    [v4 setObject:v6 forKeyedSubscript:@"buildVariant"];
    v131 = v4;
    [v4 setObject:MGGetStringAnswer() forKeyedSubscript:@"deviceType"];
    uint64_t v7 = +[STStorageDiskMonitor sharedMonitor];
    uint64_t v8 = [v7 storageSpace];

    uint64_t v9 = (uint64_t)[v8 totalBytes];
    unint64_t v10 = (v9 + 500) / 1000;
    uint64_t v11 = 1000;
    if (v9 > 1000499)
    {
      unint64_t v12 = (v9 + 500) / 1000;
      do
      {
        unint64_t v10 = (v12 + 5) / 0xA;
        v11 *= 10;
        BOOL v13 = v12 > 0x2714;
        unint64_t v12 = v10;
      }
      while (v13);
    }
    long long v14 = +[NSNumber numberWithLongLong:v11 * v10];
    [v4 setObject:v14 forKeyedSubscript:@"deviceSize"];

    uint64_t v15 = (uint64_t)[v8 availableBytes];
    unint64_t v16 = (v15 + 500) / 1000;
    if (v15 <= 1000499)
    {
      uint64_t v17 = 1000;
    }
    else
    {
      uint64_t v17 = 1000;
      unint64_t v18 = (v15 + 500) / 1000;
      do
      {
        unint64_t v16 = (v18 + 5) / 0xA;
        v17 *= 10;
        BOOL v13 = v18 > 0x2714;
        unint64_t v18 = v16;
      }
      while (v13);
    }
    id v19 = +[NSNumber numberWithLongLong:v17 * v16];
    [v4 setObject:v19 forKeyedSubscript:@"availableSpace"];

    uint64_t v20 = (uint64_t)[v8 purgeableBytes];
    unint64_t v21 = (v20 + 500) / 1000;
    lock = p_splunkLock;
    uint64_t v22 = 1000;
    if (v20 > 1000499)
    {
      unint64_t v23 = (v20 + 500) / 1000;
      do
      {
        unint64_t v21 = (v23 + 5) / 0xA;
        v22 *= 10;
        BOOL v13 = v23 > 0x2714;
        unint64_t v23 = v21;
      }
      while (v13);
    }
    v24 = +[NSNumber numberWithLongLong:v22 * v21];
    [v4 setObject:v24 forKeyedSubscript:@"purgeableSpace"];

    if ([v8 isVeryLowSpace]) {
      v25 = &off_2FEE8;
    }
    else {
      v25 = &off_2FF00;
    }
    [v4 setObject:v25 forKeyedSubscript:@"isLowSpace"];
    [v4 setObject:&off_2FEE8 forKeyedSubscript:@"mediaUpdated"];
    v26 = [(PSCapacityBarData *)self->_barData categories];
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v27 = [v26 countByEnumeratingWithState:&v137 objects:v142 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v138;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v138 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void **)(*((void *)&v137 + 1) + 8 * i);
          v32 = [v31 identifier];
          [0 setObject:v31 forKey:v32];
        }
        id v28 = [v26 countByEnumeratingWithState:&v137 objects:v142 count:16];
      }
      while (v28);
    }
    v122 = v26;
    uint64_t v33 = (uint64_t)[v8 usedBytes];
    v34 = [0 objectForKeyedSubscript:STCategoryAppsKey];
    id v35 = [v34 bytes];
    if ((uint64_t)v35 >= 1)
    {
      id v36 = v35;
      unint64_t v37 = ((unint64_t)v35 + 500) / 0x3E8;
      if ((unint64_t)v35 <= 0xF4433)
      {
        uint64_t v38 = 1000;
      }
      else
      {
        uint64_t v38 = 1000;
        unint64_t v39 = ((unint64_t)v35 + 500) / 0x3E8;
        do
        {
          unint64_t v37 = (v39 + 5) / 0xA;
          v38 *= 10;
          BOOL v13 = v39 > 0x2714;
          unint64_t v39 = v37;
        }
        while (v13);
      }
      long long v40 = +[NSNumber numberWithLongLong:v38 * v37];
      [v131 setObject:v40 forKeyedSubscript:@"appsSize"];

      v33 -= (uint64_t)v36;
    }
    long long v41 = [0 objectForKeyedSubscript:STCategoryPhotosKey];

    id v42 = [v41 bytes];
    if ((uint64_t)v42 >= 1)
    {
      id v43 = v42;
      unint64_t v44 = ((unint64_t)v42 + 500) / 0x3E8;
      if ((unint64_t)v42 <= 0xF4433)
      {
        uint64_t v45 = 1000;
      }
      else
      {
        uint64_t v45 = 1000;
        unint64_t v46 = ((unint64_t)v42 + 500) / 0x3E8;
        do
        {
          unint64_t v44 = (v46 + 5) / 0xA;
          v45 *= 10;
          BOOL v13 = v46 > 0x2714;
          unint64_t v46 = v44;
        }
        while (v13);
      }
      v47 = +[NSNumber numberWithLongLong:v45 * v44];
      [v131 setObject:v47 forKeyedSubscript:@"photosSize"];

      v33 -= (uint64_t)v43;
    }
    v48 = [0 objectForKeyedSubscript:STCategoryMessagesKey];

    id v49 = [v48 bytes];
    if ((uint64_t)v49 >= 1)
    {
      id v50 = v49;
      unint64_t v51 = ((unint64_t)v49 + 500) / 0x3E8;
      if ((unint64_t)v49 <= 0xF4433)
      {
        uint64_t v52 = 1000;
      }
      else
      {
        uint64_t v52 = 1000;
        unint64_t v53 = ((unint64_t)v49 + 500) / 0x3E8;
        do
        {
          unint64_t v51 = (v53 + 5) / 0xA;
          v52 *= 10;
          BOOL v13 = v53 > 0x2714;
          unint64_t v53 = v51;
        }
        while (v13);
      }
      v54 = +[NSNumber numberWithLongLong:v52 * v51];
      [v131 setObject:v54 forKeyedSubscript:@"messagesSize"];

      v33 -= (uint64_t)v50;
    }
    v55 = [0 objectForKeyedSubscript:STCategoryBooksKey];

    id v56 = [v55 bytes];
    if ((uint64_t)v56 >= 1)
    {
      id v57 = v56;
      unint64_t v58 = ((unint64_t)v56 + 500) / 0x3E8;
      if ((unint64_t)v56 <= 0xF4433)
      {
        uint64_t v59 = 1000;
      }
      else
      {
        uint64_t v59 = 1000;
        unint64_t v60 = ((unint64_t)v56 + 500) / 0x3E8;
        do
        {
          unint64_t v58 = (v60 + 5) / 0xA;
          v59 *= 10;
          BOOL v13 = v60 > 0x2714;
          unint64_t v60 = v58;
        }
        while (v13);
      }
      v61 = +[NSNumber numberWithLongLong:v59 * v58];
      [v131 setObject:v61 forKeyedSubscript:@"booksSize"];

      v33 -= (uint64_t)v57;
    }
    v62 = [0 objectForKeyedSubscript:STCategoryMediaKey];

    id v63 = [v62 bytes];
    if ((uint64_t)v63 >= 1)
    {
      id v64 = v63;
      unint64_t v65 = ((unint64_t)v63 + 500) / 0x3E8;
      if ((unint64_t)v63 <= 0xF4433)
      {
        uint64_t v66 = 1000;
      }
      else
      {
        uint64_t v66 = 1000;
        unint64_t v67 = ((unint64_t)v63 + 500) / 0x3E8;
        do
        {
          unint64_t v65 = (v67 + 5) / 0xA;
          v66 *= 10;
          BOOL v13 = v67 > 0x2714;
          unint64_t v67 = v65;
        }
        while (v13);
      }
      v68 = +[NSNumber numberWithLongLong:v66 * v65];
      [v131 setObject:v68 forKeyedSubscript:@"mediaSize"];

      v33 -= (uint64_t)v64;
    }
    v69 = [0 objectForKeyedSubscript:STCategoryMailKey];

    id v70 = [v69 bytes];
    if ((uint64_t)v70 >= 1)
    {
      id v71 = v70;
      unint64_t v72 = ((unint64_t)v70 + 500) / 0x3E8;
      if ((unint64_t)v70 <= 0xF4433)
      {
        uint64_t v73 = 1000;
      }
      else
      {
        uint64_t v73 = 1000;
        unint64_t v74 = ((unint64_t)v70 + 500) / 0x3E8;
        do
        {
          unint64_t v72 = (v74 + 5) / 0xA;
          v73 *= 10;
          BOOL v13 = v74 > 0x2714;
          unint64_t v74 = v72;
        }
        while (v13);
      }
      v75 = +[NSNumber numberWithLongLong:v73 * v72];
      [v131 setObject:v75 forKeyedSubscript:@"mailSize"];

      v33 -= (uint64_t)v71;
    }
    v76 = [0 objectForKeyedSubscript:STCategoryCloudDriveKey];

    id v77 = [v76 bytes];
    if ((uint64_t)v77 >= 1)
    {
      id v78 = v77;
      unint64_t v79 = ((unint64_t)v77 + 500) / 0x3E8;
      if ((unint64_t)v77 <= 0xF4433)
      {
        uint64_t v80 = 1000;
      }
      else
      {
        uint64_t v80 = 1000;
        unint64_t v81 = ((unint64_t)v77 + 500) / 0x3E8;
        do
        {
          unint64_t v79 = (v81 + 5) / 0xA;
          v80 *= 10;
          BOOL v13 = v81 > 0x2714;
          unint64_t v81 = v79;
        }
        while (v13);
      }
      v82 = +[NSNumber numberWithLongLong:v80 * v79];
      [v131 setObject:v82 forKeyedSubscript:@"cloudDriveSize"];

      v33 -= (uint64_t)v78;
    }
    v83 = [0 objectForKeyedSubscript:STCategorySystemKey];

    v121 = v83;
    id v84 = [v83 bytes];
    if ((uint64_t)v84 >= 1)
    {
      id v85 = v84;
      unint64_t v86 = ((unint64_t)v84 + 500) / 0x3E8;
      if ((unint64_t)v84 <= 0xF4433)
      {
        uint64_t v87 = 1000;
      }
      else
      {
        uint64_t v87 = 1000;
        unint64_t v88 = ((unint64_t)v84 + 500) / 0x3E8;
        do
        {
          unint64_t v86 = (v88 + 5) / 0xA;
          v87 *= 10;
          BOOL v13 = v88 > 0x2714;
          unint64_t v88 = v86;
        }
        while (v13);
      }
      v89 = +[NSNumber numberWithLongLong:v87 * v86];
      [v131 setObject:v89 forKeyedSubscript:@"systemSize"];

      v33 -= (uint64_t)v85;
    }
    v123 = v8;
    v125 = self;
    unint64_t v90 = (v33 + 500) / 1000;
    if (v33 <= 1000499)
    {
      uint64_t v91 = 1000;
    }
    else
    {
      uint64_t v91 = 1000;
      unint64_t v92 = (v33 + 500) / 1000;
      do
      {
        unint64_t v90 = (v92 + 5) / 0xA;
        v91 *= 10;
        BOOL v13 = v92 > 0x2714;
        unint64_t v92 = v90;
      }
      while (v13);
    }
    v93 = +[NSNumber numberWithLongLong:v91 * v90];
    [v131 setObject:v93 forKeyedSubscript:@"otherSize"];

    v94 = +[STStoragePluginManager sharedManager];
    v95 = [v94 topTips];

    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id obj = v95;
    v96 = &AnalyticsSendEventLazy_ptr;
    id v129 = [obj countByEnumeratingWithState:&v133 objects:v141 count:16];
    if (!v129)
    {
LABEL_118:

      v117 = objc_alloc_init(SplunkLogger);
      [(SplunkLogger *)v117 logEventNamed:@"iosStorageEntered" value:v131 unique:0];
      [(SplunkLogger *)v117 flush];
      v118 = +[NSDate date];
      [v118 timeIntervalSinceReferenceDate];
      uint64_t v120 = (uint64_t)rint(v119);

      CFPreferencesSetValue(@"StatsTime", [v96[161] numberWithLongLong:v120], @"com.apple.settings.storage", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
      v125->_splunkUploaded = 1;
      v125->_splunkUpdateUploaded = 1;
      os_unfair_lock_unlock(lock);

      return;
    }
    int v97 = 0;
    uint64_t v128 = *(void *)v134;
LABEL_93:
    uint64_t v98 = 0;
    uint64_t v99 = v97;
    if (v97 <= 3) {
      int v100 = 3;
    }
    else {
      int v100 = v97;
    }
    uint64_t v130 = (v100 - v97);
    while (1)
    {
      if (*(void *)v134 != v128) {
        objc_enumerationMutation(obj);
      }
      if (v98 == v130) {
        goto LABEL_118;
      }
      v101 = *(void **)(*((void *)&v133 + 1) + 8 * v98);
      v102 = [v101 propertyForKey:@"_stPluginID"];
      v103 = [v101 propertyForKey:@"_stTipID"];
      v104 = [v96[161] numberWithInteger:v99 + 1];
      [v104 stringValue];
      v106 = v105 = v96;
      v132 = v102;
      if (![(__CFString *)v102 length]) {
        v102 = @"????";
      }
      if ([(__CFString *)v103 length]) {
        CFStringRef v107 = v103;
      }
      else {
        CFStringRef v107 = @"????";
      }
      v108 = +[NSMutableString stringWithFormat:@"tip_%@_%@_%@", v106, v102, v107];

      objc_msgSend(v108, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_2D2C0, 0, 0, objc_msgSend(v108, "length"));
      objc_msgSend(v108, "replaceOccurrencesOfString:withString:options:range:", @".", @"_", 0, 0, objc_msgSend(v108, "length"));
      uint64_t v109 = (uint64_t)[v101 size];
      if (v109 <= 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v96 = &AnalyticsSendEventLazy_ptr;
          v111 = NSNumber;
          unint64_t v112 = (v109 + 500) / 1000;
          goto LABEL_115;
        }
        id v110 = v101;
        uint64_t v109 = (uint64_t)[v110 immediateGain];
        if (v109 < 0) {
          uint64_t v109 = (uint64_t)[v110 eventualGain];
        }

        v105 = &AnalyticsSendEventLazy_ptr;
      }
      v111 = v105[161];
      unint64_t v112 = (v109 + 500) / 1000;
      v96 = v105;
      if (v109 > 1000499)
      {
        uint64_t v113 = 1000;
        ++v99;
        do
        {
          unint64_t v114 = v112;
          unint64_t v112 = (v112 + 5) / 0xA;
          v113 *= 10;
        }
        while (v114 > 0x2714);
        goto LABEL_116;
      }
LABEL_115:
      uint64_t v113 = 1000;
      ++v99;
LABEL_116:
      v115 = [v111 numberWithLongLong:v113 * v112];
      [v131 setObject:v115 forKeyedSubscript:v108];

      if ((id)++v98 == v129)
      {
        id v116 = [obj countByEnumeratingWithState:&v133 objects:v141 count:16];
        int v97 = v99;
        id v129 = v116;
        if (v116) {
          goto LABEL_93;
        }
        goto LABEL_118;
      }
    }
  }

  os_unfair_lock_unlock(p_splunkLock);
}

- (void)updateTips:(id)a3
{
  qUpdate = self->_qUpdate;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A2E0;
  block[3] = &unk_2CA90;
  block[4] = self;
  dispatch_async(qUpdate, block);
}

- (void)_updateApps:(id)a3
{
  qUpdate = self->_qUpdate;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A624;
  block[3] = &unk_2CA90;
  block[4] = self;
  dispatch_async(qUpdate, block);
}

- (void)updateApps:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A7DC;
  block[3] = &unk_2CA90;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateMedia:(id)a3
{
  id v5 = a3;
  id v4 = +[STMediaCache sharedCache];
  [v4 reload];

  [(STStorageController *)self updateApps:v5];
}

- (void)updatePhotos:(id)a3
{
}

- (void)reloadTips:(id)a3
{
  id v3 = a3;
  id v5 = +[STStoragePluginManager sharedManager];
  id v4 = [v3 object];

  [v5 reloadTipsForPlugin:v4];
}

- (void)updateShowAllButton
{
  id v4 = +[STStorageAnalytics sharedInstance];
  [v4 trackDisplayCalculating];

  id v14 = +[STStoragePluginManager sharedManager];
  id v5 = [(PSSpecifier *)self->_tipsGroup propertyForKey:PSHeaderViewKey];
  CFStringRef v6 = [v5 headerButton];
  unsigned int v7 = [v6 isHidden];

  unsigned __int8 v8 = [v14 showAllTips];
  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    v2 = [v14 allTips];
    id v10 = [v2 count];
    BOOL v9 = v10 <= [v14 tipsToShow];
  }
  uint64_t v11 = [v5 headerButton];
  [v11 setHidden:v9];

  if ((v8 & 1) == 0) {
  unint64_t v12 = [v5 headerButton];
  }
  unsigned int v13 = [v12 isHidden];

  if (v7 != v13) {
    [v5 setNeedsUpdateConstraints];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStorageController;
  [(STStorageController *)&v5 viewWillAppear:a3];
  if ([(STStorageController *)self isMovingToParentViewController])
  {
    id v4 = +[STStoragePluginManager sharedManager];
    [v4 reloadAllTips];

    [(STStorageController *)self startMonitor];
  }
  [(STStorageController *)self updateApps:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(STStorageController *)self isMovingFromParentViewController]) {
    [(STStorageController *)self stopMonitor];
  }
  v5.receiver = self;
  v5.super_class = (Class)STStorageController;
  [(STStorageController *)&v5 viewDidDisappear:v3];
}

- (void)resumeApp:(id)a3
{
  id v4 = +[STStoragePluginManager sharedManager];
  [v4 reloadAllTips];

  [(STStorageController *)self startMonitor];
  id v5 = +[STMediaCache sharedCache];
  [v5 reload];
}

- (void)startMonitor
{
  if (!self->_isMonitoring)
  {
    self->_isMonitoring = 1;
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"updateTips:" name:STNotifyTipsChanged object:0];
    [v5 addObserver:self selector:"updateApps:" name:STNotifyAppSizesChanged object:0];
    [v5 addObserver:self selector:"reloadTips:" name:STStoragePluginReloadTipsNotification object:0];
    [v5 addObserver:self selector:"updateApps:" name:STStoragePurgeableChangedNotification object:0];
    BOOL v3 = +[STStorageDiskMonitor sharedMonitor];
    [v3 startMonitor];

    id v4 = +[STStorageAppsMonitor sharedMonitor];
    [v4 startMonitor];
  }
}

- (void)stopMonitor
{
  if (self->_isMonitoring)
  {
    self->_isMonitoring = 0;
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:STNotifyTipsChanged object:0];
    [v6 removeObserver:self name:STNotifyAppSizesChanged object:0];
    [v6 removeObserver:self name:STStoragePluginReloadTipsNotification object:0];
    [v6 removeObserver:self name:STStoragePurgeableChangedNotification object:0];
    BOOL v3 = +[STStorageDiskMonitor sharedMonitor];
    [v3 stopMonitor];

    id v4 = +[STStorageAppsMonitor sharedMonitor];
    [v4 stopMonitor];

    id v5 = +[STStorageAnalytics sharedInstance];
    [v5 sendAnalyticsEventExitWithOtherSize:self->_otherSize];
  }
}

- (void)showAllPressed
{
  id v3 = +[STStoragePluginManager sharedManager];
  [v3 setShowAllTips:1];
  [(STStorageController *)self updateTips:0];
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v4) {
    goto LABEL_34;
  }
  uint64_t v5 = +[NSMutableArray array];
  unint64_t v65 = (void *)v5;
  uint64_t v66 = v3;
  if (v2->_usageLoaded)
  {
    id v6 = (void *)v5;
  }
  else
  {
    unsigned int v7 = +[NSURL fileURLWithPath:@"/System/Library/PreferenceBundles/StoragePlugins/UsagePlugin.bundle"];
    uint64_t v8 = +[NSBundle bundleWithURL:v7];
    usageBundle = v2->_usageBundle;
    v2->_usageBundle = (NSBundle *)v8;

    if (!v2->_usageBundle) {
      STLog();
    }
    id v10 = objc_alloc_init(STStorageAppsController);
    appsController = v2->_appsController;
    v2->_appsController = v10;

    uint64_t v12 = +[PSSpecifier preferenceSpecifierNamed:@"  " target:0 set:0 get:0 detail:0 cell:0 edit:0];
    topGroup = v2->_topGroup;
    v2->_topGroup = (PSSpecifier *)v12;

    id v14 = STStorageLocStr(STFreeUpSpaceKey);
    uint64_t v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    tipsGroup = v2->_tipsGroup;
    v2->_tipsGroup = (PSSpecifier *)v15;

    [(PSSpecifier *)v2->_tipsGroup setProperty:@"STStorageButtonHeader" forKey:PSHeaderCellClassGroupKey];
    uint64_t v17 = v2->_tipsGroup;
    unint64_t v18 = STStorageLocStr(@"SHOW_ALL");
    [(PSSpecifier *)v17 setProperty:v18 forKey:@"stButtonTitle"];

    [(PSSpecifier *)v2->_tipsGroup setTarget:v2];
    [(PSSpecifier *)v2->_tipsGroup setButtonAction:"showAllPressed"];
    uint64_t v19 = +[PSSpecifier emptyGroupSpecifier];
    usageGroup = v2->_usageGroup;
    v2->_usageGroup = (PSSpecifier *)v19;

    unint64_t v21 = +[UIDevice currentDevice];
    uint64_t v22 = [v21 localizedModel];
    uint64_t v23 = +[PSCapacityBarCell specifierWithTitle:v22];
    diskSpec = v2->_diskSpec;
    v2->_diskSpec = (PSSpecifier *)v23;

    [(PSSpecifier *)v2->_diskSpec setProperty:&__kCFBooleanTrue forKey:PSCapacityBarShowOtherDataLegendKey];
    uint64_t v25 = +[STStorageSystemCell specifierForSystem];
    systemSpec = v2->_systemSpec;
    v2->_systemSpec = (PSSpecifier *)v25;

    uint64_t v27 = +[STStorageOtherCell specifierForOther];
    otherSpec = v2->_otherSpec;
    v2->_otherSpec = (PSSpecifier *)v27;

    uint64_t v29 = +[STStorageCalcCell specifierForCalc];
    calculatingSpec = v2->_calculatingSpec;
    v2->_calculatingSpec = (PSSpecifier *)v29;

    v2->_usageLoaded = 1;
    id v6 = v65;
  }
  [v6 addObject:v2->_topGroup];
  [v6 addObject:v2->_diskSpec];
  uint64_t v31 = [(STStorageController *)v2 tipSpecs];
  v32 = v31;
  if (v31)
  {
    if ([v31 count]) {
      [v6 addObjectsFromArray:v32];
    }
  }
  else
  {
    uint64_t v33 = +[PSSpecifier emptyGroupSpecifier];
    [v6 addObject:v33];

    v34 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D2C0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    [v6 addObject:v34];
  }
  uint64_t v35 = [(STStorageAppsController *)v2->_appsController specifiers];
  appSpecs = v2->_appSpecs;
  v2->_appSpecs = (NSArray *)v35;

  if (![(NSArray *)v2->_appSpecs count])
  {
    uint64_t v52 = +[PSSpecifier emptyGroupSpecifier];
    [v6 addObject:v52];

    unint64_t v53 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D2C0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    [v6 addObject:v53];

    listSpecs = v2->_listSpecs;
    v2->_listSpecs = (NSArray *)&__NSArray0__struct;

    goto LABEL_33;
  }
  [v6 addObject:v2->_usageGroup];
  unint64_t v37 = +[NSMutableArray arrayWithCapacity:[(NSArray *)v2->_appSpecs count]];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v64 = v2;
  uint64_t v38 = v2->_appSpecs;
  id v39 = [(NSArray *)v38 countByEnumeratingWithState:&v69 objects:v73 count:16];
  id v63 = v32;
  if (!v39)
  {
    char v67 = 1;
    goto LABEL_30;
  }
  id v40 = v39;
  uint64_t v41 = *(void *)v70;
  uint64_t v42 = PSValueKey;
  uint64_t v68 = STStorageAppKey;
  char v67 = 1;
  do
  {
    id v43 = 0;
    do
    {
      if (*(void *)v70 != v41) {
        objc_enumerationMutation(v38);
      }
      unint64_t v44 = *(void **)(*((void *)&v69 + 1) + 8 * (void)v43);
      uint64_t v45 = [v44 propertyForKey:v42];

      if (v45) {
        goto LABEL_22;
      }
      unint64_t v46 = [v44 propertyForKey:v68];
      v47 = v46;
      if (v46)
      {
        v48 = [v46 usageBundle];

        if (!v48
          || ([v47 mediaTypes],
              id v49 = objc_claimAutoreleasedReturnValue(),
              id v50 = [v49 count],
              v49,
              v50))
        {

          char v67 = 0;
LABEL_22:
          [v37 addObject:v44];
          goto LABEL_23;
        }
      }

LABEL_23:
      id v43 = (char *)v43 + 1;
    }
    while (v40 != v43);
    id v51 = [(NSArray *)v38 countByEnumeratingWithState:&v69 objects:v73 count:16];
    id v40 = v51;
  }
  while (v51);
LABEL_30:

  BOOL v55 = [(NSArray *)v64->_appSpecs count] != 0;
  id v56 = [(STStorageController *)v64 navigationItem];
  id v57 = [v56 rightBarButtonItem];
  [v57 setEnabled:v55];

  v2 = v64;
  objc_storeStrong((id *)&v64->_listSpecs, v37);
  id v6 = v65;
  [v65 addObjectsFromArray:v37];
  v64->_appListShown = 1;
  v64->_allAppsSized = v67 & 1;
  unint64_t v58 = +[PSSpecifier emptyGroupSpecifier];
  [v65 addObject:v58];

  [v65 addObject:v64->_systemSpec];
  [v65 addObject:v64->_otherSpec];
  if (qword_3A518)
  {
    double v62 = (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - qword_3A518) / 1000000000.0;
    STLog();
    qword_3A518 = 0;
    uint64_t v59 = +[STStorageDataNotifier sharedNotifier];
    [v59 postLoadingComplete];
  }
  uint64_t v3 = v66;
  v32 = v63;
LABEL_33:
  unint64_t v60 = *(void **)&v2->PSListController_opaque[v3];
  *(void *)&v2->PSListController_opaque[v3] = v6;

  id v4 = *(void **)&v2->PSListController_opaque[v3];
LABEL_34:

  return v4;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (void)removeSpecifier:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_appSpecs containsObject:v4])
  {
    uint64_t v5 = [(STStorageController *)self appSpecs];
    id v6 = [v5 mutableCopy];

    [v6 removeObject:v4];
    [(STStorageController *)self setAppSpecs:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)STStorageController;
  [(STStorageController *)&v7 removeSpecifier:v4];
}

- (void)dayChanged:(id)a3
{
  self->_splunkUploaded = 0;
  self->_splunkUpdateUploaded = 0;
}

- (void)showFilterView
{
  if ([(NSArray *)self->_listSpecs count])
  {
    uint64_t v3 = objc_alloc_init(STSearchListController);
    id v4 = [(STStorageController *)self rootController];
    [(STSearchListController *)v3 setRootController:v4];

    [(STSearchListController *)v3 setParentController:self];
    [(STSearchListController *)v3 setTitle:&stru_2D2C0];
    uint64_t v5 = [(NSArray *)self->_listSpecs sortedArrayUsingComparator:&stru_2CCD0];
    [(STSearchListController *)v3 setSpecifiers:v5];

    id v6 = [(STSearchListController *)v3 view];
    if (v6)
    {
      id v7 = objc_msgSend(objc_alloc((Class)UISearchBar), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      [v7 sizeToFit];
      [v7 setAutocorrectionType:1];
      [v7 setAutocapitalizationType:1];
      [v7 setAccessibilityIdentifier:@"AppSearchBar"];
      uint64_t v8 = STStorageLocStr(@"SEARCH");
      [v7 setPlaceholder:v8];

      [v7 setSearchBarStyle:2];
      [v7 setShowsCancelButton:1];
      [v7 setReturnKeyType:9];
      [v7 setEnablesReturnKeyAutomatically:0];
      [v7 setDelegate:self];
      id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v3];
      id v10 = [v9 navigationBar];
      uint64_t v11 = [v10 topItem];
      [v11 setTitleView:v7];

      uint64_t v12 = [(STSearchListController *)v3 table];
      [v12 setTableHeaderView:0];

      unsigned int v13 = [(STSearchListController *)v3 table];
      [v13 setAccessibilityIdentifier:@"AppSearchTable"];

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_BA84;
      v15[3] = &unk_2CA00;
      v15[4] = self;
      unint64_t v16 = v3;
      id v17 = v7;
      id v14 = v7;
      [(STStorageController *)self presentViewController:v9 animated:1 completion:v15];
    }
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_BB3C;
  v3[3] = &unk_2CA90;
  v3[4] = self;
  [(STStorageController *)self dismissViewControllerAnimated:1 completion:v3];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);
  [WeakRetained searchButtonPressed];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  id v6 = self->_listSpecs;
  if ([v5 length])
  {
    uint64_t v22 = self;
    id v24 = v5;
    id v7 = [v5 localizedLowercaseString];
    uint64_t v25 = +[NSCharacterSet letterCharacterSet];
    v26 = +[NSMutableArray arrayWithCapacity:[(NSArray *)v6 count]];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v23 = v6;
    uint64_t v8 = v6;
    id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v30;
      uint64_t v12 = STStorageAppKey;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v15 = [v14 propertyForKey:v12];
          unint64_t v16 = [v15 name];
          id v17 = [v16 localizedLowercaseString];

          id v18 = [v17 localizedStandardRangeOfString:v7];
          if (v19 && (!v18 || v18 == [v17 rangeOfCharacterFromSet:v25])) {
            [v26 addObject:v14];
          }
        }
        id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v10);
    }

    id v6 = v23;
    id v5 = v24;
    self = v22;
    uint64_t v20 = v26;
  }
  else
  {
    uint64_t v20 = +[NSMutableArray arrayWithArray:v6];
  }
  [v20 sortUsingComparator:&stru_2CCF0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BEF8;
  block[3] = &unk_2CA28;
  block[4] = self;
  id v28 = v20;
  id v21 = v20;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)completionHandlerAction:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"STCompletionHandler"];
  v3[2](v3, 0);
}

- (void)deleteAppAfterConfirmation:(id)a3
{
  id v4 = a3;
  if ((+[UIApplication isRunningInStoreDemoMode] & 1) == 0)
  {
    id v5 = [v4 propertyForKey:STStorageAppKey];
    [(STStorageController *)self completionHandlerAction:v4];
    if ([v5 isDeletable])
    {
      uint64_t v11 = [v5 name];
      STLog();

      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      CFStringRef v17 = @"Canceling existing install coord because user has requested delete";
      id v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1, v11);
      id v7 = +[NSError errorWithDomain:@"com.apple.settings.storage" code:0 userInfo:v6];

      uint64_t v8 = [v5 bundleIdentifier];
      id v15 = 0;
      unsigned int v9 = +[IXAppInstallCoordinator cancelCoordinatorForAppWithBundleID:v8 withReason:v7 client:26 error:&v15];
      id v10 = v15;
      if (v9) {
        STLog();
      }
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_C1C8;
      v12[3] = &unk_2CD18;
      id v13 = v5;
      id v14 = self;
      +[IXAppInstallCoordinator uninstallAppWithBundleID:v8 requestUserConfirmation:0 waitForDeletion:1 completion:v12];
    }
  }
}

- (void)confirmDeleteApp:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = STStorageAppKey;
  uint64_t v21 = STStorageAppKey;
  id v6 = a4;
  id v7 = [a3 propertyForKey:v5];
  unsigned int v8 = [v7 isAppClip];
  unsigned int v9 = @"DELETE_APP";
  if (v8) {
    unsigned int v9 = @"DELETE_APPCLIP";
  }
  id v10 = v9;
  uint64_t v20 = [(__CFString *)v10 stringByAppendingString:@"_EXPLANATION"];
  id v11 = objc_alloc_init((Class)PSConfirmationSpecifier);
  v23[0] = PSConfirmationOKKey;
  uint64_t v12 = STStorageLocStr(v10);
  v24[0] = v12;
  v23[1] = PSConfirmationCancelKey;
  id v13 = STStorageLocStr(@"CANCEL");
  v24[1] = v13;
  v23[2] = PSConfirmationPromptKey;
  id v14 = STStorageLocStr(v20);
  id v15 = [v7 name];
  NSErrorUserInfoKey v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);
  v24[2] = v16;
  v23[3] = PSConfirmationTitleKey;
  CFStringRef v17 = STStorageLocStr(v10);

  v24[3] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  [v11 setupWithDictionary:v18];

  [v11 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  id v19 = objc_retainBlock(v6);

  [v11 setProperty:v19 forKey:@"STCompletionHandler"];
  [v11 setProperty:v7 forKey:v21];
  [v11 setTarget:self];
  [v11 setConfirmationAction:"deleteAppAfterConfirmation:"];
  [v11 setConfirmationCancelAction:"completionHandlerAction:"];
  [(STStorageController *)self showConfirmationViewForSpecifier:v11];
}

- (void)demoteAppAfterConfirmation:(id)a3
{
  id v4 = a3;
  if ((+[UIApplication isRunningInStoreDemoMode] & 1) == 0)
  {
    uint64_t v5 = [v4 propertyForKey:STStorageAppKey];
    [(STStorageController *)self completionHandlerAction:v4];
    if ([v5 isDemotable])
    {
      id v6 = [v5 appRecord];
      id v7 = [v6 applicationState];
      unsigned int v8 = [v7 isValid];

      if (v8)
      {
        id v14 = [v5 name];
        STLog();

        NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
        CFStringRef v19 = @"Canceling existing install coord because user has requested offload";
        unsigned int v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1, v14);
        id v10 = +[NSError errorWithDomain:@"com.apple.settings.storage" code:0 userInfo:v9];

        id v11 = [v5 bundleIdentifier];
        id v17 = 0;
        unsigned int v12 = +[IXAppInstallCoordinator cancelCoordinatorForAppWithBundleID:v11 withReason:v10 client:26 error:&v17];
        id v13 = v17;
        if (v12) {
          STLog();
        }
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_C7C0;
        v15[3] = &unk_2CD40;
        id v16 = v5;
        +[IXAppInstallCoordinator demoteAppToPlaceholderWithBundleID:v11 forReason:2 waitForDeletion:1 completion:v15];
      }
    }
  }
}

- (void)confirmDemoteApp:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = STStorageAppKey;
  uint64_t v17 = STStorageAppKey;
  id v6 = a4;
  id v7 = [a3 propertyForKey:v5];
  id v8 = objc_alloc_init((Class)PSConfirmationSpecifier);
  v19[0] = PSConfirmationOKKey;
  unsigned int v9 = STStorageLocStr(@"UNINSTALL");
  v20[0] = v9;
  v19[1] = PSConfirmationCancelKey;
  id v10 = STStorageLocStr(@"CANCEL");
  v20[1] = v10;
  v19[2] = PSConfirmationPromptKey;
  id v11 = STStorageLocStr(@"UNINSTALL_APP_EXPLANATION");
  unsigned int v12 = [v7 name];
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
  v20[2] = v13;
  v19[3] = PSConfirmationTitleKey;
  id v14 = STStorageLocStr(@"UNINSTALL_APP");
  v20[3] = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  [v8 setupWithDictionary:v15];

  [v8 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  id v16 = objc_retainBlock(v6);

  [v8 setProperty:v16 forKey:@"STCompletionHandler"];
  [v8 setProperty:v7 forKey:v17];
  [v8 setTarget:self];
  [v8 setConfirmationAction:"demoteAppAfterConfirmation:"];
  [v8 setConfirmationCancelAction:"completionHandlerAction:"];
  [(STStorageController *)self showConfirmationViewForSpecifier:v8];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v4 = [(STStorageController *)self specifierAtIndexPath:a4];
  uint64_t v5 = [v4 propertyForKey:STStorageAppKey];
  id v6 = v5;
  if (v5 && ([v5 isDeleted] & 1) == 0)
  {
    if ([v6 isDeletable]) {
      unsigned __int8 v7 = 1;
    }
    else {
      unsigned __int8 v7 = [v6 isDemotable];
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  uint64_t v5 = [a3 cellForRowAtIndexPath:a4];
  id v6 = [v5 configurationState];
  unsigned int v7 = [v6 isSwiped];

  if (v7)
  {
    [(STStorageController *)self setCellIsSwiped:1];
  }
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(STStorageController *)self specifierAtIndexPath:v5];
  unsigned int v7 = [v6 propertyForKey:STStorageAppKey];
  id v8 = STStorageLocStr(@"DELETE_APP");
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_CED0;
  v28[3] = &unk_2CD90;
  id v9 = v5;
  id v29 = v9;
  long long v30 = self;
  id v10 = v6;
  id v31 = v10;
  id v11 = +[UIContextualAction contextualActionWithStyle:1 title:v8 handler:v28];

  unsigned int v12 = +[UIColor systemRedColor];
  [v11 setBackgroundColor:v12];

  id v13 = STStorageLocStr(@"UNINSTALL");
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  uint64_t v23 = sub_CFA0;
  id v24 = &unk_2CD90;
  id v14 = v9;
  id v25 = v14;
  v26 = self;
  id v15 = v10;
  id v27 = v15;
  id v16 = +[UIContextualAction contextualActionWithStyle:1 title:v13 handler:&v21];

  uint64_t v17 = +[UIColor systemBlueColor];
  [v16 setBackgroundColor:v17];

  NSErrorUserInfoKey v18 = +[NSMutableArray arrayWithCapacity:2];
  if ([v7 isDeletable]) {
    [v18 addObject:v11];
  }
  if ([v7 isDemotable] && (objc_msgSend(v7, "isDemoted") & 1) == 0) {
    [v18 addObject:v16];
  }
  CFStringRef v19 = +[UISwipeActionsConfiguration configurationWithActions:v18];
  [v19 setPerformsFirstActionWithFullSwipe:0];

  return v19;
}

- (NSArray)tipSpecs
{
  return (NSArray *)objc_getProperty(self, a2, 328, 1);
}

- (void)setTipSpecs:(id)a3
{
}

- (NSArray)appSpecs
{
  return (NSArray *)objc_getProperty(self, a2, 336, 1);
}

- (void)setAppSpecs:(id)a3
{
}

- (BOOL)cellIsSwiped
{
  return self->_cellIsSwiped;
}

- (void)setCellIsSwiped:(BOOL)a3
{
  self->_cellIsSwiped = a3;
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void)setIsMonitoring:(BOOL)a3
{
  self->_isMonitoring = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSpecs, 0);
  objc_storeStrong((id *)&self->_tipSpecs, 0);
  objc_storeStrong((id *)&self->_listSpecs, 0);
  objc_destroyWeak((id *)&self->_searchController);
  objc_storeStrong(&self->_photosLibToken, 0);
  objc_storeStrong((id *)&self->_appsController, 0);
  objc_storeStrong((id *)&self->_barData, 0);
  objc_storeStrong((id *)&self->_calculatingSpec, 0);
  objc_storeStrong((id *)&self->_otherSpec, 0);
  objc_storeStrong((id *)&self->_systemSpec, 0);
  objc_storeStrong((id *)&self->_usageGroup, 0);
  objc_storeStrong((id *)&self->_tipsGroup, 0);
  objc_storeStrong((id *)&self->_topGroup, 0);
  objc_storeStrong((id *)&self->_diskSpec, 0);
  objc_storeStrong((id *)&self->_usageBundle, 0);

  objc_storeStrong((id *)&self->_qUpdate, 0);
}

@end