@interface PreferencesAssistantSetLowPowerMode
- (BOOL)isLowPowerModeSupported;
- (void)performWithCompletion:(id)a3;
@end

@implementation PreferencesAssistantSetLowPowerMode

- (BOOL)isLowPowerModeSupported
{
  CFStringRef v2 = (const __CFString *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  CFStringRef v3 = v2;
  BOOL v4 = CFEqual(v2, @"iPhone");
  CFRelease(v3);
  return v4;
}

- (void)performWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id v5 = +[PSLowPowerModeSettingsDetail isEnabled];
  if (![(PreferencesAssistantSetLowPowerMode *)self isLowPowerModeSupported])
  {
    id v14 = objc_alloc_init((Class)SACommandFailed);
    [v14 setErrorCode:SASettingPropertyUnsupportedByDeviceErrorCode];
    [v14 setReason:@"Device does not support Low Power Mode"];
    id v7 = [v14 dictionary];
    v4[2](v4, v7);
    goto LABEL_18;
  }
  if ([(PreferencesAssistantSetLowPowerMode *)self toggle]) {
    id v6 = (id)(v5 ^ 1);
  }
  else {
    id v6 = [(PreferencesAssistantSetLowPowerMode *)self value];
  }
  unsigned __int8 v8 = [(PreferencesAssistantSetLowPowerMode *)self dryRun];
  if (v5 == v6)
  {
    id v7 = objc_alloc_init((Class)SACommandFailed);
    [v7 setErrorCode:SASettingValueUnchangedErrorCode];
    [v7 setReason:@"Value unchanged, No change was made"];
  }
  else
  {
    id v7 = 0;
  }
  if (v7) {
    char v9 = 1;
  }
  else {
    char v9 = v8;
  }
  if ((v9 & 1) == 0)
  {
    +[PSLowPowerModeSettingsDetail setEnabled:v6];
LABEL_16:
    id v11 = objc_alloc_init((Class)SASettingBooleanEntity);
    [v11 setValue:v6];
    v12 = +[NSNumber numberWithBool:v5];
    [v11 setPreviousValue:v12];

    id v15 = objc_alloc_init((Class)SASettingSetBoolResponse);
    [v15 setSetting:v11];

    id v10 = v15;
    goto LABEL_17;
  }
  id v10 = v7;
  if (!v7) {
    goto LABEL_16;
  }
LABEL_17:
  id v14 = v10;
  uint64_t v13 = [v10 dictionary];
  v4[2](v4, (id)v13);

  BOOL v4 = (void (**)(id, id))v13;
LABEL_18:
}

@end