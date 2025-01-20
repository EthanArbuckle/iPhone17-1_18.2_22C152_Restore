@interface MTBMainVC
- (BOOL)_isOutOfSpace;
- (BOOL)_isPodcastWithFeedURLPinned:(id)a3;
- (BOOL)_isStationWithUUIDPinned:(id)a3;
- (BOOL)_legacyIsCharging;
- (BOOL)_shouldShowProgress;
- (BOOL)isWaitingForDatabaseSetup;
- (BOOL)suppressSendToNotificationCenterOption;
- (MTBMainVC)init;
- (NMBUISyncInfoController)syncInfoController;
- (NSCache)imageCache;
- (NSFetchedResultsController)availablePodcastStationsFetchedResultsController;
- (NSFetchedResultsController)availablePodcastsFetchedResultsController;
- (NSOrderedSet)cachedPinnedFeedURLs;
- (NSOrderedSet)cachedPinnedStationUUIDs;
- (PSSpecifier)podcastsSettingsSpecifier;
- (PSSpecifier)signInSpecifier;
- (PSSpecifier)syncCustomCellSpecifier;
- (PSSpecifier)syncGroupSpecifier;
- (PSSpecifier)syncUpNextCellSpecifier;
- (float)_contentHeaderViewProgress;
- (id)_cellImageWithSymbolName:(id)a3;
- (id)_contentHeaderViewSubtitle;
- (id)_contentHeaderViewTitle;
- (id)_localizedEpisodeDownloadExplanation;
- (id)_newLoadingSpecifier;
- (id)_placeholderPodcastsImage;
- (id)_podcastSpecifiers;
- (id)_podcastSwitchCellValueForSpecifier:(id)a3;
- (id)_savedAndStationSpecifiers;
- (id)_savedEpisodesSwitchCellValueForSpecifier:(id)a3;
- (id)_selfOrPresentedViewController;
- (id)_specifierForPodcast:(id)a3;
- (id)_specifierForSavedEpisodes;
- (id)_specifierForStation:(id)a3;
- (id)_stationSwitchCellValueForSpecifier:(id)a3;
- (id)_syncGroupSpecifiers;
- (id)applicationBundleIdentifier;
- (id)specifiers;
- (id)syncInfoController:(id)a3 containerIdentifierForModelObject:(id)a4;
- (unint64_t)_resolvedProgressViewStateForState:(unint64_t)a3;
- (void)_configureHeaderIfNeeded;
- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3;
- (void)_handleApplicationWillEnterForegroundNotification:(id)a3;
- (void)_handlePodcastsDidUpdateNotification;
- (void)_handlePodcastsIdentifiersDidChangeNotification:(id)a3;
- (void)_handleSyncInfoDidUpdateNotification:(id)a3;
- (void)_launchPodcasts;
- (void)_podcastsSettingsAction:(id)a3;
- (void)_reload;
- (void)_setPodcastSwitchCell:(id)a3 specifier:(id)a4;
- (void)_setPodcastsAreUserSet:(BOOL)a3;
- (void)_setSavedEpisodesSwitchCell:(id)a3 specifier:(id)a4;
- (void)_setStationSwitchCell:(id)a3 specifier:(id)a4;
- (void)_showSyncStorageWarning;
- (void)_signInAction:(id)a3;
- (void)_updateHeaderAndSyncProgress;
- (void)_updateProgressIfNeeded;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAvailablePodcastStationsFetchedResultsController:(id)a3;
- (void)setAvailablePodcastsFetchedResultsController:(id)a3;
- (void)setCachedPinnedFeedURLs:(id)a3;
- (void)setCachedPinnedStationUUIDs:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setPodcastsSettingsSpecifier:(id)a3;
- (void)setSignInSpecifier:(id)a3;
- (void)setSyncCustomCellSpecifier:(id)a3;
- (void)setSyncGroupSpecifier:(id)a3;
- (void)setSyncInfoController:(id)a3;
- (void)setSyncUpNextCellSpecifier:(id)a3;
- (void)setWaitingForDatabaseSetup:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTBMainVC

