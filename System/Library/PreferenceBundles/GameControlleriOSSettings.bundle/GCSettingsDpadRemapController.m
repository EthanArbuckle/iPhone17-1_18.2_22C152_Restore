@interface GCSettingsDpadRemapController
- (GCController)device;
- (id)getCustomizationValue:(id)a3;
- (id)newSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)initSettings;
- (void)loadDevice;
- (void)setCustomization:(id)a3 forSpecifier:(id)a4;
- (void)setCustomization:(id)a3 toValue:(BOOL)a4 forDpad:(id)a5;
- (void)setDevice:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation GCSettingsDpadRemapController

- (void)initSettings
{
  id v5 = [(GCSettingsDpadRemapController *)self parentController];
  v3 = [v5 settings];
  settings = self->_settings;
  self->_settings = v3;
}

- (void)loadDevice
{
  self->_device = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"Controller"];

  _objc_release_x1();
}

- (void)setCustomization:(id)a3 toValue:(BOOL)a4 forDpad:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  v8 = [(GCControllerSettings *)self->_settings settingsForElement:a5];
  v9 = sub_CF14(@"INVERT_HORIZONTALLY_TITLE");
  unsigned int v10 = [v13 isEqualToString:v9];

  if (v10)
  {
    [v8 setInvertHorizontally:v6];
  }
  else
  {
    v11 = sub_CF14(@"INVERT_VERTICALLY_TITLE");
    unsigned int v12 = [v13 isEqualToString:v11];

    if (v12) {
      [v8 setInvertVertically:v6];
    }
    else {
      [v8 setSwapAxes:v6];
    }
  }
}

- (void)setCustomization:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(GCSettingsDpadRemapController *)self specifier];
  id v14 = [v8 propertyForKey:@"ControllerElement"];

  v9 = [(GCSettingsDpadRemapController *)self parentController];
  unsigned int v10 = [v9 elements];
  v11 = [v10 objectForKeyedSubscript:v14];

  unsigned int v12 = [v6 propertyForKey:PSIDKey];

  id v13 = [v7 BOOLValue];
  [(GCSettingsDpadRemapController *)self setCustomization:v12 toValue:v13 forDpad:v11];
}

