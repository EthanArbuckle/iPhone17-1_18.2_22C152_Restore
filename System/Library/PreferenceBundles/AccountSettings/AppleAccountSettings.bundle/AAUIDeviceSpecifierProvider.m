@interface AAUIDeviceSpecifierProvider
- (AATrustedDevice)deviceRecentlyTapped;
- (AAUIDeviceSpecifierProvider)initWithAccountManager:(id)a3;
- (AAUIDeviceSpecifierProviderDelegate)delegate;
- (BOOL)_isSpecifierEnabled:(id)a3;
- (BOOL)_shouldShowDeviceSpecifiers;
- (NSArray)specifiers;
- (id)_accountStore;
- (id)_appleAccount;
- (id)_deviceList;
- (id)_iconURLForDevice:(id)a3;
- (id)_specifierForDevice:(id)a3;
- (id)_specifierForError;
- (id)_specifierForSpinner;
- (id)_specifiersForDeviceList:(id)a3;
- (void)_deviceSpecifierWasTapped:(id)a3;
- (void)deviceListModified:(id)a3;
- (void)refreshDeviceList;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)userTappedBackup;
- (void)userTappedFMIP;
@end

@implementation AAUIDeviceSpecifierProvider

- (AAUIDeviceSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AAUIDeviceSpecifierProvider;
  v6 = [(AAUIDeviceSpecifierProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    id v8 = [(AAUIDeviceSpecifierProvider *)v7 _deviceList];
  }

  return v7;
}

- (void)refreshDeviceList
{
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  deviceList = self->_deviceList;

  [(AADeviceList *)deviceList refreshDeviceList];
}

- (id)_accountStore
{
  return [(AIDAAccountManager *)self->_accountManager accountStore];
}

- (id)_appleAccount
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (BOOL)_shouldShowDeviceSpecifiers
{
  v2 = [(AAUIDeviceSpecifierProvider *)self _appleAccount];
  if (v2) {
    unsigned int v3 = +[AADeviceInfo isMultiUserMode] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = +[NSMutableArray array];
    if ([(AAUIDeviceSpecifierProvider *)self _shouldShowDeviceSpecifiers])
    {
      id v5 = +[PSSpecifier groupSpecifierWithID:@"GROUP_DEVICES"];
      [v4 addObject:v5];

      v6 = [(AAUIDeviceSpecifierProvider *)self _deviceList];
      v7 = [(AAUIDeviceSpecifierProvider *)self _specifiersForDeviceList:v6];
      [v4 addObjectsFromArray:v7];
    }
    id v8 = (NSArray *)[v4 copy];
    v9 = self->_specifiers;
    self->_specifiers = v8;

    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (id)_specifierForSpinner
{
  return +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
}

- (id)_specifierForError
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v3 = [v2 localizedStringForKey:@"APPLEID_DEVICES_NOT_AVAILABLE" value:&stru_76890 table:@"Localizable"];
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

  [v4 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];

  return v4;
}

- (id)_specifiersForDeviceList:(id)a3
{
  id v4 = a3;
  id v5 = [v4 loadError];

  if (v5)
  {
    v6 = [(AAUIDeviceSpecifierProvider *)self _specifierForError];
    v25 = v6;
    v7 = &v25;
LABEL_3:
    id v8 = +[NSArray arrayWithObjects:v7 count:1];
    goto LABEL_13;
  }
  v9 = [v4 devices];
  id v10 = [v9 count];

  if (!v10)
  {
    v6 = [(AAUIDeviceSpecifierProvider *)self _specifierForSpinner];
    v24 = v6;
    v7 = &v24;
    goto LABEL_3;
  }
  v6 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v11 = objc_msgSend(v4, "devices", 0);
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [(AAUIDeviceSpecifierProvider *)self _specifierForDevice:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        [v6 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v8 = [v6 copy];
LABEL_13:
  v17 = v8;

  return v17;
}

- (id)_specifierForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:1 edit:0];

  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  v7 = [v4 name];
  [v6 setProperty:v7 forKey:PSTitleKey];

  id v8 = [v4 modelDisplayName];
  [v6 setProperty:v8 forKey:PSTableCellSubtitleTextKey];

  [v6 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  v9 = [(AAUIDeviceSpecifierProvider *)self _iconURLForDevice:v4];
  [v6 setProperty:v9 forKey:PSLazyIconURL];

  [v6 setControllerLoadAction:"_deviceSpecifierWasTapped:"];
  [v6 setUserInfo:v4];

  id v10 = +[NSNumber numberWithBool:[(AAUIDeviceSpecifierProvider *)self _isSpecifierEnabled:v6]];
  [v6 setProperty:v10 forKey:PSEnabledKey];

  return v6;
}

- (BOOL)_isSpecifierEnabled:(id)a3
{
  id v4 = [(AAUIDeviceSpecifierProvider *)self _appleAccount];
  if (v4)
  {
    id v5 = [(AAUIDeviceSpecifierProvider *)self _appleAccount];
    unsigned __int8 v6 = objc_msgSend(v5, "aa_isPrimaryEmailVerified");
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)_iconURLForDevice:(id)a3
{
  unsigned int v3 = [a3 modelSmallPhotoURL3x];
  id v4 = +[NSURL URLWithString:v3];

  return v4;
}

- (void)_deviceSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v6 = [v5 deviceDetailUri];
    v7 = +[NSURL URLWithString:v6];

    if (v7)
    {
      objc_storeStrong((id *)&self->_deviceRecentlyTapped, v5);
      id v8 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v7];
      v9 = [v5 deviceDetailHttpMethod];
      [v8 setHTTPMethod:v9];

      id v10 = [(AAUIDeviceSpecifierProvider *)self delegate];
      [v10 specifierProvider:self loadRequest:v8 withIdentifier:@"_AAUIRemotePageIdentifierTrustedDevice" specifier:v4];
    }
    else
    {
      v11 = _AAUILogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Unable to load trusted-devices remote UI. We're missing the URL from the device info!", v12, 2u);
      }
    }
  }
  else
  {
    v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Unable to load trusted-devices remote UI. We're missing the device info!", buf, 2u);
    }
  }
}

