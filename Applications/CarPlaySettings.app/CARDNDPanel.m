@interface CARDNDPanel
- (BOOL)_isDrivingToggleOn;
- (CARAutomaticDNDStatus)dndStatus;
- (CARDNDPanel)initWithPanelController:(id)a3;
- (CARDoNotDisturbSpecifier)dndSpecifier;
- (DNDModeConfigurationService)dndModeService;
- (NSArray)specifiers;
- (id)cellSpecifier;
- (id)specifierSections;
- (void)_drivingToggleChanged:(BOOL)a3;
- (void)invalidate;
- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4;
- (void)setDndModeService:(id)a3;
- (void)setDndSpecifier:(id)a3;
- (void)setDndStatus:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation CARDNDPanel

- (CARDNDPanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CARDNDPanel;
  v5 = [(CARSettingsPanel *)&v21 initWithPanelController:v4];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = objc_alloc_init(CARDoNotDisturbSpecifier);
    dndSpecifier = v5->_dndSpecifier;
    v5->_dndSpecifier = v6;

    v8 = (CARAutomaticDNDStatus *)objc_alloc_init((Class)CARAutomaticDNDStatus);
    dndStatus = v5->_dndStatus;
    v5->_dndStatus = v8;

    uint64_t v10 = +[DNDModeConfigurationService serviceForClientIdentifier:@"com.apple.carplay.settings"];
    dndModeService = v5->_dndModeService;
    v5->_dndModeService = (DNDModeConfigurationService *)v10;

    [(DNDModeConfigurationService *)v5->_dndModeService addListener:v5 withCompletionHandler:&stru_100092498];
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_10001A400;
    v18 = &unk_100092008;
    objc_copyWeak(&v19, &location);
    [(CARSettingsCellSpecifier *)v5->_dndSpecifier setActionBlock:&v15];
    v12 = [(CARDNDPanel *)v5 dndSpecifier];
    v13 = +[NSNumber numberWithBool:[(CARDNDPanel *)v5 _isDrivingToggleOn]];
    [v12 setCellValue:v13];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)CARDNDPanel;
  [(CARSettingsPanel *)&v4 invalidate];
  [(DNDModeConfigurationService *)self->_dndModeService removeListener:self];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    objc_super v4 = [CARSettingsCellSpecifier alloc];
    v5 = sub_1000210C8(@"DRIVING_FOCUS_TITLE");
    v6 = +[CARSettingsImageCache dndImage];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001A6D0;
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
  v3 = [CARSettingsCellSpecifierSection alloc];
  objc_super v4 = sub_1000210C8(@"DRIVING_FOCUS_FOOTER");
  v5 = [(CARDNDPanel *)self dndSpecifier];
  uint64_t v10 = v5;
  v6 = +[NSArray arrayWithObjects:&v10 count:1];
  v7 = [(CARSettingsCellSpecifierSection *)v3 initWithFooter:v4 specifiers:v6];
  id v11 = v7;
  v8 = +[NSArray arrayWithObjects:&v11 count:1];

  return v8;
}

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A8AC;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_isDrivingToggleOn
{
  dndModeService = self->_dndModeService;
  id v18 = 0;
  objc_super v4 = [(DNDModeConfigurationService *)dndModeService modeConfigurationForModeIdentifier:@"com.apple.donotdisturb.mode.driving" error:&v18];
  id v5 = v18;
  if (v5)
  {
    v6 = sub_100021030();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100065564((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
LABEL_4:
    unsigned __int8 v13 = 0;
    goto LABEL_9;
  }
  v6 = sub_100021030();
  BOOL v14 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v14)
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Settings] No available driving focus.", v16, 2u);
    }
    goto LABEL_4;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Settings] Driving Focus is available.", buf, 2u);
  }

  v6 = [(CARDNDPanel *)self dndStatus];
  unsigned __int8 v13 = [v6 shouldActivateWithCarPlay];
LABEL_9:

  return v13;
}

- (void)_drivingToggleChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100021030();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = +[NSNumber numberWithBool:v3];
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Settings] Toggled Driving to %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v7 = [(CARDNDPanel *)self dndStatus];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001AC9C;
  v12[3] = &unk_1000924E8;
  objc_copyWeak(&v13, (id *)buf);
  BOOL v14 = v3;
  [v7 _performCARPreferencesBlock:v12 forReading:0];

  uint64_t v8 = [(CARDNDPanel *)self dndStatus];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001ACFC;
  v9[3] = &unk_100092510;
  objc_copyWeak(&v10, (id *)buf);
  BOOL v11 = v3;
  [v8 setAutomaticDNDActive:v3 withReply:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
}

- (CARDoNotDisturbSpecifier)dndSpecifier
{
  return self->_dndSpecifier;
}

- (void)setDndSpecifier:(id)a3
{
}

- (DNDModeConfigurationService)dndModeService
{
  return self->_dndModeService;
}

- (void)setDndModeService:(id)a3
{
}

- (CARAutomaticDNDStatus)dndStatus
{
  return self->_dndStatus;
}

- (void)setDndStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dndStatus, 0);
  objc_storeStrong((id *)&self->_dndModeService, 0);
  objc_storeStrong((id *)&self->_dndSpecifier, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end