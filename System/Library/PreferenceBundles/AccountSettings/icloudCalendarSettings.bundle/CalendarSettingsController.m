@interface CalendarSettingsController
- (ACAccount)appleAccount;
- (BOOL)_getSharedCalendarEmailStatus;
- (BOOL)_showSendReceive;
- (CalGetSettingsResponse)getSettingsResponse;
- (id)_calendarCardViewSpecifier;
- (id)_isSharedCalendarUpdateEnabled:(id)a3;
- (id)_loadCalendarSettingInfoSpecifier;
- (id)_loadSendReceiveSpecifier;
- (id)_loadSharedCalenderUpdateSpecifier;
- (id)account;
- (id)getSendReceiveState:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_calendarSettingRefreshNotification:(id)a3;
- (void)_enableSharedCalendarUpdate:(id)a3 forSpecifier:(id)a4;
- (void)_sendReceiveSpecifierWasTapped:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setAppleAccount:(id)a3;
- (void)setGetSettingsResponse:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CalendarSettingsController

- (id)account
{
  return self->_appleAccount;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CalendarSettingsController;
  [(CalendarSettingsController *)&v7 viewWillAppear:a3];
  v4 = [(CalendarSettingsController *)self navigationItem];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"CALENDAR_LABEL" value:&stru_10750 table:@"calendarSettings"];
  [v4 setTitle:v6];

  [v4 setHidesBackButton:0];
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)CalendarSettingsController;
  [(CalendarSettingsController *)&v18 viewDidLoad];
  if ([(CalendarSettingsController *)self _showSendReceive])
  {
    uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
    v4 = [*(id *)&self->ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers] specifierForID:@"Send_AND_RECEIVE_SPECIFIER_ID"];
    v5 = [*(id *)&self->ACUIDataclassConfigurationViewController_opaque[v3] specifierForID:@"SHARED_CALENDAR_SPECIFIER_ID"];
    v6 = [CalendarReadSettingsRequest alloc];
    appleAccount = self->_appleAccount;
    v8 = [(ACAccount *)appleAccount accountStore];
    v9 = [(CalendarReadSettingsRequest *)v6 initWithAccount:appleAccount accountStore:v8];

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_26B0;
    v12[3] = &unk_10430;
    objc_copyWeak(&v16, &location);
    id v10 = v4;
    id v13 = v10;
    id v11 = v5;
    id v14 = v11;
    v15 = self;
    [(CalendarReadSettingsRequest *)v9 performRequestWithCallback:v12];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = [*(id *)&self->ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
    userInfoDictionary = self->_userInfoDictionary;
    self->_userInfoDictionary = v6;

    v8 = [(NSMutableDictionary *)self->_userInfoDictionary objectForKey:ACUIAccountKey];
    appleAccount = self->_appleAccount;
    self->_appleAccount = v8;

    if (self->_appleAccount)
    {
      id v10 = [(CalendarSettingsController *)self _calendarCardViewSpecifier];
      [v5 addObjectsFromArray:v10];

      if ([(CalendarSettingsController *)self _showSendReceive])
      {
        id v11 = [(CalendarSettingsController *)self _loadSendReceiveSpecifier];
        [v5 addObjectsFromArray:v11];

        v12 = [(CalendarSettingsController *)self _loadSharedCalenderUpdateSpecifier];
        [v5 addObjectsFromArray:v12];

        id v13 = [(CalendarSettingsController *)self _loadCalendarSettingInfoSpecifier];
        [v5 addObjectsFromArray:v13];
      }
      id v14 = _CalLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "calendar settings card view loaded", v26, 2u);
      }
    }
    else
    {
      id v14 = _CalLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_A2C8((uint64_t)&self->_userInfoDictionary, v14, v15, v16, v17, v18, v19, v20);
      }
    }

    v21 = *(void **)&self->ACUIDataclassConfigurationViewController_opaque[v3];
    *(void *)&self->ACUIDataclassConfigurationViewController_opaque[v3] = v5;
    id v22 = v5;

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 removeObserver:self name:@"CALENDAR_SETTING_REFRESH_NOTIFICATION" object:0];

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:self selector:"_calendarSettingRefreshNotification:" name:@"CALENDAR_SETTING_REFRESH_NOTIFICATION" object:0];

    v4 = *(void **)&self->ACUIDataclassConfigurationViewController_opaque[v3];
  }

  return v4;
}

