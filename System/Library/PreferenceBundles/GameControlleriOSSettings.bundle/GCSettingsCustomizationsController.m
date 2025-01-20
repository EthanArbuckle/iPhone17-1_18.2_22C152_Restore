@interface GCSettingsCustomizationsController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (GCController)device;
- (GCControllerSettings)settings;
- (NSMutableArray)appsWithSettings;
- (NSMutableArray)appsWithoutSettings;
- (NSMutableArray)dstAuxiliaryButtons;
- (NSMutableArray)dstButtons;
- (NSMutableArray)dstDpads;
- (NSMutableArray)srcElements;
- (NSMutableDictionary)elements;
- (id)buttonsSectionsSpecifiers;
- (id)getEnableCustomizationsValue;
- (id)getHapticsValue;
- (id)getMappableElementsToSystemGesturesElements:(id)a3;
- (id)getRemappableElements:(id)a3;
- (id)newSpecifiers;
- (id)screenshotSettingStatus:(id)a3;
- (id)shareGestureDetailLabel:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)videoRecordingSettingStatus:(id)a3;
- (void)dealloc;
- (void)deleteAppSettings;
- (void)didSelectItemInRemapController:(id)a3 item:(id)a4;
- (void)filterSupportedApps;
- (void)initSettings;
- (void)launchAppsController;
- (void)loadCustomizableApps;
- (void)loadDevice;
- (void)loadRemappableButtons;
- (void)navigateBackToPreviousViewController;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onLoadItemInRemapController:(id)a3 item:(id)a4 cell:(id)a5;
- (void)resetRemapping;
- (void)restoreToDefaults;
- (void)setAppsWithSettings:(id)a3;
- (void)setAppsWithoutSettings:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDstAuxiliaryButtons:(id)a3;
- (void)setDstButtons:(id)a3;
- (void)setDstDpads:(id)a3;
- (void)setElements:(id)a3;
- (void)setEnableCustomizationsValue:(id)a3;
- (void)setHapticsValue:(id)a3;
- (void)setSrcElements:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation GCSettingsCustomizationsController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)GCSettingsCustomizationsController;
  [(GCSettingsCustomizationsController *)&v3 viewDidLoad];
  [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] registerClass:objc_opt_class() forCellReuseIdentifier:@"RemappableElementCell"];
}

- (void)filterSupportedApps
{
  v2 = +[LSApplicationRecord enumeratorWithOptions:0];
  objc_super v3 = +[NSPredicate predicateWithFormat:@"SELF.supportsControllerUserInteraction == true" argumentArray:&__NSArray0__struct];
  [v2 setPredicate:v3];

  v20 = +[NSMutableArray array];
  v19 = +[NSMutableArray array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v2;
  id v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v6 = [v5 bundleIdentifier];

        if (v6)
        {
          v24 = v5;
          v7 = [v5 supportedGameControllers];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v8 = v7;
          id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v27;
            while (2)
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v27 != v11) {
                  objc_enumerationMutation(v8);
                }
                v13 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) objectForKey:@"ProfileName" ofClass:objc_opt_class()];
                unsigned __int8 v14 = [v13 isEqualToString:@"ExtendedGamepad"];

                if (v14)
                {

                  v15 = [(GCController *)self->_device identifier];
                  v16 = [v24 bundleIdentifier];
                  unsigned int v17 = +[GCControllerSettings settingsCustomizedForController:v15 forBundleIdentifier:v16];

                  if (v17) {
                    v18 = v20;
                  }
                  else {
                    v18 = v19;
                  }
                  [v18 addObject:v24];
                  goto LABEL_20;
                }
              }
              id v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }

LABEL_20:
        }
      }
      id v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v25);
  }

  [v20 sortUsingComparator:&stru_111938];
  [v19 sortUsingComparator:&stru_111938];
  [(GCSettingsCustomizationsController *)self setAppsWithSettings:v20];
  [(GCSettingsCustomizationsController *)self setAppsWithoutSettings:v19];
}

