@interface NMBridgeSyncedMusicController
- (BOOL)_hasAlbumsOrPlaylists;
- (BOOL)_isOutOfSpace;
- (BOOL)_shouldShowProgress;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NMBridgeSyncedMusicController)init;
- (NSArray)albumSpecifiers;
- (NSArray)playlistSpecifiers;
- (NSArray)recommendationSpecifiers;
- (PSSpecifier)addMusicSpecifier;
- (float)_contentHeaderViewProgress;
- (id)_albumSpecifierWithAlbum:(id)a3;
- (id)_contentHeaderViewSubtitle;
- (id)_contentHeaderViewTitle;
- (id)_libraryPersistentIDs:(id)a3 type:(int64_t)a4;
- (id)_pinnedAlbums;
- (id)_pinnedPlaylists;
- (id)_playlistSpecifierWithPlaylist:(id)a3;
- (id)_recommendationSelected:(id)a3;
- (id)_recommendationSpecifierWithRecommendation:(id)a3;
- (id)_recommendationsGroup;
- (id)_selfOrPresentedViewController;
- (id)_specifierWithTitle:(id)a3 subtitle:(id)a4 artworkCatalog:(id)a5 modelObject:(id)a6 showSwitch:(BOOL)a7 showDownloadInfo:(BOOL)a8 showWarningIfAboveQuota:(BOOL)a9 itemGroup:(id)a10 set:(SEL)a11 get:(SEL)a12;
- (id)_workoutPlaylistID;
- (id)specifiers;
- (id)syncInfoController;
- (id)syncInfoController:(id)a3 containerIdentifierForModelObject:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (unint64_t)_numberOfAlbums;
- (unint64_t)_numberOfPlaylists;
- (unint64_t)_resolvedProgressViewStateForState:(unint64_t)a3;
- (void)_addMusicAction;
- (void)_completeTransientStateWithModelObject:(id)a3 success:(BOOL)a4;
- (void)_configureHeaderIfNeeded;
- (void)_disableEditableAndButtonIfNothingLeftToEdit;
- (void)_dismissMusicPicker;
- (void)_getRepresentativeCollectionGrouping:(int64_t *)a3 propertyPredicate:(id *)a4 mediaQuery:(id)a5;
- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3;
- (void)_handleApplicationWillEnterForegroundNotification:(id)a3;
- (void)_handleMusicPinningSelectionsDidChangeNotification:(id)a3;
- (void)_handleMusicRecommendationsDidUpdateNotification:(id)a3;
- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3;
- (void)_handleSyncInfoDidUpdateNotification:(id)a3;
- (void)_performKeepLocalRequestWithModelObject:(id)a3 enableState:(int64_t)a4;
- (void)_pinAlbum:(id)a3;
- (void)_pinPlaylist:(id)a3;
- (void)_prepareTransientStateWithModelObject:(id)a3 enableState:(int64_t)a4;
- (void)_presentDownloadWaitingAlertIfNeededWithModelObject:(id)a3;
- (void)_presentFavoritesPlaylistUnsupportedAlert;
- (void)_reloadContents;
- (void)_reloadPlaylistsAndAlbumsIfNeeded;
- (void)_requestAlbums;
- (void)_requestPlaylists;
- (void)_requestRecommendations;
- (void)_setRecommendationSelected:(id)a3 withSpecifier:(id)a4;
- (void)_showSyncStorageWarning;
- (void)_showWorkoutPlaylistWarningWithDeletionCompletion:(id)a3;
- (void)_unpinAlbum:(id)a3;
- (void)_unpinPlaylist:(id)a3;
- (void)_updateHeaderAndSyncProgressIfNeeded;
- (void)_updateHeaderSize;
- (void)_updateProgressIfNeeded;
- (void)dealloc;
- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4;
- (void)mediaPickerDidCancel:(id)a3;
- (void)setAddMusicSpecifier:(id)a3;
- (void)setAlbumSpecifiers:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setPlaylistSpecifiers:(id)a3;
- (void)setRecommendationSpecifiers:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NMBridgeSyncedMusicController

- (NMBridgeSyncedMusicController)init
{
  v21.receiver = self;
  v21.super_class = (Class)NMBridgeSyncedMusicController;
  v2 = [(NMBridgeSyncedMusicController *)&v21 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_handleMusicRecommendationsDidUpdateNotification:" name:NMSMusicRecommendationsDidUpdateNotification object:0];
    [v3 addObserver:v2 selector:"_reloadContents" name:ML3MusicLibraryEntitiesAddedOrRemovedNotification object:0];
    [v3 addObserver:v2 selector:"_handleSubscriptionStatusDidChangeNotification:" name:NMSSubscriptionStatusDidChangeNotification object:0];
    v4 = +[NRPairedDeviceRegistry sharedInstance];
    v5 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
    v7 = [v6 firstObject];
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
    unsigned int v9 = [v7 supportsCapability:v8];

    if (v9)
    {
      v10 = objc_alloc_init(NMKeepLocalTransientState);
      keepLocalTransientState = v2->_keepLocalTransientState;
      v2->_keepLocalTransientState = v10;
    }
    else
    {
      [v3 addObserver:v2 selector:"_handleMediaPinningMusicContentsInvalidatedNotification:" name:NMSMediaPinningMusicContentsInvalidatedNotification object:0];
      [v3 addObserver:v2 selector:"_handleMusicPinningSelectionsDidChangeNotification:" name:NMSyncDefaultsMusicPinningSelectionsDidChangeNotification object:0];
    }
    v12 = +[NRPairedDeviceRegistry sharedInstance];
    v13 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v14 = [v12 getAllDevicesWithArchivedAltAccountDevicesMatching:v13];
    v15 = [v14 firstObject];
    id v16 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
    unsigned int v17 = [v15 supportsCapability:v16];

    if (v17)
    {
      [v3 addObserver:v2 selector:"_handleSyncInfoDidUpdateNotification:" name:NMBUIMediaSyncInfoDidUpdateNotification object:0];
      [v3 addObserver:v2 selector:"_handleApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
      v18 = &UIApplicationDidEnterBackgroundNotification;
      v19 = &selRef__handleApplicationDidEnterBackgroundNotification_;
    }
    else
    {
      v18 = (const NSNotificationName *)&NMSSyncManagerSyncStateDidChangeNotification;
      v19 = &selRef__handleSyncManagerSyncStateDidChangeNotification_;
    }
    [v3 addObserver:v2 selector:*v19 name:*v18 object:0];
  }
  return v2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)NMBridgeSyncedMusicController;
  [(NMBridgeSyncedMusicController *)&v4 viewDidLoad];
  [(NMBridgeSyncedMusicController *)self _configureHeaderIfNeeded];
  v3 = [(NMBridgeSyncedMusicController *)self table];
  [v3 setAllowsSelectionDuringEditing:1];

  [(NMBridgeSyncedMusicController *)self _reloadContents];
  [(NMBridgeSyncedMusicController *)self setReusesCells:1];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NMBridgeSyncedMusicController;
  [(NMBridgeSyncedMusicController *)&v3 viewDidLayoutSubviews];
  [(NMBridgeSyncedMusicController *)self _updateHeaderSize];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NMBridgeSyncedMusicController;
  [(NMBridgeSyncedMusicController *)&v12 viewDidAppear:a3];
  objc_super v4 = +[NRPairedDeviceRegistry sharedInstance];
  v5 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
  v7 = [v6 firstObject];
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  unsigned __int8 v9 = [v7 supportsCapability:v8];

  if ((v9 & 1) == 0)
  {
    v10 = +[NMSSyncManager sharedManager];
    [v10 beginReceivingSyncProgressUpdates];
  }
  v11 = [(NMBridgeSyncedMusicController *)self syncInfoController];
  [v11 beginObservingSyncInfo];

  if (self->_needsVisibleSpecifiersSyncInfoUpdate) {
    [(NMBridgeSyncedMusicController *)self _updateHeaderAndSyncProgressIfNeeded];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NMBridgeSyncedMusicController;
  [(NMBridgeSyncedMusicController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(NMBridgeSyncedMusicController *)self syncInfoController];
  [v4 endObservingSyncInfo];
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NMBridgeSyncedMusicController;
  [(NMBridgeSyncedMusicController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  objc_super v3 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v6 = +[NSMutableArray array];
    v7 = [(NMBridgeSyncedMusicController *)self _recommendationsGroup];
    [v6 addObjectsFromArray:v7];

    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v9 = [v8 localizedStringForKey:@"PLAYLIST_ALBUM_SECTION_TITLE" value:@"PLAYLISTS & ALBUMS" table:0];
    v10 = +[PSSpecifier groupSpecifierWithName:v9];

    v11 = +[NRPairedDeviceRegistry sharedInstance];
    objc_super v12 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v13 = [v11 getAllDevicesWithArchivedAltAccountDevicesMatching:v12];
    v14 = [v13 firstObject];
    id v15 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
    unsigned __int8 v16 = [v14 supportsCapability:v15];

    if ((v16 & 1) == 0)
    {
      unsigned int v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = [v17 localizedStringForKey:@"SYNC_SETTINGS_FOOTER_DESCRIPTION" value:@"Music is downloaded when Apple Watch is connected to power and placed near your iPhone." table:0];
      [v10 setProperty:v18 forKey:PSFooterTextGroupKey];
    }
    [v6 addObject:v10];
    v19 = [(NMBridgeSyncedMusicController *)self addMusicSpecifier];
    [v6 addObject:v19];

    v20 = [(NMBridgeSyncedMusicController *)self playlistSpecifiers];
    [v6 addObjectsFromArray:v20];

    objc_super v21 = [(NMBridgeSyncedMusicController *)self albumSpecifiers];
    [v6 addObjectsFromArray:v21];

    id v22 = [v6 copy];
    v23 = *(void **)&self->PSEditableListController_opaque[v2];
    *(void *)&self->PSEditableListController_opaque[v2] = v22;

    id v4 = *(id *)&self->PSEditableListController_opaque[v2];
  }

  return v4;
}

- (void)_reloadContents
{
  [(NMBridgeSyncedMusicController *)self _requestRecommendations];
  [(NMBridgeSyncedMusicController *)self _requestPlaylists];
  [(NMBridgeSyncedMusicController *)self _requestAlbums];

  [(NMBridgeSyncedMusicController *)self _updateHeaderAndSyncProgressIfNeeded];
}

- (void)_reloadPlaylistsAndAlbumsIfNeeded
{
  id v31 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSArray count](self->_albumSpecifiers, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v29 = self;
  objc_super v3 = self->_albumSpecifiers;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v37;
    uint64_t v7 = NMBUISpecifierCellConfigurationKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned __int8 v9 = [*(id *)(*((void *)&v36 + 1) + 8 * i) propertyForKey:v7];
        v10 = [v9 modelObject];
        v11 = [v10 identifiers];
        objc_super v12 = [v11 library];
        v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 persistentID]);
        [v31 addObject:v13];
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v5);
  }

  v14 = [(NMBridgeSyncedMusicController *)v29 _pinnedAlbums];
  unsigned __int8 v15 = [v31 isEqualToSet:v14];

  if ((v15 & 1) == 0) {
    [(NMBridgeSyncedMusicController *)v29 _requestAlbums];
  }
  id v16 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSArray count](v29->_playlistSpecifiers, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obj = v29->_playlistSpecifiers;
  id v17 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    uint64_t v20 = NMBUISpecifierCellConfigurationKey;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(obj);
        }
        id v22 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) propertyForKey:v20];
        v23 = [v22 modelObject];
        v24 = [v23 identifiers];
        v25 = [v24 library];
        v26 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v25 persistentID]);
        [v16 addObject:v26];
      }
      id v18 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v18);
  }

  v27 = [(NMBridgeSyncedMusicController *)v29 _pinnedPlaylists];
  unsigned __int8 v28 = [v16 isEqualToSet:v27];

  if ((v28 & 1) == 0) {
    [(NMBridgeSyncedMusicController *)v29 _requestPlaylists];
  }
}

