@interface PAGetAutoBrightness
- (void)performWithCompletion:(id)a3;
@end

@implementation PAGetAutoBrightness

- (void)performWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  if (+[PSBrightnessSettingsDetail deviceSupportsAutoBrightness])
  {
    id v4 = +[PSBrightnessSettingsDetail autoBrightnessEnabled];
    id v5 = objc_alloc_init((Class)SASettingBooleanEntity);
    [v5 setValue:v4];
    id v6 = objc_alloc_init((Class)SASettingGetBoolResponse);
    [v6 setSetting:v5];
    v7 = PALogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = @"OFF";
      if (v4) {
        CFStringRef v8 = @"ON";
      }
      int v10 = 138412290;
      CFStringRef v11 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "########## PAGetAutoBrightness (%@)", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v6 = objc_alloc_init((Class)SACommandFailed);
    [v6 setErrorCode:SASettingPropertyUnsupportedByDeviceErrorCode];
    [v6 setReason:@"Device does not support ALS"];
  }
  v9 = [v6 dictionary];
  v3[2](v3, v9);
}

@end