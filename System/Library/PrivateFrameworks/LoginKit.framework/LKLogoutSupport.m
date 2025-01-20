@interface LKLogoutSupport
- (BOOL)_canLogoutToLoginSession;
- (BOOL)isCurrentUserAnonymous;
- (LKLogoutSupport)init;
- (UMUserSwitchBlockingTask)syncTask;
- (id)logoutWarningMessage;
- (void)_syncPreferencesIfNeeded;
- (void)logoutToLoginSessionWithCompletionHandler:(id)a3;
- (void)logoutToLoginUserWithCompletionHandler:(id)a3;
- (void)logoutToLoginWindowWithCompletionHandler:(id)a3;
- (void)setSyncTask:(id)a3;
@end

@implementation LKLogoutSupport

- (LKLogoutSupport)init
{
  v4.receiver = self;
  v4.super_class = (Class)LKLogoutSupport;
  v2 = [(LKLogoutSupport *)&v4 init];
  if (v2) {
    LKRegisterLoginKitLogging();
  }
  return v2;
}

- (BOOL)_canLogoutToLoginSession
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F841B0] sharedManager];
  v3 = [v2 loginUser];

  objc_super v4 = [MEMORY[0x263EFF960] currentLocale];
  v5 = [v4 localeIdentifier];

  v6 = [v3 userAuxiliaryString];
  int v7 = [v6 isEqualToString:v5];

  if ((v7 & 1) == 0)
  {
    v8 = (void *)LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = [v3 userAuxiliaryString];
      int v19 = 138412546;
      v20 = v5;
      __int16 v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_2221A9000, v9, OS_LOG_TYPE_DEFAULT, "User locale (%@) is different from login user locale (%@)", (uint8_t *)&v19, 0x16u);
    }
  }
  int CanSupportLoginUI = _AXSCurrentAccessibilitySettingsCanSupportLoginUI();
  if (!CanSupportLoginUI)
  {
    v12 = LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_2221A9000, v12, OS_LOG_TYPE_DEFAULT, "Accessibility settings are on for user", (uint8_t *)&v19, 2u);
    }
  }
  v13 = [MEMORY[0x263F841B0] sharedManager];
  v14 = [v13 currentUser];
  char v15 = [v14 isAuditor];

  char v16 = v15 ^ 1;
  if (!CanSupportLoginUI) {
    char v16 = 0;
  }
  if (v7) {
    BOOL v17 = v16;
  }
  else {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)logoutToLoginSessionWithCompletionHandler:(id)a3
{
  id v3 = a3;
  objc_super v4 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2221A9000, v4, OS_LOG_TYPE_DEFAULT, "Switch to the login session", v6, 2u);
  }
  kdebug_trace();
  v5 = [MEMORY[0x263F841B0] sharedManager];
  [v5 logoutToLoginSessionWithCompletionHandler:v3];
}

- (void)logoutToLoginUserWithCompletionHandler:(id)a3
{
  id v3 = a3;
  objc_super v4 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2221A9000, v4, OS_LOG_TYPE_DEFAULT, "Switch to the login user", v6, 2u);
  }
  kdebug_trace();
  v5 = [MEMORY[0x263F841B0] sharedManager];
  [v5 switchToLoginUserWithCompletionHandler:v3];
}

- (void)_syncPreferencesIfNeeded
{
  if (_os_feature_enabled_impl())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__LKLogoutSupport__syncPreferencesIfNeeded__block_invoke;
    block[3] = &unk_2645FC458;
    block[4] = self;
    if (_syncPreferencesIfNeeded_onceToken != -1) {
      dispatch_once(&_syncPreferencesIfNeeded_onceToken, block);
    }
  }
}