- (MTBMainVC)init
{
  v17.receiver = self;
  v17.super_class = (Class)MTBMainVC;
  v2 = [(MTBMainVC *)&v17 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    imageCache = v2->_imageCache;
    v2->_imageCache = v3;

    v2->_waitingForDatabaseSetup = +[MTDB canExtensionOpenDatabase] ^ 1;
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_handleAccountDidChangeNotification:" name:NMBUIITunesAccountDidChangeNotification object:0];
    [v5 addObserver:v2 selector:"_handlePodcastsIdentifiersDidChangeNotification:" name:NMSMediaPinningManagerPodcastsIdentifiersDidChangeNotification object:0];
    v6 = +[NRPairedDeviceRegistry sharedInstance];
    v7 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v8 = [v6 getAllDevicesWithArchivedAltAccountDevicesMatching:v7];
    v9 = [v8 firstObject];
    id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2E9A45BB-4F07-4D6B-9B65-41933EED0DCA"];
    unsigned int v11 = [v9 supportsCapability:v10];

    if (v11)
    {
      [v5 addObserver:v2 selector:"_handleSyncInfoDidUpdateNotification:" name:NMBUIMediaSyncInfoDidUpdateNotification object:0];
      [v5 addObserver:v2 selector:"_handleApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
      [v5 addObserver:v2 selector:"_handleApplicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
    }
    else
    {
      [v5 addObserver:v2 selector:"_handlePreferencesDidChangeNotification:" name:NMSyncPreferencesDidChangeRemotelyNotification object:0];
      uint64_t v12 = NMSSyncManagerSyncStateDidChangeNotification;
      v13 = +[NMSSyncManager sharedManager];
      [v5 addObserver:v2 selector:"_handleSyncStateDidChangeNotification:" name:v12 object:v13];
    }
    v14 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
    [v14 addObserver:v2 forKeyPath:kMTSyncSubscriptionsKey options:0 context:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_B870, @"com.apple.podcasts.podcastsDidUpdate", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  [v4 removeObserver:self forKeyPath:kMTSyncSubscriptionsKey];

  v5.receiver = self;
  v5.super_class = (Class)MTBMainVC;
  [(MTBMainVC *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MTBMainVC;
  [(MTBMainVC *)&v3 viewDidLoad];
  [(MTBMainVC *)self _configureHeaderIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTBMainVC;
  [(MTBMainVC *)&v5 viewWillAppear:a3];
  v4 = [(MTBMainVC *)self syncInfoController];
  [v4 beginObservingSyncInfo];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MTBMainVC;
  [(MTBMainVC *)&v11 viewDidAppear:a3];
  v4 = +[NRPairedDeviceRegistry sharedInstance];
  objc_super v5 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
  v7 = [v6 firstObject];
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2E9A45BB-4F07-4D6B-9B65-41933EED0DCA"];
  unsigned __int8 v9 = [v7 supportsCapability:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = +[NMSSyncManager sharedManager];
    [v10 beginReceivingSyncProgressUpdates];
  }
  [(MTBMainVC *)self _updateHeaderAndSyncProgress];
  if ((byte_23388 & 1) == 0)
  {
    [(MTBMainVC *)self _launchPodcasts];
    byte_23388 = 1;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTBMainVC;
  [(MTBMainVC *)&v5 viewDidDisappear:a3];
  v4 = [(MTBMainVC *)self syncInfoController];
  [v4 endObservingSyncInfo];
}

- (NMBUISyncInfoController)syncInfoController
{
  objc_super v3 = +[NRPairedDeviceRegistry sharedInstance];
  v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  objc_super v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2E9A45BB-4F07-4D6B-9B65-41933EED0DCA"];
  if ([v6 supportsCapability:v7])
  {
    syncInfoController = self->_syncInfoController;

    if (!syncInfoController)
    {
      id v9 = [objc_alloc((Class)NMBUISyncInfoController) initWithSyncInfoTarget:1];
      [v9 setDataSource:self];
      id v10 = self->_syncInfoController;
      self->_syncInfoController = (NMBUISyncInfoController *)v9;
    }
  }
  else
  {
  }
  objc_super v11 = self->_syncInfoController;

  return v11;
}

- (NSOrderedSet)cachedPinnedFeedURLs
{
  cachedPinnedFeedURLs = self->_cachedPinnedFeedURLs;
  if (!cachedPinnedFeedURLs)
  {
    v4 = +[NMSMediaPinningManager sharedManager];
    objc_super v5 = [v4 podcastFeedURLs];
    v6 = +[NSOrderedSet orderedSetWithArray:v5];
    id v7 = self->_cachedPinnedFeedURLs;
    self->_cachedPinnedFeedURLs = v6;

    cachedPinnedFeedURLs = self->_cachedPinnedFeedURLs;
  }

  return cachedPinnedFeedURLs;
}

- (NSOrderedSet)cachedPinnedStationUUIDs
{
  cachedPinnedStationUUIDs = self->_cachedPinnedStationUUIDs;
  if (!cachedPinnedStationUUIDs)
  {
    v4 = +[NMSMediaPinningManager sharedManager];
    objc_super v5 = [v4 podcastStationUUIDs];
    v6 = +[NSOrderedSet orderedSetWithArray:v5];
    id v7 = self->_cachedPinnedStationUUIDs;
    self->_cachedPinnedStationUUIDs = v6;

    cachedPinnedStationUUIDs = self->_cachedPinnedStationUUIDs;
  }

  return cachedPinnedStationUUIDs;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = +[NSMutableArray array];
    v6 = +[NMBUIAccountUtil sharedInstance];
    unsigned __int8 v7 = [v6 hasITunesAccount];

    if (v7)
    {
      id v8 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
      unsigned __int8 v9 = [v8 BOOLForKey:kMTSyncSubscriptionsKey];

      if (v9)
      {
        id v10 = +[PSSpecifier groupSpecifierWithName:&stru_1CC00];
        objc_super v11 = +[MTBridgeUtilities localizedPodcastsDownloadsExplanation];
        [v10 setProperty:v11 forKey:PSFooterTextGroupKey];

        [v5 addObject:v10];
        uint64_t v12 = [(MTBMainVC *)self _syncGroupSpecifiers];
        [v5 addObjectsFromArray:v12];

        v13 = +[NMSMediaPinningManager sharedManager];
        unsigned int v14 = [v13 pinnedPodcastsAreUserSet];

        if (!v14)
        {
LABEL_10:

          v30.receiver = self;
          v30.super_class = (Class)MTBMainVC;
          v21 = [(MTBMainVC *)&v30 specifiers];
          v22 = v21;
          if (v21)
          {
            id v23 = v21;
          }
          else
          {
            id v23 = +[NSArray array];
          }
          v24 = v23;

          v25 = [v24 specifierForID:BPSMirrorGroupID];
          v26 = +[MTBridgeUtilities localizedNotificationsString];
          [v25 setName:v26];

          [v5 addObjectsFromArray:v24];
          uint64_t v27 = +[NSArray arrayWithArray:v5];
          v28 = *(void **)&self->BPSNotificationAppController_opaque[v3];
          *(void *)&self->BPSNotificationAppController_opaque[v3] = v27;

          v4 = *(void **)&self->BPSNotificationAppController_opaque[v3];
          goto LABEL_14;
        }
        v15 = [(MTBMainVC *)self _savedAndStationSpecifiers];
        [v5 addObjectsFromArray:v15];

        v16 = [(MTBMainVC *)self _podcastSpecifiers];
        [v5 addObjectsFromArray:v16];
LABEL_9:

        goto LABEL_10;
      }
      id v10 = +[PSSpecifier groupSpecifierWithID:@"NMTSignIntoITunesGroupSpecifierID" name:0];
      v19 = +[MTBridgeUtilities localizedSettingsMessage];
      [v10 setProperty:v19 forKey:PSFooterTextGroupKey];

      v31[0] = v10;
      v16 = [(MTBMainVC *)self podcastsSettingsSpecifier];
      v31[1] = v16;
      v18 = v31;
    }
    else
    {
      id v10 = +[PSSpecifier groupSpecifierWithID:@"NMTSignIntoITunesGroupSpecifierID" name:0];
      objc_super v17 = +[MTBridgeUtilities localizedSignInMessage];
      [v10 setProperty:v17 forKey:PSFooterTextGroupKey];

      v32[0] = v10;
      v16 = [(MTBMainVC *)self signInSpecifier];
      v32[1] = v16;
      v18 = v32;
    }
    v20 = +[NSArray arrayWithObjects:v18 count:2];
    [v5 addObjectsFromArray:v20];

    goto LABEL_9;
  }
LABEL_14:

  return v4;
}

- (id)applicationBundleIdentifier
{
  return kMTApplicationBundleIdentifier;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (void)_setPodcastsAreUserSet:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[NMSMediaPinningManager sharedManager];
  unsigned int v6 = [v5 pinnedPodcastsAreUserSet];

  if (v6 != v3)
  {
    unsigned __int8 v7 = +[NMSMediaPinningManager sharedManager];
    [v7 setPinnedPodcastsAreUserSet:v3];

    syncGroupSpecifier = self->_syncGroupSpecifier;
    if (v3)
    {
      unsigned __int8 v9 = [(MTBMainVC *)self _localizedEpisodeDownloadExplanation];
      [(PSSpecifier *)syncGroupSpecifier setProperty:v9 forKey:PSFooterTextGroupKey];

      [(MTBMainVC *)self reloadSpecifier:self->_syncGroupSpecifier];
      id v10 = [(MTBMainVC *)self _savedAndStationSpecifiers];
      objc_super v11 = [(MTBMainVC *)self _podcastSpecifiers];
      id v14 = [v10 arrayByAddingObjectsFromArray:v11];

      [(MTBMainVC *)self insertContiguousSpecifiers:v14 afterSpecifierID:@"NMTSyncCustomCellSpecifierID" animated:1];
    }
    else
    {
      uint64_t v12 = +[NSBundle podcastsFoundationBundle];
      v13 = [v12 localizedStringForKey:@"UP_NEXT_FOOTER_STRING" value:@"Your iPhone will try to add one episode from each of the top 10 shows in Up Next." table:0];
      [(PSSpecifier *)syncGroupSpecifier setProperty:v13 forKey:PSFooterTextGroupKey];

      [(MTBMainVC *)self reloadSpecifier:self->_syncGroupSpecifier];
      [(MTBMainVC *)self removeSpecifierID:@"NMTPodcastsGroupSpecifierID" animated:1];
      [(MTBMainVC *)self removeSpecifierID:@"NMTPodcastStationsGroupSpecifierID" animated:1];
    }
  }
}

- (id)_syncGroupSpecifiers
{
  p_syncUpNextCellSpecifier = &self->_syncUpNextCellSpecifier;
  if (!self->_syncUpNextCellSpecifier)
  {
    v4 = +[MTBridgeUtilities localizedUpNextString];
    objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v5 setIdentifier:@"NMTSyncUpNextCellSpecifierID"];
    unsigned int v6 = *p_syncUpNextCellSpecifier;
    *p_syncUpNextCellSpecifier = (PSSpecifier *)v5;
  }
  p_syncCustomCellSpecifier = &self->_syncCustomCellSpecifier;
  if (!self->_syncCustomCellSpecifier)
  {
    id v8 = +[NSBundle podcastsFoundationBundle];
    unsigned __int8 v9 = [v8 localizedStringForKey:@"CUSTOM_CELL_STRING" value:@"Custom" table:0];
    id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v10 setIdentifier:@"NMTSyncCustomCellSpecifierID"];
    objc_super v11 = *p_syncCustomCellSpecifier;
    *p_syncCustomCellSpecifier = (PSSpecifier *)v10;
  }
  syncGroupSpecifier = self->_syncGroupSpecifier;
  if (!syncGroupSpecifier)
  {
    v13 = +[MTBridgeUtilities localizedAddEpisodesString];
    id v14 = +[PSSpecifier groupSpecifierWithID:@"NMTSyncGroupSpecifierID" name:v13];

    [v14 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v15 = +[NMSMediaPinningManager sharedManager];
    unsigned __int8 v16 = [v15 pinnedPodcastsAreUserSet];

    if (v16)
    {
      objc_super v17 = [(MTBMainVC *)self _localizedEpisodeDownloadExplanation];
      [v14 setProperty:v17 forKey:PSFooterTextGroupKey];
      v18 = &self->_syncCustomCellSpecifier;
    }
    else
    {
      objc_super v17 = +[NSBundle podcastsFoundationBundle];
      v19 = [v17 localizedStringForKey:@"UP_NEXT_FOOTER_STRING" value:@"Your iPhone will try to add one episode from each of the top 10 shows in Up Next." table:0];
      [v14 setProperty:v19 forKey:PSFooterTextGroupKey];

      v18 = p_syncUpNextCellSpecifier;
    }

    [v14 setProperty:*v18 forKey:PSRadioGroupCheckedSpecifierKey];
    v20 = self->_syncGroupSpecifier;
    self->_syncGroupSpecifier = (PSSpecifier *)v14;

    syncGroupSpecifier = self->_syncGroupSpecifier;
  }
  v21 = *p_syncUpNextCellSpecifier;
  v24[0] = syncGroupSpecifier;
  v24[1] = v21;
  v24[2] = *p_syncCustomCellSpecifier;
  v22 = +[NSArray arrayWithObjects:v24 count:3];

  return v22;
}

- (PSSpecifier)signInSpecifier
{
  signInSpecifier = self->_signInSpecifier;
  if (!signInSpecifier)
  {
    v4 = +[MTBridgeUtilities localizedSignInString];
    objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];
    unsigned int v6 = self->_signInSpecifier;
    self->_signInSpecifier = v5;

    [(PSSpecifier *)self->_signInSpecifier setButtonAction:"_signInAction:"];
    *(void *)((char *)self->_signInSpecifier + OBJC_IVAR___PSSpecifier_textFieldType) = 1;
    signInSpecifier = self->_signInSpecifier;
  }

  return signInSpecifier;
}

- (void)_signInAction:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=STORE_SERVICE"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (PSSpecifier)podcastsSettingsSpecifier
{
  podcastsSettingsSpecifier = self->_podcastsSettingsSpecifier;
  if (!podcastsSettingsSpecifier)
  {
    id v4 = +[MTBridgeUtilities localizedSettingsString];
    objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];
    unsigned int v6 = self->_podcastsSettingsSpecifier;
    self->_podcastsSettingsSpecifier = v5;

    [(PSSpecifier *)self->_podcastsSettingsSpecifier setButtonAction:"_podcastsSettingsAction:"];
    *(void *)((char *)self->_podcastsSettingsSpecifier + OBJC_IVAR___PSSpecifier_textFieldType) = 1;
    podcastsSettingsSpecifier = self->_podcastsSettingsSpecifier;
  }

  return podcastsSettingsSpecifier;
}

- (BOOL)_isPodcastWithFeedURLPinned:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MTBMainVC *)self cachedPinnedFeedURLs];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)_isStationWithUUIDPinned:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MTBMainVC *)self cachedPinnedStationUUIDs];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)_podcastsSettingsAction:(id)a3
{
  id v4 = +[NSURL URLWithString:@"app-prefs:com.apple.podcasts"];
  BOOL v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (id)_newLoadingSpecifier
{
  v2 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
  +[NMBUIMediaTableCell defaultCellHeight];
  BOOL v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v2 setProperty:v3 forKey:PSTableCellHeightKey];

  return v2;
}

