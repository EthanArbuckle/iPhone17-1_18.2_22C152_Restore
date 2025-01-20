@interface CameraSlomoSettingsController
- (id)itemsFromParent;
- (void)emitNavigationEvent;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CameraSlomoSettingsController

- (id)itemsFromParent
{
  v14.receiver = self;
  v14.super_class = (Class)CameraSlomoSettingsController;
  v3 = [(CameraSlomoSettingsController *)&v14 itemsFromParent];
  v4 = +[NSMutableArray arrayWithArray:v3];

  [v4 enumerateObjectsUsingBlock:&stru_20950];
  v5 = +[CAMCaptureCapabilities capabilities];
  unsigned __int8 v6 = [v5 deviceSupportsCTM];

  v7 = +[UIDevice currentDevice];
  v8 = (char *)[v7 userInterfaceIdiom];

  if ((v6 & 1) == 0 && v8 != (unsigned char *)&dword_0 + 1)
  {
    v9 = sub_14BC4(@"CAM_ENABLE_VIDEO_CONFIGURATION_CONTROL_TITLE");
    v10 = sub_14BC4(@"CAM_ENABLE_VIDEO_CONFIGURATION_CONTROL_FOOTER");
    v11 = +[PSSpecifier groupSpecifierWithName:0];
    [v11 setProperty:v10 forKey:PSFooterTextGroupKey];
    [v4 addObject:v11];
    v12 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];
    [v12 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v12 setObject:@"CAMUserPreferenceEnableVideoConfigurationControl" forKeyedSubscript:PSKeyNameKey];
    [v12 setObject:&__kCFBooleanFalse forKeyedSubscript:PSDefaultValueKey];
    [v4 addObject:v12];
  }

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CameraSlomoSettingsController;
  [(CameraSlomoSettingsController *)&v4 viewDidAppear:a3];
  [(CameraSlomoSettingsController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  v3 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Camera/CameraSlomoSettingsList"];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  v5 = +[NSLocale currentLocale];
  unsigned __int8 v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"CAM_RECORD_SLOMO_TITLE" table:@"CameraSettings" locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  v10 = +[NSLocale currentLocale];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  id v13 = [v9 initWithKey:@"CAMERA_SETTINGS_TITLE" table:@"CameraSettings" locale:v10 bundleURL:v12];

  id v15 = v13;
  objc_super v14 = +[NSArray arrayWithObjects:&v15 count:1];
  [(CameraSlomoSettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.camera" title:v8 localizedNavigationComponents:v14 deepLink:v3];
}

@end