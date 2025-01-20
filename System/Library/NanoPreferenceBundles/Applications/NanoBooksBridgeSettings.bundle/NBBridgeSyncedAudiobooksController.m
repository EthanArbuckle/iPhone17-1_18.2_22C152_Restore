@interface NBBridgeSyncedAudiobooksController
+ (id)_addAudiobookImage;
- (BOOL)_hasPinnedAudiobooks;
- (BOOL)_hasPurchasedAudiobooks;
- (BOOL)_shouldShowProgress;
- (BOOL)allowsExplicitAudiobooks;
- (BOOL)hasCloudAccount;
- (BOOL)hasStoreAccount;
- (BOOL)isOutOfSpace;
- (BOOL)isRefreshingFamily;
- (BOOL)isStoreAvailable;
- (BOOL)needsVisibleSpecifiersSyncInfoUpdate;
- (BOOL)selectAudiobookAdamIdAlreadyPinned:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NBBridgeSyncedAudiobooksController)init;
- (NMBUIAlertHeaderView)alertHeaderView;
- (NMBUISyncInfoController)syncInfoController;
- (NMSMediaPinningManager)pinningManager;
- (NMSSyncManager)syncManager;
- (NSArray)audiobookSpecifiers;
- (NSArray)familyDSIDs;
- (NSArray)manuallyPinnedAudiobookIdentifiers;
- (NSArray)recommendationSpecifiers;
- (PSSpecifier)addAudiobookSpecifier;
- (PSSpecifier)audiobookStoreSpecifier;
- (PSSpecifier)libraryGroupSpecifier;
- (PSSpecifier)signInSpecifier;
- (float)_contentHeaderViewProgress;
- (id)_contentHeaderViewSubtitle;
- (id)_contentHeaderViewTitle;
- (id)_pinnedAudiobooks;
- (id)_recommendationSelected:(id)a3;
- (id)_recommendationsGroup;
- (id)_selfOrPresentedViewController;
- (id)_specifierWithItem:(id)a3 showDownloadInfo:(BOOL)a4 showWarningIfAboveQuota:(BOOL)a5 downloadLimit:(unint64_t)a6;
- (id)_specifierWithJaliscoItem:(id)a3 showDownloadInfo:(BOOL)a4 showWarningIfAboveQuota:(BOOL)a5 downloadLimit:(unint64_t)a6;
- (id)_specifierWithTitle:(id)a3 subtitle:(id)a4 artworkCatalog:(id)a5 showSwitch:(BOOL)a6 set:(SEL)a7 get:(SEL)a8;
- (id)_suggestionSpecifierWithRecommendation:(id)a3;
- (id)specifiers;
- (id)syncInfoController:(id)a3 containerIdentifierForModelObject:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (unint64_t)_resolvedProgressViewStateForState:(unint64_t)a3;
- (void)_addAudiobookAction;
- (void)_configureHeaderIfNeeded;
- (void)_dismissAudiobookPicker;
- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3;
- (void)_handleApplicationWillEnterForegroundNotification:(id)a3;
- (void)_handleAudiobookPinningSelectionsDidChangeNotification:(id)a3;
- (void)_handleSyncInfoDidUpdateNotification:(id)a3;
- (void)_handleSyncManagerSyncStateDidChangeNotification:(id)a3;
- (void)_iCloudSignInAction:(id)a3;
- (void)_iTunesSignInAction:(id)a3;
- (void)_pinningAudiobooksContentsInvalidated:(id)a3;
- (void)_refreshFamilyOwnedAudiobooks;
- (void)_reloadContents;
- (void)_requestAudiobooks;
- (void)_requestRecommendations;
- (void)_restrictionsDidChange:(id)a3;
- (void)_setRecommendationSelected:(id)a3 withSpecifier:(id)a4;
- (void)_showAudiobookStore:(id)a3;
- (void)_showReadingNowWantToRead:(id)a3;
- (void)_showSyncStorageWarning;
- (void)_updateFamilyCircle:(id)a3;
- (void)_updateFooterIfNeeded;
- (void)_updateHeaderAndSyncProgressIfNeeded;
- (void)_updateHeaderSize;
- (void)_updateProgressIfNeeded;
- (void)dealloc;
- (void)familyCircleDataSource:(id)a3 didFetchFamilyCircle:(id)a4;
- (void)selectAudiobookDidSelectAudiobookWithAdamId:(id)a3;
- (void)setAddAudiobookSpecifier:(id)a3;
- (void)setAlertHeaderView:(id)a3;
- (void)setAllowsExplicitAudiobooks:(BOOL)a3;
- (void)setAudiobookSpecifiers:(id)a3;
- (void)setAudiobookStoreSpecifier:(id)a3;
- (void)setCloudAccount:(BOOL)a3;
- (void)setFamilyDSIDs:(id)a3;
- (void)setLibraryGroupSpecifier:(id)a3;
- (void)setManuallyPinnedAudiobookIdentifiers:(id)a3;
- (void)setNeedsVisibleSpecifiersSyncInfoUpdate:(BOOL)a3;
- (void)setPinningManager:(id)a3;
- (void)setRecommendationSpecifiers:(id)a3;
- (void)setRefreshingFamily:(BOOL)a3;
- (void)setSignInSpecifier:(id)a3;
- (void)setStoreAccount:(BOOL)a3;
- (void)setStoreAvailable:(BOOL)a3;
- (void)setSyncInfoController:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NBBridgeSyncedAudiobooksController

