@interface STStorageOtherDetailController
- (BOOL)dataIsLoaded;
- (NSArray)apps;
- (NSDictionary)appComponents;
- (NSDictionary)logSizes;
- (NSMutableArray)specs;
- (NSMutableDictionary)bundleApps;
- (NSMutableDictionary)detailedLogSizes;
- (NSMutableDictionary)detailedOthersSizes;
- (NSNumber)otherSize;
- (STStorageOptionTip)ttrOptionTip;
- (STTTRDelegate)ttrDelegate;
- (id)detailedText;
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (int64_t)cellType;
- (void)setAppComponents:(id)a3;
- (void)setApps:(id)a3;
- (void)setBundleApps:(id)a3;
- (void)setDataIsLoaded:(BOOL)a3;
- (void)setDetailedLogSizes:(id)a3;
- (void)setDetailedOthersSizes:(id)a3;
- (void)setLogSizes:(id)a3;
- (void)setOtherSize:(id)a3;
- (void)setSpecs:(id)a3;
- (void)setTtrDelegate:(id)a3;
- (void)setTtrOptionTip:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STStorageOtherDetailController

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)STStorageOtherDetailController;
  [(STStorageDetailViewController *)&v41 viewDidLoad];
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  v4 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:PSValueKey];
  otherSize = self->_otherSize;
  self->_otherSize = v4;

  self->_dataIsLoaded = 0;
  if (STStorageIsInternalInstall())
  {
    v6 = objc_alloc_init(STTTRDelegate);
    ttrDelegate = self->_ttrDelegate;
    self->_ttrDelegate = v6;

    [(STTTRDelegate *)self->_ttrDelegate setController:self];
    v8 = [*(id *)&self->super.PSListController_opaque[v3] propertyForKey:STStorageDetailDataSizeKey];
    apps = self->_apps;
    self->_apps = v8;

    v43[0] = @"com.apple.fakeapp.SoftwareUpdate";
    v10 = [[STSizeInvestigationComponent alloc] initWithPaths:&off_2FFC0];
    v44[0] = v10;
    v43[1] = @"com.apple.mobileslideshow";
    v11 = [[STSizeInvestigationComponent alloc] initWithPaths:&off_2FFD8];
    v44[1] = v11;
    v43[2] = @"com.apple.MobileSMS";
    v12 = [[STSizeInvestigationComponent alloc] initWithPaths:&off_2FFF0];
    v44[2] = v12;
    v43[3] = @"com.apple.podcasts";
    v13 = [[STSizeInvestigationComponent alloc] initWithPaths:&off_30008];
    v44[3] = v13;
    v43[4] = @"com.apple.iBooks";
    v14 = [[STSizeInvestigationComponent alloc] initWithPaths:&off_30020];
    v44[4] = v14;
    v43[5] = @"com.apple.mobilemail";
    v36 = self;
    v15 = [[STSizeInvestigationComponent alloc] initWithPaths:&off_30038];
    v44[5] = v15;
    v43[6] = @"com.apple.Health";
    v16 = [[STSizeInvestigationComponent alloc] initWithPaths:&off_30050];
    v44[6] = v16;
    v43[7] = @"com.apple.fakeapp.MediaAppPlaceholder";
    v17 = [[STSizeInvestigationComponent alloc] initWithPaths:&off_30068];
    v44[7] = v17;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:8];
    appComponents = v36->_appComponents;
    v36->_appComponents = (NSDictionary *)v18;

    v20 = v36;
    id v35 = [objc_alloc((Class)STStorageApp) initWithBundleIdentifier:@"com.apple.fakeapp.MediaAppPlaceholder" name:@"Media apps" vendorName:0];
    id v21 = [objc_alloc((Class)STSizeVector) initWithFixed:0 docsAndData:0 purgeable:0];
    uint64_t v22 = +[NSMutableDictionary dictionaryWithCapacity:[(NSArray *)v36->_apps count]];
    bundleApps = v36->_bundleApps;
    v36->_bundleApps = (NSMutableDictionary *)v22;

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v24 = v36->_apps;
    id v25 = [(NSArray *)v24 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v38;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v30 = v20->_bundleApps;
          v31 = objc_msgSend(v29, "bundleIdentifier", v35);
          [(NSMutableDictionary *)v30 setObject:v29 forKeyedSubscript:v31];

          v32 = [v29 bundleIdentifier];
          LODWORD(v31) = [&off_30080 containsObject:v32];

          if (v31)
          {
            v33 = [v29 appSize];
            uint64_t v34 = [v21 plus:v33];

            id v21 = (id)v34;
          }
          v20 = v36;
        }
        id v26 = [(NSArray *)v24 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v26);
    }

    [v35 setExternalSizes:v21];
    [(NSMutableDictionary *)v20->_bundleApps setObject:v35 forKeyedSubscript:@"com.apple.fakeapp.MediaAppPlaceholder"];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)STStorageOtherDetailController;
  [(STStorageOtherDetailController *)&v22 viewWillAppear:a3];
  if (STStorageIsInternalInstall())
  {
    self->_dataIsLoaded = 0;
    v4 = +[NSMutableArray arrayWithCapacity:[(NSDictionary *)self->_appComponents count]];
    specs = self->_specs;
    self->_specs = v4;

    if ([(NSNumber *)self->_otherSize longLongValue] >= 0x500000000)
    {
      v6 = (STStorageOptionTip *)objc_alloc_init((Class)STStorageOptionTip);
      ttrOptionTip = self->_ttrOptionTip;
      self->_ttrOptionTip = v6;

      [(STStorageOptionTip *)self->_ttrOptionTip setIdentifier:@"_LARGE_SYSTEM_DATA_"];
      uint64_t v8 = [(NSNumber *)self->_otherSize longLongValue];
      CFStringRef v9 = @"Large";
      if (v8 <= 10485760) {
        CFStringRef v9 = @"Low";
      }
      v10 = +[NSString stringWithFormat:@"%@ \"System Data\"", v9];
      [(STStorageOptionTip *)self->_ttrOptionTip setTitle:v10];

      uint64_t v11 = [(NSNumber *)self->_otherSize longLongValue];
      v12 = @"larger";
      if (v11 <= 10485760) {
        v12 = @"lower";
      }
      otherSize = self->_otherSize;
      v14 = v12;
      [(NSNumber *)otherSize longLongValue];
      v15 = STFormattedSize();
      v16 = +[NSString stringWithFormat:@"The System data takes %@. This is %@ than expected. Please file a Radar to report this issue.", v15, v14];

      [(STStorageOptionTip *)self->_ttrOptionTip setInfoText:v16];
      [(STStorageOptionTip *)self->_ttrOptionTip setRepresentedApp:@"com.apple.TapToRadar"];
      [(STStorageOptionTip *)self->_ttrOptionTip setDelegate:self->_ttrDelegate];
      [(STStorageOptionTip *)self->_ttrOptionTip setImmediateGain:0];
      [(STStorageOptionTip *)self->_ttrOptionTip setSize:0];
      [(STStorageOptionTip *)self->_ttrOptionTip setEnableButtonTitle:@"Tap-to-Radar"];
      [(STStorageOptionTip *)self->_ttrOptionTip setConfirmationText:@"This will generate a radar with a disk space report attached. It may take up to 10 minutes to prepare.\n\nWould you like to proceed?"];
      [(STStorageOptionTip *)self->_ttrOptionTip setConfirmationButtonTitle:@"OK"];
      v17 = self->_ttrOptionTip;
      uint64_t v18 = +[NSValue valueWithPointer:self];
      [(STStorageOptionTip *)v17 setProperty:v18 forKey:@"_stController"];
    }
    v19 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_12E34;
    block[3] = &unk_2CA90;
    block[4] = self;
    dispatch_async(v19, block);
  }
  else
  {
    [(STStorageOtherDetailController *)self setLogSizes:&__NSDictionary0__struct];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_134DC;
    v20[3] = &unk_2CA90;
    v20[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);
  }
}

