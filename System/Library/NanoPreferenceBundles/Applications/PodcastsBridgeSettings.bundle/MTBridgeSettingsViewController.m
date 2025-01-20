@interface MTBridgeSettingsViewController
+ (id)downloadCountFormatter;
- (MTBridgeSettingsViewController)init;
- (id)_addShowsSpecifier;
- (id)_contentHeaderViewSubtitle;
- (id)_contentHeaderViewTitle;
- (id)_savedCellValueForSpecifier:(id)a3;
- (id)_savedSpecifier;
- (id)_showCellValueForSpecifier:(id)a3;
- (id)_showSpecifiers;
- (id)_showsPredicate;
- (id)_stationCellValueForSpecifier:(id)a3;
- (id)_stationSpecifiers;
- (id)_upNextCellValueForSpecifier:(id)a3;
- (id)_upNextSpecifier;
- (id)_valueStringForDownloadSettings:(id)a3;
- (id)specifiers;
- (id)syncInfoController:(id)a3 containerIdentifierForModelObject:(id)a4;
- (void)_addShowsAction:(id)a3;
- (void)_configureHeaderIfNeeded;
- (void)_createFRCs;
- (void)_handleAccountDidChangeNotification:(id)a3;
- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3;
- (void)_handleApplicationWillEnterForegroundNotification:(id)a3;
- (void)_handlePodcastsIdentifiersDidChangeNotification:(id)a3;
- (void)_handleSyncInfoDidUpdateNotification:(id)a3;
- (void)_podcastsSettingsAction:(id)a3;
- (void)_presentSettingsViewControllerForSpecifier:(id)a3;
- (void)_reload;
- (void)_signInAction:(id)a3;
- (void)_updateHeaderAndSyncProgress;
- (void)_updateHeaderSize;
- (void)_updateProgressIfNeeded;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)extensionAccessDidChange;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)viewControllerDidSelectDone:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MTBridgeSettingsViewController