- (id)_calendarCardViewSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v29 = +[PSSpecifier emptyGroupSpecifier];
  objc_msgSend(v3, "addObject:");
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v27 = +[UIImage imageNamed:@"iCloudCalendar" inBundle:v4];

  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"CALENDAR_LABEL" value:&stru_10750 table:@"calendarSettings"];
  v28 = self;
  objc_super v7 = self;
  v8 = v3;
  v9 = +[PSSpecifier preferenceSpecifierNamed:v6 target:v7 set:0 get:0 detail:0 cell:-1 edit:0];

  [v9 setProperty:objc_opt_class() forKey:PSCellClassKey];
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"CALENDAR_LABEL" value:&stru_10750 table:@"calendarSettings"];
  [v9 setProperty:v11 forKey:PSTitleKey];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"CALENDAR_CARD_SUBTEXT" value:&stru_10750 table:@"calendarSettings"];

  [v9 setProperty:v13 forKey:PSTableCellSubtitleTextKey];
  id v14 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v15 = [v14 localizedStringForKey:@"CALENDAR_CARD_VIEW_KB_LINK" value:&stru_10750 table:@"calendarSettings"];
  [v9 setProperty:v15 forKey:@"AAUIDataclassAttributedLink"];

  uint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v17 = [v16 localizedStringForKey:@"CALENDAR_LEARN_MORE_PERIOD" value:&stru_10750 table:@"calendarSettings"];
  [v9 setProperty:v17 forKey:@"AAUIDataclassAttributedLinkText"];

  [v9 setProperty:&off_111B8 forKey:PSAlignmentKey];
  uint64_t v18 = PSIconImageKey;
  objc_msgSend(v9, "setProperty:forKey:");
  [v8 addObject:v9];
  id v19 = objc_alloc_init((Class)AADeviceInfo);
  uint64_t v20 = [v19 deviceClass];
  v21 = [v20 uppercaseString];

  if ([v21 isEqualToString:@"IPHONE"])
  {
    CFStringRef v22 = @"CALENDAR_DATACLASS_SWITCH_TEXT_IPHONE";
  }
  else if ([v21 isEqualToString:@"IPAD"])
  {
    CFStringRef v22 = @"CALENDAR_DATACLASS_SWITCH_TEXT_IPAD";
  }
  else if ([v21 isEqualToString:@"IPOD"])
  {
    CFStringRef v22 = @"CALENDAR_DATACLASS_SWITCH_TEXT_IPOD";
  }
  else if ([v21 isEqualToString:@"IPHONE SIMULATOR"])
  {
    CFStringRef v22 = @"CALENDAR_DATACLASS_SWITCH_TEXT_IPHONE SIMULATOR";
  }
  else
  {
    CFStringRef v22 = @"CALENDAR_DATACLASS_SWITCH_TEXT_OTHER";
  }
  v23 = [(CalendarSettingsController *)v28 specifierForDataclass:ACAccountDataclassCalendars];
  [v23 removePropertyForKey:v18];
  v24 = +[NSBundle bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:v22 value:&stru_10750 table:@"calendarSettings"];

  [v23 setName:v25];
  [v8 addObject:v23];

  return v8;
}

- (id)_loadSendReceiveSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"CALENDAR_SEND_RECEIVE_INVITATIONS" value:&stru_10750 table:@"calendarSettings"];
  v6 = +[PSSpecifier groupSpecifierWithName:v5];

  objc_super v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"CALENDAR_SEND_RECEIVE_FOOTER" value:&stru_10750 table:@"calendarSettings"];
  [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

  [v3 addObject:v6];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"CALENDAR_SEND_RECEIVE_LABEL" value:&stru_10750 table:@"calendarSettings"];
  id v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:"getSendReceiveState:" detail:0 cell:2 edit:0];

  [v11 setIdentifier:@"Send_AND_RECEIVE_SPECIFIER_ID"];
  [v11 setControllerLoadAction:"_sendReceiveSpecifierWasTapped:"];
  if (!self->_getSettingsResponse) {
    [v11 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  }
  [v3 addObject:v11];

  return v3;
}

