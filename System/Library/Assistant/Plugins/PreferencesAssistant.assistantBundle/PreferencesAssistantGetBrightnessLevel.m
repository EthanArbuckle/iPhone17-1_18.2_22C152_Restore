@interface PreferencesAssistantGetBrightnessLevel
- (void)performWithCompletion:(id)a3;
@end

@implementation PreferencesAssistantGetBrightnessLevel

- (void)performWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  +[PSBrightnessSettingsDetail currentValue];
  double v5 = v4;
  id v6 = objc_alloc_init((Class)SASettingFloatEntity);
  *(float *)&double v7 = v5;
  [v6 setValue:v7];
  id v8 = objc_alloc_init((Class)SASettingGetFloatResponse);
  [v8 setSetting:v6];
  v9 = PALogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    double v12 = v5;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "########## PreferencesAssistantGetBrightnessLevel (%f)", (uint8_t *)&v11, 0xCu);
  }

  v10 = [v8 dictionary];
  v3[2](v3, v10);
}

@end