- (MTBridgeSettingsViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTBridgeSettingsViewController;
  v2 = [(MTBridgeSettingsViewController *)&v9 init];
  if (v2)
  {
    v3 = +[MTDBExtensionAccess sharedInstance];
    [v3 addObserver:v2];

    v4 = (NMBUISyncInfoController *)[objc_alloc((Class)NMBUISyncInfoController) initWithSyncInfoTarget:1];
    syncInfoController = v2->_syncInfoController;
    v2->_syncInfoController = v4;

    [(NMBUISyncInfoController *)v2->_syncInfoController setDataSource:v2];
    [(MTBridgeSettingsViewController *)v2 _createFRCs];
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_handleAccountDidChangeNotification:" name:NMBUIITunesAccountDidChangeNotification object:0];
    [v6 addObserver:v2 selector:"_handlePodcastsIdentifiersDidChangeNotification:" name:NMSMediaPinningManagerPodcastsIdentifiersDidChangeNotification object:0];
    [v6 addObserver:v2 selector:"_handleSyncInfoDidUpdateNotification:" name:NMBUIMediaSyncInfoDidUpdateNotification object:0];
    [v6 addObserver:v2 selector:"_handleApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
    [v6 addObserver:v2 selector:"_handleApplicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
    v7 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
    [v7 addObserver:v2 forKeyPath:kMTSyncSubscriptionsKey options:0 context:off_23220];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  [v3 removeObserver:self forKeyPath:kMTSyncSubscriptionsKey];

  v4.receiver = self;
  v4.super_class = (Class)MTBridgeSettingsViewController;
  [(MTBridgeSettingsViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)MTBridgeSettingsViewController;
  [(MTBridgeSettingsViewController *)&v5 viewDidLoad];
  v3 = +[NSBundle podcastsFoundationBundle];
  objc_super v4 = [v3 localizedStringForKey:@"PODCASTS_BRIDGE_TITLE" value:@"Podcasts" table:0];
  [(MTBridgeSettingsViewController *)self setTitle:v4];

  [(MTBridgeSettingsViewController *)self _configureHeaderIfNeeded];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MTBridgeSettingsViewController;
  [(MTBridgeSettingsViewController *)&v3 viewDidLayoutSubviews];
  [(MTBridgeSettingsViewController *)self _updateHeaderSize];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTBridgeSettingsViewController;
  [(MTBridgeSettingsViewController *)&v4 viewDidAppear:a3];
  [(MTBridgeSettingsViewController *)self _updateHeaderAndSyncProgress];
  [(NMBUISyncInfoController *)self->_syncInfoController beginObservingSyncInfo];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTBridgeSettingsViewController;
  [(MTBridgeSettingsViewController *)&v4 viewDidDisappear:a3];
  [(NMBUISyncInfoController *)self->_syncInfoController endObservingSyncInfo];
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  objc_super v3 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    v6 = +[NSMutableArray array];
    v7 = +[NMBUIAccountUtil sharedInstance];
    unsigned __int8 v8 = [v7 hasITunesAccount];

    if (v8)
    {
      objc_super v9 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
      unsigned __int8 v10 = [v9 BOOLForKey:kMTSyncSubscriptionsKey];

      if (v10)
      {
        v11 = +[MTDBExtensionAccess sharedInstance];
        unsigned __int8 v12 = [v11 isReady];

        if ((v12 & 1) == 0)
        {
          v42 = +[MTDBExtensionAccess sharedInstance];
          [v42 attemptToFix];

          v13 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
          +[NMBUIMediaTableCell defaultCellHeight];
          v43 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v13 setProperty:v43 forKey:PSTableCellHeightKey];

          [v6 addObject:v13];
          goto LABEL_11;
        }
        v13 = +[PSSpecifier groupSpecifierWithName:&stru_1CC00];
        v14 = +[MTBridgeUtilities localizedPodcastsDownloadsExplanation];
        uint64_t v15 = PSFooterTextGroupKey;
        [v13 setProperty:v14 forKey:PSFooterTextGroupKey];

        [v6 addObject:v13];
        v16 = +[MTBridgeUtilities localizedAddEpisodesString];
        v17 = +[PSSpecifier groupSpecifierWithID:@"StationsGroup" name:v16];

        [v6 addObject:v17];
        v18 = [(MTBridgeSettingsViewController *)self _upNextSpecifier];
        [v6 addObject:v18];

        v19 = [(MTBridgeSettingsViewController *)self _savedSpecifier];
        [v6 addObject:v19];

        v20 = [(MTBridgeSettingsViewController *)self _stationSpecifiers];
        [v6 addObjectsFromArray:v20];

        v21 = +[MTBridgeUtilities localizedChooseShowsString];
        v22 = +[PSSpecifier groupSpecifierWithID:@"ShowsGroup" name:v21];

        v23 = +[NSBundle podcastsFoundationBundle];
        v24 = [v23 localizedStringForKey:@"CHOOSE_SHOWS_GROUP_FOOTER" value:@"Your Apple Watch will try to download unplayed episodes for each show you add." table:0];
        [v22 setProperty:v24 forKey:v15];

        [v6 addObject:v22];
        v25 = [(MTBridgeSettingsViewController *)self _addShowsSpecifier];
        [v6 addObject:v25];

        v26 = [(MTBridgeSettingsViewController *)self _showSpecifiers];
        [v6 addObjectsFromArray:v26];

LABEL_10:
LABEL_11:

        v44.receiver = self;
        v44.super_class = (Class)MTBridgeSettingsViewController;
        v33 = [(MTBridgeSettingsViewController *)&v44 specifiers];
        v34 = v33;
        if (v33)
        {
          id v35 = v33;
        }
        else
        {
          id v35 = +[NSArray array];
        }
        v36 = v35;

        v37 = [v36 specifierForID:BPSMirrorGroupID];
        v38 = +[MTBridgeUtilities localizedNotificationsString];
        [v37 setName:v38];

        [v6 addObjectsFromArray:v36];
        id v39 = [v6 copy];
        v40 = *(void **)&self->BPSListController_opaque[v2];
        *(void *)&self->BPSListController_opaque[v2] = v39;

        id v4 = *(id *)&self->BPSListController_opaque[v2];
        goto LABEL_15;
      }
      v13 = +[PSSpecifier groupSpecifierWithID:@"SyncSubscriptions" name:0];
      v30 = +[MTBridgeUtilities localizedSettingsString];
      v17 = +[PSSpecifier preferenceSpecifierNamed:v30 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v17 setButtonAction:"_podcastsSettingsAction:"];
      *(void *)&v17[OBJC_IVAR___PSSpecifier_textFieldType] = 1;
      v31 = +[MTBridgeUtilities localizedSettingsMessage];
      [v13 setProperty:v31 forKey:PSFooterTextGroupKey];

      v45[0] = v13;
      v45[1] = v17;
      v29 = v45;
    }
    else
    {
      v13 = +[PSSpecifier groupSpecifierWithID:@"SignIn" name:0];
      v27 = +[MTBridgeUtilities localizedSignInString];
      v17 = +[PSSpecifier preferenceSpecifierNamed:v27 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v17 setButtonAction:"_signInAction:"];
      *(void *)&v17[OBJC_IVAR___PSSpecifier_textFieldType] = 1;
      v28 = +[MTBridgeUtilities localizedSignInMessage];
      [v13 setProperty:v28 forKey:PSFooterTextGroupKey];

      v46[0] = v13;
      v46[1] = v17;
      v29 = v46;
    }
    v32 = +[NSArray arrayWithObjects:v29 count:2];
    [v6 addObjectsFromArray:v32];

    goto LABEL_10;
  }
  id v4 = v3;
LABEL_15:

  return v4;
}

- (id)_upNextSpecifier
{
  objc_super v3 = +[MTBridgeUtilities localizedUpNextString];
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:"_upNextCellValueForSpecifier:" detail:0 cell:4 edit:0];

  [v4 setButtonAction:"_presentSettingsViewControllerForSpecifier:"];
  [v4 setProperty:&off_1DAB8 forKey:@"MTBCollectionTypeKey"];
  [v4 setProperty:objc_opt_class() forKey:PSCellClassKey];
  id v5 = objc_alloc_init((Class)NMBUIMediaTableCellConfiguration);
  uint64_t v6 = kNMSMediaSyncInfoUpNextIdentifier;
  [v5 setModelObject:kNMSMediaSyncInfoUpNextIdentifier];
  v7 = +[MTBridgeUtilities localizedUpNextString];
  [v5 setTitle:v7];

  [v5 setPlaceholderSystemImageName:@"play"];
  unsigned __int8 v8 = +[NMSMediaPinningManager sharedManager];
  objc_super v9 = [v8 podcastsUpNextDownloadSettings];
  unsigned int v10 = [v9 isEnabled];

  if (v10)
  {
    id v11 = [(NMBUISyncInfoController *)self->_syncInfoController downloadStateForModelObject:v6];
    [(NMBUISyncInfoController *)self->_syncInfoController progressForModelObject:v6];
    id v13 = [objc_alloc((Class)NMBUIMediaTableCellDownloadState) initWithState:v11 progress:v12];
    [v5 setDownloadState:v13];
  }
  [v4 setProperty:v5 forKey:NMBUISpecifierCellConfigurationKey];

  return v4;
}

- (id)_savedSpecifier
{
  objc_super v3 = +[MTBridgeUtilities localizedSavedString];
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:"_savedCellValueForSpecifier:" detail:0 cell:4 edit:0];

  [v4 setButtonAction:"_presentSettingsViewControllerForSpecifier:"];
  [v4 setProperty:&off_1DAD0 forKey:@"MTBCollectionTypeKey"];
  [v4 setProperty:objc_opt_class() forKey:PSCellClassKey];
  id v5 = objc_alloc_init((Class)NMBUIMediaTableCellConfiguration);
  uint64_t v6 = kNMSMediaSyncInfoSavedEpisodesIdentifier;
  [v5 setModelObject:kNMSMediaSyncInfoSavedEpisodesIdentifier];
  v7 = +[MTBridgeUtilities localizedSavedString];
  [v5 setTitle:v7];

  [v5 setPlaceholderSystemImageName:@"bookmark"];
  unsigned __int8 v8 = +[NMSMediaPinningManager sharedManager];
  objc_super v9 = [v8 podcastsSavedEpisodesDownloadSettings];
  unsigned int v10 = [v9 isEnabled];

  if (v10)
  {
    id v11 = [(NMBUISyncInfoController *)self->_syncInfoController downloadStateForModelObject:v6];
    [(NMBUISyncInfoController *)self->_syncInfoController progressForModelObject:v6];
    id v13 = [objc_alloc((Class)NMBUIMediaTableCellDownloadState) initWithState:v11 progress:v12];
    [v5 setDownloadState:v13];
  }
  [v4 setProperty:v5 forKey:NMBUISpecifierCellConfigurationKey];

  return v4;
}

