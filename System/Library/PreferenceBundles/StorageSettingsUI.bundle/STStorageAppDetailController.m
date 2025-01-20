@interface STStorageAppDetailController
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
  v9.receiver = self;
  v9.super_class = (Class)STStorageAppDetailController;
  [(STStorageAppDetailController *)&v9 viewDidLoad];
  v3 = [(STStorageDetailViewController *)self storageApp];
  v4 = [v3 name];
  v5 = [(STStorageAppDetailController *)self navigationItem];
  [v5 setTitle:v4];

  v6 = [(STStorageAppDetailController *)self navigationItem];
  [v6 setRightBarButtonItems:&__NSArray0__struct];

  v7 = [(STStorageAppDetailController *)self table];
  [v7 setAllowsSelectionDuringEditing:1];

  v8 = [(STStorageAppDetailController *)self table];
  [v8 setAllowsMultipleSelectionDuringEditing:0];
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
  }
  v7 = [(STStorageDetailViewController *)self storageApp];
  -[STStorageAppDetailController setUIState:](self, "setUIState:", [v7 state]);

  v8 = [(STStorageAppDetailController *)self rootController];
  if (v8)
  {
    [*(id *)(&self->_uiState + 1) setRootController:v8];
  }
  else
  {
    objc_super v9 = [(STStorageAppDetailController *)self navigationController];
    [*(id *)(&self->_uiState + 1) setRootController:v9];
  }
  v10 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_647C;
  block[3] = &unk_962A8;
  block[4] = self;
  dispatch_async(v10, block);
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

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:STStoragePluginReloadSpecifiersNotification object:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)STStorageAppDetailController;
  [(STStorageAppDetailController *)&v8 viewWillDisappear:v3];
}

- (id)appSizeString:(id)a3
{
  uint64_t v4 = [(STStorageDetailViewController *)self storageApp];
  if (!v4
    || (v5 = (void *)v4,
        [(STStorageDetailViewController *)self storageApp],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isDemoted],
        v6,
        v5,
        v7))
  {
    *(PSSpecifier **)((char *)&self->_childAppsGroup + 4) = 0;
LABEL_4:
    objc_super v8 = &stru_98A78;
    goto LABEL_7;
  }
  objc_super v9 = [(STStorageDetailViewController *)self storageApp];
  v10 = [v9 externalSizes];
  *(PSSpecifier **)((char *)&self->_childAppsGroup + 4) = (PSSpecifier *)[v10 fixed];

  if (!*(PSSpecifier **)((char *)&self->_childAppsGroup + 4)) {
    goto LABEL_4;
  }
  STFormattedSize();
  objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (id)dataSizeString:(id)a3
{
  uint64_t v4 = [(STStorageDetailViewController *)self storageApp];

  if (v4)
  {
    v5 = [(STStorageDetailViewController *)self storageApp];
    v6 = [v5 externalSizes];

    unsigned int v7 = [(STStorageDetailViewController *)self storageApp];
    if ([v7 isDemoted]) {
      id v8 = [v6 userTotal];
    }
    else {
      id v8 = [v6 docsAndData];
    }
    *(int64_t *)((char *)&self->_appSize + 4) = (int64_t)v8;

    if (*(uint64_t *)((char *)&self->_appSize + 4) >= 1)
    {
      STFormattedSize();
      objc_super v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    *(int64_t *)((char *)&self->_appSize + 4) = 0;
  }
  objc_super v9 = &stru_98A78;
LABEL_9:

  return v9;
}

- (id)valueForSpecifier:(id)a3
{
  BOOL v3 = [a3 propertyForKey:PSValueKey];
  [v3 longLongValue];
  uint64_t v4 = STFormattedSize();

  return v4;
}

- (void)setUIState:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_681C;
  v3[3] = &unk_96330;
  v3[4] = self;
  int v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)deleteApp
{
  if ((+[UIApplication isRunningInStoreDemoMode] & 1) == 0)
  {
    BOOL v3 = [(STStorageDetailViewController *)self storageApp];
    if ([v3 isDeletable])
    {
      BYTE4(self->_localTip) = 1;
      [(STStorageAppDetailController *)self setUIState:6];
      id v8 = [v3 name];
      STLog();

      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      CFStringRef v14 = @"Canceling existing install coord because user has requested delete";
      int v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1, v8);
      v5 = +[NSError errorWithDomain:@"com.apple.settings.storage" code:0 userInfo:v4];

      v6 = [v3 bundleIdentifier];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_6A40;
      v9[3] = &unk_96380;
      id v10 = [objc_alloc((Class)IXApplicationIdentity) initWithBundleIdentifier:v6];
      id v11 = v3;
      objc_super v12 = self;
      id v7 = v10;
      +[IXAppInstallCoordinator cancelCoordinatorForAppWithIdentity:v7 withReason:v5 client:26 completion:v9];
    }
  }
}

- (void)demoteApp
{
  if ((+[UIApplication isRunningInStoreDemoMode] & 1) == 0)
  {
    BOOL v3 = [(STStorageDetailViewController *)self storageApp];
    if ([v3 isDemotable])
    {
      int v4 = [v3 appRecord];
      v5 = [v4 applicationState];
      unsigned int v6 = [v5 isValid];

      if (v6)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_75AFC(v3);
        }
        NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
        CFStringRef v18 = @"Canceling existing install coord because user has requested offload";
        id v7 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        id v8 = +[NSError errorWithDomain:@"com.apple.settings.storage" code:0 userInfo:v7];

        objc_super v9 = [v3 bundleIdentifier];
        id v10 = [objc_alloc((Class)IXApplicationIdentity) initWithBundleIdentifier:v9];
        id v16 = 0;
        unsigned int v11 = +[IXAppInstallCoordinator cancelCoordinatorForAppWithIdentity:v10 withReason:v8 client:19 error:&v16];
        id v12 = v16;
        if (v11)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_75AB4();
          }
        }
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_6EE4;
        v13[3] = &unk_963A8;
        id v14 = v3;
        v15 = self;
        +[IXAppInstallCoordinator demoteAppToPlaceholderWithApplicationIdentity:v10 forReason:2 waitForDeletion:1 ignoreRemovability:0 completion:v13];
      }
    }
  }
}

