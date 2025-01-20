@interface PreferencesAssistantSetInvertColors
- (void)performWithCompletion:(id)a3;
@end

@implementation PreferencesAssistantSetInvertColors

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = +[PSInvertColorsSettingsDetail isEnabled];
  if ([(PreferencesAssistantSetInvertColors *)self toggle]) {
    id v6 = (id)(v5 ^ 1);
  }
  else {
    id v6 = [(PreferencesAssistantSetInvertColors *)self value];
  }
  unsigned int v7 = [(PreferencesAssistantSetInvertColors *)self dryRun];
  if (v5 == v6)
  {
    id v8 = objc_alloc_init((Class)SACommandFailed);
    [v8 setErrorCode:SASettingValueUnchangedErrorCode];
    [v8 setReason:@"Value unchanged, No change was made"];
    BOOL v9 = v8 == 0;
    if (v8) {
      char v10 = v7;
    }
    else {
      char v10 = 1;
    }
    if ((v10 & 1) == 0)
    {
      +[PSInvertColorsSettingsDetail setEnabled:v6];
      BOOL v9 = 0;
    }
  }
  else
  {
    id v8 = 0;
    BOOL v9 = 1;
  }
  v11 = PALogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"Set";
    if (v7) {
      CFStringRef v12 = @"Dry Run";
    }
    *(_DWORD *)v20 = 138413058;
    *(void *)&v20[4] = v12;
    if (v5) {
      CFStringRef v13 = @"ON";
    }
    else {
      CFStringRef v13 = @"OFF";
    }
    *(_WORD *)&v20[12] = 2112;
    *(void *)&v20[14] = v13;
    *(_WORD *)&v20[22] = 2112;
    if (v6) {
      CFStringRef v14 = @"ON";
    }
    else {
      CFStringRef v14 = @"OFF";
    }
    CFStringRef v21 = v14;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "########## PreferencesAssistantSetInvertColors (%@ / prev: %@ / value: %@ / %@)", v20, 0x2Au);
  }

  id v15 = v8;
  id v16 = v15;
  if (v9)
  {
    id v17 = objc_alloc_init((Class)SASettingBooleanEntity);
    [v17 setValue:v6];
    v18 = +[NSNumber numberWithBool:v5];
    [v17 setPreviousValue:v18];

    id v16 = objc_alloc_init((Class)SASettingSetBoolResponse);
    [v16 setSetting:v17];
  }
  v19 = objc_msgSend(v16, "dictionary", *(_OWORD *)v20, *(void *)&v20[16]);
  v4[2](v4, v19);
}

@end