- (NBBridgeSyncedAudiobooksController)init
{
  v22.receiver = self;
  v22.super_class = (Class)NBBridgeSyncedAudiobooksController;
  v2 = [(NBBridgeSyncedAudiobooksController *)&v22 init];
  if (v2)
  {
    uint64_t v3 = +[NMSMediaPinningManager sharedManager];
    pinningManager = v2->_pinningManager;
    v2->_pinningManager = (NMSMediaPinningManager *)v3;

    uint64_t v5 = +[NMSSyncManager sharedManager];
    syncManager = v2->_syncManager;
    v2->_syncManager = (NMSSyncManager *)v5;

    v7 = +[NSUserDefaults standardUserDefaults];
    v2->_storeAvailable = [v7 BOOLForKey:@"NBAudiobookStoreDisabled"] ^ 1;

    familyDSIDs = v2->_familyDSIDs;
    v2->_familyDSIDs = (NSArray *)&__NSArray0__struct;

    v2->_refreshingFamily = 0;
    v9 = [(NBBridgeSyncedAudiobooksController *)v2 pinningManager];
    [v9 setAudiobookDownloadLimit:18000.0];

    +[MPMediaQuery setFilteringDisabled:1];
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_requestRecommendations" name:@"NBAudiobookRecommendationsDidUpdateNotification" object:0];
    [v10 addObserver:v2 selector:"_restrictionsDidChange:" name:NSUserDefaultsDidChangeNotification object:0];
    [v10 addObserver:v2 selector:"_pinningAudiobooksContentsInvalidated:" name:NMSMediaPinningManagerAudiobooksIdentifiersDidChangeNotification object:0];
    [v10 addObserver:v2 selector:"reloadSpecifiers" name:MPMediaLibraryDidChangeNotification object:0];
    [v10 addObserver:v2 selector:"_handleMediaLibraryChange:" name:MPMediaLibraryDidChangeNotification object:0];
    [v10 addObserver:v2 selector:"_handleAudiobookPinningSelectionsDidChangeNotification:" name:NMSyncDefaultsAudiobooksPinningSelectionsDidChangeNotification object:0];
    [v10 addObserver:v2 selector:"_handleSyncManagerSyncStateDidChangeNotification:" name:NMSSyncManagerSyncStateDidChangeNotification object:0];
    v11 = +[NRPairedDeviceRegistry sharedInstance];
    v12 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v13 = [v11 getAllDevicesWithArchivedAltAccountDevicesMatching:v12];
    v14 = [v13 firstObject];
    id v15 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
    unsigned int v16 = [v14 supportsCapability:v15];

    if (v16)
    {
      [v10 addObserver:v2 selector:"_handleSyncInfoDidUpdateNotification:" name:NMBUIMediaSyncInfoDidUpdateNotification object:0];
      [v10 addObserver:v2 selector:"_handleApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
      [v10 addObserver:v2 selector:"_handleApplicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
    }
    v2->_allowsExplicitAudiobooks = +[NBBridgeUtilities isExplicitMaterialAllowed];
    uint64_t v17 = BUBooksGroupContainerIdentifier;
    v18 = +[LSBundleProxy bundleProxyForIdentifier:@"com.apple.iBooks"];
    v19 = [v18 dataContainerURL];
    v20 = +[NSURL bu_booksGroupContainerURL];
    +[BDSUserPreferencesSync copyChangedLocalPreferencesToGroupContainerWithAppSuiteName:@"com.apple.iBooks" container:v19 groupName:v17 groupContainer:v20];
    [v10 addObserver:v2 selector:"_handleStoreAccountDidChange:" name:NMBUIITunesAccountDidChangeNotification object:0];
    [v10 addObserver:v2 selector:"_iCloudAccountAvailabilityChangedNotification:" name:NSUbiquityIdentityDidChangeNotification object:0];
    [(NBBridgeSyncedAudiobooksController *)v2 _refreshFamilyOwnedAudiobooks];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NBFamilyCircleDataSource sharedInstance];
  [v3 removeObserver:self];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NBBridgeSyncedAudiobooksController;
  [(NBBridgeSyncedAudiobooksController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)NBBridgeSyncedAudiobooksController;
  [(NBBridgeSyncedAudiobooksController *)&v9 viewDidLoad];
  [(NBBridgeSyncedAudiobooksController *)self _configureHeaderIfNeeded];
  uint64_t v3 = [(NBBridgeSyncedAudiobooksController *)self table];
  [v3 setAllowsSelectionDuringEditing:1];

  v4 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
  objc_super v5 = [v4 pinnedAudiobooks];
  -[NBBridgeSyncedAudiobooksController setEditingButtonHidden:animated:](self, "setEditingButtonHidden:animated:", [v5 count] == 0, 0);

  [(NBBridgeSyncedAudiobooksController *)self _reloadContents];
  v6 = +[NBAudiobookRecommendationManager sharedManager];
  v7 = [v6 pinningManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9C24;
  v8[3] = &unk_20AB0;
  v8[4] = self;
  [v7 audiobookStoreEnabledWithCompletion:v8];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NBBridgeSyncedAudiobooksController;
  [(NBBridgeSyncedAudiobooksController *)&v3 viewDidLayoutSubviews];
  [(NBBridgeSyncedAudiobooksController *)self _updateHeaderSize];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NBBridgeSyncedAudiobooksController;
  [(NBBridgeSyncedAudiobooksController *)&v7 viewDidAppear:a3];
  v4 = NBDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_13680();
  }

  objc_super v5 = [(NBBridgeSyncedAudiobooksController *)self syncManager];
  [v5 beginReceivingSyncProgressUpdates];

  v6 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
  [v6 beginObservingSyncInfo];

  if (self->_needsVisibleSpecifiersSyncInfoUpdate) {
    [(NBBridgeSyncedAudiobooksController *)self _updateHeaderAndSyncProgressIfNeeded];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NBBridgeSyncedAudiobooksController;
  [(NBBridgeSyncedAudiobooksController *)&v6 viewDidDisappear:a3];
  v4 = NBDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_136B4();
  }

  objc_super v5 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
  [v5 endObservingSyncInfo];
}

- (NMBUISyncInfoController)syncInfoController
{
  syncInfoController = self->_syncInfoController;
  if (!syncInfoController)
  {
    id v4 = [objc_alloc((Class)NMBUISyncInfoController) initWithSyncInfoTarget:2];
    [v4 setDataSource:self];
    objc_super v5 = self->_syncInfoController;
    self->_syncInfoController = (NMBUISyncInfoController *)v4;

    syncInfoController = self->_syncInfoController;
  }

  return syncInfoController;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = +[NSMutableArray array];
    if (![(NBBridgeSyncedAudiobooksController *)self isStoreAvailable])
    {
      objc_super v9 = NBDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Store is disabled.", v23, 2u);
      }
      goto LABEL_19;
    }
    if ([(NBBridgeSyncedAudiobooksController *)self hasStoreAccount])
    {
      if ([(NBBridgeSyncedAudiobooksController *)self _hasPurchasedAudiobooks])
      {
        objc_super v6 = [(NBBridgeSyncedAudiobooksController *)self _recommendationsGroup];
        [v5 addObjectsFromArray:v6];

        objc_super v7 = [(NBBridgeSyncedAudiobooksController *)self libraryGroupSpecifier];
        [v5 addObject:v7];

        v8 = [(NBBridgeSyncedAudiobooksController *)self addAudiobookSpecifier];
        [v5 addObject:v8];

        objc_super v9 = [(NBBridgeSyncedAudiobooksController *)self audiobookSpecifiers];
        [v5 addObjectsFromArray:v9];
LABEL_19:

LABEL_20:
        id v20 = [v5 copy];
        v21 = *(void **)&self->PSEditableListController_opaque[v3];
        *(void *)&self->PSEditableListController_opaque[v3] = v20;

        id v4 = *(void **)&self->PSEditableListController_opaque[v3];
        goto LABEL_21;
      }
      v18 = NBDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "No purchased audiobooks.", v23, 2u);
      }

      if ([(NBBridgeSyncedAudiobooksController *)self isRefreshingFamily]) {
        goto LABEL_20;
      }
      objc_super v9 = +[PSSpecifier groupSpecifierWithID:@"NBNoStoreBooksGroupSpecifierID" name:0];
      v25[0] = v9;
      unsigned int v16 = [(NBBridgeSyncedAudiobooksController *)self audiobookStoreSpecifier];
      v25[1] = v16;
      uint64_t v17 = v25;
    }
    else
    {
      v10 = NBDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "No known store account.", v23, 2u);
      }

      objc_super v9 = +[PSSpecifier groupSpecifierWithID:@"NBSignIntoITunesGroupSpecifierID" name:0];
      int v11 = _os_feature_enabled_impl();
      v12 = NBBundle();
      v13 = v12;
      if (v11) {
        CFStringRef v14 = @"You must sign in to Apple Books with your Apple Account to use Audiobooks on Apple\\U00A0Watch.";
      }
      else {
        CFStringRef v14 = @"You must sign in to Apple Books with your Apple ID to use Audiobooks on Apple\\U00A0Watch.";
      }
      id v15 = [v12 localizedStringForKey:v14 value:&stru_20DD8 table:&stru_20DD8];
      [v9 setProperty:v15 forKey:PSFooterTextGroupKey];

      v24[0] = v9;
      unsigned int v16 = [(NBBridgeSyncedAudiobooksController *)self signInSpecifier];
      v24[1] = v16;
      uint64_t v17 = v24;
    }
    v19 = +[NSArray arrayWithObjects:v17 count:2];
    [v5 addObjectsFromArray:v19];

    goto LABEL_19;
  }
LABEL_21:

  return v4;
}

- (void)_refreshFamilyOwnedAudiobooks
{
  [(NBBridgeSyncedAudiobooksController *)self setRefreshingFamily:1];
  id v3 = +[NBFamilyCircleDataSource sharedInstance];
  [v3 addObserver:self];
  [v3 refresh];
}

