@interface STStorageAppDetailController
- (BOOL)editable;
- (BOOL)removeAllowed;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (id)appSizeString:(id)a3;
- (id)dataSizeString:(id)a3;
- (id)editButton;
- (id)fileProviderTips;
- (id)hlsSpecifiers;
- (id)specifierForDocument:(id)a3;
- (id)specifiers;
- (id)spinnerSpecifier;
- (id)usageIndexPathForSpecifier:(id)a3;
- (id)valueForSpecifier:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_syncUI:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationsDidFailToInstall:(id)a3;
- (void)applicationsDidFailToUninstall:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)confirmDeleteApp;
- (void)confirmDemoteApp;
- (void)deleteApp;
- (void)deleteAssets:(id)a3;
- (void)deleteMediaItems:(id)a3;
- (void)deleteURLItems:(id)a3;
- (void)demoteApp;
- (void)didLock;
- (void)reinstallApp;
- (void)reloadSpecs:(id)a3;
- (void)setEditButtonEnabled:(BOOL)a3;
- (void)setEditable:(BOOL)a3;
- (void)setUIState:(int)a3;
- (void)setupSpecifiers;
- (void)showAlertForFailedInstallation;
- (void)suspend;
- (void)syncUI;
- (void)syncUIState:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleEdit;
- (void)updateHLSSpecs;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation STStorageAppDetailController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)STStorageAppDetailController;
  [(STStorageDetailViewController *)&v7 viewDidLoad];
  v3 = [(STStorageApp *)self->_storageApp name];
  v4 = [(STStorageAppDetailController *)self navigationItem];
  [v4 setTitle:v3];

  v5 = [(STStorageAppDetailController *)self table];
  [v5 setAllowsSelectionDuringEditing:1];

  v6 = [(STStorageAppDetailController *)self table];
  [v6 setAllowsMultipleSelectionDuringEditing:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)STStorageAppDetailController;
  [(STStorageAppDetailController *)&v12 viewWillAppear:a3];
  if ([(STStorageAppDetailController *)self isMovingToParentViewController])
  {
    [(STStorageAppDetailController *)self setEditable:0];
    v4 = +[LSApplicationWorkspace defaultWorkspace];
    [v4 addObserver:self];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"reloadSpecs:" name:STNotifyMediaSizesChanged object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"reloadSpecs:" name:STStoragePluginReloadSpecifiersNotification object:0];

    self->_skipTimer = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_15644;
    v11[3] = &unk_2D020;
    v11[4] = self;
    objc_super v7 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v11 block:1.0];
    sizeTimer = self->_sizeTimer;
    self->_sizeTimer = v7;

    [(NSTimer *)self->_sizeTimer fire];
  }
  v9 = dispatch_get_global_queue(17, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_15818;
  v10[3] = &unk_2CA90;
  v10[4] = self;
  dispatch_async(v9, v10);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(STStorageAppDetailController *)self isMovingFromParentViewController])
  {
    v5 = +[LSApplicationWorkspace defaultWorkspace];
    [v5 removeObserver:self];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:STNotifyMediaSizesChanged object:0];

    objc_super v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:STStoragePluginReloadSpecifiersNotification object:0];

    [(NSTimer *)self->_sizeTimer invalidate];
    sizeTimer = self->_sizeTimer;
    self->_sizeTimer = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)STStorageAppDetailController;
  [(STStorageAppDetailController *)&v9 viewWillDisappear:v3];
}

- (id)appSizeString:(id)a3
{
  id v4 = a3;
  storageApp = self->_storageApp;
  if (!storageApp || [(STStorageApp *)storageApp isDemoted])
  {
    self->_appSize = 0;
LABEL_4:
    v6 = &stru_2D2C0;
    goto LABEL_7;
  }
  objc_super v7 = [(STStorageApp *)self->_storageApp appSize];
  self->_appSize = (int64_t)[v7 fixed];

  if (!self->_appSize) {
    goto LABEL_4;
  }
  STFormattedSize();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (id)dataSizeString:(id)a3
{
  id v4 = a3;
  storageApp = self->_storageApp;
  if (storageApp)
  {
    v6 = [(STStorageApp *)storageApp appSize];
    if ([(STStorageApp *)self->_storageApp isDemoted]) {
      id v7 = [v6 userTotal];
    }
    else {
      id v7 = [v6 docsAndData];
    }
    self->_dataSize = (int64_t)v7;

    if (self->_dataSize >= 1)
    {
      STFormattedSize();
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    self->_dataSize = 0;
  }
  v8 = &stru_2D2C0;
LABEL_9:

  return v8;
}

- (id)valueForSpecifier:(id)a3
{
  BOOL v3 = [a3 propertyForKey:PSValueKey];
  [v3 longLongValue];
  id v4 = STFormattedSize();

  return v4;
}

- (void)setUIState:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_15BA4;
  v3[3] = &unk_2D048;
  v3[4] = self;
  int v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)deleteApp
{
  if ((+[UIApplication isRunningInStoreDemoMode] & 1) == 0)
  {
    BOOL v3 = self->_storageApp;
    if ([(STStorageApp *)v3 isDeletable])
    {
      self->_skipTimer = 1;
      [(STStorageAppDetailController *)self setUIState:6];
      objc_super v9 = [(STStorageApp *)v3 name];
      STLog();

      NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
      CFStringRef v15 = @"Canceling existing install coord because user has requested delete";
      int v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, v9);
      v5 = +[NSError errorWithDomain:@"com.apple.settings.storage" code:0 userInfo:v4];

      v6 = [(STStorageApp *)v3 bundleIdentifier];
      id v13 = 0;
      unsigned int v7 = +[IXAppInstallCoordinator cancelCoordinatorForAppWithBundleID:v6 withReason:v5 client:26 error:&v13];
      id v8 = v13;
      if (v7) {
        STLog();
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_15DE4;
      v10[3] = &unk_2CD18;
      v11 = v3;
      objc_super v12 = self;
      +[IXAppInstallCoordinator uninstallAppWithBundleID:v6 requestUserConfirmation:0 waitForDeletion:1 completion:v10];
    }
  }
}

- (void)confirmDeleteApp
{
  v2 = self->_storageApp;
  v21 = v2;
  unsigned int v3 = [(STStorageApp *)v2 isAppClip];
  int v4 = @"DELETE_APP";
  if (v3) {
    int v4 = @"DELETE_APPCLIP";
  }
  v5 = v4;
  v23 = [(__CFString *)v5 stringByAppendingString:@"_EXPLANATION"];
  v6 = (char *)objc_alloc_init((Class)PSConfirmationSpecifier);
  unsigned int v7 = STStorageLocStr(v5);
  uint64_t v20 = PSConfirmationOKKey;
  id v8 = STStorageLocStr(@"CANCEL");
  uint64_t v9 = PSConfirmationCancelKey;
  v10 = STStorageLocStr(v23);
  v11 = [(STStorageApp *)v2 name];
  objc_super v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);
  uint64_t v13 = PSConfirmationPromptKey;
  NSErrorUserInfoKey v14 = STStorageLocStr(v5);

  CFStringRef v15 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v7, v20, v8, v9, v12, v13, v14, PSConfirmationTitleKey, 0);
  [v6 setupWithDictionary:v15];

  v16 = +[NSNumber numberWithBool:1];
  [v6 setProperty:v16 forKey:PSConfirmationDestructiveKey];

  objc_storeWeak((id *)&v6[OBJC_IVAR___PSSpecifier_target], self);
  [v6 setConfirmationAction:"deleteApp"];
  CFStringRef v24 = kCFBundleIdentifierKey;
  v17 = [(STStorageApp *)v21 bundleIdentifier];
  v25 = v17;
  v18 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

  v19 = +[NSDistributedNotificationCenter defaultCenter];
  [v19 postNotificationName:@"com.apple.StorageSettings.AppMayUninstall" object:0 userInfo:v18 deliverImmediately:1];

  [(STStorageAppDetailController *)self showConfirmationViewForSpecifier:v6];
}