- (id)_recommendationsGroup
{
  objc_super v3 = sub_CF20(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NMBridgeSyncedMusicController *)self recommendationSpecifiers];
    id v5 = [v4 count];
    uint64_t v6 = +[NMSSubscriptionManager sharedManager];
    id v7 = [v6 subscriptionType];
    id v8 = +[NMSyncDefaults sharedDefaults];
    unsigned __int8 v9 = [v8 cachedRecommendationsData];
    *(_DWORD *)buf = 134218496;
    id v42 = v5;
    __int16 v43 = 2048;
    id v44 = v7;
    __int16 v45 = 1024;
    BOOL v46 = v9 != 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[Bridge Recommendations] Creating recommendation group - Recommendations count %lu Subscription type %ld Has cached recommendations %x", buf, 0x1Cu);
  }
  v10 = +[NSMutableArray array];
  v11 = [(NMBridgeSyncedMusicController *)self recommendationSpecifiers];
  id v12 = [v11 count];

  if (!v12)
  {
    id v17 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    [v10 addObject:v17];
    goto LABEL_22;
  }
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v14 = objc_alloc_init((Class)NSMutableArray);
  unsigned __int8 v15 = [(NMBridgeSyncedMusicController *)self recommendationSpecifiers];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_6A68;
  v38[3] = &unk_14508;
  id v16 = v14;
  id v39 = v16;
  id v17 = v13;
  id v40 = v17;
  [v15 enumerateObjectsUsingBlock:v38];

  if ([v17 count])
  {
    id v18 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v19 = [v18 localizedStringForKey:@"AUTOMATICALLY_ADD_SECTION_HEADER_TEXT" value:@"AUTOMATICALLY ADD" table:0];
    uint64_t v20 = +[PSSpecifier groupSpecifierWithName:v19];

    objc_super v21 = +[NMSSubscriptionManager sharedManager];
    LODWORD(v19) = [v21 hasCapability:1];

    id v22 = +[NRPairedDeviceRegistry sharedInstance];
    long long v36 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    long long v37 = v22;
    v23 = objc_msgSend(v22, "getAllDevicesWithArchivedAltAccountDevicesMatching:");
    v24 = [v23 firstObject];
    id v25 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
    unsigned int v26 = [v24 supportsCapability:v25];
    if (v19)
    {
      if (v26)
      {
        char v27 = MGGetBoolAnswer();
        unsigned __int8 v28 = +[NSBundle bundleForClass:objc_opt_class()];
        if (v27)
        {
          CFStringRef v29 = @"AUTOMATICALLY_ADD_SUBSCRIBER_SECTION_FOOTER_TEXT_WLAN";
          CFStringRef v30 = @"Auto-download Recent Music. If you haven’t listened, recommendations from Apple Music will be added. This music will download when your Apple Watch is charging and connected to either WLAN or your iPhone.";
        }
        else
        {
          CFStringRef v29 = @"AUTOMATICALLY_ADD_SUBSCRIBER_SECTION_FOOTER_TEXT_WIFI";
          CFStringRef v30 = @"Auto-download Recent Music. If you haven’t listened, recommendations from Apple Music will be added. This music will download when your Apple Watch is charging and connected to either Wi-Fi or your iPhone.";
        }
LABEL_17:
        long long v32 = v28;
        goto LABEL_18;
      }
      long long v32 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned __int8 v28 = v32;
      CFStringRef v29 = @"AUTOMATICALLY_ADD_SUBSCRIBER_SECTION_FOOTER_TEXT_LEGACY";
      CFStringRef v30 = @"Automatically add music you’ve listened to recently. If you haven’t listened to anything, recommendations from Apple Music will be added.";
    }
    else
    {
      if (v26)
      {
        char v31 = MGGetBoolAnswer();
        unsigned __int8 v28 = +[NSBundle bundleForClass:objc_opt_class()];
        if (v31)
        {
          CFStringRef v29 = @"AUTOMATICALLY_ADD_NON_SUBSCRIBER_SECTION_FOOTER_TEXT_WLAN";
          CFStringRef v30 = @"Auto-download music you purchased or listened to recently. This music will download when your Apple Watch is charging and connected to either WLAN or your iPhone.";
        }
        else
        {
          CFStringRef v29 = @"AUTOMATICALLY_ADD_NON_SUBSCRIBER_SECTION_FOOTER_TEXT_WIFI";
          CFStringRef v30 = @"Auto-download music you purchased or listened to recently. This music will download when your Apple Watch is charging and connected to either Wi-Fi or your iPhone.";
        }
        goto LABEL_17;
      }
      long long v32 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned __int8 v28 = v32;
      CFStringRef v29 = @"AUTOMATICALLY_ADD_NON_SUBSCRIBER_SECTION_FOOTER_TEXT_LEGACY";
      CFStringRef v30 = @"Automatically add purchased music you bought or listened to recently.";
    }
LABEL_18:
    long long v33 = [v32 localizedStringForKey:v29 value:v30 table:0];
    [v20 setProperty:v33 forKey:PSFooterTextGroupKey];

    [v10 addObject:v20];
    [v10 addObjectsFromArray:v17];
  }
  if ([v16 count])
  {
    long long v34 = +[PSSpecifier groupSpecifierWithName:&stru_14B18];
    [v10 addObject:v34];
    [v10 addObjectsFromArray:v16];
  }
LABEL_22:

  return v10;
}

