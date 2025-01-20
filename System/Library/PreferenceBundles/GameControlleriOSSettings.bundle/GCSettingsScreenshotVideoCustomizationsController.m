@interface GCSettingsScreenshotVideoCustomizationsController
- (GCController)device;
- (id)gestureCustomizationSpecifiers;
- (id)gestureLabel;
- (id)getMappableElementsToSystemGesturesElements;
- (id)modeLabel;
- (id)newSpecifiers;
- (id)settingEnabled:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)didSelectItemInRemapController:(id)a3 item:(id)a4;
- (void)initSettings;
- (void)loadDevice;
- (void)onLoadItemInRemapController:(id)a3 item:(id)a4 cell:(id)a5;
- (void)setDevice:(id)a3;
- (void)setSettingEnabled:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation GCSettingsScreenshotVideoCustomizationsController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)GCSettingsScreenshotVideoCustomizationsController;
  [(GCSettingsScreenshotVideoCustomizationsController *)&v3 viewDidLoad];
  [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] registerClass:objc_opt_class() forCellReuseIdentifier:@"RemappableElementCell"];
}

- (void)loadDevice
{
  objc_super v3 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"Controller"];
  p_device = &self->_device;
  if (v3 != self->_device)
  {
    v11 = v3;
    objc_storeStrong((id *)p_device, v3);
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mappableToSystemGesturesButtons = self->_mappableToSystemGesturesButtons;
    self->_mappableToSystemGesturesButtons = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    elements = self->_elements;
    self->_elements = v7;

    v9 = self->_mappableToSystemGesturesButtons;
    v10 = [(GCSettingsScreenshotVideoCustomizationsController *)self getMappableElementsToSystemGesturesElements];
    [(NSMutableArray *)v9 addObjectsFromArray:v10];

    objc_super v3 = v11;
  }

  _objc_release_x1(p_device, v3);
}

- (void)initSettings
{
  if (!self->_settings)
  {
    objc_super v3 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"ApplicationRecord"];
    appRecord = self->_appRecord;
    self->_appRecord = v3;

    v5 = self->_appRecord;
    id v6 = objc_alloc((Class)GCControllerSettings);
    v7 = v6;
    if (v5)
    {
      v8 = [(LSApplicationRecord *)self->_appRecord bundleIdentifier];
      v9 = (GCControllerSettings *)[v7 initWithBundleIdentifier:v8 forController:self->_device];
      settings = self->_settings;
      self->_settings = v9;
    }
    else
    {
      v11 = (GCControllerSettings *)[v6 initForController:self->_device];
      v8 = self->_settings;
      self->_settings = v11;
    }

    id v14 = [(GCSettingsScreenshotVideoCustomizationsController *)self specifier];
    v12 = [v14 name];
    v13 = sub_CF14(@"SCREENSHOT_TITLE");
    self->_screenshotSettings = [v12 isEqualToString:v13];
  }
}

- (id)getMappableElementsToSystemGesturesElements
{
  v25[0] = GCInputButtonOptions;
  v25[1] = GCInputButtonMenu;
  v25[2] = GCInputButtonShare;
  objc_super v3 = +[NSArray arrayWithObjects:v25 count:3];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v11 = [(GCController *)self->_device physicalInputProfile];
        v12 = [v11 buttons];
        v13 = [v12 objectForKeyedSubscript:v10];

        if (v13)
        {
          elements = self->_elements;
          v15 = [v13 primaryAlias];
          [(NSMutableDictionary *)elements setObject:v13 forKey:v15];

          v16 = [v13 primaryAlias];
          [v4 addObject:v16];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_F0C8;
  v19[3] = &unk_111988;
  v19[4] = self;
  v17 = [v4 sortedArrayUsingComparator:v19];

  return v17;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(GCSettingsScreenshotVideoCustomizationsController *)self newSpecifiers];
    id v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)setSettingEnabled:(id)a3 specifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  BOOL screenshotSettings = self->_screenshotSettings;
  settings = self->_settings;
  id v9 = [v11 BOOLValue];
  if (screenshotSettings) {
    [(GCControllerSettings *)settings setScreenShotEnabled:v9];
  }
  else {
    [(GCControllerSettings *)settings setVideoRecordingEnabled:v9];
  }
  if ([v11 BOOLValue])
  {
    uint64_t v10 = [(GCSettingsScreenshotVideoCustomizationsController *)self gestureCustomizationSpecifiers];
    [(GCSettingsScreenshotVideoCustomizationsController *)self insertContiguousSpecifiers:v10 afterSpecifier:v6 animated:1];
  }
  else
  {
    uint64_t v10 = [(GCSettingsScreenshotVideoCustomizationsController *)self specifiersForIDs:&off_119DF8];
    [(GCSettingsScreenshotVideoCustomizationsController *)self removeContiguousSpecifiers:v10 animated:1];
  }
}

