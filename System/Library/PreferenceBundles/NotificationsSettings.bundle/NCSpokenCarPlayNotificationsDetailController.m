@interface NCSpokenCarPlayNotificationsDetailController
+ (BOOL)announceCarPlayEnabled;
+ (id)globalAnnounceCarPlaySetting:(id)a3;
+ (id)spokenCarPlayNotificationSpecifierNamed:(id)a3;
- (BOOL)shouldReloadSpecifiersOnResume;
- (NCSpokenCarPlayNotificationsDetailController)init;
- (NCSpokenCarPlayNotificationsDetailControllerDelegate)delegate;
- (id)_announceNewMessagesSpecifier;
- (id)_announceOptionSpecifierNamed:(id)a3 identifier:(id)a4;
- (id)_announceOptionsGroupSpecifier;
- (id)_announceOptionsSectionSpecifiers;
- (id)_rememberPreviousSettingSpecifier;
- (id)_silenceNewMessagesSpecifier;
- (id)globalAnnounceCarPlaySetting:(id)a3;
- (id)specifiers;
- (void)_setAnnounceOption:(id)a3;
- (void)_updateAnnounceOptionsAnimated:(BOOL)a3;
- (void)_updateAnnounceOptionsGroupSpecifiersAnimated:(BOOL)a3;
- (void)_updateAnnounceSwitchGroupSpecifierAnimated:(BOOL)a3;
- (void)controller:(id)a3 announceNotificationsInCarPlayTemporarilyDisabledChanged:(BOOL)a4;
- (void)controller:(id)a3 carPlayAnnounceEnablementTypeChanged:(int64_t)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setGlobalAnnounceCarPlaySetting:(id)a3 specifier:(id)a4;
- (void)settingsGatewayDidUpdateGlobalSettings:(id)a3;
@end

@implementation NCSpokenCarPlayNotificationsDetailController