- (void)dealloc
{
  objc_super v3 = [(GCController *)self->_device identifier];
  +[GCControllerSettings unregisterSettingsCustomizedHandlerForController:v3 forKey:self->_settingsCustomizedIdentifier];

  [(GCControllerSettings *)self->_settings removeObserver:self forKeyPath:@"screenShotEnabled"];
  [(GCControllerSettings *)self->_settings removeObserver:self forKeyPath:@"videoRecordingEnabled"];
  [(GCControllerSettings *)self->_settings removeObserver:self forKeyPath:@"replayKitGestureSettings"];
  v4.receiver = self;
  v4.super_class = (Class)GCSettingsCustomizationsController;
  [(GCSettingsCustomizationsController *)&v4 dealloc];
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
      id v8 = [(LSApplicationRecord *)self->_appRecord bundleIdentifier];
      id v9 = (GCControllerSettings *)[v7 initWithBundleIdentifier:v8 forController:self->_device];
      settings = self->_settings;
      self->_settings = v9;
    }
    else
    {
      uint64_t v11 = (GCControllerSettings *)[v6 initForController:self->_device];
      id v8 = self->_settings;
      self->_settings = v11;
    }

    [(GCControllerSettings *)self->_settings addObserver:self forKeyPath:@"screenShotEnabled" options:1 context:off_121ED0];
    [(GCControllerSettings *)self->_settings addObserver:self forKeyPath:@"videoRecordingEnabled" options:1 context:off_121ED0];
    v12 = self->_settings;
    v13 = off_121ED0;
    [(GCControllerSettings *)v12 addObserver:self forKeyPath:@"replayKitGestureSettings" options:1 context:v13];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  uint64_t v11 = v10;
  if (off_121ED0 == a6)
  {
    if ([v10 isEqualToString:@"screenShotEnabled"])
    {
      CFStringRef v12 = @"ScreenshotCustomization";
    }
    else if ([v11 isEqualToString:@"videoRecordingEnabled"])
    {
      CFStringRef v12 = @"VideoRecordingCustomization";
    }
    else
    {
      if (![v11 isEqualToString:@"replayKitGestureSettings"]) {
        goto LABEL_10;
      }
      v13 = [(GCSettingsCustomizationsController *)self specifierForID:@"ReplayKitGestureSettingFirstOption"];
      [(GCSettingsCustomizationsController *)self reloadSpecifier:v13];

      CFStringRef v12 = @"ReplayKitGestureSettingSecondOption";
    }
    unsigned __int8 v14 = [(GCSettingsCustomizationsController *)self specifierForID:v12];
    [(GCSettingsCustomizationsController *)self reloadSpecifier:v14];

    goto LABEL_10;
  }
  v15.receiver = self;
  v15.super_class = (Class)GCSettingsCustomizationsController;
  [(GCSettingsCustomizationsController *)&v15 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
LABEL_10:
}

- (void)navigateBackToPreviousViewController
{
  objc_super v3 = [(GCSettingsCustomizationsController *)self navigationController];
  objc_super v4 = [v3 viewControllers];
  v5 = (char *)[v4 indexOfObject:self];

  if (v5 && v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(GCSettingsCustomizationsController *)self navigationController];
    v7 = [v6 viewControllers];
    id v10 = [v7 objectAtIndex:v5 - 1];

    id v8 = [(GCSettingsCustomizationsController *)self navigationController];
    id v9 = [v8 popToViewController:v10 animated:1];
  }
}

- (void)loadDevice
{
  objc_super v3 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"Controller"];
  if (v3 != self->_device) {
    objc_storeStrong((id *)&self->_device, v3);
  }

  _objc_release_x1();
}