- (id)settingEnabled:(id)a3
{
  BOOL screenshotSettings = self->_screenshotSettings;
  settings = self->_settings;
  if (screenshotSettings) {
    id v5 = [(GCControllerSettings *)settings screenShotEnabled];
  }
  else {
    id v5 = [(GCControllerSettings *)settings videoRecordingEnabled];
  }
  id v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

- (id)gestureLabel
{
  BOOL screenshotSettings = self->_screenshotSettings;
  settings = self->_settings;
  if (screenshotSettings) {
    id v4 = [(GCControllerSettings *)settings screenShotGesture];
  }
  else {
    id v4 = [(GCControllerSettings *)settings videoRecordingGesture];
  }

  return sub_F370((unint64_t)v4);
}

- (id)modeLabel
{
  if (self->_screenshotSettings) {
    sub_CF14(@"VIDEO_RECORDING_MODE");
  }
  else {
  v2 = sub_F428((uint64_t)[(GCControllerSettings *)self->_settings videoRecordingMode]);
  }

  return v2;
}

- (id)newSpecifiers
{
  [(GCSettingsScreenshotVideoCustomizationsController *)self loadDevice];
  [(GCSettingsScreenshotVideoCustomizationsController *)self initSettings];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[PSSpecifier emptyGroupSpecifier];
  if (self->_screenshotSettings) {
    id v5 = @"SCREENSHOT_DETAIL_DESC";
  }
  else {
    id v5 = @"VIDEO_RECORDING_DETAIL_DESC";
  }
  id v6 = sub_CF14(v5);
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  if (self->_screenshotSettings) {
    id v7 = @"SCREENSHOT_TITLE";
  }
  else {
    id v7 = @"VIDEO_RECORDING_TITLE";
  }
  uint64_t v8 = sub_CF14(v7);
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setSettingEnabled:specifier:" get:"settingEnabled:" detail:0 cell:6 edit:0];

  [v3 addObject:v9];
  uint64_t v10 = [(GCSettingsScreenshotVideoCustomizationsController *)self settingEnabled:0];
  unsigned int v11 = [v10 BOOLValue];

  if (v11)
  {
    v12 = [(GCSettingsScreenshotVideoCustomizationsController *)self gestureCustomizationSpecifiers];
    [v3 addObjectsFromArray:v12];
  }
  return v3;
}

- (id)gestureCustomizationSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v27 = +[PSSpecifier emptyGroupSpecifier];
  objc_msgSend(v3, "addObject:");
  id v4 = sub_CF14(@"BUTTON");
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  id v6 = +[NSNumber numberWithInteger:0];
  [v5 setProperty:v6 forKey:@"GCESpecifierType"];

  [v5 setProperty:self->_mappableToSystemGesturesButtons forKey:@"ButtonRemapControllerValues"];
  if (self->_screenshotSettings) {
    id v7 = @"SCREENSHOT_DETAIL_BUTTON_DESC";
  }
  else {
    id v7 = @"VIDEO_RECORDING_DETAIL_BUTTON_DESC";
  }
  uint64_t v8 = sub_CF14(v7);
  [v5 setProperty:v8 forKey:@"ButtonRemapControllerFooter"];

  uint64_t v9 = PSIDKey;
  [v5 setProperty:@"GESTURE_BUTTON_KEY" forKey:PSIDKey];
  [v3 addObject:v5];
  uint64_t v10 = sub_CF14(@"GESTURE");
  unsigned int v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:"gestureLabel" detail:objc_opt_class() cell:2 edit:0];

  v12 = +[NSNumber numberWithInteger:1];
  [v11 setProperty:v12 forKey:@"GCESpecifierType"];

  v13 = +[NSNumber numberWithInteger:0];
  v29[0] = v13;
  id v14 = +[NSNumber numberWithInteger:1];
  v29[1] = v14;
  v15 = +[NSNumber numberWithInteger:2];
  v29[2] = v15;
  v16 = +[NSArray arrayWithObjects:v29 count:3];

  [v11 setProperty:v16 forKey:@"ButtonRemapControllerValues"];
  if (self->_screenshotSettings) {
    v17 = @"SCREENSHOT_DETAIL_GESTURE_DESC";
  }
  else {
    v17 = @"VIDEO_RECORDING_DETAIL_GESTURE_DESC";
  }
  v18 = sub_CF14(v17);
  [v11 setProperty:v18 forKey:@"ButtonRemapControllerFooter"];

  [v11 setProperty:@"GESTURE_TYPE_KEY" forKey:v9];
  [v3 addObject:v11];
  if (!self->_screenshotSettings)
  {
    v19 = sub_CF14(@"VIDEO_RECORDING_MODE");
    long long v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:"modeLabel" detail:objc_opt_class() cell:2 edit:0];

    long long v21 = +[NSNumber numberWithInteger:2];
    [v20 setProperty:v21 forKey:@"GCESpecifierType"];

    long long v22 = +[NSNumber numberWithInteger:0];
    v28[0] = v22;
    long long v23 = +[NSNumber numberWithInteger:1];
    v28[1] = v23;
    v24 = +[NSArray arrayWithObjects:v28 count:2];

    [v20 setProperty:v24 forKey:@"ButtonRemapControllerValues"];
    v25 = sub_CF14(@"VIDEO_RECORDING_DETAIL_MODE_DESC");
    [v20 setProperty:v25 forKey:@"ButtonRemapControllerFooter"];

    [v20 setProperty:@"GESTURE_MODE_KEY" forKey:v9];
    [v3 addObject:v20];

    unsigned int v11 = v20;
  }

  return v3;
}

