@interface STStorageUsagePlugin
- (BOOL)isAutoDemoteEnabled;
- (STStorageUsagePlugin)init;
- (id)identifier;
- (id)tips;
- (id)tvUsageBundleApp;
- (int64_t)hlsSize:(id *)a3;
- (void)dealloc;
- (void)enableOptionForTip:(id)a3;
- (void)setAutoDemoteEnabled:(BOOL)a3;
- (void)updateOtherDataSize:(id)a3;
@end

@implementation STStorageUsagePlugin

- (STStorageUsagePlugin)init
{
  v5.receiver = self;
  v5.super_class = (Class)STStorageUsagePlugin;
  v2 = [(STStorageUsagePlugin *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"updateOtherDataSize:" name:STStorageOtherDataSizeChangedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:STStorageOtherDataSizeChangedNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)STStorageUsagePlugin;
  [(STStorageUsagePlugin *)&v4 dealloc];
}

- (id)identifier
{
  return @"com.apple.storageplugin.usage";
}

- (void)setAutoDemoteEnabled:(BOOL)a3
{
  v3 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a3) {
    v3 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetValue(@"OffloadUnusedApps", *v3, @"com.apple.appstored", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

- (BOOL)isAutoDemoteEnabled
{
  v2 = (void *)CFPreferencesCopyValue(@"OffloadUnusedApps", @"com.apple.appstored", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)tvUsageBundleApp
{
  if (!self->_tvReporter)
  {
    unsigned __int8 v3 = +[NSURL fileURLWithPath:@"/System/Library/UsageBundles/VideosUsage.bundle"];
    objc_super v4 = +[NSBundle bundleWithURL:v3];

    if (v4)
    {
      objc_super v5 = (PSStorageReporting *)objc_alloc_init((Class)[v4 principalClass]);
      tvReporter = self->_tvReporter;
      self->_tvReporter = v5;

      v7 = self->_tvReporter;
      if (v7)
      {
        v8 = [(PSStorageReporting *)v7 usageBundleApps];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v18;
          do
          {
            v12 = 0;
            do
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) setUsageBundleStorageReporter:self->_tvReporter];
              v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v10);
        }
        v13 = [v8 firstObject];
        tvUsageBundleApp = self->_tvUsageBundleApp;
        self->_tvUsageBundleApp = v13;
      }
    }
  }
  v15 = self->_tvUsageBundleApp;

  return v15;
}

- (int64_t)hlsSize:(id *)a3
{
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  +[NSMutableArray array];
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_5508;
  v27 = &unk_82D8;
  v29 = &v35;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v28 = v4;
  v30 = &v31;
  CacheManagementEnumerateAssets();
  objc_super v5 = (char *)[v4 count];
  if (v5)
  {
    [v4 sortUsingComparator:&stru_8318];
    if ((unint64_t)v5 >= 0xB) {
      objc_msgSend(v4, "removeObjectsInRange:", 10, v5 - 10);
    }
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    objc_super v5 = (char *)objc_claimAutoreleasedReturnValue();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v9);
          id v11 = objc_alloc_init((Class)STStorageActionTipItem);
          objc_msgSend(v11, "setSize:", objc_msgSend(v10, "size", (void)v20));
          v12 = [v10 consumedDate];
          [v11 setLastUsedDate:v12];

          [v5 addObject:v11];
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v20 objects:v39 count:16];
      }
      while (v7);
    }
  }
  v13 = v5;
  *a3 = v13;
  uint64_t v14 = v36[3];
  uint64_t v15 = v32[3];
  BOOL v16 = v14 <= v15;
  int64_t v17 = v14 - v15;
  if (v16) {
    int64_t v18 = 0;
  }
  else {
    int64_t v18 = v17;
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v18;
}

