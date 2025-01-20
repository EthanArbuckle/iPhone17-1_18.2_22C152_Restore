@interface CARAnnounceNotificationsPanel
- (BOOL)_isAnnounceEnabled;
- (BOOL)_isAnnounceMuted;
- (BOOL)isFocusActive;
- (BOOL)pendingAnnounceEnablementChangeFromSiri;
- (BOOL)pendingAnnounceEnablementChangeFromUserNotifications;
- (CARAnnounceNotificationsMuteOptionsPanel)muteOptionsPanel;
- (CARAnnounceNotificationsPanel)initWithPanelController:(id)a3;
- (CARSettingsButtonCellSpecifier)muteAnnouncementsSpecifier;
- (CARSettingsSwitchCellSpecifier)announceEnabledSpecifier;
- (CRSSiriPreferences)siriPreferences;
- (DNDStateService)dndStateService;
- (id)_announceEnabledFooterText;
- (id)_muteAnnouncementsSpecifierTitleForMuted:(BOOL)a3 announceEnablementType:(int64_t)a4;
- (id)cellSpecifier;
- (id)specifierSections;
- (void)_updateAnnounceEnabled:(BOOL)a3;
- (void)_updateAnnounceMuted:(BOOL)a3;
- (void)announceCarPlaySettingUpdated:(int64_t)a3;
- (void)preferences:(id)a3 announceNotificationsInCarPlayTemporarilyDisabledChanged:(BOOL)a4;
- (void)preferences:(id)a3 carPlayAnnounceEnablementTypeChanged:(int64_t)a4;
- (void)setFocusActive:(BOOL)a3;
- (void)setPendingAnnounceEnablementChangeFromSiri:(BOOL)a3;
- (void)setPendingAnnounceEnablementChangeFromUserNotifications:(BOOL)a3;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
@end

@implementation CARAnnounceNotificationsPanel

- (CARAnnounceNotificationsPanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CARAnnounceNotificationsPanel;
  v5 = [(CARSettingsPanel *)&v16 initWithPanelController:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [(CARSettingsPanel *)v5 panelController];
    [v7 addSiriPreferencesObserver:v6];

    v8 = [(CARSettingsPanel *)v6 panelController];
    [v8 addNotificationSettingsObserver:v6];

    uint64_t v9 = +[DNDStateService serviceForClientIdentifier:@"com.apple.carplay.settings"];
    dndStateService = v6->_dndStateService;
    v6->_dndStateService = (DNDStateService *)v9;

    [(DNDStateService *)v6->_dndStateService addStateUpdateListener:v6 withCompletionHandler:&stru_100091FB8];
    objc_initWeak(&location, v6);
    v11 = v6->_dndStateService;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100008084;
    v13[3] = &unk_100091FE0;
    objc_copyWeak(&v14, &location);
    [(DNDStateService *)v11 queryCurrentStateWithCompletionHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    id v4 = [CARSettingsCellSpecifier alloc];
    v5 = sub_1000210C8(@"ANNOUNCE_TITLE");
    v6 = +[CARSettingsImageCache announceImage];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100008274;
    v10[3] = &unk_100092008;
    objc_copyWeak(&v11, &location);
    v7 = [(CARSettingsCellSpecifier *)v4 initWithTitle:v5 image:v6 accessoryType:1 actionBlock:v10];
    v8 = self->_cellSpecifier;
    self->_cellSpecifier = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (id)specifierSections
{
  v3 = +[NSMutableArray arrayWithCapacity:2];
  id v4 = sub_100021030();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CARAnnounceNotificationsPanel *)self _isAnnounceEnabled];
    unsigned int v6 = [(CARAnnounceNotificationsPanel *)self _isAnnounceMuted];
    v7 = [(CARAnnounceNotificationsPanel *)self siriPreferences];
    [v7 carPlayAnnounceEnablementType];
    v8 = AFSiriCarPlayAnnounceEnablementTypeGetName();
    *(_DWORD *)buf = 67240706;
    unsigned int v39 = v5;
    __int16 v40 = 1026;
    unsigned int v41 = v6;
    __int16 v42 = 2114;
    v43 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Settings] Updating Announce Notifications Panel with announceEnabled: %{public, BOOL}d, announceMuted: %{public, BOOL}d, announceEnablementType: %{public}@", buf, 0x18u);
  }
  uint64_t v9 = +[NSNumber numberWithBool:[(CARAnnounceNotificationsPanel *)self _isAnnounceEnabled]];
  v10 = [(CARAnnounceNotificationsPanel *)self announceEnabledSpecifier];
  [v10 setCellValue:v9];

  if ([(CARAnnounceNotificationsPanel *)self _isAnnounceEnabled])
  {
    if (!self->_muteOptionsPanel)
    {
      id v11 = [CARAnnounceNotificationsMuteOptionsPanel alloc];
      v12 = [(CARSettingsPanel *)self panelController];
      v13 = [(CARAnnounceNotificationsMuteOptionsPanel *)v11 initWithPanelController:v12];
      muteOptionsPanel = self->_muteOptionsPanel;
      self->_muteOptionsPanel = v13;
    }
    v15 = [CARSettingsCellSpecifierSection alloc];
    objc_super v16 = [(CARAnnounceNotificationsPanel *)self _announceEnabledFooterText];
    v17 = [(CARAnnounceNotificationsPanel *)self announceEnabledSpecifier];
    v37[0] = v17;
    v18 = [(CARAnnounceNotificationsPanel *)self muteOptionsPanel];
    v19 = [v18 cellSpecifier];
    v37[1] = v19;
    v20 = +[NSArray arrayWithObjects:v37 count:2];
    v21 = [(CARSettingsCellSpecifierSection *)v15 initWithFooter:v16 specifiers:v20];

    [v3 addObject:v21];
    BOOL v22 = [(CARAnnounceNotificationsPanel *)self _isAnnounceMuted];
    v23 = [(CARAnnounceNotificationsPanel *)self siriPreferences];
    v24 = -[CARAnnounceNotificationsPanel _muteAnnouncementsSpecifierTitleForMuted:announceEnablementType:](self, "_muteAnnouncementsSpecifierTitleForMuted:announceEnablementType:", v22, [v23 carPlayAnnounceEnablementType]);
    v25 = [(CARAnnounceNotificationsPanel *)self muteAnnouncementsSpecifier];
    [v25 setTitle:v24];

    v26 = +[NSNumber numberWithBool:[(CARAnnounceNotificationsPanel *)self _isAnnounceMuted]];
    v27 = [(CARAnnounceNotificationsPanel *)self muteAnnouncementsSpecifier];
    [v27 setCellValue:v26];

    v28 = [CARSettingsCellSpecifierSection alloc];
    v29 = [(CARAnnounceNotificationsPanel *)self muteAnnouncementsSpecifier];
    v36 = v29;
    v30 = +[NSArray arrayWithObjects:&v36 count:1];
    v31 = [(CARSettingsCellSpecifierSection *)v28 initWithSpecifiers:v30];
  }
  else
  {
    v32 = [CARSettingsCellSpecifierSection alloc];
    v21 = [(CARAnnounceNotificationsPanel *)self _announceEnabledFooterText];
    v29 = [(CARAnnounceNotificationsPanel *)self announceEnabledSpecifier];
    v35 = v29;
    v30 = +[NSArray arrayWithObjects:&v35 count:1];
    v31 = [(CARSettingsCellSpecifierSection *)v32 initWithFooter:v21 specifiers:v30];
  }
  v33 = v31;
  [v3 addObject:v31];

  return v3;
}

- (CRSSiriPreferences)siriPreferences
{
  v2 = [(CARSettingsPanel *)self panelController];
  v3 = [v2 siriPreferences];

  return (CRSSiriPreferences *)v3;
}

- (CARSettingsSwitchCellSpecifier)announceEnabledSpecifier
{
  announceEnabledSpecifier = self->_announceEnabledSpecifier;
  if (!announceEnabledSpecifier)
  {
    objc_initWeak(&location, self);
    id v4 = [CARSettingsSwitchCellSpecifier alloc];
    unsigned int v5 = sub_1000210C8(@"ANNOUNCE_TITLE");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100008844;
    v9[3] = &unk_100092030;
    objc_copyWeak(&v10, &location);
    unsigned int v6 = [(CARSettingsSwitchCellSpecifier *)v4 initWithTitle:v5 image:0 actionBlock:v9];
    v7 = self->_announceEnabledSpecifier;
    self->_announceEnabledSpecifier = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    announceEnabledSpecifier = self->_announceEnabledSpecifier;
  }

  return announceEnabledSpecifier;
}