- (void)_setPodcastSwitchCell:(id)a3 specifier:(id)a4
{
  uint64_t v5 = NMBUISpecifierModelObjectKey;
  id v6 = a3;
  id v9 = [a4 propertyForKey:v5];
  LODWORD(v5) = [v6 BOOLValue];

  unsigned __int8 v7 = +[NMSMediaPinningManager sharedManager];
  id v8 = v7;
  if (v5) {
    [v7 pinPodcastWithFeedURL:v9];
  }
  else {
    [v7 unpinPodcastWithFeedURL:v9];
  }
}

- (id)_podcastSwitchCellValueForSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:NMBUISpecifierModelObjectKey];
  uint64_t v5 = +[NSNumber numberWithBool:[(MTBMainVC *)self _isPodcastWithFeedURLPinned:v4]];

  return v5;
}

- (void)_setSavedEpisodesSwitchCell:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[NMSMediaPinningManager sharedManager];
  [v5 setSavedEpisodesEnabled:v4];
}

- (id)_savedEpisodesSwitchCellValueForSpecifier:(id)a3
{
  BOOL v3 = +[NMSMediaPinningManager sharedManager];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 savedEpisodesEnabled]);

  return v4;
}

- (void)_setStationSwitchCell:(id)a3 specifier:(id)a4
{
  uint64_t v5 = NMBUISpecifierModelObjectKey;
  id v6 = a3;
  id v9 = [a4 propertyForKey:v5];
  LODWORD(v5) = [v6 BOOLValue];

  unsigned __int8 v7 = +[NMSMediaPinningManager sharedManager];
  id v8 = v7;
  if (v5) {
    [v7 pinPodcastStationWithUUID:v9];
  }
  else {
    [v7 unpinPodcastStationWithUUID:v9];
  }
}

- (id)_stationSwitchCellValueForSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:NMBUISpecifierModelObjectKey];
  uint64_t v5 = +[NSNumber numberWithBool:[(MTBMainVC *)self _isStationWithUUIDPinned:v4]];

  return v5;
}

- (id)syncInfoController:(id)a3 containerIdentifierForModelObject:(id)a4
{
  id v4 = a4;

  return v4;
}

- (NSFetchedResultsController)availablePodcastsFetchedResultsController
{
  if (!self->_availablePodcastsFetchedResultsController)
  {
    if (+[MTDB canExtensionOpenDatabase])
    {
      BOOL v3 = +[NSFetchRequest fetchRequestWithEntityName:kMTPodcastEntityName];
      id v4 = +[MTPodcast predicateForSubscribedAndNotHidden];
      uint64_t v5 = +[MTPodcast predicateForEntitledShows];
      id v6 = [v4 AND:v5];
      uint64_t v7 = kPodcastTitle;
      id v8 = +[NSPredicate predicateWithFormat:@"%K != NULL", kPodcastTitle];
      id v9 = [v6 AND:v8];
      [v3 setPredicate:v9];

      id v10 = +[MTPodcast sortDescriptorsForTitle:1];
      [v3 setSortDescriptors:v10];

      v25[0] = v7;
      v25[1] = kPodcastFeedUrl;
      v25[2] = kPodcastUuid;
      objc_super v11 = +[NSArray arrayWithObjects:v25 count:3];
      [v3 setPropertiesToFetch:v11];

      [v3 setFetchBatchSize:20];
      id v12 = objc_alloc((Class)NSFetchedResultsController);
      v13 = +[MTDB sharedInstance];
      uint64_t v14 = [v13 mainQueueContext];
      v15 = (NSFetchedResultsController *)[v12 initWithFetchRequest:v3 managedObjectContext:v14 sectionNameKeyPath:0 cacheName:0];

      id v22 = 0;
      LOBYTE(v14) = [(NSFetchedResultsController *)v15 performFetch:&v22];
      id v16 = v22;
      if ((v14 & 1) == 0)
      {
        objc_super v17 = _MTLogCategoryBridge();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v16;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "Could not fetch podcasts: %@", buf, 0xCu);
        }
      }
      availablePodcastsFetchedResultsController = self->_availablePodcastsFetchedResultsController;
      self->_availablePodcastsFetchedResultsController = v15;
      v19 = v15;
    }
    else
    {
      self->_waitingForDatabaseSetup = 1;
      BOOL v3 = _MTLogCategoryBridge();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "Failed to fetch available podcasts because database not ready yet!", buf, 2u);
      }
    }
  }
  v20 = self->_availablePodcastsFetchedResultsController;

  return v20;
}