- (id)_stationSpecifiers
{
  stationsFRC = self->_stationsFRC;
  id v41 = 0;
  unsigned __int8 v4 = [(MTFetchedResultsController *)stationsFRC performFetch:&v41];
  id v5 = v41;
  uint64_t v6 = v5;
  if (v4)
  {
    id v31 = v5;
    v7 = +[NSMutableArray array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = [(MTFetchedResultsController *)self->_stationsFRC fetchedObjects];
    id v36 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v38;
      uint64_t v34 = PSCellClassKey;
      uint64_t v33 = NMBUISpecifierCellConfigurationKey;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          objc_super v9 = v7;
          if (*(void *)v38 != v35) {
            objc_enumerationMutation(obj);
          }
          unsigned int v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v11 = [v10 title];
          float v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:"_stationCellValueForSpecifier:" detail:0 cell:4 edit:0];

          [v12 setButtonAction:"_presentSettingsViewControllerForSpecifier:"];
          [v12 setProperty:&off_1DAE8 forKey:@"MTBCollectionTypeKey"];
          [v12 setProperty:objc_opt_class() forKey:v34];
          id v13 = objc_alloc_init((Class)NMBUIMediaTableCellConfiguration);
          v14 = [v10 uuid];
          [v13 setModelObject:v14];

          uint64_t v15 = [v10 title];
          [v13 setTitle:v15];

          [v13 setPlaceholderSystemImageName:@"gearshape"];
          v16 = [v10 artworkCatalog];
          [v13 setArtworkCatalog:v16];

          v17 = +[NMSMediaPinningManager sharedManager];
          v18 = [v17 podcastsSelectedStationUUIDs];
          v19 = [v10 uuid];
          unsigned int v20 = [v18 containsObject:v19];

          if (v20)
          {
            syncInfoController = self->_syncInfoController;
            v22 = [v10 uuid];
            id v23 = [(NMBUISyncInfoController *)syncInfoController downloadStateForModelObject:v22];

            v24 = self->_syncInfoController;
            v25 = [v10 uuid];
            [(NMBUISyncInfoController *)v24 progressForModelObject:v25];
            double v27 = v26;

            id v28 = [objc_alloc((Class)NMBUIMediaTableCellDownloadState) initWithState:v23 progress:v27];
            [v13 setDownloadState:v28];
          }
          [v12 setProperty:v13 forKey:v33];
          v7 = v9;
          [v9 addObject:v12];
        }
        id v36 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v36);
    }

    id v29 = [v7 copy];
    uint64_t v6 = v31;
  }
  else
  {
    v7 = _MTLogCategoryBridge();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v44 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Could not fetch podcast stations: %@", buf, 0xCu);
    }
    id v29 = &__NSArray0__struct;
  }

  return v29;
}