- (void)loadCustomizableApps
{
  objc_initWeak(&location, self);
  objc_super v3 = +[NSUUID UUID];
  settingsCustomizedIdentifier = self->_settingsCustomizedIdentifier;
  self->_settingsCustomizedIdentifier = v3;

  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  v7 = sub_58F0;
  id v8 = &unk_111960;
  objc_copyWeak(&v9, &location);
  +[GCControllerSettings registerSettingsCustomizedHandler:&v5 forKey:self->_settingsCustomizedIdentifier];
  [(GCSettingsCustomizationsController *)self filterSupportedApps];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)getRemappableElements:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v11 remappable])
        {
          elements = self->_elements;
          v13 = [v11 primaryAlias];
          [(NSMutableDictionary *)elements setObject:v11 forKey:v13];

          unsigned __int8 v14 = [v11 primaryAlias];
          [v5 addObject:v14];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_5B14;
  v17[3] = &unk_111988;
  v17[4] = self;
  objc_super v15 = [v5 sortedArrayUsingComparator:v17];

  return v15;
}

- (id)getMappableElementsToSystemGesturesElements:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v11 mappableToSystemGestures])
        {
          elements = self->_elements;
          v13 = [v11 primaryAlias];
          [(NSMutableDictionary *)elements setObject:v11 forKey:v13];

          unsigned __int8 v14 = [v11 primaryAlias];
          [v5 addObject:v14];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_5D98;
  v17[3] = &unk_111988;
  v17[4] = self;
  objc_super v15 = [v5 sortedArrayUsingComparator:v17];

  return v15;
}

- (void)loadRemappableButtons
{
  if (!self->_srcElements && self->_device)
  {
    objc_super v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    elements = self->_elements;
    self->_elements = v3;

    id v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    srcElements = self->_srcElements;
    self->_srcElements = v5;

    id v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    dstButtons = self->_dstButtons;
    self->_dstButtons = v7;

    uint64_t v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    dstDpads = self->_dstDpads;
    self->_dstDpads = v9;

    uint64_t v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    dstAuxiliaryButtons = self->_dstAuxiliaryButtons;
    self->_dstAuxiliaryButtons = v11;

    v13 = [(GCController *)self->_device extendedGamepad];
    id v18 = [v13 allButtons];

    unsigned __int8 v14 = [(GCSettingsCustomizationsController *)self getRemappableElements:v18];
    [(NSMutableArray *)self->_srcElements addObjectsFromArray:v14];
    [(NSMutableArray *)self->_dstButtons addObjectsFromArray:v14];
    objc_super v15 = [(GCController *)self->_device extendedGamepad];
    v16 = [v15 allDpads];

    unsigned int v17 = [(GCSettingsCustomizationsController *)self getRemappableElements:v16];
    [(NSMutableArray *)self->_srcElements addObjectsFromArray:v17];
    [(NSMutableArray *)self->_dstDpads addObjectsFromArray:v17];
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(GCSettingsCustomizationsController *)self newSpecifiers];
    id v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)buttonsSectionsSpecifiers
{
  id v16 = objc_alloc_init((Class)NSMutableArray);
  if (self->_device)
  {
    [(GCSettingsCustomizationsController *)self loadRemappableButtons];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = self->_srcElements;
    id v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (!v3)
    {
      id v5 = 0;
      goto LABEL_19;
    }
    id v4 = v3;
    id v5 = 0;
    uint64_t v15 = *(void *)v18;
    uint64_t v6 = PSIDKey;
    while (1)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v8];
        if ([v9 remappable])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = [v9 unmappedLocalizedName];
            uint64_t v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

            [v11 setProperty:self->_dstButtons forKey:@"ButtonRemapControllerValues"];
LABEL_12:
            id v5 = v11;
            goto LABEL_15;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || [v9 mappableToSystemGestures]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          CFStringRef v12 = [v9 unmappedLocalizedName];
          uint64_t v11 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

          goto LABEL_12;
        }