- (void)_requestRecommendations
{
  objc_initWeak(&location, self);
  uint64_t v2 = +[NMSMusicRecommendationManager sharedManager];
  id v3 = &_dispatch_main_q;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_6C0C;
  v4[3] = &unk_14530;
  objc_copyWeak(&v5, &location);
  [v2 fetchRecommendationsWithQueue:&_dispatch_main_q completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_requestPlaylists
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = +[NSMutableArray array];
  id v4 = +[NSMutableArray array];
  id v5 = [(NMBridgeSyncedMusicController *)self _pinnedPlaylists];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_70EC;
  v22[3] = &unk_14580;
  id v6 = v4;
  id v23 = v6;
  [v5 enumerateObjectsUsingBlock:v22];

  if ([v6 count])
  {
    id v7 = objc_alloc_init((Class)MPModelLibraryRequest);
    id v8 = +[MPModelSong kindWithVariants:1];
    unsigned __int8 v28 = v8;
    unsigned __int8 v9 = +[NSArray arrayWithObjects:&v28 count:1];
    v10 = +[MPModelPlaylistEntry kindWithKinds:v9];
    v11 = +[MPModelPlaylist kindWithPlaylistEntryKind:v10 options:0];
    [v7 setItemKind:v11];

    id v12 = objc_alloc((Class)MPPropertySet);
    v27[0] = MPModelPropertyPlaylistName;
    v27[1] = MPModelPropertyPlaylistArtwork;
    v27[2] = MPModelPropertyPlaylistTracksTiledArtwork;
    id v13 = +[NSArray arrayWithObjects:v27 count:3];
    uint64_t v25 = MPModelRelationshipPlaylistCurator;
    uint64_t v24 = MPModelPropertyCuratorName;
    id v14 = +[NSArray arrayWithObjects:&v24 count:1];
    unsigned __int8 v15 = +[MPPropertySet propertySetWithProperties:v14];
    unsigned int v26 = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v17 = [v12 initWithProperties:v13 relationships:v16];
    [v7 setItemProperties:v17];

    [v7 setAllowedItemIdentifiers:v6];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_720C;
    v19[3] = &unk_145F8;
    id v20 = v3;
    objc_super v21 = self;
    [v7 performWithResponseHandler:v19];
  }
  else
  {
    id v18 = [v3 copy];
    [(NMBridgeSyncedMusicController *)self setPlaylistSpecifiers:v18];

    [(NMBridgeSyncedMusicController *)self reloadSpecifiers];
    [(NMBridgeSyncedMusicController *)self setEditingButtonHidden:[(NMBridgeSyncedMusicController *)self _hasAlbumsOrPlaylists] ^ 1 animated:0];
  }
}

- (void)_requestAlbums
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = +[NSMutableArray array];
  id v4 = +[NSMutableArray array];
  id v5 = [(NMBridgeSyncedMusicController *)self _pinnedAlbums];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_7740;
  v20[3] = &unk_14580;
  id v6 = v4;
  id v21 = v6;
  [v5 enumerateObjectsUsingBlock:v20];

  if ([v6 count])
  {
    id v7 = objc_alloc_init((Class)MPModelLibraryRequest);
    id v8 = +[MPModelSong kindWithVariants:1];
    unsigned __int8 v9 = +[MPModelAlbum kindWithSongKind:v8];
    [v7 setItemKind:v9];

    id v10 = objc_alloc((Class)MPPropertySet);
    v25[0] = MPModelPropertyAlbumTitle;
    v25[1] = MPModelPropertyAlbumArtwork;
    v11 = +[NSArray arrayWithObjects:v25 count:2];
    uint64_t v23 = MPModelRelationshipAlbumArtist;
    uint64_t v22 = MPModelPropertyArtistName;
    id v12 = +[NSArray arrayWithObjects:&v22 count:1];
    id v13 = +[MPPropertySet propertySetWithProperties:v12];
    uint64_t v24 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v15 = [v10 initWithProperties:v11 relationships:v14];
    [v7 setItemProperties:v15];

    [v7 setAllowedItemIdentifiers:v6];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_7860;
    v17[3] = &unk_145F8;
    id v18 = v3;
    uint64_t v19 = self;
    [v7 performWithResponseHandler:v17];
  }
  else
  {
    id v16 = [v3 copy];
    [(NMBridgeSyncedMusicController *)self setAlbumSpecifiers:v16];

    [(NMBridgeSyncedMusicController *)self reloadSpecifiers];
    [(NMBridgeSyncedMusicController *)self setEditingButtonHidden:[(NMBridgeSyncedMusicController *)self _hasAlbumsOrPlaylists] ^ 1 animated:0];
  }
}

- (id)syncInfoController
{
  syncInfoController = self->_syncInfoController;
  if (!syncInfoController)
  {
    id v4 = [objc_alloc((Class)NMBUISyncInfoController) initWithSyncInfoTarget:0];
    [v4 setDataSource:self];
    id v5 = self->_syncInfoController;
    self->_syncInfoController = (NMBUISyncInfoController *)v4;

    syncInfoController = self->_syncInfoController;
  }

  return syncInfoController;
}

- (id)syncInfoController:(id)a3 containerIdentifierForModelObject:(id)a4
{
  return objc_msgSend(a4, "nms_syncInfoContainerIdentifier", a3);
}

- (void)_handleMusicRecommendationsDidUpdateNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7B60;
  block[3] = &unk_14648;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleMusicPinningSelectionsDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:NMSNotificationUserInfoKeyIsInProcessNotification];
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    [(NMBridgeSyncedMusicController *)self _reloadContents];
  }
}

- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7C68;
  block[3] = &unk_14648;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleSyncInfoDidUpdateNotification:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(NMBridgeSyncedMusicController *)self syncInfoController];

  if (v4 == v5)
  {
    [(NMBridgeSyncedMusicController *)self _updateHeaderAndSyncProgressIfNeeded];
    id v7 = +[NRPairedDeviceRegistry sharedInstance];
    id v8 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    unsigned __int8 v9 = [v7 getAllDevicesWithArchivedAltAccountDevicesMatching:v8];
    id v10 = [v9 firstObject];
    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
    unsigned int v12 = [v10 supportsCapability:v11];

    if (v12)
    {
      [(NMBridgeSyncedMusicController *)self _reloadPlaylistsAndAlbumsIfNeeded];
    }
  }
  else
  {
    unsigned __int8 v6 = sub_CF20(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[NMBridgeSyncedMusicController] Ignoring media sync info update from a different syncInfoController.", v13, 2u);
    }
  }
}

- (void)_handleApplicationWillEnterForegroundNotification:(id)a3
{
  id v3 = [(NMBridgeSyncedMusicController *)self syncInfoController];
  [v3 beginObservingSyncInfo];
}

- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3
{
  id v3 = [(NMBridgeSyncedMusicController *)self syncInfoController];
  [v3 endObservingSyncInfo];
}

- (BOOL)_hasAlbumsOrPlaylists
{
  id v3 = [(NMBridgeSyncedMusicController *)self _pinnedAlbums];
  id v4 = [v3 count];
  id v5 = [(NMBridgeSyncedMusicController *)self _pinnedPlaylists];
  if ((char *)[v5 count] + (void)v4)
  {
    char v7 = 1;
  }
  else
  {
    unsigned __int8 v6 = [(NMBridgeSyncedMusicController *)self _workoutPlaylistID];
    char v7 = [v6 longLongValue] != 0;
  }
  return v7;
}

- (void)_updateHeaderAndSyncProgressIfNeeded
{
  if ([(NMBridgeSyncedMusicController *)self isViewLoaded])
  {
    id v3 = [(NMBridgeSyncedMusicController *)self view];
    id v4 = [v3 window];

    if (v4)
    {
      [(NMBridgeSyncedMusicController *)self _configureHeaderIfNeeded];
      [(NMBridgeSyncedMusicController *)self _updateProgressIfNeeded];
      self->_needsVisibleSpecifiersSyncInfoUpdate = 0;
      return;
    }
    self->_needsVisibleSpecifiersSyncInfoUpdate = 1;
    id v5 = sub_CF20(13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v6 = "[NMBridgeSyncedMusicController] Ignoring media sync info update due to view not being visible.";
      char v7 = buf;
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = sub_CF20(13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      unsigned __int8 v6 = "[NMBridgeSyncedMusicController] Ignoring media sync info update due to view not being loaded.";
      char v7 = (uint8_t *)&v8;
LABEL_8:
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
}

- (void)_configureHeaderIfNeeded
{
  if ([(NMBridgeSyncedMusicController *)self isViewLoaded])
  {
    id v27 = [(NMBridgeSyncedMusicController *)self table];
    id v3 = +[NSMutableArray array];
    if ([(NMBridgeSyncedMusicController *)self _isOutOfSpace])
    {
      id v4 = objc_alloc((Class)NMBUIAlertHeaderView);
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      id v9 = objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
      id v10 = +[UIColor systemYellowColor];
      [v9 setTintColor:v10];

      id v11 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v12 = [v11 localizedStringForKey:@"SYNC_SETTINGS_OUT_OF_SPACE_HEADER_TITLE" value:@"Out of Media Storage" table:0];
      id v13 = [v9 textLabel];
      [v13 setText:v12];

      id v14 = +[NSBundle bundleForClass:objc_opt_class()];
      id v15 = [v14 localizedStringForKey:@"SYNC_SETTINGS_OUT_OF_SPACE_HEADER_MESSAGE", @"The storage space dedicated to media on your Apple Watch is full. To make space available, you can remove some podcasts, music, or audiobooks.", 0 value table];
      id v16 = [v9 detailTextLabel];
      [v16 setText:v15];

      [v9 setPreservesSuperviewLayoutMargins:1];
      [v3 addObject:v9];
    }
    else
    {
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
    }
    id v17 = objc_msgSend(objc_alloc((Class)NMBUIContentHeaderView), "initWithFrame:", x, y, width, height);
    id v18 = [(NMBridgeSyncedMusicController *)self _contentHeaderViewTitle];
    uint64_t v19 = [v17 textLabel];
    [v19 setText:v18];

    id v20 = [(NMBridgeSyncedMusicController *)self _contentHeaderViewSubtitle];
    id v21 = [v17 detailTextLabel];
    [v21 setText:v20];

    [v17 setPreservesSuperviewLayoutMargins:1];
    if ([(NMBridgeSyncedMusicController *)self _shouldShowProgress])
    {
      [(NMBridgeSyncedMusicController *)self _contentHeaderViewProgress];
      int v23 = v22;
      uint64_t v24 = [v17 progressView];
      LODWORD(v25) = v23;
      [v24 setProgress:v25];
    }
    [v3 addObject:v17];
    id v26 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v3];
    [v26 setAxis:1];
    [v26 setPreservesSuperviewLayoutMargins:1];
    [v27 setTableHeaderView:v26];
    [(NMBridgeSyncedMusicController *)self _updateHeaderSize];
  }
}

- (void)_updateHeaderSize
{
  if ([(NMBridgeSyncedMusicController *)self isViewLoaded])
  {
    id v3 = [(NMBridgeSyncedMusicController *)self table];
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
    id v13 = [(NMBridgeSyncedMusicController *)self table];
    [v13 setTableHeaderView:v14];
  }
}

- (void)_updateProgressIfNeeded
{
  uint64_t v2 = self;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(NMBridgeSyncedMusicController *)self specifiers];
  id v28 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v33;
    uint64_t v26 = NMBUISpecifierCellConfigurationKey;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        double v5 = [v4 propertyForKey:v26];
        double v6 = [v5 downloadState];

        if (v6)
        {
          CFStringRef v29 = v4;
          uint64_t v7 = [v5 modelObject];
          CFStringRef v30 = [v5 downloadState];
          double v8 = [(NMBridgeSyncedMusicController *)v2 syncInfoController];
          char v31 = (void *)v7;
          id v9 = [v8 downloadStateForModelObject:v7];

          double v10 = +[NRPairedDeviceRegistry sharedInstance];
          double v11 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
          double v12 = [v10 getAllDevicesWithArchivedAltAccountDevicesMatching:v11];
          [v12 firstObject];
          v14 = id v13 = v2;
          id v15 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
          unsigned __int8 v16 = [v14 supportsCapability:v15];

          if ((v16 & 1) == 0) {
            id v9 = [(NMBridgeSyncedMusicController *)v13 _resolvedProgressViewStateForState:v9];
          }
          uint64_t v2 = v13;
          id v17 = [(NMBridgeSyncedMusicController *)v13 syncInfoController];
          [v17 progressForModelObject:v31];
          float v19 = v18;

          if ([v30 state] == v9)
          {
            [v30 progress];
            double v20 = v19;
            if (vabdd_f64(v21, v20) <= 0.00000011920929) {
              goto LABEL_14;
            }
          }
          else
          {
            double v20 = v19;
          }
          int v22 = [(NMBridgeSyncedMusicController *)v13 table];
          int v23 = [(NMBridgeSyncedMusicController *)v13 indexPathForSpecifier:v29];
          uint64_t v24 = [v22 cellForRowAtIndexPath:v23];

          [v30 setState:v9];
          [v30 setProgress:v20];
          [v24 refreshCellContentsWithSpecifier:v29];

LABEL_14:
        }
      }
      id v28 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v28);
  }
}

