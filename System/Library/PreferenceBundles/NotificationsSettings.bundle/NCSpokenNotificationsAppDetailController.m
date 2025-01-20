@interface NCSpokenNotificationsAppDetailController
+ (BOOL)isDirectMessagesAnnounceSupportedForSectionInfo:(id)a3;
+ (BOOL)isTimeSensitiveAnnounceSupportedForSectionInfo:(id)a3;
+ (id)spokenNotificationsEnabled:(id)a3;
+ (id)spokenNotificationsSpecifierNamed:(id)a3 sectionInfo:(id)a4 showIcon:(BOOL)a5 class:(Class)a6;
- (BOOL)_isDirectMessagesAnnounceSupportedForSectionInfo:(id)a3;
- (BOOL)_isTimeSensitiveAnnounceSupportedForSectionInfo:(id)a3;
- (NCSpokenNotificationsAppDetailControllerDelegate)delegate;
- (id)_spokenNoOptionsGroupSpecifier;
- (id)_spokenOptionsAllSpecifier;
- (id)_spokenOptionsGroupSpecifier;
- (id)_spokenOptionsTimeSensitiveSpecifier;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (id)spokenNotificationsEnabled:(id)a3;
- (void)_setSpokenOptionSelectedSpecifier:(id)a3;
- (void)_signalDelegateSettingsChanged;
- (void)_updateOptionsGroupSpecifiers;
- (void)didChangeSettingForSpokenNotificationsAppDetailController:(id)a3 withSpecifierIdentifier:(id)a4;
- (void)setAnnounceSetting:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setSpokenNotificationsEnabled:(id)a3 specifier:(id)a4;
- (void)setSpokenOption:(id)a3;
@end

@implementation NCSpokenNotificationsAppDetailController