- (void)_updateFamilyCircle:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (([v9 isCurrentSignedInUser] & 1) == 0)
        {
          v10 = [v9 iTunesDSID];
          BOOL v11 = v10 == 0;

          if (!v11)
          {
            v12 = [v9 iTunesDSID];
            [v4 addObject:v12];
          }
          v13 = [v9 iCloudDSID];
          if (v13)
          {
            CFStringRef v14 = [v9 iTunesDSID];
            id v15 = [v9 iCloudDSID];
            unsigned int v16 = [v14 isEqualToNumber:v15];

            if (v16)
            {
              uint64_t v17 = [v9 iCloudDSID];
              [v4 addObject:v17];
            }
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  [(NBBridgeSyncedAudiobooksController *)self setFamilyDSIDs:v4];
  v18 = [(NBBridgeSyncedAudiobooksController *)self familyDSIDs];
  BOOL v19 = [v18 count] == 0;

  if (v19)
  {
    [(NBBridgeSyncedAudiobooksController *)self setRefreshingFamily:0];
    v21 = +[NBAudiobookRecommendationManager sharedManager];
    [v21 updatePinningManager];

    [(NBBridgeSyncedAudiobooksController *)self _updateFooterIfNeeded];
    [(NBBridgeSyncedAudiobooksController *)self reloadSpecifiers];
  }
  else
  {
    objc_initWeak(&location, self);
    id v20 = +[BDSJaliscoDAAPClient sharedClient];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_A600;
    v23[3] = &unk_206F0;
    objc_copyWeak(&v24, &location);
    [v20 updateFamilyPolitely:1 reason:6 completion:v23];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_hasPurchasedAudiobooks
{
  id v3 = +[MPMediaQuery nb_storeOnlyAudiobooksQuery];
  id v4 = [v3 collections];
  id v5 = [v4 count];

  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [(NBBridgeSyncedAudiobooksController *)self familyDSIDs];
    id v8 = [v7 count];

    if (v8)
    {
      objc_super v9 = +[BLJaliscoReadOnlyDAAPClient sharedClient];
      v10 = [(NBBridgeSyncedAudiobooksController *)self familyDSIDs];
      BOOL v11 = [v9 fetchAllServerItemsForDSIDs:v10];
      char v6 = [v11 count] != 0;
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)_recommendationsGroup
{
  id v3 = +[NSMutableArray array];
  id v4 = +[PSSpecifier groupSpecifierWithID:@"AUDIOBOOK_RECOMMENDATIONS"];
  if ([(NBBridgeSyncedAudiobooksController *)self hasCloudAccount])
  {
    id v5 = NBBundle();
    char v6 = [v5 localizedStringForKey:@"Fill available space on your Apple\\U00A0Watch with audiobooks from %@ list." value:&stru_20DD8 table:&stru_20DD8];

    uint64_t v7 = NBBundle();
    id v8 = [v7 localizedStringForKey:@"Continue and your Want to Read" value:&stru_20DD8 table:&stru_20DD8];

    uint64_t v9 = PSFooterHyperlinkViewActionKey;
    CFStringRef v10 = @"_showReadingNowWantToRead:";
  }
  else
  {
    BOOL v11 = NBDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "No known cloud account.", buf, 2u);
    }

    v12 = NBBundle();
    char v6 = [v12 localizedStringForKey:@"To enable automatic download of audiobooks from Continue and Want to Read, %@.", &stru_20DD8, &stru_20DD8 value table];

    v13 = NBBundle();
    id v8 = [v13 localizedStringForKey:@"sign in to iCloud" value:&stru_20DD8 table:&stru_20DD8];

    [v4 setProperty:@"_iCloudSignInAction:" forKey:PSFooterHyperlinkViewActionKey];
    uint64_t v9 = PSEnabledKey;
    CFStringRef v10 = (const __CFString *)&__kCFBooleanFalse;
  }
  [v4 setProperty:v10 forKey:v9];
  CFStringRef v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);
  [v4 setProperty:v14 forKey:PSFooterTextGroupKey];
  id v15 = (objc_class *)objc_opt_class();
  unsigned int v16 = NSStringFromClass(v15);
  [v4 setProperty:v16 forKey:PSFooterCellClassGroupKey];

  v23.id location = (NSUInteger)[v14 rangeOfString:v8];
  uint64_t v17 = NSStringFromRange(v23);
  [v4 setProperty:v17 forKey:PSFooterHyperlinkViewLinkRangeKey];

  v18 = +[NSValue valueWithNonretainedObject:self];
  [v4 setProperty:v18 forKey:PSFooterHyperlinkViewTargetKey];

  [v3 addObject:v4];
  BOOL v19 = [(NBBridgeSyncedAudiobooksController *)self recommendationSpecifiers];
  [v3 addObjectsFromArray:v19];

  return v3;
}

- (PSSpecifier)addAudiobookSpecifier
{
  addAudiobookSpecifier = self->_addAudiobookSpecifier;
  if (!addAudiobookSpecifier)
  {
    id v4 = NBBundle();
    id v5 = [v4 localizedStringForKey:@"Add Audiobook\\U2026" value:&stru_20DD8 table:&stru_20DD8];
    char v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];
    uint64_t v7 = self->_addAudiobookSpecifier;
    self->_addAudiobookSpecifier = v6;

    [(PSSpecifier *)self->_addAudiobookSpecifier setButtonAction:"_addAudiobookAction"];
    [(PSSpecifier *)self->_addAudiobookSpecifier setProperty:objc_opt_class() forKey:PSCellClassKey];
    id v8 = self->_addAudiobookSpecifier;
    uint64_t v9 = NBBundle();
    CFStringRef v10 = [v9 localizedStringForKey:@"Add Audiobook\\U2026" value:&stru_20DD8 table:&stru_20DD8];
    [(PSSpecifier *)v8 setProperty:v10 forKey:NMBUISpecifierTitleKey];

    BOOL v11 = self->_addAudiobookSpecifier;
    v12 = [(id)objc_opt_class() _addAudiobookImage];
    [(PSSpecifier *)v11 setProperty:v12 forKey:NMBUISpecifierPlaceholderImageKey];

    [(PSSpecifier *)self->_addAudiobookSpecifier setProperty:&__kCFBooleanFalse forKey:NMBUISpecifierShouldShowSwitchKey];
    addAudiobookSpecifier = self->_addAudiobookSpecifier;
  }

  return addAudiobookSpecifier;
}

- (void)_addAudiobookAction
{
  id v3 = objc_alloc_init(NBSelectAudiobookController);
  [(NBSelectAudiobookController *)v3 setDelegate:self];
  [(NBBridgeSyncedAudiobooksController *)self presentViewController:v3 animated:1 completion:0];
}

- (PSSpecifier)libraryGroupSpecifier
{
  libraryGroupSpecifier = self->_libraryGroupSpecifier;
  if (!libraryGroupSpecifier)
  {
    id v4 = NBBundle();
    id v5 = [v4 localizedStringForKey:@"FROM LIBRARY" value:&stru_20DD8 table:&stru_20DD8];
    char v6 = +[PSSpecifier groupSpecifierWithName:v5];
    uint64_t v7 = self->_libraryGroupSpecifier;
    self->_libraryGroupSpecifier = v6;

    id v8 = NBBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"5 hours from each audiobook you add will be downloaded to your Apple\\U00A0Watch as long as there\\U2019s available space.\n\nFind more to listen to in the %@." value:&stru_20DD8 table:&stru_20DD8];

    CFStringRef v10 = NBBundle();
    BOOL v11 = [v10 localizedStringForKey:@"Library_Group_Footer_Audiobook_Store" value:@"Audiobook Store" table:&stru_20DD8];

    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v11);
    id v13 = [v12 rangeOfString:v11];
    NSUInteger v15 = v14;
    [(PSSpecifier *)self->_libraryGroupSpecifier setProperty:v12 forKey:PSFooterTextGroupKey];
    unsigned int v16 = self->_libraryGroupSpecifier;
    uint64_t v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [(PSSpecifier *)v16 setProperty:v18 forKey:PSFooterCellClassGroupKey];

    BOOL v19 = self->_libraryGroupSpecifier;
    v25.id location = (NSUInteger)v13;
    v25.length = v15;
    id v20 = NSStringFromRange(v25);
    [(PSSpecifier *)v19 setProperty:v20 forKey:PSFooterHyperlinkViewLinkRangeKey];

    [(PSSpecifier *)self->_libraryGroupSpecifier setProperty:@"_showAudiobookStore:" forKey:PSFooterHyperlinkViewActionKey];
    v21 = self->_libraryGroupSpecifier;
    objc_super v22 = +[NSValue valueWithNonretainedObject:self];
    [(PSSpecifier *)v21 setProperty:v22 forKey:PSFooterHyperlinkViewTargetKey];

    libraryGroupSpecifier = self->_libraryGroupSpecifier;
  }

  return libraryGroupSpecifier;
}

- (id)_pinnedAudiobooks
{
  id v3 = +[NSMutableSet set];
  id v4 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
  id v5 = [v4 pinnedAudiobooks];
  char v6 = [v5 array];
  [v3 addObjectsFromArray:v6];

  uint64_t v7 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
  LODWORD(v5) = [v7 isWantToReadEnabled];

  if (v5)
  {
    id v8 = NBDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Want to read is enabled.", buf, 2u);
    }

    uint64_t v9 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
    CFStringRef v10 = [v9 wantToReadAudiobooks];
    BOOL v11 = [v10 array];
    [v3 addObjectsFromArray:v11];
  }
  v12 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
  unsigned int v13 = [v12 isReadingNowEnabled];

  if (v13)
  {
    NSUInteger v14 = NBDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v19 = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Reading now is enabled.", v19, 2u);
    }

    NSUInteger v15 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
    unsigned int v16 = [v15 readingNowAudiobooks];
    uint64_t v17 = [v16 array];
    [v3 addObjectsFromArray:v17];
  }

  return v3;
}

- (BOOL)_hasPinnedAudiobooks
{
  id v5 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
  char v6 = [v5 pinnedAudiobooks];
  if (![v6 count])
  {
    id v8 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
    unsigned int v9 = [v8 isWantToReadEnabled];
    if (v9
      && ([(NBBridgeSyncedAudiobooksController *)self pinningManager],
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 wantToReadAudiobooks],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v3 count]))
    {
      char v7 = 1;
    }
    else
    {
      CFStringRef v10 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
      if ([v10 isReadingNowEnabled])
      {
        BOOL v11 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
        v12 = [v11 readingNowAudiobooks];
        char v7 = [v12 count] != 0;

        if ((v9 & 1) == 0) {
          goto LABEL_11;
        }
      }
      else
      {

        char v7 = 0;
        if (!v9)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
    }

    goto LABEL_11;
  }
  char v7 = 1;
