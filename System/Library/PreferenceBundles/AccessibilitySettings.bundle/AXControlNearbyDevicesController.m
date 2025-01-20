@interface AXControlNearbyDevicesController
- (id)specifiers;
- (void)launchControlNearbyDevices;
@end

@implementation AXControlNearbyDevicesController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier emptyGroupSpecifier];
    v7 = settingsLocString(@"CONTROL_NEARBY_DEVICES_FOOTER", @"Accessibility");
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    v8 = settingsLocString(@"CONTROL_NEARBY_DEVICES_BUTTON", @"Accessibility");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v9 setButtonAction:"launchControlNearbyDevices"];
    [v9 setProperty:@"CONTROL_NEARBY_DEVICES" forKey:PSIDKey];
    [v9 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v5 addObject:v9];
    v10 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
    *(void *)&self->super.AXUISettingsListController_opaque[v3] = v5;

    v4 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
  }

  return v4;
}

- (void)launchControlNearbyDevices
{
}

@end