+ (id)spokenNotificationsSpecifierNamed:(id)a3 sectionInfo:(id)a4 showIcon:(BOOL)a5 class:(Class)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  v11 = +[PSSpecifier preferenceSpecifierNamed:a3 target:a1 set:0 get:"spokenNotificationsEnabled:" detail:a6 cell:2 edit:0];
  id v12 = objc_alloc((Class)NSMutableArray);
  v13 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v14 = [v13 localizedStringForKey:@"OFF" value:&stru_419A0 table:@"NotificationsSettings"];
  v23[0] = v14;
  v15 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v16 = [v15 localizedStringForKey:@"ON" value:&stru_419A0 table:@"NotificationsSettings"];
  v23[1] = v16;
  v17 = +[NSArray arrayWithObjects:v23 count:2];
  id v18 = [v12 initWithArray:v17];

  [v11 setValues:&off_448B0 titles:v18];
  v19 = [v10 sectionID];
  v20 = +[NSString stringWithFormat:@"SPOKEN_NOTIFICATIONS_APP_ID:%@", v19];
  [v11 setIdentifier:v20];

  [v11 setProperty:v10 forKey:@"BBSECTION_INFO_KEY"];
  if (v7)
  {
    v21 = objc_msgSend(v10, "nc_settingsIconImage");
    [v11 setProperty:v21 forKey:PSIconImageKey];
  }

  return v11;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(NCSpokenNotificationsAppDetailController *)self specifier];
    v6 = [v5 propertyForKey:@"BBSECTION_INFO_KEY"];

    BOOL v7 = BBSettingsDisplayNameForBBSection(v6);
    [(NCSpokenNotificationsAppDetailController *)self setTitle:v7];

    id v8 = objc_alloc_init((Class)NSMutableArray);
    v9 = +[PSSpecifier groupSpecifierWithID:@"SPOKEN_NOTIFICATIONS_SWITCH_MESSAGES_GROUP_ID"];
    id v10 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v11 = [v10 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_APP_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];
    id v12 = [(NCSpokenNotificationsAppDetailController *)self title];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
    [v9 setProperty:v13 forKey:PSFooterTextGroupKey];

    [v8 addObject:v9];
    v14 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v15 = [v14 localizedStringForKey:@"SPOKEN_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:"setSpokenNotificationsEnabled:specifier:" get:"spokenNotificationsEnabled:" detail:0 cell:6 edit:0];

    [v16 setIdentifier:@"SPOKEN_NOTIFICATIONS_ID"];
    [v16 setProperty:v6 forKey:@"BBSECTION_INFO_KEY"];
    objc_msgSend(v8, "bs_safeAddObject:", v16);
    [(NCSpokenNotificationsAppDetailController *)self setSpecifiers:v8];
    [(NCSpokenNotificationsAppDetailController *)self _updateOptionsGroupSpecifiers];

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

+ (id)spokenNotificationsEnabled:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  v4 = (char *)objc_msgSend(v3, "nc_effectiveAnnounceSetting");
  if (v4 == (unsigned char *)&dword_0 + 3)
  {
    uint64_t v5 = 1;
  }
  else
  {
    v6 = v4;
    unsigned int v7 = [(id)objc_opt_class() isTimeSensitiveAnnounceSupportedForSectionInfo:v3];
    unsigned int v8 = v7 | [(id)objc_opt_class() isDirectMessagesAnnounceSupportedForSectionInfo:v3];
    if (v6 == (unsigned char *)&dword_0 + 2) {
      uint64_t v5 = v8;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  v9 = +[NSNumber numberWithBool:v5];

  return v9;
}

- (id)spokenNotificationsEnabled:(id)a3
{
  v4 = objc_opt_class();
  uint64_t v5 = [(NCSpokenNotificationsAppDetailController *)self specifier];
  v6 = [v4 spokenNotificationsEnabled:v5];

  return v6;
}

- (void)setSpokenNotificationsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  v6 = [(NCSpokenNotificationsAppDetailController *)self specifier];
  id v11 = [v6 propertyForKey:@"BBSECTION_INFO_KEY"];

  LODWORD(v6) = [(NCSpokenNotificationsAppDetailController *)self _isTimeSensitiveAnnounceSupportedForSectionInfo:v11];
  unsigned int v7 = [(NCSpokenNotificationsAppDetailController *)self _isDirectMessagesAnnounceSupportedForSectionInfo:v11];
  unsigned int v8 = [v5 BOOLValue];

  uint64_t v9 = 2;
  if (!(v6 | v7)) {
    uint64_t v9 = 3;
  }
  if (v8) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 1;
  }
  [(NCSpokenNotificationsAppDetailController *)self setAnnounceSetting:v10];
  [(NCSpokenNotificationsAppDetailController *)self reloadSpecifiers];
  [(NCSpokenNotificationsAppDetailController *)self _signalDelegateSettingsChanged];
}

- (void)setSpokenOption:(id)a3
{
  id v4 = a3;
  id v6 = [v4 identifier];
  if ([v6 isEqualToString:@"SPOKEN_NOTIFICATIONS_APP_OPTIONS_TIME_SENSITIVE_ID"]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  [(NCSpokenNotificationsAppDetailController *)self setAnnounceSetting:v5];
  [(NCSpokenNotificationsAppDetailController *)self _setSpokenOptionSelectedSpecifier:v4];
}

- (void)setAnnounceSetting:(int64_t)a3
{
  id v4 = [(NCSpokenNotificationsAppDetailController *)self specifier];
  id v7 = [v4 propertyForKey:@"BBSECTION_INFO_KEY"];

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2 && ([v7 allowsNotifications] & 1) == 0) {
    [v7 setAllowsNotifications:1];
  }
  [v7 setAnnounceSetting:a3];
  uint64_t v5 = [v7 sectionID];
  id v6 = +[NCSettingsGatewayController sharedInstance];
  [v6 setSectionInfo:v7 forSectionID:v5];
}