LABEL_15:
        [v5 setProperty:@"ControllerElement" forKey:v6];
        [v5 setProperty:self->_device forKey:@"Controller"];
        [v5 setProperty:v8 forKey:@"ControllerElement"];
        [v16 addObject:v5];
      }
      id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (!v4)
      {
LABEL_19:

        break;
      }
    }
  }

  return v16;
}

- (void)onLoadItemInRemapController:(id)a3 item:(id)a4 cell:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 specifier];
  CFStringRef v12 = [v11 propertyForKey:@"remapControllerType"];
  unsigned int v13 = [v12 isEqualToString:@"ReplayKit"];

  if (v13)
  {
    id v14 = [v9 integerValue];

    sub_6614((uint64_t)v14);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v8 titleLabel];
    [v15 setText:v29];

    id v16 = [v10 specifier];

    long long v17 = [v16 propertyForKey:@"GCGestureType"];

    long long v18 = [(GCControllerSettings *)self->_settings replayKitGestureSettings];
    id v19 = objc_msgSend(v18, "gestureModeForGestureType:", (int)objc_msgSend(v17, "intValue"));

    [v8 setChecked:v19 == v14];
  }
  else
  {
    id v29 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v9];

    long long v20 = [v29 unmappedSfSymbolsName];
    sub_D348(v8, v20);

    long long v21 = [v8 titleLabel];
    v22 = [v29 unmappedLocalizedName];
    [v21 setText:v22];

    uint64_t v23 = [v10 specifier];

    long long v17 = [v23 propertyForKey:@"ControllerElement"];

    uint64_t v24 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v17];
    id v25 = [(GCControllerSettings *)self->_settings mappingForElement:v24];
    long long v26 = [v29 primaryAlias];
    long long v27 = [v25 primaryAlias];
    id v28 = [v26 isEqualToString:v27];

    [v8 setChecked:v28];
    id v8 = (id)v24;
  }
}

- (void)didSelectItemInRemapController:(id)a3 item:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [v17 specifier];
  id v8 = [v7 propertyForKey:@"remapControllerType"];
  unsigned int v9 = [v8 isEqualToString:@"ReplayKit"];

  if (v9)
  {
    id v10 = [v6 integerValue];
    uint64_t v11 = [v17 specifier];
    CFStringRef v12 = [v11 propertyForKey:@"GCGestureType"];

    uint64_t v13 = (int)[v12 intValue];
    id v14 = [(GCControllerSettings *)self->_settings replayKitGestureSettings];
    [v14 setGestureMode:v10 forGestureType:v13];
    [(GCControllerSettings *)self->_settings setReplayKitGestureSettings:v14];
  }
  else
  {
    uint64_t v15 = [v17 specifier];
    CFStringRef v12 = [v15 propertyForKey:@"ControllerElement"];

    id v14 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v12];
    id v16 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v6];
    [(GCControllerSettings *)self->_settings setMappingForElement:v14 toElement:v16];
    [(GCSettingsCustomizationsController *)self reloadSpecifiers];
  }
}

- (id)getEnableCustomizationsValue
{
  v2 = [(GCSettingsCustomizationsController *)self settings];
  id v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 customizationsEnabled]);

  return v3;
}

- (void)setEnableCustomizationsValue:(id)a3
{
  id v4 = [a3 BOOLValue];
  id v5 = [(GCSettingsCustomizationsController *)self settings];
  [v5 setCustomizationsEnabled:v4];
}

- (void)setHapticsValue:(id)a3
{
  id v4 = [a3 BOOLValue];
  id v5 = [(GCSettingsCustomizationsController *)self settings];
  [v5 setHapticsEnabled:v4];
}

- (id)getHapticsValue
{
  v2 = [(GCSettingsCustomizationsController *)self settings];
  id v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 hapticsEnabled]);

  return v3;
}