- (id)getCustomizationValue:(id)a3
{
  id v4 = a3;
  id v5 = [(GCSettingsDpadRemapController *)self specifier];
  id v6 = [v5 propertyForKey:@"ControllerElement"];

  id v7 = [(GCSettingsDpadRemapController *)self parentController];
  v8 = [v7 elements];
  v9 = [v8 objectForKeyedSubscript:v6];

  unsigned int v10 = [v4 propertyForKey:PSIDKey];

  v11 = [(GCControllerSettings *)self->_settings settingsForElement:v9];
  unsigned int v12 = sub_CF14(@"INVERT_HORIZONTALLY_TITLE");
  LODWORD(v8) = [v10 isEqualToString:v12];

  if (v8)
  {
    id v13 = [v11 invertHorizontally];
  }
  else
  {
    id v14 = sub_CF14(@"INVERT_VERTICALLY_TITLE");
    unsigned int v15 = [v10 isEqualToString:v14];

    if (v15) {
      id v13 = [v11 invertVertically];
    }
    else {
      id v13 = [v11 swapAxes];
    }
  }
  v16 = +[NSNumber numberWithBool:v13];

  return v16;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(GCSettingsDpadRemapController *)self newSpecifiers];
    id v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)newSpecifiers
{
  id v22 = objc_alloc_init((Class)NSMutableArray);
  [(GCSettingsDpadRemapController *)self loadDevice];
  [(GCSettingsDpadRemapController *)self initSettings];
  if (self->_device)
  {
    uint64_t v3 = [(GCSettingsDpadRemapController *)self parentController];
    id v4 = [v3 dstDpads];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      id v7 = v6;
      v8 = 0;
      uint64_t v9 = *(void *)v24;
      do
      {
        unsigned int v10 = 0;
        v11 = v8;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v10);
          v8 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v8 setProperty:v12 forKey:@"ControllerElement"];
          [v22 addObject:v8];
          unsigned int v10 = (char *)v10 + 1;
          v11 = v8;
        }
        while (v7 != v10);
        id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v7);
    }
    id v13 = +[PSSpecifier groupSpecifierWithName:&stru_118E68];
    [v22 addObject:v13];
    id v14 = sub_CF14(@"INVERT_HORIZONTALLY_TITLE");
    unsigned int v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"setCustomization:forSpecifier:" get:"getCustomizationValue:" detail:0 cell:6 edit:0];

    uint64_t v16 = PSIDKey;
    [v15 setProperty:@"Invert Horizontally" forKey:PSIDKey];
    [v22 addObject:v15];
    v17 = sub_CF14(@"INVERT_VERTICALLY_TITLE");
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:"setCustomization:forSpecifier:" get:"getCustomizationValue:" detail:0 cell:6 edit:0];

    [v18 setProperty:@"Invert Vertically" forKey:v16];
    [v22 addObject:v18];
    v19 = sub_CF14(@"SWAP_AXIS_TITLE");
    v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:"setCustomization:forSpecifier:" get:"getCustomizationValue:" detail:0 cell:6 edit:0];

    [v20 setProperty:@"Swap Axes" forKey:v16];
    [v22 addObject:v20];
  }
  return v22;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)GCSettingsDpadRemapController;
  id v7 = [(GCSettingsDpadRemapController *)&v26 tableView:a3 cellForRowAtIndexPath:v6];
  if (![v6 section])
  {
    long long v25 = [(GCSettingsDpadRemapController *)self specifierAtIndexPath:v6];
    v8 = [v25 propertyForKey:@"ControllerElement"];
    uint64_t v9 = [(GCSettingsDpadRemapController *)self parentController];
    unsigned int v10 = [v9 elements];
    v11 = [v10 objectForKeyedSubscript:v8];

    uint64_t v12 = [v11 unmappedSfSymbolsName];
    sub_D348(v7, v12);

    id v13 = [v7 titleLabel];
    id v14 = [v11 unmappedLocalizedName];
    [v13 setText:v14];

    unsigned int v15 = [(GCSettingsDpadRemapController *)self specifier];
    uint64_t v16 = [v15 propertyForKey:@"ControllerElement"];

    v17 = [(GCSettingsDpadRemapController *)self parentController];
    v18 = [v17 elements];
    v19 = [v18 objectForKeyedSubscript:v16];

    v20 = [(GCControllerSettings *)self->_settings mappingForElement:v19];
    v21 = [v11 primaryAlias];
    id v22 = [v20 primaryAlias];
    id v23 = [v21 isEqualToString:v22];

    [v7 setChecked:v23];
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (![v6 section])
  {
    id v7 = [(GCSettingsDpadRemapController *)self specifierAtIndexPath:v6];
    v8 = [(GCSettingsDpadRemapController *)self specifier];
    uint64_t v9 = [v8 propertyForKey:@"ControllerElement"];

    unsigned int v10 = [(GCSettingsDpadRemapController *)self parentController];
    v11 = [v10 elements];
    uint64_t v12 = [v11 objectForKeyedSubscript:v9];

    id v13 = [v7 propertyForKey:@"ControllerElement"];
    id v14 = [(GCSettingsDpadRemapController *)self parentController];
    unsigned int v15 = [v14 elements];
    uint64_t v16 = [v15 objectForKeyedSubscript:v13];

    [(GCControllerSettings *)self->_settings setMappingForElement:v12 toElement:v16];
    v17 = [(GCSettingsDpadRemapController *)self parentController];
    [v17 reloadSpecifiers];

    [(GCSettingsDpadRemapController *)self reloadSpecifiers];
    [v18 deselectRowAtIndexPath:v6 animated:1];
  }
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

  objc_storeStrong((id *)&self->_settings, 0);
}

@end