- (void)onLoadItemInRemapController:(id)a3 item:(id)a4 cell:(id)a5
{
  id v29 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 specifier];
  uint64_t v10 = [v9 propertyForKey:@"GCESpecifierType"];

  unsigned int v11 = (char *)[v10 integerValue];
  if (v10 && !v11)
  {
    id v12 = v29;
    v13 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v12];
    id v14 = v13;
    if (v13)
    {
      v15 = [v13 unmappedSfSymbolsName];
      sub_D348(v8, v15);

      v16 = [v8 titleLabel];
      v17 = [v14 unmappedLocalizedName];
      [v16 setText:v17];

      id v29 = v12;
    }
    else
    {
      long long v23 = [v8 titleLabel];
      [v23 setText:v12];

      id v29 = +[NSString string];
      v16 = v12;
    }

    settings = self->_settings;
    if (self->_screenshotSettings) {
      [(GCControllerSettings *)settings screenShotKey];
    }
    else {
    v25 = [(GCControllerSettings *)settings videoRecordingKey];
    }
    v26 = v25;
    if (v14)
    {
      v27 = [v14 primaryAlias];
      unint64_t v28 = (unint64_t)[v27 isEqualToString:v26];
    }
    else
    {
      unint64_t v28 = [v25 length] == 0;
    }
    [v8 setChecked:v28];

    goto LABEL_22;
  }
  if (v10 && v11 == (unsigned char *)&dword_0 + 1)
  {
    id v18 = [v29 integerValue];
    sub_F370((unint64_t)v18);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v19 = [v8 titleLabel];
    [v19 setText:v12];

    long long v20 = self->_settings;
    if (self->_screenshotSettings) {
      id v21 = [(GCControllerSettings *)v20 screenShotGesture];
    }
    else {
      id v21 = [(GCControllerSettings *)v20 videoRecordingGesture];
    }
    goto LABEL_21;
  }
  if (v10 && v11 == (unsigned char *)&dword_0 + 2)
  {
    id v18 = [v29 integerValue];
    sub_F428((uint64_t)v18);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    long long v22 = [v8 titleLabel];
    [v22 setText:v12];

    id v21 = [(GCControllerSettings *)self->_settings videoRecordingMode];
LABEL_21:
    [v8 setChecked:v21 == v18];
LABEL_22:
  }
}