- (BOOL)_isOutOfSpace
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  double v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  double v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  unsigned int v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = [(NMBridgeSyncedMusicController *)self syncInfoController];
    double v10 = [v9 syncInfo];
    double v11 = [v10 containers];

    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      char v14 = 0;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          float v18 = [(NMBridgeSyncedMusicController *)self syncInfoController];
          float v19 = [v18 syncInfo];
          LODWORD(v17) = [v19 hasItemsOverStorageLimitForContainer:v17];

          if (v17) {
            char v14 = 1;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
      unsigned __int8 v20 = v14 & 1;
    }
    else
    {
      unsigned __int8 v20 = 0;
    }
  }
  else
  {
    double v11 = +[NMSMediaPinningManager sharedManager];
    unsigned __int8 v20 = objc_msgSend(v11, "_legacy_musicIsOutOfSpace");
  }

  return v20;
}

- (BOOL)_shouldShowProgress
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  double v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  double v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  unsigned int v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    unint64_t v9 = [(NMBridgeSyncedMusicController *)self _numberOfAlbums];
    if ((char *)[(NMBridgeSyncedMusicController *)self _numberOfPlaylists] + v9)
    {
      char v14 = [(NMBridgeSyncedMusicController *)self syncInfoController];
      uint64_t v15 = [v14 syncInfo];
      BOOL v10 = [v15 status] != &dword_4;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    double v11 = +[NMSSyncManager sharedManager];
    id v12 = [v11 musicProgressInfo];
    id v13 = (char *)[v12 syncState];

    return v13 != (unsigned char *)&dword_0 + 1;
  }
  return v10;
}

- (unint64_t)_resolvedProgressViewStateForState:(unint64_t)a3
{
  id v4 = +[NMSSyncManager sharedManager];
  double v5 = [v4 musicProgressInfo];
  if ([v5 syncState] == (char *)&dword_0 + 3)
  {
    double v6 = +[NMSSyncManager sharedManager];
    id v7 = [v6 musicProgressInfo];
    unsigned __int8 v8 = [v7 syncWaitingSubstate];

    unint64_t v9 = 3;
    if (v8) {
      unint64_t v9 = 1;
    }
  }
  else
  {

    unint64_t v9 = 3;
  }
  if (a3 == 1) {
    return v9;
  }
  else {
    return a3;
  }
}

- (id)_contentHeaderViewTitle
{
  unint64_t v3 = [(NMBridgeSyncedMusicController *)self _numberOfAlbums];
  unint64_t v4 = [(NMBridgeSyncedMusicController *)self _numberOfPlaylists];
  unint64_t v5 = v4;
  if (v3 && v4)
  {
    double v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"SYNC_SETTINGS_CONTENT_SUMMARY_HEADER_ALBUMS_PLAYLISTS" value:&stru_14B18 table:@"LocalizableDict"];
    unsigned __int8 v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v3, v5);

    goto LABEL_9;
  }
  if (v3)
  {
    double v6 = +[NSBundle bundleForClass:objc_opt_class()];
    unint64_t v9 = [v6 localizedStringForKey:@"SYNC_SETTINGS_CONTENT_SUMMARY_HEADER_ALBUMS" value:&stru_14B18 table:@"LocalizableDict"];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v3);
    unsigned __int8 v8 = LABEL_8:;

    goto LABEL_9;
  }
  if (v4)
  {
    double v6 = +[NSBundle bundleForClass:objc_opt_class()];
    unint64_t v9 = [v6 localizedStringForKey:@"SYNC_SETTINGS_CONTENT_SUMMARY_HEADER_PLAYLISTS" value:&stru_14B18 table:@"LocalizableDict"];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v5);
    goto LABEL_8;
  }
  double v6 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v8 = [v6 localizedStringForKey:@"SYNC_SETTINGS_CONTENT_SUMMARY_HEADER_NOTHING_ADDED_TITLE" value:@"No Music" table:0];
LABEL_9:

  return v8;
}

- (id)_contentHeaderViewSubtitle
{
  unint64_t v3 = [(NMBridgeSyncedMusicController *)self _numberOfAlbums];
  unint64_t v4 = v3 | [(NMBridgeSyncedMusicController *)self _numberOfPlaylists];
  unint64_t v5 = +[NRPairedDeviceRegistry sharedInstance];
  double v6 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v7 = [v5 getAllDevicesWithArchivedAltAccountDevicesMatching:v6];
  unsigned __int8 v8 = [v7 firstObject];
  id v9 = objc_alloc((Class)NSUUID);
  if (v4)
  {
    id v16 = [v9 initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
    unsigned int v17 = [v8 supportsCapability:v16];

    if (v17)
    {
      unint64_t v5 = [(NMBridgeSyncedMusicController *)self syncInfoController];
      float v18 = [v5 syncStatusDetailText];
      goto LABEL_10;
    }
    unint64_t v5 = +[NMSSyncManager sharedManager];
    double v6 = [v5 musicProgressInfo];
    float v18 = [v6 _trackProgressTextForMediaType:8];
  }
  else
  {
    id v10 = [v9 initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
    unsigned __int8 v11 = [v8 supportsCapability:v10];
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = v12;
    if (v11)
    {
      CFStringRef v14 = @"SYNC_SETTINGS_CONTENT_SUMMARY_HEADER_NOTHING_ADDED_MESSAGE";
      CFStringRef v15 = @"You can choose to auto-download your Recent Music on your Apple Watch, or manually add albums and playlists.";
    }
    else
    {
      CFStringRef v14 = @"SYNC_SETTINGS_CONTENT_SUMMARY_HEADER_NOTHING_ADDED_MESSAGE_LEGACY";
      CFStringRef v15 = @"You can choose to automatically keep your Recent Music up-to-date on your Apple Watch, or manually add albums and playlists from your iPhone.";
    }
    float v18 = [v12 localizedStringForKey:v14 value:v15 table:0];
  }
LABEL_10:

  return v18;
}

- (float)_contentHeaderViewProgress
{
  unint64_t v3 = +[NRPairedDeviceRegistry sharedInstance];
  unint64_t v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  unint64_t v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  double v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  unsigned int v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    id v9 = [(NMBridgeSyncedMusicController *)self syncInfoController];
    id v10 = [v9 syncInfo];
    float v11 = 0.0;
    if ([v10 status] == (char *)&dword_0 + 3)
    {
      id v12 = [(NMBridgeSyncedMusicController *)self syncInfoController];
      id v13 = [v12 syncInfo];
      [v13 progress];
LABEL_6:
      float v11 = v14;
    }
  }
  else
  {
    id v9 = +[NMSSyncManager sharedManager];
    id v10 = [v9 musicProgressInfo];
    float v11 = 0.0;
    if ([v10 _isSyncing])
    {
      id v12 = +[NMSSyncManager sharedManager];
      id v13 = [v12 musicProgressInfo];
      [v13 estimatedSyncProgress];
      goto LABEL_6;
    }
  }

  return v11;
}

- (void)_presentDownloadWaitingAlertIfNeededWithModelObject:(id)a3
{
  id v15 = a3;
  unint64_t v4 = objc_msgSend(v15, "nms_syncInfoContainerIdentifier");
  unint64_t v5 = [(NMBridgeSyncedMusicController *)self syncInfoController];
  double v6 = [v5 syncInfo];
  unint64_t v7 = (unint64_t)[v6 statusForContainer:v4];

  unsigned int v8 = [(NMBridgeSyncedMusicController *)self syncInfoController];
  id v9 = [v8 syncInfo];
  id v10 = [v9 downloadPauseReasonForContainer:v4];

  if (v7 <= 5 && ((1 << v7) & 0x26) != 0)
  {
    id v11 = objc_alloc_init((Class)NMSKeepLocalRequestOptions);
    [v11 setQualityOfService:25];
    [v11 setCellularBundleIdentifier:@"com.apple.NanoMusic"];
    id v12 = objc_alloc((Class)NMUDownloadWaitingAlertController);
    id v13 = [(NMBridgeSyncedMusicController *)self _selfOrPresentedViewController];
    id v14 = [v12 initWithModelObject:v15 status:v7 downloadPauseReason:v10 options:v11 presentingViewController:v13];

    [v14 presentWithCompletion:0];
  }
}

- (PSSpecifier)addMusicSpecifier
{
  addMusicSpecifier = self->_addMusicSpecifier;
  if (!addMusicSpecifier)
  {
    unint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    unint64_t v5 = [v4 localizedStringForKey:@"ADD_MUSIC_TITLE" value:@"Add Music…" table:0];
    double v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];
    unint64_t v7 = self->_addMusicSpecifier;
    self->_addMusicSpecifier = v6;

    [(PSSpecifier *)self->_addMusicSpecifier setButtonAction:"_addMusicAction"];
    [(PSSpecifier *)self->_addMusicSpecifier setProperty:objc_opt_class() forKey:PSCellClassKey];
    id v8 = objc_alloc_init((Class)NMBUIMediaTableCellConfiguration);
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"ADD_MUSIC_TITLE" value:@"Add Music…" table:0];
    [v8 setTitle:v10];

    [v8 setPlaceholderSystemImageName:@"plus"];
    id v11 = BPSBridgeTintColor();
    [v8 setPlaceholderIconColor:v11];

    [(PSSpecifier *)self->_addMusicSpecifier setProperty:v8 forKey:NMBUISpecifierCellConfigurationKey];
    addMusicSpecifier = self->_addMusicSpecifier;
  }

  return addMusicSpecifier;
}