- (void)confirmDemoteApp
{
  BOOL v3 = STLocalizedString(@"Offloading “%@” will delete the app but keep its documents and data.");
  int v4 = [(STStorageDetailViewController *)self storageApp];
  v5 = [v4 name];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  unsigned int v6 = (char *)objc_alloc_init((Class)PSConfirmationSpecifier);
  id v7 = STLocalizedString(@"Offload App");
  uint64_t v8 = PSConfirmationOKKey;
  objc_super v9 = STLocalizedString(@"Cancel");
  uint64_t v10 = PSConfirmationCancelKey;
  uint64_t v11 = PSConfirmationPromptKey;
  id v12 = STLocalizedString(@"Offload App");
  NSErrorUserInfoKey v13 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v7, v8, v9, v10, v15, v11, v12, PSConfirmationTitleKey, 0);
  [v6 setupWithDictionary:v13];

  id v14 = +[NSNumber numberWithBool:0];
  [v6 setProperty:v14 forKey:PSConfirmationDestructiveKey];

  objc_storeWeak((id *)&v6[OBJC_IVAR___PSSpecifier_target], self);
  [v6 setConfirmationAction:"demoteApp"];
  [(STStorageAppDetailController *)self showConfirmationViewForSpecifier:v6];
}

- (void)reinstallApp
{
  BOOL v3 = [(STStorageDetailViewController *)self storageApp];
  int v4 = [v3 bundleIdentifier];
  v5 = [(STStorageDetailViewController *)self storageApp];
  unsigned int v6 = [v5 state];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_7454;
  v16[3] = &unk_963D0;
  v16[4] = self;
  unsigned int v18 = v6;
  id v7 = v3;
  id v17 = v7;
  uint64_t v8 = objc_retainBlock(v16);
  if ([v7 isDeleted])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_75C10(v7);
    }
    BYTE4(self->_localTip) = 1;
    [(STStorageAppDetailController *)self setUIState:2];
    id v9 = [objc_alloc((Class)ASDSystemAppMetadata) initWithBundleID:v4];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_7530;
    v14[3] = &unk_963F8;
    id v15 = v8;
    +[ASDInstallApps installApp:v9 withCompletionHandler:v14];

LABEL_9:
    goto LABEL_10;
  }
  if ([v7 isDemoted])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_75C10(v7);
    }
    BYTE4(self->_localTip) = 1;
    [(STStorageAppDetailController *)self setUIState:2];
    id v10 = objc_alloc((Class)ASDRestoreDemotedApplicationsRequest);
    id v11 = objc_alloc((Class)ASDRestoreDemotedApplicationsRequestOptions);
    v19 = v4;
    id v12 = +[NSArray arrayWithObjects:&v19 count:1];
    id v13 = [v11 initWithBundleIDs:v12];
    id v9 = [v10 initWithOptions:v13];

    [v9 startWithCompletionBlock:v8];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)showAlertForFailedInstallation
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_75B8;
  block[3] = &unk_962A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)fileProviderTips
{
  BOOL v3 = [(STStorageDetailViewController *)self storageApp];
  int v4 = [v3 fpDomain];

  if (![v4 supportsEnumeration]
    || ([v4 providerID],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isEqualToString:localFilesProviderID],
        v5,
        !v6))
  {
    id v13 = &__NSArray0__struct;
    goto LABEL_14;
  }
  uint64_t v7 = *(uint64_t *)((char *)&self->_quotaTip + 4);
  if (!v7)
  {
    uint64_t v8 = STStorageDeviceKey();
    id v9 = STLocalizedString(@"On My Device");
    id v10 = STLocalizedString(@"Review document files taking the most space and consider deleting them. These items are stored only on your device and will be permanently deleted.");
    if ([v8 isEqualToString:@"PHONE"])
    {
      uint64_t v11 = STLocalizedString(@"On My iPhone");
      id v12 = @"Review document files taking the most space and consider deleting them. These items are stored only on your iPhone and will be permanently deleted.";
    }
    else if ([v8 isEqualToString:@"PAD"])
    {
      uint64_t v11 = STLocalizedString(@"On My iPad");
      id v12 = @"Review document files taking the most space and consider deleting them. These items are stored only on your iPad and will be permanently deleted.";
    }
    else
    {
      if (![v8 isEqualToString:@"IPOD"])
      {
LABEL_12:
        id v15 = (STStorageActionTip *)objc_alloc_init((Class)STStorageActionTip);
        id v16 = *(STStorageActionTip **)((char *)&self->_quotaTip + 4);
        *(STStorageActionTip **)((char *)&self->_quotaTip + 4) = v15;

        id v17 = [v4 identifier];
        unsigned int v18 = [v17 stringByAppendingString:@"_local"];
        [*(id *)((char *)&self->_quotaTip + 4) setIdentifier:v18];

        [*(id *)((char *)&self->_quotaTip + 4) setTitle:v9];
        [*(id *)((char *)&self->_quotaTip + 4) setInfoText:v10];
        v19 = [(STStorageDetailViewController *)self storageApp];
        v20 = [v19 appIdentifier];
        [*(id *)((char *)&self->_quotaTip + 4) setRepresentedApp:v20];

        [*(id *)((char *)&self->_quotaTip + 4) setDetailControllerClass:NSClassFromString(@"STStorageLocalStorageController")];
        v21 = *(STStorageActionTip **)((char *)&self->_quotaTip + 4);
        v22 = [(STStorageDetailViewController *)self storageApp];
        [v21 setProperty:v22 forKey:STStorageAppKey];

        [*(id *)((char *)&self->_quotaTip + 4) setProperty:v4 forKey:@"_stFPDomain"];
        uint64_t v7 = *(uint64_t *)((char *)&self->_quotaTip + 4);
        goto LABEL_13;
      }
      uint64_t v11 = STLocalizedString(@"On My iPod touch");
      id v12 = @"Review document files taking the most space and consider deleting them. These items are stored only on your iPod touch and will be permanently deleted.";
    }

    uint64_t v14 = STLocalizedString(v12);

    id v9 = (void *)v11;
    id v10 = (void *)v14;
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v24 = v7;
  id v13 = +[NSArray arrayWithObjects:&v24 count:1];
LABEL_14:

  return v13;
}