- (void)didSelectItemInRemapController:(id)a3 item:(id)a4
{
  id v15 = a4;
  id v6 = [a3 specifier];
  id v7 = [v6 propertyForKey:@"GCESpecifierType"];

  id v8 = (char *)[v7 integerValue];
  if (!v7 || v8)
  {
    if (v7 && v8 == (unsigned char *)&dword_0 + 1)
    {
      id v11 = [v15 integerValue];
      settings = self->_settings;
      if (self->_screenshotSettings) {
        [(GCControllerSettings *)settings setScreenShotGesture:v11];
      }
      else {
        [(GCControllerSettings *)settings setVideoRecordingGesture:v11];
      }
    }
    else if (v7 && v8 == (unsigned char *)&dword_0 + 2)
    {
      -[GCControllerSettings setVideoRecordingMode:](self->_settings, "setVideoRecordingMode:", [v15 integerValue]);
    }
  }
  else
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v15];
    if (v9)
    {
      id v10 = v15;
    }
    else
    {
      uint64_t v13 = +[NSString string];

      id v10 = (id)v13;
    }
    id v14 = self->_settings;
    id v15 = v10;
    if (self->_screenshotSettings) {
      -[GCControllerSettings setScreenShotKey:](v14, "setScreenShotKey:");
    }
    else {
      -[GCControllerSettings setVideoRecordingKey:](v14, "setVideoRecordingKey:");
    }
  }
  [(GCSettingsScreenshotVideoCustomizationsController *)self reloadSpecifiers];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GCSettingsScreenshotVideoCustomizationsController *)self specifierAtIndexPath:v6];
  uint64_t v9 = [v8 propertyForKey:@"GCESpecifierType"];
  id v10 = [v9 integerValue];
  if (!v9 || v10)
  {
    v18.receiver = self;
    v18.super_class = (Class)GCSettingsScreenshotVideoCustomizationsController;
    id v11 = [(GCSettingsScreenshotVideoCustomizationsController *)&v18 tableView:v7 cellForRowAtIndexPath:v6];
  }
  else
  {
    id v11 = [v7 dequeueReusableCellWithIdentifier:@"RemappableElementCell" forIndexPath:v6];

    [v11 setAccessoryType:1];
    settings = self->_settings;
    if (self->_screenshotSettings) {
      [(GCControllerSettings *)settings screenShotKey];
    }
    else {
    id v7 = [(GCControllerSettings *)settings videoRecordingKey];
    }
    uint64_t v13 = [v11 titleLabel];
    id v14 = [v8 name];
    [v13 setText:v14];

    id v15 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v7];
    v16 = v15;
    if (v15)
    {
      id v6 = [v15 unmappedSfSymbolsName];
    }
    else
    {
      id v6 = 0;
    }
    sub_D470(v11, v6);
  }

  return v11;
}

- (GCController)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_mappableToSystemGesturesButtons, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_appRecord, 0);
}

@end