- (void)demoteApp
{
  if ((+[UIApplication isRunningInStoreDemoMode] & 1) == 0)
  {
    unsigned int v3 = self->_storageApp;
    if ([(STStorageApp *)v3 isDemotable])
    {
      int v4 = [(STStorageApp *)v3 appRecord];
      v5 = [v4 applicationState];
      unsigned int v6 = [v5 isValid];

      if (v6)
      {
        objc_super v12 = [(STStorageApp *)v3 name];
        STLog();

        NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
        CFStringRef v18 = @"Canceling existing install coord because user has requested offload";
        unsigned int v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1, v12);
        id v8 = +[NSError errorWithDomain:@"com.apple.settings.storage" code:0 userInfo:v7];

        uint64_t v9 = [(STStorageApp *)v3 bundleIdentifier];
        id v16 = 0;
        unsigned int v10 = +[IXAppInstallCoordinator cancelCoordinatorForAppWithBundleID:v9 withReason:v8 client:26 error:&v16];
        id v11 = v16;
        if (v10) {
          STLog();
        }
        self->_skipTimer = 1;
        [(STStorageAppDetailController *)self setUIState:4];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_16498;
        v13[3] = &unk_2CD18;
        NSErrorUserInfoKey v14 = v3;
        CFStringRef v15 = self;
        +[IXAppInstallCoordinator demoteAppToPlaceholderWithBundleID:v9 forReason:2 waitForDeletion:1 completion:v13];
      }
    }
  }
}

- (void)confirmDemoteApp
{
  NSErrorUserInfoKey v14 = (char *)objc_alloc_init((Class)PSConfirmationSpecifier);
  unsigned int v3 = STStorageLocStr(@"UNINSTALL");
  uint64_t v4 = PSConfirmationOKKey;
  v5 = STStorageLocStr(@"CANCEL");
  uint64_t v6 = PSConfirmationCancelKey;
  unsigned int v7 = STStorageLocStr(@"UNINSTALL_APP_EXPLANATION");
  id v8 = [(STStorageApp *)self->_storageApp name];
  uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);
  uint64_t v10 = PSConfirmationPromptKey;
  id v11 = STStorageLocStr(@"UNINSTALL_APP");
  objc_super v12 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v3, v4, v5, v6, v9, v10, v11, PSConfirmationTitleKey, 0);
  [v14 setupWithDictionary:v12];

  uint64_t v13 = +[NSNumber numberWithBool:0];
  [v14 setProperty:v13 forKey:PSConfirmationDestructiveKey];

  objc_storeWeak((id *)&v14[OBJC_IVAR___PSSpecifier_target], self);
  [v14 setConfirmationAction:"demoteApp"];
  [(STStorageAppDetailController *)self showConfirmationViewForSpecifier:v14];
}

- (void)reinstallApp
{
  unsigned int v3 = self->_storageApp;
  uint64_t v4 = [(STStorageApp *)v3 bundleIdentifier];
  unsigned int v5 = [(STStorageApp *)self->_storageApp state];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_16A2C;
  v17[3] = &unk_2D070;
  v17[4] = self;
  unsigned int v19 = v5;
  uint64_t v6 = v3;
  CFStringRef v18 = v6;
  unsigned int v7 = objc_retainBlock(v17);
  if ([(STStorageApp *)v6 isDeleted])
  {
    uint64_t v13 = [(STStorageApp *)v6 name];
    STLog();

    self->_skipTimer = 1;
    -[STStorageAppDetailController setUIState:](self, "setUIState:", 2, v13);
    id v8 = [objc_alloc((Class)ASDSystemAppMetadata) initWithBundleID:v4];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_16B34;
    v15[3] = &unk_2D098;
    id v16 = v7;
    +[ASDInstallApps installApp:v8 withCompletionHandler:v15];

LABEL_5:
    goto LABEL_6;
  }
  if ([(STStorageApp *)v6 isDemoted])
  {
    NSErrorUserInfoKey v14 = [(STStorageApp *)v6 name];
    STLog();

    self->_skipTimer = 1;
    -[STStorageAppDetailController setUIState:](self, "setUIState:", 2, v14);
    id v9 = objc_alloc((Class)ASDRestoreDemotedApplicationsRequest);
    id v10 = objc_alloc((Class)ASDRestoreDemotedApplicationsRequestOptions);
    uint64_t v20 = v4;
    id v11 = +[NSArray arrayWithObjects:&v20 count:1];
    id v12 = [v10 initWithBundleIDs:v11];
    id v8 = [v9 initWithOptions:v12];

    [v8 startWithCompletionBlock:v7];
    goto LABEL_5;
  }
LABEL_6:
}

- (void)showAlertForFailedInstallation
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_16BBC;
  block[3] = &unk_2CA90;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)fileProviderTips
{
  unsigned int v3 = [(STStorageApp *)self->_storageApp fpDomain];
  if ([v3 supportsEnumeration]
    && ([v3 providerID],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isEqualToString:localFilesProviderID],
        v4,
        v5))
  {
    localTip = self->_localTip;
    if (!localTip)
    {
      unsigned int v7 = STStorageDeviceKey();
      id v8 = (STStorageActionTip *)objc_alloc_init((Class)STStorageActionTip);
      id v9 = self->_localTip;
      self->_localTip = v8;

      id v10 = [v3 identifier];
      id v11 = [v10 stringByAppendingString:@"_local"];
      [(STStorageActionTip *)self->_localTip setIdentifier:v11];

      id v12 = +[NSString stringWithFormat:@"LOCAL_FILES_TITLE_%@", v7];
      uint64_t v13 = STStorageLocStr(v12);
      [(STStorageActionTip *)self->_localTip setTitle:v13];

      NSErrorUserInfoKey v14 = +[NSString stringWithFormat:@"LOCAL_FILES_INFO_%@", v7];
      CFStringRef v15 = STStorageLocStr(v14);
      [(STStorageActionTip *)self->_localTip setInfoText:v15];

      id v16 = [(STStorageApp *)self->_storageApp appIdentifier];
      [(STStorageActionTip *)self->_localTip setRepresentedApp:v16];

      [(STStorageActionTip *)self->_localTip setDetailControllerClass:NSClassFromString(@"STStorageLocalStorageController")];
      [(STStorageActionTip *)self->_localTip setProperty:self->_storageApp forKey:STStorageAppKey];
      [(STStorageActionTip *)self->_localTip setProperty:v3 forKey:@"_stFPDomain"];

      localTip = self->_localTip;
    }
    unsigned int v19 = localTip;
    NSErrorUserInfoKey v17 = +[NSArray arrayWithObjects:&v19 count:1];
  }
  else
  {
    NSErrorUserInfoKey v17 = &__NSArray0__struct;
  }

  return v17;
}

