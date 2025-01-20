@interface MSSPhotoStreamInAccountSettingsController
- (BOOL)_shownFromAccountSettings;
- (void)navigationEventParameters:(id)a3;
@end

@implementation MSSPhotoStreamInAccountSettingsController

- (void)navigationEventParameters:(id)a3
{
  v3 = (void (**)(id, void *, void *))a3;
  v4 = SettingsBaseControllerLocalizedStringResource(@"NAVIGATION_COMPONENT_APPLE_ACCOUNT");
  v8[0] = v4;
  v5 = SettingsBaseControllerLocalizedStringResource(@"NAVIGATION_COMPONENT_ICLOUD");
  v8[1] = v5;
  v6 = +[NSArray arrayWithObjects:v8 count:2];

  v7 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.AppleAccount/ICLOUD_SERVICE/com.apple.Dataclass.CloudPhotos"];
  v3[2](v3, v6, v7);
}

- (BOOL)_shownFromAccountSettings
{
  return 1;
}

@end