- (void)_updateOptionsGroupSpecifiers
{
  uint64_t v3 = [(NCSpokenNotificationsAppDetailController *)self specifier];
  id v4 = [v3 propertyForKey:@"BBSECTION_INFO_KEY"];

  unint64_t v5 = (unint64_t)objc_msgSend(v4, "nc_effectiveAnnounceSetting");
  unsigned int v6 = [(NCSpokenNotificationsAppDetailController *)self _isTimeSensitiveAnnounceSupportedForSectionInfo:v4];
  unsigned int v7 = v6 | [(NCSpokenNotificationsAppDetailController *)self _isDirectMessagesAnnounceSupportedForSectionInfo:v4];
  if (v7)
  {
    unsigned int v8 = [(NCSpokenNotificationsAppDetailController *)self _spokenOptionsGroupSpecifier];
    v15[0] = v8;
    uint64_t v9 = [(NCSpokenNotificationsAppDetailController *)self _spokenOptionsTimeSensitiveSpecifier];
    v15[1] = v9;
    uint64_t v10 = [(NCSpokenNotificationsAppDetailController *)self _spokenOptionsAllSpecifier];
    v15[2] = v10;
    id v11 = +[NSArray arrayWithObjects:v15 count:3];
  }
  else
  {
    unsigned int v8 = [(NCSpokenNotificationsAppDetailController *)self _spokenNoOptionsGroupSpecifier];
    v14 = v8;
    id v11 = +[NSArray arrayWithObjects:&v14 count:1];
  }

  if (v5 == 1 || (v5 != 2 ? (char v12 = 1) : (char v12 = v7), (v12 & 1) == 0))
  {
    [(NCSpokenNotificationsAppDetailController *)self removeContiguousSpecifiers:v11];
  }
  else if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [(NCSpokenNotificationsAppDetailController *)self addSpecifiersFromArray:v11];
    if (v7)
    {
      if (v5 == 2) {
        [(NCSpokenNotificationsAppDetailController *)self _spokenOptionsTimeSensitiveSpecifier];
      }
      else {
      v13 = [(NCSpokenNotificationsAppDetailController *)self _spokenOptionsAllSpecifier];
      }
      [(NCSpokenNotificationsAppDetailController *)self _setSpokenOptionSelectedSpecifier:v13];
    }
  }
}

- (void)_setSpokenOptionSelectedSpecifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NCSpokenNotificationsAppDetailController *)self _spokenOptionsGroupSpecifier];
  [v5 setProperty:v4 forKey:PSRadioGroupCheckedSpecifierKey];

  unsigned int v6 = [(NCSpokenNotificationsAppDetailController *)self _spokenOptionsGroupSpecifier];
  [(NCSpokenNotificationsAppDetailController *)self reloadSpecifier:v6];

  [(NCSpokenNotificationsAppDetailController *)self _signalDelegateSettingsChanged];
}