- (NSFetchedResultsController)availablePodcastStationsFetchedResultsController
{
  if (!self->_availablePodcastStationsFetchedResultsController)
  {
    if (+[MTDB canExtensionOpenDatabase])
    {
      BOOL v3 = +[NSFetchRequest fetchRequestWithEntityName:kMTPlaylistEntityName];
      id v4 = +[MTPlaylist topLevelPlaylistsPredicate];
      uint64_t v5 = +[NSPredicate predicateWithFormat:@"%K != NULL", kPlaylistTitle];
      id v6 = [v4 AND:v5];
      [v3 setPredicate:v6];

      uint64_t v7 = +[MTPlaylist sortDescriptors];
      [v3 setSortDescriptors:v7];

      [v3 setFetchBatchSize:20];
      id v8 = +[MTDB sharedInstance];
      id v9 = [v8 mainQueueContext];

      id v10 = (NSFetchedResultsController *)[objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v3 managedObjectContext:v9 sectionNameKeyPath:0 cacheName:0];
      id v18 = 0;
      unsigned __int8 v11 = [(NSFetchedResultsController *)v10 performFetch:&v18];
      id v12 = v18;
      if ((v11 & 1) == 0)
      {
        v13 = _MTLogCategoryBridge();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v12;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Could not fetch podcast stations: %@", buf, 0xCu);
        }
      }
      availablePodcastStationsFetchedResultsController = self->_availablePodcastStationsFetchedResultsController;
      self->_availablePodcastStationsFetchedResultsController = v10;
      v15 = v10;
    }
    else
    {
      self->_waitingForDatabaseSetup = 1;
      BOOL v3 = _MTLogCategoryBridge();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "Failed to fetch available podcast stations because database not ready yet!", buf, 2u);
      }
    }
  }
  id v16 = self->_availablePodcastStationsFetchedResultsController;

  return v16;
}

- (void)_handlePodcastsIdentifiersDidChangeNotification:(id)a3
{
  cachedPinnedFeedURLs = self->_cachedPinnedFeedURLs;
  self->_cachedPinnedFeedURLs = 0;

  cachedPinnedStationUUIDs = self->_cachedPinnedStationUUIDs;
  self->_cachedPinnedStationUUIDs = 0;

  [(MTBMainVC *)self _reload];
}

- (void)_handleSyncInfoDidUpdateNotification:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = [(MTBMainVC *)self syncInfoController];

  if (v4 == v5)
  {
    [(MTBMainVC *)self _updateHeaderAndSyncProgress];
  }
  else
  {
    id v6 = _MTLogCategoryBridge();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Ignoring media sync info update from a different syncInfoController.", v7, 2u);
    }
  }
}

- (void)_handleApplicationWillEnterForegroundNotification:(id)a3
{
  id v3 = [(MTBMainVC *)self syncInfoController];
  [v3 beginObservingSyncInfo];
}

- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3
{
  id v3 = [(MTBMainVC *)self syncInfoController];
  [v3 endObservingSyncInfo];
}

- (void)_handlePodcastsDidUpdateNotification
{
  [(MTBMainVC *)self setWaitingForDatabaseSetup:0];
  id v3 = [(MTBMainVC *)self availablePodcastsFetchedResultsController];
  [v3 performFetch:0];

  id v4 = [(MTBMainVC *)self availablePodcastStationsFetchedResultsController];
  [v4 performFetch:0];

  [(MTBMainVC *)self _reload];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  if (v13 != v11)
  {

LABEL_5:
    v15.receiver = self;
    v15.super_class = (Class)MTBMainVC;
    [(MTBMainVC *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_6;
  }
  unsigned int v14 = [v10 isEqualToString:kMTSyncSubscriptionsKey];

  if (!v14) {
    goto LABEL_5;
  }
  [(MTBMainVC *)self _reload];
LABEL_6:
}

- (id)_contentHeaderViewTitle
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint64_t v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  id v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C7C06707-D0C2-405E-AFB4-7F215413B262"];
  unsigned int v8 = [v6 supportsCapability:v7];

  if (!v8)
  {
    id v13 = +[NMSMediaPinningManager sharedManager];
    unsigned int v14 = [v13 podcastFeedURLs];
    id v15 = [v14 count];

    id v16 = +[NMSMediaPinningManager sharedManager];
    objc_super v17 = [v16 podcastStationUUIDs];
    id v18 = [v17 count];

    if (v15 && v18)
    {
      v19 = +[NSBundle podcastsFoundationBundle];
      id v20 = [v19 localizedStringForKey:@"SYNC_SETTINGS_CONTENT_SUMMARY_HEADER_SHOWS_STATIONS" value:&stru_1CC00 table:0];
      v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v15, v18);

      goto LABEL_14;
    }
    if (v15)
    {
      id v22 = +[NSBundle podcastsFoundationBundle];
      id v23 = [v22 localizedStringForKey:@"SYNC_SETTINGS_CONTENT_SUMMARY_HEADER_SHOWS" value:&stru_1CC00 table:0];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, v15);
    }
    else
    {
      if (!v18) {
        goto LABEL_12;
      }
      id v22 = +[NSBundle podcastsFoundationBundle];
      id v23 = [v22 localizedStringForKey:@"SYNC_SETTINGS_CONTENT_SUMMARY_HEADER_STATIONS" value:&stru_1CC00 table:0];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, v18);
    v21 = };

    goto LABEL_14;
  }
  id v9 = [(MTBMainVC *)self syncInfoController];
  id v10 = [v9 syncInfo];
  id v11 = [v10 itemCount];

  if (!v11)
  {
LABEL_12:
    uint64_t v12 = +[MTBridgeUtilities localizedNoPodcastsString];
    goto LABEL_13;
  }
  uint64_t v12 = +[MTBridgeUtilities localizedStringForEpisodeCount:v11];
LABEL_13:
  v21 = (void *)v12;
LABEL_14:

  return v21;
}

- (id)_contentHeaderViewSubtitle
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint64_t v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  id v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C7C06707-D0C2-405E-AFB4-7F215413B262"];
  unsigned int v8 = [v6 supportsCapability:v7];

  if (!v8)
  {
    id v16 = +[NMSMediaPinningManager sharedManager];
    objc_super v17 = [v16 podcastFeedURLs];
    if (![v17 count])
    {
      id v18 = +[NMSMediaPinningManager sharedManager];
      v19 = [v18 podcastStationUUIDs];
      if (![v19 count])
      {
        objc_super v30 = +[NMSMediaPinningManager sharedManager];
        unsigned __int8 v31 = [v30 savedEpisodesEnabled];

        if ((v31 & 1) == 0) {
          goto LABEL_3;
        }
        goto LABEL_8;
      }
    }
    goto LABEL_8;
  }
  id v9 = [(MTBMainVC *)self syncInfoController];
  id v10 = [v9 syncInfo];
  id v11 = [v10 itemCount];

  if (!v11)
  {
LABEL_3:
    uint64_t v12 = +[NSBundle podcastsFoundationBundle];
    id v13 = v12;
    CFStringRef v14 = @"SYNC_SETTINGS_CONTENT_SUMMARY_HEADER_NOTHING_ADDED_MESSAGE";
    CFStringRef v15 = @"You can choose to automatically keep your Up Next episodes up-to-date on your Apple Watch, or manually add shows and stations from your iPhone.";
LABEL_13:
    uint64_t v26 = [v12 localizedStringForKey:v14 value:v15 table:0];
    goto LABEL_14;
  }
LABEL_8:
  id v20 = +[NRPairedDeviceRegistry sharedInstance];
  v21 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v22 = [v20 getAllDevicesWithArchivedAltAccountDevicesMatching:v21];
  id v23 = [v22 firstObject];
  id v24 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2E9A45BB-4F07-4D6B-9B65-41933EED0DCA"];
  unsigned int v25 = [v23 supportsCapability:v24];

  if (!v25)
  {
    if ([(MTBMainVC *)self _legacyIsCharging])
    {
      id v13 = +[NMSSyncManager sharedManager];
      uint64_t v27 = [v13 podcastsProgressInfo];
      v28 = [v27 _trackProgressTextForMediaType:4];

      goto LABEL_15;
    }
    uint64_t v12 = +[NSBundle podcastsFoundationBundle];
    id v13 = v12;
    CFStringRef v14 = @"SYNC_SETTINGS_OFF_PUCK_HEADER_MESSAGE";
    CFStringRef v15 = @"Podcasts download when Apple Watch is charging";
    goto LABEL_13;
  }
  id v13 = [(MTBMainVC *)self syncInfoController];
  uint64_t v26 = [v13 syncStatusDetailText];
LABEL_14:
  v28 = (void *)v26;
LABEL_15:

  return v28;
}

- (float)_contentHeaderViewProgress
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint64_t v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  id v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2E9A45BB-4F07-4D6B-9B65-41933EED0DCA"];
  unsigned int v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    id v9 = [(MTBMainVC *)self syncInfoController];
    id v10 = [v9 syncInfo];
    [v10 progress];
  }
  else
  {
    id v9 = +[NMSSyncManager sharedManager];
    id v10 = [v9 podcastsProgressInfo];
    [v10 estimatedSyncProgress];
  }
  float v12 = v11;

  return v12;
}