- (id)_addShowsSpecifier
{
  objc_super v3 = +[NSBundle podcastsFoundationBundle];
  unsigned __int8 v4 = [v3 localizedStringForKey:@"ADD_SHOWS_TITLE" value:@"Add Shows…" table:0];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setButtonAction:"_addShowsAction:"];
  [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];
  id v6 = objc_alloc_init((Class)NMBUIMediaTableCellConfiguration);
  v7 = +[NSBundle podcastsFoundationBundle];
  unsigned __int8 v8 = [v7 localizedStringForKey:@"ADD_SHOWS_TITLE" value:@"Add Shows…" table:0];
  [v6 setTitle:v8];

  [v6 setPlaceholderSystemImageName:@"plus"];
  objc_super v9 = BPSBridgeTintColor();
  [v6 setPlaceholderIconColor:v9];

  [v5 setProperty:v6 forKey:NMBUISpecifierCellConfigurationKey];

  return v5;
}

- (id)_showSpecifiers
{
  showsFRC = self->_showsFRC;
  id v41 = 0;
  unsigned __int8 v4 = [(MTFetchedResultsController *)showsFRC performFetch:&v41];
  id v5 = v41;
  id v6 = v5;
  if (v4)
  {
    id v31 = v5;
    v7 = +[NSMutableArray array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = [(MTFetchedResultsController *)self->_showsFRC fetchedObjects];
    id v36 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v38;
      uint64_t v34 = PSCellClassKey;
      uint64_t v33 = NMBUISpecifierCellConfigurationKey;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          objc_super v9 = v7;
          if (*(void *)v38 != v35) {
            objc_enumerationMutation(obj);
          }
          unsigned int v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v11 = [v10 title];
          float v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:"_showCellValueForSpecifier:" detail:0 cell:4 edit:0];

          [v12 setButtonAction:"_presentSettingsViewControllerForSpecifier:"];
          [v12 setProperty:&off_1DB00 forKey:@"MTBCollectionTypeKey"];
          [v12 setProperty:objc_opt_class() forKey:v34];
          id v13 = objc_alloc_init((Class)NMBUIMediaTableCellConfiguration);
          v14 = [v10 feedURL];
          [v13 setModelObject:v14];

          uint64_t v15 = [v10 title];
          [v13 setTitle:v15];

          [v13 setPlaceholderSystemImageName:@"podcasts"];
          v16 = [v10 artworkCatalog];
          [v13 setArtworkCatalog:v16];

          v17 = +[NMSMediaPinningManager sharedManager];
          v18 = [v17 podcastsSelectedShowFeedURLs];
          v19 = [v10 feedURL];
          unsigned int v20 = [v18 containsObject:v19];

          if (v20)
          {
            syncInfoController = self->_syncInfoController;
            v22 = [v10 feedURL];
            id v23 = [(NMBUISyncInfoController *)syncInfoController downloadStateForModelObject:v22];

            v24 = self->_syncInfoController;
            v25 = [v10 feedURL];
            [(NMBUISyncInfoController *)v24 progressForModelObject:v25];
            double v27 = v26;

            id v28 = [objc_alloc((Class)NMBUIMediaTableCellDownloadState) initWithState:v23 progress:v27];
            [v13 setDownloadState:v28];
          }
          [v12 setProperty:v13 forKey:v33];
          v7 = v9;
          [v9 addObject:v12];
        }
        id v36 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v36);
    }

    id v29 = [v7 copy];
    id v6 = v31;
  }
  else
  {
    v7 = _MTLogCategoryBridge();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v44 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Could not fetch podcast shows: %@", buf, 0xCu);
    }
    id v29 = &__NSArray0__struct;
  }

  return v29;
}

