@interface GCSettingsLegacyRootController
- (BOOL)findingController;
- (BOOL)isDeviceSpecificController;
- (CHHapticEngine)engine;
- (GCController)device;
- (GCControllerSettings)settings;
- (GCSettingsLegacyRootController)init;
- (NSArray)configurableControllers;
- (NSArray)devices;
- (id)customizableControllers;
- (id)deviceListSpecifiers;
- (id)deviceSpecifiers;
- (id)getHapticsValue;
- (id)screenshotSettingStatus:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)videoRecordingSettingStatus:(id)a3;
- (void)dealloc;
- (void)didDisconnectToGameController:(id)a3;
- (void)findController;
- (void)initSettings;
- (void)loadDevices;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setConfigurableControllers:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDevices:(id)a3;
- (void)setEngine:(id)a3;
- (void)setFindingController:(BOOL)a3;
- (void)setHapticsValue:(id)a3;
- (void)setIsDeviceSpecificController:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation GCSettingsLegacyRootController

- (void)didDisconnectToGameController:(id)a3
{
  uint64_t v4 = [a3 object];
  id v15 = (id)v4;
  if (self->_isDeviceSpecificController
    && ((device = self->_device) != 0 ? (BOOL v6 = device == (GCController *)v4) : (BOOL v6 = 0), v6))
  {
    v7 = [(GCSettingsLegacyRootController *)self navigationController];
    v8 = [v7 viewControllers];
    v9 = (char *)[v8 indexOfObject:self];

    if (v9 && v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = [(GCSettingsLegacyRootController *)self navigationController];
      v11 = [v10 viewControllers];
      v12 = [v11 objectAtIndex:v9 - 1];

      v13 = [(GCSettingsLegacyRootController *)self navigationController];
      id v14 = [v13 popToViewController:v12 animated:1];
    }
  }
  else
  {
    [(GCSettingsLegacyRootController *)self reloadSpecifiers];
  }
}

- (GCSettingsLegacyRootController)init
{
  v7.receiver = self;
  v7.super_class = (Class)GCSettingsLegacyRootController;
  v2 = [(GCSettingsLegacyRootController *)&v7 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"didConnectToGameController:" name:GCControllerDidConnectNotification object:0];

    uint64_t v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"didDisconnectToGameController:" name:GCControllerDidDisconnectNotification object:0];

    SEL v5 = NSSelectorFromString(@"__openXPC_and_CBApplicationDidBecomeActive__");
    if (objc_opt_respondsToSelector()) {
      +[GCController performSelector:v5];
    }
  }
  return v2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)GCSettingsLegacyRootController;
  [(GCSettingsLegacyRootController *)&v4 viewDidLoad];
  v3 = +[GCAnalytics instance];
  [v3 sendSettingsEnteredEvent];

  [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] registerClass:objc_opt_class() forCellReuseIdentifier:@"RemappableElementCell"];
}

- (void)loadDevices
{
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  objc_super v4 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"DeviceSpecificController"];
  self->_isDeviceSpecificController = [v4 BOOLValue];

  SEL v5 = [(GCSettingsLegacyRootController *)self customizableControllers];
  devices = self->_devices;
  self->_devices = v5;

  if (![(NSArray *)self->_devices count])
  {
LABEL_4:
    v11 = [(GCSettingsLegacyRootController *)self navigationController];
    v9 = (GCController *)[(GCController *)v11 popToRootViewControllerAnimated:1];
    v10 = v11;
    goto LABEL_5;
  }
  [(GCController *)self->_device removeHapticEngines];
  if (self->_isDeviceSpecificController)
  {
    objc_super v7 = [*(id *)&self->PSListController_opaque[v3] propertyForKey:@"Controller"];
    device = self->_device;
    self->_device = v7;

    if (self->_device) {
      return;
    }
    goto LABEL_4;
  }
  v9 = [(NSArray *)self->_devices count];
  if (v9 == (GCController *)((char *)&dword_0 + 1))
  {
    v9 = [(NSArray *)self->_devices firstObject];
    v10 = self->_device;
    self->_device = v9;
  }
  else
  {
    v10 = self->_device;
    self->_device = 0;
  }
LABEL_5:

  _objc_release_x1(v9, v10);
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    self->_homeButtonGameIntentItemIndex = -1;
    [(GCSettingsLegacyRootController *)self loadDevices];
    if (self->_device) {
      [(GCSettingsLegacyRootController *)self deviceSpecifiers];
    }
    else {
    uint64_t v5 = [(GCSettingsLegacyRootController *)self deviceListSpecifiers];
    }
    BOOL v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    objc_super v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)customizableControllers
{
  v2 = +[GCController controllers];
  uint64_t v3 = +[NSPredicate predicateWithBlock:&stru_111A10];
  objc_super v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

- (id)deviceListSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obj = self->_devices;
  id v4 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = [v8 vendorName];
        v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

        [v10 setProperty:&__kCFBooleanTrue forKey:@"DeviceSpecificController"];
        [v10 setProperty:v8 forKey:@"Controller"];
        [v3 addObject:v10];
      }
      id v5 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)setHapticsValue:(id)a3
{
  id v4 = [a3 BOOLValue];
  id v5 = [(GCSettingsLegacyRootController *)self settings];
  [v5 setHapticsEnabled:v4];
}