- (id)hlsSpecifiers
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[NSMutableArray array];
  unsigned int v5 = [(STStorageApp *)self->_storageApp bundleIdentifier];
  if ([v5 length])
  {
    v37 = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472;
    v39 = sub_17328;
    v40 = &unk_2CE90;
    id v41 = v3;
    id v42 = v4;
    CacheManagementEnumerateAssets();
  }
  uint64_t v6 = (char *)[v3 count];
  unsigned int v7 = &v6[(void)[v4 count]];
  id v8 = +[NSMutableArray arrayWithCapacity:v7 + 2];
  if (v7)
  {
    v28 = v5;
    id v9 = STStorageLocStr(@"HLS_VIDEOS");
    id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v8 addObject:v10];
    if ([v4 count])
    {
      [v4 sortUsingComparator:&stru_2D0B8];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v11 = v4;
      id v12 = [v11 countByEnumeratingWithState:&v33 objects:v44 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v34;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v34 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = +[STStorageCacheAssetCell specifierForAsset:*(void *)(*((void *)&v33 + 1) + 8 * i)];
            [v8 addObject:v16];
          }
          id v13 = [v11 countByEnumeratingWithState:&v33 objects:v44 count:16];
        }
        while (v13);
      }
    }
    if ([v3 count])
    {
      [v3 sortUsingComparator:&stru_2D0D8];
      if ([v4 count])
      {
        uint64_t v17 = +[PSSpecifier emptyGroupSpecifier];

        [v8 addObject:v17];
        v26 = (void *)v17;
      }
      else
      {
        v26 = v10;
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v27 = v3;
      id v18 = v3;
      id v19 = [v18 countByEnumeratingWithState:&v29 objects:v43 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = +[STStorageCacheAssetCell specifierForAsset:*(void *)(*((void *)&v29 + 1) + 8 * (void)j)];
            [v23 setProperty:&__kCFBooleanTrue forKey:@"_hideSize"];
            [v8 addObject:v23];
          }
          id v20 = [v18 countByEnumeratingWithState:&v29 objects:v43 count:16];
        }
        while (v20);
      }

      id v10 = v26;
      unsigned int v3 = v27;
    }
    CFStringRef v24 = STStorageLocStr(@"AUTO_DELETE_MSG");
    [v10 setProperty:v24 forKey:PSFooterTextGroupKey];

    unsigned int v5 = v28;
  }

  return v8;
}

