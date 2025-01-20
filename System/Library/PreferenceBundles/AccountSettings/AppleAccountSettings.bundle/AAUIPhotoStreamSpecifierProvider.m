@interface AAUIPhotoStreamSpecifierProvider
- (AAUIPhotoStreamSpecifierProvider)initWithAccountManager:(id)a3;
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)_isPhotoStreamEnabled:(id)a3;
- (BOOL)handleURL:(id)a3;
- (NSArray)specifiers;
- (id)_isPhotoStreamEnabledString:(id)a3;
- (id)_specifierForPhotoStream;
- (id)account;
- (void)_photoStreamSpecifierWasTapped:(id)a3;
- (void)_showPhotoStreamController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation AAUIPhotoStreamSpecifierProvider

- (AAUIPhotoStreamSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIPhotoStreamSpecifierProvider;
  v6 = [(AAUIPhotoStreamSpecifierProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    uint64_t v4 = [(AAUIPhotoStreamSpecifierProvider *)self _specifierForPhotoStream];
    id v5 = (void *)v4;
    if (v4)
    {
      uint64_t v9 = v4;
      v6 = +[NSArray arrayWithObjects:&v9 count:1];
      v7 = self->_specifiers;
      self->_specifiers = v6;
    }
    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (id)_specifierForPhotoStream
{
  v3 = +[MCProfileConnection sharedConnection];
  if ([v3 effectiveBoolValueForSetting:MCFeaturePhotoStreamAllowed] == 2
    && [v3 effectiveBoolValueForSetting:MCFeatureSharedStreamAllowed] == 2
    && [v3 effectiveBoolValueForSetting:MCFeatureCloudPhotoLibraryAllowed] == 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = ACAccountDataclassMediaStream;
    v6 = [(AAUIPhotoStreamSpecifierProvider *)self account];
    uint64_t v4 = +[PSSpecifier acui_linkListCellSpecifierForDataclass:v5 account:v6 target:self set:0 get:"_isPhotoStreamEnabledString:" detail:0];

    uint64_t v10 = ACUIAccountKey;
    v7 = [(AAUIPhotoStreamSpecifierProvider *)self account];
    v11 = v7;
    v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [v4 setUserInfo:v8];

    [v4 setControllerLoadAction:"_photoStreamSpecifierWasTapped:"];
  }

  return v4;
}

- (id)_isPhotoStreamEnabledString:(id)a3
{
  unsigned int v3 = [(AAUIPhotoStreamSpecifierProvider *)self _isPhotoStreamEnabled:a3];
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = v4;
  if (v3) {
    CFStringRef v6 = @"ON";
  }
  else {
    CFStringRef v6 = @"OFF";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_76890 table:@"Localizable"];

  return v7;
}

- (BOOL)_isPhotoStreamEnabled:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_48480((id *)p_delegate, v12);
    }

    goto LABEL_8;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v9 = [v8 specifierProvider:self isDataclassAvailableForSpecifier:v4];

  if ((v9 & 1) == 0)
  {
LABEL_8:
    unsigned __int8 v11 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = [(AAUIPhotoStreamSpecifierProvider *)self account];
  if ([v10 isEnabledForDataclass:ACAccountDataclassMediaStream])
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    v13 = [(AAUIPhotoStreamSpecifierProvider *)self account];
    if ([v13 isEnabledForDataclass:ACAccountDataclassSharedStreams])
    {
      unsigned __int8 v11 = 1;
    }
    else
    {
      v14 = [(AAUIPhotoStreamSpecifierProvider *)self account];
      unsigned __int8 v11 = [v14 isEnabledForDataclass:ACAccountDataclassCloudPhotos];
    }
  }

LABEL_14:
  return v11;
}

- (void)_photoStreamSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&v5->_delegate);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4210;
    v9[3] = &unk_75108;
    uint64_t v10 = v5;
    id v11 = v4;
    [v8 validateDataclassAccessForProvider:v10 specifier:v11 completion:v9];
  }
}

- (void)_showPhotoStreamController:(id)a3
{
  id v4 = a3;
  photosSettingsController = self->_photosSettingsController;
  if (photosSettingsController)
  {
LABEL_4:
    [(PSListController *)photosSettingsController setSpecifier:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained specifierProvider:self showViewController:self->_photosSettingsController];

    if (self->_handleURLResourceDictionary && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [(PSListController *)self->_photosSettingsController handleURL:self->_handleURLResourceDictionary];
      handleURLResourceDictionary = self->_handleURLResourceDictionary;
      self->_handleURLResourceDictionary = 0;
    }
    goto LABEL_10;
  }
  CFStringRef v6 = objc_alloc_init(AAUIPhotoSettingsController);
  if (v6)
  {
    char v7 = self->_photosSettingsController;
    self->_photosSettingsController = (PSListController *)v6;

    photosSettingsController = self->_photosSettingsController;
    goto LABEL_4;
  }
  uint64_t v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "AAUIPhotoStreamSpecifierProvider could not load the photos settings controller!", v11, 2u);
  }

LABEL_10:
}

- (BOOL)handleURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"path"];
  if (([v5 hasPrefix:ACAccountDataclassPhotos] & 1) != 0
    || ([v5 hasPrefix:ACAccountDataclassMediaStream] & 1) != 0
    || ([v5 hasPrefix:ACAccountDataclassSharedStreams] & 1) != 0
    || [v5 hasPrefix:ACAccountDataclassCloudPhotos])
  {
    CFStringRef v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = self;
      __int16 v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ handling deeplink url for path: %@", buf, 0x16u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_44D4;
    v9[3] = &unk_75130;
    void v9[4] = self;
    id v10 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_handleURLResourceDictionary, 0);
  objc_storeStrong((id *)&self->_photosSettingsController, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end