- (id)hlsSpecifiers
{
  BOOL v3 = +[NSMutableArray array];
  int v4 = +[NSMutableArray array];
  v5 = [(STStorageDetailViewController *)self storageApp];
  unsigned int v6 = [v5 bundleIdentifier];

  if ([v6 length])
  {
    v38 = _NSConcreteStackBlock;
    uint64_t v39 = 3221225472;
    v40 = sub_7E60;
    v41 = &unk_96420;
    id v42 = v3;
    id v43 = v4;
    CacheManagementEnumerateAssets();
  }
  uint64_t v7 = (char *)[v3 count];
  uint64_t v8 = &v7[(void)[v4 count]];
  id v9 = +[NSMutableArray arrayWithCapacity:v8 + 2];
  if (v8)
  {
    v29 = v6;
    id v10 = STLocalizedString(@"Downloaded Videos");
    uint64_t v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v9 addObject:v11];
    if ([v4 count])
    {
      [v4 sortUsingComparator:&stru_96460];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v12 = v4;
      id v13 = [v12 countByEnumeratingWithState:&v34 objects:v45 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v35;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = +[STStorageCacheAssetCell specifierForAsset:*(void *)(*((void *)&v34 + 1) + 8 * i)];
            [v9 addObject:v17];
          }
          id v14 = [v12 countByEnumeratingWithState:&v34 objects:v45 count:16];
        }
        while (v14);
      }
    }
    if ([v3 count])
    {
      [v3 sortUsingComparator:&stru_96480];
      if ([v4 count])
      {
        uint64_t v18 = +[PSSpecifier emptyGroupSpecifier];

        [v9 addObject:v18];
        v27 = (void *)v18;
      }
      else
      {
        v27 = v11;
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v28 = v3;
      id v19 = v3;
      id v20 = [v19 countByEnumeratingWithState:&v30 objects:v44 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v31;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = +[STStorageCacheAssetCell specifierForAsset:*(void *)(*((void *)&v30 + 1) + 8 * (void)j)];
            [v24 setProperty:&__kCFBooleanTrue forKey:@"_hideSize"];
            [v9 addObject:v24];
          }
          id v21 = [v19 countByEnumeratingWithState:&v30 objects:v44 count:16];
        }
        while (v21);
      }

      uint64_t v11 = v27;
      BOOL v3 = v28;
    }
    v25 = STLocalizedString(@"Content from this app may be automatically deleted when this device is running low on storage.");
    [v11 setProperty:v25 forKey:PSFooterTextGroupKey];

    unsigned int v6 = v29;
  }

  return v9;
}

- (void)updateHLSSpecs
{
  BOOL v3 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_814C;
  block[3] = &unk_962A8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)spinnerSpecifier
{
  return +[PSSpecifier preferenceSpecifierNamed:&stru_98A78 target:0 set:0 get:0 detail:0 cell:15 edit:0];
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
    unsigned int v6 = +[STStorageItemCell specifierForItemURL:v3];
    if (v6)
    {
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x3032000000;
      v25 = sub_84E0;
      v26 = sub_84F0;
      id v27 = 0;
      id v8 = objc_alloc((Class)QLThumbnailGenerationRequest);
      ScreenScale();
      id v10 = objc_msgSend(v8, "initWithFileAtURL:size:scale:representationTypes:", v3, 4, 29.0, 29.0, v9);
      uint64_t v11 = +[QLThumbnailGenerator sharedGenerator];
      id v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      uint64_t v18 = sub_84F8;
      id v19 = &unk_964A8;
      id v21 = &v22;
      id v12 = v7;
      id v20 = v12;
      [v11 generateBestRepresentationForRequest:v10 completionHandler:&v16];

      dispatch_semaphore_wait(v12, 0);
      uint64_t v13 = v23[5];
      if (v13) {
        objc_msgSend(v6, "setProperty:forKey:", v13, STStorageIconKey, v16, v17, v18, v19);
      }
      id v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1, v16, v17, v18, v19);
      [v6 setProperty:v14 forKey:PSEnabledKey];

      _Block_object_dispose(&v22, 8);
    }
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

- (void)setupSpecifiers
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8640;
  block[3] = &unk_962A8;
  block[4] = self;
  if (qword_A4B70 != -1) {
    dispatch_once(&qword_A4B70, block);
  }
  [(id)qword_A4B80 setTarget:self];
  [(id)qword_A4B88 setTarget:self];
  [(id)qword_A4B90 setTarget:self];
  [(id)qword_A4B98 setTarget:self];
  [(id)qword_A4BA8 setTarget:self];
  [(id)qword_A4BA0 setTarget:self];
}