- (void)deleteAppSettings
{
  id v3 = [(GCSettingsCustomizationsController *)self settings];
  [v3 eraseAllSettings];

  id v4 = [(GCSettingsCustomizationsController *)self parentController];
  [v4 reloadSpecifiers];
  [(GCSettingsCustomizationsController *)self navigateBackToPreviousViewController];
}

- (id)screenshotSettingStatus:(id)a3
{
  if ([(GCControllerSettings *)self->_settings screenShotEnabled]) {
    id v3 = @"ON";
  }
  else {
    id v3 = @"OFF";
  }
  id v4 = sub_CF14(v3);

  return v4;
}

- (id)videoRecordingSettingStatus:(id)a3
{
  if ([(GCControllerSettings *)self->_settings videoRecordingEnabled]) {
    id v3 = @"ON";
  }
  else {
    id v3 = @"OFF";
  }
  id v4 = sub_CF14(v3);

  return v4;
}

- (void)restoreToDefaults
{
  [(GCControllerSettings *)self->_settings restoreElementMappingToDefault];

  [(GCSettingsCustomizationsController *)self reloadSpecifiers];
}

- (id)shareGestureDetailLabel:(id)a3
{
  settings = self->_settings;
  id v4 = a3;
  id v5 = [(GCControllerSettings *)settings replayKitGestureSettings];
  id v6 = [v4 propertyForKey:@"GCGestureType"];

  id v7 = sub_6614((uint64_t)objc_msgSend(v5, "gestureModeForGestureType:", (int)objc_msgSend(v6, "intValue")));

  return v7;
}