- (id)_recommendationSpecifierWithRecommendation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[NMSMediaItemGroup itemGroupWithQuotaRefObj:v4];
  double v6 = [v4 items];
  if ([v6 count] == (char *)&dword_0 + 1)
  {
    unint64_t v7 = [v4 items];
    id v8 = [v7 firstObject];
  }
  else
  {
    id v8 = 0;
  }

  id v9 = +[NRPairedDeviceRegistry sharedInstance];
  id v10 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v11 = [v9 getAllDevicesWithArchivedAltAccountDevicesMatching:v10];
  id v12 = [v11 firstObject];
  id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  unsigned int v14 = [v12 supportsCapability:v13];

  if (!v14)
  {
    id v16 = [v4 identifier];
    uint64_t v18 = 0;
    char v17 = [v16 isEqualToString:NMSRecommendationRecentMusicIdentifier] ^ 1;
    id v15 = self;
    goto LABEL_8;
  }
  id v15 = self;
  if ([v4 isSelected])
  {
    id v16 = [v4 identifier];
    char v17 = 0;
    uint64_t v18 = [v16 isEqualToString:NMSRecommendationRecentMusicIdentifier] ^ 1;
LABEL_8:

    goto LABEL_10;
  }
  uint64_t v18 = 0;
  char v17 = 0;
LABEL_10:
  float v19 = [v4 title];
  unsigned __int8 v20 = [v4 identifier];
  unsigned int v21 = [v20 isEqualToString:NMSRecommendationRecentMusicIdentifier];

  if (v21)
  {
    long long v22 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v23 = [v22 localizedStringForKey:@"RECENT_MUSIC" value:@"Recent Music" table:0];

    float v19 = (void *)v23;
  }
  long long v24 = [v4 identifier];
  unsigned __int8 v25 = [v24 isEqualToString:NMSRecommendationRecentMusicIdentifier];

  if (v25)
  {
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v27 = [v4 items];
    id v28 = [v27 firstObject];

    uint64_t v26 = objc_msgSend(v28, "nms_lastUpdatedString");
  }
  CFStringRef v29 = [v4 artworkCatalog];
  LOBYTE(v32) = v17;
  CFStringRef v30 = [(NMBridgeSyncedMusicController *)v15 _specifierWithTitle:v19 subtitle:v26 artworkCatalog:v29 modelObject:v8 showSwitch:1 showDownloadInfo:v18 showWarningIfAboveQuota:v32 itemGroup:v5 set:"_setRecommendationSelected:withSpecifier:" get:"_recommendationSelected:"];

  [v30 setProperty:v4 forKey:@"NMBSpecifierRecommendationKey"];

  return v30;
}

- (id)_playlistSpecifierWithPlaylist:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 artworkCatalog];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v4 tracksTiledArtworkCatalogWithRows:2 columns:2];
  }
  CFStringRef v29 = v7;

  id v8 = [v4 curator];
  id v9 = [v8 name];
  if ([v9 length])
  {
    id v10 = +[NSBundle bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"PLAYLIST_SUBTITLE" value:@"Playlist by %@" table:0];
    id v12 = [v4 curator];
    id v13 = [v12 name];
    unsigned int v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v13);
  }
  else
  {
    unsigned int v14 = 0;
  }

  id v15 = [v4 identifiers];
  id v16 = [v15 library];
  char v17 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v16 persistentID]);
  uint64_t v18 = +[NMSMediaItemGroup itemGroupWithSyncedPlaylistID:v17 downloadedItemsOnly:0];

  float v19 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned __int8 v20 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  unsigned int v21 = [v19 getAllDevicesWithArchivedAltAccountDevicesMatching:v20];
  long long v22 = [v21 firstObject];
  id v23 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  id v24 = [v22 supportsCapability:v23];

  unsigned __int8 v25 = [v4 name];
  LOBYTE(v28) = v24 ^ 1;
  uint64_t v26 = [(NMBridgeSyncedMusicController *)self _specifierWithTitle:v25 subtitle:v14 artworkCatalog:v29 modelObject:v4 showSwitch:0 showDownloadInfo:v24 showWarningIfAboveQuota:v28 itemGroup:v18 set:0 get:0];

  return v26;
}

- (id)_albumSpecifierWithAlbum:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 artist];
  double v6 = [v5 name];
  if ([v6 length])
  {
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"ALBUM_SUBTITLE" value:@"Album by %@" table:0];
    id v9 = [v4 artist];
    id v10 = [v9 name];
    id v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10);
  }
  else
  {
    id v11 = 0;
  }

  id v12 = [v4 identifiers];
  id v13 = [v12 library];
  unsigned int v14 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v13 persistentID]);
  id v15 = +[NMSMediaItemGroup itemGroupWithSyncedAlbumID:v14 downloadedItemsOnly:0];

  id v16 = +[NRPairedDeviceRegistry sharedInstance];
  char v17 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint64_t v18 = [v16 getAllDevicesWithArchivedAltAccountDevicesMatching:v17];
  float v19 = [v18 firstObject];
  id v20 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  id v21 = [v19 supportsCapability:v20];

  long long v22 = [v4 title];
  id v23 = [v4 artworkCatalog];
  LOBYTE(v26) = v21 ^ 1;
  id v24 = [(NMBridgeSyncedMusicController *)self _specifierWithTitle:v22 subtitle:v11 artworkCatalog:v23 modelObject:v4 showSwitch:0 showDownloadInfo:v21 showWarningIfAboveQuota:v26 itemGroup:v15 set:0 get:0];

  return v24;
}