- (id)_deviceList
{
  deviceList = self->_deviceList;
  if (!deviceList)
  {
    id v4 = (AADeviceList *)[objc_alloc((Class)AADeviceList) initWithAccountManager:self->_accountManager];
    id v5 = self->_deviceList;
    self->_deviceList = v4;

    [(AADeviceList *)self->_deviceList setDelegate:self];
    deviceList = self->_deviceList;
  }

  return deviceList;
}

- (void)deviceListModified:(id)a3
{
  id v4 = self->_specifiers;
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_C934;
  v7[3] = &unk_75130;
  v7[4] = self;
  id v8 = v4;
  unsigned __int8 v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)userTappedBackup
{
  if (!self->_backupSettingsController)
  {
    unsigned int v3 = (PSListController *)objc_alloc_init((Class)PSBackupClass());
    backupSettingsController = self->_backupSettingsController;
    self->_backupSettingsController = v3;
  }
  id v5 = [(AAUIDeviceSpecifierProvider *)self delegate];
  [v5 specifierProvider:self showViewController:self->_backupSettingsController];
}

- (void)userTappedFMIP
{
  id v5 = objc_alloc_init((Class)FMDUIFMIPiCloudSettingsViewController);
  unsigned int v3 = [(AAUIDeviceSpecifierProvider *)self _appleAccount];
  [v5 setAccount:v3];

  id v4 = [(AAUIDeviceSpecifierProvider *)self delegate];
  [v4 specifierProvider:self showViewController:v5];
}

- (AAUIDeviceSpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUIDeviceSpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (AATrustedDevice)deviceRecentlyTapped
{
  return self->_deviceRecentlyTapped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceRecentlyTapped, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backupSettingsController, 0);
  objc_storeStrong((id *)&self->_deviceList, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end