- (id)_spokenOptionsGroupSpecifier
{
  spokenOptionsGroupSpecifier = self->_spokenOptionsGroupSpecifier;
  if (!spokenOptionsGroupSpecifier)
  {
    id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    unint64_t v5 = [v4 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_APP_OPTIONS_GROUP" value:&stru_419A0 table:@"NotificationsSettings"];
    unsigned int v6 = +[PSSpecifier groupSpecifierWithID:@"SPOKEN_NOTIFICATIONS_APP_OPTIONS_GROUP" name:v5];
    unsigned int v7 = self->_spokenOptionsGroupSpecifier;
    self->_spokenOptionsGroupSpecifier = v6;

    [(PSSpecifier *)self->_spokenOptionsGroupSpecifier setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    unsigned int v8 = [(NCSpokenNotificationsAppDetailController *)self specifier];
    uint64_t v9 = [v8 propertyForKey:@"BBSECTION_INFO_KEY"];

    unsigned int v10 = [(NCSpokenNotificationsAppDetailController *)self _isTimeSensitiveAnnounceSupportedForSectionInfo:v9];
    unsigned int v11 = [(NCSpokenNotificationsAppDetailController *)self _isDirectMessagesAnnounceSupportedForSectionInfo:v9];
    if (v10 && v11)
    {
      char v12 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v13 = v12;
      CFStringRef v14 = @"SPOKEN_NOTIFICATIONS_APP_OPTIONS_FOOTER_TIME_SENSITIVE_AND_MESSAGES";
    }
    else if (v10)
    {
      char v12 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v13 = v12;
      CFStringRef v14 = @"SPOKEN_NOTIFICATIONS_APP_OPTIONS_FOOTER_TIME_SENSITIVE";
    }
    else
    {
      if (!v11)
      {
        v17 = 0;
        goto LABEL_10;
      }
      char v12 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v13 = v12;
      CFStringRef v14 = @"SPOKEN_NOTIFICATIONS_APP_OPTIONS_FOOTER_MESSAGES";
    }
    v15 = [v12 localizedStringForKey:v14 value:&stru_419A0 table:@"NotificationsSettings"];
    v16 = [(NCSpokenNotificationsAppDetailController *)self title];
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16);

LABEL_10:
    [(PSSpecifier *)self->_spokenOptionsGroupSpecifier setProperty:v17 forKey:PSFooterTextGroupKey];

    spokenOptionsGroupSpecifier = self->_spokenOptionsGroupSpecifier;
  }

  return spokenOptionsGroupSpecifier;
}

- (id)_spokenNoOptionsGroupSpecifier
{
  spokenNoOptionsGroupSpecifier = self->_spokenNoOptionsGroupSpecifier;
  if (!spokenNoOptionsGroupSpecifier)
  {
    id v4 = +[PSSpecifier groupSpecifierWithID:@"SPOKEN_NOTIFICATIONS_APP_NO_OPTIONS_GROUP"];
    unint64_t v5 = self->_spokenNoOptionsGroupSpecifier;
    self->_spokenNoOptionsGroupSpecifier = v4;

    [(PSSpecifier *)self->_spokenNoOptionsGroupSpecifier setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    unsigned int v6 = self->_spokenNoOptionsGroupSpecifier;
    unsigned int v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    unsigned int v8 = [v7 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_APP_NO_OPTIONS_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];
    uint64_t v9 = [(NCSpokenNotificationsAppDetailController *)self title];
    unsigned int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);
    [(PSSpecifier *)v6 setProperty:v10 forKey:PSFooterTextGroupKey];

    spokenNoOptionsGroupSpecifier = self->_spokenNoOptionsGroupSpecifier;
  }

  return spokenNoOptionsGroupSpecifier;
}

- (id)_spokenOptionsTimeSensitiveSpecifier
{
  spokenOptionsTimeSensitiveSpecifier = self->_spokenOptionsTimeSensitiveSpecifier;
  if (!spokenOptionsTimeSensitiveSpecifier)
  {
    id v4 = [(NCSpokenNotificationsAppDetailController *)self specifier];
    unint64_t v5 = [v4 propertyForKey:@"BBSECTION_INFO_KEY"];

    unsigned int v6 = [(NCSpokenNotificationsAppDetailController *)self _isTimeSensitiveAnnounceSupportedForSectionInfo:v5];
    unsigned int v7 = [(NCSpokenNotificationsAppDetailController *)self _isDirectMessagesAnnounceSupportedForSectionInfo:v5];
    if (v6 && v7)
    {
      unsigned int v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      uint64_t v9 = v8;
      CFStringRef v10 = @"SPOKEN_NOTIFICATIONS_APP_OPTIONS_TIME_SENSITIVE_AND_MESSAGES";
    }
    else if (v6)
    {
      unsigned int v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      uint64_t v9 = v8;
      CFStringRef v10 = @"SPOKEN_NOTIFICATIONS_APP_OPTIONS_TIME_SENSITIVE";
    }
    else
    {
      if (!v7)
      {
        unsigned int v11 = 0;
        goto LABEL_10;
      }
      unsigned int v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      uint64_t v9 = v8;
      CFStringRef v10 = @"SPOKEN_NOTIFICATIONS_APP_OPTIONS_MESSAGES";
    }
    unsigned int v11 = [v8 localizedStringForKey:v10 value:&stru_419A0 table:@"NotificationsSettings"];

LABEL_10:
    char v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];
    v13 = self->_spokenOptionsTimeSensitiveSpecifier;
    self->_spokenOptionsTimeSensitiveSpecifier = v12;

    [(PSSpecifier *)self->_spokenOptionsTimeSensitiveSpecifier setIdentifier:@"SPOKEN_NOTIFICATIONS_APP_OPTIONS_TIME_SENSITIVE_ID"];
    [(PSSpecifier *)self->_spokenOptionsTimeSensitiveSpecifier setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [(PSSpecifier *)self->_spokenOptionsTimeSensitiveSpecifier setButtonAction:"setSpokenOption:"];

    spokenOptionsTimeSensitiveSpecifier = self->_spokenOptionsTimeSensitiveSpecifier;
  }

  return spokenOptionsTimeSensitiveSpecifier;
}

- (id)_spokenOptionsAllSpecifier
{
  spokenOptionsAllSpecifier = self->_spokenOptionsAllSpecifier;
  if (!spokenOptionsAllSpecifier)
  {
    id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    unint64_t v5 = [v4 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_APP_OPTIONS_ALL" value:&stru_419A0 table:@"NotificationsSettings"];
    unsigned int v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:3 edit:0];
    unsigned int v7 = self->_spokenOptionsAllSpecifier;
    self->_spokenOptionsAllSpecifier = v6;

    [(PSSpecifier *)self->_spokenOptionsAllSpecifier setIdentifier:@"SPOKEN_NOTIFICATIONS_APP_OPTIONS_ALL"];
    [(PSSpecifier *)self->_spokenOptionsAllSpecifier setButtonAction:"setSpokenOption:"];
    spokenOptionsAllSpecifier = self->_spokenOptionsAllSpecifier;
  }

  return spokenOptionsAllSpecifier;
}

- (void)_signalDelegateSettingsChanged
{
  id v5 = [(NCSpokenNotificationsAppDetailController *)self delegate];
  if (v5)
  {
    uint64_t v3 = [(NCSpokenNotificationsAppDetailController *)self specifier];
    id v4 = [v3 identifier];
    [v5 didChangeSettingForSpokenNotificationsAppDetailController:self withSpecifierIdentifier:v4];
  }
}

- (id)selectSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCSpokenNotificationsAppDetailController;
  id v4 = [(NCSpokenNotificationsAppDetailController *)&v6 selectSpecifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDelegate:self];
  }

  return v4;
}

