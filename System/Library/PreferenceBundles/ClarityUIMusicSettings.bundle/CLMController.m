@interface CLMController
- (AXOnboardingContinueButtonEnablingDelegate)continueButtonEnablingDelegate;
- (BOOL)isContinueButtonEnabled;
- (CLMController)init;
- (PSSpecifier)editPlaylistSpecifier;
- (_TtC22ClarityUIMusicSettings18CLMInterfaceHelper)interfaceHelper;
- (id)_playlistsSpecifiers;
- (id)_specifierForPlaylistEntry:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableViewStyle;
- (void)_loadPlaylists;
- (void)_openMusicApp:(id)a3;
- (void)_showPlaylistSelectionAlert;
- (void)setContinueButtonEnablingDelegate:(id)a3;
- (void)setEditPlaylistSpecifier:(id)a3;
- (void)setInterfaceHelper:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CLMController

- (CLMController)init
{
  v9.receiver = self;
  v9.super_class = (Class)CLMController;
  v2 = [(CLMController *)&v9 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC22ClarityUIMusicSettings18CLMInterfaceHelper);
    [(CLMController *)v2 setInterfaceHelper:v3];

    v4 = +[CLFMusicSettings sharedInstance];
    v5 = [v4 selectedPlaylists];
    v6 = (NSMutableArray *)[v5 mutableCopy];
    playlistEntries = v2->_playlistEntries;
    v2->_playlistEntries = v6;
  }
  return v2;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)CLMController;
  [(CLMController *)&v14 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"MUSIC" value:&stru_10DE8 table:@"CLMMusicSettings"];
  v5 = [(CLMController *)self navigationItem];
  [v5 setTitle:v4];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v6 = (void *)qword_14EE0;
  uint64_t v23 = qword_14EE0;
  if (!qword_14EE0)
  {
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_3CFC;
    v18 = &unk_10AA0;
    v19 = &v20;
    sub_3CFC((uint64_t)&v15);
    v6 = (void *)v21[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v20, 8);
  v8 = [v7 applicationWithBundleIdentifier:AX_MusicBundleName];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  objc_super v9 = (void *)qword_14EF0;
  uint64_t v23 = qword_14EF0;
  if (!qword_14EF0)
  {
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_3EC4;
    v18 = &unk_10AA0;
    v19 = &v20;
    sub_3EC4((uint64_t)&v15);
    objc_super v9 = (void *)v21[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v20, 8);
  v11 = [v10 sharedGuard];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_316C;
  v13[3] = &unk_10A50;
  v13[4] = self;
  [v11 authenticateForSubject:v8 completion:v13];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"_loadPlaylists" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(CLMController *)self loadSpecifiersFromPlistName:@"CLMController" target:self];
    v6 = [(CLMController *)self _playlistsSpecifiers];
    id v7 = CLCreatePrivacySpecifier(@"com.apple.onboarding.applemusic", self);
    v12 = v7;
    v8 = +[NSArray arrayWithObjects:&v12 count:1];
    uint64_t v9 = [v8 arrayByAddingObjectsFromArray:v6];
    id v10 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v9;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)_specifierForPlaylistEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:4 edit:0];

  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v6 setProperty:v4 forKey:@"playlistEntry"];

  return v6;
}

- (id)_playlistsSpecifiers
{
  uint64_t v3 = +[NSMutableArray array];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"PLAYLISTS" value:&stru_10DE8 table:@"CLMMusicSettings"];
  v6 = +[PSSpecifier groupSpecifierWithName:v5];

  [v3 addObject:v6];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [(CLMController *)self interfaceHelper];
  v8 = [v7 playlists];

  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [(CLMController *)self _specifierForPlaylistEntry:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v3 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  objc_super v14 = [(CLMInterfaceHelper *)self->_interfaceHelper playlists];
  id v15 = [v14 count];
  uint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = v16;
  if (v15) {
    CFStringRef v18 = @"EDIT_PLAYLIST";
  }
  else {
    CFStringRef v18 = @"ADD_PLAYLIST";
  }
  v19 = [v16 localizedStringForKey:v18 value:&stru_10DE8 table:@"CLMMusicSettings"];

  uint64_t v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [(CLMController *)self setEditPlaylistSpecifier:v20];

  v21 = [(CLMController *)self editPlaylistSpecifier];
  [v21 setButtonAction:"_openMusicApp:"];

  uint64_t v22 = [(CLMController *)self editPlaylistSpecifier];
  [v3 addObject:v22];

  return v3;
}