- (CARSettingsButtonCellSpecifier)muteAnnouncementsSpecifier
{
  muteAnnouncementsSpecifier = self->_muteAnnouncementsSpecifier;
  if (!muteAnnouncementsSpecifier)
  {
    objc_initWeak(&location, self);
    BOOL v4 = [(CARAnnounceNotificationsPanel *)self _isAnnounceMuted];
    unsigned int v5 = [(CARAnnounceNotificationsPanel *)self siriPreferences];
    unsigned int v6 = -[CARAnnounceNotificationsPanel _muteAnnouncementsSpecifierTitleForMuted:announceEnablementType:](self, "_muteAnnouncementsSpecifierTitleForMuted:announceEnablementType:", v4, [v5 carPlayAnnounceEnablementType]);

    v7 = [CARSettingsButtonCellSpecifier alloc];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100008A10;
    v11[3] = &unk_100092030;
    objc_copyWeak(&v12, &location);
    v8 = [(CARSettingsButtonCellSpecifier *)v7 initWithTitle:v6 image:0 actionBlock:v11];
    uint64_t v9 = self->_muteAnnouncementsSpecifier;
    self->_muteAnnouncementsSpecifier = v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    muteAnnouncementsSpecifier = self->_muteAnnouncementsSpecifier;
  }

  return muteAnnouncementsSpecifier;
}

- (void)setFocusActive:(BOOL)a3
{
  if (self->_focusActive != a3)
  {
    self->_focusActive = a3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008AF8;
    block[3] = &unk_100091F38;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)announceCarPlaySettingUpdated:(int64_t)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008B74;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)preferences:(id)a3 carPlayAnnounceEnablementTypeChanged:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008CF0;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)preferences:(id)a3 announceNotificationsInCarPlayTemporarilyDisabledChanged:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v6 = sub_100021030();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Settings] The new announceNotificationsInCarPlayTemporarilyDisabled value: %{public}d", buf, 8u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008EC4;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5 = a4;
  unsigned int v6 = sub_100021030();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 state];
    v9[0] = 67240192;
    v9[1] = [v7 isActive];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Settings] Setting a new Do Not Disturb state, isActive: %{public}d", (uint8_t *)v9, 8u);
  }
  v8 = [v5 state];
  -[CARAnnounceNotificationsPanel setFocusActive:](self, "setFocusActive:", [v8 isActive]);
}

- (BOOL)_isAnnounceEnabled
{
  v2 = [(CARSettingsPanel *)self panelController];
  v3 = [v2 notificationSystemSettings];
  unint64_t v4 = (unint64_t)[v3 announcementCarPlaySetting];

  return (v4 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_updateAnnounceEnabled:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = 4;
    uint64_t v5 = 3;
  }
  else
  {
    unsigned int v6 = [(CARAnnounceNotificationsPanel *)self siriPreferences];
    [v6 clearAnnounceNotificationsInCarPlayTemporarilyDisabled];

    uint64_t v5 = 1;
    uint64_t v4 = 1;
  }
  v7 = +[UNNotificationSettingsCenter currentNotificationSettingsCenter];
  v8 = [v7 notificationSystemSettings];
  id v9 = [v8 announcementCarPlaySetting];

  id v10 = sub_100021030();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134349312;
    id v22 = v9;
    __int16 v23 = 2050;
    uint64_t v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Settings] Current announcementCarPlaySetting:  %{public}li New announcementCarPlaySetting: %{public}li", (uint8_t *)&v21, 0x16u);
  }

  if (v9 == (id)v5)
  {
    [(CARAnnounceNotificationsPanel *)self setPendingAnnounceEnablementChangeFromUserNotifications:0];
  }
  else
  {
    id v11 = sub_100021030();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 134349312;
      id v22 = v9;
      __int16 v23 = 2050;
      uint64_t v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Settings] Updating announcementCarPlaySetting from %{public}li to %{public}li", (uint8_t *)&v21, 0x16u);
    }

    [(CARAnnounceNotificationsPanel *)self setPendingAnnounceEnablementChangeFromUserNotifications:1];
    id v12 = [v7 notificationSystemSettings];
    id v13 = [v12 mutableCopy];

    [v13 setAnnouncementCarPlaySetting:v5];
    id v14 = [v7 notificationSystemSettings];
    id v15 = [v14 announcementSetting];

    if (v15 != (id)2) {
      [v13 setAnnouncementSetting:2];
    }
    [v7 setNotificationSystemSettings:v13];
  }
  objc_super v16 = [(CARAnnounceNotificationsPanel *)self siriPreferences];
  id v17 = [v16 carPlayAnnounceEnablementType];

  v18 = sub_100021030();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134349312;
    id v22 = v17;
    __int16 v23 = 2050;
    uint64_t v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Settings] Current carPlayAnnounceEnablementType: %{public}li New carPlayAnnounceEnablementType %{public}li", (uint8_t *)&v21, 0x16u);
  }

  if (v17 == (id)v4)
  {
    [(CARAnnounceNotificationsPanel *)self setPendingAnnounceEnablementChangeFromSiri:0];
  }
  else
  {
    v19 = sub_100021030();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 134349312;
      id v22 = v17;
      __int16 v23 = 2050;
      uint64_t v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[Settings] Updating carPlayAnnounceEnablementType from %{public}li to %{public}li", (uint8_t *)&v21, 0x16u);
    }

    [(CARAnnounceNotificationsPanel *)self setPendingAnnounceEnablementChangeFromSiri:1];
    v20 = [(CARAnnounceNotificationsPanel *)self siriPreferences];
    [v20 setCarPlayAnnounceEnablementType:v4];
  }
}