- (void)updateHLSSpecs
{
  unsigned int v3 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_17614;
  block[3] = &unk_2CA90;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)spinnerSpecifier
{
  return +[PSSpecifier preferenceSpecifierNamed:&stru_2D2C0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
}

- (id)specifierForDocument:(id)a3
{
  id v3 = a3;
  id v29 = 0;
  [v3 getResourceValue:&v29 forKey:NSURLIsRegularFileKey error:0];
  id v4 = v29;
  id v28 = 0;
  [v3 getResourceValue:&v28 forKey:NSURLIsPackageKey error:0];
  id v5 = v28;
  if (([v4 BOOLValue] & 1) != 0 || objc_msgSend(v5, "BOOLValue"))
  {
    uint64_t v6 = +[STStorageItemCell specifierForItemURL:v3];
    if (v6)
    {
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x3032000000;
      v25 = sub_179A8;
      v26 = sub_179B8;
      id v27 = 0;
      id v8 = objc_alloc((Class)QLThumbnailGenerationRequest);
      ScreenScale();
      id v10 = objc_msgSend(v8, "initWithFileAtURL:size:scale:representationTypes:", v3, 4, 29.0, 29.0, v9);
      id v11 = +[QLThumbnailGenerator sharedGenerator];
      id v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      id v18 = sub_179C0;
      id v19 = &unk_2D100;
      uint64_t v21 = &v22;
      id v12 = v7;
      id v20 = v12;
      [v11 generateBestRepresentationForRequest:v10 completionHandler:&v16];

      dispatch_semaphore_wait(v12, 0);
      uint64_t v13 = v23[5];
      if (v13) {
        objc_msgSend(v6, "setProperty:forKey:", v13, STStorageIconKey, v16, v17, v18, v19);
      }
      uint64_t v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1, v16, v17, v18, v19);
      [v6 setProperty:v14 forKey:PSEnabledKey];

      _Block_object_dispose(&v22, 8);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)setupSpecifiers
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_17B08;
  block[3] = &unk_2CA90;
  block[4] = self;
  if (qword_3A540 != -1) {
    dispatch_once(&qword_3A540, block);
  }
  [(id)qword_3A550 setTarget:self];
  [(id)qword_3A558 setTarget:self];
  [(id)qword_3A560 setTarget:self];
  [(id)qword_3A568 setTarget:self];
  [(id)qword_3A578 setTarget:self];
  [(id)qword_3A570 setTarget:self];
}

- (BOOL)removeAllowed
{
  id v3 = [(STStorageApp *)self->_storageApp appRecord];
  if (v3)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    id v5 = [(STStorageApp *)self->_storageApp bundleIdentifier];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_18174;
    v10[3] = &unk_2D128;
    id v12 = &v13;
    uint64_t v6 = v4;
    id v11 = v6;
    +[IXAppInstallCoordinator removabilityForAppWithBundleID:v5 completion:v10];

    dispatch_time_t v7 = dispatch_walltime(0, 5000000000);
    dispatch_semaphore_wait(v6, v7);
    BOOL v8 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  id v3 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_87;
  }
  dispatch_semaphore_t v4 = self;
  if (!self->_storageApp)
  {
    uint64_t v5 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:STStorageAppKey];
    storageApp = v4->_storageApp;
    v4->_storageApp = (STStorageApp *)v5;

    v4->_int uiState = [(STStorageApp *)v4->_storageApp state];
    if (!v4->_storageApp)
    {
      id v27 = &__NSArray0__struct;
      goto LABEL_88;
    }
  }
  uint64_t v173 = v2;
  dispatch_time_t v7 = +[NSMutableArray array];
  id v8 = +[STStorageAppHeaderCell specifierForStorageApp:v4->_storageApp];
  if (v8)
  {
    double v9 = [(STStorageApp *)v4->_storageApp appIdentifier];
    objc_msgSend(v8, "setVersionLabelEnabled:", objc_msgSend(v9, "hasPrefix:", @"com.apple.") ^ 1);

    [v7 addObject:v8];
  }
  if (([(STStorageApp *)v4->_storageApp isDemoted] & 1) != 0
    || ([(STStorageApp *)v4->_storageApp appSize],
        id v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v10 fixed],
        v10,
        !v11))
  {
    v172 = 0;
  }
  else
  {
    if ([(STStorageApp *)v4->_storageApp isAppClip]) {
      id v12 = @"APPCLIP_SIZE";
    }
    else {
      id v12 = @"APP_SIZE";
    }
    uint64_t v13 = STStorageLocStr(v12);
    uint64_t v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:v4 set:0 get:"appSizeString:" detail:0 cell:4 edit:0];

    [v14 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v14 setProperty:v4->_storageApp forKey:STStorageAppKey];
    [v7 addObject:v14];
    id v8 = v14;
    v172 = (PSSpecifier *)v8;
  }
  uint64_t v15 = STStorageLocStr(STDocsAndDataKey);
  char v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:v4 set:0 get:"dataSizeString:" detail:0 cell:4 edit:0];

  [v16 setProperty:objc_opt_class() forKey:PSCellClassKey];
  uint64_t v170 = STStorageAppKey;
  objc_msgSend(v16, "setProperty:forKey:", v4->_storageApp);
  [v7 addObject:v16];
  uint64_t v17 = [(STStorageApp *)v4->_storageApp bundleIdentifier];
  id v178 = v16;
  v177 = v17;
  if ([(STStorageAppDetailController *)v4 removeAllowed])
  {
    unsigned int v18 = [(STStorageApp *)v4->_storageApp isDeletable];
    unsigned int v19 = [(STStorageApp *)v4->_storageApp isDemotable];
    unsigned int v20 = [(STStorageApp *)v4->_storageApp isAppClip];
    if ((v19 & 1) != 0 || v18)
    {
      [(STStorageAppDetailController *)v4 setupSpecifiers];
      uint64_t v21 = (void *)&OBJC_METACLASS___STStorageAppDetailController;
      if (v19)
      {
        id v22 = (id)qword_3A580;
        int v23 = 0;
        int uiState = v4->_uiState;
        v25 = v4;
        uint64_t v21 = &qword_3A548;
        dispatch_semaphore_t v4 = (STStorageAppDetailController *)(&dword_0 + 1);
        switch(uiState)
        {
          case 0:
            LODWORD(v4) = 0;
            uint64_t v21 = &qword_3A550;
            goto LABEL_19;
          case 1:
            LODWORD(v4) = 0;
            int v23 = 1;
            goto LABEL_22;
          case 2:
          case 4:
LABEL_19:
            v26 = (void *)*v21;
            int v23 = (int)v4;
            goto LABEL_32;
          case 3:
          case 7:
LABEL_22:
            if ([v177 isEqualToString:@"com.apple.Health"])
            {
              id v28 = (id)qword_3A590;

              id v29 = &qword_3A560;
            }
            else
            {
              id v28 = (id)qword_3A588;

              id v29 = &qword_3A558;
            }
            if (!v4) {
              id v29 = &qword_3A548;
            }
            v26 = (void *)*v29;
            id v22 = v28;
            goto LABEL_32;
          case 5:
            goto LABEL_29;
          case 6:
            int v23 = 1;
LABEL_29:
            if ([(STStorageApp *)v25->_storageApp isDemoted])
            {
              id v30 = (id)qword_3A588;

              uint64_t v21 = (uint64_t *)&OBJC_METACLASS___STStorageAppDetailController;
              v26 = (void *)qword_3A558;
              id v22 = v30;
            }
            else
            {
              v26 = (void *)qword_3A550;
LABEL_32:
              uint64_t v21 = (uint64_t *)&OBJC_METACLASS___STStorageAppDetailController;
            }
            id v31 = v26;
            if (v31)
            {
              long long v32 = v31;
              [v7 addObject:v22];
              [v7 addObject:v32];
            }
            dispatch_semaphore_t v4 = v25;
            break;
          default:
            break;
        }

        unsigned int v19 = v23 != 0;
      }
      if (v18)
      {
        if (!v20)
        {
          id v33 = (id)qword_3A598;
          switch(v4->_uiState)
          {
            case 0:
            case 3:
              goto LABEL_43;
            case 1:
            case 2:
            case 4:
              unsigned int v19 = 1;
LABEL_43:
              long long v34 = (void *)qword_3A568;
              goto LABEL_51;
            case 5:
              goto LABEL_46;
            case 6:
              unsigned int v19 = 1;
LABEL_46:
              unsigned int v35 = [(STStorageApp *)v4->_storageApp isDemoted];
              long long v34 = (void *)qword_3A548;
              if (v35) {
                uint64_t v36 = qword_3A570;
              }
              else {
                uint64_t v36 = qword_3A568;
              }
              if (!v19) {
                long long v34 = (void *)v36;
              }
              goto LABEL_51;
            default:
              goto LABEL_53;
          }
        }
        id v33 = (id)qword_3A5A0;
        if ((v4->_uiState - 5) > 1)
        {
          long long v34 = (void *)qword_3A578;
        }
        else
        {
          long long v34 = (void *)qword_3A548;
          unsigned int v19 = 1;
        }
LABEL_51:
        id v37 = v34;
        if (v37)
        {
          uint64_t v38 = v37;
          [v7 addObject:v33];
          [v7 addObject:v38];
        }
LABEL_53:
      }
      v39 = &__kCFBooleanTrue;
      if (v19) {
        v39 = &__kCFBooleanFalse;
      }
      v40 = (void *)qword_3A550;
      uint64_t v41 = PSEnabledKey;
      id v42 = v39;
      [v40 setProperty:v42 forKey:v41];
      [(id)v21[171] setProperty:v42 forKey:v41];
      [(id)qword_3A568 setProperty:v42 forKey:v41];
      [(id)qword_3A578 setProperty:v42 forKey:v41];
      [(id)qword_3A570 setProperty:v42 forKey:v41];

      uint64_t v17 = v177;
    }
  }
  v43 = +[STStoragePluginManager sharedManager];
  v44 = [(STStorageApp *)v4->_storageApp bundleIdentifier];
  if ([v44 isEqualToString:comAppleTV])
  {
    v45 = 0;
  }
  else
  {
    v45 = [v43 tipsForApp:v4->_storageApp];
  }

  v179 = [(STStorageAppDetailController *)v4 fileProviderTips];
  v174 = v4;
  v175 = v43;
  v176 = v45;
  if ([v45 count] || objc_msgSend(v179, "count"))
  {
    v46 = +[NSValue valueWithPointer:v4];
    v47 = STStorageLocStr(STFreeUpSpaceKey);
    v48 = +[PSSpecifier preferenceSpecifierNamed:v47 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    [v7 addObject:v48];

    long long v208 = 0u;
    long long v209 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    id v49 = v45;
    id v50 = [v49 countByEnumeratingWithState:&v206 objects:v215 count:16];
    if (v50)
    {
      id v51 = v50;
      int v52 = 0;
      uint64_t v53 = *(void *)v207;
      do
      {
        v54 = 0;
        int obj = v52;
        int v55 = -v52;
        do
        {
          if (*(void *)v207 != v53) {
            objc_enumerationMutation(v49);
          }
          v56 = *(void **)(*((void *)&v206 + 1) + 8 * (void)v54);
          if (v55 != v54)
          {
            v57 = +[PSSpecifier emptyGroupSpecifier];
            [v7 addObject:v57];
          }
          v58 = [v56 specifier];
          [v7 addObject:v58];

          v59 = [v56 infoSpecifier];
          [v7 addObject:v59];

          [v56 setProperty:v46 forKey:@"_stController"];
          v54 = (char *)v54 + 1;
        }
        while (v51 != v54);
        int v52 = obj + v51;
        id v51 = [v49 countByEnumeratingWithState:&v206 objects:v215 count:16];
      }
      while (v51);
    }
    else
    {
      int v52 = 0;
    }

    long long v204 = 0u;
    long long v205 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    id v60 = v179;
    id v61 = [v60 countByEnumeratingWithState:&v202 objects:v214 count:16];
    if (v61)
    {
      id v62 = v61;
      uint64_t v63 = *(void *)v203;
      do
      {
        v64 = 0;
        int obja = v52;
        int v65 = -v52;
        do
        {
          if (*(void *)v203 != v63) {
            objc_enumerationMutation(v60);
          }
          v66 = *(void **)(*((void *)&v202 + 1) + 8 * (void)v64);
          if (v65 != v64)
          {
            v67 = +[PSSpecifier emptyGroupSpecifier];
            [v7 addObject:v67];
          }
          v68 = [v66 specifier];
          [v7 addObject:v68];

          v69 = [v66 infoSpecifier];
          [v7 addObject:v69];

          [v66 setProperty:v46 forKey:@"_stController"];
          v64 = (char *)v64 + 1;
        }
        while (v62 != v64);
        int v52 = obja + v62;
        id v62 = [v60 countByEnumeratingWithState:&v202 objects:v214 count:16];
      }
      while (v62);
    }

    dispatch_semaphore_t v4 = v174;
    v43 = v175;
    v45 = v176;
    uint64_t v17 = v177;
  }
  id v70 = [v7 count];
  v71 = [v43 docPluginsForApp:v4->_storageApp];
  v72 = [(STStorageApp *)v4->_storageApp childApps];
  if (([v17 isEqualToString:comApplePhotos] & 1) == 0
    && ([v17 isEqualToString:comAppleNews] & 1) == 0)
  {
    id v168 = v70;
    v169 = v71;
    if ([v72 count])
    {
      long long v200 = 0u;
      long long v201 = 0u;
      long long v198 = 0u;
      long long v199 = 0u;
      v83 = v72;
      id v84 = v72;
      id v85 = [v84 countByEnumeratingWithState:&v198 objects:v213 count:16];
      if (v85)
      {
        id v86 = v85;
        uint64_t v87 = 0;
        uint64_t v88 = *(void *)v199;
        do
        {
          for (i = 0; i != v86; i = (char *)i + 1)
          {
            if (*(void *)v199 != v88) {
              objc_enumerationMutation(v84);
            }
            v90 = +[STStorageAppCell specifierForChildApp:*(void *)(*((void *)&v198 + 1) + 8 * i)];
            [v7 addObject:v90];
          }
          v87 += (uint64_t)v86;
          id v86 = [v84 countByEnumeratingWithState:&v198 objects:v213 count:16];
        }
        while (v86);
      }
      else
      {
        uint64_t v87 = 0;
      }

      STStorageLocStr(@"CHILD_APPS");
      BOOL v101 = 0;
      v75 = v178;
      dispatch_semaphore_t v4 = v174;
      v45 = v176;
      v73 = v72 = v83;
      if (!v87) {
        goto LABEL_185;
      }
LABEL_158:
      docsGroup = v4->_docsGroup;
      v71 = v169;
      if (docsGroup) {
        goto LABEL_162;
      }
      if (([v17 isEqualToString:@"com.apple.Health"] & 1) == 0)
      {
        uint64_t v146 = +[PSSpecifier preferenceSpecifierNamed:v73 target:0 set:0 get:0 detail:0 cell:0 edit:0];
        v147 = v4->_docsGroup;
        v4->_docsGroup = (PSSpecifier *)v146;
      }
      docsGroup = v4->_docsGroup;
      if (docsGroup)
      {
LABEL_162:
        if (v101)
        {
          [(PSSpecifier *)docsGroup setProperty:@"STStorageButtonHeader" forKey:PSHeaderCellClassGroupKey];
          v148 = v4->_docsGroup;
          STStorageLocStr(@"EDIT");
          v180 = v73;
          v149 = v72;
          v150 = v45;
          v152 = v151 = v4;
          [(PSSpecifier *)v148 setProperty:v152 forKey:@"stButtonTitle"];

          dispatch_semaphore_t v4 = v151;
          v45 = v150;
          v72 = v149;
          v73 = v180;
          [(PSSpecifier *)v4->_docsGroup setTarget:v4];
          [(PSSpecifier *)v4->_docsGroup setButtonAction:"toggleEdit"];
          docsGroup = v4->_docsGroup;
        }
        v43 = v175;
        [v7 insertObject:docsGroup atIndex:v168];
        v74 = (PSSpecifier *)v178;
      }
      else
      {
        v74 = (PSSpecifier *)v178;
        v43 = v175;
      }
      goto LABEL_86;
    }
    v167 = v72;
    if ([v71 count])
    {
      long long v196 = 0u;
      long long v197 = 0u;
      long long v194 = 0u;
      long long v195 = 0u;
      id v91 = v71;
      id v92 = [v91 countByEnumeratingWithState:&v194 objects:v212 count:16];
      if (v92)
      {
        id v93 = v92;
        uint64_t v94 = 0;
        uint64_t v95 = *(void *)v195;
        do
        {
          for (j = 0; j != v93; j = (char *)j + 1)
          {
            if (*(void *)v195 != v95) {
              objc_enumerationMutation(v91);
            }
            v97 = *(void **)(*((void *)&v194 + 1) + 8 * (void)j);
            v98 = [(STStorageApp *)v4->_storageApp appIdentifier];
            v99 = [v97 documentSpecifiersForApp:v98];

            if ([v99 count])
            {
              if (v94)
              {
                v100 = +[PSSpecifier emptyGroupSpecifier];
                [v7 addObject:v100];
              }
              ++v94;
              [v7 addObjectsFromArray:v99];
            }
          }
          id v93 = [v91 countByEnumeratingWithState:&v194 objects:v212 count:16];
        }
        while (v93);
      }
      else
      {
        uint64_t v94 = 0;
      }

      v73 = STStorageLocStr(@"DOCUMENTS");
      BOOL v101 = 0;
      v75 = v178;
      v45 = v176;
LABEL_124:
      v72 = v167;
      if (v94) {
        goto LABEL_158;
      }
LABEL_185:
      v74 = (PSSpecifier *)v178;
      v43 = v175;
      v71 = v169;
      goto LABEL_86;
    }
    v102 = +[STMediaCache mediaTypesForIdentifier:v17];

    if (!v102)
    {
      unsigned int v114 = [(STStorageApp *)v4->_storageApp isUsageApp];
      v115 = v4->_storageApp;
      if (!v114)
      {
        if (![(STStorageApp *)v115 isDocumentApp])
        {
          hlsSpecs = v4->_hlsSpecs;
          if (hlsSpecs)
          {
            if ([(NSArray *)hlsSpecs count]) {
              [v7 addObjectsFromArray:v4->_hlsSpecs];
            }
          }
          else
          {
            v162 = +[PSSpecifier emptyGroupSpecifier];
            [v7 addObject:v162];

            v163 = [(STStorageAppDetailController *)v4 spinnerSpecifier];
            [v7 addObject:v163];

            [(STStorageAppDetailController *)v4 updateHLSSpecs];
          }
          v73 = 0;
          v74 = (PSSpecifier *)v178;
          v75 = v178;
          v45 = v176;
          v72 = v167;
          goto LABEL_86;
        }
        v134 = v4;
        v135 = [(STStorageApp *)v4->_storageApp documents];
        v136 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v135 count]);
        long long v185 = 0u;
        long long v186 = 0u;
        long long v187 = 0u;
        long long v188 = 0u;
        id v137 = v135;
        id v138 = [v137 countByEnumeratingWithState:&v185 objects:v210 count:16];
        v75 = v178;
        if (v138)
        {
          id v139 = v138;
          uint64_t v140 = *(void *)v186;
          v75 = v178;
          do
          {
            v141 = 0;
            v142 = v75;
            do
            {
              if (*(void *)v186 != v140) {
                objc_enumerationMutation(v137);
              }
              v75 = [(STStorageAppDetailController *)v134 specifierForDocument:*(void *)(*((void *)&v185 + 1) + 8 * (void)v141)];

              if (v75) {
                [v136 addObject:v75];
              }
              v141 = (char *)v141 + 1;
              v142 = v75;
            }
            while (v139 != v141);
            id v139 = [v137 countByEnumeratingWithState:&v185 objects:v210 count:16];
          }
          while (v139);
        }

        id v143 = [v136 count];
        BOOL v101 = v143 != 0;
        if (v143)
        {
          id v144 = [v136 count];
          [v7 addObjectsFromArray:v136];
        }
        else
        {
          id v144 = 0;
        }
        v45 = v176;
        v72 = v167;
        uint64_t v161 = STStorageLocStr(@"DOCUMENTS");

        v73 = (void *)v161;
        dispatch_semaphore_t v4 = v134;
        uint64_t v17 = v177;
        if (!v144) {
          goto LABEL_185;
        }
        goto LABEL_158;
      }
      v116 = [(STStorageApp *)v115 usageBundle];
      v117 = [v116 usageBundleStorageReporter];
      v118 = (objc_class *)objc_opt_class();
      v166 = v117;
      if (objc_opt_respondsToSelector()) {
        v118 = (objc_class *)[v117 usageDetailControllerClassForUsageBundleApp:v116];
      }
      v119 = v116;
      v45 = v176;
      v120 = (PSUsageBundleDetailController *)objc_alloc_init(v118);
      usageDetailController = v4->_usageDetailController;
      v4->_usageDetailController = v120;

      v122 = [(STStorageAppDetailController *)v4 rootController];
      [(PSUsageBundleDetailController *)v4->_usageDetailController setRootController:v122];

      [(PSUsageBundleDetailController *)v4->_usageDetailController setParentController:v4];
      v75 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D2C0 target:0 set:0 get:0 detail:v118 cell:1 edit:0];

      v165 = v119;
      [v75 setProperty:v119 forKey:PSUsageBundleAppKey];
      [v75 setProperty:v4->_storageApp forKey:v170];
      [v75 setProperty:v4->_storageApp forKey:@"USAGE_APP"];
      [(PSUsageBundleDetailController *)v4->_usageDetailController setSpecifier:v75];
      v123 = [(objc_class *)v118 mediaGroups];
      [(objc_class *)v118 setupSpecifier:v75 forMediaGroups:v123];

      if (objc_opt_respondsToSelector())
      {
        v124 = [(STStorageApp *)v4->_storageApp usageBundle];
        id v193 = v75;
        [v117 usageBundleApp:v124 willDisplaySpecifier:&v193];
        id v125 = v193;

        v75 = v125;
      }
      [(PSUsageBundleDetailController *)v4->_usageDetailController viewDidLoad];
      [(STStorageAppDetailController *)v4 addChildViewController:v4->_usageDetailController];
      v126 = [(PSUsageBundleDetailController *)v4->_usageDetailController specifiers];
      id v127 = [v126 mutableCopy];

      v171 = v127;
      if ([v127 count])
      {
        v128 = [v127 firstObject];
        v129 = [v128 propertyForKey:PSHeaderCellClassGroupKey];
        unsigned int v130 = [v129 isEqualToString:@"PSUsageSizeHeader"];

        if (v130) {
          [v127 removeObjectAtIndex:0];
        }
        if ([v17 isEqualToString:comAppleMusic] && objc_msgSend(v127, "count"))
        {
          uint64_t v131 = STStorageLocStr(@"MUSIC");
          int v132 = 1;
        }
        else
        {
          uint64_t v131 = 0;
          int v132 = 0;
        }
        int v164 = v132;
        long long v191 = 0u;
        long long v192 = 0u;
        long long v189 = 0u;
        long long v190 = 0u;
        id objb = v127;
        id v154 = [objb countByEnumeratingWithState:&v189 objects:v211 count:16];
        v181 = (void *)v131;
        if (v154)
        {
          id v155 = v154;
          uint64_t v94 = 0;
          uint64_t v156 = *(void *)v190;
          uint64_t v157 = 1000;
          do
          {
            for (k = 0; k != v155; k = (char *)k + 1)
            {
              if (*(void *)v190 != v156) {
                objc_enumerationMutation(objb);
              }
              v159 = *(void **)(*((void *)&v189 + 1) + 8 * (void)k);
              v160 = +[NSNumber numberWithLong:(char *)k + v157];
              [v159 setProperty:v160 forKey:@"_stUsageItemID"];

              [v7 addObject:v159];
            }
            v94 += (uint64_t)v155;
            id v155 = [objb countByEnumeratingWithState:&v189 objects:v211 count:16];
            v157 += (uint64_t)k;
          }
          while (v155);
        }
        else
        {
          uint64_t v94 = 0;
        }

        dispatch_semaphore_t v4 = v174;
        v45 = v176;
        uint64_t v17 = v177;
        BOOL v101 = v164;
        v73 = v181;
      }
      else
      {
        uint64_t v94 = 0;
        v73 = 0;
        BOOL v101 = 0;
      }

      goto LABEL_124;
    }
    v103 = +[STMediaCache sharedCache];
    v104 = [v103 mediaSpecifiersForApp:v4->_storageApp];

    id v105 = [v104 count];
    BOOL v101 = v105 != 0;
    if (v105)
    {
      v72 = v167;
      if ((unint64_t)[v104 count] >= 2
        && [v17 isEqualToString:comApplePodcasts])
      {
        v106 = +[STMediaCache sharedCache];
        id v107 = [v106 totalSizeForApp:v4->_storageApp];

        v108 = STStorageLocStr(@"PODCASTS_ALL_EPISODES");
        v109 = +[PSSpecifier preferenceSpecifierNamed:v108 target:v4 set:0 get:"valueForSpecifier:" detail:0 cell:4 edit:0];

        v110 = +[NSNumber numberWithLongLong:v107];
        [v109 setProperty:v110 forKey:PSValueKey];

        [v109 setProperty:v104 forKey:@"_stMediaSpecifiers"];
        [v7 addObject:v109];
        v111 = STStorageLocStr(@"PODCASTS_SHOWS");
        v112 = +[PSSpecifier groupSpecifierWithName:v111];
        [v7 addObject:v112];

        v72 = v167;
      }
      id v113 = [v104 count];
      [v7 addObjectsFromArray:v104];
    }
    else
    {
      id v113 = 0;
      v72 = v167;
    }
    v45 = v176;
    if ([v17 isEqualToString:comApplePodcasts])
    {
      v133 = @"PODCASTS";
    }
    else if ([v17 isEqualToString:PSBundleIdentifieriBooks])
    {
      v133 = @"BOOKS";
    }
    else
    {
      if (![v17 isEqualToString:PSBundleIdentifierTV])
      {
        v73 = 0;
LABEL_157:

        v75 = v178;
        if (v113) {
          goto LABEL_158;
        }
        goto LABEL_185;
      }
      v133 = @"TV_SHOWS";
    }
    v73 = STStorageLocStr(v133);
    goto LABEL_157;
  }
  v73 = 0;
  v74 = (PSSpecifier *)v178;
  v75 = v178;
