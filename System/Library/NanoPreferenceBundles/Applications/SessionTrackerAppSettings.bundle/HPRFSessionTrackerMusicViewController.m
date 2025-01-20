@interface HPRFSessionTrackerMusicViewController
+ (BOOL)didSelectWorkoutMusicPlaylist;
+ (id)selectedMusicViewString;
- (HPRFSessionTrackerMusicViewController)init;
- (NSArray)userPlaylistSpecifiers;
- (NSNumber)selectedPlaylistId;
- (id)applicationBundleIdentifier;
- (id)bundle;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)_setWorkoutPlaylistID:(id)a3;
- (void)dealloc;
- (void)getAllPlaylistsWithCompletion:(id)a3;
- (void)setSelectedPlaylistId:(id)a3;
- (void)setUserPlaylistSpecifiers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HPRFSessionTrackerMusicViewController

+ (BOOL)didSelectWorkoutMusicPlaylist
{
  v2 = +[NMSMediaPinningManager sharedManager];
  v3 = [v2 workoutPlaylistID];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)selectedMusicViewString
{
  unsigned int v2 = [a1 didSelectWorkoutMusicPlaylist];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v4 = v3;
  if (v2) {
    CFStringRef v5 = @"MUSIC_ENABLED";
  }
  else {
    CFStringRef v5 = @"MUSIC_NONE";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  return v6;
}

- (HPRFSessionTrackerMusicViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)HPRFSessionTrackerMusicViewController;
  unsigned int v2 = [(HPRFSessionTrackerMusicViewController *)&v8 init];
  if (v2)
  {
    v3 = +[NMSMediaPinningManager sharedManager];
    uint64_t v4 = [v3 workoutPlaylistID];
    selectedPlaylistId = v2->_selectedPlaylistId;
    v2->_selectedPlaylistId = (NSNumber *)v4;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_42C4, kNLSessionTrackerAppPreferencesChangedNotification, 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kNLSessionTrackerAppPreferencesChangedNotification, 0);
  v4.receiver = self;
  v4.super_class = (Class)HPRFSessionTrackerMusicViewController;
  [(HPRFSessionTrackerMusicViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFSessionTrackerMusicViewController;
  [(HPRFSessionTrackerMusicViewController *)&v6 viewDidLoad];
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_451C;
  v3[3] = &unk_30DF8;
  objc_copyWeak(&v4, &location);
  [(HPRFSessionTrackerMusicViewController *)self getAllPlaylistsWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)localizedPaneTitle
{
  unsigned int v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"MUSIC_AUTOSTART_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    CFStringRef v5 = +[NSMutableArray array];
    id v6 = objc_alloc_init((Class)PSSpecifier);
    [v6 setCellType:0];
    [v6 setIdentifier:@"MUSIC_AUTOSTART_GROUP_ID"];
    [v5 addObject:v6];
    id v7 = objc_alloc_init((Class)PSSpecifier);
    [v7 setCellType:3];
    [v7 setIdentifier:@"NONE_AUTOSTART_ID"];
    objc_super v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"MUSIC_NONE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    [v7 setName:v9];

    [v5 addObject:v7];
    v10 = [(HPRFSessionTrackerMusicViewController *)self localizedPaneTitle];
    [(HPRFSessionTrackerMusicViewController *)self setTitle:v10];

    id v11 = objc_alloc_init((Class)PSSpecifier);
    [v11 setCellType:0];
    [v11 setIdentifier:@"MUSIC_PLAYLIST_GROUP_ID"];
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"PLAYLISTS" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    [v11 setName:v13];

    [v5 addObject:v11];
    if (self->_userPlaylistSpecifiers) {
      objc_msgSend(v5, "addObjectsFromArray:");
    }
    if (self->_selectedPlaylistId)
    {
      v14 = +[NSString stringWithFormat:@"%@", self->_selectedPlaylistId];
      v15 = [v5 specifierForID:v14];
      [v11 setProperty:v15 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    else
    {
      v14 = [v5 specifierForID:@"MUSIC_AUTOSTART_GROUP_ID"];
      [v14 setProperty:v7 forKey:PSRadioGroupCheckedSpecifierKey];
    }

    v16 = *(void **)&self->BPSNotificationAppController_opaque[v3];
    *(void *)&self->BPSNotificationAppController_opaque[v3] = v5;

    id v4 = *(void **)&self->BPSNotificationAppController_opaque[v3];
  }

  return v4;
}

- (void)getAllPlaylistsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)MPModelLibraryRequest);
  CFStringRef v5 = +[MPModelSong kindWithVariants:1];
  v19 = v5;
  id v6 = +[NSArray arrayWithObjects:&v19 count:1];
  id v7 = +[MPModelPlaylistEntry kindWithKinds:v6];

  objc_super v8 = +[MPModelPlaylist kindWithVariants:19 playlistEntryKind:v7 options:0];
  [v4 setItemKind:v8];

  uint64_t v9 = MPModelPropertyPlaylistName;
  uint64_t v18 = MPModelPropertyPlaylistName;
  v10 = +[NSArray arrayWithObjects:&v18 count:1];
  id v11 = +[MPPropertySet propertySetWithProperties:v10];
  [v4 setItemProperties:v11];

  v12 = +[NSSortDescriptor sortDescriptorWithKey:v9 ascending:1];
  v17 = v12;
  v13 = +[NSArray arrayWithObjects:&v17 count:1];
  [v4 setItemSortDescriptors:v13];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4BA0;
  v15[3] = &unk_30E48;
  id v16 = v3;
  id v14 = v3;
  [v4 performWithResponseHandler:v15];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HPRFSessionTrackerMusicViewController *)self indexForIndexPath:v6];
  uint64_t v9 = [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  v10 = [v9 identifier];
  unsigned __int8 v11 = [v10 isEqualToString:@"NONE_AUTOSTART_ID"];

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    v12 = [v9 propertyForKey:@"MusicSpecifierPropertyPlaylistID"];
  }
  [(HPRFSessionTrackerMusicViewController *)self _setWorkoutPlaylistID:v12];
  selectedPlaylistId = self->_selectedPlaylistId;
  self->_selectedPlaylistId = v12;
  id v14 = v12;

  [(HPRFSessionTrackerMusicViewController *)self reloadSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [WeakRetained reloadSpecifiers];

  v16.receiver = self;
  v16.super_class = (Class)HPRFSessionTrackerMusicViewController;
  [(HPRFSessionTrackerMusicViewController *)&v16 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (void)_setWorkoutPlaylistID:(id)a3
{
  id v3 = a3;
  id v4 = +[NMSMediaPinningManager sharedManager];
  [v4 setWorkoutPlaylistID:v3];

  _HKInitializeLogging();
  CFStringRef v5 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[workoutmusic] Set playlist persistent ID %@ to sync", (uint8_t *)&v6, 0xCu);
  }
  if (v3) {
    +[HPRFSessionTrackerAppSettingsTipKitHelper sendWorkoutPlaylistSelectedTipEvent];
  }
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFSessionTrackerMusicViewController *)self bundle];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

- (NSArray)userPlaylistSpecifiers
{
  return self->_userPlaylistSpecifiers;
}

- (void)setUserPlaylistSpecifiers:(id)a3
{
}

- (NSNumber)selectedPlaylistId
{
  return self->_selectedPlaylistId;
}

- (void)setSelectedPlaylistId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPlaylistId, 0);

  objc_storeStrong((id *)&self->_userPlaylistSpecifiers, 0);
}

@end