@interface CARSilentModePanel
- (BOOL)_shouldShowThreeWaySwitch;
- (BOOL)showThreeWaySwitch;
- (CARSettingsButtonCellSpecifier)switchBackButtonSpecifier;
- (CARSettingsGroupCellSpecifier)groupSpecifier;
- (CARSilentModePanel)initWithPanelController:(id)a3;
- (CRSessionSilentModeStatus)silentModeStatus;
- (NSArray)silentModeOptions;
- (id)_modeForSilentModeType:(unint64_t)a3;
- (id)_silentModeDebugDescription;
- (id)cellSpecifier;
- (id)specifierSections;
- (void)_externalProcessChangedSilentMode;
- (void)_updateCarPlaySilentModePreference:(BOOL)a3;
- (void)_updateCurrentMode;
- (void)dealloc;
- (void)setShowThreeWaySwitch:(BOOL)a3;
- (void)setSilentModeStatus:(id)a3;
- (void)setSwitchBackButtonSpecifier:(id)a3;
- (void)setupObservers;
@end

@implementation CARSilentModePanel

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    v4 = [CARSettingsCellSpecifier alloc];
    v5 = sub_1000210C8(@"SILENT_MODE");
    v6 = +[CARSettingsImageCache silentModeIcon];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000F508;
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

- (CARSilentModePanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CARSilentModePanel;
  v5 = [(CARSettingsPanel *)&v26 initWithPanelController:v4];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v5->_showThreeWaySwitch = [(CARSilentModePanel *)v5 _shouldShowThreeWaySwitch];
    v6 = (CRSessionSilentModeStatus *)objc_alloc_init((Class)CRSessionSilentModeStatus);
    silentModeStatus = v5->_silentModeStatus;
    v5->_silentModeStatus = v6;

    uint64_t v8 = +[CARSilentModeInCarPlayOption allOptions];
    silentModeOptions = v5->_silentModeOptions;
    v5->_silentModeOptions = (NSArray *)v8;

    v10 = [CARSettingsGroupCellSpecifier alloc];
    id v11 = v5->_silentModeOptions;
    v12 = NSStringFromSelector("fullTitle");
    v13 = [(NSArray *)v11 valueForKey:v12];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000F7FC;
    v23[3] = &unk_1000921A0;
    objc_copyWeak(&v24, &location);
    v14 = [(CARSettingsGroupCellSpecifier *)v10 initWithTitles:v13 actionBlock:v23];
    groupSpecifier = v5->_groupSpecifier;
    v5->_groupSpecifier = v14;

    v16 = [CARSettingsButtonCellSpecifier alloc];
    v17 = sub_1000210C8(@"RESTORE_SILENT_MODE");
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000F8E8;
    v21[3] = &unk_100092030;
    objc_copyWeak(&v22, &location);
    v18 = [(CARSettingsButtonCellSpecifier *)v16 initWithTitle:v17 image:0 actionBlock:v21];
    switchBackButtonSpecifier = v5->_switchBackButtonSpecifier;
    v5->_switchBackButtonSpecifier = v18;

    [(CARSilentModePanel *)v5 _updateCurrentMode];
    [(CARSilentModePanel *)v5 setupObservers];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (id)specifierSections
{
  v3 = [(CARSilentModePanel *)self silentModeOptions];
  id v4 = [(CARSilentModePanel *)self groupSpecifier];
  v5 = [v3 objectAtIndexedSubscript:[v4 selectedIndex]];

  LODWORD(v3) = [(CARSilentModePanel *)self showThreeWaySwitch];
  v6 = [CARSettingsCellSpecifierSection alloc];
  if (v3)
  {
    v7 = sub_1000210C8(@"CARPLAY_SILENT_MODE_HEADER");
    uint64_t v8 = [v5 footer];
    v9 = [(CARSilentModePanel *)self groupSpecifier];
    v10 = [v9 groupSpecifiers];
    id v11 = [(CARSettingsCellSpecifierSection *)v6 initWithTitle:v7 footer:v8 specifiers:v10];
    v16 = v11;
    v12 = +[NSArray arrayWithObjects:&v16 count:1];
  }
  else
  {
    v7 = sub_1000210C8(@"RESTORE_SILENT_MODE_FOOTER");
    uint64_t v8 = [(CARSilentModePanel *)self switchBackButtonSpecifier];
    v14 = v8;
    v9 = +[NSArray arrayWithObjects:&v14 count:1];
    v10 = [(CARSettingsCellSpecifierSection *)v6 initWithFooter:v7 specifiers:v9];
    v15 = v10;
    v12 = +[NSArray arrayWithObjects:&v15 count:1];
  }

  return v12;
}

- (void)_updateCurrentMode
{
  v3 = sub_100021030();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CARSilentModePanel *)self _silentModeDebugDescription];
    int v9 = 138543362;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Settings] Silent mode panel: updating specifier to: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  v5 = [(CARSilentModePanel *)self _modeForSilentModeType:[(CRSessionSilentModeStatus *)self->_silentModeStatus getCarPlaySilentModePreference]];
  if (v5)
  {
    v6 = [(CARSilentModePanel *)self silentModeOptions];
    id v7 = [v6 indexOfObject:v5];
    uint64_t v8 = [(CARSilentModePanel *)self groupSpecifier];
    [v8 setSelectedIndex:v7];
  }
}

