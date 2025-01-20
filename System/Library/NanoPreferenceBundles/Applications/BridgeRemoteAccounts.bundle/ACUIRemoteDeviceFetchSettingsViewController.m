@interface ACUIRemoteDeviceFetchSettingsViewController
- (ACUIRemoteDeviceSettingsController)settingsController;
- (id)_options;
- (id)specifiers;
- (id)title;
- (int)currentSetting;
- (int)pollingInterval;
- (void)setCurrentSetting:(int)a3;
- (void)setPollingInterval:(int)a3;
- (void)setSettingsController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation ACUIRemoteDeviceFetchSettingsViewController

- (id)title
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"FETCH" value:&stru_187E8 table:@"Localizable"];

  return v4;
}

- (void)viewDidLoad
{
  v6 = self;
  location[1] = (id)a2;
  id v3 = [(ACUIRemoteDeviceFetchSettingsViewController *)self specifier];
  id v2 = [v3 userInfo];
  location[0] = [v2 objectForKeyedSubscript:ACUIRemoteSettingsControllerKey];

  if (location[0]) {
    objc_storeStrong((id *)&v6->_settingsController, location[0]);
  }
  v4.receiver = v6;
  v4.super_class = (Class)ACUIRemoteDeviceFetchSettingsViewController;
  [(ACUIRemoteDeviceFetchSettingsViewController *)&v4 viewDidLoad];
  objc_storeStrong(location, 0);
}

- (id)specifiers
{
  v23 = self;
  v22[1] = (id)a2;
  if (!*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    v22[0] = (id)objc_opt_new();
    id v21 = +[PSSpecifier groupSpecifierWithID:@"fetchSettingPicker"];
    [v21 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    [v22[0] addObject:v21];
    memset(__b, 0, 0x40uLL);
    id obj = [(ACUIRemoteDeviceFetchSettingsViewController *)v23 _options];
    id v17 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
    if (v17)
    {
      uint64_t v13 = *(void *)__b[2];
      uint64_t v14 = 0;
      id v15 = v17;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)__b[2] != v13) {
          objc_enumerationMutation(obj);
        }
        __b[8] = *(void *)(__b[1] + 8 * v14);
        unsigned int v19 = 0;
        unsigned int v19 = ACUIFetchSettingFromNumber();
        id v9 = (id)ACUIFetchSettingTitle();
        id v18 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

        v10 = [(ACUIRemoteDeviceFetchSettingsViewController *)v23 settingsController];
        unsigned int v11 = [(ACUIRemoteDeviceSettingsController *)v10 pollInterval];

        if (v19 == v11) {
          [v21 setProperty:v18 forKey:PSRadioGroupCheckedSpecifierKey];
        }
        id v7 = v18;
        v8 = +[NSNumber numberWithInt:v19];
        objc_msgSend(v7, "setProperty:forKey:");

        [v22[0] addObject:v18];
        objc_storeStrong(&v18, 0);
        ++v14;
        if (v12 + 1 >= (unint64_t)v15)
        {
          uint64_t v14 = 0;
          id v15 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }

    id v2 = [v22[0] copy];
    id v3 = (void **)&v23->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    objc_super v4 = *v3;
    NSBundle *v3 = v2;

    objc_storeStrong(&v21, 0);
    objc_storeStrong(v22, 0);
  }
  v5 = *(void **)&v23->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = [(ACUIRemoteDeviceFetchSettingsViewController *)v14 specifierAtIndexPath:v12];
  id v10 = [v11 propertyForKey:PSValueKey];
  id v9 = (id)_ACUILogSystem();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    sub_220C((uint64_t)v15, (uint64_t)"-[ACUIRemoteDeviceFetchSettingsViewController tableView:didSelectRowAtIndexPath:]", 72, (uint64_t)v10);
    _os_log_impl(&def_10DA8, (os_log_t)v9, v8, "%s (%d) @\"User selected new fetch setting: %{public}@\"", v15, 0x1Cu);
  }
  objc_storeStrong(&v9, 0);
  unsigned int v7 = ACUIFetchSettingFromNumber();
  objc_super v4 = [(ACUIRemoteDeviceFetchSettingsViewController *)v14 settingsController];
  [(ACUIRemoteDeviceSettingsController *)v4 setPollInterval:v7];

  v6.receiver = v14;
  v6.super_class = (Class)ACUIRemoteDeviceFetchSettingsViewController;
  [(ACUIRemoteDeviceFetchSettingsViewController *)&v6 tableView:location[0] didSelectRowAtIndexPath:v12];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (id)_options
{
  return &off_18F88;
}

- (ACUIRemoteDeviceSettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (int)pollingInterval
{
  return self->_pollingInterval;
}

- (void)setPollingInterval:(int)a3
{
  self->_pollingInterval = a3;
}

- (int)currentSetting
{
  return self->_currentSetting;
}

- (void)setCurrentSetting:(int)a3
{
  self->_currentSetting = a3;
}

- (void).cxx_destruct
{
}

@end