- (id)_showsPredicate
{
  uint64_t v2 = +[MTPodcast predicateForSubscribedAndNotHidden];
  objc_super v3 = +[MTPodcast predicateForEntitledShows];
  unsigned __int8 v4 = [v2 AND:v3];
  id v5 = +[NSPredicate predicateWithFormat:@"%K != NULL", kPodcastTitle];
  id v6 = [v4 AND:v5];
  uint64_t v7 = kPodcastFeedUrl;
  unsigned __int8 v8 = +[NMSMediaPinningManager sharedManager];
  objc_super v9 = [v8 podcastsSelectedShowFeedURLs];
  unsigned int v10 = +[NSPredicate predicateWithFormat:@"%K IN %@", v7, v9];
  id v11 = [v6 AND:v10];

  return v11;
}

- (void)_createFRCs
{
  objc_super v3 = +[MTDBExtensionAccess sharedInstance];
  unsigned __int8 v4 = [v3 isReady];

  if (v4)
  {
    if (!self->_stationsFRC || !self->_showsFRC)
    {
      id v5 = +[NSFetchRequest fetchRequestWithEntityName:kMTPlaylistEntityName];
      id v6 = +[MTPlaylist topLevelPlaylistsPredicate];
      uint64_t v7 = kPlaylistTitle;
      unsigned __int8 v8 = +[NSPredicate predicateWithFormat:@"%K != NULL", kPlaylistTitle];
      objc_super v9 = [v6 AND:v8];
      [v5 setPredicate:v9];

      unsigned int v10 = +[MTPlaylist sortDescriptors];
      [v5 setSortDescriptors:v10];

      [v5 setFetchBatchSize:20];
      id v11 = objc_alloc((Class)MTFetchedResultsController);
      float v12 = +[MTDB sharedInstance];
      id v13 = [v12 mainQueueContext];
      v14 = (MTFetchedResultsController *)[v11 initWithFetchRequest:v5 managedObjectContext:v13 sectionNameKeyPath:0 cacheName:0];
      stationsFRC = self->_stationsFRC;
      self->_stationsFRC = v14;

      v32[0] = kPlaylistPodcasts;
      v32[1] = v7;
      v32[2] = kPlaylistUuid;
      v16 = +[NSArray arrayWithObjects:v32 count:3];
      [(MTFetchedResultsController *)self->_stationsFRC setPropertyKeys:v16];

      [(MTFetchedResultsController *)self->_stationsFRC setDelegate:self];
      v17 = +[NSFetchRequest fetchRequestWithEntityName:kMTPodcastEntityName];
      v18 = [(MTBridgeSettingsViewController *)self _showsPredicate];
      [v17 setPredicate:v18];

      v19 = +[MTPodcast sortDescriptorsForTitle:1];
      [v17 setSortDescriptors:v19];

      uint64_t v20 = kPodcastTitle;
      uint64_t v21 = kPodcastFeedUrl;
      v31[0] = kPodcastTitle;
      v31[1] = kPodcastFeedUrl;
      v31[2] = kPodcastUuid;
      v22 = +[NSArray arrayWithObjects:v31 count:3];
      [v17 setPropertiesToFetch:v22];

      [v17 setFetchBatchSize:20];
      id v23 = objc_alloc((Class)MTFetchedResultsController);
      v24 = +[MTDB sharedInstance];
      v25 = [v24 mainQueueContext];
      float v26 = (MTFetchedResultsController *)[v23 initWithFetchRequest:v17 managedObjectContext:v25 sectionNameKeyPath:0 cacheName:0];
      showsFRC = self->_showsFRC;
      self->_showsFRC = v26;

      v30[0] = kPodcastImageUrl;
      v30[1] = v20;
      v30[2] = v21;
      v30[3] = kPodcastUpdatedFeedUrl;
      id v28 = +[NSArray arrayWithObjects:v30 count:4];
      [(MTFetchedResultsController *)self->_showsFRC setPropertyKeys:v28];

      [(MTFetchedResultsController *)self->_showsFRC setDelegate:self];
    }
  }
  else
  {
    id v29 = +[MTDBExtensionAccess sharedInstance];
    [v29 attemptToFix];
  }
}

- (void)_reload
{
  objc_super v3 = [(MTBridgeSettingsViewController *)self _showsPredicate];
  unsigned __int8 v4 = [(MTFetchedResultsController *)self->_showsFRC fetchRequest];
  [v4 setPredicate:v3];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_71E8;
  v6[3] = &unk_1C8C0;
  v6[4] = self;
  id v5 = objc_retainBlock(v6);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v5[2])(v5);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (id)_contentHeaderViewTitle
{
  uint64_t v2 = [(NMBUISyncInfoController *)self->_syncInfoController syncInfo];
  id v3 = [v2 itemCount];

  if (v3) {
    +[MTBridgeUtilities localizedStringForEpisodeCount:v3];
  }
  else {
  unsigned __int8 v4 = +[MTBridgeUtilities localizedNoPodcastsString];
  }

  return v4;
}