- (id)detailedText
{
  uint64_t v3 = STFormattedSize();
  v4 = STFormattedSize();
  id v41 = +[NSMutableString stringWithFormat:@"Storage Report : \n\nSwap : \t%@\nLogs : \t%@\n", v3, v4];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v42 = self;
  v5 = self->_detailedOthersSizes;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v11 = [(NSMutableDictionary *)v42->_detailedOthersSizes objectForKeyedSubscript:v10];
        [v11 longLongValue];
        v12 = STFormattedSize();
        v13 = +[NSString stringWithFormat:@"%@ : \t%@\n", v10, v12];
        [v41 appendString:v13];
      }
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v7);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obj = v42->_appComponents;
  id v14 = [(NSDictionary *)obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v44;
    uint64_t v32 = *(void *)v44;
    do
    {
      v17 = 0;
      id v33 = v15;
      do
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = [(NSDictionary *)v42->_appComponents objectForKeyedSubscript:*(void *)(*((void *)&v43 + 1) + 8 * (void)v17)];
        if ([v18 shouldReturn])
        {
          long long v40 = [v18 app];
          long long v39 = [v40 appSize];
          [v39 docsAndData];
          id v35 = STFormattedSize();
          long long v38 = [v18 app];
          long long v37 = [v38 appSize];
          [v37 purgeable];
          v19 = STFormattedSize();
          v20 = [v18 app];
          id v21 = [v20 appSize];
          [v21 fixed];
          objc_super v22 = STFormattedSize();
          v23 = [v18 app];
          v24 = [v23 appSize];
          [v24 dynamic];
          id v25 = STFormattedSize();
          v36 = +[NSString stringWithFormat:@"Docs&Data : %@ / Purgeable : %@ / Fixed : %@ / Dynamic : %@", v35, v19, v22, v25];

          id v26 = [v18 app];
          uint64_t v27 = [v26 bundleIdentifier];
          v28 = [v18 reportedDiff];
          v29 = [v18 reportedString];
          v30 = +[NSString stringWithFormat:@"%@ \tDiff : %@ \n\t%@\n\t%@\n\n", v27, v28, v29, v36];

          id v15 = v33;
          uint64_t v16 = v32;
          [v41 appendString:v30];
        }
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [(NSDictionary *)obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v15);
  }

  return v41;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(STStorageOtherDetailController *)self setLogSizes:0];
  v5.receiver = self;
  v5.super_class = (Class)STStorageOtherDetailController;
  [(STStorageOtherDetailController *)&v5 viewDidDisappear:v3];
}

