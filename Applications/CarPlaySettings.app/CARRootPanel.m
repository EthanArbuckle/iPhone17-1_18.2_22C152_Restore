@interface CARRootPanel
- (BOOL)AIEnabled;
- (BOOL)_announceNotificationsEnabled;
- (BOOL)showCellImages;
- (CARAnnounceNotificationsPanel)announceNotificationsPanel;
- (CARDevicePickerCellSpecifier)devicePickerSpecifier;
- (CARNowPlayingAlbumArtSpecifier)albumArtSpecifier;
- (CARRootPanel)initWithPanelController:(id)a3;
- (CARSessionStatus)sessionStatus;
- (CARSettingsSwitchCellSpecifier)dndSpecifier;
- (NSArray)panels;
- (id)cellSpecifiers;
- (id)title;
- (void)_limitedUIDidChange:(id)a3;
- (void)_resetAllSpecifiers;
- (void)_updateAIEnabled;
- (void)announceEnabledStateUpdated:(int64_t)a3;
- (void)dealloc;
- (void)sessionDidConnect:(id)a3;
- (void)setAIEnabled:(BOOL)a3;
- (void)setAlbumArtSpecifier:(id)a3;
- (void)setAnnounceNotificationsPanel:(id)a3;
- (void)setDevicePickerSpecifier:(id)a3;
- (void)setDndSpecifier:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)setVehicle:(id)a3;
@end

@implementation CARRootPanel

- (CARRootPanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CARRootPanel;
  v5 = [(CARSettingsPanel *)&v8 initWithPanelController:v4];
  if (v5)
  {
    [v4 addObserver:v5];
    [v4 addNotificationSettingsObserver:v5];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_100005960, @"com.apple.gms.availability.notification", 0, (CFNotificationSuspensionBehavior)0);
    [(CARRootPanel *)v5 _updateAIEnabled];
  }

  return v5;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)CARRootPanel;
  [(CARRootPanel *)&v4 dealloc];
}

- (BOOL)showCellImages
{
  return 1;
}

- (NSArray)panels
{
  panels = self->_panels;
  if (panels) {
    goto LABEL_27;
  }
  objc_super v4 = (NSArray *)objc_opt_new();
  v5 = [CARDNDPanel alloc];
  v6 = [(CARSettingsPanel *)self panelController];
  v7 = [(CARDNDPanel *)v5 initWithPanelController:v6];
  [(NSArray *)v4 addObject:v7];

  objc_super v8 = [CARAnnounceNotificationsPanel alloc];
  v9 = [(CARSettingsPanel *)self panelController];
  v10 = [(CARAnnounceNotificationsPanel *)v8 initWithPanelController:v9];
  announceNotificationsPanel = self->_announceNotificationsPanel;
  self->_announceNotificationsPanel = v10;

  v12 = [(CARRootPanel *)self announceNotificationsPanel];
  [(NSArray *)v4 addObject:v12];

  v13 = [(CARSettingsPanel *)self panelController];
  v14 = [v13 carSession];
  v15 = [v14 configuration];
  unsigned int v16 = [v15 supportsVehicleData];

  if (v16)
  {
    v17 = [CARDevicePickerPanel alloc];
    v18 = [(CARSettingsPanel *)self panelController];
    v19 = [(CARSettingsPanel *)v17 initWithPanelController:v18];

    v20 = [(CARDevicePickerPanel *)v19 cellSpecifier];
    devicePickerSpecifier = self->_devicePickerSpecifier;
    self->_devicePickerSpecifier = v20;

    [(NSArray *)v4 addObject:v19];
    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:self selector:"_limitedUIDidChange:" name:CARSessionLimitUserInterfacesChangedNotification object:0];
  }
  v23 = +[NSUserDefaults standardUserDefaults];
  unsigned int v24 = [v23 BOOLForKey:@"TextSizeEnabled"];

  if (v24) {
    v25 = CARDisplayPanel;
  }
  else {
    v25 = CARDisplayModePanel;
  }
  id v26 = [v25 alloc];
  v27 = [(CARSettingsPanel *)self panelController];
  id v28 = [v26 initWithPanelController:v27];
  [(NSArray *)v4 addObject:v28];

  v29 = [(CARSettingsPanel *)self panelController];
  v30 = [v29 vehicle];
  uint64_t v31 = [v30 clusterAssetIdentifier];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(CARSettingsPanel *)self panelController];
    v34 = [v33 carSession];
    v35 = [v34 configuration];
    unsigned int v36 = [v35 supportsVehicleData];

    if (v36)
    {
      v37 = CARThemePanel;
      goto LABEL_12;
    }
  }
  else
  {
  }
  v37 = CARWallpaperPanel;
LABEL_12:
  id v38 = [v37 alloc];
  v39 = [(CARSettingsPanel *)self panelController];
  id v40 = [v38 initWithPanelController:v39];
  [(NSArray *)v4 addObject:v40];

  v41 = [CARSilentModePanel alloc];
  v42 = [(CARSettingsPanel *)self panelController];
  v43 = [(CARSilentModePanel *)v41 initWithPanelController:v42];
  [(NSArray *)v4 addObject:v43];

  if (_os_feature_enabled_impl())
  {
    v44 = [CARAccessibilityPanel alloc];
    v45 = [(CARSettingsPanel *)self panelController];
    v46 = [(CARAccessibilityPanel *)v44 initWithPanelController:v45];
    [(NSArray *)v4 addObject:v46];
  }
  v47 = [(CARSettingsPanel *)self panelController];
  v48 = [v47 carSession];
  v49 = [v48 configuration];
  if (![v49 supportsSiriZLL])
  {
    char v51 = _os_feature_enabled_impl();

    if (v51) {
      goto LABEL_18;
    }
LABEL_20:
    v54 = objc_alloc_init(CARDashboardSuggestionsSpecifier);
    v56 = +[CARSettingsCellSpecifierWrapperPanel panelWrappingCellSpecifier:v54];
    [(NSArray *)v4 addObject:v56];

    goto LABEL_21;
  }
  v50 = +[NSUserDefaults standardUserDefaults];
  if (([v50 BOOLForKey:@"HeySiriEnabled"] & 1) == 0)
  {
    char v55 = _os_feature_enabled_impl();

    if (v55) {
      goto LABEL_18;
    }
    goto LABEL_20;
  }

