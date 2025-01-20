@interface CARDisplayModePanel
+ (NSArray)styles;
- (CARDisplayModePanel)initWithPanelController:(id)a3;
- (CARSettingsGroupCellSpecifier)appearanceGroupSpecifier;
- (CARSettingsSwitchCellSpecifier)darkMapsSwitchSpecifier;
- (CRSUIWallpaperPreferences)wallpaperPreferences;
- (NSArray)currentStyles;
- (id)cellSpecifier;
- (id)specifierSections;
- (int64_t)_currentUserInterfaceStylePreference;
- (void)_updateSpecifiers;
- (void)_vehicleDidChange:(id)a3;
- (void)setAppearanceGroupSpecifier:(id)a3;
- (void)setCurrentStyles:(id)a3;
- (void)setDarkMapsSwitchSpecifier:(id)a3;
- (void)setWallpaperPreferences:(id)a3;
- (void)viewDidLoad;
@end

@implementation CARDisplayModePanel

- (CARDisplayModePanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CARDisplayModePanel;
  v5 = [(CARSettingsPanel *)&v36 initWithPanelController:v4];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v7 = [(id)objc_opt_class() styles];
    id v8 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v32;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([v11 enabled]) {
            [v6 addObject:v11];
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v8);
    }

    objc_storeStrong((id *)&v5->_currentStyles, v6);
    uint64_t v12 = [v4 loadWallpaperPreferences];
    wallpaperPreferences = v5->_wallpaperPreferences;
    v5->_wallpaperPreferences = (CRSUIWallpaperPreferences *)v12;

    v14 = [CARSettingsGroupCellSpecifier alloc];
    v15 = [(NSArray *)v5->_currentStyles valueForKey:@"name"];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100019418;
    v29[3] = &unk_1000921A0;
    objc_copyWeak(&v30, &location);
    v16 = [(CARSettingsGroupCellSpecifier *)v14 initWithTitles:v15 actionBlock:v29];
    appearanceGroupSpecifier = v5->_appearanceGroupSpecifier;
    v5->_appearanceGroupSpecifier = v16;

    v18 = [CARSettingsSwitchCellSpecifier alloc];
    v19 = sub_1000210C8(@"DISPLAY_MODE_ALWAYS_DARK_MAPS");
    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = sub_100019698;
    v27 = &unk_100092030;
    objc_copyWeak(&v28, &location);
    v20 = [(CARSettingsSwitchCellSpecifier *)v18 initWithTitle:v19 image:0 actionBlock:&v24];
    darkMapsSwitchSpecifier = v5->_darkMapsSwitchSpecifier;
    v5->_darkMapsSwitchSpecifier = v20;

    [(CARDisplayModePanel *)v5 _updateSpecifiers];
    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v5 selector:"_vehicleDidChange:" name:@"CARSettingsPanelControllerVehicleDidChangeNotification" object:0];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);

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
    v5 = sub_1000210C8(@"DISPLAY_MODE_TITLE");
    v6 = +[CARSettingsImageCache appearanceImage];
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_100019954;
    v15 = &unk_100092008;
    objc_copyWeak(&v16, &location);
    v7 = [(CARSettingsCellSpecifier *)v4 initWithTitle:v5 image:v6 accessoryType:1 actionBlock:&v12];
    id v8 = self->_cellSpecifier;
    self->_cellSpecifier = v7;

    uint64_t v9 = [(CARDisplayModePanel *)self appearanceGroupSpecifier];
    v10 = [v9 selectedTitle];
    [(CARSettingsCellSpecifier *)self->_cellSpecifier setDetail:v10];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (id)specifierSections
{
  v3 = [CARSettingsCellSpecifierSection alloc];
  id v4 = [(CARDisplayModePanel *)self appearanceGroupSpecifier];
  v5 = [v4 groupSpecifiers];
  v6 = [(CARSettingsCellSpecifierSection *)v3 initWithTitle:0 specifiers:v5];

  if ((id)[(CARDisplayModePanel *)self _currentUserInterfaceStylePreference] == (id)2
    && ([(CARDisplayModePanel *)self darkMapsSwitchSpecifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = [(CARDisplayModePanel *)self darkMapsSwitchSpecifier];
    v15 = v8;
    uint64_t v9 = +[NSArray arrayWithObjects:&v15 count:1];

    v10 = [[CARSettingsCellSpecifierSection alloc] initWithTitle:0 specifiers:v9];
    v14[0] = v6;
    v14[1] = v10;
    v11 = +[NSArray arrayWithObjects:v14 count:2];
  }
  else
  {
    uint64_t v13 = v6;
    v11 = +[NSArray arrayWithObjects:&v13 count:1];
  }

  return v11;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CARDisplayModePanel;
  [(CARSettingsTablePanel *)&v2 viewDidLoad];
}

- (int64_t)_currentUserInterfaceStylePreference
{
  v3 = [(CARSettingsPanel *)self panelController];
  id v4 = [v3 vehicle];
  id v5 = [v4 appearanceModePreference];

  if (v5 != (id)-1) {
    return (int64_t)v5;
  }
  v7 = [(CARSettingsPanel *)self panelController];
  id v8 = [v7 carSession];
  uint64_t v9 = [v8 configuration];
  id v10 = [v9 userInterfaceStyle];

  return (int64_t)v10;
}

- (void)_updateSpecifiers
{
  id v3 = [(CARDisplayModePanel *)self _currentUserInterfaceStylePreference];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(CARDisplayModePanel *)self currentStyles];
  id v5 = (char *)[v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      uint64_t v9 = 0;
      id v10 = &v6[(void)v7];
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v20 + 1) + 8 * (void)v9) style] == v3)
        {
          uint64_t v11 = (uint64_t)&v9[(void)v7];
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = (char *)[v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  uint64_t v12 = [(CARDisplayModePanel *)self appearanceGroupSpecifier];
  [v12 setSelectedIndex:v11];

  uint64_t v13 = [(CARDisplayModePanel *)self appearanceGroupSpecifier];
  v14 = [v13 selectedTitle];
  v15 = [(CARDisplayModePanel *)self cellSpecifier];
  [v15 setDetail:v14];

  id v16 = [(CARSettingsPanel *)self panelController];
  v17 = [v16 vehicle];
  v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v17 mapsAppearancePreference] == (id)2);
  v19 = [(CARDisplayModePanel *)self darkMapsSwitchSpecifier];
  [v19 setCellValue:v18];
}

+ (NSArray)styles
{
  if (qword_1000B0870 != -1) {
    dispatch_once(&qword_1000B0870, &stru_100092478);
  }
  objc_super v2 = (void *)qword_1000B0878;

  return (NSArray *)v2;
}

- (void)_vehicleDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A038;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (CARSettingsGroupCellSpecifier)appearanceGroupSpecifier
{
  return (CARSettingsGroupCellSpecifier *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAppearanceGroupSpecifier:(id)a3
{
}

- (CARSettingsSwitchCellSpecifier)darkMapsSwitchSpecifier
{
  return (CARSettingsSwitchCellSpecifier *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDarkMapsSwitchSpecifier:(id)a3
{
}

- (NSArray)currentStyles
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentStyles:(id)a3
{
}

- (CRSUIWallpaperPreferences)wallpaperPreferences
{
  return self->_wallpaperPreferences;
}

- (void)setWallpaperPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperPreferences, 0);
  objc_storeStrong((id *)&self->_currentStyles, 0);
  objc_storeStrong((id *)&self->_darkMapsSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_appearanceGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end