LABEL_86:

  v76 = *(void **)&v4->super.PSListController_opaque[v173];
  *(void *)&v4->super.PSListController_opaque[v173] = v7;
  id v77 = v7;

  appSizeSpec = v4->_appSizeSpec;
  v4->_appSizeSpec = v172;
  v79 = v172;

  dataSizeSpec = v4->_dataSizeSpec;
  v4->_dataSizeSpec = v74;
  v81 = v74;

  id v3 = *(void **)&v4->super.PSListController_opaque[v173];
LABEL_87:
  id v27 = v3;
LABEL_88:

  return v27;
}

- (void)_syncUI:(id)a3
{
  id v4 = [(STStorageApp *)self->_storageApp state];

  [(STStorageAppDetailController *)self setUIState:v4];
}

- (void)syncUI
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_19858;
  block[3] = &unk_2CA90;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)reloadSpecs:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"APPS"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([(STStorageApp *)self->_storageApp bundleIdentifier],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v5 containsObject:v6],
        v6,
        v7))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_199B8;
    block[3] = &unk_2CA90;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)syncUIState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STStorageApp *)self->_storageApp appRecord];
  uint64_t v6 = [v5 bundleIdentifier];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "bundleIdentifier", (void)v14);
        unsigned int v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          [(STStorageApp *)self->_storageApp refreshAppState];
          [(STStorageAppDetailController *)self syncUI];
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidFailToInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)applicationsDidFailToUninstall:(id)a3
{
}