- (BOOL)_isOutOfSpace
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint64_t v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  id v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2E9A45BB-4F07-4D6B-9B65-41933EED0DCA"];
  unsigned int v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    id v9 = [(MTBMainVC *)self syncInfoController];
    id v10 = [v9 syncInfo];
    unsigned __int8 v11 = [v10 hasItemsOverStorageLimit];

    return v11;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = +[NMSMediaPinningManager sharedManager];
  CFStringRef v14 = [v13 podcastFeedURLs];

  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v35;
LABEL_5:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v35 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = +[NMSMediaItemGroup itemGroupWithCustomPodcastFeedURL:*(void *)(*((void *)&v34 + 1) + 8 * v18) downloadedItemsOnly:0];
      id v20 = +[NMSMediaPinningManager sharedManager];
      unsigned int v21 = [v20 isItemGroupWithinQuota:v19];

      if (!v21) {
        break;
      }
      if (v16 == (id)++v18)
      {
        id v16 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v16) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = +[NMSMediaPinningManager sharedManager];
    CFStringRef v14 = [v22 podcastStationUUIDs];

    id v23 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (!v23)
    {
LABEL_19:

      return 0;
    }
    id v24 = v23;
    uint64_t v25 = *(void *)v31;
LABEL_13:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v31 != v25) {
        objc_enumerationMutation(v14);
      }
      uint64_t v27 = +[NMSMediaItemGroup itemGroupWithPodcastStationUUID:*(void *)(*((void *)&v30 + 1) + 8 * v26) downloadedItemsOnly:0];
      v28 = +[NMSMediaPinningManager sharedManager];
      unsigned int v29 = [v28 isItemGroupWithinQuota:v27];

      if (!v29) {
        break;
      }
      if (v24 == (id)++v26)
      {
        id v24 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v24) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
  }

  return 1;
}

- (BOOL)_shouldShowProgress
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint64_t v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  id v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C7C06707-D0C2-405E-AFB4-7F215413B262"];
  unsigned int v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    id v9 = [(MTBMainVC *)self syncInfoController];
    id v10 = [v9 syncInfo];
    if ([v10 itemCount])
    {
      unsigned __int8 v11 = [(MTBMainVC *)self syncInfoController];
      float v12 = [v11 syncInfo];
      unsigned __int8 v13 = [v12 status] != &dword_4;
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
    goto LABEL_15;
  }
  CFStringRef v14 = +[NRPairedDeviceRegistry sharedInstance];
  id v15 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v16 = [v14 getAllDevicesWithArchivedAltAccountDevicesMatching:v15];
  uint64_t v17 = [v16 firstObject];
  id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2E9A45BB-4F07-4D6B-9B65-41933EED0DCA"];
  unsigned int v19 = [v17 supportsCapability:v18];

  if (v19)
  {
    id v20 = +[NMSMediaPinningManager sharedManager];
    unsigned int v21 = [v20 podcastFeedURLs];
    id v22 = [v21 count];

    id v23 = +[NMSMediaPinningManager sharedManager];
    id v24 = [v23 podcastStationUUIDs];
    uint64_t v25 = (uint64_t)[v24 count];

    uint64_t v26 = -v25;
    uint64_t v27 = +[NRPairedDeviceRegistry sharedInstance];
    v28 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    unsigned int v29 = [v27 getAllDevicesWithArchivedAltAccountDevicesMatching:v28];
    long long v30 = [v29 firstObject];
    id v31 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B743795D-BA43-40D7-BA73-D1415B0895D4"];
    unsigned int v32 = [v30 supportsCapability:v31];

    if (v32)
    {
      if (v22 != (id)v26) {
        goto LABEL_14;
      }
      long long v33 = +[NMSMediaPinningManager sharedManager];
      unsigned __int8 v34 = [v33 savedEpisodesEnabled];

      if (v34) {
        goto LABEL_14;
      }
    }
    else if (v22 != (id)v26)
    {
LABEL_14:
      id v9 = [(MTBMainVC *)self syncInfoController];
      id v10 = [v9 syncInfo];
      unsigned __int8 v13 = [v10 status] != &dword_4;
      goto LABEL_15;
    }
  }
  else if ([(MTBMainVC *)self _legacyIsCharging])
  {
    id v9 = +[NMSSyncManager sharedManager];
    id v10 = [v9 podcastsProgressInfo];
    unsigned __int8 v13 = [v10 _isSyncing];
LABEL_15:

    return v13;
  }
  return 0;
}

- (void)_configureHeaderIfNeeded
{
  if (![(MTBMainVC *)self isViewLoaded]) {
    return;
  }
  id v39 = [(MTBMainVC *)self table];
  id v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  if ([v3 BOOLForKey:kMTSyncSubscriptionsKey])
  {
    id v4 = +[NMBUIAccountUtil sharedInstance];
    unsigned __int8 v5 = [v4 hasITunesAccount];

    if (v5)
    {
      id v6 = +[NSMutableArray array];
      if ([(MTBMainVC *)self _isOutOfSpace])
      {
        id v7 = objc_alloc((Class)NMBUIAlertHeaderView);
        double x = CGRectZero.origin.x;
        double y = CGRectZero.origin.y;
        double width = CGRectZero.size.width;
        double height = CGRectZero.size.height;
        id v12 = objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
        unsigned __int8 v13 = +[UIColor systemYellowColor];
        [v12 setTintColor:v13];

        CFStringRef v14 = +[MTBridgeUtilities localizedOutOfSpaceHeaderTitle];
        id v15 = [v12 textLabel];
        [v15 setText:v14];

        id v16 = +[MTBridgeUtilities localizedOutOfSpaceHeaderMessage];
        uint64_t v17 = [v12 detailTextLabel];
        [v17 setText:v16];

        [v12 setPreservesSuperviewLayoutMargins:1];
        [v6 addObject:v12];
      }
      else
      {
        double x = CGRectZero.origin.x;
        double y = CGRectZero.origin.y;
        double width = CGRectZero.size.width;
        double height = CGRectZero.size.height;
      }
      id v18 = objc_msgSend(objc_alloc((Class)NMBUIContentHeaderView), "initWithFrame:", x, y, width, height);
      unsigned int v19 = [(MTBMainVC *)self _contentHeaderViewTitle];
      id v20 = [v18 textLabel];
      [v20 setText:v19];

      unsigned int v21 = [(MTBMainVC *)self _contentHeaderViewSubtitle];
      id v22 = [v18 detailTextLabel];
      [v22 setText:v21];

      [v18 setPreservesSuperviewLayoutMargins:1];
      if ([(MTBMainVC *)self _shouldShowProgress])
      {
        [(MTBMainVC *)self _contentHeaderViewProgress];
        int v24 = v23;
        uint64_t v25 = [v18 progressView];
        LODWORD(v26) = v24;
        [v25 setProgress:v26];
      }
      [v6 addObject:v18];
      id v27 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v6];
      [v27 setAxis:1];
      [v39 directionalLayoutMargins];
      double v29 = v28;
      long long v30 = +[UIListContentConfiguration cellConfiguration];
      [v30 directionalLayoutMargins];
      double v32 = v29 + v31;

      objc_msgSend(v27, "setDirectionalLayoutMargins:", 0.0, v32, 0.0, v32);
      [v39 bounds];
      double v34 = v33;
      double v36 = v35;
      LODWORD(v33) = 1148846080;
      LODWORD(v35) = 1112014848;
      objc_msgSend(v27, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v34, v36, v33, v35);
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, v37, v38);
      [v39 setTableHeaderView:v27];

      goto LABEL_13;
    }
  }
  else
  {
  }
  [v39 setTableHeaderView:0];
LABEL_13:
}