- (id)_announceEnabledFooterText
{
  if ([(CARAnnounceNotificationsPanel *)self _isAnnounceEnabled])
  {
    if ([(CARAnnounceNotificationsPanel *)self _isAnnounceMuted])
    {
      v3 = @"ANNOUNCE_SILENCED_FOOTER";
    }
    else if ([(CARAnnounceNotificationsPanel *)self isFocusActive])
    {
      v3 = @"ANNOUNCE_FOCUS_ACTIVE_FOOTER";
    }
    else
    {
      v3 = @"ANNOUNCE_ACTIVE_FOOTER";
    }
  }
  else
  {
    v3 = @"ANNOUNCE_DISABLED_FOOTER";
  }
  uint64_t v4 = sub_1000210C8(v3);

  return v4;
}

- (BOOL)_isAnnounceMuted
{
  v3 = [(CARAnnounceNotificationsPanel *)self siriPreferences];
  uint64_t v4 = (char *)[v3 carPlayAnnounceEnablementType];

  if ((unint64_t)(v4 - 2) >= 3)
  {
    if ((unint64_t)v4 >= 2)
    {
      v8 = sub_100021030();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100065448((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    return 0;
  }
  else
  {
    uint64_t v5 = [(CARAnnounceNotificationsPanel *)self siriPreferences];
    unsigned __int8 v6 = [v5 announceNotificationsInCarPlayTemporarilyDisabled];

    return v6;
  }
}

- (void)_updateAnnounceMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_100021030();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67240192;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Settings] AnnounceMuted state is updated, muted: %{public}d", (uint8_t *)v7, 8u);
  }

  unsigned __int8 v6 = [(CARAnnounceNotificationsPanel *)self siriPreferences];
  [v6 setAnnounceNotificationsInCarPlayTemporarilyDisabled:v3];
}

- (id)_muteAnnouncementsSpecifierTitleForMuted:(BOOL)a3 announceEnablementType:(int64_t)a4
{
  if ((unint64_t)(a4 - 2) < 2)
  {
    CFStringRef v5 = @"ANNOUNCE_BUTTON_SILENCE_FOR_DRIVE_ONLY";
    CFStringRef v6 = @"ANNOUNCE_BUTTON_ANNOUNCE_FOR_DRIVE_ONLY";
LABEL_5:
    if (a3) {
      v7 = (__CFString *)v6;
    }
    else {
      v7 = (__CFString *)v5;
    }
    v8 = sub_1000210C8(v7);
    return v8;
  }
  if (a4 == 4)
  {
    CFStringRef v5 = @"ANNOUNCE_BUTTON_SILENCE_ANNOUNCEMENTS";
    CFStringRef v6 = @"ANNOUNCE_BUTTON_ANNOUNCE_NEW_MESSAGES";
    goto LABEL_5;
  }
  v8 = 0;
  return v8;
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (BOOL)isFocusActive
{
  return self->_focusActive;
}

- (BOOL)pendingAnnounceEnablementChangeFromSiri
{
  return self->_pendingAnnounceEnablementChangeFromSiri;
}

- (void)setPendingAnnounceEnablementChangeFromSiri:(BOOL)a3
{
  self->_pendingAnnounceEnablementChangeFromSiri = a3;
}

- (BOOL)pendingAnnounceEnablementChangeFromUserNotifications
{
  return self->_pendingAnnounceEnablementChangeFromUserNotifications;
}

- (void)setPendingAnnounceEnablementChangeFromUserNotifications:(BOOL)a3
{
  self->_pendingAnnounceEnablementChangeFromUserNotifications = a3;
}

- (CARAnnounceNotificationsMuteOptionsPanel)muteOptionsPanel
{
  return self->_muteOptionsPanel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteOptionsPanel, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
  objc_storeStrong((id *)&self->_muteAnnouncementsSpecifier, 0);
  objc_storeStrong((id *)&self->_announceEnabledSpecifier, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end