- (void)applicationInstallsDidStart:(id)a3
{
}

- (void)deleteAssets:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "propertyForKey:", @"stCacheAsset", v11, v12, v13, v14, v15, v16);
        if (v10)
        {
          id v11 = _NSConcreteStackBlock;
          uint64_t v12 = 3221225472;
          unsigned int v13 = sub_19CB8;
          long long v14 = &unk_2CD18;
          long long v15 = self;
          long long v16 = v9;
          CacheManagementRemove();
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)deleteURLItems:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = STStorageItemURLKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v11 propertyForKey:v9];
        if (v12)
        {
          unsigned int v13 = dispatch_get_global_queue(25, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_19FB0;
          block[3] = &unk_2D150;
          id v16 = v4;
          id v17 = v12;
          long long v18 = self;
          long long v19 = v11;
          dispatch_async(v13, block);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
}

- (void)deleteMediaItems:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v11 propertyForKey:@"stMediaCollection"];
        unsigned int v13 = v12;
        if (v12)
        {
          long long v14 = [v12 items];
          if ([v14 count]) {
            [v5 addObjectsFromArray:v14];
          }
        }
        else
        {
          long long v14 = [v11 propertyForKey:@"stMediaItem"];
          if (v14) {
            [v5 addObject:v14];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    long long v15 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1A2E4;
    block[3] = &unk_2CA00;
    id v17 = v5;
    id v18 = v6;
    long long v19 = self;
    dispatch_async(v15, block);
  }
}