- (id)getHapticsValue
{
  v2 = [(GCSettingsLegacyRootController *)self settings];
  id v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 hapticsEnabled]);

  return v3;
}

- (void)findController
{
  device = self->_device;
  if (device)
  {
    id v4 = [(GCController *)device haptics];

    if (v4)
    {
      id v5 = +[GCAnalytics instance];
      uint64_t v6 = [(GCController *)self->_device productCategory];
      [v5 sendSettingsIdentifyControllerEventForProductCategory:v6];

      objc_super v7 = [(GCController *)self->_device haptics];
      v8 = [v7 createEngineWithLocality:GCHapticsLocalityDefault];
      engine = self->_engine;
      self->_engine = v8;

      id v10 = objc_alloc((Class)CHHapticEventParameter);
      LODWORD(v11) = 1.0;
      id v12 = [v10 initWithParameterID:CHHapticEventParameterIDHapticIntensity value:v11];
      id v13 = objc_alloc((Class)CHHapticEventParameter);
      LODWORD(v14) = 1.0;
      id v15 = [v13 initWithParameterID:CHHapticEventParameterIDHapticSharpness value:v14];
      id v16 = objc_alloc((Class)CHHapticEvent);
      CHHapticEventType v17 = CHHapticEventTypeHapticTransient;
      v39[0] = v12;
      v39[1] = v15;
      v18 = +[NSArray arrayWithObjects:v39 count:2];
      id v19 = [v16 initWithEventType:v17 parameters:v18 relativeTime:0.0];
      v40[0] = v19;
      id v20 = objc_alloc((Class)CHHapticEvent);
      CHHapticEventType v21 = CHHapticEventTypeHapticTransient;
      v38[0] = v12;
      v38[1] = v15;
      v22 = +[NSArray arrayWithObjects:v38 count:2];
      id v23 = [v20 initWithEventType:v21 parameters:v22 relativeTime:0.25];
      v40[1] = v23;
      v24 = +[NSArray arrayWithObjects:v40 count:2];

      id v37 = 0;
      id v25 = [objc_alloc((Class)CHHapticPattern) initWithEvents:v24 parameters:&__NSArray0__struct error:&v37];
      id v26 = v37;
      if (!v26)
      {
        [(GCSettingsLegacyRootController *)self setFindingController:1];
        v27 = self->_engine;
        id v36 = 0;
        [(CHHapticEngine *)v27 startAndReturnError:&v36];
        id v28 = v36;
        if (!v28)
        {
          v29 = self->_engine;
          id v35 = 0;
          v30 = [(CHHapticEngine *)v29 createPlayerWithPattern:v25 error:&v35];
          id v31 = v35;
          if (!v31)
          {
            [v30 startAtTime:0 error:0.0];
            [v25 duration];
            dispatch_time_t v33 = dispatch_time(0, (uint64_t)((v32 + 0.100000001) * 1000000000.0));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_BEC0;
            block[3] = &unk_111A38;
            block[4] = self;
            dispatch_after(v33, (dispatch_queue_t)&_dispatch_main_q, block);
          }
        }
      }
    }
  }
}

- (void)dealloc
{
  [(GCController *)self->_device removeHapticEngines];
  [(GCControllerSettings *)self->_settings removeObserver:self forKeyPath:@"screenShotEnabled"];
  [(GCControllerSettings *)self->_settings removeObserver:self forKeyPath:@"videoRecordingEnabled"];
  +[GCSettingsAppIcon clearCache];
  v3.receiver = self;
  v3.super_class = (Class)GCSettingsLegacyRootController;
  [(GCSettingsLegacyRootController *)&v3 dealloc];
}

