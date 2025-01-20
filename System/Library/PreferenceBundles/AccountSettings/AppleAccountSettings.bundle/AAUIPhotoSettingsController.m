@interface AAUIPhotoSettingsController
- (AAUIPhotoSettingsController)init;
@end

@implementation AAUIPhotoSettingsController

- (AAUIPhotoSettingsController)init
{
  id v3 = +[NSBundle aaui_loadBundle:@"MobileSlideShowSettings.bundle" atPath:@"System/Library/PreferenceBundles"];
  v4 = NSClassFromString(@"MSSPhotoStreamInAccountSettingsController");
  if (v4)
  {
    v5 = (AAUIPhotoSettingsController *)objc_alloc_init(v4);
  }
  else
  {
    v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      CFStringRef v9 = @"MSSPhotoStreamInAccountSettingsController";
      __int16 v10 = 2112;
      CFStringRef v11 = @"MobileSlideShowSettings.bundle";
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AAUIPhotoSettingsController could not find the class %@ in the %@ bundle", (uint8_t *)&v8, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

@end