LABEL_12:

  return v7;
}

- (void)_reloadContents
{
  unsigned int v3 = [(NBBridgeSyncedAudiobooksController *)self hasStoreAccount];
  unsigned int v4 = [(NBBridgeSyncedAudiobooksController *)self hasCloudAccount];
  id v5 = +[NMBUIAccountUtil sharedInstance];
  -[NBBridgeSyncedAudiobooksController setStoreAccount:](self, "setStoreAccount:", [v5 hasITunesAccount]);

  char v6 = +[BUAccountsProvider sharedProvider];
  -[NBBridgeSyncedAudiobooksController setCloudAccount:](self, "setCloudAccount:", [v6 isUserSignedInToiCloud]);

  if (v3 != [(NBBridgeSyncedAudiobooksController *)self hasStoreAccount]
    || v4 != [(NBBridgeSyncedAudiobooksController *)self hasCloudAccount])
  {
    [(NBBridgeSyncedAudiobooksController *)self reloadSpecifiers];
  }
  [(NBBridgeSyncedAudiobooksController *)self _requestRecommendations];
  [(NBBridgeSyncedAudiobooksController *)self _requestAudiobooks];
  [(NBBridgeSyncedAudiobooksController *)self _updateHeaderAndSyncProgressIfNeeded];
  [(NBBridgeSyncedAudiobooksController *)self _updateFooterIfNeeded];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B36C;
  block[3] = &unk_20A28;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (id)_addAudiobookImage
{
  v2 = NBBundle();
  unsigned int v3 = +[UIImage imageNamed:@"AddAudiobook" inBundle:v2];
  unsigned int v4 = [v3 imageWithRenderingMode:2];

  +[NMBUIMediaTableCell artworkSize];
  UIGraphicsBeginImageContextWithOptions(v18, 1, 0.0);
  id v5 = +[NBBridgeUtilities addAudiobookBackgroundColor];
  [v5 set];

  +[NMBUIMediaTableCell artworkSize];
  CGFloat v7 = v6;
  +[NMBUIMediaTableCell artworkSize];
  v19.size.height = v8;
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v7;
  UIRectFill(v19);
  unsigned int v9 = BPSBridgeTintColor();
  [v9 set];

  +[NBBridgeUtilities addAudiobookIconSize];
  double v11 = v10;
  double v13 = v12;
  +[NMBUIMediaTableCell artworkSize];
  objc_msgSend(v4, "drawInRect:", (v14 - v11) * 0.5, (v14 - v11) * 0.5, v11, v13);
  NSUInteger v15 = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();

  return v15;
}

- (id)_suggestionSpecifierWithRecommendation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 title];
  double v6 = [v4 subtitle];
  CGFloat v7 = [v4 artworkCatalog];
  CGFloat v8 = [(NBBridgeSyncedAudiobooksController *)self _specifierWithTitle:v5 subtitle:v6 artworkCatalog:v7 showSwitch:1 set:"_setRecommendationSelected:withSpecifier:" get:"_recommendationSelected:"];

  [v8 setProperty:v4 forKey:NMBUISpecifierModelObjectKey];
  unsigned int v9 = +[NSNumber numberWithBool:[(NBBridgeSyncedAudiobooksController *)self hasCloudAccount]];
  [v8 setProperty:v9 forKey:PSEnabledKey];

  return v8;
}

- (void)_requestAudiobooks
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[NSMutableArray array];
  id v5 = +[NRPairedDeviceRegistry sharedInstance];
  double v6 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  CGFloat v7 = [v5 getAllDevicesWithArchivedAltAccountDevicesMatching:v6];
  CGFloat v8 = [v7 firstObject];
  id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  unsigned __int8 v10 = [v8 supportsCapability:v9];

  double v11 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
  [v11 audiobookDownloadLimit];
  uint64_t v13 = v12;

  double v14 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
  NSUInteger v15 = [v14 pinnedAudiobooks];
  unsigned int v16 = [v15 array];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_B868;
  v21[3] = &unk_20AD8;
  unsigned __int8 v25 = v10;
  char v26 = v10 ^ 1;
  uint64_t v24 = v13;
  v21[4] = self;
  id v22 = v3;
  id v23 = v4;
  id v17 = v4;
  id v18 = v3;
  [v16 enumerateAdamIDsUsingBlock:v21];
  id v19 = [v18 copy];
  [(NBBridgeSyncedAudiobooksController *)self setAudiobookSpecifiers:v19];

  id v20 = [v17 copy];
  [(NBBridgeSyncedAudiobooksController *)self setManuallyPinnedAudiobookIdentifiers:v20];

  [(NBBridgeSyncedAudiobooksController *)self reloadSpecifiers];
}

- (void)_requestRecommendations
{
  objc_initWeak(&location, self);
  v2 = +[NBAudiobookRecommendationManager sharedManager];
  id v3 = &_dispatch_main_q;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_BAFC;
  v4[3] = &unk_20B28;
  objc_copyWeak(&v5, &location);
  [v2 fetchRecommendationsWithQueue:&_dispatch_main_q completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setRecommendationSelected:(id)a3 withSpecifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  CGFloat v7 = [v5 propertyForKey:NMBUISpecifierModelObjectKey];

  CGFloat v8 = BUDynamicCast();

  objc_opt_class();
  id v9 = BUDynamicCast();

  objc_msgSend(v8, "setSelected:", objc_msgSend(v9, "BOOLValue"));
  unsigned __int8 v10 = +[NBAudiobookRecommendationManager sharedManager];
  uint64_t v12 = v8;
  double v11 = +[NSArray arrayWithObjects:&v12 count:1];
  [v10 persistRecommendationsSelections:v11];
}

- (id)_recommendationSelected:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 propertyForKey:NMBUISpecifierModelObjectKey];

  id v6 = BUDynamicCast();

  if ([(NBBridgeSyncedAudiobooksController *)self hasCloudAccount])
  {
    CGFloat v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isSelected]);
  }
  else
  {
    CGFloat v7 = &__kCFBooleanFalse;
  }

  return v7;
}

- (void)_dismissAudiobookPicker
{
}

- (void)_restrictionsDidChange:(id)a3
{
  BOOL v4 = +[NBBridgeUtilities isExplicitMaterialAllowed];
  if (v4 != [(NBBridgeSyncedAudiobooksController *)self allowsExplicitAudiobooks])
  {
    if (!v4)
    {
      id v5 = NBDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 67109120;
        v6[1] = v4;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Explicit restriction has changed to %d.", (uint8_t *)v6, 8u);
      }

      [(NBBridgeSyncedAudiobooksController *)self dismissViewControllerAnimated:1 completion:0];
      [(NBBridgeSyncedAudiobooksController *)self _reloadContents];
    }
    [(NBBridgeSyncedAudiobooksController *)self setAllowsExplicitAudiobooks:v4];
  }
}

- (void)_pinningAudiobooksContentsInvalidated:(id)a3
{
  [(NBBridgeSyncedAudiobooksController *)self _reloadContents];
  id v3 = +[NBAudiobookRecommendationManager sharedManager];
  [v3 reloadRecommendationsIfNeeded:0];
}

- (void)_handleAudiobookPinningSelectionsDidChangeNotification:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:NMSNotificationUserInfoKeyIsInProcessNotification];
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    CGFloat v7 = NBDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_13728();
    }

    [(NBBridgeSyncedAudiobooksController *)self _reloadContents];
  }
}

- (void)_handleSyncInfoDidUpdateNotification:(id)a3
{
  BOOL v4 = [a3 object];
  id v5 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];

  unsigned __int8 v6 = NBDefaultLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4 == v5)
  {
    if (v7) {
      sub_1375C();
    }

    [(NBBridgeSyncedAudiobooksController *)self _updateHeaderAndSyncProgressIfNeeded];
  }
  else
  {
    if (v7) {
      sub_13790();
    }
  }
}

- (void)_handleSyncManagerSyncStateDidChangeNotification:(id)a3
{
  BOOL v4 = NBDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_137C4();
  }

  [(NBBridgeSyncedAudiobooksController *)self _updateHeaderAndSyncProgressIfNeeded];
}

- (void)_handleApplicationWillEnterForegroundNotification:(id)a3
{
  id v3 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
  [v3 beginObservingSyncInfo];
}

- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3
{
  id v3 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
  [v3 endObservingSyncInfo];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = [(NBBridgeSyncedAudiobooksController *)self specifierAtIndexPath:v7];
  if ([(NBBridgeSyncedAudiobooksController *)self editable])
  {
    id v9 = [v8 identifier];
    unsigned __int8 v10 = NBBundle();
    double v11 = [v10 localizedStringForKey:@"Add Audiobook\\U2026" value:&stru_20DD8 table:&stru_20DD8];
    unsigned int v12 = [v9 isEqualToString:v11];

    if (v12) {
      [(NBBridgeSyncedAudiobooksController *)self setEditable:0];
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)NBBridgeSyncedAudiobooksController;
  uint64_t v13 = [(NBBridgeSyncedAudiobooksController *)&v15 tableView:v6 willSelectRowAtIndexPath:v7];

  return v13;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned __int8 v10 = [v9 section];
  if (v10 == (char *)[v8 numberOfSections] - 1)
  {
    double v11 = [(NBBridgeSyncedAudiobooksController *)self specifierAtIndexPath:v9];
    unsigned int v12 = [v11 propertyForKey:NMBUISpecifierModelObjectKey];
    objc_opt_class();
    uint64_t v13 = BUDynamicCast();
    double v14 = v13;
    if (v13)
    {
      objc_super v15 = objc_msgSend(v13, "bk_storeID");
      if (!v15)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      objc_opt_class();
      id v17 = BUDynamicCast();
      id v18 = v17;
      if (v17)
      {
        id v19 = [v17 storeID];
        objc_super v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v19, "nb_uint64_t"));
      }
      else
      {
        objc_super v15 = 0;
      }

      if (!v15) {
        goto LABEL_5;
      }
    }
    unsigned int v16 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
    [v16 unpinAudiobook:v15];

    [(NBBridgeSyncedAudiobooksController *)self _reloadContents];
    goto LABEL_5;
  }
LABEL_6:
  v20.receiver = self;
  v20.super_class = (Class)NBBridgeSyncedAudiobooksController;
  [(NBBridgeSyncedAudiobooksController *)&v20 tableView:v8 commitEditingStyle:a4 forRowAtIndexPath:v9];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  BOOL v4 = [(NBBridgeSyncedAudiobooksController *)self specifierAtIndexPath:a4];
  id v5 = [v4 propertyForKey:@"kNanoBooksCellIsEditable"];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (void)selectAudiobookDidSelectAudiobookWithAdamId:(id)a3
{
  id v4 = a3;
  id v5 = +[NBAudiobookRecommendationManager sharedManager];
  [v5 updateBitRateForAdamID:v4];

  unsigned __int8 v6 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
  [v6 pinAudiobook:v4];

  [(NBBridgeSyncedAudiobooksController *)self dismissViewControllerAnimated:1 completion:0];

  [(NBBridgeSyncedAudiobooksController *)self _reloadContents];
}

- (BOOL)selectAudiobookAdamIdAlreadyPinned:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(NBBridgeSyncedAudiobooksController *)self manuallyPinnedAudiobookIdentifiers];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (PSSpecifier)signInSpecifier
{
  signInSpecifier = self->_signInSpecifier;
  if (!signInSpecifier)
  {
    id v4 = NBBundle();
    id v5 = [v4 localizedStringForKey:@"Sign In" value:&stru_20DD8 table:&stru_20DD8];
    unsigned __int8 v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];
    id v7 = self->_signInSpecifier;
    self->_signInSpecifier = v6;

    [(PSSpecifier *)self->_signInSpecifier setButtonAction:"_iTunesSignInAction:"];
    signInSpecifier = self->_signInSpecifier;
  }

  return signInSpecifier;
}

- (PSSpecifier)audiobookStoreSpecifier
{
  audiobookStoreSpecifier = self->_audiobookStoreSpecifier;
  if (!audiobookStoreSpecifier)
  {
    id v4 = NBBundle();
    id v5 = [v4 localizedStringForKey:@"Audiobook_Store_Button_Text" value:@"Audiobook Store" table:&stru_20DD8];
    unsigned __int8 v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];
    id v7 = self->_audiobookStoreSpecifier;
    self->_audiobookStoreSpecifier = v6;

    [(PSSpecifier *)self->_audiobookStoreSpecifier setButtonAction:"_showAudiobookStore:"];
    audiobookStoreSpecifier = self->_audiobookStoreSpecifier;
  }

  return audiobookStoreSpecifier;
}

- (void)_showReadingNowWantToRead:(id)a3
{
  id v4 = +[NSURL URLWithString:@"ibooks://show-reading-now"];
  id v3 = +[UIApplication sharedApplication];
  [v3 openURL:v4 withCompletionHandler:&stru_20B48];
}

- (void)_showAudiobookStore:(id)a3
{
  id v4 = +[NSURL URLWithString:@"ibooks://show-audiobook-store"];
  id v3 = +[UIApplication sharedApplication];
  [v3 openURL:v4 withCompletionHandler:&stru_20B68];
}

- (void)_iTunesSignInAction:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=STORE_SERVICE"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)_iCloudSignInAction:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)_updateHeaderAndSyncProgressIfNeeded
{
  if (![(NBBridgeSyncedAudiobooksController *)self isViewLoaded])
  {
    unsigned __int8 v6 = NBDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      id v7 = "[progress] Ignoring media sync info update due to view not being loaded.";
      id v8 = (uint8_t *)&v9;
LABEL_10:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
LABEL_11:

    return;
  }
  id v3 = [(NBBridgeSyncedAudiobooksController *)self view];
  id v4 = [v3 window];

  if (!v4)
  {
    self->_needsVisibleSpecifiersSyncInfoUpdate = 1;
    unsigned __int8 v6 = NBDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "[progress] Ignoring media sync info update due to view not being visible.";
      id v8 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v5 = NBDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_137F8();
  }

  [(NBBridgeSyncedAudiobooksController *)self _configureHeaderIfNeeded];
  [(NBBridgeSyncedAudiobooksController *)self _updateProgressIfNeeded];
  self->_needsVisibleSpecifiersSyncInfoUpdate = 0;
}

- (void)_updateFooterIfNeeded
{
  if ([(NBBridgeSyncedAudiobooksController *)self isViewLoaded])
  {
    if ([(NBBridgeSyncedAudiobooksController *)self isRefreshingFamily]
      && ![(NBBridgeSyncedAudiobooksController *)self _hasPurchasedAudiobooks])
    {
      id v4 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
      [v4 startAnimating];
    }
    else
    {
      id v4 = 0;
    }
    id v3 = [(NBBridgeSyncedAudiobooksController *)self table];
    [v3 setTableFooterView:v4];
  }
}

- (NMBUIAlertHeaderView)alertHeaderView
{
  alertHeaderView = self->_alertHeaderView;
  if (!alertHeaderView)
  {
    id v4 = (NMBUIAlertHeaderView *)objc_msgSend(objc_alloc((Class)NMBUIAlertHeaderView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = self->_alertHeaderView;
    self->_alertHeaderView = v4;

    unsigned __int8 v6 = +[UIColor systemYellowColor];
    [(NMBUIAlertHeaderView *)self->_alertHeaderView setTintColor:v6];

    id v7 = NBBundle();
    id v8 = [v7 localizedStringForKey:@"Out of Media Storage" value:&stru_20DD8 table:&stru_20DD8];
    __int16 v9 = [(NMBUIAlertHeaderView *)self->_alertHeaderView textLabel];
    [v9 setText:v8];

    unsigned __int8 v10 = NBBundle();
    double v11 = [v10 localizedStringForKey:@"The storage space dedicated to media on your Apple\\U00A0Watch is full. To make space available, you can remove some podcasts, music, or audiobooks.", &stru_20DD8, &stru_20DD8 value table];
    unsigned int v12 = [(NMBUIAlertHeaderView *)self->_alertHeaderView detailTextLabel];
    [v12 setText:v11];

    [(NMBUIAlertHeaderView *)self->_alertHeaderView setPreservesSuperviewLayoutMargins:1];
    alertHeaderView = self->_alertHeaderView;
  }

  return alertHeaderView;
}

- (void)_configureHeaderIfNeeded
{
  if ([(NBBridgeSyncedAudiobooksController *)self isViewLoaded])
  {
    id v3 = NBDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_13900();
    }

    id v4 = objc_msgSend(objc_alloc((Class)NMBUIContentHeaderView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = [(NBBridgeSyncedAudiobooksController *)self _contentHeaderViewTitle];
    unsigned __int8 v6 = [v4 textLabel];
    [v6 setText:v5];

    id v7 = [(NBBridgeSyncedAudiobooksController *)self _contentHeaderViewSubtitle];
    id v8 = [v4 detailTextLabel];
    [v8 setText:v7];

    [v4 setPreservesSuperviewLayoutMargins:1];
    if ([(NBBridgeSyncedAudiobooksController *)self _shouldShowProgress])
    {
      [(NBBridgeSyncedAudiobooksController *)self _contentHeaderViewProgress];
      int v10 = v9;
      double v11 = [v4 progressView];
      LODWORD(v12) = v10;
      [v11 setProgress:v12];

      uint64_t v13 = NBDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_13860(v4, v13);
      }
    }
    double v14 = +[NSMutableArray array];
    if ([(NBBridgeSyncedAudiobooksController *)self isOutOfSpace])
    {
      objc_super v15 = NBDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1382C();
      }

      unsigned int v16 = [(NBBridgeSyncedAudiobooksController *)self alertHeaderView];
      [v14 addObject:v16];
    }
    [v14 addObject:v4];
    id v17 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v14];
    [v17 setAxis:1];
    [v17 setPreservesSuperviewLayoutMargins:1];
    id v18 = [(NBBridgeSyncedAudiobooksController *)self table];
    [v18 setTableHeaderView:v17];

    [(NBBridgeSyncedAudiobooksController *)self _updateHeaderSize];
  }
}