- (BOOL)removeAllowed
{
  v2 = [(STStorageDetailViewController *)self storageApp];
  id v3 = [v2 appRecord];

  if (v3)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_8DA8;
    v8[3] = &unk_964D0;
    id v10 = &v11;
    id v4 = dispatch_semaphore_create(0);
    double v9 = v4;
    +[AppRemovability isAllowedAndPossibleWithApp:v3 completionHandler:v8];
    dispatch_time_t v5 = dispatch_walltime(0, 5000000000);
    dispatch_semaphore_wait(v4, v5);
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)specifiers
{
  v2 = self;
  id v3 = *(void **)&self->super.PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v195 = OBJC_IVAR___PSListController__specifiers;
    id v4 = +[NSMutableArray array];
    id v5 = +[PSSpecifier preferenceSpecifierNamed:&stru_98A78 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = PSCellClassKey;
    [v5 setProperty:v6 forKey:PSCellClassKey];
    id v8 = [(STStorageDetailViewController *)v2 storageApp];
    double v9 = (void *)STStorageAppKey;
    [v5 setProperty:v8 forKey:STStorageAppKey];

    if (v5) {
      [v4 addObject:v5];
    }
    id v10 = [(STStorageDetailViewController *)v2 storageApp];
    if ([v10 isDemoted])
    {
      v194 = 0;
    }
    else
    {
      uint64_t v11 = [(STStorageDetailViewController *)v2 storageApp];
      id v12 = [v11 externalSizes];
      id v13 = [v12 fixed];

      if (!v13)
      {
        v194 = 0;
        goto LABEL_11;
      }
      id v10 = STLocalizedString(@"App Size");
      char v14 = [(STStorageDetailViewController *)v2 storageApp];
      unsigned int v15 = [v14 isAppClip];

      if (v15)
      {
        uint64_t v16 = STLocalizedString(@"App Clip Size");

        id v10 = (void *)v16;
      }
      uint64_t v17 = +[PSSpecifier preferenceSpecifierNamed:v10 target:v2 set:0 get:"appSizeString:" detail:0 cell:4 edit:0];

      [v17 setProperty:objc_opt_class() forKey:v7];
      uint64_t v18 = [(STStorageDetailViewController *)v2 storageApp];
      [v17 setProperty:v18 forKey:v9];

      [v4 addObject:v17];
      id v5 = v17;
      v194 = (PSSpecifier *)v5;
    }

LABEL_11:
    id v19 = STLocalizedString(@"Documents & Data");
    id v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:v2 set:0 get:"dataSizeString:" detail:0 cell:4 edit:0];

    [v20 setProperty:objc_opt_class() forKey:v7];
    id v21 = [(STStorageDetailViewController *)v2 storageApp];
    [v20 setProperty:v21 forKey:v9];

    [v4 addObject:v20];
    uint64_t v22 = [(STStorageDetailViewController *)v2 storageApp];
    v23 = [v22 bundleIdentifier];

    v196 = v20;
    v197 = v23;
    id obj = v9;
    if ([(STStorageAppDetailController *)v2 removeAllowed])
    {
      uint64_t v24 = [(STStorageDetailViewController *)v2 storageApp];
      unsigned int v25 = [v24 isDeletable];

      v26 = [(STStorageDetailViewController *)v2 storageApp];
      unsigned int v27 = [v26 isDemotable];

      id v28 = [(STStorageDetailViewController *)v2 storageApp];
      unsigned int v29 = [v28 isAppClip];

      if ((v27 & 1) != 0 || v25)
      {
        [(STStorageAppDetailController *)v2 setupSpecifiers];
        if (v27)
        {
          id v30 = (id)qword_A4BB0;
          int v31 = 0;
          long long v32 = &qword_A4B78;
          int v33 = 1;
          switch(v2->_uiState)
          {
            case 0:
              int v33 = 0;
              long long v32 = &qword_A4B80;
              goto LABEL_17;
            case 1:
              int v33 = 0;
              int v31 = 1;
              goto LABEL_21;
            case 2:
            case 4:
LABEL_17:
              long long v34 = (void *)*v32;
              int v31 = v33;
              goto LABEL_31;
            case 3:
            case 7:
LABEL_21:
              if ([v197 isEqualToString:@"com.apple.Health"])
              {
                id v36 = (id)qword_A4BC0;

                long long v37 = &qword_A4B90;
              }
              else
              {
                id v36 = (id)qword_A4BB8;

                long long v37 = &qword_A4B88;
              }
              if (!v33) {
                long long v37 = &qword_A4B78;
              }
              long long v34 = (void *)*v37;
              goto LABEL_30;
            case 5:
              goto LABEL_28;
            case 6:
              int v31 = 1;
LABEL_28:
              v38 = [(STStorageDetailViewController *)v2 storageApp];
              unsigned int v39 = [v38 isDemoted];

              if (v39)
              {
                id v36 = (id)qword_A4BB8;

                long long v34 = (void *)qword_A4B88;
LABEL_30:
                id v30 = v36;
              }
              else
              {
                long long v34 = (void *)qword_A4B80;
              }
LABEL_31:
              id v40 = v34;
              if (v40)
              {
                v41 = v40;
                [v4 addObject:v30];
                [v4 addObject:v41];
              }
              break;
            default:
              break;
          }

          BOOL v35 = v31 != 0;
        }
        else
        {
          BOOL v35 = 0;
        }
        if (v25)
        {
          if (!v29)
          {
            id v42 = (id)qword_A4BC8;
            switch(v2->_uiState)
            {
              case 0:
              case 3:
                goto LABEL_41;
              case 1:
              case 2:
              case 4:
                BOOL v35 = 1;
LABEL_41:
                id v43 = (void *)qword_A4B98;
                goto LABEL_43;
              case 5:
                goto LABEL_139;
              case 6:
                BOOL v35 = 1;
LABEL_139:
                v144 = [(STStorageDetailViewController *)v2 storageApp];
                unsigned int v145 = [v144 isDemoted];

                id v43 = (void *)qword_A4B78;
                if (v145) {
                  uint64_t v146 = qword_A4BA0;
                }
                else {
                  uint64_t v146 = qword_A4B98;
                }
                if (!v35) {
                  id v43 = (void *)v146;
                }
                goto LABEL_43;
              default:
                goto LABEL_45;
            }
          }
          id v42 = (id)qword_A4BD0;
          if ((v2->_uiState - 5) > 1)
          {
            id v43 = (void *)qword_A4BA8;
          }
          else
          {
            id v43 = (void *)qword_A4B78;
            BOOL v35 = 1;
          }
LABEL_43:
          id v44 = v43;
          if (v44)
          {
            v45 = v44;
            [v4 addObject:v42];
            [v4 addObject:v45];
          }
LABEL_45:
        }
        v46 = &__kCFBooleanTrue;
        if (v35) {
          v46 = &__kCFBooleanFalse;
        }
        v47 = (void *)qword_A4B80;
        uint64_t v48 = PSEnabledKey;
        id v49 = v46;
        [v47 setProperty:v49 forKey:v48];
        [(id)qword_A4B88 setProperty:v49 forKey:v48];
        [(id)qword_A4B98 setProperty:v49 forKey:v48];
        [(id)qword_A4BA8 setProperty:v49 forKey:v48];
        [(id)qword_A4BA0 setProperty:v49 forKey:v48];

        v23 = v197;
      }
    }
    v50 = +[StorageSettingsWrapper recommendationsShared];
    v51 = [(STStorageDetailViewController *)v2 storageApp];
    v52 = [v51 bundleIdentifier];
    if ([v52 isEqualToString:comAppleTV])
    {
      v53 = 0;
    }
    else
    {
      v54 = [(STStorageDetailViewController *)v2 storageApp];
      v53 = [v50 tipsForApp:v54];

      v23 = v197;
    }

    v198 = [(STStorageAppDetailController *)v2 fileProviderTips];
    v199 = v2;
    v191 = v53;
    v192 = v50;
    if ([v53 count] || objc_msgSend(v198, "count"))
    {
      v55 = +[NSValue valueWithPointer:v2];
      v56 = STLocalizedString(@"Recommendations");
      v57 = +[PSSpecifier preferenceSpecifierNamed:v56 target:0 set:0 get:0 detail:0 cell:0 edit:0];
      [v4 addObject:v57];

      long long v226 = 0u;
      long long v227 = 0u;
      long long v224 = 0u;
      long long v225 = 0u;
      id v58 = v53;
      id v59 = [v58 countByEnumeratingWithState:&v224 objects:v233 count:16];
      if (v59)
      {
        id v60 = v59;
        int v61 = 0;
        uint64_t v62 = *(void *)v225;
        do
        {
          v63 = 0;
          int v200 = v61;
          int v64 = -v61;
          do
          {
            if (*(void *)v225 != v62) {
              objc_enumerationMutation(v58);
            }
            v65 = *(void **)(*((void *)&v224 + 1) + 8 * (void)v63);
            if (v64 != v63)
            {
              v66 = +[PSSpecifier emptyGroupSpecifier];
              [v4 addObject:v66];
            }
            v67 = [v65 specifier];
            [v4 addObject:v67];

            v68 = [v65 infoSpecifier];
            [v4 addObject:v68];

            [v65 setProperty:v55 forKey:@"_stController"];
            v63 = (char *)v63 + 1;
          }
          while (v60 != v63);
          int v61 = v200 + v60;
          id v60 = [v58 countByEnumeratingWithState:&v224 objects:v233 count:16];
        }
        while (v60);
      }
      else
      {
        int v61 = 0;
      }

      long long v222 = 0u;
      long long v223 = 0u;
      long long v220 = 0u;
      long long v221 = 0u;
      id v69 = v198;
      id v70 = [v69 countByEnumeratingWithState:&v220 objects:v232 count:16];
      if (v70)
      {
        id v71 = v70;
        uint64_t v72 = *(void *)v221;
        do
        {
          v73 = 0;
          int v201 = v61;
          int v74 = -v61;
          do
          {
            if (*(void *)v221 != v72) {
              objc_enumerationMutation(v69);
            }
            v75 = *(void **)(*((void *)&v220 + 1) + 8 * (void)v73);
            if (v74 != v73)
            {
              v76 = +[PSSpecifier emptyGroupSpecifier];
              [v4 addObject:v76];
            }
            v77 = [v75 specifier];
            [v4 addObject:v77];

            v78 = [v75 infoSpecifier];
            [v4 addObject:v78];

            [v75 setProperty:v55 forKey:@"_stController"];
            v73 = (char *)v73 + 1;
          }
          while (v71 != v73);
          int v61 = v201 + v71;
          id v71 = [v69 countByEnumeratingWithState:&v220 objects:v232 count:16];
        }
        while (v71);
      }

      v2 = v199;
      v23 = v197;
      v53 = v191;
      v50 = v192;
    }
    id v188 = [v4 count];
    v79 = [(STStorageDetailViewController *)v2 storageApp];
    v80 = [v50 docPluginsForApp:v79];

    v81 = [(STStorageDetailViewController *)v2 storageApp];
    v202 = [v81 childApps];

    v193 = v80;
    if (([v23 isEqualToString:comApplePhotos] & 1) != 0
      || ([v23 isEqualToString:comAppleNews] & 1) != 0)
    {
      v82 = 0;
      v83 = v196;
      v84 = v196;
LABEL_78:
      v85 = v202;
LABEL_123:

      v125 = *(void **)&v2->super.PSEditableListController_opaque[v195];
      *(void *)&v2->super.PSEditableListController_opaque[v195] = v4;
      id v126 = v4;

      v127 = *(PSSpecifier **)((char *)&v2->_docsGroup + 4);
      *(PSSpecifier **)((char *)&v2->_docsGroup + 4) = v194;
      v128 = v194;

      v129 = *(PSSpecifier **)((char *)&v2->_appSizeSpec + 4);
      *(PSSpecifier **)((char *)&v2->_appSizeSpec + 4) = v83;
      v130 = v83;

      id v3 = *(void **)&v2->super.PSEditableListController_opaque[v195];
      goto LABEL_124;
    }
    if ([v202 count])
    {
      v86 = v50;
      long long v218 = 0u;
      long long v219 = 0u;
      long long v216 = 0u;
      long long v217 = 0u;
      id v87 = v202;
      v88 = (char *)[v87 countByEnumeratingWithState:&v216 objects:v231 count:16];
      if (v88)
      {
        v89 = v88;
        v90 = 0;
        uint64_t v91 = *(void *)v217;
        do
        {
          for (i = 0; i != v89; ++i)
          {
            if (*(void *)v217 != v91) {
              objc_enumerationMutation(v87);
            }
            v93 = +[STStorageAppCell specifierForChildApp:*(void *)(*((void *)&v216 + 1) + 8 * i)];
            [v4 addObject:v93];
          }
          v90 = &v89[(void)v90];
          v89 = (char *)[v87 countByEnumeratingWithState:&v216 objects:v231 count:16];
        }
        while (v89);
      }
      else
      {
        v90 = 0;
      }

      STLocalizedString(@"Applications");
      BOOL v104 = 0;
      v84 = v196;
      v82 = v50 = v86;
LABEL_111:
      v85 = v202;
      goto LABEL_112;
    }
    if ([v80 count])
    {
      long long v214 = 0u;
      long long v215 = 0u;
      long long v212 = 0u;
      long long v213 = 0u;
      id v94 = v80;
      id v95 = [v94 countByEnumeratingWithState:&v212 objects:v230 count:16];
      if (v95)
      {
        id v96 = v95;
        v90 = 0;
        uint64_t v97 = *(void *)v213;
        do
        {
          for (j = 0; j != v96; j = (char *)j + 1)
          {
            if (*(void *)v213 != v97) {
              objc_enumerationMutation(v94);
            }
            v99 = *(void **)(*((void *)&v212 + 1) + 8 * (void)j);
            v100 = [(STStorageDetailViewController *)v199 storageApp];
            v101 = [v100 appIdentifier];
            v102 = [v99 documentSpecifiersForApp:v101];

            if ([v102 count])
            {
              if (v90)
              {
                v103 = +[PSSpecifier emptyGroupSpecifier];
                [v4 addObject:v103];
              }
              ++v90;
              [v4 addObjectsFromArray:v102];
            }
          }
          id v96 = [v94 countByEnumeratingWithState:&v212 objects:v230 count:16];
        }
        while (v96);
      }
      else
      {
        v90 = 0;
      }

      v82 = STLocalizedString(@"Documents");
      BOOL v104 = 0;
      v84 = v196;
      v53 = v191;
      v50 = v192;
      goto LABEL_111;
    }
    v105 = +[STMediaCache mediaTypesForIdentifier:v23];

    if (!v105)
    {
      v132 = [(STStorageDetailViewController *)v2 storageApp];
      unsigned int v133 = [v132 isUsageApp];

      v134 = [(STStorageDetailViewController *)v2 storageApp];
      v135 = v134;
      if (v133)
      {
        v136 = [v134 usageBundle];

        v137 = [v136 usageBundleStorageReporter];
        v138 = (objc_class *)objc_opt_class();
        if (objc_opt_respondsToSelector()) {
          v138 = (objc_class *)[v137 usageDetailControllerClassForUsageBundleApp:v136];
        }
        id v139 = objc_alloc_init(v138);
        v140 = *(void **)(&v2->_uiState + 1);
        *(void *)(&v2->_uiState + 1) = v139;

        v141 = [(STStorageAppDetailController *)v2 rootController];
        if (v141)
        {
          [*(id *)(&v2->_uiState + 1) setRootController:v141];
        }
        else
        {
          v160 = [(STStorageAppDetailController *)v2 navigationController];
          [*(id *)(&v2->_uiState + 1) setRootController:v160];
        }
        [*(id *)(&v2->_uiState + 1) setParentController:v2];
        v84 = +[PSSpecifier preferenceSpecifierNamed:&stru_98A78 target:0 set:0 get:0 detail:v138 cell:1 edit:0];

        [v84 setProperty:v136 forKey:PSUsageBundleAppKey];
        v161 = [(STStorageDetailViewController *)v2 storageApp];
        [v84 setProperty:v161 forKey:obj];

        v162 = [(STStorageDetailViewController *)v2 storageApp];
        [v84 setProperty:v162 forKey:@"USAGE_APP"];

        [*(id *)(&v2->_uiState + 1) setSpecifier:v84];
        v163 = [(objc_class *)v138 mediaGroups];
        [(objc_class *)v138 setupSpecifier:v84 forMediaGroups:v163];

        if (objc_opt_respondsToSelector())
        {
          v164 = [(STStorageDetailViewController *)v2 storageApp];
          v165 = [v164 usageBundle];
          id v211 = v84;
          [v137 usageBundleApp:v165 willDisplaySpecifier:&v211];
          id v166 = v211;

          v84 = v166;
        }
        v50 = v192;
        [*(id *)(&v2->_uiState + 1) viewDidLoad];
        [(STStorageAppDetailController *)v2 addChildViewController:*(void *)(&v2->_uiState + 1)];
        v167 = [*(id *)(&v2->_uiState + 1) specifiers];
        id v168 = [v167 mutableCopy];

        v186 = v168;
        if ([v168 count])
        {
          v169 = [v168 firstObject];
          v170 = [v169 propertyForKey:PSHeaderCellClassGroupKey];
          unsigned int v171 = [v170 isEqualToString:@"PSUsageSizeHeader"];

          if (v171) {
            [v168 removeObjectAtIndex:0];
          }
          v183 = v137;
          v184 = v136;
          if ([v197 isEqualToString:comAppleMusic] && objc_msgSend(v168, "count"))
          {
            uint64_t v187 = STLocalizedString(@"Music");
            int v172 = 1;
          }
          else
          {
            int v172 = 0;
            uint64_t v187 = 0;
          }
          int v185 = v172;
          long long v209 = 0u;
          long long v210 = 0u;
          long long v207 = 0u;
          long long v208 = 0u;
          id obja = v168;
          v173 = (char *)[obja countByEnumeratingWithState:&v207 objects:v229 count:16];
          if (v173)
          {
            v174 = v173;
            v90 = 0;
            uint64_t v175 = *(void *)v208;
            uint64_t v176 = 1000;
            do
            {
              for (k = 0; k != v174; ++k)
              {
                if (*(void *)v208 != v175) {
                  objc_enumerationMutation(obja);
                }
                v178 = *(void **)(*((void *)&v207 + 1) + 8 * (void)k);
                v179 = +[NSNumber numberWithLong:&k[v176]];
                [v178 setProperty:v179 forKey:@"_stUsageItemID"];

                [v4 addObject:v178];
              }
              v90 = &v174[(void)v90];
              v174 = (char *)[obja countByEnumeratingWithState:&v207 objects:v229 count:16];
              v176 += (uint64_t)k;
            }
            while (v174);
          }
          else
          {
            v90 = 0;
          }

          v53 = v191;
          v50 = v192;
          BOOL v104 = v185;
          v137 = v183;
          v136 = v184;
        }
        else
        {
          BOOL v104 = 0;
          v90 = 0;
          uint64_t v187 = 0;
          v53 = v191;
        }

        v85 = v202;
        v82 = (void *)v187;
      }
      else
      {
        unsigned int v147 = [v134 isDocumentApp];

        if (!v147)
        {
          v159 = *(void **)(&v2->_skipTimer + 4);
          if (v159)
          {
            if ([v159 count]) {
              [v4 addObjectsFromArray:*(void *)(&v2->_skipTimer + 4)];
            }
          }
          else
          {
            v181 = +[PSSpecifier emptyGroupSpecifier];
            [v4 addObject:v181];

            v182 = [(STStorageAppDetailController *)v2 spinnerSpecifier];
            [v4 addObject:v182];

            [(STStorageAppDetailController *)v2 updateHLSSpecs];
          }
          v82 = 0;
          v83 = v196;
          v84 = v196;
          v50 = v192;
          goto LABEL_78;
        }
        v148 = v53;
        v149 = [(STStorageDetailViewController *)v2 storageApp];
        v150 = [v149 documents];

        v151 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v150 count]);
        long long v203 = 0u;
        long long v204 = 0u;
        long long v205 = 0u;
        long long v206 = 0u;
        id v152 = v150;
        id v153 = [v152 countByEnumeratingWithState:&v203 objects:v228 count:16];
        v84 = v196;
        if (v153)
        {
          id v154 = v153;
          uint64_t v155 = *(void *)v204;
          v84 = v196;
          do
          {
            v156 = 0;
            v157 = v84;
            do
            {
              if (*(void *)v204 != v155) {
                objc_enumerationMutation(v152);
              }
              v84 = [(STStorageAppDetailController *)v2 specifierForDocument:*(void *)(*((void *)&v203 + 1) + 8 * (void)v156)];

              if (v84) {
                [v151 addObject:v84];
              }
              v156 = (char *)v156 + 1;
              v157 = v84;
            }
            while (v154 != v156);
            id v154 = [v152 countByEnumeratingWithState:&v203 objects:v228 count:16];
          }
          while (v154);
        }

        id v158 = [v151 count];
        BOOL v104 = v158 != 0;
        if (v158)
        {
          v90 = (char *)[v151 count];
          [v4 addObjectsFromArray:v151];
        }
        else
        {
          v90 = 0;
        }
        v50 = v192;
        v53 = v148;
        v85 = v202;
        uint64_t v180 = STLocalizedString(@"Documents");

        v82 = (void *)v180;
      }