- (void)_updateProgressIfNeeded
{
  v2 = self;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(MTBMainVC *)self specifiers];
  id v3 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v37 = NMBUISpecifierModelObjectKey;
    uint64_t v38 = *(void *)v42;
    uint64_t v32 = kNMSMediaSyncInfoSavedEpisodesIdentifier;
    uint64_t v36 = NMBUISpecifierDownloadStateKey;
    uint64_t v35 = NMBUISpecifierDownloadProgressKey;
    do
    {
      unsigned __int8 v5 = 0;
      id v34 = v4;
      do
      {
        if (*(void *)v42 != v38) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v5);
        id v7 = [v6 propertyForKey:v37];
        if (v7)
        {
          if ([(MTBMainVC *)v2 _isPodcastWithFeedURLPinned:v7]
            || [(MTBMainVC *)v2 _isStationWithUUIDPinned:v7]
            || [v7 isEqualToString:v32]
            && (+[NMSMediaPinningManager sharedManager],
                unsigned int v8 = objc_claimAutoreleasedReturnValue(),
                unsigned int v9 = [v8 savedEpisodesEnabled],
                v8,
                v9))
          {
            id v10 = [v6 propertyForKey:v36];
            id v40 = [v10 unsignedIntegerValue];

            unsigned __int8 v11 = [v6 propertyForKey:v35];
            [v11 floatValue];
            float v13 = v12;

            CFStringRef v14 = [(MTBMainVC *)v2 syncInfoController];
            id v39 = [v14 downloadStateForModelObject:v7];

            id v15 = +[NRPairedDeviceRegistry sharedInstance];
            +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
            uint64_t v17 = v16 = v2;
            id v18 = [v15 getAllDevicesWithArchivedAltAccountDevicesMatching:v17];
            unsigned int v19 = [v18 firstObject];
            id v20 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2E9A45BB-4F07-4D6B-9B65-41933EED0DCA"];
            unsigned __int8 v21 = [v19 supportsCapability:v20];

            if (v21)
            {
              v2 = v16;
              id v22 = v39;
            }
            else
            {
              id v22 = [(MTBMainVC *)v16 _resolvedProgressViewStateForState:v39];
              v2 = v16;
            }
            int v23 = [(MTBMainVC *)v2 syncInfoController];
            [v23 progressForModelObject:v7];
            float v25 = v24;

            id v4 = v34;
            if (v40 != v22 || vabds_f32(v13, v25) > 0.00000011921)
            {
              double v26 = [(MTBMainVC *)v2 table];
              id v27 = [(MTBMainVC *)v2 indexPathForSpecifier:v6];
              double v28 = [v26 cellForRowAtIndexPath:v27];

              double v29 = +[NSNumber numberWithUnsignedInteger:v22];
              [v6 setProperty:v29 forKey:v36];

              *(float *)&double v30 = v25;
              double v31 = +[NSNumber numberWithFloat:v30];
              [v6 setProperty:v31 forKey:v35];

              [v28 refreshCellContentsWithSpecifier:v6];
            }
          }
        }

        unsigned __int8 v5 = (char *)v5 + 1;
      }
      while (v4 != v5);
      id v4 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v4);
  }
}

- (void)_updateHeaderAndSyncProgress
{
  if ([(MTBMainVC *)self isViewLoaded])
  {
    [(MTBMainVC *)self _configureHeaderIfNeeded];
    [(MTBMainVC *)self _updateProgressIfNeeded];
  }
  else
  {
    id v3 = _MTLogCategoryBridge();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Ignoring media sync info update due to view not being loaded.", v4, 2u);
    }
  }
}

- (void)_reload
{
  [(MTBMainVC *)self reloadSpecifiers];

  [(MTBMainVC *)self _updateHeaderAndSyncProgress];
}

- (id)_savedAndStationSpecifiers
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  unsigned __int8 v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  id v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B743795D-BA43-40D7-BA73-D1415B0895D4"];
  if ([v6 supportsCapability:v7])
  {
  }
  else
  {
    id v40 = +[NRPairedDeviceRegistry sharedInstance];
    +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    unsigned int v8 = v41 = v3;
    unsigned int v9 = [v40 getAllDevicesWithArchivedAltAccountDevicesMatching:v8];
    id v10 = [v9 firstObject];
    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B51CCBC5-6C2B-47BB-90EA-002DE9C4DA79"];
    unsigned __int8 v12 = [v10 supportsCapability:v11];

    if ((v12 & 1) == 0)
    {
      id v38 = &__NSArray0__struct;
      goto LABEL_19;
    }
  }
  float v13 = +[NSBundle podcastsFoundationBundle];
  CFStringRef v14 = [v13 localizedStringForKey:@"CHOOSE_STATIONS_GROUP_HEADER" value:@"Choose Stations" table:0];
  id v15 = +[PSSpecifier groupSpecifierWithID:@"NMTPodcastStationsGroupSpecifierID" name:v14];
  id v16 = +[NSMutableArray arrayWithObject:v15];

  if ([(MTBMainVC *)self isWaitingForDatabaseSetup])
  {
    id v17 = [(MTBMainVC *)self _newLoadingSpecifier];
    [v16 addObject:v17];
  }
  else
  {
    id v18 = +[NRPairedDeviceRegistry sharedInstance];
    unsigned int v19 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    id v20 = [v18 getAllDevicesWithArchivedAltAccountDevicesMatching:v19];
    unsigned __int8 v21 = [v20 firstObject];
    id v22 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B743795D-BA43-40D7-BA73-D1415B0895D4"];
    unsigned int v23 = [v21 supportsCapability:v22];

    if (v23)
    {
      float v24 = [(MTBMainVC *)self _specifierForSavedEpisodes];
      [v16 addObject:v24];
    }
    float v25 = +[NRPairedDeviceRegistry sharedInstance];
    double v26 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    id v27 = [v25 getAllDevicesWithArchivedAltAccountDevicesMatching:v26];
    double v28 = [v27 firstObject];
    id v29 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B51CCBC5-6C2B-47BB-90EA-002DE9C4DA79"];
    unsigned int v30 = [v28 supportsCapability:v29];

    if (v30)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      double v31 = [(MTBMainVC *)self availablePodcastStationsFetchedResultsController];
      uint64_t v32 = [v31 fetchedObjects];

      id v33 = [v32 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v43;
        do
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v43 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = [(MTBMainVC *)self _specifierForStation:*(void *)(*((void *)&v42 + 1) + 8 * i)];
            [v16 addObject:v37];
          }
          id v34 = [v32 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v34);
      }
    }
  }
  id v38 = [v16 copy];

LABEL_19:

  return v38;
}