- (NCSpokenCarPlayNotificationsDetailController)init
{
  v8.receiver = self;
  v8.super_class = (Class)NCSpokenCarPlayNotificationsDetailController;
  v2 = [(NCSpokenCarPlayNotificationsDetailController *)&v8 init];
  if (v2)
  {
    v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v4 = [v3 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATION_CARPLAY" value:&stru_419A0 table:@"NotificationsSettings"];
    [(NCSpokenCarPlayNotificationsDetailController *)v2 setTitle:v4];

    v5 = +[NCAssistantPreferencesController sharedInstance];
    [v5 addObserver:v2];

    v6 = +[NCSettingsGatewayController sharedInstance];
    [v6 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NCAssistantPreferencesController sharedInstance];
  [v3 removeObserver:self];

  v4 = +[NCSettingsGatewayController sharedInstance];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NCSpokenCarPlayNotificationsDetailController;
  [(NCSpokenCarPlayNotificationsDetailController *)&v5 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    announceMessagesInCarPlaySwitchGroupSpecifier = self->_announceMessagesInCarPlaySwitchGroupSpecifier;
    if (!announceMessagesInCarPlaySwitchGroupSpecifier)
    {
      v6 = +[PSSpecifier groupSpecifierWithID:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_SWITCH_GROUP_ID"];
      v7 = self->_announceMessagesInCarPlaySwitchGroupSpecifier;
      self->_announceMessagesInCarPlaySwitchGroupSpecifier = v6;

      announceMessagesInCarPlaySwitchGroupSpecifier = self->_announceMessagesInCarPlaySwitchGroupSpecifier;
    }
    [v4 addObject:announceMessagesInCarPlaySwitchGroupSpecifier];
    objc_super v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v9 = [v8 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_MESSAGES" value:&stru_419A0 table:@"NotificationsSettings"];
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setGlobalAnnounceCarPlaySetting:specifier:" get:"globalAnnounceCarPlaySetting:" detail:0 cell:6 edit:0];

    [v10 setIdentifier:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_SWITCH_ID"];
    objc_msgSend(v4, "bs_safeAddObject:", v10);
    v11 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v4;
  }
  [(NCSpokenCarPlayNotificationsDetailController *)self _updateAnnounceSwitchGroupSpecifierAnimated:0];
  [(NCSpokenCarPlayNotificationsDetailController *)self _updateAnnounceOptionsGroupSpecifiersAnimated:0];
  v12 = *(void **)&self->PSListController_opaque[v3];

  return v12;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

+ (id)spokenCarPlayNotificationSpecifierNamed:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:a1 set:0 get:"globalAnnounceCarPlaySetting:" detail:objc_opt_class() cell:2 edit:0];

  id v6 = objc_alloc((Class)NSMutableArray);
  v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  objc_super v8 = [v7 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATION_CARPLAY_DISABLED" value:&stru_419A0 table:@"NotificationsSettings"];
  v14[0] = v8;
  v9 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v10 = [v9 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATION_CARPLAY_ENABLED" value:&stru_419A0 table:@"NotificationsSettings"];
  v14[1] = v10;
  v11 = +[NSArray arrayWithObjects:v14 count:2];
  id v12 = [v6 initWithArray:v11];

  [v5 setValues:&off_44868 titles:v12];

  return v5;
}

+ (BOOL)announceCarPlayEnabled
{
  v2 = +[NCSettingsGatewayController sharedInstance];
  id v3 = [v2 effectiveGlobalAnnounceCarPlaySetting];

  return (uint64_t)v3 > 1;
}

+ (id)globalAnnounceCarPlaySetting:(id)a3
{
  id v3 = objc_msgSend(a1, "announceCarPlayEnabled", a3);

  return +[NSNumber numberWithBool:v3];
}

- (id)globalAnnounceCarPlaySetting:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() globalAnnounceCarPlaySetting:v3];

  return v4;
}

- (void)setGlobalAnnounceCarPlaySetting:(id)a3 specifier:(id)a4
{
  id v13 = a3;
  objc_super v5 = +[NCSettingsGatewayController sharedInstance];
  id v6 = (char *)[v5 effectiveGlobalAnnounceCarPlaySetting];

  if ([v13 BOOLValue]) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 1;
  }
  if (v6 != (char *)v7)
  {
    if (v6 == (unsigned char *)&dword_0 + 1)
    {
      objc_super v8 = +[NCAssistantPreferencesController sharedInstance];
      [v8 clearAnnounceNotificationsInCarPlayTemporarilyDisabled];
    }
    v9 = +[NCSettingsGatewayController sharedInstance];
    [v9 setEffectiveGlobalAnnounceCarPlaySetting:v7];

    if ([v13 BOOLValue]) {
      uint64_t v10 = 4;
    }
    else {
      uint64_t v10 = 1;
    }
    v11 = +[NCAssistantPreferencesController sharedInstance];
    [v11 setCarPlayAnnounceEnablementType:v10];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didChangeSettingForSpokenCarPlayNotificationsDetailController:self];
}

- (void)_updateAnnounceOptionsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[NCAssistantPreferencesController sharedInstance];
  id v6 = (int *)[v5 carPlayAnnounceEnablementType];

  if (v6 == &dword_4)
  {
    id v15 = [(NCSpokenCarPlayNotificationsDetailController *)self _rememberPreviousSettingSpecifier];
    objc_super v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v9 = v8;
    CFStringRef v10 = @"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_REMEMBER_PREVIOUS_SETTING_FOOTER";
LABEL_8:
    v11 = [v8 localizedStringForKey:v10 value:&stru_419A0 table:@"NotificationsSettings"];

    goto LABEL_10;
  }
  if (v6 == (int *)((char *)&dword_0 + 3))
  {
    uint64_t v7 = [(NCSpokenCarPlayNotificationsDetailController *)self _silenceNewMessagesSpecifier];
    goto LABEL_7;
  }
  if (v6 == (int *)((char *)&dword_0 + 2))
  {
    uint64_t v7 = [(NCSpokenCarPlayNotificationsDetailController *)self _announceNewMessagesSpecifier];
LABEL_7:
    id v15 = (id)v7;
    objc_super v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v9 = v8;
    CFStringRef v10 = @"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_ANNOUNCE_OR_SILENCE_FOOTER";
    goto LABEL_8;
  }
  id v15 = 0;
  v11 = 0;
LABEL_10:
  id v12 = [(NCSpokenCarPlayNotificationsDetailController *)self _announceOptionsGroupSpecifier];
  [v12 setProperty:v15 forKey:PSRadioGroupCheckedSpecifierKey];

  id v13 = [(NCSpokenCarPlayNotificationsDetailController *)self _announceOptionsGroupSpecifier];
  [v13 setProperty:v11 forKey:PSFooterTextGroupKey];

  v14 = [(NCSpokenCarPlayNotificationsDetailController *)self _announceOptionsGroupSpecifier];
  [(NCSpokenCarPlayNotificationsDetailController *)self reloadSpecifier:v14 animated:v3];
}

- (void)_setAnnounceOption:(id)a3
{
  id v5 = [a3 identifier];
  if ([v5 isEqualToString:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_ANNOUNCE_NEW_ID"])
  {
    uint64_t v3 = 2;
  }
  else if ([v5 isEqualToString:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_SILENCE_NEW_ID"])
  {
    uint64_t v3 = 3;
  }
  else if ([v5 isEqualToString:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_REMEMBER_LAST_ID"])
  {
    uint64_t v3 = 4;
  }
  else
  {
    uint64_t v3 = 1;
  }
  id v4 = +[NCAssistantPreferencesController sharedInstance];
  [v4 setCarPlayAnnounceEnablementType:v3];
}

- (void)_updateAnnounceSwitchGroupSpecifierAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(id)objc_opt_class() announceCarPlayEnabled])
  {
    id v5 = +[NCAssistantPreferencesController sharedInstance];
    unsigned int v6 = [v5 announceNotificationsInCarPlayTemporarilyDisabled];

    uint64_t v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    objc_super v8 = v7;
    if (v6) {
      CFStringRef v9 = @"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_MESSAGES_FOOTER_SILENCE_NEW_MESSAGES";
    }
    else {
      CFStringRef v9 = @"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_MESSAGES_FOOTER_ANNOUNCE_NEW_MESSAGES";
    }
  }
  else
  {
    uint64_t v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    objc_super v8 = v7;
    CFStringRef v9 = @"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_MESSAGES_FOOTER_DISABLED";
  }
  id v10 = [v7 localizedStringForKey:v9 value:&stru_419A0 table:@"NotificationsSettings"];

  [(PSSpecifier *)self->_announceMessagesInCarPlaySwitchGroupSpecifier setProperty:v10 forKey:PSFooterTextGroupKey];
  [(NCSpokenCarPlayNotificationsDetailController *)self reloadSpecifier:self->_announceMessagesInCarPlaySwitchGroupSpecifier animated:v3];
}

- (void)_updateAnnounceOptionsGroupSpecifiersAnimated:(BOOL)a3
{
  -[NCSpokenCarPlayNotificationsDetailController _updateAnnounceOptionsAnimated:](self, "_updateAnnounceOptionsAnimated:");
  if ([(id)objc_opt_class() announceCarPlayEnabled]
    && (id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers],
        -[NCSpokenCarPlayNotificationsDetailController _announceOptionsGroupSpecifier](self, "_announceOptionsGroupSpecifier"), id v5 = objc_claimAutoreleasedReturnValue(), LOBYTE(v4) = [v4 containsObject:v5], v5, (v4 & 1) == 0))
  {
    id v6 = [(NCSpokenCarPlayNotificationsDetailController *)self _announceOptionsSectionSpecifiers];
    -[NCSpokenCarPlayNotificationsDetailController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:");
  }
  else
  {
    if ([(id)objc_opt_class() announceCarPlayEnabled]) {
      return;
    }
    id v6 = [(NCSpokenCarPlayNotificationsDetailController *)self _announceOptionsSectionSpecifiers];
    -[NCSpokenCarPlayNotificationsDetailController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:");
  }
}

- (id)_announceOptionsSectionSpecifiers
{
  BOOL v3 = [(NCSpokenCarPlayNotificationsDetailController *)self _announceOptionsGroupSpecifier];
  v9[0] = v3;
  id v4 = [(NCSpokenCarPlayNotificationsDetailController *)self _announceNewMessagesSpecifier];
  v9[1] = v4;
  id v5 = [(NCSpokenCarPlayNotificationsDetailController *)self _silenceNewMessagesSpecifier];
  v9[2] = v5;
  id v6 = [(NCSpokenCarPlayNotificationsDetailController *)self _rememberPreviousSettingSpecifier];
  v9[3] = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:v9 count:4];

  return v7;
}

- (id)_announceOptionsGroupSpecifier
{
  announceOptionsGroupSpecifier = self->_announceOptionsGroupSpecifier;
  if (!announceOptionsGroupSpecifier)
  {
    id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v5 = [v4 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_GROUP" value:&stru_419A0 table:@"NotificationsSettings"];
    id v6 = +[PSSpecifier groupSpecifierWithID:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_GROUP_ID" name:v5];
    uint64_t v7 = self->_announceOptionsGroupSpecifier;
    self->_announceOptionsGroupSpecifier = v6;

    [(PSSpecifier *)self->_announceOptionsGroupSpecifier setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    announceOptionsGroupSpecifier = self->_announceOptionsGroupSpecifier;
  }

  return announceOptionsGroupSpecifier;
}

- (id)_announceNewMessagesSpecifier
{
  announceNewMessagesSpecifier = self->_announceNewMessagesSpecifier;
  if (!announceNewMessagesSpecifier)
  {
    id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v5 = [v4 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_ANNOUNCE_NEW_MESSAGES" value:&stru_419A0 table:@"NotificationsSettings"];
    id v6 = [(NCSpokenCarPlayNotificationsDetailController *)self _announceOptionSpecifierNamed:v5 identifier:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_ANNOUNCE_NEW_ID"];
    uint64_t v7 = self->_announceNewMessagesSpecifier;
    self->_announceNewMessagesSpecifier = v6;

    announceNewMessagesSpecifier = self->_announceNewMessagesSpecifier;
  }

  return announceNewMessagesSpecifier;
}

- (id)_silenceNewMessagesSpecifier
{
  silenceNewMessagesSpecifier = self->_silenceNewMessagesSpecifier;
  if (!silenceNewMessagesSpecifier)
  {
    id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v5 = [v4 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_SILENCE_NEW_MESSAGES" value:&stru_419A0 table:@"NotificationsSettings"];
    id v6 = [(NCSpokenCarPlayNotificationsDetailController *)self _announceOptionSpecifierNamed:v5 identifier:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_SILENCE_NEW_ID"];
    uint64_t v7 = self->_silenceNewMessagesSpecifier;
    self->_silenceNewMessagesSpecifier = v6;

    silenceNewMessagesSpecifier = self->_silenceNewMessagesSpecifier;
  }

  return silenceNewMessagesSpecifier;
}

- (id)_rememberPreviousSettingSpecifier
{
  rememberPreviousSettingSpecifier = self->_rememberPreviousSettingSpecifier;
  if (!rememberPreviousSettingSpecifier)
  {
    id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v5 = [v4 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_REMEMBER_PREVIOUS_SETTING" value:&stru_419A0 table:@"NotificationsSettings"];
    id v6 = [(NCSpokenCarPlayNotificationsDetailController *)self _announceOptionSpecifierNamed:v5 identifier:@"SPOKEN_NOTIFICATIONS_CARPLAY_ANNOUNCE_OPTIONS_REMEMBER_LAST_ID"];
    uint64_t v7 = self->_rememberPreviousSettingSpecifier;
    self->_rememberPreviousSettingSpecifier = v6;

    rememberPreviousSettingSpecifier = self->_rememberPreviousSettingSpecifier;
  }

  return rememberPreviousSettingSpecifier;
}

- (id)_announceOptionSpecifierNamed:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v7 setIdentifier:v6];

  [v7 setButtonAction:"_setAnnounceOption:"];

  return v7;
}

- (void)controller:(id)a3 carPlayAnnounceEnablementTypeChanged:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15F08;
  block[3] = &unk_40F58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)controller:(id)a3 announceNotificationsInCarPlayTemporarilyDisabledChanged:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15F88;
  block[3] = &unk_40F58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)settingsGatewayDidUpdateGlobalSettings:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_16008;
  block[3] = &unk_40F58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (NCSpokenCarPlayNotificationsDetailControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCSpokenCarPlayNotificationsDetailControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rememberPreviousSettingSpecifier, 0);
  objc_storeStrong((id *)&self->_silenceNewMessagesSpecifier, 0);
  objc_storeStrong((id *)&self->_announceNewMessagesSpecifier, 0);
  objc_storeStrong((id *)&self->_announceOptionsGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_announceMessagesInCarPlaySwitchGroupSpecifier, 0);
}

@end