- (id)newSpecifiers
{
  v2 = self;
  self->_buttonsSectionStart = -1;
  self->_appsSectionStart = -1;
  [(GCSettingsCustomizationsController *)self loadDevice];
  [(GCSettingsCustomizationsController *)v2 loadCustomizableApps];
  [(GCSettingsCustomizationsController *)v2 initSettings];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (!v2->_device) {
    return v3;
  }
  if (v2->_appRecord
    && ([(GCSettingsCustomizationsController *)v2 device],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 haptics],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = sub_CF14(@"HAPTICS_TITLE");
    id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:v2 set:"setHapticsValue:" get:"getHapticsValue" detail:0 cell:6 edit:0];

    [v3 addObject:v7];
    unsigned int v8 = 1;
  }
  else
  {
    unsigned int v8 = 0;
  }
  unsigned int v9 = +[PSSpecifier groupSpecifierWithID:@"ButtonsGroup"];
  [v3 addObject:v9];

  id v10 = [(GCSettingsCustomizationsController *)v2 buttonsSectionsSpecifiers];
  [v3 addObjectsFromArray:v10];

  v2->_buttonsSectionStart = v8;
  v68 = +[PSSpecifier groupSpecifierWithID:@"ResetToDefaultsButtonGroup"];
  objc_msgSend(v3, "addObject:");
  uint64_t v11 = sub_CF14(@"RESTORE_BUTTON_DEFAULTS_TITLE");
  CFStringRef v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:v2 set:0 get:0 detail:0 cell:13 edit:0];

  [v12 setButtonAction:"restoreToDefaults"];
  v69 = v12;
  [v3 addObject:v12];
  uint64_t v13 = [(GCSettingsCustomizationsController *)v2 device];
  id v14 = [v13 physicalInputProfile];
  uint64_t v15 = [v14 objectForKeyedSubscript:GCInputButtonShare];
  if (v15)
  {

LABEL_9:
    id v19 = [(GCSettingsCustomizationsController *)v2 device];
    long long v20 = [v19 physicalInputProfile];
    long long v21 = [v20 objectForKeyedSubscript:GCInputButtonShare];

    v22 = sub_CF14(@"SHARE_GESTURES_TITLE");
    uint64_t v23 = +[PSSpecifier groupSpecifierWithName:v22];

    [v3 addObject:v23];
    v66 = sub_CF88(@"%@", @"SHARE_GESTURES_DESC_ALT");
    uint64_t v24 = [(GCSettingsCustomizationsController *)v2 device];
    id v25 = [v24 physicalInputProfile];
    long long v26 = v25;
    if (v21) {
      GCInputButtonName v27 = GCInputButtonShare;
    }
    else {
      GCInputButtonName v27 = GCInputButtonOptions;
    }
    if (v21) {
      id v28 = @"SINGLE_PRESS";
    }
    else {
      id v28 = @"DOUBLE_PRESS";
    }
    uint64_t v64 = 2 * (v21 == 0);
    id v29 = [v25 objectForKeyedSubscript:v27];
    long long v30 = [v29 localizedName];
    v65 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v66, v30);

    [v23 setProperty:v65 forKey:PSFooterTextGroupKey];
    v62 = sub_CF14(v28);
    unsigned int v61 = v8 + 3;
    v63 = sub_CF14(@"LONG_PRESS");
    long long v31 = +[NSNumber numberWithInteger:-1];
    v76[0] = v31;
    long long v32 = +[NSNumber numberWithInteger:0];
    v76[1] = v32;
    long long v33 = +[NSNumber numberWithInteger:1];
    v76[2] = v33;
    v34 = +[NSNumber numberWithInteger:2];
    v76[3] = v34;
    v35 = +[NSArray arrayWithObjects:v76 count:4];

    v36 = +[PSSpecifier preferenceSpecifierNamed:v62 target:v2 set:0 get:"shareGestureDetailLabel:" detail:objc_opt_class() cell:2 edit:0];

    [v36 setProperty:v35 forKey:@"ButtonRemapControllerValues"];
    uint64_t v37 = PSIDKey;
    [v36 setProperty:@"ReplayKitGestureSettingFirstOption" forKey:PSIDKey];
    v38 = sub_CF14(@"SHARE_GESTURES_DETAIL_FOOTER");
    [v36 setProperty:v38 forKey:@"ButtonRemapControllerFooter"];

    [v36 setProperty:@"ReplayKit" forKey:@"remapControllerType"];
    v39 = +[NSNumber numberWithInteger:v64];
    [v36 setProperty:v39 forKey:@"GCGestureType"];

    [v3 addObject:v36];
    v40 = +[PSSpecifier preferenceSpecifierNamed:v63 target:v2 set:0 get:"shareGestureDetailLabel:" detail:objc_opt_class() cell:2 edit:0];

    [v40 setProperty:v35 forKey:@"ButtonRemapControllerValues"];
    [v40 setProperty:@"ReplayKitGestureSettingSecondOption" forKey:v37];
    v41 = sub_CF14(@"SHARE_GESTURES_DETAIL_FOOTER");
    [v40 setProperty:v41 forKey:@"ButtonRemapControllerFooter"];

    [v40 setProperty:@"ReplayKit" forKey:@"remapControllerType"];
    v42 = +[NSNumber numberWithInteger:1];
    [v40 setProperty:v42 forKey:@"GCGestureType"];

    [v3 addObject:v40];
    goto LABEL_16;
  }
  id v16 = [(GCSettingsCustomizationsController *)v2 device];
  id v17 = [v16 physicalInputProfile];
  long long v18 = [v17 objectForKeyedSubscript:GCInputButtonOptions];

  if (v18) {
    goto LABEL_9;
  }
  unsigned int v61 = v8 | 2;
  v40 = v12;