- (void)initSettings
{
  objc_super v3 = (GCControllerSettings *)[objc_alloc((Class)GCControllerSettings) initForController:self->_device];
  settings = self->_settings;
  self->_settings = v3;

  [(GCControllerSettings *)self->_settings addObserver:self forKeyPath:@"screenShotEnabled" options:1 context:off_1220B8];
  id v5 = self->_settings;
  uint64_t v6 = off_1220B8;

  [(GCControllerSettings *)v5 addObserver:self forKeyPath:@"videoRecordingEnabled" options:1 context:v6];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  double v11 = v10;
  if (off_1220B8 == a6)
  {
    if ([v10 isEqualToString:@"screenShotEnabled"])
    {
      CFStringRef v12 = @"ScreenshotCustomization";
    }
    else
    {
      if (![v11 isEqualToString:@"videoRecordingEnabled"]) {
        goto LABEL_8;
      }
      CFStringRef v12 = @"VideoRecordingCustomization";
    }
    id v13 = [(GCSettingsLegacyRootController *)self specifierForID:v12];
    [(GCSettingsLegacyRootController *)self reloadSpecifier:v13];

    goto LABEL_8;
  }
  v14.receiver = self;
  v14.super_class = (Class)GCSettingsLegacyRootController;
  [(GCSettingsLegacyRootController *)&v14 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
LABEL_8:
}

- (id)screenshotSettingStatus:(id)a3
{
  if ([(GCControllerSettings *)self->_settings screenShotEnabled]) {
    objc_super v3 = @"ON";
  }
  else {
    objc_super v3 = @"OFF";
  }
  id v4 = sub_CF14(v3);

  return v4;
}

- (id)videoRecordingSettingStatus:(id)a3
{
  if ([(GCControllerSettings *)self->_settings videoRecordingEnabled]) {
    objc_super v3 = @"ON";
  }
  else {
    objc_super v3 = @"OFF";
  }
  id v4 = sub_CF14(v3);

  return v4;
}

- (id)deviceSpecifiers
{
  [(GCSettingsLegacyRootController *)self initSettings];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (self->_device)
  {
    id v4 = sub_CF14(@"NAME_TITLE");
    id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self->_device set:0 get:"vendorName" detail:0 cell:4 edit:0];

    [v3 addObject:v5];
    uint64_t v6 = [(GCSettingsLegacyRootController *)self device];
    objc_super v7 = [v6 haptics];

    if (v7)
    {
      v8 = sub_CF14(@"HAPTICS_TITLE");
      uint64_t v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setHapticsValue:" get:"getHapticsValue" detail:0 cell:6 edit:0];

      [v3 addObject:v9];
      id v5 = (void *)v9;
    }
    id v10 = sub_CF14(@"CUSTOMIZATIONS_TITLE");
    double v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    [v11 setProperty:self->_device forKey:@"Controller"];
    [v11 setProperty:0 forKey:@"bundleIdentifier"];
    [v3 addObject:v11];
    CFStringRef v12 = [(GCSettingsLegacyRootController *)self device];
    id v13 = [v12 haptics];

    if (v13)
    {
      objc_super v14 = +[PSSpecifier groupSpecifierWithName:&stru_118E68];

      id v15 = sub_CF14(@"FIND_CONTROLLER_DESC_IOS");
      [v14 setProperty:v15 forKey:PSFooterTextGroupKey];

      [v3 addObject:v14];
      id v16 = sub_CF14(@"FIND_CONTROLLER_TITLE");
      double v11 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:"findController" get:0 detail:0 cell:13 edit:0];

      [v11 setButtonAction:"findController"];
      [v3 addObject:v11];
    }
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 item] == self->_homeButtonGameIntentItemIndex)
  {
    v8 = [v7 dequeueReusableCellWithIdentifier:@"RemappableElementCell" forIndexPath:v6];

    [v8 setAccessoryType:1];
    uint64_t v9 = [(GCSettingsLegacyRootController *)self device];
    id v10 = [v9 physicalInputProfile];
    id v7 = [v10 objectForKeyedSubscript:GCInputButtonHome];

    double v11 = [v7 unmappedSfSymbolsName];
    sub_D348(v8, v11);

    CFStringRef v12 = [v8 titleLabel];
    id v13 = [v7 unmappedLocalizedName];
    [v12 setText:v13];

    objc_super v14 = [(GCControllerSettings *)self->_settings mappingForElement:v7];
    if ([v7 isEqual:v14])
    {
      id v15 = 0;
    }
    else
    {
      id v15 = [v14 unmappedSfSymbolsName];
    }
    sub_D470(v8, v15);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)GCSettingsLegacyRootController;
    v8 = [(GCSettingsLegacyRootController *)&v17 tableView:v7 cellForRowAtIndexPath:v6];
  }

  return v8;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (GCController)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (GCControllerSettings)settings
{
  return self->_settings;
}

- (BOOL)isDeviceSpecificController
{
  return self->_isDeviceSpecificController;
}

- (void)setIsDeviceSpecificController:(BOOL)a3
{
  self->_isDeviceSpecificController = a3;
}

- (BOOL)findingController
{
  return self->_findingController;
}

- (void)setFindingController:(BOOL)a3
{
  self->_findingController = a3;
}

- (NSArray)configurableControllers
{
  return self->_configurableControllers;
}

- (void)setConfigurableControllers:(id)a3
{
}

- (CHHapticEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_configurableControllers, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end