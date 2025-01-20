@interface PreferencesAssistantSetGuidedAccess
- (void)performWithCompletion:(id)a3;
@end

@implementation PreferencesAssistantSetGuidedAccess

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (([(PreferencesAssistantSetGuidedAccess *)self toggle] & 1) != 0
    || [(PreferencesAssistantSetGuidedAccess *)self value])
  {
    v5 = (int *)+[PSGuidedAccessSettingsDetail guidedAccessAvailability];
    if (v5 == &dword_C)
    {
      +[PSGuidedAccessSettingsDetail setGuidedAccessSwitchEnabled:1];
      v5 = (int *)+[PSGuidedAccessSettingsDetail guidedAccessAvailability];
    }
    CFStringRef v6 = &stru_107C0;
    uint64_t v7 = -1;
    uint64_t v8 = 1;
    switch((unint64_t)v5)
    {
      case 0uLL:
        goto LABEL_8;
      case 1uLL:
      case 2uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 0xCuLL:
        uint64_t v7 = SASettingGuidedAccessTemporarilyUnavailableErrorCode;
        CFStringRef v6 = @"Guided Access not available Right Now";
        break;
      case 3uLL:
        uint64_t v7 = SASettingGuidedAccessUnavailableInRestoreOrUpdateErrorCode;
        CFStringRef v6 = @"Guided Access not available while restoring or updating";
        break;
      case 7uLL:
      case 8uLL:
      case 9uLL:
        uint64_t v7 = SASettingGuidedAccessUnavailableForAppErrorCode;
        CFStringRef v6 = @"Guided Access can not be started over this application";
        break;
      case 0xBuLL:
        uint64_t v7 = SASettingGuidedAccessPasscodeRequiredErrorCode;
        CFStringRef v6 = @"Guided Access requires a pin code to be set.";
        break;
      default:
        break;
    }
    id v9 = objc_alloc_init((Class)SACommandFailed);
    [v9 setErrorCode:v7];
    [v9 setReason:v6];
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
LABEL_8:
    +[PSGuidedAccessSettingsDetail enterGuidedAccessMode];
    id v9 = 0;
  }
  v10 = PALogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [(PreferencesAssistantSetGuidedAccess *)self dryRun];
    CFStringRef v12 = @"Set";
    if (v11) {
      CFStringRef v12 = @"Dry Run";
    }
    *(_DWORD *)v19 = 138413058;
    *(void *)&v19[4] = v12;
    CFStringRef v13 = @"ON";
    *(_WORD *)&v19[12] = 2112;
    *(void *)&v19[14] = @"OFF";
    *(_WORD *)&v19[22] = 2112;
    if (!v8) {
      CFStringRef v13 = @"OFF";
    }
    CFStringRef v20 = v13;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "########## PreferencesAssistantSetGuidedAccess (%@ / prev: %@ / value: %@ / %@)", v19, 0x2Au);
  }

  id v14 = v9;
  id v15 = v14;
  if (!v14)
  {
    id v16 = objc_alloc_init((Class)SASettingBooleanEntity);
    [v16 setValue:v8];
    v17 = +[NSNumber numberWithBool:0];
    [v16 setPreviousValue:v17];

    id v15 = objc_alloc_init((Class)SASettingSetBoolResponse);
    [v15 setSetting:v16];
  }
  v18 = objc_msgSend(v15, "dictionary", *(_OWORD *)v19, *(void *)&v19[16]);
  v4[2](v4, v18);
}

@end