- (id)_loadCalendarSettingInfoSpecifier
{
  id v16 = objc_alloc_init((Class)NSMutableArray);
  v2 = +[PSSpecifier emptyGroupSpecifier];
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"CALENDAR_SETTING_INFO_FOOTER" value:&stru_10750 table:@"calendarSettings"];
  [v2 setProperty:v4 forKey:PSFooterTextGroupKey];

  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"CALENDAR_LEARN_MORE_PERIOD" value:&stru_10750 table:@"calendarSettings"];

  objc_super v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"CALENDAR_SETTING_INFO_FOOTER" value:&stru_10750 table:@"calendarSettings"];
  v9 = +[NSString stringWithFormat:@"%@ %@", v8, v6];

  id v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  [v2 setProperty:v11 forKey:PSFooterCellClassGroupKey];

  [v2 setProperty:v9 forKey:PSFooterHyperlinkViewTitleKey];
  v18.id location = (NSUInteger)[v9 rangeOfString:v6];
  v12 = NSStringFromRange(v18);
  [v2 setProperty:v12 forKey:PSFooterHyperlinkViewLinkRangeKey];

  id v13 = +[NSBundle bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"CALENDAR_SETTING_INFO_KB_LINK" value:&stru_10750 table:@"calendarSettings"];
  [v2 setProperty:v14 forKey:PSFooterHyperlinkViewURLKey];

  [v16 addObject:v2];

  return v16;
}