- (id)tips
{
  unsigned __int8 v3 = +[NSMutableArray array];
  if (qword_C930 != -1) {
    dispatch_once(&qword_C930, &stru_83B0);
  }
  id v4 = objc_msgSend((id)qword_C928, "ams_activeiTunesAccount");
  unsigned int v5 = [v4 isActive];

  if (v5 && ![(STStorageUsagePlugin *)self isAutoDemoteEnabled])
  {
    id v6 = (STStorageOptionTip *)objc_alloc_init((Class)STStorageOptionTip);
    offloadAppsTip = self->_offloadAppsTip;
    self->_offloadAppsTip = v6;

    [(STStorageOptionTip *)self->_offloadAppsTip setIdentifier:@"autoUnloadApps"];
    uint64_t v8 = STStorageLocStr(@"OPTIMIZE_APPS");
    [(STStorageOptionTip *)self->_offloadAppsTip setTitle:v8];

    id v9 = STStorageLocStr(@"OPTIMIZE_APPS_INFO");
    [(STStorageOptionTip *)self->_offloadAppsTip setInfoText:v9];

    [(STStorageOptionTip *)self->_offloadAppsTip setRepresentedApp:@"com.apple.AppStore"];
    [(STStorageOptionTip *)self->_offloadAppsTip setDelegate:self];
    id v10 = objc_opt_new();
    [v10 setVolume:@"/private/var"];
    [v10 setUrgency:3];
    id v11 = [objc_alloc((Class)ASDPurgeableAppRequest) initWithOptions:v10];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_5CD4;
    v49[3] = &unk_8340;
    v49[4] = self;
    [v11 startWithCompletionBlock:v49];
    [v3 addObject:self->_offloadAppsTip];
  }
  id v48 = 0;
  int64_t v12 = [(STStorageUsagePlugin *)self hlsSize:&v48];
  id v13 = v48;
  if (v12)
  {
    uint64_t v14 = (STStorageActionTip *)objc_alloc_init((Class)STStorageActionTip);
    hlsReviewTip = self->_hlsReviewTip;
    self->_hlsReviewTip = v14;

    [(STStorageActionTip *)self->_hlsReviewTip setIdentifier:@"hlsVideos"];
    BOOL v16 = STStorageLocStr(@"REVIEW_VIDEOS");
    [(STStorageActionTip *)self->_hlsReviewTip setTitle:v16];

    int64_t v17 = STStorageLocStr(@"REVIEW_VIDEOS_INFO");
    [(STStorageActionTip *)self->_hlsReviewTip setInfoText:v17];

    [(STStorageActionTip *)self->_hlsReviewTip setDetailControllerClass:NSClassFromString(@"STStorageHLSController")];
    [(STStorageActionTip *)self->_hlsReviewTip setSize:v12];
    int64_t v18 = +[UIImage systemImageNamed:@"film"];
    long long v19 = +[UIColor systemGray3Color];
    long long v20 = [v18 imageWithTintColor:v19 renderingMode:1];
    [(STStorageActionTip *)self->_hlsReviewTip setIcon:v20];

    if ([v13 count]) {
      [(STStorageActionTip *)self->_hlsReviewTip setSignificantItems:v13];
    }
    [v3 addObject:self->_hlsReviewTip];
  }
  long long v21 = [(STStorageUsagePlugin *)self tvUsageBundleApp];
  [v21 totalSize];
  uint64_t v23 = (uint64_t)v22;
  if ((uint64_t)v22)
  {
    v24 = (STStorageActionTip *)objc_alloc_init((Class)STStorageActionTip);
    tvReviewTip = self->_tvReviewTip;
    self->_tvReviewTip = v24;

    [(STStorageActionTip *)self->_tvReviewTip setIdentifier:@"iTunesVideos"];
    int v26 = MGGetBoolAnswer();
    BOOL v27 = v26 == 0;
    if (v26) {
      id v28 = @"REVIEW_VIDEOS";
    }
    else {
      id v28 = @"REVIEW_TV";
    }
    if (v27) {
      v29 = @"REVIEW_TV_INFO";
    }
    else {
      v29 = @"REVIEW_VIDEOS_INFO";
    }
    v30 = STStorageLocStr(v28);
    [(STStorageActionTip *)self->_tvReviewTip setTitle:v30];

    uint64_t v31 = STStorageLocStr(v29);
    [(STStorageActionTip *)self->_tvReviewTip setInfoText:v31];

    id v32 = (id)objc_opt_class();
    if (objc_opt_respondsToSelector()) {
      id v32 = [(PSStorageReporting *)self->_tvReporter usageDetailControllerClassForUsageBundleApp:self->_tvUsageBundleApp];
    }
    [(STStorageActionTip *)self->_tvReviewTip setDetailControllerClass:v32];
    [(STStorageActionTip *)self->_tvReviewTip setRepresentedApp:@"com.apple.tv"];
    [(STStorageActionTip *)self->_tvReviewTip setSize:v23];
    uint64_t v33 = [(STStorageActionTip *)self->_tvReviewTip specifier];
    [v33 setProperty:@"com.apple.VideoUsage" forKey:PSIDKey];
    [v33 setProperty:self->_tvUsageBundleApp forKey:@"USAGE_BUNDLE_APP"];
    [v3 addObject:self->_tvReviewTip];
  }
  uint64_t v34 = +[STStorageMediaMonitor sharedMonitor];
  if (![v34 isAsynchronouslyLoaded]
    || !STStorageIsInternalInstall()
    || ![(NSNumber *)self->_othersDataSize longLongValue])
  {

    goto LABEL_26;
  }
  if ([(NSNumber *)self->_othersDataSize longLongValue] <= 0xEFFFFFFFFLL)
  {
    uint64_t v36 = [(NSNumber *)self->_othersDataSize longLongValue];

    if (v36 >= 10485761) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  uint64_t v37 = (STStorageOptionTip *)objc_alloc_init((Class)STStorageOptionTip);
  ttrActionTip = self->_ttrActionTip;
  self->_ttrActionTip = v37;

  [(STStorageOptionTip *)self->_ttrActionTip setIdentifier:@"_LARGE_SYSTEM_DATA_"];
  uint64_t v39 = [(NSNumber *)self->_othersDataSize longLongValue];
  CFStringRef v40 = @"Large";
  if (v39 < 10485761) {
    CFStringRef v40 = @"Low";
  }
  v41 = +[NSString stringWithFormat:@"%@ \"System Data\"", v40];
  [(STStorageOptionTip *)self->_ttrActionTip setTitle:v41];

  uint64_t v42 = [(NSNumber *)self->_othersDataSize longLongValue];
  v43 = @"larger";
  if (v42 < 10485761) {
    v43 = @"lower";
  }
  othersDataSize = self->_othersDataSize;
  v45 = v43;
  [(NSNumber *)othersDataSize longLongValue];
  v46 = STFormattedSize();
  v47 = +[NSString stringWithFormat:@"The System data takes %@. This is %@ than expected. Please file a Radar to report this issue.", v46, v45];

  [(STStorageOptionTip *)self->_ttrActionTip setInfoText:v47];
  [(STStorageOptionTip *)self->_ttrActionTip setDelegate:self];
  [(STStorageOptionTip *)self->_ttrActionTip setImmediateGain:0];
  [(STStorageOptionTip *)self->_ttrActionTip setSize:0];
  [(STStorageOptionTip *)self->_ttrActionTip setRepresentedApp:@"com.apple.TapToRadar"];
  [(STStorageOptionTip *)self->_ttrActionTip setEnableButtonTitle:@"Tap-to-Radar"];
  [(STStorageOptionTip *)self->_ttrActionTip setConfirmationText:@"This will generate a radar with a disk space report attached. It may take up to 10 minutes to prepare.\n\nWould you like to proceed?"];
  [(STStorageOptionTip *)self->_ttrActionTip setConfirmationButtonTitle:@"OK"];
  [v3 addObject:self->_ttrActionTip];
LABEL_26:

  return v3;
}

- (void)enableOptionForTip:(id)a3
{
  id v4 = a3;
  unsigned int v5 = STSharedSerialQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5DF8;
  v7[3] = &unk_8390;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateOtherDataSize:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned int v5 = [v4 objectForKeyedSubscript:STStorageOtherDataSizeKey];
  othersDataSize = self->_othersDataSize;
  self->_othersDataSize = v5;

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:STStoragePluginReloadTipsNotification object:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_othersDataSize, 0);
  objc_storeStrong((id *)&self->_ttrActionTip, 0);
  objc_storeStrong((id *)&self->_tvUsageBundleApp, 0);
  objc_storeStrong((id *)&self->_tvReporter, 0);
  objc_storeStrong((id *)&self->_tvReviewTip, 0);
  objc_storeStrong((id *)&self->_hlsReviewTip, 0);
  objc_storeStrong((id *)&self->_reviewAppsTip, 0);
  objc_storeStrong((id *)&self->_offloadAppsTip, 0);
  objc_storeStrong((id *)&self->_tips, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end