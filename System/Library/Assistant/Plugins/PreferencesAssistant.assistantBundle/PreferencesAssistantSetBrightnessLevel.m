@interface PreferencesAssistantSetBrightnessLevel
- (void)performWithCompletion:(id)a3;
@end

@implementation PreferencesAssistantSetBrightnessLevel

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  [(PreferencesAssistantSetBrightnessLevel *)self value];
  double v6 = v5;
  +[PSBrightnessSettingsDetail currentValue];
  double v8 = v7;
  unsigned int v9 = [(PreferencesAssistantSetBrightnessLevel *)self increment];
  unsigned int v10 = [(PreferencesAssistantSetBrightnessLevel *)self dryRun];
  if (v9)
  {
    +[PSBrightnessSettingsDetail incrementedBrightnessValue:v6];
    double v6 = v11;
  }
  if (v8 == v6)
  {
    id v12 = objc_alloc_init((Class)SACommandFailed);
    [v12 setErrorCode:SASettingValueUnchangedErrorCode];
    [v12 setReason:@"Value unchanged, No change was made"];
  }
  else
  {
    id v12 = 0;
  }
  if (v12) {
    char v13 = 1;
  }
  else {
    char v13 = v10;
  }
  if ((v13 & 1) == 0)
  {
    if (v9)
    {
      +[PSBrightnessSettingsDetail incrementBrightnessValue:v6];
    }
    else
    {
      +[PSBrightnessSettingsDetail beginBrightnessAdjustmentTransaction];
      +[PSBrightnessSettingsDetail setValue:v6];
      +[PSBrightnessSettingsDetail endBrightnessAdjustmentTransaction];
    }
  }
  v14 = PALogForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v15 = @"Set";
    CFStringRef v16 = @"Dry Run";
    *(_DWORD *)v24 = 138413314;
    if (!v10) {
      CFStringRef v16 = @"Set";
    }
    *(void *)&v24[4] = v16;
    *(_WORD *)&v24[12] = 2112;
    if (v9) {
      CFStringRef v15 = @"Increment";
    }
    *(void *)&v24[14] = v15;
    __int16 v25 = 2048;
    double v26 = v8;
    __int16 v27 = 2048;
    double v28 = v6;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "########## PreferencesAssistantSetBrightnessLevel (%@ / %@ / prev: %f / value: %f / %@)", v24, 0x34u);
  }

  id v17 = v12;
  id v18 = v17;
  if (!v12)
  {
    id v19 = objc_alloc_init((Class)SASettingFloatEntity);
    *(float *)&double v20 = v6;
    [v19 setValue:v20];
    *(float *)&double v21 = v8;
    v22 = +[NSNumber numberWithFloat:v21];
    [v19 setPreviousValue:v22];

    id v18 = objc_alloc_init((Class)SASettingSetFloatResponse);
    [v18 setSetting:v19];
  }
  v23 = objc_msgSend(v18, "dictionary", *(_OWORD *)v24);
  v4[2](v4, v23);
}

@end