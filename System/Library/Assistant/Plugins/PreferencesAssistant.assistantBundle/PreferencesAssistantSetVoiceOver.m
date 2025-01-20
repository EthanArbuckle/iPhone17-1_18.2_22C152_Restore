@interface PreferencesAssistantSetVoiceOver
- (void)performWithCompletion:(id)a3;
@end

@implementation PreferencesAssistantSetVoiceOver

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = +[PSVoiceOverSettingsDetail isEnabled];
  if ([(PreferencesAssistantSetVoiceOver *)self toggle]) {
    id v6 = (id)(v5 ^ 1);
  }
  else {
    id v6 = [(PreferencesAssistantSetVoiceOver *)self value];
  }
  unsigned int v7 = [(PreferencesAssistantSetVoiceOver *)self dryRun];
  if (v5 == v6)
  {
    id v8 = objc_alloc_init((Class)SACommandFailed);
    [v8 setErrorCode:SASettingValueUnchangedErrorCode];
    [v8 setReason:@"Value unchanged, No change was made"];
  }
  else
  {
    id v8 = 0;
  }
  if (v8) {
    char v9 = 1;
  }
  else {
    char v9 = v7;
  }
  if ((v9 & 1) == 0) {
    +[PSVoiceOverSettingsDetail setEnabled:v6];
  }
  v10 = PALogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"Set";
    if (v7) {
      CFStringRef v11 = @"Dry Run";
    }
    *(_DWORD *)v19 = 138413058;
    *(void *)&v19[4] = v11;
    if (v5) {
      CFStringRef v12 = @"ON";
    }
    else {
      CFStringRef v12 = @"OFF";
    }
    *(_WORD *)&v19[12] = 2112;
    *(void *)&v19[14] = v12;
    *(_WORD *)&v19[22] = 2112;
    if (v6) {
      CFStringRef v13 = @"ON";
    }
    else {
      CFStringRef v13 = @"OFF";
    }
    CFStringRef v20 = v13;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "########## PreferencesAssistantSetVoiceOver (%@ / prev: %@ / value: %@ / %@)", v19, 0x2Au);
  }

  id v14 = v8;
  id v15 = v14;
  if (!v8)
  {
    id v16 = objc_alloc_init((Class)SASettingBooleanEntity);
    [v16 setValue:v6];
    v17 = +[NSNumber numberWithBool:v5];
    [v16 setPreviousValue:v17];

    id v15 = objc_alloc_init((Class)SASettingSetBoolResponse);
    [v15 setSetting:v16];
  }
  v18 = objc_msgSend(v15, "dictionary", *(_OWORD *)v19, *(void *)&v19[16]);
  v4[2](v4, v18);
}

@end