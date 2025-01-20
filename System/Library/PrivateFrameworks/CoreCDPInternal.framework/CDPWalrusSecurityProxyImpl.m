@interface CDPWalrusSecurityProxyImpl
- (void)setWebAccessStatusEnabled:(BOOL)a3 completion:(id)a4;
- (void)webAccessStatusWithCompletion:(id)a3;
@end

@implementation CDPWalrusSecurityProxyImpl

- (void)webAccessStatusWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = (void (**)(id, void, id))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_accountSettingsLock);
  v4 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  v5 = [v4 cliqueConfiguration];
  id v15 = 0;
  v6 = [MEMORY[0x263F16D30] fetchAccountWideSettingsDefaultWithForceFetch:0 configuration:v5 error:&v15];
  id v7 = v15;
  os_unfair_lock_unlock((os_unfair_lock_t)&_accountSettingsLock);
  v8 = _CDPLogSystem();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CDPWalrusSecurityProxyImpl webAccessStatusWithCompletion:](v7, v9);
    }

    v3[2](v3, 0, v7);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v6 webAccess];
      int v11 = [v10 enabled];
      *(_DWORD *)buf = 67109120;
      int v17 = v11;
      _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "Successfully fetched web access status (%{BOOL}d)", buf, 8u);
    }
    v12 = [v6 webAccess];
    int v13 = [v12 enabled];

    if (v13) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 2;
    }
    v3[2](v3, v14, 0);
  }
}

- (void)setWebAccessStatusEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, id))a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_accountSettingsLock);
  v6 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  id v7 = [v6 cliqueConfiguration];
  id v18 = 0;
  v8 = [MEMORY[0x263F16D30] fetchAccountWideSettingsDefaultWithForceFetch:0 configuration:v7 error:&v18];
  id v9 = v18;
  if (v9)
  {
    id v10 = v9;
    int v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CDPWalrusSecurityProxyImpl setWebAccessStatusEnabled:completion:]((uint64_t)v10, v11);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&_accountSettingsLock);
    v5[2](v5, v10);
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x263F5B758]);
    [v12 setEnabled:v4];
    [v8 setWebAccess:v12];
    int v13 = (void *)[objc_alloc(MEMORY[0x263F16D30]) initWithContextData:v7];
    id v17 = 0;
    int v14 = [v13 setAccountSetting:v8 error:&v17];
    id v10 = v17;
    id v15 = _CDPLogSystem();
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v20 = v4;
        _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Successfully updated web access status (%{BOOL}d).", buf, 8u);
      }

      +[CDPBroadcaster broadcastWebAccessStateChangeNotification];
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CDPWalrusSecurityProxyImpl setWebAccessStatusEnabled:completion:](v4, v10, v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_accountSettingsLock);
    v5[2](v5, v10);

    v5 = (void (**)(id, id))v12;
  }
}

- (void)webAccessStatusWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 description];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch web access status with error: %@", (uint8_t *)&v4, 0xCu);
}

- (void)setWebAccessStatusEnabled:(NSObject *)a3 completion:.cold.1(char a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = a1 & 1;
  v5 = [a2 description];
  v6[0] = 67109378;
  v6[1] = v4;
  __int16 v7 = 2112;
  v8 = v5;
  _os_log_error_impl(&dword_218640000, a3, OS_LOG_TYPE_ERROR, "Failed to update web access status (%{BOOL}d) with error: %@", (uint8_t *)v6, 0x12u);
}

- (void)setWebAccessStatusEnabled:(uint64_t)a1 completion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch existing account settings with error: %@", (uint8_t *)&v2, 0xCu);
}

@end