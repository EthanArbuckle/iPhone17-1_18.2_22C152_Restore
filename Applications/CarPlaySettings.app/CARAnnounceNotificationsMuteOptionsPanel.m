@interface CARAnnounceNotificationsMuteOptionsPanel
- (CARAnnounceNotificationsMuteOptionsPanel)initWithPanelController:(id)a3;
- (CARSettingsGroupCellSpecifier)groupSpecifier;
- (CRSSiriPreferences)siriPreferences;
- (NSArray)modes;
- (id)_modeForSiriPreferences:(id)a3;
- (id)cellSpecifier;
- (id)specifierSections;
- (int64_t)_userNotificationSettingForAnnounceType:(int64_t)a3;
- (void)_updateCurrentMode;
- (void)_updateSettingsForMode:(id)a3;
- (void)preferences:(id)a3 carPlayAnnounceEnablementTypeChanged:(int64_t)a4;
@end

@implementation CARAnnounceNotificationsMuteOptionsPanel

- (CARAnnounceNotificationsMuteOptionsPanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CARAnnounceNotificationsMuteOptionsPanel;
  v5 = [(CARSettingsPanel *)&v20 initWithPanelController:v4];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = [(CARSettingsPanel *)v5 panelController];
    [v6 addSiriPreferencesObserver:v5];

    uint64_t v7 = +[CARMuteOptionsMode allModes];
    modes = v5->_modes;
    v5->_modes = (NSArray *)v7;

    v9 = [CARSettingsGroupCellSpecifier alloc];
    v10 = [(NSArray *)v5->_modes valueForKey:@"fullTitle"];
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_100022880;
    v17 = &unk_1000921A0;
    objc_copyWeak(&v18, &location);
    v11 = [(CARSettingsGroupCellSpecifier *)v9 initWithTitles:v10 actionBlock:&v14];
    groupSpecifier = v5->_groupSpecifier;
    v5->_groupSpecifier = v11;

    [(CARAnnounceNotificationsMuteOptionsPanel *)v5 _updateCurrentMode];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    id v4 = [CARSettingsCellSpecifier alloc];
    v5 = sub_1000210C8(@"ANNOUNCE_OPTIONS_TITLE");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100022A5C;
    v9[3] = &unk_100092008;
    objc_copyWeak(&v10, &location);
    v6 = [(CARSettingsCellSpecifier *)v4 initWithTitle:v5 image:0 accessoryType:1 actionBlock:v9];
    uint64_t v7 = self->_cellSpecifier;
    self->_cellSpecifier = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (id)specifierSections
{
  v3 = [(CARAnnounceNotificationsMuteOptionsPanel *)self modes];
  id v4 = [(CARAnnounceNotificationsMuteOptionsPanel *)self groupSpecifier];
  v5 = [v3 objectAtIndexedSubscript:[v4 selectedIndex]];

  v6 = [CARSettingsCellSpecifierSection alloc];
  uint64_t v7 = sub_1000210C8(@"CARPLAY_START_HEADER");
  v8 = [v5 footer];
  v9 = [(CARAnnounceNotificationsMuteOptionsPanel *)self groupSpecifier];
  id v10 = [v9 groupSpecifiers];
  v11 = [(CARSettingsCellSpecifierSection *)v6 initWithTitle:v7 footer:v8 specifiers:v10];
  v14 = v11;
  v12 = +[NSArray arrayWithObjects:&v14 count:1];

  return v12;
}

- (CRSSiriPreferences)siriPreferences
{
  v2 = [(CARSettingsPanel *)self panelController];
  v3 = [v2 siriPreferences];

  return (CRSSiriPreferences *)v3;
}

- (void)preferences:(id)a3 carPlayAnnounceEnablementTypeChanged:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022CD4;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateCurrentMode
{
  v3 = [(CARAnnounceNotificationsMuteOptionsPanel *)self siriPreferences];
  id v7 = [(CARAnnounceNotificationsMuteOptionsPanel *)self _modeForSiriPreferences:v3];

  if (v7)
  {
    id v4 = [(CARAnnounceNotificationsMuteOptionsPanel *)self modes];
    id v5 = [v4 indexOfObject:v7];
    v6 = [(CARAnnounceNotificationsMuteOptionsPanel *)self groupSpecifier];
    [v6 setSelectedIndex:v5];
  }
}

- (void)_updateSettingsForMode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    id v5 = [v4 announceType];
    v6 = [(CARAnnounceNotificationsMuteOptionsPanel *)self siriPreferences];
    id v7 = [v6 carPlayAnnounceEnablementType];

    id v4 = v12;
    if (v7 != v5)
    {
      v8 = [(CARAnnounceNotificationsMuteOptionsPanel *)self siriPreferences];
      [v8 setCarPlayAnnounceEnablementType:v5];

      v9 = +[UNNotificationSettingsCenter currentNotificationSettingsCenter];
      id v10 = [v9 notificationSystemSettings];
      id v11 = [v10 mutableCopy];

      [v11 setAnnouncementCarPlaySetting:[self _userNotificationSettingForAnnounceType:v5]];
      [v9 setNotificationSystemSettings:v11];

      id v4 = v12;
    }
  }
}

- (id)_modeForSiriPreferences:(id)a3
{
  id v4 = [a3 carPlayAnnounceEnablementType];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CARAnnounceNotificationsMuteOptionsPanel *)self modes];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 announceType] == v4)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (int64_t)_userNotificationSettingForAnnounceType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return qword_100071DF0[a3];
  }
}

- (NSArray)modes
{
  return self->_modes;
}

- (CARSettingsGroupCellSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_modes, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end