- (id)valueForSpecifier:(id)a3
{
  BOOL v3 = [a3 propertyForKey:PSValueKey];
  [v3 longLongValue];
  v4 = STFormattedSize();

  return v4;
}

- (id)specifiers
{
  BOOL v3 = +[NSMutableArray arrayWithCapacity:100];
  v4 = +[PSSpecifier emptyGroupSpecifier];
  objc_super v5 = STStorageLocStr(@"SYSTEM_INFO");
  uint64_t v6 = PSFooterTextGroupKey;
  [v4 setProperty:v5 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  self->_szLogs = 0;
  id v7 = 0;
  v77 = v3;
  if (STStorageIsInternalInstall())
  {
    uint64_t v75 = v6;
    id v78 = [(STStorageOtherDetailController *)self logSizes];
    uint64_t v8 = +[NSMutableArray arrayWithCapacity:10];
    CFStringRef v9 = +[STStorageHeaderLabelCell specifierWithTitle:@"Internal Only"];
    [v8 addObject:v9];

    if (self->_ttrOptionTip && self->_dataIsLoaded)
    {
      uint64_t v10 = +[PSSpecifier emptyGroupSpecifier];
      [v8 addObject:v10];

      uint64_t v11 = [(STStorageOptionTip *)self->_ttrOptionTip specifier];
      [v8 addObject:v11];

      v12 = [(STStorageOptionTip *)self->_ttrOptionTip infoSpecifier];
      [v8 addObject:v12];

      v13 = +[PSSpecifier emptyGroupSpecifier];
      [v8 addObject:v13];
    }
    v83 = v8;
    if (self->_vmUsage < 1)
    {
      v76 = v4;
    }
    else
    {
      id v14 = STStorageLocStr(@"VM_USAGE");
      id v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:"valueForSpecifier:" detail:0 cell:4 edit:0];

      uint64_t v16 = +[NSNumber numberWithLongLong:self->_vmUsage];
      [v15 setProperty:v16 forKey:PSValueKey];

      [v8 addObject:v15];
      v76 = v15;
    }
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id obj = [(NSMutableDictionary *)self->_detailedOthersSizes allKeys];
    id v17 = [obj countByEnumeratingWithState:&v100 objects:v108 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v101;
      uint64_t v20 = PSValueKey;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v101 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v100 + 1) + 8 * i);
          v23 = [(NSMutableDictionary *)self->_detailedOthersSizes objectForKeyedSubscript:v22];
          if ((uint64_t)[v23 longLongValue] >= 1)
          {
            v24 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:0 get:"valueForSpecifier:" detail:0 cell:4 edit:0];
            [v24 setProperty:v23 forKey:v20];
            [v83 addObject:v24];
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v100 objects:v108 count:16];
      }
      while (v18);
    }

    id v25 = +[NSMutableDictionary dictionaryWithDictionary:v78];
    [v25 addEntriesFromDictionary:self->_detailedLogSizes];
    id v26 = [v25 keysSortedByValueWithOptions:16 usingComparator:&stru_2CFA8];
    id obja = +[NSMutableArray arrayWithCapacity:20];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v27 = v78;
    id v28 = [v27 countByEnumeratingWithState:&v96 objects:v107 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v97;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v97 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = [v27 objectForKey:*(void *)(*((void *)&v96 + 1) + 8 * (void)j)];
          uint64_t v33 = (uint64_t)[v32 longLongValue];
          if (v33 >= 1) {
            self->_szLogs += v33;
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v96 objects:v107 count:16];
      }
      while (v29);
    }

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v79 = v26;
    id v34 = [v79 countByEnumeratingWithState:&v92 objects:v106 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v93;
      uint64_t v37 = PSValueKey;
      do
      {
        for (k = 0; k != v35; k = (char *)k + 1)
        {
          if (*(void *)v93 != v36) {
            objc_enumerationMutation(v79);
          }
          uint64_t v39 = *(void *)(*((void *)&v92 + 1) + 8 * (void)k);
          long long v40 = [v25 objectForKey:v39];
          if ((uint64_t)[v40 longLongValue] >= 1)
          {
            id v41 = +[PSSpecifier preferenceSpecifierNamed:v39 target:self set:0 get:"valueForSpecifier:" detail:0 cell:4 edit:0];
            [v41 setProperty:v40 forKey:v37];
            [obja addObject:v41];
          }
        }
        id v35 = [v79 countByEnumeratingWithState:&v92 objects:v106 count:16];
      }
      while (v35);
    }

    if (self->_szLogs)
    {
      v42 = STStorageLocStr(@"LOG_FILES");
      long long v43 = +[PSSpecifier preferenceSpecifierNamed:v42 target:self set:0 get:"valueForSpecifier:" detail:0 cell:4 edit:0];

      long long v44 = +[NSNumber numberWithLongLong:self->_szLogs];
      [v43 setProperty:v44 forKey:PSValueKey];

      long long v45 = v83;
      [v83 addObject:v43];
    }
    else
    {
      long long v45 = v83;
      long long v43 = v76;
    }
    long long v46 = +[PSSpecifier emptyGroupSpecifier];

    [v45 addObject:v46];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v47 = self->_appComponents;
    id v48 = [(NSDictionary *)v47 countByEnumeratingWithState:&v88 objects:v105 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v89;
      do
      {
        for (m = 0; m != v49; m = (char *)m + 1)
        {
          if (*(void *)v89 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = [(NSDictionary *)self->_appComponents objectForKeyedSubscript:*(void *)(*((void *)&v88 + 1) + 8 * (void)m)];
          if ([v52 shouldReturn])
          {
            v53 = [v52 specifier];
            [v83 addObject:v53];
          }
        }
        id v49 = [(NSDictionary *)v47 countByEnumeratingWithState:&v88 objects:v105 count:16];
      }
      while (v49);
    }

    id v7 = v83;
    v4 = v46;
    if (!self->_dataIsLoaded)
    {
      [v46 setProperty:@"The manual sizing of the apps and media could take few minutes depending on the amount of data to evaluate." forKey:v75];
      v54 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:15 edit:0];
      [v83 addObject:v54];
    }
    v55 = +[PSSpecifier emptyGroupSpecifier];
    [v83 addObject:v55];

    [v83 addObjectsFromArray:obja];
    BOOL v3 = v77;
  }
  objb = objc_alloc_init(STStorageOtherFakeApp);
  v56 = +[STStorageAppHeaderCell specifierForStorageApp:](STStorageAppHeaderCell, "specifierForStorageApp:");
  [v3 addObject:v56];

  v57 = STStorageLocStr(@"OTHER_FILES");
  v58 = +[PSSpecifier preferenceSpecifierNamed:v57 target:self set:0 get:"valueForSpecifier:" detail:0 cell:4 edit:0];

  uint64_t v59 = PSValueKey;
  v60 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:PSValueKey];
  [v58 setProperty:v60 forKey:v59];

  [v3 addObject:v58];
  if (STStorageIsInternalInstall())
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v61 = v7;
    id v62 = [v61 countByEnumeratingWithState:&v84 objects:v104 count:16];
    if (v62)
    {
      id v63 = v62;
      uint64_t v64 = *(void *)v85;
      uint64_t v65 = PSPrioritizeValueTextDisplayKey;
      uint64_t v66 = PSAllowMultilineTitleKey;
      do
      {
        for (n = 0; n != v63; n = (char *)n + 1)
        {
          if (*(void *)v85 != v64) {
            objc_enumerationMutation(v61);
          }
          v68 = *(void **)(*((void *)&v84 + 1) + 8 * (void)n);
          [v68 setProperty:&__kCFBooleanTrue forKey:v65];
          [v68 setProperty:&__kCFBooleanTrue forKey:v66];
        }
        id v63 = [v61 countByEnumeratingWithState:&v84 objects:v104 count:16];
      }
      while (v63);
    }

    v69 = +[PSSpecifier emptyGroupSpecifier];
    BOOL v3 = v77;
    [v77 addObject:v69];

    [v77 addObjectsFromArray:v61];
  }
  uint64_t v70 = OBJC_IVAR___PSListController__specifiers;
  v71 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v72 = v3;

  id v73 = *(id *)&self->super.PSListController_opaque[v70];
  return v73;
}