- (void)_updateHeaderSize
{
  if ([(NBBridgeSyncedAudiobooksController *)self isViewLoaded])
  {
    id v3 = [(NBBridgeSyncedAudiobooksController *)self table];
    id v14 = [v3 tableHeaderView];

    id v4 = [v14 superview];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    LODWORD(v5) = 1148846080;
    LODWORD(v7) = 1112014848;
    objc_msgSend(v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, v8, v5, v7);
    double v10 = v9;
    double v12 = v11;

    objc_msgSend(v14, "setBounds:", 0.0, 0.0, v10, v12);
    uint64_t v13 = [(NBBridgeSyncedAudiobooksController *)self table];
    [v13 setTableHeaderView:v14];
  }
}

- (void)_updateProgressIfNeeded
{
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v2 = [(NBBridgeSyncedAudiobooksController *)self specifiers];
  id v3 = [v2 countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v45;
    uint64_t v6 = NMBUISpecifierShouldShowDownloadInfoKey;
    uint64_t v39 = NMBUISpecifierModelObjectKey;
    uint64_t v43 = NMBUISpecifierDownloadStateKey;
    uint64_t v42 = NMBUISpecifierDownloadProgressKey;
    uint64_t v35 = NMBUISpecifierTitleKey;
    uint64_t v34 = 134219010;
    uint64_t v36 = *(void *)v45;
    v37 = v2;
    uint64_t v38 = NMBUISpecifierShouldShowDownloadInfoKey;
    do
    {
      double v7 = 0;
      id v40 = v4;
      do
      {
        if (*(void *)v45 != v5) {
          objc_enumerationMutation(v2);
        }
        double v8 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v7);
        double v9 = objc_msgSend(v8, "propertyForKey:", v6, v34);
        unsigned int v10 = [v9 BOOLValue];

        if (v10)
        {
          double v11 = [v8 propertyForKey:v39];
          double v12 = [v8 propertyForKey:v43];
          unint64_t v13 = (unint64_t)[v12 unsignedIntegerValue];

          id v14 = [v8 propertyForKey:v42];
          [v14 floatValue];
          float v16 = v15;

          if (v11)
          {
            id v17 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
            unint64_t v18 = -[NBBridgeSyncedAudiobooksController _resolvedProgressViewStateForState:](self, "_resolvedProgressViewStateForState:", [v17 downloadStateForModelObject:v11]);

            id v19 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
            [v19 progressForModelObject:v11];
            float v21 = v20;

            if (v13 != v18 || vabds_f32(v16, v21) > 0.00000011921)
            {
              id v22 = [v8 propertyForKey:v35];
              id v23 = NBDefaultLog();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                CFStringRef v31 = @"unknown";
                if (v13 <= 6) {
                  CFStringRef v31 = off_20B88[v13];
                }
                CFStringRef v32 = @"unknown";
                if (v18 <= 6) {
                  CFStringRef v32 = off_20B88[v18];
                }
                *(_DWORD *)buf = v34;
                double v49 = v16;
                __int16 v50 = 2048;
                double v51 = v21;
                __int16 v52 = 2114;
                CFStringRef v53 = v31;
                __int16 v54 = 2114;
                CFStringRef v55 = v32;
                __int16 v56 = 2112;
                v57 = v22;
                _os_log_debug_impl(&dword_0, v23, OS_LOG_TYPE_DEBUG, "[progress] oldProgress:%.4f newProgress:%.4f oldState:%{public}@ newState:%{public}@ title:%@", buf, 0x34u);
              }

              objc_opt_class();
              uint64_t v24 = [(NBBridgeSyncedAudiobooksController *)self table];
              unsigned __int8 v25 = [(NBBridgeSyncedAudiobooksController *)self indexPathForSpecifier:v8];
              char v26 = [v24 cellForRowAtIndexPath:v25];
              long long v27 = BUDynamicCast();

              long long v28 = +[NSNumber numberWithUnsignedInteger:v18];
              [v8 setProperty:v28 forKey:v43];

              *(float *)&double v29 = v21;
              v30 = +[NSNumber numberWithFloat:v29];
              [v8 setProperty:v30 forKey:v42];

              [v27 refreshCellContentsWithSpecifier:v8];
              uint64_t v5 = v36;
              v2 = v37;
            }
          }

          uint64_t v6 = v38;
          id v4 = v40;
        }
        double v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v33 = [v2 countByEnumeratingWithState:&v44 objects:v58 count:16];
      id v4 = v33;
    }
    while (v33);
  }
}

- (BOOL)isOutOfSpace
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint64_t v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  uint64_t v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  unsigned int v8 = [v6 supportsCapability:v7];

  if (!v8) {
    return 0;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v9 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
  unsigned int v10 = [v9 syncInfo];
  double v11 = [v10 containers];

  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v17 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
        unint64_t v18 = [v17 syncInfo];
        id v19 = [v18 numberOfItemsOverStorageLimitForContainer:v16];

        if (v19)
        {
          float v21 = NBDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            id v22 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
            id v23 = [v22 syncInfo];
            id v24 = [v23 numberOfItemsOverStorageLimitForContainer:v16];
            *(_DWORD *)buf = 134218242;
            id v31 = v24;
            __int16 v32 = 2112;
            uint64_t v33 = v16;
            _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "[progress] out of space with %lu items over limit for container %@.", buf, 0x16u);
          }
          BOOL v20 = 1;
          goto LABEL_15;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 0;
LABEL_15:

  return v20;
}

- (BOOL)_shouldShowProgress
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"BKShowAudiobookSyncProgress"];

  if (v4)
  {
    uint64_t v5 = +[NRPairedDeviceRegistry sharedInstance];
    uint64_t v6 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    id v7 = [v5 getAllDevicesWithArchivedAltAccountDevicesMatching:v6];
    unsigned int v8 = [v7 firstObject];
    id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
    unsigned int v10 = [v8 supportsCapability:v9];

    if (!v10)
    {
      id v13 = [(NBBridgeSyncedAudiobooksController *)self syncManager];
      uint64_t v14 = [v13 audiobooksProgressInfo];
      BOOL v15 = [v14 syncState] == (char *)&dword_0 + 1;
      goto LABEL_9;
    }
    unsigned int v11 = [(NBBridgeSyncedAudiobooksController *)self _hasPinnedAudiobooks];
    id v12 = NBDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_13934(self, v11, v12);
    }

    if (v11)
    {
      id v13 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
      uint64_t v14 = [v13 syncInfo];
      BOOL v15 = [v14 status] != &dword_4;
LABEL_9:

      return v15;
    }
  }
  return 0;
}

- (unint64_t)_resolvedProgressViewStateForState:(unint64_t)a3
{
  uint64_t v5 = [(NBBridgeSyncedAudiobooksController *)self syncManager];
  uint64_t v6 = [v5 audiobooksProgressInfo];
  if ([v6 syncState] == (char *)&dword_0 + 3)
  {
    id v7 = [(NBBridgeSyncedAudiobooksController *)self syncManager];
    unsigned int v8 = [v7 audiobooksProgressInfo];
    unsigned __int8 v9 = [v8 syncWaitingSubstate];

    int v10 = v9 & 1;
    if (v9) {
      unint64_t v11 = 1;
    }
    else {
      unint64_t v11 = 3;
    }
  }
  else
  {

    int v10 = 0;
    unint64_t v11 = 3;
  }
  id v12 = NBDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_13A1C(self, v10, v12);
  }
  if (a3 == 1) {
    a3 = v11;
  }

  return a3;
}