LABEL_112:
      if (v90)
      {
        v2 = v199;
        v119 = *(PSUsageBundleDetailController **)((char *)&v199->_usageDetailController + 4);
        if (v119) {
          goto LABEL_117;
        }
        if (([v197 isEqualToString:@"com.apple.Health"] & 1) == 0)
        {
          uint64_t v120 = +[PSSpecifier preferenceSpecifierNamed:v82 target:0 set:0 get:0 detail:0 cell:0 edit:0];
          v121 = *(PSUsageBundleDetailController **)((char *)&v199->_usageDetailController + 4);
          *(PSUsageBundleDetailController **)((char *)&v199->_usageDetailController + 4) = (PSUsageBundleDetailController *)v120;
        }
        v119 = *(PSUsageBundleDetailController **)((char *)&v199->_usageDetailController + 4);
        if (v119)
        {
LABEL_117:
          if (v104)
          {
            [v119 setProperty:@"STStorageButtonHeader" forKey:PSHeaderCellClassGroupKey];
            v122 = *(PSUsageBundleDetailController **)((char *)&v199->_usageDetailController + 4);
            STLocalizedString(@"Edit");
            v124 = v123 = v53;
            [v122 setProperty:v124 forKey:@"stButtonTitle"];

            v53 = v123;
            v85 = v202;
            [*(id *)((char *)&v199->_usageDetailController + 4) setTarget:v199];
            [*(id *)((char *)&v199->_usageDetailController + 4) setButtonAction:"toggleEdit"];
            v119 = *(PSUsageBundleDetailController **)((char *)&v199->_usageDetailController + 4);
          }
          v23 = v197;
          [v4 insertObject:v119 atIndex:v188];
          goto LABEL_122;
        }
      }
      else
      {
        v2 = v199;
      }
      v23 = v197;