LABEL_16:
  if (v2->_appRecord)
  {
    v43 = +[PSSpecifier groupSpecifierWithID:@"DeleteCustomizationGroup"];
    [v3 addObject:v43];

    v44 = sub_CF14(@"DELETE_CUSTOMIZATIONS_TITLE");
    v45 = +[PSSpecifier deleteButtonSpecifierWithName:v44 target:v2 action:"deleteAppSettings"];
    [v3 addObject:v45];

    v46 = v68;
  }
  else
  {
    v47 = [(GCSettingsCustomizationsController *)v2 appsWithSettings];
    id v48 = [v47 count];

    v49 = sub_CF14(@"APP_CUSTOMIZATION_TITLE");
    v46 = +[PSSpecifier groupSpecifierWithName:v49];
    if (v48)
    {

      [v3 addObject:v46];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id obj = [(GCSettingsCustomizationsController *)v2 appsWithSettings];
      id v50 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
      if (v50)
      {
        id v51 = v50;
        v67 = v46;
        v52 = v2;
        v53 = 0;
        uint64_t v54 = *(void *)v72;
        do
        {
          v55 = 0;
          v56 = v53;
          do
          {
            if (*(void *)v72 != v54) {
              objc_enumerationMutation(obj);
            }
            v57 = *(void **)(*((void *)&v71 + 1) + 8 * (void)v55);
            v58 = [v57 localizedName];
            v53 = +[PSSpecifier preferenceSpecifierNamed:v58 target:v52 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

            [v53 setProperty:v52->_device forKey:@"Controller"];
            [v53 setProperty:v57 forKey:@"ApplicationRecord"];
            [v3 addObject:v53];
            v55 = (char *)v55 + 1;
            v56 = v53;
          }
          while (v51 != v55);
          id v51 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
        }
        while (v51);

        v2 = v52;
        v46 = v67;
      }

      v2->_appsSectionStart = v61;
      v46 = +[PSSpecifier groupSpecifierWithID:@"AddAppButtonGroup"];
      v49 = v68;
    }
    else
    {
    }
    [v3 addObject:v46];
    v59 = sub_CF14(@"ADD_APP_TITLE");
    v44 = +[PSSpecifier preferenceSpecifierNamed:v59 target:v2 set:0 get:0 detail:objc_opt_class() cell:13 edit:0];

    [v44 setButtonAction:"launchAppsController"];
    [v3 addObject:v44];
  }

  return v3;
}

- (void)launchAppsController
{
  id v6 = (id)objc_opt_new();
  id v3 = objc_opt_new();
  id v4 = sub_CF14(@"CHOOSE_APP_TO_CUSTOMIZE_TITLE");
  [v3 setTitle:v4];

  [v3 setParentController:self];
  id v5 = [(GCSettingsCustomizationsController *)self appsWithoutSettings];
  [v3 setApps:v5];

  [v6 setModalPresentationStyle:2];
  [v6 pushViewController:v3 animated:0];
  [(GCSettingsCustomizationsController *)self presentViewController:v6 animated:1 completion:0];
  [(GCSettingsCustomizationsController *)self reloadSpecifiers];
}

