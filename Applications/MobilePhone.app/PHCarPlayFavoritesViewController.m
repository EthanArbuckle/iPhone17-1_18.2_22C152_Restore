@interface PHCarPlayFavoritesViewController
- (NSMutableArray)favoritesEntries;
- (NSMutableDictionary)transportNameCache;
- (PHCarPlayFavoritesViewController)init;
- (TPFavoritesController)favoritesController;
- (TUCallProviderManager)callProviderManager;
- (double)defaultRowHeight;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)audioFavoritesEntryForFavoritesEntry:(id)a3;
- (id)avatarViewContactForFavoritesEntry:(id)a3;
- (id)favoritesEntryAtIndex:(int64_t)a3;
- (id)subtitleForNoContentBanner;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleForNoContentBanner;
- (id)transportNameForFavoritesEntry:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)handleTPFavoritesControllerFavoritesEntriesDidChangeNotification:(id)a3;
- (void)programmaticallySelectRowAtIndexPath:(id)a3;
- (void)reloadDataForFavoritesEntries:(id)a3;
- (void)setFavoritesEntries:(id)a3;
- (void)setFavoritesEntries:(id)a3 completionHandler:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHCarPlayFavoritesViewController

- (PHCarPlayFavoritesViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)PHCarPlayFavoritesViewController;
  v2 = [(PHCarPlayGenericTableViewController *)&v12 init];
  if (v2)
  {
    v3 = +[PHApplicationServices sharedInstance];
    uint64_t v4 = [v3 callProviderManager];
    v5 = *(void **)(v2 + 65);
    *(void *)(v2 + 65) = v4;

    uint64_t v6 = [v3 favoritesController];
    v7 = *(void **)(v2 + 49);
    *(void *)(v2 + 49) = v6;

    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    v9 = *(void **)(v2 + 73);
    *(void *)(v2 + 73) = v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"handleTPFavoritesControllerFavoritesEntriesDidChangeNotification:" name:TPFavoritesControllerFavoritesEntriesDidChangeNotification object:0];
  }
  return (PHCarPlayFavoritesViewController *)v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayFavoritesViewController;
  [(PHCarPlayGenericTableViewController *)&v7 viewWillAppear:a3];
  uint64_t v4 = [(PHCarPlayFavoritesViewController *)self favoritesEntries];

  if (!v4)
  {
    v5 = [(PHCarPlayFavoritesViewController *)self favoritesController];
    uint64_t v6 = [v5 favoritesEntries];
    [(PHCarPlayFavoritesViewController *)self reloadDataForFavoritesEntries:v6];
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayFavoritesViewController;
  [(PHCarPlayGenericTableViewController *)&v4 dealloc];
}

- (void)setFavoritesEntries:(id)a3
{
}