- (id)_specifierForSavedEpisodes
{
  id v3 = +[MTBridgeUtilities localizedSavedString];
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"_setSavedEpisodesSwitchCell:specifier:" get:"_savedEpisodesSwitchCellValueForSpecifier:" detail:0 cell:4 edit:0];

  [v4 setProperty:objc_opt_class() forKey:PSCellClassKey];
  unsigned __int8 v5 = +[MTBridgeUtilities localizedSavedString];
  [v4 setProperty:v5 forKey:NMBUISpecifierTitleKey];

  id v6 = [(MTBMainVC *)self _cellImageWithSymbolName:@"bookmark"];
  [v4 setProperty:v6 forKey:NMBUISpecifierPlaceholderImageKey];

  uint64_t v7 = kNMSMediaSyncInfoSavedEpisodesIdentifier;
  [v4 setProperty:kNMSMediaSyncInfoSavedEpisodesIdentifier forKey:NMBUISpecifierModelObjectKey];
  [v4 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowSwitchKey];
  unsigned int v8 = +[NMSMediaPinningManager sharedManager];
  unsigned int v9 = [v8 savedEpisodesEnabled];

  if (v9)
  {
    id v10 = +[NRPairedDeviceRegistry sharedInstance];
    id v11 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    unsigned __int8 v12 = [v10 getAllDevicesWithArchivedAltAccountDevicesMatching:v11];
    float v13 = [v12 firstObject];
    id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2E9A45BB-4F07-4D6B-9B65-41933EED0DCA"];
    unsigned int v15 = [v13 supportsCapability:v14];

    if (v15)
    {
      id v16 = [(MTBMainVC *)self syncInfoController];
      id v17 = [v16 downloadStateForModelObject:v7];

      id v18 = [(MTBMainVC *)self syncInfoController];
      [v18 progressForModelObject:v7];
      int v20 = v19;

      [v4 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowDownloadInfoKey];
      unsigned __int8 v21 = +[NSNumber numberWithUnsignedInteger:v17];
      [v4 setProperty:v21 forKey:NMBUISpecifierDownloadStateKey];

      LODWORD(v22) = v20;
      self = +[NSNumber numberWithFloat:v22];
      unsigned int v23 = &NMBUISpecifierDownloadProgressKey;
      float v24 = self;
    }
    else
    {
      float v24 = +[NMSMediaItemGroup itemGroupWithSavedEpisodesDownloadedItemsOnly:0];
      float v25 = +[NMSMediaPinningManager sharedManager];
      unsigned __int8 v26 = [v25 isItemGroupWithinQuota:v24];

      if (v26)
      {
LABEL_7:

        goto LABEL_8;
      }
      [v4 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowExclamationIconKey];
      id v27 = NSStringFromSelector("_showSyncStorageWarning");
      [v4 setProperty:v27 forKey:NMBUISpecifierIconActionStringKey];

      unsigned int v23 = &NMBUISpecifierIconTargetKey;
    }
    [v4 setProperty:self forKey:*v23];
    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

- (id)_specifierForStation:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = _MTLogCategoryBridge();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 title];
    *(_DWORD *)buf = 138412290;
    id v38 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "podcast station specifier <%@>", buf, 0xCu);
  }
  uint64_t v7 = [v4 title];
  unsigned int v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"_setStationSwitchCell:specifier:" get:"_stationSwitchCellValueForSpecifier:" detail:0 cell:4 edit:0];

  [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
  unsigned int v9 = [v4 title];
  [v8 setProperty:v9 forKey:NMBUISpecifierTitleKey];

  id v10 = [v4 artworkCatalog];
  [v8 setProperty:v10 forKey:NMBUISpecifierArtworkCatalogKey];

  id v11 = [(MTBMainVC *)self _placeholderPodcastsImage];
  [v8 setProperty:v11 forKey:NMBUISpecifierPlaceholderImageKey];

  unsigned __int8 v12 = [v4 uuid];
  [v8 setProperty:v12 forKey:NMBUISpecifierModelObjectKey];

  [v8 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowSwitchKey];
  float v13 = [v4 uuid];
  unsigned int v14 = [(MTBMainVC *)self _isStationWithUUIDPinned:v13];

  if (v14)
  {
    unsigned int v15 = +[NRPairedDeviceRegistry sharedInstance];
    id v16 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    id v17 = [v15 getAllDevicesWithArchivedAltAccountDevicesMatching:v16];
    id v18 = [v17 firstObject];
    id v19 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2E9A45BB-4F07-4D6B-9B65-41933EED0DCA"];
    unsigned int v20 = [v18 supportsCapability:v19];

    if (v20)
    {
      unsigned __int8 v21 = [(MTBMainVC *)self syncInfoController];
      double v22 = [v4 uuid];
      id v23 = [v21 downloadStateForModelObject:v22];

      float v24 = [(MTBMainVC *)self syncInfoController];
      float v25 = [v4 uuid];
      [v24 progressForModelObject:v25];
      int v27 = v26;

      [v8 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowDownloadInfoKey];
      double v28 = +[NSNumber numberWithUnsignedInteger:v23];
      [v8 setProperty:v28 forKey:NMBUISpecifierDownloadStateKey];

      LODWORD(v29) = v27;
      self = +[NSNumber numberWithFloat:v29];
      unsigned int v30 = &NMBUISpecifierDownloadProgressKey;
      double v31 = self;
    }
    else
    {
      uint64_t v32 = [v4 uuid];
      double v31 = +[NMSMediaItemGroup itemGroupWithPodcastStationUUID:v32 downloadedItemsOnly:0];

      id v33 = +[NMSMediaPinningManager sharedManager];
      unsigned __int8 v34 = [v33 isItemGroupWithinQuota:v31];

      if (v34)
      {
LABEL_9:

        goto LABEL_10;
      }
      [v8 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowExclamationIconKey];
      uint64_t v35 = NSStringFromSelector("_showSyncStorageWarning");
      [v8 setProperty:v35 forKey:NMBUISpecifierIconActionStringKey];

      unsigned int v30 = &NMBUISpecifierIconTargetKey;
    }
    [v8 setProperty:self forKey:*v30];
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (id)_podcastSpecifiers
{
  id v3 = +[NSMutableArray array];
  id v4 = +[MTBridgeUtilities localizedChooseShowsString];
  unsigned __int8 v5 = +[PSSpecifier groupSpecifierWithID:@"NMTPodcastsGroupSpecifierID" name:v4];
  [v3 addObject:v5];

  if ([(MTBMainVC *)self isWaitingForDatabaseSetup])
  {
    id v6 = [(MTBMainVC *)self _newLoadingSpecifier];
    [v3 addObject:v6];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [(MTBMainVC *)self availablePodcastsFetchedResultsController];
    unsigned int v8 = [v7 fetchedObjects];

    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          float v13 = [(MTBMainVC *)self _specifierForPodcast:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          [v3 addObject:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  id v14 = [v3 copy];

  return v14;
}

- (id)_specifierForPodcast:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = _MTLogCategoryBridge();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 title];
    *(_DWORD *)buf = 138412290;
    id v38 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "podcast specifier <%@>", buf, 0xCu);
  }
  uint64_t v7 = [v4 title];
  unsigned int v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"_setPodcastSwitchCell:specifier:" get:"_podcastSwitchCellValueForSpecifier:" detail:0 cell:4 edit:0];

  [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
  id v9 = [v4 title];
  [v8 setProperty:v9 forKey:NMBUISpecifierTitleKey];

  id v10 = [v4 artworkCatalog];
  [v8 setProperty:v10 forKey:NMBUISpecifierArtworkCatalogKey];

  uint64_t v11 = [(MTBMainVC *)self _placeholderPodcastsImage];
  [v8 setProperty:v11 forKey:NMBUISpecifierPlaceholderImageKey];

  unsigned __int8 v12 = [v4 feedURL];
  [v8 setProperty:v12 forKey:NMBUISpecifierModelObjectKey];

  [v8 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowSwitchKey];
  float v13 = [v4 feedURL];
  unsigned int v14 = [(MTBMainVC *)self _isPodcastWithFeedURLPinned:v13];

  if (v14)
  {
    unsigned int v15 = +[NRPairedDeviceRegistry sharedInstance];
    long long v16 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    long long v17 = [v15 getAllDevicesWithArchivedAltAccountDevicesMatching:v16];
    long long v18 = [v17 firstObject];
    id v19 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2E9A45BB-4F07-4D6B-9B65-41933EED0DCA"];
    unsigned int v20 = [v18 supportsCapability:v19];

    if (v20)
    {
      unsigned __int8 v21 = [(MTBMainVC *)self syncInfoController];
      double v22 = [v4 feedURL];
      id v23 = [v21 downloadStateForModelObject:v22];

      float v24 = [(MTBMainVC *)self syncInfoController];
      float v25 = [v4 feedURL];
      [v24 progressForModelObject:v25];
      int v27 = v26;

      [v8 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowDownloadInfoKey];
      double v28 = +[NSNumber numberWithUnsignedInteger:v23];
      [v8 setProperty:v28 forKey:NMBUISpecifierDownloadStateKey];

      LODWORD(v29) = v27;
      self = +[NSNumber numberWithFloat:v29];
      unsigned int v30 = &NMBUISpecifierDownloadProgressKey;
      double v31 = self;
    }
    else
    {
      uint64_t v32 = [v4 feedURL];
      double v31 = +[NMSMediaItemGroup itemGroupWithCustomPodcastFeedURL:v32 downloadedItemsOnly:0];

      id v33 = +[NMSMediaPinningManager sharedManager];
      unsigned __int8 v34 = [v33 isItemGroupWithinQuota:v31];

      if (v34)
      {
LABEL_9:

        goto LABEL_10;
      }
      [v8 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowExclamationIconKey];
      uint64_t v35 = NSStringFromSelector("_showSyncStorageWarning");
      [v8 setProperty:v35 forKey:NMBUISpecifierIconActionStringKey];

      unsigned int v30 = &NMBUISpecifierIconTargetKey;
    }
    [v8 setProperty:self forKey:*v30];
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (void)_showSyncStorageWarning
{
  id v3 = +[NSBundle podcastsFoundationBundle];
  id v4 = [v3 localizedStringForKey:@"SYNC_SETTINGS_SYNC_STORAGE_LIMIT_TOO_LOW_TITLE" value:@"The storage space dedicated to media on your Apple Watch is full." table:0];
  unsigned __int8 v5 = +[NSBundle podcastsFoundationBundle];
  id v6 = [v5 localizedStringForKey:@"SYNC_SETTINGS_SYNC_STORAGE_LIMIT_TOO_LOW_MESSAGE", @"To make space available, you can remove some podcasts, music, or audiobooks.", 0 value table];
  id v11 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  uint64_t v7 = +[NSBundle podcastsFoundationBundle];
  unsigned int v8 = [v7 localizedStringForKey:@"SYNC_SETTINGS_SYNC_STORAGE_LIMIT_TOO_LOW_OK_ACTION" value:@"OK" table:0];
  id v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:0];
  [v11 addAction:v9];

  id v10 = [(MTBMainVC *)self _selfOrPresentedViewController];
  [v10 presentViewController:v11 animated:1 completion:0];
}

- (id)_selfOrPresentedViewController
{
  id v3 = [(MTBMainVC *)self presentedViewController];

  if (v3)
  {
    id v4 = [(MTBMainVC *)self presentedViewController];
  }
  else
  {
    id v4 = self;
  }

  return v4;
}

- (void)_launchPodcasts
{
  id v2 = kMTApplicationBundleIdentifier;
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned int v4 = [v3 applicationIsInstalled:v2];
  unsigned __int8 v5 = _MTLogCategoryBridge();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Podcasts is installed. Prelaunching it now.", v10, 2u);
    }

    unsigned __int8 v5 = objc_alloc_init((Class)FBSOpenApplicationService);
    uint64_t v13 = FBSOpenApplicationOptionKeyActivateForEvent;
    uint64_t v11 = FBSActivateForEventOptionTypeBackgroundContentFetching;
    unsigned __int8 v12 = &__NSDictionary0__struct;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    unsigned int v14 = v7;
    unsigned int v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v9 = +[FBSOpenApplicationOptions optionsWithDictionary:v8];
    [v5 openApplication:v2 withOptions:v9 completion:&stru_1CA00];
  }
  else if (v6)
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Podcasts not installed. Skipped launching.", v10, 2u);
  }
}