- (void)resetRemapping
{
  id v3 = [(GCSettingsCustomizationsController *)self settings];
  [v3 restoreElementMappingToDefault];

  [(GCSettingsCustomizationsController *)self reloadSpecifiers];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] == self->_buttonsSectionStart)
  {
    unsigned int v8 = [v6 dequeueReusableCellWithIdentifier:@"RemappableElementCell" forIndexPath:v7];
    [v8 setAccessoryType:1];
    unsigned int v9 = [(GCSettingsCustomizationsController *)self specifierAtIndexPath:v7];
    id v10 = [v9 propertyForKey:@"ControllerElement"];
    uint64_t v11 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v10];
    CFStringRef v12 = [v11 unmappedSfSymbolsName];
    sub_D348(v8, v12);

    uint64_t v13 = [v8 titleLabel];
    id v14 = [v11 unmappedLocalizedName];
    [v13 setText:v14];

    uint64_t v15 = [(GCControllerSettings *)self->_settings mappingForElement:v11];
    if ([v11 isEqual:v15])
    {
      id v16 = 0;
    }
    else
    {
      id v16 = [v15 unmappedSfSymbolsName];
    }
    sub_D470(v8, v16);
  }
  else if ([v7 section] == self->_appsSectionStart)
  {
    v27.receiver = self;
    v27.super_class = (Class)GCSettingsCustomizationsController;
    unsigned int v8 = [(GCSettingsCustomizationsController *)&v27 tableView:v6 cellForRowAtIndexPath:v7];
    id v17 = [(GCSettingsCustomizationsController *)self specifierAtIndexPath:v7];
    long long v18 = [v17 propertyForKey:@"ApplicationRecord"];
    id v19 = [v8 titleLabel];
    long long v20 = [v18 localizedName];
    [v19 setText:v20];

    long long v21 = [v18 bundleIdentifier];
    v22 = +[GCSettingsAppIcon appIconImageForBundleIdentifier:v21];
    uint64_t v23 = [v22 UIImage];

    [v17 setProperty:v23 forKey:PSIconImageKey];
    uint64_t v24 = [v8 iconImageView];
    [v24 setImage:v23];
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)GCSettingsCustomizationsController;
    unsigned int v8 = [(GCSettingsCustomizationsController *)&v26 tableView:v6 cellForRowAtIndexPath:v7];
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)GCSettingsCustomizationsController;
  [(GCSettingsCustomizationsController *)&v4 tableView:a3 didSelectRowAtIndexPath:a4];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] != self->_appsSectionStart) {
    goto LABEL_3;
  }
  id v6 = [(GCSettingsCustomizationsController *)self specifierAtIndexPath:v5];
  id v7 = [v6 identifier];
  unsigned int v8 = sub_CF14(@"ADD_APP_TITLE");
  unsigned int v9 = [v7 isEqualToString:v8];

  if (!v9) {
    BOOL v10 = 1;
  }
  else {
LABEL_3:
  }
    BOOL v10 = 0;

  return v10;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v13 = [(GCSettingsCustomizationsController *)self specifierAtIndexPath:a5];
    id v7 = [v13 propertyForKey:@"ApplicationRecord"];
    id v8 = objc_alloc((Class)GCControllerSettings);
    unsigned int v9 = [v7 bundleIdentifier];
    BOOL v10 = [(GCSettingsCustomizationsController *)self device];
    id v11 = [v8 initWithBundleIdentifier:v9 forController:v10];

    [v11 eraseAllSettings];
    CFStringRef v12 = [(GCSettingsCustomizationsController *)self appsWithSettings];
    [v12 removeObject:v7];

    [(GCSettingsCustomizationsController *)self removeSpecifier:v13 animated:1];
    [(GCSettingsCustomizationsController *)self reloadSpecifiers];
  }
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

- (NSMutableDictionary)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (NSMutableArray)srcElements
{
  return self->_srcElements;
}

- (void)setSrcElements:(id)a3
{
}

- (NSMutableArray)dstButtons
{
  return self->_dstButtons;
}

- (void)setDstButtons:(id)a3
{
}

- (NSMutableArray)dstDpads
{
  return self->_dstDpads;
}

- (void)setDstDpads:(id)a3
{
}

- (NSMutableArray)dstAuxiliaryButtons
{
  return self->_dstAuxiliaryButtons;
}

- (void)setDstAuxiliaryButtons:(id)a3
{
}

- (NSMutableArray)appsWithSettings
{
  return self->_appsWithSettings;
}

- (void)setAppsWithSettings:(id)a3
{
}

- (NSMutableArray)appsWithoutSettings
{
  return self->_appsWithoutSettings;
}

- (void)setAppsWithoutSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsWithoutSettings, 0);
  objc_storeStrong((id *)&self->_appsWithSettings, 0);
  objc_storeStrong((id *)&self->_dstAuxiliaryButtons, 0);
  objc_storeStrong((id *)&self->_dstDpads, 0);
  objc_storeStrong((id *)&self->_dstButtons, 0);
  objc_storeStrong((id *)&self->_srcElements, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_appRecord, 0);

  objc_storeStrong((id *)&self->_settingsCustomizedIdentifier, 0);
}

@end