- (id)_specifierWithTitle:(id)a3 subtitle:(id)a4 artworkCatalog:(id)a5 modelObject:(id)a6 showSwitch:(BOOL)a7 showDownloadInfo:(BOOL)a8 showWarningIfAboveQuota:(BOOL)a9 itemGroup:(id)a10 set:(SEL)a11 get:(SEL)a12
{
  BOOL v47 = a8;
  BOOL v12 = a7;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v48 = a10;
  if (v12) {
    uint64_t v21 = 6;
  }
  else {
    uint64_t v21 = 3;
  }
  BOOL v46 = self;
  long long v22 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:a11 get:a12 detail:0 cell:v21 edit:0];
  [v22 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v22 setProperty:&off_150F0 forKey:PSTableCellStyleOverrideKey];
  id v23 = objc_alloc_init((Class)NMBUIMediaTableCellConfiguration);
  v52 = v20;
  [v23 setModelObject:v20];
  v49 = v19;
  [v23 setArtworkCatalog:v19];
  [v23 setPlaceholderSystemImageName:@"music"];
  v51 = v17;
  [v23 setTitle:v17];
  v50 = v18;
  [v23 setSubtitle:v18];
  id v24 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned __int8 v25 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint64_t v26 = [v24 getAllDevicesWithArchivedAltAccountDevicesMatching:v25];
  uint64_t v27 = [v26 firstObject];
  id v28 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  unsigned int v29 = [v27 supportsCapability:v28];

  if (v29 && v47)
  {
    CFStringRef v30 = [(NMBridgeSyncedMusicController *)v46 syncInfoController];
    id v31 = [v30 downloadStateForModelObject:v52];

    uint64_t v32 = [(NMBridgeSyncedMusicController *)v46 syncInfoController];
    [v32 progressForModelObject:v52];
    double v34 = v33;

    id v35 = [objc_alloc((Class)NMBUIMediaTableCellDownloadState) initWithState:v31 progress:v34];
    [v23 setDownloadState:v35];

    objc_initWeak(location, v46);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_A100;
    v53[3] = &unk_14670;
    objc_copyWeak(&v55, location);
    id v54 = v52;
    [v23 setDownloadIndicatorTapAction:v53];

    objc_destroyWeak(&v55);
    objc_destroyWeak(location);
  }
  [v22 setProperty:v23 forKey:NMBUISpecifierCellConfigurationKey];
  long long v36 = +[NSNumber numberWithBool:v12];
  [v22 setProperty:v36 forKey:NMBUISpecifierShouldShowSwitchKey];

  long long v37 = +[NRPairedDeviceRegistry sharedInstance];
  long long v38 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v39 = [v37 getAllDevicesWithArchivedAltAccountDevicesMatching:v38];
  id v40 = [v39 firstObject];
  id v41 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4649745E-094C-4F84-80DD-F7AB46F54792"];
  if (([v40 supportsCapability:v41] & 1) != 0 || !a9)
  {

    __int16 v43 = v48;
  }
  else
  {
    id v42 = +[NMSMediaPinningManager sharedManager];
    __int16 v43 = v48;
    unsigned __int8 v44 = [v42 isItemGroupWithinQuota:v48];

    if (v44) {
      goto LABEL_13;
    }
    [v22 setProperty:&__kCFBooleanTrue forKey:NMBUISpecifierShouldShowExclamationIconKey];
    [v22 setProperty:v46 forKey:NMBUISpecifierIconTargetKey];
    long long v37 = NSStringFromSelector("_showSyncStorageWarning");
    [v22 setProperty:v37 forKey:NMBUISpecifierIconActionStringKey];
  }

LABEL_13:

  return v22;
}

- (id)_selfOrPresentedViewController
{
  unint64_t v3 = [(NMBridgeSyncedMusicController *)self presentedViewController];

  if (v3)
  {
    id v4 = [(NMBridgeSyncedMusicController *)self presentedViewController];
  }
  else
  {
    id v4 = self;
  }

  return v4;
}

- (void)_showSyncStorageWarning
{
  unint64_t v3 = sub_CF20(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[NMBridgeSyncedMusicController] _showSyncStorageWarning", v13, 2u);
  }

  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unint64_t v5 = [v4 localizedStringForKey:@"SYNC_SETTINGS_SYNC_STORAGE_LIMIT_TOO_LOW_TITLE" value:@"The storage space dedicated to media on your Apple Watch is full." table:0];
  double v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"SYNC_SETTINGS_SYNC_STORAGE_LIMIT_TOO_LOW_MESSAGE", @"To make space available, you can remove some podcasts, music, or audiobooks.", 0 value table];
  id v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"SYNC_SETTINGS_SYNC_STORAGE_LIMIT_TOO_LOW_OK_ACTION" value:@"OK" table:0];
  id v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:0];
  [v8 addAction:v11];

  BOOL v12 = [(NMBridgeSyncedMusicController *)self _selfOrPresentedViewController];
  [v12 presentViewController:v8 animated:1 completion:0];
}

- (id)_recommendationSelected:(id)a3
{
  unint64_t v3 = [a3 propertyForKey:@"NMBSpecifierRecommendationKey"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isSelected]);

  return v4;
}

- (void)_setRecommendationSelected:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  double v6 = [a4 propertyForKey:@"NMBSpecifierRecommendationKey"];
  id v7 = [v5 BOOLValue];

  [v6 setSelected:v7];
  id v8 = +[NMSMusicRecommendationManager sharedManager];
  id v10 = v6;
  id v9 = +[NSArray arrayWithObjects:&v10 count:1];
  [v8 persistRecommendationsSelections:v9];
}

- (void)_addMusicAction
{
  id v5 = [objc_alloc((Class)MPMediaPickerController) initWithMediaTypes:1];
  [v5 setDelegate:self];
  [v5 setPicksSingleCollectionEntity:1];
  unint64_t v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = [v3 getActivePairedDevice];
  [v5 setWatchCompatibilityVersion:NRWatchOSVersionForRemoteDevice()];

  [(NMBridgeSyncedMusicController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_dismissMusicPicker
{
}

- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  id v7 = sub_CF20(13);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "[NMBridgeSyncedMusicController] mediaPicker:didPickMediaItems:", buf, 2u);
  }

  id v8 = [v6 itemsQuery];
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"ADD_MUSIC_TITLE" value:@"Add Music…" table:0];

  id v43 = 0;
  uint64_t v44 = 0;
  [(NMBridgeSyncedMusicController *)self _getRepresentativeCollectionGrouping:&v44 propertyPredicate:&v43 mediaQuery:v8];
  id v11 = v43;
  BOOL v12 = v11;
  if (!v11)
  {
    id v34 = 0;
    goto LABEL_14;
  }
  id v13 = [v11 value];
  id v34 = [v13 longLongValue];

  if (v44 != 6)
  {
    if (v44 == 1)
    {
      unsigned int v14 = [v6 representativeItem];
      id v15 = [v14 albumTitle];

      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_ABB0;
      v41[3] = &unk_14698;
      id v16 = v15;
      id v42 = v16;
      id v17 = +[MPModelAlbum nms_modelObjectWithLibraryPersistentID:v34 block:v41];
      [(NMBridgeSyncedMusicController *)self _pinAlbum:v17];
      id v18 = v16;

      id v10 = v18;
    }
    else
    {
      id v18 = sub_CF20(13);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_D270(&v44, v18);
      }
    }

    goto LABEL_14;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  BOOL v47 = sub_ABBC;
  id v48 = sub_ABCC;
  id v49 = 0;
  uint64_t v37 = 0;
  long long v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  id v19 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  id v20 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyContainerPersistentId equalToInt64:v34];
  uint64_t v32 = +[ML3Container queryWithLibrary:v19 predicate:v20];

  [v32 setLimit:1];
  v45[0] = ML3ContainerPropertyName;
  v45[1] = ML3ContainerPropertyDistinguishedKind;
  uint64_t v21 = +[NSArray arrayWithObjects:v45 count:2];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_ABD4;
  v36[3] = &unk_146C0;
  v36[4] = buf;
  v36[5] = &v37;
  [v32 enumeratePersistentIDsAndProperties:v21 usingBlock:v36];

  if (!*((unsigned char *)v38 + 24)) {
    goto LABEL_10;
  }
  id v31 = +[NRPairedDeviceRegistry sharedInstance];
  long long v22 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v23 = [v31 getAllDevicesWithArchivedAltAccountDevicesMatching:v22];
  id v24 = [v23 firstObject];
  id v25 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"205EB184-AC17-4886-BC97-09F15A9CA5F1"];
  unsigned __int8 v26 = [v24 supportsCapability:v25];

  if ((v26 & 1) == 0)
  {
    [(NMBridgeSyncedMusicController *)self _presentFavoritesPlaylistUnsupportedAlert];
    char v29 = 1;
  }
  else
  {
LABEL_10:
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_AC4C;
    v35[3] = &unk_146E8;
    v35[4] = buf;
    uint64_t v27 = +[MPModelPlaylist nms_modelObjectWithLibraryPersistentID:v34 block:v35];
    [(NMBridgeSyncedMusicController *)self _pinPlaylist:v27];
    id v28 = *(id *)(*(void *)&buf[8] + 40);

    char v29 = 0;
    id v10 = v28;
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(buf, 8);

  if ((v29 & 1) == 0)
  {
LABEL_14:
    CFStringRef v30 = sub_CF20(13);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v44;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v34;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "[NMBridgeSyncedMusicController] Picked collectionGrouping:%ld, persistentID:%lld", buf, 0x16u);
    }

    [(NMBridgeSyncedMusicController *)self _dismissMusicPicker];
    [(NMBridgeSyncedMusicController *)self _reloadContents];
    [(NMBridgeSyncedMusicController *)self setDesiredVerticalContentOffsetItemNamed:v10];
  }
}

- (void)mediaPickerDidCancel:(id)a3
{
  id v4 = sub_CF20(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "[NMBridgeSyncedMusicController] mediaPickerDidCancel", v5, 2u);
  }

  [(NMBridgeSyncedMusicController *)self _dismissMusicPicker];
}

- (void)_presentFavoritesPlaylistUnsupportedAlert
{
  unint64_t v3 = sub_CF20(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_D2EC(v3);
  }

  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"SYNC_SETTINGS_FAVORITES_PLAYLIST_UPDATE_TITLE" value:@"Update Required" table:0];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"SYNC_SETTINGS_FAVORITES_PLAYLIST_UPDATE_DESCRIPTION" value:@"Install watchOS 10.1 or later to use favorites and download the Favorite Songs playlist." table:0];
  id v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"SYNC_SETTINGS_FAVORITES_PLAYLIST_DISMISS_ACTION" value:@"OK" table:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_AEE8;
  v13[3] = &unk_14710;
  v13[4] = self;
  id v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v13];
  [v8 addAction:v11];

  BOOL v12 = [(NMBridgeSyncedMusicController *)self _selfOrPresentedViewController];
  [v12 presentViewController:v8 animated:1 completion:0];
}