- (id)_contentHeaderViewSubtitle
{
  id v3 = [(NMBUISyncInfoController *)self->_syncInfoController syncInfo];
  id v4 = [v3 itemCount];

  if (v4)
  {
    id v5 = [(NMBUISyncInfoController *)self->_syncInfoController syncStatusDetailText];
  }
  else
  {
    id v6 = +[NSBundle podcastsFoundationBundle];
    id v5 = [v6 localizedStringForKey:@"SYNC_SETTINGS_CONTENT_SUMMARY_HEADER_NOTHING_ADDED_MESSAGE_PODCASTS_SETTINGS_V2" value:@"You can choose the episodes and shows you want to automatically download to your Apple Watch." table:0];
  }

  return v5;
}

- (void)_configureHeaderIfNeeded
{
  if (![(MTBridgeSettingsViewController *)self isViewLoaded]) {
    return;
  }
  id v33 = [(MTBridgeSettingsViewController *)self table];
  id v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  if ([v3 BOOLForKey:kMTSyncSubscriptionsKey])
  {
    id v4 = +[NMBUIAccountUtil sharedInstance];
    unsigned __int8 v5 = [v4 hasITunesAccount];

    if (v5)
    {
      id v6 = +[NSMutableArray array];
      uint64_t v7 = [(NMBUISyncInfoController *)self->_syncInfoController syncInfo];
      unsigned __int8 v8 = [v7 hasItemsOverStorageLimit];

      if (v8)
      {
        id v9 = objc_alloc((Class)NMBUIAlertHeaderView);
        double x = CGRectZero.origin.x;
        double y = CGRectZero.origin.y;
        double width = CGRectZero.size.width;
        double height = CGRectZero.size.height;
        id v14 = objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
        uint64_t v15 = +[UIColor systemYellowColor];
        [v14 setTintColor:v15];

        v16 = +[MTBridgeUtilities localizedOutOfSpaceHeaderTitle];
        v17 = [v14 textLabel];
        [v17 setText:v16];

        v18 = +[MTBridgeUtilities localizedOutOfSpaceHeaderMessage];
        v19 = [v14 detailTextLabel];
        [v19 setText:v18];

        [v14 setPreservesSuperviewLayoutMargins:1];
        [v6 addObject:v14];
      }
      else
      {
        double x = CGRectZero.origin.x;
        double y = CGRectZero.origin.y;
        double width = CGRectZero.size.width;
        double height = CGRectZero.size.height;
      }
      id v20 = objc_msgSend(objc_alloc((Class)NMBUIContentHeaderView), "initWithFrame:", x, y, width, height);
      uint64_t v21 = [(MTBridgeSettingsViewController *)self _contentHeaderViewTitle];
      v22 = [v20 textLabel];
      [v22 setText:v21];

      id v23 = [(MTBridgeSettingsViewController *)self _contentHeaderViewSubtitle];
      v24 = [v20 detailTextLabel];
      [v24 setText:v23];

      [v20 setPreservesSuperviewLayoutMargins:1];
      v25 = [(NMBUISyncInfoController *)self->_syncInfoController syncInfo];
      if ([v25 itemCount])
      {
        float v26 = [(NMBUISyncInfoController *)self->_syncInfoController syncInfo];
        double v27 = (int *)[v26 status];

        if (v27 == &dword_4)
        {
LABEL_14:
          [v6 addObject:v20];
          id v32 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v6];
          [v32 setAxis:1];
          [v32 setPreservesSuperviewLayoutMargins:1];
          [v33 setTableHeaderView:v32];
          [(MTBridgeSettingsViewController *)self _updateHeaderSize];

          goto LABEL_15;
        }
        v25 = [(NMBUISyncInfoController *)self->_syncInfoController syncInfo];
        [v25 progress];
        int v29 = v28;
        v30 = [v20 progressView];
        LODWORD(v31) = v29;
        [v30 setProgress:v31];
      }
      goto LABEL_14;
    }
  }
  else
  {
  }
  [v33 setTableHeaderView:0];
LABEL_15:
}

- (void)_updateHeaderSize
{
  if ([(MTBridgeSettingsViewController *)self isViewLoaded])
  {
    id v3 = [(MTBridgeSettingsViewController *)self table];
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
    id v13 = [(MTBridgeSettingsViewController *)self table];
    [v13 setTableHeaderView:v14];
  }
}