- (void)setFavoritesEntries:(id)a3 completionHandler:(id)a4
{
  v13 = (TPFavoritesController *)a3;
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  objc_super v7 = v13;
  id v8 = v6;
  if (*(TPFavoritesController **)((char *)&self->_favoritesController + 1) == v13
    || v13
    && (v9 = -[TPFavoritesController isEqualToArray:](v13, "isEqualToArray:"), objc_super v7 = v13, (v9 & 1) != 0))
  {
    uint64_t v10 = 0;
    if (!v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v11 = (TPFavoritesController *)[(TPFavoritesController *)v7 copy];
  objc_super v12 = *(TPFavoritesController **)((char *)&self->_favoritesController + 1);
  *(TPFavoritesController **)((char *)&self->_favoritesController + 1) = v11;

  uint64_t v10 = 1;
  if (v8) {
LABEL_5:
  }
    v8[2](v8, v10);
LABEL_6:
}

- (void)handleTPFavoritesControllerFavoritesEntriesDidChangeNotification:(id)a3
{
  objc_super v4 = [a3 object];
  if (v4)
  {
    id v6 = v4;
    v5 = [v4 favoritesEntries];
    [(PHCarPlayFavoritesViewController *)self reloadDataForFavoritesEntries:v5];

    objc_super v4 = v6;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(PHCarPlayFavoritesViewController *)self favoritesEntries];
  id v6 = [v5 count];

  [(PHCarPlayGenericTableViewController *)self setNoContentBannerShown:v6 == 0];
  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"PHCarPlayFavoritesTableViewCell"];
  if (v7
    || (objc_super v7 = [[PHCarPlayFavoritesTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"PHCarPlayFavoritesTableViewCell"]) != 0)
  {
    if (v6)
    {
      uint64_t v8 = -[PHCarPlayFavoritesViewController favoritesEntryAtIndex:](self, "favoritesEntryAtIndex:", [v6 row]);
      if (v8)
      {
        unsigned __int8 v9 = (void *)v8;
        uint64_t v10 = [(PHCarPlayFavoritesViewController *)self avatarViewContactForFavoritesEntry:v8];
        v11 = [(PHCarPlayFavoritesTableViewCell *)v7 avatarView];
        [v11 setContact:v10];

        objc_super v12 = [v9 name];
        v13 = [(PHCarPlayFavoritesTableViewCell *)v7 nameLabel];
        [v13 setText:v12];

        v14 = [(PHCarPlayFavoritesViewController *)self callProviderManager];
        v15 = [v14 providerForFavoritesEntry:v9];

        if (v15)
        {
          if ([v15 isTelephonyProvider])
          {
            v16 = [v9 localizedContactPropertyLabel];
          }
          else
          {
            unsigned int v17 = [v15 isFaceTimeProvider];
            v18 = (void *)CNActionTypeVideoCall;
            v19 = [v9 actionType];
            unsigned int v20 = [v18 isEqualToString:v19];

            if (v17)
            {
              v21 = +[NSBundle mainBundle];
              v22 = v21;
              if (v20) {
                CFStringRef v23 = @"FAVORITES_ALERT_ACTION_TITLE_FACETIME_VIDEO";
              }
              else {
                CFStringRef v23 = @"FAVORITES_ALERT_ACTION_TITLE_FACETIME_AUDIO";
              }
              v16 = [v21 localizedStringForKey:v23 value:&stru_100285990 table:@"Favorites"];
            }
            else
            {
              if (v20) {
                CFStringRef v24 = @"FAVORITES_CALL_PROVIDER_NAME_%@_CALL_TYPE_VIDEO";
              }
              else {
                CFStringRef v24 = @"FAVORITES_CALL_PROVIDER_NAME_%@_CALL_TYPE_AUDIO";
              }
              v25 = +[NSBundle mainBundle];
              v26 = [v25 localizedStringForKey:v24 value:&stru_100285990 table:@"Favorites"];
              v27 = [v15 localizedName];
              v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v27);
            }
          }
        }
        else
        {
          v16 = 0;
        }
        v28 = [(PHCarPlayFavoritesTableViewCell *)v7 phoneNumberTypeLabel];
        [v28 setText:v16];
      }
    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  objc_super v4 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCallout, a4);
  [v4 _scaledValueForValue:44.0];
  double v6 = v5;

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  [(PHCarPlayFavoritesViewController *)self programmaticallySelectRowAtIndexPath:v6];
}

- (void)programmaticallySelectRowAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v6 = -[PHCarPlayFavoritesViewController favoritesEntryAtIndex:](self, "favoritesEntryAtIndex:", [v4 row]);
  objc_super v7 = PHDefaultLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Retrieving an audio favorite for favorite (%@).", buf, 0xCu);
    }

    unsigned __int8 v9 = [(PHCarPlayFavoritesViewController *)self audioFavoritesEntryForFavoritesEntry:v6];

    if (v9)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = __73__PHCarPlayFavoritesViewController_programmaticallySelectRowAtIndexPath___block_invoke;
      v10[3] = &unk_10027CD38;
      id v11 = v9;
      objc_super v7 = v9;
      [v7 performActionWithCompletion:v10];
    }
    else
    {
      objc_super v7 = PHDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PHCarPlayFavoritesViewController programmaticallySelectRowAtIndexPath:](v7);
      }
    }
  }
  else if (v8)
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not retrieve a favorite at index path (%@).", buf, 0xCu);
  }
}

void __73__PHCarPlayFavoritesViewController_programmaticallySelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__PHCarPlayFavoritesViewController_programmaticallySelectRowAtIndexPath___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (id)titleForNoContentBanner
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"NO FAVORITES" value:&stru_100285990 table:@"PHCarPlay"];

  return v3;
}

- (id)subtitleForNoContentBanner
{
  return 0;
}

- (double)defaultRowHeight
{
  return 44.0;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayFavoritesViewController;
  [(PHCarPlayGenericViewController *)&v4 viewDidLoad];
  id v3 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  [v3 setSeparatorInset:0.0, 54.0, 0.0, 0.0];
}