- (void)_getRepresentativeCollectionGrouping:(int64_t *)a3 propertyPredicate:(id *)a4 mediaQuery:(id)a5
{
  id v14 = a5;
  uint64_t v7 = [v14 predicateForProperty:MPMediaItemPropertyAlbumPersistentID];
  if (v7)
  {
    id v8 = (void *)v7;
    int64_t v9 = 1;
  }
  else
  {
    uint64_t v10 = [v14 predicateForProperty:MPMediaItemPropertyArtistPersistentID];
    if (v10)
    {
      id v8 = (void *)v10;
      int64_t v9 = 2;
    }
    else
    {
      uint64_t v11 = [v14 predicateForProperty:MPMediaItemPropertyAlbumArtistPersistentID];
      if (v11)
      {
        id v8 = (void *)v11;
        int64_t v9 = 3;
      }
      else
      {
        uint64_t v12 = [v14 predicateForProperty:MPMediaItemPropertyComposerPersistentID];
        if (v12)
        {
          id v8 = (void *)v12;
          int64_t v9 = 4;
        }
        else
        {
          uint64_t v13 = [v14 predicateForProperty:MPMediaItemPropertyGenrePersistentID];
          if (v13)
          {
            id v8 = (void *)v13;
            int64_t v9 = 5;
          }
          else
          {
            id v8 = [v14 predicateForProperty:MPMediaPlaylistPropertyPersistentID];
            int64_t v9 = 6;
            if (!v8) {
              int64_t v9 = 0;
            }
          }
        }
      }
    }
  }
  if (a3) {
    *a3 = v9;
  }
  if (a4) {
    *a4 = v8;
  }
}

- (id)_pinnedPlaylists
{
  unint64_t v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  id v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
  unsigned __int8 v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    int64_t v9 = [(NMBridgeSyncedMusicController *)self syncInfoController];
    uint64_t v10 = [v9 syncInfo];
    uint64_t v11 = [v10 keepLocalEnabledPlaylists];
    id v12 = [(NMBridgeSyncedMusicController *)self _libraryPersistentIDs:v11 type:4];
  }
  else
  {
    uint64_t v13 = +[NMSMediaPinningManager sharedManager];
    id v14 = [v13 pinnedPlaylists];
    int64_t v9 = +[NSMutableSet setWithArray:v14];

    id v15 = +[NMSMediaPinningManager sharedManager];
    uint64_t v10 = [v15 workoutPlaylistID];

    if ([v10 longLongValue]) {
      [v9 addObject:v10];
    }
    id v12 = [v9 copy];
  }

  return v12;
}

- (id)_pinnedAlbums
{
  unint64_t v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  id v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
  unsigned __int8 v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    int64_t v9 = [(NMBridgeSyncedMusicController *)self syncInfoController];
    uint64_t v10 = [v9 syncInfo];
    uint64_t v11 = [v10 keepLocalEnabledAlbums];
    id v12 = [(NMBridgeSyncedMusicController *)self _libraryPersistentIDs:v11 type:2];
  }
  else
  {
    int64_t v9 = +[NMSMediaPinningManager sharedManager];
    uint64_t v10 = [v9 pinnedAlbums];
    id v12 = +[NSSet setWithArray:v10];
  }

  return v12;
}

- (id)_workoutPlaylistID
{
  uint64_t v2 = +[NMSMediaPinningManager sharedManager];
  unint64_t v3 = [v2 workoutPlaylistID];

  return v3;
}

- (unint64_t)_numberOfAlbums
{
  unint64_t v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  id v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
  unsigned __int8 v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    int64_t v9 = [(NMBridgeSyncedMusicController *)self syncInfoController];
    uint64_t v10 = [v9 syncInfo];
    uint64_t v11 = [v10 allAlbums];
    id v12 = [(NMBridgeSyncedMusicController *)self _libraryPersistentIDs:v11 type:2];
    id v13 = [v12 count];
  }
  else
  {
    int64_t v9 = +[NMSMediaPinningManager sharedManager];
    uint64_t v10 = [v9 albumIdentifiers];
    id v13 = [v10 count];
  }

  return (unint64_t)v13;
}

- (unint64_t)_numberOfPlaylists
{
  unint64_t v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  id v6 = [v5 firstObject];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
  unsigned __int8 v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    int64_t v9 = [(NMBridgeSyncedMusicController *)self syncInfoController];
    uint64_t v10 = [v9 syncInfo];
    uint64_t v11 = [v10 allPlaylists];
    id v12 = [(NMBridgeSyncedMusicController *)self _libraryPersistentIDs:v11 type:4];
    id v13 = [v12 count];
  }
  else
  {
    int64_t v9 = +[NMSMediaPinningManager sharedManager];
    uint64_t v10 = [v9 playlistIdentifiers];
    id v13 = [v10 count];
  }

  return (unint64_t)v13;
}

- (void)_pinPlaylist:(id)a3
{
  id v4 = a3;
  id v5 = sub_CF20(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[NMBridgeSyncedMusicController] Pinning playlist: %@", (uint8_t *)&v20, 0xCu);
  }

  id v6 = +[NRPairedDeviceRegistry sharedInstance];
  id v7 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  unsigned __int8 v8 = [v6 getAllDevicesWithArchivedAltAccountDevicesMatching:v7];
  int64_t v9 = [v8 firstObject];
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
  unsigned __int8 v11 = [v9 supportsCapability:v10];

  if (v11)
  {
    [(NMBridgeSyncedMusicController *)self _performKeepLocalRequestWithModelObject:v4 enableState:1];
  }
  else
  {
    id v12 = [v4 identifiers];
    id v13 = [v12 library];
    id v14 = [v13 persistentID];

    id v15 = +[NMSMediaPinningManager sharedManager];
    id v16 = +[NSNumber numberWithLongLong:v14];
    unsigned __int8 v17 = [v15 isPlaylistPinned:v16];

    if ((v17 & 1) == 0)
    {
      id v18 = +[NMSMediaPinningManager sharedManager];
      id v19 = +[NSNumber numberWithLongLong:v14];
      [v18 pinPlaylist:v19 completionHandler:0];
    }
  }
}

- (void)_pinAlbum:(id)a3
{
  id v4 = a3;
  id v5 = sub_CF20(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[NMBridgeSyncedMusicController] Pinning album: %@", (uint8_t *)&v20, 0xCu);
  }

  id v6 = +[NRPairedDeviceRegistry sharedInstance];
  id v7 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  unsigned __int8 v8 = [v6 getAllDevicesWithArchivedAltAccountDevicesMatching:v7];
  int64_t v9 = [v8 firstObject];
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
  unsigned __int8 v11 = [v9 supportsCapability:v10];

  if (v11)
  {
    [(NMBridgeSyncedMusicController *)self _performKeepLocalRequestWithModelObject:v4 enableState:1];
  }
  else
  {
    id v12 = [v4 identifiers];
    id v13 = [v12 library];
    id v14 = [v13 persistentID];

    id v15 = +[NMSMediaPinningManager sharedManager];
    id v16 = +[NSNumber numberWithLongLong:v14];
    unsigned __int8 v17 = [v15 isAlbumPinned:v16];

    if ((v17 & 1) == 0)
    {
      id v18 = +[NMSMediaPinningManager sharedManager];
      id v19 = +[NSNumber numberWithLongLong:v14];
      [v18 pinAlbum:v19 completionHandler:0];
    }
  }
}

- (void)_unpinPlaylist:(id)a3
{
  id v4 = a3;
  id v5 = sub_CF20(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[NMBridgeSyncedMusicController] Unpinning playlist: %@", (uint8_t *)&v16, 0xCu);
  }

  id v6 = +[NRPairedDeviceRegistry sharedInstance];
  id v7 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  unsigned __int8 v8 = [v6 getAllDevicesWithArchivedAltAccountDevicesMatching:v7];
  int64_t v9 = [v8 firstObject];
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
  unsigned __int8 v11 = [v9 supportsCapability:v10];

  if (v11)
  {
    [(NMBridgeSyncedMusicController *)self _performKeepLocalRequestWithModelObject:v4 enableState:-1];
  }
  else
  {
    id v12 = +[NMSMediaPinningManager sharedManager];
    id v13 = [v4 identifiers];
    id v14 = [v13 library];
    id v15 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v14 persistentID]);
    [v12 unpinPlaylist:v15 completionHandler:0];
  }
}

- (void)_unpinAlbum:(id)a3
{
  id v4 = a3;
  id v5 = sub_CF20(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[NMBridgeSyncedMusicController] Unpinning album: %@", (uint8_t *)&v16, 0xCu);
  }

  id v6 = +[NRPairedDeviceRegistry sharedInstance];
  id v7 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  unsigned __int8 v8 = [v6 getAllDevicesWithArchivedAltAccountDevicesMatching:v7];
  int64_t v9 = [v8 firstObject];
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
  unsigned __int8 v11 = [v9 supportsCapability:v10];

  if (v11)
  {
    [(NMBridgeSyncedMusicController *)self _performKeepLocalRequestWithModelObject:v4 enableState:-1];
  }
  else
  {
    id v12 = +[NMSMediaPinningManager sharedManager];
    id v13 = [v4 identifiers];
    id v14 = [v13 library];
    id v15 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v14 persistentID]);
    [v12 unpinAlbum:v15 completionHandler:0];
  }
}