- (void)_updateProgressIfNeeded
{
  id v3 = +[NMSMediaPinningManager sharedManager];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [(MTBridgeSettingsViewController *)self specifiers];
  id v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v41;
    uint64_t v37 = NMBUISpecifierCellConfigurationKey;
    uint64_t v33 = kNMSMediaSyncInfoSavedEpisodesIdentifier;
    uint64_t v32 = kNMSMediaSyncInfoUpNextIdentifier;
    v30 = self;
    do
    {
      id v4 = 0;
      do
      {
        if (*(void *)v41 != v38) {
          objc_enumerationMutation(obj);
        }
        double v5 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v4);
        double v6 = objc_msgSend(v5, "propertyForKey:", v37, v30);
        double v7 = [v6 modelObject];
        if (!v7) {
          goto LABEL_17;
        }
        double v8 = [v3 podcastsDownloadSettingsForShowFeedURL:v7];
        if ([v8 isEnabled]) {
          goto LABEL_10;
        }
        double v9 = v3;
        double v10 = [v3 podcastsDownloadSettingsForStationUUID:v7];
        if ([v10 isEnabled])
        {

          id v3 = v9;
LABEL_10:

          goto LABEL_11;
        }
        unsigned int v25 = [v7 isEqualToString:v33];
        if (v25)
        {
          uint64_t v35 = +[NMSMediaPinningManager sharedManager];
          uint64_t v34 = [v35 podcastsSavedEpisodesDownloadSettings];
          if ([v34 isEnabled])
          {
            char v26 = 1;
            goto LABEL_30;
          }
          if (([v7 isEqualToString:v32] & 1) == 0)
          {
            char v26 = 0;
LABEL_30:

            id v3 = v9;
            if ((v26 & 1) == 0) {
              goto LABEL_17;
            }
            goto LABEL_11;
          }
        }
        else if (([v7 isEqualToString:v32] & 1) == 0)
        {

          id v3 = v9;
          goto LABEL_16;
        }
        double v27 = +[NMSMediaPinningManager sharedManager];
        int v28 = [v27 podcastsUpNextDownloadSettings];
        unsigned __int8 v31 = [v28 isEnabled];

        if (v25)
        {
          self = v30;
          char v26 = v31;
          goto LABEL_30;
        }

        self = v30;
        id v3 = v9;
        if ((v31 & 1) == 0) {
          goto LABEL_17;
        }
LABEL_11:
        double v11 = [v6 downloadState];
        id v12 = [v11 state];

        id v13 = [v6 downloadState];
        [v13 progress];
        double v15 = v14;

        id v16 = [(NMBUISyncInfoController *)self->_syncInfoController downloadStateForModelObject:v7];
        [(NMBUISyncInfoController *)self->_syncInfoController progressForModelObject:v7];
        double v18 = v17;
        double v19 = vabdd_f64(v15, v17);
        if (v12 != v16 || v19 > 0.00000011920929)
        {
          uint64_t v21 = [(MTBridgeSettingsViewController *)self table];
          v22 = [(MTBridgeSettingsViewController *)self indexPathForSpecifier:v5];
          double v8 = [v21 cellForRowAtIndexPath:v22];

          id v23 = [v6 downloadState];
          [v23 setState:v16];

          v24 = [v6 downloadState];
          [v24 setProgress:v18];

          [v8 refreshCellContentsWithSpecifier:v5];
LABEL_16:
        }
LABEL_17:

        id v4 = (char *)v4 + 1;
      }
      while (v39 != v4);
      id v29 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      id v39 = v29;
    }
    while (v29);
  }
}

- (void)_updateHeaderAndSyncProgress
{
  if ([(MTBridgeSettingsViewController *)self isViewLoaded])
  {
    [(MTBridgeSettingsViewController *)self _configureHeaderIfNeeded];
    [(MTBridgeSettingsViewController *)self _updateProgressIfNeeded];
  }
}

- (void)_presentSettingsViewControllerForSpecifier:(id)a3
{
  uint64_t v4 = NMBUISpecifierCellConfigurationKey;
  id v5 = a3;
  id v13 = [v5 propertyForKey:v4];
  double v6 = [v5 propertyForKey:@"MTBCollectionTypeKey"];

  id v7 = [v6 unsignedIntegerValue];
  double v8 = [MTBridgeCollectionSettingsViewController alloc];
  double v9 = [v13 modelObject];
  double v10 = [(MTBridgeCollectionSettingsViewController *)v8 initWithCollectionType:v7 identifier:v9];

  double v11 = [v13 title];
  [(MTBridgeCollectionSettingsViewController *)v10 setTitle:v11];

  id v12 = [(MTBridgeSettingsViewController *)self navigationController];
  [v12 pushViewController:v10 animated:1];
}

+ (id)downloadCountFormatter
{
  if (qword_23380 != -1) {
    dispatch_once(&qword_23380, &stru_1C8E0);
  }
  uint64_t v2 = (void *)qword_23378;

  return v2;
}

