@interface VOTPickerSettingViewController
- (BOOL)_canShowWhileLocked;
- (id)specifiers;
- (int64_t)tableViewStyle;
- (void)_updateCellAccessories;
- (void)_updateCellAccessory:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VOTPickerSettingViewController

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v22 = OBJC_IVAR___PSListController__specifiers;
    v24 = self;
    v4 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"VOSSettingsItem"];
    v5 = +[NSMutableArray array];
    v6 = +[VOSSettingsHelper sharedInstance];
    v7 = [v6 nameForItem:v4];
    v8 = +[PSSpecifier groupSpecifierWithName:v7];

    [v5 addObject:v8];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v9 = +[VOSSettingsHelper sharedInstance];
    v10 = [v9 possibleValuesForSettingsItem:v4];

    id obj = v10;
    id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v26;
      uint64_t v14 = PSValueKey;
      do
      {
        v15 = 0;
        v16 = v8;
        do
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v15);
          v18 = +[VOSSettingsHelper sharedInstance];
          v19 = [v18 formattedValue:v17 withItem:v4];

          v8 = +[PSSpecifier preferenceSpecifierNamed:v19 target:v24 set:0 get:0 detail:0 cell:3 edit:0];

          [v8 setProperty:v17 forKey:v14];
          [v8 setProperty:v4 forKey:@"VOSSettingsItem"];
          [v5 addObject:v8];

          v15 = (char *)v15 + 1;
          v16 = v8;
        }
        while (v12 != v15);
        id v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }

    v20 = *(void **)&v24->PSListController_opaque[v22];
    *(void *)&v24->PSListController_opaque[v22] = v5;

    v3 = *(void **)&v24->PSListController_opaque[v22];
  }

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 deselectRowAtIndexPath:v6 animated:1];
  id v12 = [v7 cellForRowAtIndexPath:v6];

  v8 = [v12 specifier];
  v9 = [v8 propertyForKey:PSValueKey];
  v10 = [v8 propertyForKey:@"VOSSettingsItem"];
  id v11 = +[VOSSettingsHelper sharedInstance];
  [v11 setValue:v9 forSettingsItem:v10];

  [(VOTPickerSettingViewController *)self _updateCellAccessories];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateCellAccessories
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(VOTPickerSettingViewController *)self table];
  v4 = [v3 visibleCells];

  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(VOTPickerSettingViewController *)self _updateCellAccessory:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateCellAccessory:(id)a3
{
  id v3 = a3;
  id v9 = [v3 specifier];
  v4 = [v9 propertyForKey:PSValueKey];
  id v5 = [v9 propertyForKey:@"VOSSettingsItem"];
  id v6 = +[VOSSettingsHelper sharedInstance];
  uint64_t v7 = [v6 valueForSettingsItem:v5];
  if ([v4 isEqual:v7]) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 0;
  }
  [v3 setAccessoryType:v8];
}

@end