- (int64_t)cellType
{
  return 2;
}

- (NSNumber)otherSize
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setOtherSize:(id)a3
{
}

- (NSDictionary)logSizes
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLogSizes:(id)a3
{
}

- (NSMutableDictionary)detailedLogSizes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setDetailedLogSizes:(id)a3
{
}

- (NSMutableDictionary)detailedOthersSizes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setDetailedOthersSizes:(id)a3
{
}

- (STTTRDelegate)ttrDelegate
{
  return (STTTRDelegate *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTtrDelegate:(id)a3
{
}

- (BOOL)dataIsLoaded
{
  return self->_dataIsLoaded;
}

- (void)setDataIsLoaded:(BOOL)a3
{
  self->_dataIsLoaded = a3;
}

- (NSMutableArray)specs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSpecs:(id)a3
{
}

- (NSDictionary)appComponents
{
  return (NSDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setAppComponents:(id)a3
{
}

- (NSArray)apps
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setApps:(id)a3
{
}

- (NSMutableDictionary)bundleApps
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 272, 1);
}

- (void)setBundleApps:(id)a3
{
}

- (STStorageOptionTip)ttrOptionTip
{
  return (STStorageOptionTip *)objc_getProperty(self, a2, 280, 1);
}

- (void)setTtrOptionTip:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttrOptionTip, 0);
  objc_storeStrong((id *)&self->_bundleApps, 0);
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_appComponents, 0);
  objc_storeStrong((id *)&self->_specs, 0);
  objc_storeStrong((id *)&self->_ttrDelegate, 0);
  objc_storeStrong((id *)&self->_detailedOthersSizes, 0);
  objc_storeStrong((id *)&self->_detailedLogSizes, 0);
  objc_storeStrong((id *)&self->_logSizes, 0);

  objc_storeStrong((id *)&self->_otherSize, 0);
}

@end