- (id)usageIndexPathForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:@"_stUsageItemID"];
  id v6 = [v5 longValue];

  if ((uint64_t)v6 < 1000)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(PSUsageBundleDetailController *)self->_usageDetailController indexPathForSpecifier:v4];
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STStorageAppDetailController *)self specifierAtIndexPath:v7];
  uint64_t v9 = [(STStorageAppDetailController *)self usageIndexPathForSpecifier:v8];
  if (v9
    && ([(STStorageApp *)self->_storageApp usageBundle],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [v10 bundleIdentifier],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v11 isEqualToString:@"com.apple.mobilesafari"],
        v11,
        v10,
        (v12 & 1) == 0))
  {
    if (objc_opt_respondsToSelector()) {
      [(PSUsageBundleDetailController *)self->_usageDetailController tableView:v6 didSelectRowAtIndexPath:v9];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)STStorageAppDetailController;
    [(STStorageAppDetailController *)&v13 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STStorageAppDetailController *)self specifierAtIndexPath:v7];
  uint64_t v9 = [(STStorageAppDetailController *)self usageIndexPathForSpecifier:v8];
  if (v9)
  {
    if (objc_opt_respondsToSelector()) {
      [(PSUsageBundleDetailController *)self->_usageDetailController tableView:v6 didDeselectRowAtIndexPath:v9];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)STStorageAppDetailController;
    [(STStorageAppDetailController *)&v10 tableView:v6 didDeselectRowAtIndexPath:v7];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = [(STStorageAppDetailController *)self specifierAtIndexPath:a4];
  id v6 = v5;
  if (!self->_usageDetailController)
  {
    id v11 = [v5 propertyForKey:@"stCacheAsset"];
    if (v11
      || ([v6 propertyForKey:STStorageItemURLKey],
          (id v11 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([v6 propertyForKey:UsageMediaKindKey],
          (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      objc_super v13 = [v6 propertyForKey:@"_stMediaSpecifiers"];

      if (!v13) {
        goto LABEL_6;
      }
    }
    unsigned __int8 v10 = 1;
    goto LABEL_12;
  }
  id v7 = [(STStorageAppDetailController *)self usageIndexPathForSpecifier:v5];
  if (!v7 || (objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    unsigned __int8 v10 = 0;
    goto LABEL_12;
  }
  usageDetailController = self->_usageDetailController;
  uint64_t v9 = [(PSUsageBundleDetailController *)usageDetailController table];
  unsigned __int8 v10 = [(PSUsageBundleDetailController *)usageDetailController tableView:v9 canEditRowAtIndexPath:v7];

LABEL_12:
  return v10;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  usageDetailController = self->_usageDetailController;
  uint64_t v9 = [(STStorageAppDetailController *)self specifierAtIndexPath:v7];
  unsigned __int8 v10 = v9;
  if (!usageDetailController)
  {

    if (v10)
    {
      id v15 = &dword_0 + 1;
      goto LABEL_11;
    }
LABEL_10:
    id v15 = 0;
    goto LABEL_11;
  }
  id v11 = [(STStorageAppDetailController *)self usageIndexPathForSpecifier:v9];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_10;
  }
  unsigned __int8 v12 = self->_usageDetailController;
  objc_super v13 = [(PSUsageBundleDetailController *)v12 table];
  if (v11) {
    id v14 = v11;
  }
  else {
    id v14 = v7;
  }
  id v15 = [(PSUsageBundleDetailController *)v12 tableView:v13 editingStyleForRowAtIndexPath:v14];

LABEL_11:
  return (int64_t)v15;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  if ((+[UIApplication isRunningInStoreDemoMode] & 1) == 0)
  {
    id v8 = [(STStorageAppDetailController *)self specifierAtIndexPath:v7];
    uint64_t v9 = v8;
    if (self->_usageDetailController)
    {
      unsigned __int8 v10 = [(STStorageAppDetailController *)self usageIndexPathForSpecifier:v8];
      if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        usageDetailController = self->_usageDetailController;
        unsigned __int8 v12 = [(PSUsageBundleDetailController *)usageDetailController table];
        [(PSUsageBundleDetailController *)usageDetailController tableView:v12 commitEditingStyle:a4 forRowAtIndexPath:v10];

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1AC3C;
        v18[3] = &unk_2CA28;
        v18[4] = self;
        id v19 = v9;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
      }
      goto LABEL_16;
    }
    if (a4 == 1)
    {
      objc_super v13 = [v8 propertyForKey:@"stCacheAsset"];

      if (v13)
      {
        long long v22 = v9;
        unsigned __int8 v10 = +[NSArray arrayWithObjects:&v22 count:1];
        [(STStorageAppDetailController *)self deleteAssets:v10];
LABEL_16:

        goto LABEL_17;
      }
      id v14 = [v9 propertyForKey:STStorageItemURLKey];

      if (v14)
      {
        long long v21 = v9;
        unsigned __int8 v10 = +[NSArray arrayWithObjects:&v21 count:1];
        [(STStorageAppDetailController *)self deleteURLItems:v10];
        goto LABEL_16;
      }
      id v15 = [v9 propertyForKey:UsageMediaKindKey];

      if (v15)
      {
        long long v20 = v9;
        uint64_t v16 = +[NSArray arrayWithObjects:&v20 count:1];
LABEL_15:
        unsigned __int8 v10 = (void *)v16;
        [(STStorageAppDetailController *)self deleteMediaItems:v16];
        goto LABEL_16;
      }
      id v17 = [v9 propertyForKey:@"_stMediaSpecifiers"];

      if (v17)
      {
        uint64_t v16 = [v9 propertyForKey:@"_stMediaSpecifiers"];
        goto LABEL_15;
      }
    }
LABEL_17:
  }
}

- (id)editButton
{
  uint64_t v2 = [(PSSpecifier *)self->_docsGroup propertyForKey:PSHeaderViewKey];
  id v3 = [v2 headerButton];

  return v3;
}

- (void)setEditable:(BOOL)a3
{
  if (self->_editable != a3)
  {
    self->_editable = a3;
    id v6 = [(PSSpecifier *)self->_docsGroup propertyForKey:PSHeaderViewKey];
    if (self->_editable) {
      id v4 = @"DONE";
    }
    else {
      id v4 = @"EDIT";
    }
    id v5 = STStorageLocStr(v4);
    [v6 setHeaderButtonTitle:v5];

    [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__table] setEditing:self->_editable animated:1];
  }
}

- (void)setEditButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(STStorageAppDetailController *)self editButton];
  [v4 setEnabled:v3];
}