- (id)_modeForSilentModeType:(unint64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CARSilentModePanel *)self silentModeOptions];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 silentModeType] == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)_updateCarPlaySilentModePreference:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100021030();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CARSilentModePanel *)self _silentModeDebugDescription];
    int v10 = 138543362;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Settings] Silent mode panel: updating preference to: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = [(CARSilentModePanel *)self silentModeStatus];
  uint64_t v8 = v7;
  if (v3) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  [v7 setCarPlaySilentModePreference:v9];
}

- (id)_silentModeDebugDescription
{
  v2 = [(CARSilentModePanel *)self silentModeStatus];
  id v3 = [v2 getCarPlaySilentModePreference];

  if ((unint64_t)v3 > 2) {
    return &stru_100094078;
  }
  else {
    return *(&off_100092200 + (void)v3);
  }
}

- (void)_externalProcessChangedSilentMode
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000FFD8;
  v2[3] = &unk_1000921A0;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)setupObservers
{
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_externalProcessChangedSilentMode" name:CRExternalProcessChangedSilentMode object:0 suspensionBehavior:4];
}

- (void)dealloc
{
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CARSilentModePanel;
  [(CARSilentModePanel *)&v4 dealloc];
}

- (BOOL)_shouldShowThreeWaySwitch
{
  unsigned __int8 v3 = [(CRSessionSilentModeStatus *)self->_silentModeStatus isDeviceSilentModeOn];
  objc_super v4 = [(CARSilentModePanel *)self silentModeStatus];
  id v5 = [v4 getCarPlaySilentModePreference];

  if (v5 == (id)2)
  {
    v3 ^= 1u;
  }
  else if (v5 != (id)1)
  {
    return 1;
  }
  return v3;
}

- (CRSessionSilentModeStatus)silentModeStatus
{
  return self->_silentModeStatus;
}

- (void)setSilentModeStatus:(id)a3
{
}

- (NSArray)silentModeOptions
{
  return self->_silentModeOptions;
}

- (CARSettingsGroupCellSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (CARSettingsButtonCellSpecifier)switchBackButtonSpecifier
{
  return self->_switchBackButtonSpecifier;
}

- (void)setSwitchBackButtonSpecifier:(id)a3
{
}

- (BOOL)showThreeWaySwitch
{
  return self->_showThreeWaySwitch;
}

- (void)setShowThreeWaySwitch:(BOOL)a3
{
  self->_showThreeWaySwitch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchBackButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_silentModeOptions, 0);
  objc_storeStrong((id *)&self->_silentModeStatus, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end