LABEL_122:
      v83 = v196;
      goto LABEL_123;
    }
    v106 = +[STMediaCache sharedCache];
    v107 = [(STStorageDetailViewController *)v2 storageApp];
    v108 = [v106 mediaSpecifiersForApp:v107];

    id v109 = [v108 count];
    BOOL v104 = v109 != 0;
    if (v109)
    {
      v85 = v202;
      if ((unint64_t)[v108 count] >= 2
        && [v23 isEqualToString:comApplePodcasts])
      {
        v110 = +[STMediaCache sharedCache];
        [(STStorageDetailViewController *)v2 storageApp];
        v112 = BOOL v111 = v104;
        id v113 = [v110 totalSizeForApp:v112];

        v114 = STLocalizedString(@"All Episodes");
        v115 = +[PSSpecifier preferenceSpecifierNamed:v114 target:v2 set:0 get:"valueForSpecifier:" detail:0 cell:4 edit:0];

        v116 = +[NSNumber numberWithLongLong:v113];
        [v115 setProperty:v116 forKey:PSValueKey];

        [v115 setProperty:v108 forKey:@"_stMediaSpecifiers"];
        [v4 addObject:v115];
        v117 = STLocalizedString(@"Shows");
        v118 = +[PSSpecifier groupSpecifierWithName:v117];
        [v4 addObject:v118];

        BOOL v104 = v111;
        v23 = v197;

        v85 = v202;
      }
      v90 = (char *)[v108 count];
      [v4 addObjectsFromArray:v108];
    }
    else
    {
      v90 = 0;
      v85 = v202;
    }
    if ([v23 isEqualToString:comApplePodcasts])
    {
      v82 = STLocalizedString(@"Podcasts");
      v142 = v196;
LABEL_165:

      v84 = v142;
      v50 = v192;
      goto LABEL_112;
    }
    if ([v23 isEqualToString:PSBundleIdentifieriBooks])
    {
      v143 = @"Books";
    }
    else
    {
      if (![v23 isEqualToString:PSBundleIdentifierTV])
      {
        v82 = 0;
        goto LABEL_164;
      }
      v143 = @"TV Shows";
    }
    v82 = STLocalizedString(v143);