LABEL_18:
  v52 = [CARSiriPanel alloc];
  v53 = [(CARSettingsPanel *)self panelController];
  v54 = [(CARSiriPanel *)v52 initWithPanelController:v53];

  [(CARDashboardSuggestionsSpecifier *)v54 setAppleIntelligenceEnabled:[(CARRootPanel *)self AIEnabled]];
  [(NSArray *)v4 addObject:v54];
LABEL_21:

  if (+[CARNowPlayingAlbumArtSpecifier userSettingControlAvailable])
  {
    v57 = [CARNowPlayingAlbumArtSpecifier alloc];
    v58 = [(CARSettingsPanel *)self panelController];
    v59 = [v58 vehicle];
    v60 = [(CARNowPlayingAlbumArtSpecifier *)v57 initWithVehicle:v59];
    albumArtSpecifier = self->_albumArtSpecifier;
    self->_albumArtSpecifier = v60;

    v62 = [(CARSettingsPanel *)self panelController];
    [(CARNowPlayingAlbumArtSpecifier *)self->_albumArtSpecifier setVehicleDelegate:v62];

    v63 = +[CARSettingsCellSpecifierWrapperPanel panelWrappingCellSpecifier:self->_albumArtSpecifier];
    [(NSArray *)v4 addObject:v63];
  }
  if (CRIsInternalInstall())
  {
    v64 = +[CARPrototypePref showInternalSettings];
    unsigned int v65 = [v64 state];

    if (v65)
    {
      v66 = [CARInternalSettingsPanel alloc];
      v67 = [(CARSettingsPanel *)self panelController];
      v68 = [(CARInternalSettingsPanel *)v66 initWithPanelController:v67];
      [(NSArray *)v4 addObject:v68];
    }
  }
  v69 = self->_panels;
  self->_panels = v4;

  panels = self->_panels;
LABEL_27:

  return panels;
}

- (id)cellSpecifiers
{
  cellSpecifiers = self->_cellSpecifiers;
  if (!cellSpecifiers)
  {
    objc_super v4 = [(CARRootPanel *)self panels];
    v5 = NSStringFromSelector("cellSpecifier");
    v6 = [v4 valueForKey:v5];
    v7 = +[NSMutableArray arrayWithArray:v6];

    objc_super v8 = self->_cellSpecifiers;
    self->_cellSpecifiers = v7;

    cellSpecifiers = self->_cellSpecifiers;
  }

  return cellSpecifiers;
}

- (id)title
{
  return sub_1000210C8(@"SETTINGS_TITLE");
}

- (void)setVehicle:(id)a3
{
  id v4 = a3;
  id v5 = [(CARRootPanel *)self albumArtSpecifier];
  [v5 setVehicle:v4];
}

- (void)_resetAllSpecifiers
{
  panels = self->_panels;
  self->_panels = 0;

  cellSpecifiers = self->_cellSpecifiers;
  self->_cellSpecifiers = 0;

  [(CARSettingsTablePanel *)self reloadSpecifiers];
}

- (void)sessionDidConnect:(id)a3
{
  id v6 = [(CARRootPanel *)self albumArtSpecifier];
  id v4 = [(CARSettingsPanel *)self panelController];
  id v5 = [v4 vehicle];
  [v6 setVehicle:v5];
}

- (void)_updateAIEnabled
{
  int v3 = AFDeviceSupportsSystemAssistantExperience();
  id v4 = sub_100021030();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Settings] Apple intelligence enabled: %{public}@", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006350;
  v6[3] = &unk_100091F10;
  v6[4] = self;
  char v7 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)announceEnabledStateUpdated:(int64_t)a3
{
}

- (BOOL)_announceNotificationsEnabled
{
  v2 = [(CARSettingsPanel *)self panelController];
  int v3 = [v2 notificationSystemSettings];
  id v4 = [v3 announcementSetting];

  return v4 == (id)2;
}

- (void)_limitedUIDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006480;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (CARDevicePickerCellSpecifier)devicePickerSpecifier
{
  return self->_devicePickerSpecifier;
}

- (void)setDevicePickerSpecifier:(id)a3
{
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (CARAnnounceNotificationsPanel)announceNotificationsPanel
{
  return self->_announceNotificationsPanel;
}

- (void)setAnnounceNotificationsPanel:(id)a3
{
}

- (CARSettingsSwitchCellSpecifier)dndSpecifier
{
  return self->_dndSpecifier;
}

- (void)setDndSpecifier:(id)a3
{
}

- (CARNowPlayingAlbumArtSpecifier)albumArtSpecifier
{
  return self->_albumArtSpecifier;
}

- (void)setAlbumArtSpecifier:(id)a3
{
}

- (BOOL)AIEnabled
{
  return self->_AIEnabled;
}

- (void)setAIEnabled:(BOOL)a3
{
  self->_AIEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumArtSpecifier, 0);
  objc_storeStrong((id *)&self->_dndSpecifier, 0);
  objc_storeStrong((id *)&self->_announceNotificationsPanel, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_devicePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_cellSpecifiers, 0);

  objc_storeStrong((id *)&self->_panels, 0);
}

@end