- (void)_openMusicApp:(id)a3
{
}

- (void)_loadPlaylists
{
  uint64_t v3 = [(CLMController *)self interfaceHelper];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_3790;
  v4[3] = &unk_10A78;
  v4[4] = self;
  [v3 loadPlaylistsWithCompletionHandler:v4];
}

- (void)_showPlaylistSelectionAlert
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"PLAYLIST_SELECTION_ALERT_MESSAGE" value:&stru_10DE8 table:@"CLMMusicSettings"];
  id v8 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:1];

  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"OK" value:&stru_10DE8 table:@"CLMMusicSettings"];
  id v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:0];

  [v8 addAction:v7];
  [(CLMController *)self presentViewController:v8 animated:1 completion:0];
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CLMController;
  id v5 = [(CLMController *)&v14 tableView:a3 cellForRowAtIndexPath:a4];
  v6 = [v5 specifier];
  id v7 = [(CLMController *)self editPlaylistSpecifier];

  if (v6 != v7)
  {
    id v8 = +[CLMUtilities playlistEntryForSpecifier:v6];
    id v9 = +[CLFMusicSettings sharedInstance];
    id v10 = [v9 selectedPlaylists];
    uint64_t v11 = [v8 musicItemID];
    unsigned int v12 = [v10 containsObject:v11];

    if (v12) {
      [v5 setAccessoryType:3];
    }
  }

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CLMController;
  [(CLMController *)&v16 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [(CLMController *)self specifierAtIndexPath:v7];
  id v9 = +[CLMUtilities playlistEntryForSpecifier:v8];
  id v10 = [(CLMController *)self editPlaylistSpecifier];

  if (v8 != v10)
  {
    uint64_t v11 = [v6 cellForRowAtIndexPath:v7];
    unsigned int v12 = [v9 musicItemID];
    if ([(NSMutableArray *)self->_playlistEntries containsObject:v12])
    {
      if ([(NSMutableArray *)self->_playlistEntries count] == (char *)&dword_0 + 1)
      {
        [(CLMController *)self _showPlaylistSelectionAlert];
      }
      else
      {
        [v11 setAccessoryType:0];
        [(NSMutableArray *)self->_playlistEntries removeObject:v12];
      }
    }
    else
    {
      [v11 setAccessoryType:3];
      [(NSMutableArray *)self->_playlistEntries addObject:v12];
    }
    [v11 invalidateIntrinsicContentSize];
    playlistEntries = self->_playlistEntries;
    objc_super v14 = +[CLFMusicSettings sharedInstance];
    [v14 setSelectedPlaylists:playlistEntries];

    id v15 = [(CLMController *)self continueButtonEnablingDelegate];
    [v15 didUpdateIsContinueButtonEnabledForController:self];
  }
}

- (BOOL)isContinueButtonEnabled
{
  return [(NSMutableArray *)self->_playlistEntries count] != 0;
}

- (AXOnboardingContinueButtonEnablingDelegate)continueButtonEnablingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->continueButtonEnablingDelegate);

  return (AXOnboardingContinueButtonEnablingDelegate *)WeakRetained;
}

- (void)setContinueButtonEnablingDelegate:(id)a3
{
}

- (PSSpecifier)editPlaylistSpecifier
{
  return self->_editPlaylistSpecifier;
}

- (void)setEditPlaylistSpecifier:(id)a3
{
}

- (_TtC22ClarityUIMusicSettings18CLMInterfaceHelper)interfaceHelper
{
  return self->_interfaceHelper;
}

- (void)setInterfaceHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceHelper, 0);
  objc_storeStrong((id *)&self->_editPlaylistSpecifier, 0);
  objc_destroyWeak((id *)&self->continueButtonEnablingDelegate);

  objc_storeStrong((id *)&self->_playlistEntries, 0);
}

@end