- (id)getSendReceiveState:(id)a3
{
  id v4 = a3;
  getSettingsResponse = self->_getSettingsResponse;
  if (getSettingsResponse)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = [(CalGetSettingsResponse *)getSettingsResponse emails];
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v10 send])
          {
            id v7 = [v10 address];
            goto LABEL_12;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_sendReceiveSpecifierWasTapped:(id)a3
{
  if (self->_getSettingsResponse)
  {
    id v4 = [CalendarSendReceiveController alloc];
    id v5 = [(CalGetSettingsResponse *)self->_getSettingsResponse emails];
    long long v14 = [(CalendarSendReceiveController *)v4 initWithEmailData:v5 userAccount:self->_appleAccount];

    [(CalendarSettingsController *)self showViewController:v14 sender:self];
  }
  else
  {
    v6 = _CalLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_A338(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (id)_loadSharedCalenderUpdateSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"CALENDAR_SHARED_UPDATE_HEADER" value:&stru_10750 table:@"calendarSettings"];
  v6 = +[PSSpecifier groupSpecifierWithName:v5];

  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"CALENDAR_SHARED_CALENDAR_UPDATE_FOOTER" value:&stru_10750 table:@"calendarSettings"];
  [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

  [v3 addObject:v6];
  uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"CALENDAR_SHARED_CALENDAR_UPDATE_SPECIFIER_TEXT" value:&stru_10750 table:@"calendarSettings"];
  uint64_t v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"_enableSharedCalendarUpdate:forSpecifier:" get:"_isSharedCalendarUpdateEnabled:" detail:0 cell:6 edit:0];

  [v11 setIdentifier:@"SHARED_CALENDAR_SPECIFIER_ID"];
  uint64_t v12 = PSControlIsLoadingKey;
  if (!self->_getSettingsResponse)
  {
    [v11 setProperty:&__kCFBooleanTrue forKey:PSControlIsLoadingKey];
    uint64_t v12 = PSEnabledKey;
  }
  [v11 setProperty:&__kCFBooleanFalse forKey:v12];
  [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
  [v11 setControllerLoadAction:"_sendReceiveSpecifierWasTapped:"];
  [v3 addObject:v11];

  return v3;
}

- (void)_enableSharedCalendarUpdate:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CalLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "setting %@ for shared calendar update", buf, 0xCu);
  }

  if (self->_getSettingsResponse)
  {
    uint64_t v9 = [SharedCalendarEmailUpdateRequest alloc];
    appleAccount = self->_appleAccount;
    uint64_t v11 = [(ACAccount *)appleAccount accountStore];
    uint64_t v12 = -[SharedCalendarEmailUpdateRequest initWithAccount:accountStore:sharedCalendarEmail:](v9, "initWithAccount:accountStore:sharedCalendarEmail:", appleAccount, v11, [v6 BOOLValue]);

    [v7 setProperty:&__kCFBooleanTrue forKey:PSControlIsLoadingKey];
    objc_initWeak((id *)buf, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_3CB0;
    v20[3] = &unk_10430;
    objc_copyWeak(&v24, (id *)buf);
    id v21 = v7;
    CFStringRef v22 = self;
    id v23 = v6;
    [v12 performRequestWithCallback:v20];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v12 = _CalLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_A370(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (id)_isSharedCalendarUpdateEnabled:(id)a3
{
  id v4 = [(CalendarSettingsController *)self getSettingsResponse];

  if (v4)
  {
    id v5 = [(CalendarSettingsController *)self getSettingsResponse];
    id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 sharedCalendarEmail]);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_getSharedCalendarEmailStatus
{
  return [(CalGetSettingsResponse *)self->_getSettingsResponse sharedCalendarEmail];
}

- (BOOL)_showSendReceive
{
  if (_os_feature_enabled_impl()
    && ([(ACAccount *)self->_appleAccount aa_isManagedAppleID] & 1) == 0)
  {
    id v4 = [(ACAccount *)self->_appleAccount propertiesForDataclass:@"com.apple.Dataclass.Calendars"];
    id v5 = [v4 objectForKeyedSubscript:@"isMakoAccount"];
    unsigned int v3 = [v5 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  uint64_t v8 = [v6 objectForKey:@"path"];
  uint64_t v9 = _CalLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_A410();
  }

  if ([v8 isEqualToString:@"CALENDAR_SEND_RECEIVE"])
  {
    uint64_t v10 = _CalLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_A3A8();
    }

    if (self->_getSettingsResponse)
    {
      uint64_t v11 = [CalendarSendReceiveController alloc];
      uint64_t v12 = [(CalGetSettingsResponse *)self->_getSettingsResponse emails];
      uint64_t v13 = [(CalendarSendReceiveController *)v11 initWithEmailData:v12 userAccount:self->_appleAccount];

      [(CalendarSettingsController *)self showViewController:v13 sender:self];
    }
    else
    {
      self->needsToNavigateToSendAndReceive = 1;
      uint64_t v13 = _CalLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_A338(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
  if (v7) {
    v7[2](v7);
  }
}

- (void)_calendarSettingRefreshNotification:(id)a3
{
  id v4 = a3;
  id v5 = [CalendarReadSettingsRequest alloc];
  appleAccount = self->_appleAccount;
  id v7 = [(ACAccount *)appleAccount accountStore];
  uint64_t v8 = [(CalendarReadSettingsRequest *)v5 initWithAccount:appleAccount accountStore:v7];

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4398;
  v9[3] = &unk_10480;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  [(CalendarReadSettingsRequest *)v8 performRequestWithCallback:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CalendarSettingsController;
  id v5 = [(CalendarSettingsController *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  id v6 = [v5 specifier];
  id v7 = [v6 identifier];
  if ([v7 isEqualToString:@"Send_AND_RECEIVE_SPECIFIER_ID"])
  {
    getSettingsResponse = self->_getSettingsResponse;

    if (getSettingsResponse) {
      goto LABEL_7;
    }
    id v7 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v7 startAnimating];
    if ([v5 isEditing]) {
      [v5 setEditingAccessoryView:v7];
    }
    else {
      [v5 setAccessoryView:v7];
    }
  }

LABEL_7:

  return v5;
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
}

- (CalGetSettingsResponse)getSettingsResponse
{
  return self->_getSettingsResponse;
}

- (void)setGetSettingsResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getSettingsResponse, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);

  objc_storeStrong((id *)&self->_userInfoDictionary, 0);
}

@end