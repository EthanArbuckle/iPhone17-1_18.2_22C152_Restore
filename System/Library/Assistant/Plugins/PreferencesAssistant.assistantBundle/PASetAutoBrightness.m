@interface PASetAutoBrightness
- (void)performWithCompletion:(id)a3;
@end

@implementation PASetAutoBrightness

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (+[PSBrightnessSettingsDetail deviceSupportsAutoBrightness])
  {
    id v5 = +[PSBrightnessSettingsDetail autoBrightnessEnabled];
    if ([(PASetAutoBrightness *)self toggle]) {
      id v6 = (id)(v5 ^ 1);
    }
    else {
      id v6 = [(PASetAutoBrightness *)self value];
    }
    unsigned int v10 = [(PASetAutoBrightness *)self dryRun];
    if (v5 == v6)
    {
      id v11 = objc_alloc_init((Class)SACommandFailed);
      [v11 setErrorCode:SASettingValueUnchangedErrorCode];
      [v11 setReason:@"Value unchanged, No change was made"];
      BOOL v12 = v11 == 0;
      if (v11) {
        char v13 = v10;
      }
      else {
        char v13 = 1;
      }
      if ((v13 & 1) == 0)
      {
        +[PSBrightnessSettingsDetail setAutoBrightnessEnabled:v6];
        BOOL v12 = 0;
      }
    }
    else
    {
      id v11 = 0;
      BOOL v12 = 1;
    }
    v14 = PALogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v15 = @"Set";
      if (v10) {
        CFStringRef v15 = @"Dry Run";
      }
      *(_DWORD *)v22 = 138413058;
      *(void *)&v22[4] = v15;
      if (v5) {
        CFStringRef v16 = @"ON";
      }
      else {
        CFStringRef v16 = @"OFF";
      }
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v16;
      *(_WORD *)&v22[22] = 2112;
      if (v6) {
        CFStringRef v17 = @"ON";
      }
      else {
        CFStringRef v17 = @"OFF";
      }
      CFStringRef v23 = v17;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "########## PASetAutoBrightness (%@ / prev: %@ / value: %@ / %@)", v22, 0x2Au);
    }

    id v18 = v11;
    id v8 = v18;
    if (v12)
    {
      id v19 = objc_alloc_init((Class)SASettingBooleanEntity);
      [v19 setValue:v6];
      v20 = +[NSNumber numberWithBool:v5];
      [v19 setPreviousValue:v20];

      id v9 = objc_alloc_init((Class)SASettingSetBoolResponse);
      [v9 setSetting:v19];
    }
    else
    {
      id v9 = v18;
    }
  }
  else
  {
    id v7 = objc_alloc_init((Class)SACommandFailed);
    [v7 setErrorCode:SASettingPropertyUnsupportedByDeviceErrorCode];
    [v7 setReason:@"Device does not support ALS"];
    id v8 = v7;
    id v9 = v8;
  }
  v21 = objc_msgSend(v9, "dictionary", *(_OWORD *)v22, *(void *)&v22[16]);
  v4[2](v4, v21);
}

@end