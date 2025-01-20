@interface PASetPrivacyLocationService
- (void)performWithCompletion:(id)a3;
@end

@implementation PASetPrivacyLocationService

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = +[PSLocationServicesSettingsDetail isEnabled];
  if ([(PASetPrivacyLocationService *)self toggle]) {
    id v6 = (id)(v5 ^ 1);
  }
  else {
    id v6 = [(PASetPrivacyLocationService *)self value];
  }
  unsigned int v7 = [(PASetPrivacyLocationService *)self dryRun];
  if (v5 == v6)
  {
    id v8 = objc_alloc_init((Class)SACommandFailed);
    [v8 setErrorCode:SASettingValueUnchangedErrorCode];
    [v8 setReason:@"Value unchanged, No change was made"];
    if ([(PASetPrivacyLocationService *)self userConfirmed]) {
      goto LABEL_8;
    }
    if (v8)
    {
      id v15 = 0;
      goto LABEL_29;
    }
LABEL_27:
    id v16 = objc_alloc_init((Class)SACommandFailed);
    [v16 setErrorCode:SASettingLocationServiceChangeRequiresConfirmationErrorCode];
    [v16 setReason:@"User did not confirm Location Services change"];
    id v8 = v16;
    id v15 = v8;
    goto LABEL_29;
  }
  if (![(PASetPrivacyLocationService *)self userConfirmed]) {
    goto LABEL_27;
  }
  id v8 = 0;
LABEL_8:
  if (v8) {
    char v9 = 1;
  }
  else {
    char v9 = v7;
  }
  if ((v9 & 1) == 0) {
    +[PSLocationServicesSettingsDetail setEnabled:v6];
  }
  v10 = PALogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"Set";
    if (v7) {
      CFStringRef v11 = @"Dry Run";
    }
    *(_DWORD *)v20 = 138413058;
    *(void *)&v20[4] = v11;
    if (v5) {
      CFStringRef v12 = @"ON";
    }
    else {
      CFStringRef v12 = @"OFF";
    }
    *(_WORD *)&v20[12] = 2112;
    *(void *)&v20[14] = v12;
    *(_WORD *)&v20[22] = 2112;
    if (v6) {
      CFStringRef v13 = @"ON";
    }
    else {
      CFStringRef v13 = @"OFF";
    }
    CFStringRef v21 = v13;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "########## PASetPrivacyLocationService (%@ / prev: %@ / value: %@ / %@)", v20, 0x2Au);
  }

  id v14 = v8;
  if (v8)
  {
    id v15 = v14;
    id v8 = v14;
  }
  else
  {
    id v17 = objc_alloc_init((Class)SASettingBooleanEntity);
    [v17 setValue:v6];
    v18 = +[NSNumber numberWithBool:v5];
    [v17 setPreviousValue:v18];

    id v15 = objc_alloc_init((Class)SASettingSetBoolResponse);
    [v15 setSetting:v17];

    id v8 = 0;
  }
LABEL_29:
  v19 = objc_msgSend(v15, "dictionary", *(_OWORD *)v20, *(void *)&v20[16]);
  v4[2](v4, v19);
}

@end