- (id)_valueStringForDownloadSettings:(id)a3
{
  id v3 = a3;
  if ([v3 isEnabled])
  {
    uint64_t v4 = [(id)objc_opt_class() downloadCountFormatter];
    id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 numberOfEpisodes]);
    double v6 = [v4 stringFromNumber:v5];
  }
  else
  {
    double v6 = +[MTBridgeUtilities localizedOffString];
  }

  return v6;
}

- (id)_upNextCellValueForSpecifier:(id)a3
{
  uint64_t v4 = +[NMSMediaPinningManager sharedManager];
  id v5 = [v4 podcastsUpNextDownloadSettings];

  double v6 = [(MTBridgeSettingsViewController *)self _valueStringForDownloadSettings:v5];

  return v6;
}

- (id)_savedCellValueForSpecifier:(id)a3
{
  uint64_t v4 = +[NMSMediaPinningManager sharedManager];
  id v5 = [v4 podcastsSavedEpisodesDownloadSettings];

  double v6 = [(MTBridgeSettingsViewController *)self _valueStringForDownloadSettings:v5];

  return v6;
}

- (id)_stationCellValueForSpecifier:(id)a3
{
  uint64_t v4 = [a3 propertyForKey:NMBUISpecifierCellConfigurationKey];
  id v5 = +[NMSMediaPinningManager sharedManager];
  double v6 = [v4 modelObject];
  id v7 = [v5 podcastsDownloadSettingsForStationUUID:v6];

  double v8 = [(MTBridgeSettingsViewController *)self _valueStringForDownloadSettings:v7];

  return v8;
}

- (id)_showCellValueForSpecifier:(id)a3
{
  uint64_t v4 = [a3 propertyForKey:NMBUISpecifierCellConfigurationKey];
  id v5 = +[NMSMediaPinningManager sharedManager];
  double v6 = [v4 modelObject];
  id v7 = [v5 podcastsDownloadSettingsForShowFeedURL:v6];

  double v8 = [(MTBridgeSettingsViewController *)self _valueStringForDownloadSettings:v7];

  return v8;
}

- (void)_addShowsAction:(id)a3
{
  id v5 = objc_alloc_init(MTBridgeShowSelectionViewController);
  [(MTBridgeShowSelectionViewController *)v5 setDelegate:self];
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
  [(MTBridgeSettingsViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_signInAction:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=STORE_SERVICE"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)_podcastsSettingsAction:(id)a3
{
  id v4 = +[NSURL URLWithString:@"app-prefs:com.apple.podcasts"];
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (id)syncInfoController:(id)a3 containerIdentifierForModelObject:(id)a4
{
  id v4 = a4;

  return v4;
}

- (void)extensionAccessDidChange
{
  [(MTBridgeSettingsViewController *)self _createFRCs];
  id v3 = _MTLogCategoryBridge();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Reload for extensionAccessDidChange", v4, 2u);
  }

  [(MTBridgeSettingsViewController *)self _reload];
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = _MTLogCategoryBridge();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Reload for controllerDidChangeContent", v5, 2u);
  }

  [(MTBridgeSettingsViewController *)self _reload];
}

- (void)viewControllerDidSelectDone:(id)a3
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (off_23220 == a6)
  {
    id v12 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
    if (v12 == v11)
    {
      unsigned int v13 = [v10 isEqualToString:kMTSyncSubscriptionsKey];

      if (v13)
      {
        double v14 = _MTLogCategoryBridge();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Reload for KVO", buf, 2u);
        }

        [(MTBridgeSettingsViewController *)self _reload];
      }
    }
    else
    {
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MTBridgeSettingsViewController;
    [(MTBridgeSettingsViewController *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
  }
}

- (void)_handleAccountDidChangeNotification:(id)a3
{
  id v4 = _MTLogCategoryBridge();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Reload for _handleAccountDidChangeNotification", v5, 2u);
  }

  [(MTBridgeSettingsViewController *)self _reload];
}

- (void)_handlePodcastsIdentifiersDidChangeNotification:(id)a3
{
  id v4 = _MTLogCategoryBridge();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Reload for _handlePodcastsIdentifiersDidChangeNotification", v5, 2u);
  }

  [(MTBridgeSettingsViewController *)self _reload];
}

- (void)_handleSyncInfoDidUpdateNotification:(id)a3
{
  id v4 = [a3 object];
  syncInfoController = self->_syncInfoController;

  if (v4 == syncInfoController)
  {
    double v6 = _MTLogCategoryBridge();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Reload progress for _updateHeaderAndSyncProgress", v7, 2u);
    }

    [(MTBridgeSettingsViewController *)self _updateHeaderAndSyncProgress];
  }
}

- (void)_handleApplicationWillEnterForegroundNotification:(id)a3
{
}

- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showsFRC, 0);
  objc_storeStrong((id *)&self->_stationsFRC, 0);

  objc_storeStrong((id *)&self->_syncInfoController, 0);
}

@end