- (void)toggleEdit
{
}

- (void)suspend
{
  v3.receiver = self;
  v3.super_class = (Class)STStorageAppDetailController;
  [(STStorageAppDetailController *)&v3 suspend];
  [(STStorageAppDetailController *)self setEditable:0];
}

- (void)didLock
{
  v3.receiver = self;
  v3.super_class = (Class)STStorageAppDetailController;
  [(STStorageAppDetailController *)&v3 didLock];
  [(STStorageAppDetailController *)self setEditable:0];
}

- (BOOL)editable
{
  return self->_editable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hlsSpecs, 0);
  objc_storeStrong((id *)&self->_localTip, 0);
  objc_storeStrong((id *)&self->_quotaTip, 0);
  objc_storeStrong((id *)&self->_unsyncTip, 0);
  objc_storeStrong((id *)&self->_pinnedTip, 0);
  objc_storeStrong((id *)&self->_childAppsGroup, 0);
  objc_storeStrong((id *)&self->_dataSizeSpec, 0);
  objc_storeStrong((id *)&self->_appSizeSpec, 0);
  objc_storeStrong((id *)&self->_docsGroup, 0);
  objc_storeStrong((id *)&self->_sizeTimer, 0);
  objc_storeStrong((id *)&self->_usageDetailController, 0);

  objc_storeStrong((id *)&self->_storageApp, 0);
}

@end