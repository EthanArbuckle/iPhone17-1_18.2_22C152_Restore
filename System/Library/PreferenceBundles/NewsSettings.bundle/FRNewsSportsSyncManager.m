@interface FRNewsSportsSyncManager
- (BOOL)isEnabled;
- (FRNewsSportsSyncManager)init;
- (PSSpecifier)specifier;
- (id)isSpecifierEnabled;
- (void)prepareUserDefaultsWithCompletion:(id)a3;
- (void)prepareUserDefaultsWithWatchlistService:(id)a3 completion:(id)a4;
- (void)prepareWithCompletion:(id)a3;
- (void)setSpecifierEnabled:(id)a3 specifier:(id)a4;
- (void)sportsFavoritesService:(id)a3;
@end

@implementation FRNewsSportsSyncManager

- (FRNewsSportsSyncManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)FRNewsSportsSyncManager;
  v2 = [(FRNewsSportsSyncManager *)&v9 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v3 localizedStringForKey:@"SPORTS_SETTINGS_SYNC_SWITCH_TITLE" value:&stru_10B80 table:@"Localizable"];
    v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:v2 set:"setSpecifierEnabled:specifier:" get:"isSpecifierEnabled" detail:0 cell:6 edit:0];

    [v5 setObject:FCSportsFavoritesSyncSettingPreferenceKey forKeyedSubscript:PSKeyNameKey];
    [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:PSDefaultValueKey];
    uint64_t v6 = FCDefaultsSuiteName;
    [v5 setObject:FCDefaultsSuiteName forKeyedSubscript:PSDefaultsKey];
    [v5 setObject:v6 forKeyedSubscript:PSContainerBundleIDKey];
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:PSControlIsLoadingKey];
    specifier = v2->_specifier;
    v2->_specifier = (PSSpecifier *)v5;
  }
  return v2;
}

- (void)prepareWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = FRNewsSettingsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Settings sports sync switch preparing...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4F68;
  v7[3] = &unk_10538;
  objc_copyWeak(&v9, buf);
  id v6 = v4;
  id v8 = v6;
  [(FRNewsSportsSyncManager *)self prepareUserDefaultsWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (id)isSpecifierEnabled
{
  BOOL v2 = [(FRNewsSportsSyncManager *)self isEnabled];

  return +[NSNumber numberWithBool:v2];
}

- (void)setSpecifierEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [FRNewsSportsSyncSetting alloc];
  id v7 = [v5 BOOLValue];

  id v8 = +[NSDate now];
  id v9 = [(FRNewsSportsSyncSetting *)v6 initWithSource:0 enabled:v7 dateModified:v8];

  v10 = FRNewsSettingsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Settings sports sync switch toggled to %{public}@", buf, 0xCu);
  }

  +[FRNewsSportsSyncSetting updateUserDefaultsSyncSetting:v9];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_523C;
  v12[3] = &unk_10588;
  v13 = v9;
  v11 = v9;
  [(FRNewsSportsSyncManager *)self sportsFavoritesService:v12];
}

- (BOOL)isEnabled
{
  BOOL v2 = +[FRNewsSportsSyncSetting userDefaultSyncSetting];
  unsigned __int8 v3 = [v2 isEnabled];

  return v3;
}

- (void)sportsFavoritesService:(id)a3
{
  unsigned __int8 v3 = (void (**)(id, FRSportsSyncFavoritesService *))a3;
  id v4 = +[FCAppleAccount sharedAccount];
  [v4 reloadiTunesAccount];

  id v5 = +[FCAppleAccount sharedAccount];
  unsigned int v6 = [v5 isUserSignedIntoiTunes];

  id v7 = FRNewsSettingsLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Settings sports sync has access to watchlist", buf, 2u);
    }

    id v9 = objc_alloc_init(FRSportsSyncFavoritesService);
    v3[2](v3, v9);

    unsigned __int8 v3 = (void (**)(id, FRSportsSyncFavoritesService *))v9;
  }
  else
  {
    if (v8)
    {
      v10[0] = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Settings sports sync has no access to watchlist, ignoring propagating", (uint8_t *)v10, 2u);
    }

    v3[2](v3, 0);
  }
}

- (void)prepareUserDefaultsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_56B0;
  v6[3] = &unk_105B0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(FRNewsSportsSyncManager *)self sportsFavoritesService:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)prepareUserDefaultsWithWatchlistService:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = FRNewsSettingsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Settings sports sync switch will check onboarded state with watchlist", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_5888;
  v9[3] = &unk_10600;
  id v10 = v5;
  id v8 = v5;
  [v6 fetchSyncSettingWithCompletionHandler:v9];
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (void).cxx_destruct
{
}

@end