+ (BOOL)isTimeSensitiveAnnounceSupportedForSectionInfo:(id)a3
{
  return [a3 timeSensitiveSetting] == (char *)&dword_0 + 2;
}

+ (BOOL)isDirectMessagesAnnounceSupportedForSectionInfo:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 scheduledDeliverySetting] != (char *)&dword_0 + 2 && objc_msgSend(v3, "directMessagesSetting")
    || [v3 scheduledDeliverySetting] == (char *)&dword_0 + 2
    && [v3 directMessagesSetting] == (char *)&dword_0 + 2;

  return v4;
}

- (BOOL)_isTimeSensitiveAnnounceSupportedForSectionInfo:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [(id)objc_opt_class() isTimeSensitiveAnnounceSupportedForSectionInfo:v3];

  return v4;
}

- (BOOL)_isDirectMessagesAnnounceSupportedForSectionInfo:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [(id)objc_opt_class() isDirectMessagesAnnounceSupportedForSectionInfo:v3];

  return v4;
}

- (void)didChangeSettingForSpokenNotificationsAppDetailController:(id)a3 withSpecifierIdentifier:(id)a4
{
  [(NCSpokenNotificationsAppDetailController *)self reloadSpecifierID:a4];
  id v7 = [(NCSpokenNotificationsAppDetailController *)self delegate];
  id v5 = [(NCSpokenNotificationsAppDetailController *)self specifier];
  objc_super v6 = [v5 identifier];
  [v7 didChangeSettingForSpokenNotificationsAppDetailController:self withSpecifierIdentifier:v6];
}

- (NCSpokenNotificationsAppDetailControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCSpokenNotificationsAppDetailControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spokenNoOptionsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_spokenOptionsAllSpecifier, 0);
  objc_storeStrong((id *)&self->_spokenOptionsTimeSensitiveSpecifier, 0);

  objc_storeStrong((id *)&self->_spokenOptionsGroupSpecifier, 0);
}

@end