LABEL_164:
    v142 = v196;
    goto LABEL_165;
  }
LABEL_124:

  return v3;
}

- (void)_syncUI:(id)a3
{
  id v4 = [(STStorageDetailViewController *)self storageApp];
  -[STStorageAppDetailController setUIState:](self, "setUIState:", [v4 state]);
}

- (void)syncUI
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A6A4;
  block[3] = &unk_962A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)reloadSpecs:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"APPS"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([(STStorageDetailViewController *)self storageApp],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 bundleIdentifier],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v5 containsObject:v7],
        v7,
        v6,
        v8))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A810;
    block[3] = &unk_962A8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)syncUIState:(id)a3
{
  id v4 = a3;
  id v5 = [(STStorageDetailViewController *)self storageApp];
  uint64_t v6 = [v5 appRecord];
  uint64_t v7 = [v6 bundleIdentifier];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "bundleIdentifier", (void)v16);
        unsigned int v14 = [v13 isEqualToString:v7];

        if (v14)
        {
          unsigned int v15 = [(STStorageDetailViewController *)self storageApp];
          [v15 refreshAppState];

          [(STStorageAppDetailController *)self syncUI];
          goto LABEL_11;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
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
        id v10 = objc_msgSend(v9, "propertyForKey:", @"stCacheAsset", v11, v12, v13, v14, v15, v16);
        if (v10)
        {
          uint64_t v11 = _NSConcreteStackBlock;
          uint64_t v12 = 3221225472;
          id v13 = sub_AB28;
          unsigned int v14 = &unk_963A8;
          unsigned int v15 = self;
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
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v11 propertyForKey:v9];
        if (v12)
        {
          id v13 = dispatch_get_global_queue(25, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_AE00;
          block[3] = &unk_964F8;
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
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v11 propertyForKey:@"stMediaCollection"];
        id v13 = v12;
        if (v12)
        {
          unsigned int v14 = [v12 items];
          if ([v14 count]) {
            [v5 addObjectsFromArray:v14];
          }
        }
        else
        {
          unsigned int v14 = [v11 propertyForKey:@"stMediaItem"];
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
    unsigned int v15 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_B110;
    block[3] = &unk_96520;
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
    id v7 = [*(id *)(&self->_uiState + 1) indexPathForSpecifier:v4];
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STStorageAppDetailController *)self specifierAtIndexPath:v7];
  uint64_t v9 = [(STStorageAppDetailController *)self usageIndexPathForSpecifier:v8];
  if (!v9) {
    goto LABEL_3;
  }
  id v10 = [(STStorageDetailViewController *)self storageApp];
  uint64_t v11 = [v10 usageBundle];
  uint64_t v12 = [v11 bundleIdentifier];
  unsigned __int8 v13 = [v12 isEqualToString:@"com.apple.mobilesafari"];

  if ((v13 & 1) == 0)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(&self->_uiState + 1) tableView:v6 didSelectRowAtIndexPath:v9];
    }
  }
  else
  {
LABEL_3:
    v14.receiver = self;
    v14.super_class = (Class)STStorageAppDetailController;
    [(STStorageAppDetailController *)&v14 tableView:v6 didSelectRowAtIndexPath:v7];
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
      [*(id *)(&self->_uiState + 1) tableView:v6 didDeselectRowAtIndexPath:v9];
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
  if (!*(void *)(&self->_uiState + 1))
  {
    uint64_t v11 = [v5 propertyForKey:@"stCacheAsset"];
    if (v11
      || ([v6 propertyForKey:STStorageItemURLKey],
          (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([v6 propertyForKey:UsageMediaKindKey],
          (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      unsigned __int8 v13 = [v6 propertyForKey:@"_stMediaSpecifiers"];

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
  id v8 = *(void **)(&self->_uiState + 1);
  uint64_t v9 = [v8 table];
  unsigned __int8 v10 = [v8 tableView:v9 canEditRowAtIndexPath:v7];

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
  uint64_t v8 = *(void *)(&self->_uiState + 1);
  uint64_t v9 = [(STStorageAppDetailController *)self specifierAtIndexPath:v7];
  unsigned __int8 v10 = v9;
  if (!v8)
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
  uint64_t v11 = [(STStorageAppDetailController *)self usageIndexPathForSpecifier:v9];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v12 = *(void **)(&self->_uiState + 1);
  unsigned __int8 v13 = [v12 table];
  if (v11) {
    id v14 = v11;
  }
  else {
    id v14 = v7;
  }
  id v15 = [v12 tableView:v13 editingStyleForRowAtIndexPath:v14];

LABEL_11:
  return (int64_t)v15;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  if ((+[UIApplication isRunningInStoreDemoMode] & 1) == 0)
  {
    uint64_t v8 = [(STStorageAppDetailController *)self specifierAtIndexPath:v7];
    uint64_t v9 = v8;
    if (*(void *)(&self->_uiState + 1))
    {
      unsigned __int8 v10 = [(STStorageAppDetailController *)self usageIndexPathForSpecifier:v8];
      if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v11 = *(void **)(&self->_uiState + 1);
        uint64_t v12 = [v11 table];
        [v11 tableView:v12 commitEditingStyle:a4 forRowAtIndexPath:v10];

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_BA78;
        v18[3] = &unk_962D0;
        v18[4] = self;
        id v19 = v9;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
      }
      goto LABEL_16;
    }
    if (a4 == 1)
    {
      unsigned __int8 v13 = [v8 propertyForKey:@"stCacheAsset"];

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
  v2 = [*(id *)((char *)&self->_usageDetailController + 4) propertyForKey:PSHeaderViewKey];
  id v3 = [v2 headerButton];

  return v3;
}

- (void)setEditable:(BOOL)a3
{
  uint64_t v3 = OBJC_IVAR___PSEditableListController__editable;
  if (self->super.PSEditableListController_opaque[OBJC_IVAR___PSEditableListController__editable] != a3)
  {
    self->super.PSEditableListController_opaque[OBJC_IVAR___PSEditableListController__editable] = a3;
    id v7 = [*(id *)((char *)&self->_usageDetailController + 4) propertyForKey:PSHeaderViewKey];
    id v5 = STLocalizedString(@"Edit");
    if (self->super.PSEditableListController_opaque[v3])
    {
      uint64_t v6 = STLocalizedString(@"Done");

      id v5 = (void *)v6;
    }
    [v7 setHeaderButtonTitle:v5];
    [*(id *)&self->super.PSEditableListController_opaque[OBJC_IVAR___PSListController__table] setEditing:self->super.PSEditableListController_opaque[v3] animated:1];
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
  [(STStorageAppDetailController *)self setEditable:self->super.PSEditableListController_opaque[OBJC_IVAR___PSEditableListController__editable] == 0];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->_skipTimer + 4), 0);
  objc_storeStrong((id *)((char *)&self->_quotaTip + 4), 0);
  objc_storeStrong((id *)((char *)&self->_unsyncTip + 4), 0);
  objc_storeStrong((id *)((char *)&self->_pinnedTip + 4), 0);
  objc_storeStrong((id *)((char *)&self->_dataSize + 4), 0);
  objc_storeStrong((id *)((char *)&self->_dataSizeSpec + 4), 0);
  objc_storeStrong((id *)((char *)&self->_appSizeSpec + 4), 0);
  objc_storeStrong((id *)((char *)&self->_docsGroup + 4), 0);
  objc_storeStrong((id *)((char *)&self->_usageDetailController + 4), 0);

  objc_storeStrong((id *)(&self->_uiState + 1), 0);
}

@end