- (id)_contentHeaderViewTitle
{
  v2 = [(NBBridgeSyncedAudiobooksController *)self _pinnedAudiobooks];
  id v3 = (char *)[v2 count];
  if (v3)
  {
    id v4 = v3;
    if (v3 == (unsigned char *)&dword_0 + 1)
    {
      uint64_t v5 = NBBundle();
      uint64_t v6 = v5;
      CFStringRef v7 = @"%@ Audiobook";
    }
    else
    {
      uint64_t v5 = NBBundle();
      uint64_t v6 = v5;
      CFStringRef v7 = @"%@ Audiobooks";
    }
    unsigned int v8 = [v5 localizedStringForKey:v7 value:&stru_20DD8 table:&stru_20DD8];

    int v10 = +[NSNumber numberWithUnsignedInteger:v4];
    unsigned __int8 v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10);
  }
  else
  {
    unsigned int v8 = NBBundle();
    unsigned __int8 v9 = [v8 localizedStringForKey:@"No Audiobooks" value:&stru_20DD8 table:&stru_20DD8];
  }

  return v9;
}

- (id)_contentHeaderViewSubtitle
{
  id v3 = [(NBBridgeSyncedAudiobooksController *)self _pinnedAudiobooks];
  if ([v3 count])
  {
    id v4 = +[NRPairedDeviceRegistry sharedInstance];
    uint64_t v5 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    uint64_t v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
    CFStringRef v7 = [v6 firstObject];
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
    unsigned int v9 = [v7 supportsCapability:v8];

    int v10 = [(NBBridgeSyncedAudiobooksController *)self syncManager];
    unint64_t v11 = [v10 audiobooksProgressInfo];
    id v12 = v11;
    if (v9)
    {
      id v13 = [v11 _syncProgressTextForMediaType:2];
      uint64_t v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v19 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
        id v15 = [v19 syncStatusDetailText];
      }
    }
    else
    {
      id v15 = [v11 _trackProgressTextForMediaType:2];
    }
  }
  else
  {
    unsigned int v16 = [(NBBridgeSyncedAudiobooksController *)self isStoreAvailable];
    id v17 = NBBundle();
    int v10 = v17;
    if (v16) {
      CFStringRef v18 = @"You can choose to automatically download your current audiobooks to your Apple\\U00A0Watch, or manually add them from your library.";
    }
    else {
      CFStringRef v18 = @"The Audiobook Store isn\\U2019t available in your country or region.";
    }
    id v15 = [v17 localizedStringForKey:v18 value:&stru_20DD8 table:&stru_20DD8];
  }

  return v15;
}

- (float)_contentHeaderViewProgress
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint64_t v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  uint64_t v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  unsigned int v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    unsigned int v9 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
    int v10 = [v9 syncInfo];
    unint64_t v11 = (char *)[v10 status];

    id v12 = +[NMSSyncManager sharedManager];
    id v13 = [v12 audiobooksProgressInfo];
    unsigned int v14 = [v13 _isSyncing];

    if (v11 == (unsigned char *)&dword_0 + 3 || (float v15 = 0.0, v14))
    {
      unsigned int v16 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
      id v17 = [v16 syncInfo];
      [v17 progress];
      float v15 = v18;
    }
    id v19 = NBDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      BOOL v20 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
      float v21 = [v20 syncInfo];
      [v21 progress];
      double v23 = v22;
      id v24 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
      unsigned __int8 v25 = [v24 syncInfo];
      unint64_t v26 = (unint64_t)[v25 status];
      if (v26 > 4) {
        CFStringRef v27 = @"unknown";
      }
      else {
        CFStringRef v27 = off_20BC0[v26];
      }
      int v32 = 134218498;
      double v33 = v23;
      __int16 v34 = 2114;
      CFStringRef v35 = v27;
      __int16 v36 = 1024;
      unsigned int v37 = v14;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "[progress] calculating syncInfo.progress:%.4f syncInfoStatus:%{public}@ isSyncing:%d", (uint8_t *)&v32, 0x1Cu);
    }
  }
  else
  {
    long long v28 = [(NBBridgeSyncedAudiobooksController *)self syncManager];
    long long v29 = [v28 audiobooksProgressInfo];
    [v29 estimatedSyncProgress];
    float v15 = v30;
  }
  return v15;
}

- (void)_showSyncStorageWarning
{
  id v3 = NBDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int v4 = [(NBBridgeSyncedAudiobooksController *)self isOutOfSpace];
    uint64_t v5 = [(NBBridgeSyncedAudiobooksController *)self _pinnedAudiobooks];
    v15[0] = 67109376;
    v15[1] = v4;
    __int16 v16 = 2048;
    id v17 = [v5 count];
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "_showSyncStorageWarning - _isOutOfSpace:%d; want <%lu>",
      (uint8_t *)v15,
      0x12u);
  }
  uint64_t v6 = NBBundle();
  id v7 = [v6 localizedStringForKey:@"The storage space dedicated to media on your Apple\\U00A0Watch is full." value:&stru_20DD8 table:&stru_20DD8];
  unsigned int v8 = NBBundle();
  unsigned int v9 = [v8 localizedStringForKey:@"To make space available, you can remove some podcasts, music, or audiobooks.", &stru_20DD8, &stru_20DD8 value table];
  int v10 = +[UIAlertController alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  unint64_t v11 = NBBundle();
  id v12 = [v11 localizedStringForKey:@"OK" value:&stru_20DD8 table:&stru_20DD8];
  id v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:0];
  [v10 addAction:v13];

  unsigned int v14 = [(NBBridgeSyncedAudiobooksController *)self _selfOrPresentedViewController];
  [v14 presentViewController:v10 animated:1 completion:0];
}

- (void)familyCircleDataSource:(id)a3 didFetchFamilyCircle:(id)a4
{
  id v5 = a4;
  if ([(NBBridgeSyncedAudiobooksController *)self isRefreshingFamily]) {
    [(NBBridgeSyncedAudiobooksController *)self _updateFamilyCircle:v5];
  }
}

- (id)syncInfoController:(id)a3 containerIdentifierForModelObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  id v7 = BUDynamicCast();
  unsigned int v8 = v7;
  if (v7)
  {
    unsigned int v9 = objc_msgSend(v7, "bk_storeID");
    uint64_t v10 = [v9 stringValue];
  }
  else
  {
    objc_opt_class();
    unint64_t v11 = BUDynamicCast();
    unsigned int v9 = v11;
    if (!v11)
    {
      id v12 = 0;
      goto LABEL_6;
    }
    uint64_t v10 = [v11 storeID];
  }
  id v12 = (void *)v10;
LABEL_6:

  if ([v12 length]
    && ([v5 syncInfo],
        id v13 = objc_claimAutoreleasedReturnValue(),
        [v13 containers],
        unsigned int v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = [v14 containsObject:v12],
        v14,
        v13,
        v15))
  {
    id v16 = v12;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)_specifierWithTitle:(id)a3 subtitle:(id)a4 artworkCatalog:(id)a5 showSwitch:(BOOL)a6 set:(SEL)a7 get:(SEL)a8
{
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:a7 get:a8 detail:0 cell:4 edit:0];
  [v17 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v17 setProperty:v16 forKey:NMBUISpecifierTitleKey];

  [v17 setProperty:v15 forKey:NMBUISpecifierSubtitleKey];
  [v17 setProperty:&off_21A30 forKey:PSTableCellStyleOverrideKey];
  [v17 setProperty:v14 forKey:NMBUISpecifierArtworkCatalogKey];

  float v18 = +[NBBridgeUtilities audiobookArtworkPlaceholderImage];
  [v17 setProperty:v18 forKey:NMBUISpecifierPlaceholderImageKey];

  id v19 = +[NSNumber numberWithBool:v10];
  [v17 setProperty:v19 forKey:NMBUISpecifierShouldShowSwitchKey];

  [v17 setProperty:&__kCFBooleanFalse forKey:NMBUISpecifierShouldShowExclamationIconKey];

  return v17;
}