- (id)audioFavoritesEntryForFavoritesEntry:(id)a3
{
  id v4 = a3;
  double v5 = (void *)CNActionTypeAudioCall;
  id v6 = [v4 actionType];
  unsigned int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = v4;
  }
  else
  {
    unsigned __int8 v9 = (void *)CNActionTypeVideoCall;
    uint64_t v10 = [v4 actionType];
    LODWORD(v9) = [v9 isEqualToString:v10];

    if (v9)
    {
      id v20 = objc_alloc((Class)CNFavoritesEntry);
      v21 = [v4 contactProperty];
      id v11 = [v21 contact];
      objc_super v12 = [v4 contactProperty];
      id v13 = [v12 key];
      v14 = [v4 contactProperty];
      v15 = [v14 identifier];
      v16 = [v4 bundleIdentifier];
      unsigned int v17 = [(PHCarPlayFavoritesViewController *)self favoritesController];
      v18 = [v17 contactStore];
      id v8 = [v20 initWithContact:v11 propertyKey:v13 labeledValueIdentifier:v15 actionType:v5 bundleIdentifier:v16 store:v18];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (id)avatarViewContactForFavoritesEntry:(id)a3
{
  id v4 = a3;
  double v5 = [(PHCarPlayFavoritesViewController *)self favoritesController];
  id v6 = [v5 contactForFavoritesEntry:v4];

  return v6;
}

- (id)favoritesEntryAtIndex:(int64_t)a3
{
  id v4 = [(PHCarPlayFavoritesViewController *)self favoritesEntries];
  double v5 = v4;
  if (a3 < 0 || (unint64_t)[v4 count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (void)reloadDataForFavoritesEntries:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __66__PHCarPlayFavoritesViewController_reloadDataForFavoritesEntries___block_invoke;
  v5[3] = &unk_10027DEE0;
  objc_copyWeak(&v6, &location);
  [(PHCarPlayFavoritesViewController *)self setFavoritesEntries:v4 completionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __66__PHCarPlayFavoritesViewController_reloadDataForFavoritesEntries___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v4 = WeakRetained;
      if ([WeakRetained viewIsInAppearedState])
      {
        id v3 = [v4 mainTableView];
        [v3 reloadData];
      }
      else
      {
        [v4 setTableViewReloadIsRequiredOnViewWillAppear:1];
      }
      id WeakRetained = v4;
    }
  }
}

- (id)transportNameForFavoritesEntry:(id)a3
{
  id v4 = a3;
  double v5 = [(PHCarPlayFavoritesViewController *)self transportNameCache];
  id v6 = [v4 bundleIdentifier];
  unsigned int v7 = [v5 objectForKeyedSubscript:v6];

  if (v7 && [v7 length])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v4 localizedBundleName];

    if (v8 && [v8 length])
    {
      unsigned __int8 v9 = [(PHCarPlayFavoritesViewController *)self transportNameCache];
      uint64_t v10 = [v4 bundleIdentifier];
      [v9 setObject:v8 forKeyedSubscript:v10];
    }
  }
  id v11 = (void *)CNActionBundleIdentifierPhone;
  objc_super v12 = [v4 bundleIdentifier];
  LOBYTE(v11) = [v11 isEqualToString:v12];

  if ((v11 & 1) == 0)
  {
    id v13 = (void *)CNActionTypeAudioCall;
    v14 = [v4 actionType];
    LOBYTE(v13) = [v13 isEqualToString:v14];

    if (v13)
    {
      CFStringRef v15 = @"FAVORITES_CALL_PROVIDER_NAME_%@_CALL_TYPE_AUDIO";
    }
    else
    {
      v16 = (void *)CNActionTypeVideoCall;
      unsigned int v17 = [v4 actionType];
      LODWORD(v16) = [v16 isEqualToString:v17];

      if (v16) {
        CFStringRef v15 = @"FAVORITES_CALL_PROVIDER_NAME_%@_CALL_TYPE_VIDEO";
      }
      else {
        CFStringRef v15 = 0;
      }
    }
    v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:v15 value:&stru_100285990 table:@"Favorites"];
    uint64_t v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v8);

    id v8 = (void *)v20;
  }

  return v8;
}

- (TPFavoritesController)favoritesController
{
  return *(AVExternalDevice **)((char *)&self->super._carPlayExternalDevice + 1);
}

- (NSMutableArray)favoritesEntries
{
  return *(NSMutableArray **)((char *)&self->_favoritesController + 1);
}

- (TUCallProviderManager)callProviderManager
{
  return *(TUCallProviderManager **)((char *)&self->_favoritesEntries + 1);
}

- (NSMutableDictionary)transportNameCache
{
  return *(NSMutableDictionary **)((char *)&self->_callProviderManager + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_callProviderManager + 1), 0);
  objc_storeStrong((id *)((char *)&self->_favoritesEntries + 1), 0);
  objc_storeStrong((id *)((char *)&self->_favoritesController + 1), 0);

  objc_storeStrong((id *)((char *)&self->super._carPlayExternalDevice + 1), 0);
}

- (void)programmaticallySelectRowAtIndexPath:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not perform dial, the required audio favorite is nil.", v1, 2u);
}

void __73__PHCarPlayFavoritesViewController_programmaticallySelectRowAtIndexPath___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not open the specified favorite (%@) due to an error (%@).", (uint8_t *)&v4, 0x16u);
}

@end