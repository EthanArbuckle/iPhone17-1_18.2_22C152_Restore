@interface AKAuthenticationSettingsLauncher
- (BOOL)launchSettingsForContext:(id)a3 withCheckinID:(id)a4;
- (id)_settingsPaneIDForContext:(id)a3;
@end

@implementation AKAuthenticationSettingsLauncher

- (BOOL)launchSettingsForContext:(id)a3 withCheckinID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[AKAccountManager sharedInstance];
  v9 = [v6 UUIDString];

  v10 = +[NSString stringWithFormat:@"prefs:notifyAuthKit=true&authKitContextID=%@", v9];

  v11 = [(AKAuthenticationSettingsLauncher *)self _settingsPaneIDForContext:v7];
  v12 = [v7 username];

  v13 = [v8 iCloudAccountForAppleID:v12];
  if (!v13) {
    goto LABEL_8;
  }
  if (![v8 isPrimaryiCloudAccount:v13])
  {
    if ([(__CFString *)v11 isEqualToString:@"APPLE_ACCOUNT"])
    {
      v15 = [v13 identifier];
      uint64_t v16 = +[NSString stringWithFormat:@"ACCOUNTS_AND_PASSWORDS&path=%@", v15];

      v11 = (__CFString *)v16;
    }
LABEL_8:
    if (!v11) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Overriding Settings landing spot because the Apple ID %@ is used for iCloud.", buf, 0xCu);
  }

  v11 = @"APPLE_ACCOUNT";
LABEL_9:
  v17 = +[NSString stringWithFormat:@"&root=%@", v11];
  uint64_t v18 = [v10 stringByAppendingString:v17];

  v10 = (void *)v18;
LABEL_10:
  v19 = _AKLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Opening internal URL: %@", buf, 0xCu);
  }

  v20 = +[LSApplicationWorkspace defaultWorkspace];
  v21 = +[NSURL URLWithString:v10];
  id v25 = 0;
  [v20 openSensitiveURL:v21 withOptions:0 error:&v25];
  id v22 = v25;

  if (v22)
  {
    v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100186888((uint64_t)v22, v23);
    }
  }
  return v22 == 0;
}

- (id)_settingsPaneIDForContext:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 serviceType] - 1;
  if (v4 < 6 && ((0x3Bu >> v4) & 1) != 0)
  {
    CFStringRef v6 = off_100229550[v4];
  }
  else
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100186900(v3, v5);
    }

    CFStringRef v6 = @"APPLE_ACCOUNT";
  }

  return (id)v6;
}

@end