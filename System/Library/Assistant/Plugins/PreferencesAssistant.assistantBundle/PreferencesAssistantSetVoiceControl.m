@interface PreferencesAssistantSetVoiceControl
- (void)performWithCompletion:(id)a3;
@end

@implementation PreferencesAssistantSetVoiceControl

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = +[PSCommandAndControlSettingsDetail isEnabled];
  if ([(PreferencesAssistantSetVoiceControl *)self toggle]) {
    id v6 = (id)(v5 ^ 1);
  }
  else {
    id v6 = [(PreferencesAssistantSetVoiceControl *)self value];
  }
  unsigned int v7 = [(PreferencesAssistantSetVoiceControl *)self dryRun];
  v8 = +[CACPreferences sharedPreferences];
  unsigned __int8 v9 = [v8 didShowOnboarding];

  if (v9)
  {
    if (v5 != v6)
    {
      id v10 = 0;
      goto LABEL_10;
    }
    id v10 = objc_alloc_init((Class)SACommandFailed);
    [v10 setErrorCode:SASettingValueUnchangedErrorCode];
    CFStringRef v11 = @"Value unchanged, No change was made";
  }
  else
  {
    id v10 = objc_alloc_init((Class)SACommandFailed);
    [v10 setErrorCode:SASettingVoiceControlNeverOnboardedErrorCode];
    CFStringRef v11 = @"User has not been onboarded";
  }
  [v10 setReason:v11];
LABEL_10:
  if (v10) {
    char v12 = 1;
  }
  else {
    char v12 = v7;
  }
  if ((v12 & 1) == 0) {
    +[PSCommandAndControlSettingsDetail setEnabled:v6];
  }
  v13 = PALogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"Set";
    if (v7) {
      CFStringRef v14 = @"Dry Run";
    }
    *(_DWORD *)v22 = 138413058;
    *(void *)&v22[4] = v14;
    if (v5) {
      CFStringRef v15 = @"ON";
    }
    else {
      CFStringRef v15 = @"OFF";
    }
    *(_WORD *)&v22[12] = 2112;
    *(void *)&v22[14] = v15;
    *(_WORD *)&v22[22] = 2112;
    if (v6) {
      CFStringRef v16 = @"ON";
    }
    else {
      CFStringRef v16 = @"OFF";
    }
    CFStringRef v23 = v16;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "########## PreferencesAssistantSetVoiceControl (%@ / prev: %@ / value: %@ / %@)", v22, 0x2Au);
  }

  id v17 = v10;
  id v18 = v17;
  if (!v10)
  {
    id v19 = objc_alloc_init((Class)SASettingBooleanEntity);
    [v19 setValue:v6];
    v20 = +[NSNumber numberWithBool:v5];
    [v19 setPreviousValue:v20];

    id v18 = objc_alloc_init((Class)SASettingSetBoolResponse);
    [v18 setSetting:v19];
  }
  v21 = objc_msgSend(v18, "dictionary", *(_OWORD *)v22, *(void *)&v22[16]);
  v4[2](v4, v21);
}

@end