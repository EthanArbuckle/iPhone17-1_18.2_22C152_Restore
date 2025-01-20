@interface WFSetFlashlightIntent
- (Class)settingsClientClass;
- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4;
@end

@implementation WFSetFlashlightIntent

- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  unint64_t v8 = [(WFSetFlashlightIntent *)self operation];
  v9 = [(WFSetFlashlightIntent *)self state];
  int v10 = [v9 BOOLValue];

  v11 = [(WFSetFlashlightIntent *)self value];
  [v11 floatValue];
  int v13 = v12;

  v14 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    if (v8 > 2) {
      v15 = @"Invalid";
    }
    else {
      v15 = off_264E5B1B8[v8];
    }
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    int v21 = 136315906;
    v22 = "-[WFSetFlashlightIntent(WFSettingIntent) applyWithSettingsClient:completionHandler:]";
    __int16 v23 = 2114;
    v24 = v15;
    __int16 v25 = 2114;
    v26 = v17;
    __int16 v27 = 1024;
    int v28 = v10;
    _os_log_impl(&dword_23C364000, v14, OS_LOG_TYPE_INFO, "%s Applying operation %{public}@ to %{public}@ with state %d", (uint8_t *)&v21, 0x26u);
  }
  if (v8 == 2)
  {
    LODWORD(v18) = v13;
    [v6 toggleWithBrightnessLevel:v7 completionHandler:v18];
  }
  else if (v8 == 1)
  {
    if (v10)
    {
      LODWORD(v18) = v13;
      [v6 turnOnWithBrightnessLevel:v7 completionHandler:v18];
    }
    else
    {
      [v6 turnOffWithCompletionHandler:v7];
    }
  }
  else
  {
    v19 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315138;
      v22 = "-[WFSetFlashlightIntent(WFSettingIntent) applyWithSettingsClient:completionHandler:]";
      _os_log_impl(&dword_23C364000, v19, OS_LOG_TYPE_ERROR, "%s Unknown operation!", (uint8_t *)&v21, 0xCu);
    }

    v20 = WFSettingsClientError();
    v7[2](v7, v20);
  }
}

- (Class)settingsClientClass
{
  return (Class)objc_opt_class();
}

@end