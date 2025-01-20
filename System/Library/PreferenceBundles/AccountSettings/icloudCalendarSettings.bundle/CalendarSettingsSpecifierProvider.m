@interface CalendarSettingsSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (CalendarSettingsSpecifierProvider)initWithAccountManager:(id)a3;
- (CalendarSettingsSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (CalendarSettingsSpecifierProvider)initWithManager:(id)a3 presenter:(id)a4;
- (NSArray)specifiers;
- (id)_dataclassState:(id)a3;
- (id)account;
- (id)accountForServiceType:(id)a3 primaryAltDSID:(id)a4 primaryDSID:(id)a5;
- (id)accountsForAccountManager:(id)a3;
- (id)initPresenter:(id)a3;
- (id)serviceOwnersManager;
- (void)onCalendarTap;
- (void)onCalendarTapWithDeeplink:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation CalendarSettingsSpecifierProvider

- (CalendarSettingsSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(CalendarSettingsSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (CalendarSettingsSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CalendarSettingsSpecifierProvider;
  v9 = [(CalendarSettingsSpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_presenter, v8);
  }

  return v10;
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (NSArray)specifiers
{
  p_specifiers = (uint64_t *)&self->_specifiers;
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    if (!self->_accountManager)
    {
      id v5 = objc_alloc((Class)AIDAAccountManager);
      v6 = +[ACAccountStore defaultStore];
      id v7 = (AIDAAccountManager *)[v5 initWithAccountStore:v6];
      accountManager = self->_accountManager;
      self->_accountManager = v7;

      [(AIDAAccountManager *)self->_accountManager setDelegate:self];
    }
    id v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = [(AIDAAccountManager *)self->_accountManager accounts];
    v11 = [v10 objectForKeyedSubscript:AIDAServiceTypeCloud];

    uint64_t v12 = ACAccountDataclassCalendars;
    v13 = +[PSSpecifier acui_linkListCellSpecifierForDataclass:ACAccountDataclassCalendars account:v11 target:self set:0 get:"_dataclassState:" detail:0];
    iCloudCalendarSettingSpecifier = self->_iCloudCalendarSettingSpecifier;
    self->_iCloudCalendarSettingSpecifier = v13;

    uint64_t v26 = ACUIAccountKey;
    v27 = v11;
    v15 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];

    [(PSSpecifier *)self->_iCloudCalendarSettingSpecifier setUserInfo:v16];
    [(PSSpecifier *)self->_iCloudCalendarSettingSpecifier setIdentifier:v12];
    [(PSSpecifier *)self->_iCloudCalendarSettingSpecifier setDetailControllerClass:objc_opt_class()];
    v17 = self->_iCloudCalendarSettingSpecifier;
    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"CALENDAR_LABEL" value:&stru_10750 table:@"calendarSettings"];
    [(PSSpecifier *)v17 setName:v19];

    [v9 addObject:self->_iCloudCalendarSettingSpecifier];
    v20 = (NSArray *)[v9 copy];
    v21 = self->_specifiers;
    self->_specifiers = v20;

    v22 = _CalLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "loading calendar specifier", v25, 2u);
    }

    v23 = _CalLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_A548(p_specifiers, v23);
    }

    specifiers = (NSArray *)*p_specifiers;
  }

  return specifiers;
}

- (id)_dataclassState:(id)a3
{
  v3 = [(AIDAAccountManager *)self->_accountManager accounts];
  v4 = [v3 objectForKeyedSubscript:AIDAServiceTypeCloud];

  LODWORD(v3) = [v4 isEnabledForDataclass:ACAccountDataclassCalendars];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v3) {
    CFStringRef v7 = @"ON";
  }
  else {
    CFStringRef v7 = @"OFF";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_10750 table:@"calendarSettings"];

  return v8;
}

