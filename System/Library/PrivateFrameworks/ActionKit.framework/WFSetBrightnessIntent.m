@interface WFSetBrightnessIntent
- (Class)settingsClientClass;
- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4;
@end

@implementation WFSetBrightnessIntent

- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFSetBrightnessIntent *)self value];
  [v8 floatValue];
  float v10 = v9;

  v11 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    int v15 = 136315650;
    v16 = "WFPerformDecimalSettingIntent";
    __int16 v17 = 2114;
    v18 = v13;
    __int16 v19 = 2048;
    double v20 = v10;
    _os_log_impl(&dword_23C364000, v11, OS_LOG_TYPE_INFO, "%s Setting %{public}@ to value %f", (uint8_t *)&v15, 0x20u);
  }
  *(float *)&double v14 = v10;
  [v6 setValue:v7 completionHandler:v14];
}

- (Class)settingsClientClass
{
  return (Class)objc_opt_class();
}

@end