- (id)_localizedEpisodeDownloadExplanation
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  unsigned int v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  unsigned __int8 v5 = [v4 firstObject];
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B51CCBC5-6C2B-47BB-90EA-002DE9C4DA79"];
  unsigned int v7 = [v5 supportsCapability:v6];

  unsigned int v8 = +[NSBundle podcastsFoundationBundle];
  id v9 = v8;
  if (v7)
  {
    CFStringRef v10 = @"CUSTOM_STATIONS_FOOTER_STRING";
    CFStringRef v11 = @"Your Apple Watch will try to download three episodes from every show you select. If you select a custom station, your Apple Watch will try to download as many unplayed episodes as possible.";
  }
  else
  {
    CFStringRef v10 = @"CUSTOM_NO_STATIONS_FOOTER_STRING";
    CFStringRef v11 = @"Your Apple Watch will try to download three episodes from every show you select.";
  }
  unsigned __int8 v12 = [v8 localizedStringForKey:v10 value:v11 table:0];

  return v12;
}

- (unint64_t)_resolvedProgressViewStateForState:(unint64_t)a3
{
  if (a3 == 1)
  {
    if ([(MTBMainVC *)self _legacyIsCharging]) {
      return 3;
    }
    else {
      return 1;
    }
  }
  return a3;
}

- (BOOL)_legacyIsCharging
{
  id v2 = +[NMSSyncManager sharedManager];
  uint64_t v3 = [v2 podcastsProgressInfo];
  if ([v3 syncState] == (char *)&dword_0 + 3)
  {
    uint64_t v4 = +[NMSSyncManager sharedManager];
    unsigned __int8 v5 = [v4 podcastsProgressInfo];
    char v6 = [v5 syncWaitingSubstate] != (char *)&dword_0 + 1;
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (id)_cellImageWithSymbolName:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MTBMainVC *)self imageCache];
  char v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    unsigned int v8 = +[UIImage _systemImageNamed:v4];
    id v9 = +[UIImageSymbolConfiguration configurationWithPointSize:24.0];
    CFStringRef v10 = [v8 imageWithSymbolConfiguration:v9];
    CFStringRef v11 = [v10 imageWithRenderingMode:2];

    +[NMBUIMediaTableCell artworkSize];
    UIGraphicsBeginImageContextWithOptions(v33, 1, 0.0);
    unsigned __int8 v12 = +[UIColor colorWithRed:0.247058824 green:0.247058824 blue:0.254901961 alpha:1.0];
    [v12 set];

    +[NMBUIMediaTableCell artworkSize];
    CGFloat v14 = v13;
    +[NMBUIMediaTableCell artworkSize];
    v34.size.double height = v15;
    v34.origin.double x = 0.0;
    v34.origin.double y = 0.0;
    v34.size.double width = v14;
    UIRectFill(v34);
    [v11 size];
    __asm { FMOV            V4.2D, #24.0 }
    _UIScaleTransformForAspectFitOfSizeInTargetSize();
    [v11 size];
    +[NMBUIMediaTableCell artworkSize];
    UIRectCenteredIntegralRectScale();
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v29 = +[UIColor systemGrayColor];
    [v29 set];

    objc_msgSend(v11, "drawInRect:", v22, v24, v26, v28);
    UIGraphicsGetImageFromCurrentImageContext();
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    unsigned int v30 = [(MTBMainVC *)self imageCache];
    [v30 setObject:v7 forKey:v4];
  }

  return v7;
}

- (id)_placeholderPodcastsImage
{
  return [(MTBMainVC *)self _cellImageWithSymbolName:@"podcasts"];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTBMainVC;
  [(MTBMainVC *)&v11 tableView:a3 didSelectRowAtIndexPath:v6];
  if (self->_syncGroupSpecifier)
  {
    id v7 = -[MTBMainVC indexPathForSpecifier:](self, "indexPathForSpecifier:");
    uint64_t v8 = (uint64_t)[v7 section];
  }
  else
  {
    uint64_t v8 = -1;
  }
  if ([v6 section] == (id)v8)
  {
    id v9 = (char *)[v6 row];
    if (!v9)
    {
      uint64_t v10 = 0;
      goto LABEL_9;
    }
    if (v9 == (unsigned char *)&dword_0 + 1)
    {
      uint64_t v10 = 1;
LABEL_9:
      [(MTBMainVC *)self _setPodcastsAreUserSet:v10];
    }
  }
}

- (BOOL)isWaitingForDatabaseSetup
{
  return self->_waitingForDatabaseSetup;
}

- (void)setWaitingForDatabaseSetup:(BOOL)a3
{
  self->_waitingForDatabaseSetup = a3;
}

- (void)setSyncInfoController:(id)a3
{
}

- (PSSpecifier)syncGroupSpecifier
{
  return self->_syncGroupSpecifier;
}

- (void)setSyncGroupSpecifier:(id)a3
{
}

- (PSSpecifier)syncUpNextCellSpecifier
{
  return self->_syncUpNextCellSpecifier;
}

- (void)setSyncUpNextCellSpecifier:(id)a3
{
}

- (PSSpecifier)syncCustomCellSpecifier
{
  return self->_syncCustomCellSpecifier;
}

- (void)setSyncCustomCellSpecifier:(id)a3
{
}

- (void)setSignInSpecifier:(id)a3
{
}

- (void)setPodcastsSettingsSpecifier:(id)a3
{
}

- (void)setAvailablePodcastsFetchedResultsController:(id)a3
{
}

- (void)setAvailablePodcastStationsFetchedResultsController:(id)a3
{
}

- (void)setCachedPinnedFeedURLs:(id)a3
{
}

- (void)setCachedPinnedStationUUIDs:(id)a3
{
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_cachedPinnedStationUUIDs, 0);
  objc_storeStrong((id *)&self->_cachedPinnedFeedURLs, 0);
  objc_storeStrong((id *)&self->_availablePodcastStationsFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_availablePodcastsFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_podcastsSettingsSpecifier, 0);
  objc_storeStrong((id *)&self->_signInSpecifier, 0);
  objc_storeStrong((id *)&self->_syncCustomCellSpecifier, 0);
  objc_storeStrong((id *)&self->_syncUpNextCellSpecifier, 0);
  objc_storeStrong((id *)&self->_syncGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_syncInfoController, 0);
}

@end