- (id)serviceOwnersManager
{
  serviceOwnersManager = self->_serviceOwnersManager;
  if (!serviceOwnersManager)
  {
    id v4 = objc_alloc((Class)AIDAServiceOwnersManager);
    id v5 = +[ACAccountStore defaultStore];
    v6 = (AIDAServiceOwnersManager *)[v4 initWithAccountStore:v5];
    CFStringRef v7 = self->_serviceOwnersManager;
    self->_serviceOwnersManager = v6;

    serviceOwnersManager = self->_serviceOwnersManager;
  }
  id v8 = serviceOwnersManager;

  return v8;
}

- (id)accountsForAccountManager:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [(CalendarSettingsSpecifierProvider *)self serviceOwnersManager];
  uint64_t v6 = AIDAServiceTypeCloud;
  CFStringRef v7 = [v5 accountForService:AIDAServiceTypeCloud];

  if (v7)
  {
    [v4 setObject:v7 forKeyedSubscript:v6];
    id v8 = [(CalendarSettingsSpecifierProvider *)self serviceOwnersManager];
    id v9 = [v8 altDSIDForAccount:v7 service:v6];

    v10 = [(CalendarSettingsSpecifierProvider *)self serviceOwnersManager];
    v11 = [v10 DSIDForAccount:v7 service:v6];

    if (v9) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      uint64_t v13 = AIDAServiceTypeGameCenter;
      v14 = [(CalendarSettingsSpecifierProvider *)self accountForServiceType:AIDAServiceTypeGameCenter primaryAltDSID:v9 primaryDSID:v11];
      if (v14) {
        [v4 setObject:v14 forKeyedSubscript:v13];
      }
    }
  }
  v15 = [(CalendarSettingsSpecifierProvider *)self serviceOwnersManager];
  uint64_t v16 = AIDAServiceTypeStore;
  v17 = [v15 accountForService:AIDAServiceTypeStore];

  if (v17) {
    [v4 setObject:v17 forKeyedSubscript:v16];
  }

  return v4;
}

- (id)accountForServiceType:(id)a3 primaryAltDSID:(id)a4 primaryDSID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CalendarSettingsSpecifierProvider *)self serviceOwnersManager];
  BOOL v12 = [v11 accountForService:v8];

  if (v12)
  {
    uint64_t v13 = [(CalendarSettingsSpecifierProvider *)self serviceOwnersManager];
    v14 = [v13 altDSIDForAccount:v12 service:v8];

    if (v14 && [v14 isEqualToString:v9])
    {
      id v15 = v12;
    }
    else
    {
      uint64_t v16 = [(CalendarSettingsSpecifierProvider *)self serviceOwnersManager];
      v17 = [v16 DSIDForAccount:v12 service:v8];

      if (v17 && ([v17 isEqualToString:v10] & 1) != 0)
      {
        id v15 = v12;
      }
      else
      {

        id v15 = 0;
      }
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (CalendarSettingsSpecifierProvider)initWithManager:(id)a3 presenter:(id)a4
{
  return [(CalendarSettingsSpecifierProvider *)self initWithAccountManager:a3 presenter:a4];
}

- (void)onCalendarTapWithDeeplink:(id)a3
{
  id v4 = [(CalendarSettingsSpecifierProvider *)self account];
  if (v4 && [v4 isProvisionedForDataclass:ACAccountDataclassCalendars])
  {
    id v5 = [(CalendarSettingsSpecifierProvider *)self specifiers];
    uint64_t v6 = objc_alloc_init(CalendarSettingsController);
    [(CalendarSettingsController *)v6 setSpecifier:self->_iCloudCalendarSettingSpecifier];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    id v8 = [WeakRetained navigationController];
    [v8 pushViewController:v6 animated:1];
  }

  _objc_release_x1();
}

- (id)initPresenter:(id)a3
{
  return [(CalendarSettingsSpecifierProvider *)self initWithAccountManager:0 presenter:a3];
}

- (void)onCalendarTap
{
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
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_iCloudCalendarSettingSpecifier, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end