- (id)_specifierWithItem:(id)a3 showDownloadInfo:(BOOL)a4 showWarningIfAboveQuota:(BOOL)a5 downloadLimit:(unint64_t)a6
{
  BOOL v36 = a5;
  BOOL v37 = a4;
  id v8 = a3;
  unsigned int v9 = [v8 title];
  BOOL v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:4 edit:0];

  [v10 setProperty:objc_opt_class() forKey:PSCellClassKey];
  unint64_t v11 = [v8 title];
  [v10 setProperty:v11 forKey:NMBUISpecifierTitleKey];

  id v12 = [v8 artist];
  [v10 setProperty:v12 forKey:NMBUISpecifierSubtitleKey];

  [v10 setProperty:&off_21A30 forKey:PSTableCellStyleOverrideKey];
  id v13 = [v8 artworkCatalog];
  [v10 setProperty:v13 forKey:NMBUISpecifierArtworkCatalogKey];

  id v14 = +[NBBridgeUtilities audiobookArtworkPlaceholderImage];
  [v10 setProperty:v14 forKey:NMBUISpecifierPlaceholderImageKey];

  [v10 setProperty:v8 forKey:NMBUISpecifierModelObjectKey];
  id v15 = objc_msgSend(v8, "bk_storeID");
  id v16 = +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:v15 downloadLimit:a6 manuallyAdded:1 downloadedItemsOnly:0];

  id v17 = +[NRPairedDeviceRegistry sharedInstance];
  float v18 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v19 = [v17 getAllDevicesWithArchivedAltAccountDevicesMatching:v18];
  BOOL v20 = [v19 firstObject];
  id v21 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  unsigned int v22 = [v20 supportsCapability:v21];

  if (v22 && v37)
  {
    double v23 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
    id v24 = [v23 downloadStateForModelObject:v8];

    unint64_t v25 = [(NBBridgeSyncedAudiobooksController *)self _resolvedProgressViewStateForState:v24];
    unint64_t v26 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
    [v26 progressForModelObject:v8];
    int v28 = v27;

    [v10 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowDownloadInfoKey];
    long long v29 = +[NSNumber numberWithUnsignedInteger:v25];
    [v10 setProperty:v29 forKey:NMBUISpecifierDownloadStateKey];

    LODWORD(v30) = v28;
    id v31 = +[NSNumber numberWithFloat:v30];
    int v32 = &NMBUISpecifierDownloadProgressKey;
LABEL_7:
    [v10 setProperty:v31 forKey:*v32];

    goto LABEL_8;
  }
  if (v36)
  {
    double v33 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
    unsigned __int8 v34 = [v33 isItemGroupWithinQuota:v16];

    if ((v34 & 1) == 0)
    {
      [v10 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowExclamationIconKey];
      [v10 setProperty:self forKey:NMBUISpecifierIconTargetKey];
      id v31 = NSStringFromSelector("_showSyncStorageWarning");
      int v32 = &NMBUISpecifierIconActionStringKey;
      goto LABEL_7;
    }
  }
LABEL_8:

  return v10;
}

- (id)_specifierWithJaliscoItem:(id)a3 showDownloadInfo:(BOOL)a4 showWarningIfAboveQuota:(BOOL)a5 downloadLimit:(unint64_t)a6
{
  BOOL v36 = a5;
  BOOL v37 = a4;
  id v8 = a3;
  unsigned int v9 = [v8 title];
  BOOL v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:4 edit:0];

  [v10 setProperty:objc_opt_class() forKey:PSCellClassKey];
  unint64_t v11 = [v8 title];
  [v10 setProperty:v11 forKey:NMBUISpecifierTitleKey];

  id v12 = [v8 artist];
  [v10 setProperty:v12 forKey:NMBUISpecifierSubtitleKey];

  [v10 setProperty:&off_21A30 forKey:PSTableCellStyleOverrideKey];
  id v13 = [v8 artworkCatalog];
  [v10 setProperty:v13 forKey:NMBUISpecifierArtworkCatalogKey];

  id v14 = +[NBBridgeUtilities audiobookArtworkPlaceholderImage];
  [v10 setProperty:v14 forKey:NMBUISpecifierPlaceholderImageKey];

  [v10 setProperty:v8 forKey:NMBUISpecifierModelObjectKey];
  id v15 = [v8 storeID];
  uint64_t v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "nb_uint64_t"));

  uint64_t v38 = (void *)v16;
  id v17 = +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:v16 downloadLimit:a6 manuallyAdded:1 downloadedItemsOnly:0];
  float v18 = +[NRPairedDeviceRegistry sharedInstance];
  id v19 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  BOOL v20 = [v18 getAllDevicesWithArchivedAltAccountDevicesMatching:v19];
  id v21 = [v20 firstObject];
  id v22 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  LODWORD(a6) = [v21 supportsCapability:v22];

  if (a6 && v37)
  {
    double v23 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
    id v24 = [v23 downloadStateForModelObject:v8];

    unint64_t v25 = [(NBBridgeSyncedAudiobooksController *)self _resolvedProgressViewStateForState:v24];
    unint64_t v26 = [(NBBridgeSyncedAudiobooksController *)self syncInfoController];
    [v26 progressForModelObject:v8];
    int v28 = v27;

    [v10 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowDownloadInfoKey];
    long long v29 = +[NSNumber numberWithUnsignedInteger:v25];
    [v10 setProperty:v29 forKey:NMBUISpecifierDownloadStateKey];

    LODWORD(v30) = v28;
    id v31 = +[NSNumber numberWithFloat:v30];
    int v32 = &NMBUISpecifierDownloadProgressKey;
LABEL_7:
    [v10 setProperty:v31 forKey:*v32];

    goto LABEL_8;
  }
  if (v36)
  {
    double v33 = [(NBBridgeSyncedAudiobooksController *)self pinningManager];
    unsigned __int8 v34 = [v33 isItemGroupWithinQuota:v17];

    if ((v34 & 1) == 0)
    {
      [v10 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowExclamationIconKey];
      [v10 setProperty:self forKey:NMBUISpecifierIconTargetKey];
      id v31 = NSStringFromSelector("_showSyncStorageWarning");
      int v32 = &NMBUISpecifierIconActionStringKey;
      goto LABEL_7;
    }
  }
LABEL_8:

  return v10;
}

- (id)_selfOrPresentedViewController
{
  id v3 = [(NBBridgeSyncedAudiobooksController *)self presentedViewController];

  if (v3)
  {
    unsigned int v4 = [(NBBridgeSyncedAudiobooksController *)self presentedViewController];
  }
  else
  {
    unsigned int v4 = self;
  }

  return v4;
}

- (NMSSyncManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (NMSMediaPinningManager)pinningManager
{
  return self->_pinningManager;
}

- (void)setPinningManager:(id)a3
{
}

- (NSArray)manuallyPinnedAudiobookIdentifiers
{
  return self->_manuallyPinnedAudiobookIdentifiers;
}

- (void)setManuallyPinnedAudiobookIdentifiers:(id)a3
{
}

- (void)setSyncInfoController:(id)a3
{
}

- (BOOL)needsVisibleSpecifiersSyncInfoUpdate
{
  return self->_needsVisibleSpecifiersSyncInfoUpdate;
}

- (void)setNeedsVisibleSpecifiersSyncInfoUpdate:(BOOL)a3
{
  self->_needsVisibleSpecifiersSyncInfoUpdate = a3;
}

- (void)setAlertHeaderView:(id)a3
{
}

- (NSArray)recommendationSpecifiers
{
  return self->_recommendationSpecifiers;
}

- (void)setRecommendationSpecifiers:(id)a3
{
}

- (NSArray)audiobookSpecifiers
{
  return self->_audiobookSpecifiers;
}

- (void)setAudiobookSpecifiers:(id)a3
{
}

- (void)setAddAudiobookSpecifier:(id)a3
{
}

- (void)setSignInSpecifier:(id)a3
{
}

- (void)setAudiobookStoreSpecifier:(id)a3
{
}

- (void)setLibraryGroupSpecifier:(id)a3
{
}

- (BOOL)allowsExplicitAudiobooks
{
  return self->_allowsExplicitAudiobooks;
}

- (void)setAllowsExplicitAudiobooks:(BOOL)a3
{
  self->_allowsExplicitAudiobooks = a3;
}

- (BOOL)hasCloudAccount
{
  return self->_cloudAccount;
}

- (void)setCloudAccount:(BOOL)a3
{
  self->_cloudAccount = a3;
}

- (BOOL)hasStoreAccount
{
  return self->_storeAccount;
}

- (void)setStoreAccount:(BOOL)a3
{
  self->_storeAccount = a3;
}

- (BOOL)isStoreAvailable
{
  return self->_storeAvailable;
}

- (void)setStoreAvailable:(BOOL)a3
{
  self->_storeAvailable = a3;
}

- (BOOL)isRefreshingFamily
{
  return self->_refreshingFamily;
}

- (void)setRefreshingFamily:(BOOL)a3
{
  self->_refreshingFamily = a3;
}

- (NSArray)familyDSIDs
{
  return self->_familyDSIDs;
}

- (void)setFamilyDSIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyDSIDs, 0);
  objc_storeStrong((id *)&self->_libraryGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_audiobookStoreSpecifier, 0);
  objc_storeStrong((id *)&self->_signInSpecifier, 0);
  objc_storeStrong((id *)&self->_addAudiobookSpecifier, 0);
  objc_storeStrong((id *)&self->_audiobookSpecifiers, 0);
  objc_storeStrong((id *)&self->_recommendationSpecifiers, 0);
  objc_storeStrong((id *)&self->_alertHeaderView, 0);
  objc_storeStrong((id *)&self->_syncInfoController, 0);
  objc_storeStrong((id *)&self->_manuallyPinnedAudiobookIdentifiers, 0);
  objc_storeStrong((id *)&self->_pinningManager, 0);

  objc_storeStrong((id *)&self->_syncManager, 0);
}

@end