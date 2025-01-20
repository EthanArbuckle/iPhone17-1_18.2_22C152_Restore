@interface PreferencesAssistantSetAirplaneMode
- (void)performWithCompletion:(id)a3;
@end

@implementation PreferencesAssistantSetAirplaneMode

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = +[PSAirplaneModeSettingsDetail isEnabled];
  unsigned __int8 v6 = [(PreferencesAssistantSetAirplaneMode *)self failOnSiriDisconnectWarnings];
  if ([(PreferencesAssistantSetAirplaneMode *)self toggle]) {
    id v7 = (id)(v5 ^ 1);
  }
  else {
    id v7 = [(PreferencesAssistantSetAirplaneMode *)self value];
  }
  unsigned int v8 = [(PreferencesAssistantSetAirplaneMode *)self dryRun];
  char v9 = v6 & v7;
  unsigned int v10 = v5 ^ v7 ^ 1;
  if ((v9 & 1) != 0 || v10)
  {
    id v12 = objc_alloc_init((Class)SACommandFailed);
    v11 = v12;
    if ((v7 | v10) == 1)
    {
      if (v7) {
        CFStringRef v13 = @"This action will disconnect the user from reaching Siri Servers.";
      }
      else {
        CFStringRef v13 = @"Value unchanged, No change was made";
      }
      v14 = &SASettingSiriDisconnectErrorCode;
      if (!v7) {
        v14 = &SASettingValueUnchangedErrorCode;
      }
      [v12 setErrorCode:*v14];
      [v11 setReason:v13];
    }
  }
  else
  {
    v11 = 0;
  }
  if (v11) {
    char v15 = 1;
  }
  else {
    char v15 = v8;
  }
  if ((v15 & 1) == 0) {
    +[PSAirplaneModeSettingsDetail setEnabled:v7];
  }
  v16 = PALogForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"Set";
    if (v8) {
      CFStringRef v17 = @"Dry Run";
    }
    *(_DWORD *)v25 = 138413058;
    *(void *)&v25[4] = v17;
    if (v5) {
      CFStringRef v18 = @"ON";
    }
    else {
      CFStringRef v18 = @"OFF";
    }
    *(_WORD *)&v25[12] = 2112;
    *(void *)&v25[14] = v18;
    *(_WORD *)&v25[22] = 2112;
    if (v7) {
      CFStringRef v19 = @"ON";
    }
    else {
      CFStringRef v19 = @"OFF";
    }
    CFStringRef v26 = v19;
    __int16 v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "########## PreferencesAssistantSetAirplaneMode (%@ / prev: %@ / value: %@ / %@)", v25, 0x2Au);
  }

  id v20 = v11;
  id v21 = v20;
  if (!v11)
  {
    id v22 = objc_alloc_init((Class)SASettingBooleanEntity);
    [v22 setValue:v7];
    v23 = +[NSNumber numberWithBool:v5];
    [v22 setPreviousValue:v23];

    id v21 = objc_alloc_init((Class)SASettingSetBoolResponse);
    [v21 setSetting:v22];
  }
  v24 = objc_msgSend(v21, "dictionary", *(_OWORD *)v25, *(void *)&v25[16]);
  v4[2](v4, v24);
}

@end