- (void)_performKeepLocalRequestWithModelObject:(id)a3 enableState:(int64_t)a4
{
  id v6 = a3;
  [(NMBridgeSyncedMusicController *)self _prepareTransientStateWithModelObject:v6 enableState:a4];
  id v7 = objc_alloc_init((Class)NMSKeepLocalRequestOptions);
  [v7 setCellularBundleIdentifier:@"com.apple.NanoMusic"];
  [v7 setQualityOfService:25];
  id v8 = [objc_alloc((Class)NMSKeepLocalRequestProxy) initWithModelObject:v6 enableState:a4];
  id v9 = [objc_alloc((Class)NMUKeepLocalRequestController) initWithRequest:v8 presentingViewController:self];
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_C044;
  v14[3] = &unk_14760;
  objc_copyWeak(&v16, &location);
  id v10 = v6;
  id v15 = v10;
  [v9 performRequestWithOptions:v7 completion:v14];
  unsigned __int8 v11 = +[NMSyncDefaults sharedDefaults];
  [v11 setLastUserPinningChangeDateForBundleID:@"com.apple.NanoMusic"];

  id v12 = sub_CF20(13);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "[NMBridgeSyncedMusicController] Music: Set last user pinning change date, due to KeepLocal change.", v13, 2u);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (id)_libraryPersistentIDs:(id)a3 type:(int64_t)a4
{
  id v6 = [a3 mutableCopy];
  id v7 = [(NMKeepLocalTransientState *)self->_keepLocalTransientState modelObjectsWithEnableState:1 type:a4];
  id v8 = [v7 valueForKeyPath:@"identifiers.library.persistentID"];
  [v6 unionSet:v8];

  id v9 = [(NMKeepLocalTransientState *)self->_keepLocalTransientState modelObjectsWithEnableState:-1 type:a4];
  id v10 = [v9 valueForKeyPath:@"identifiers.library.persistentID"];
  [v6 minusSet:v10];

  id v11 = [v6 copy];

  return v11;
}

- (void)_prepareTransientStateWithModelObject:(id)a3 enableState:(int64_t)a4
{
  [(NMKeepLocalTransientState *)self->_keepLocalTransientState setEnableState:a4 forModelObject:a3];

  [(NMBridgeSyncedMusicController *)self _reloadContents];
}

- (void)_completeTransientStateWithModelObject:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    keepLocalTransientState = self->_keepLocalTransientState;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_C3A0;
    v8[3] = &unk_14788;
    objc_copyWeak(&v9, &location);
    [(NMKeepLocalTransientState *)keepLocalTransientState confirmEnableStateForModelObject:v6 expirationBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    [(NMKeepLocalTransientState *)self->_keepLocalTransientState removeEnableStateForModelObject:v6];
    [(NMBridgeSyncedMusicController *)self _reloadContents];
  }
}

- (void)setEditable:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NMBridgeSyncedMusicController *)self editable] != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)NMBridgeSyncedMusicController;
    [(NMBridgeSyncedMusicController *)&v10 setEditable:v3];
    if (v3)
    {
      id v5 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__table];
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      id v7 = [v6 localizedStringForKey:@"PLAYLIST_ALBUM_SECTION_TITLE" value:@"PLAYLISTS & ALBUMS" table:0];
      id v8 = [(NMBridgeSyncedMusicController *)self specifierForID:v7];
      id v9 = [(NMBridgeSyncedMusicController *)self indexPathForSpecifier:v8];
      [v5 scrollToRowAtIndexPath:v9 atScrollPosition:1 animated:1];
    }
  }
}

- (void)_disableEditableAndButtonIfNothingLeftToEdit
{
  if (![(NMBridgeSyncedMusicController *)self _hasAlbumsOrPlaylists])
  {
    [(NMBridgeSyncedMusicController *)self setEditable:0];
    [(NMBridgeSyncedMusicController *)self setEditingButtonHidden:1 animated:1];
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NMBridgeSyncedMusicController *)self specifierAtIndexPath:v7];
  if ([(NMBridgeSyncedMusicController *)self editable])
  {
    id v9 = [v8 identifier];
    objc_super v10 = +[NSBundle bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"ADD_MUSIC_TITLE" value:@"Add Music…" table:0];
    unsigned int v12 = [v9 isEqualToString:v11];

    if (v12)
    {
      id v13 = sub_CF20(13);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[NMBridgeSyncedMusicController] Add Music tapped while editable; ending editable mode",
          buf,
          2u);
      }

      [(NMBridgeSyncedMusicController *)self setEditable:0];
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)NMBridgeSyncedMusicController;
  id v14 = [(NMBridgeSyncedMusicController *)&v16 tableView:v6 willSelectRowAtIndexPath:v7];

  return v14;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (char *)[v6 section];
  id v9 = (char *)[v7 numberOfSections];

  if (v8 == v9 - 1)
  {
    objc_super v10 = [(NMBridgeSyncedMusicController *)self specifierAtIndexPath:v6];
    id v11 = [v10 identifier];
    unsigned int v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"ADD_MUSIC_TITLE" value:@"Add Music…" table:0];
    unsigned int v14 = [v11 isEqualToString:v13] ^ 1;
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = [(NMBridgeSyncedMusicController *)self specifierAtIndexPath:v9];
  id v11 = [v10 propertyForKey:NMBUISpecifierCellConfigurationKey];
  unsigned int v12 = [v11 modelObject];

  id v13 = +[NSPredicate predicateWithFormat:@"SELF != %@", v10];
  unsigned int v14 = [v9 section];
  if (v14 != (char *)[v8 numberOfSections] - 1) {
    goto LABEL_10;
  }
  id v15 = [v12 identifiers];
  objc_super v16 = [v15 library];
  id v17 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v16 persistentID]);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NMBridgeSyncedMusicController *)self albumSpecifiers];
      v23 = long long v22 = v17;
      id v24 = [v23 filteredArrayUsingPredicate:v13];
      [(NMBridgeSyncedMusicController *)self setAlbumSpecifiers:v24];

      id v17 = v22;
      [(NMBridgeSyncedMusicController *)self _unpinAlbum:v12];
    }
    goto LABEL_9;
  }
  uint64_t v27 = v17;
  uint64_t v18 = [(NMBridgeSyncedMusicController *)self _workoutPlaylistID];
  if (!v18
    || (id v19 = (void *)v18,
        [(NMBridgeSyncedMusicController *)self _workoutPlaylistID],
        int v20 = objc_claimAutoreleasedReturnValue(),
        unsigned int v21 = [v20 isEqualToNumber:v17],
        v20,
        v19,
        !v21))
  {
    id v25 = [(NMBridgeSyncedMusicController *)self playlistSpecifiers];
    unsigned __int8 v26 = [v25 filteredArrayUsingPredicate:v13];
    [(NMBridgeSyncedMusicController *)self setPlaylistSpecifiers:v26];

    [(NMBridgeSyncedMusicController *)self _unpinPlaylist:v12];
    id v17 = v27;
LABEL_9:

LABEL_10:
    v28.receiver = self;
    v28.super_class = (Class)NMBridgeSyncedMusicController;
    [(NMBridgeSyncedMusicController *)&v28 tableView:v8 commitEditingStyle:a4 forRowAtIndexPath:v9];
    [(NMBridgeSyncedMusicController *)self _disableEditableAndButtonIfNothingLeftToEdit];
    goto LABEL_11;
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_CAEC;
  v29[3] = &unk_147B0;
  v29[4] = self;
  id v30 = v13;
  id v31 = v12;
  id v32 = v8;
  int64_t v34 = a4;
  id v33 = v9;
  [(NMBridgeSyncedMusicController *)self _showWorkoutPlaylistWarningWithDeletionCompletion:v29];

LABEL_11:
}

- (void)_showWorkoutPlaylistWarningWithDeletionCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"SYNC_SETTINGS_WORKOUT_PLAYLIST_DESCRIPTION", @"This playlist was selected as your Workout Playlist. If you remove this playlist from your Apple Watch, it will no longer play automatically when you start a workout.", 0 value table];
  id v7 = +[UIAlertController alertControllerWithTitle:v6 message:0 preferredStyle:0];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"SYNC_SETTINGS_WORKOUT_PLAYLIST_REMOVE_ACTION" value:@"Remove" table:0];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_CDDC;
  v16[3] = &unk_147D8;
  id v17 = v4;
  id v10 = v4;
  id v11 = +[UIAlertAction actionWithTitle:v9 style:2 handler:v16];
  [v7 addAction:v11];

  unsigned int v12 = +[NSBundle bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"SYNC_SETTINGS_WORKOUT_PLAYLIST_CANCEL_ACTION" value:@"Cancel" table:0];
  unsigned int v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];
  [v7 addAction:v14];

  id v15 = [(NMBridgeSyncedMusicController *)self _selfOrPresentedViewController];
  [v15 presentViewController:v7 animated:1 completion:0];
}

- (NSArray)recommendationSpecifiers
{
  return self->_recommendationSpecifiers;
}

- (void)setRecommendationSpecifiers:(id)a3
{
}

- (NSArray)playlistSpecifiers
{
  return self->_playlistSpecifiers;
}

- (void)setPlaylistSpecifiers:(id)a3
{
}

- (NSArray)albumSpecifiers
{
  return self->_albumSpecifiers;
}

- (void)setAlbumSpecifiers:(id)a3
{
}

- (void)setAddMusicSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addMusicSpecifier, 0);
  objc_storeStrong((id *)&self->_albumSpecifiers, 0);
  objc_storeStrong((id *)&self->_playlistSpecifiers, 0);
  objc_storeStrong((id *)&self->_recommendationSpecifiers, 0);
  objc_storeStrong((id *)&self->_syncInfoController, 0);

  objc_storeStrong((id *)&self->_keepLocalTransientState, 0);
}

@end