void __43__LKLogoutSupport__syncPreferencesIfNeeded__block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F841B0] sharedManager];
  id v3 = [v2 currentUser];

  if (([v3 isTransientUser] & 1) == 0 && (objc_msgSend(v3, "isAuditor") & 1) == 0)
  {
    uint64_t v21 = a1;
    objc_super v4 = +[LKUniversalDiskStorage sharedStorage];
    v22 = [v4 retrieveValueForKey:@"com.apple.idms.config.ApplicationPreferences"];

    v5 = +[LKUniversalDiskStorage sharedStorage];
    v30[0] = @"com.apple.idms.config.ApplicationPreferences";
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    [v5 clearKeys:v6];

    int v7 = objc_opt_new();
    if (!_AXSCurrentAccessibilitySettingsCanSupportLoginUI())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v8 = [&unk_26D4947F0 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v26;
        CFStringRef v11 = (const __CFString *)*MEMORY[0x263EFFE70];
        CFStringRef v12 = (const __CFString *)*MEMORY[0x263EFFE68];
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v26 != v10) {
              objc_enumerationMutation(&unk_26D4947F0);
            }
            CFStringRef v14 = *(const __CFString **)(*((void *)&v25 + 1) + 8 * i);
            CFDictionaryRef v15 = CFPreferencesCopyMultiple(0, v14, v11, v12);
            [v7 setObject:v15 forKeyedSubscript:v14];
          }
          uint64_t v9 = [&unk_26D4947F0 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v9);
      }
    }
    if (([v7 isEqualToDictionary:v22] & 1) == 0
      && ([v7 count] || objc_msgSend(v22, "count")))
    {
      kdebug_trace();
      BOOL v17 = [MEMORY[0x263F841D0] taskWithName:@"Upload preferences to idMS" reason:@"Upload preferences to idMS"];
      [*(id *)(v21 + 32) setSyncTask:v17];

      v18 = [*(id *)(v21 + 32) syncTask];
      [v18 begin];

      id v19 = objc_alloc_init(MEMORY[0x263F29118]);
      v20 = [v3 alternateDSID];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __43__LKLogoutSupport__syncPreferencesIfNeeded__block_invoke_12;
      v23[3] = &unk_2645FC6C8;
      v23[4] = *(void *)(v21 + 32);
      [v19 setConfigurationInfo:v7 forIdentifier:@"com.apple.idms.config.ApplicationPreferences" forAltDSID:v20 completion:v23];
    }
    else
    {
      char v16 = LKLogDefault;
      if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2221A9000, v16, OS_LOG_TYPE_DEFAULT, "idMS has the latest preferences already. No need to sync anything.", buf, 2u);
      }
    }
  }
}

void __43__LKLogoutSupport__syncPreferencesIfNeeded__block_invoke_12(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_2221A9000, v6, OS_LOG_TYPE_DEFAULT, "Wrote preferences data to IdMS, success = %d, error = %{public}@", (uint8_t *)v8, 0x12u);
  }
  int v7 = [*(id *)(a1 + 32) syncTask];
  [v7 end];

  [*(id *)(a1 + 32) setSyncTask:0];
  kdebug_trace();
}

- (void)logoutToLoginWindowWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(LKLogoutSupport *)self _syncPreferencesIfNeeded];
  if ([(LKLogoutSupport *)self _canLogoutToLoginSession]) {
    [(LKLogoutSupport *)self logoutToLoginSessionWithCompletionHandler:v4];
  }
  else {
    [(LKLogoutSupport *)self logoutToLoginUserWithCompletionHandler:v4];
  }
}

- (id)logoutWarningMessage
{
  if ([(LKLogoutSupport *)self isCurrentUserAnonymous])
  {
    v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v3 = [v2 localizedStringForKey:@"Data will not be saved." value:&stru_26D490708 table:0];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)isCurrentUserAnonymous
{
  v2 = [MEMORY[0x263F841B0] sharedManager];
  id v3 = [v2 currentUser];

  LOBYTE(v2) = [v3 isTransientUser];
  return (char)v2;
}

- (UMUserSwitchBlockingTask)syncTask
{
  return self->_syncTask;
}

- (void)setSyncTask:(id)a3
{
}

- (void).cxx_destruct
{
}

@end