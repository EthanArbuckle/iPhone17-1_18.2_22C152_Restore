@interface DAEASOAuthMigrationActivity
+ (BOOL)profileMigrationDisabled;
+ (BOOL)profileMigrationEnabled;
- (BOOL)_isExchangeBasicAccount:(id)a3;
- (NSBackgroundActivityScheduler)scheduler;
- (id)_migrationDecisionString:(unint64_t)a3;
- (id)_serverMigrationStatus;
- (id)_triggerAccountMigration;
- (unint64_t)_migrateExchangeAccountToOAuthDecision:(id)a3 disallowedDomains:(id)a4 disallowedHosts:(id)a5;
- (void)_retrieveMigrationStatusFromConfigurationURI:(id)a3 withCompletion:(id)a4;
- (void)_sendAnalyticsForMigratingAccount:(id)a3 withStatus:(id)a4;
- (void)invalidateActivity;
- (void)scheduleActivity;
- (void)setScheduler:(id)a3;
@end

@implementation DAEASOAuthMigrationActivity

- (void)scheduleActivity
{
  v3 = [(DAEASOAuthMigrationActivity *)self scheduler];

  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F086C0]) initWithIdentifier:@"com.apple.exchangesync.DAEASOAuthMigrationActivity"];
    [(DAEASOAuthMigrationActivity *)self setScheduler:v4];

    v5 = [(DAEASOAuthMigrationActivity *)self scheduler];
    [v5 setRepeats:1];

    if (+[DAEASOAuthMigrationActivity profileMigrationEnabled])
    {
      double v6 = *MEMORY[0x263F3B8F8];
      v7 = [(DAEASOAuthMigrationActivity *)self scheduler];
      [v7 setInterval:v6];

      double v8 = *MEMORY[0x263F3B908];
      v9 = [(DAEASOAuthMigrationActivity *)self scheduler];
      [v9 setTolerance:v8];

      v10 = [(DAEASOAuthMigrationActivity *)self scheduler];
      v11 = v10;
      uint64_t v12 = 33;
    }
    else
    {
      double v13 = *MEMORY[0x263F3B8F0];
      v14 = [(DAEASOAuthMigrationActivity *)self scheduler];
      [v14 setInterval:v13];

      double v15 = *MEMORY[0x263F3B900];
      v16 = [(DAEASOAuthMigrationActivity *)self scheduler];
      [v16 setTolerance:v15];

      v10 = [(DAEASOAuthMigrationActivity *)self scheduler];
      v11 = v10;
      uint64_t v12 = 9;
    }
    [v10 setQualityOfService:v12];

    id v18 = [(DAEASOAuthMigrationActivity *)self scheduler];
    v17 = [(DAEASOAuthMigrationActivity *)self _triggerAccountMigration];
    [v18 scheduleWithBlock:v17];
  }
}

- (void)invalidateActivity
{
  v3 = [(DAEASOAuthMigrationActivity *)self scheduler];

  if (v3)
  {
    v4 = [(DAEASOAuthMigrationActivity *)self scheduler];
    [v4 invalidate];

    [(DAEASOAuthMigrationActivity *)self setScheduler:0];
  }
}

- (void)_retrieveMigrationStatusFromConfigurationURI:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = dispatch_get_global_queue(25, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__DAEASOAuthMigrationActivity__retrieveMigrationStatusFromConfigurationURI_withCompletion___block_invoke;
  v10[3] = &unk_26490AAA0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __91__DAEASOAuthMigrationActivity__retrieveMigrationStatusFromConfigurationURI_withCompletion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F089E0];
  v3 = [NSURL URLWithString:*(void *)(a1 + 32)];
  v4 = [v2 requestWithURL:v3];

  [v4 _setNonAppInitiated:1];
  id v5 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  id v6 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__DAEASOAuthMigrationActivity__retrieveMigrationStatusFromConfigurationURI_withCompletion___block_invoke_2;
  v8[3] = &unk_26490AA78;
  id v9 = *(id *)(a1 + 40);
  v7 = [v6 dataTaskWithRequest:v4 completionHandler:v8];
  [v7 resume];
}

void __91__DAEASOAuthMigrationActivity__retrieveMigrationStatusFromConfigurationURI_withCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a2;
  v7 = a4;
  id v8 = v7;
  if (v6 && !v7)
  {
    id v25 = 0;
    id v9 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:&v25];
    v10 = v25;
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v9 objectForKeyedSubscript:@"iOSExchangeAccountAuthMigrationEnabled-v2"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          double v13 = [v9 objectForKeyedSubscript:@"iOSExchangeAccountAuthMigrationEnabled-v2"];
          [v13 isEqualToString:@"YES"];
        }
        v20 = [v9 objectForKeyedSubscript:@"iOSExchangeAccountAuthMigrationDisallowedDomains"];
        objc_opt_class();
        char v21 = objc_opt_isKindOfClass();

        if (v21)
        {
          v16 = [v9 objectForKeyedSubscript:@"iOSExchangeAccountAuthMigrationDisallowedDomains"];
        }
        else
        {
          v16 = 0;
        }
        v22 = [v9 objectForKeyedSubscript:@"iOSExchangeAccountAuthMigrationDisallowedHosts"];
        objc_opt_class();
        char v23 = objc_opt_isKindOfClass();

        if (v23)
        {
          double v15 = [v9 objectForKeyedSubscript:@"iOSExchangeAccountAuthMigrationDisallowedHosts"];
        }
        else
        {
          double v15 = 0;
        }
        v17 = DALoggingwithCategory();
        os_log_type_t v24 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
        if (os_log_type_enabled(v17, v24))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v9;
          _os_log_impl(&dword_22C076000, v17, v24, "DAEASOAuthMigrationActivity: Configuration set to: %@", buf, 0xCu);
        }
        goto LABEL_16;
      }
      v17 = DALoggingwithCategory();
      os_log_type_t v18 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        v19 = "DAEASOAuthMigrationActivity: Invalid configuration data: %@";
        goto LABEL_14;
      }
    }
    else
    {
      v17 = DALoggingwithCategory();
      os_log_type_t v18 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        v19 = "DAEASOAuthMigrationActivity: Unable to decode configuration data. Error: %@";
LABEL_14:
        _os_log_impl(&dword_22C076000, v17, v18, v19, buf, 0xCu);
      }
    }
    double v15 = 0;
    v16 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v10 = DALoggingwithCategory();
  os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v10, v14))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v8;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_22C076000, v10, v14, "DAEASOAuthMigrationActivity: Could not retrieve configuration. Error: %@. Data: %@", buf, 0x16u);
  }
  double v15 = 0;
  v16 = 0;
LABEL_17:

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_serverMigrationStatus
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy_;
  os_log_type_t v14 = __Block_byref_object_dispose_;
  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__DAEASOAuthMigrationActivity__serverMigrationStatus__block_invoke;
  v7[3] = &unk_26490AAC8;
  id v9 = &v10;
  v4 = v3;
  id v8 = v4;
  [(DAEASOAuthMigrationActivity *)self _retrieveMigrationStatusFromConfigurationURI:@"https://configuration.apple.com/configurations/internetservices/exchangesync/oauth-migration-configuration.plist" withCompletion:v7];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

intptr_t __53__DAEASOAuthMigrationActivity__serverMigrationStatus__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v7 = (objc_class *)NSNumber;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)[[v7 alloc] initWithBool:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v10 forKeyedSubscript:@"migrationEnabled"];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v9 forKeyedSubscript:@"disallowedDomains"];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:@"disallowedHosts"];

  id v11 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v11);
}

+ (BOOL)profileMigrationEnabled
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  dispatch_semaphore_t v3 = [v2 dictionaryRepresentation];
  v4 = [v3 valueForKey:@"ExchangeAccountEnableMigration"];

  id v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  BOOL v7 = os_log_type_enabled(v5, v6);
  if (v4)
  {
    if (v7)
    {
      __int16 v12 = 0;
      id v8 = "profileMigrationEnabled: YES";
      id v9 = (uint8_t *)&v12;
LABEL_6:
      _os_log_impl(&dword_22C076000, v5, v6, v8, v9, 2u);
    }
  }
  else if (v7)
  {
    __int16 v11 = 0;
    id v8 = "profileMigrationEnabled: NO";
    id v9 = (uint8_t *)&v11;
    goto LABEL_6;
  }

  return v4 != 0;
}

+ (BOOL)profileMigrationDisabled
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  dispatch_semaphore_t v3 = [v2 dictionaryRepresentation];
  v4 = [v3 valueForKey:@"ExchangeAccountDisableMigration"];

  id v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  BOOL v7 = os_log_type_enabled(v5, v6);
  if (v4)
  {
    if (v7)
    {
      __int16 v12 = 0;
      id v8 = "profileMigrationDisabled: YES";
      id v9 = (uint8_t *)&v12;
LABEL_6:
      _os_log_impl(&dword_22C076000, v5, v6, v8, v9, 2u);
    }
  }
  else if (v7)
  {
    __int16 v11 = 0;
    id v8 = "profileMigrationDisabled: NO";
    id v9 = (uint8_t *)&v11;
    goto LABEL_6;
  }

  return v4 != 0;
}

- (BOOL)_isExchangeBasicAccount:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v17 = 0;
  v4 = [MEMORY[0x263F230F0] credentialForAccount:v3 clientID:0 error:&v17];
  id v5 = v17;
  os_log_type_t v6 = [v3 accountType];
  BOOL v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x263EFAEB0]];

  uint64_t v9 = [v3 username];
  if (!v9
    || (uint64_t v10 = (void *)v9,
        [v4 password],
        __int16 v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    int v8 = 0;
  }
  __int16 v12 = [v4 oauthRefreshToken];

  if (v12) {
    int v8 = 0;
  }
  double v13 = DALoggingwithCategory();
  os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = @"No";
    if (v8) {
      id v15 = @"Yes";
    }
    *(_DWORD *)buf = 138412546;
    id v19 = v3;
    __int16 v20 = 2112;
    char v21 = v15;
    _os_log_impl(&dword_22C076000, v13, v14, "_isExchangeBasicAccount: Account %@ is a basic exchange account? %@", buf, 0x16u);
  }

  return v8;
}

- (void)_sendAnalyticsForMigratingAccount:(id)a3 withStatus:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  AnalyticsSendEventLazy();
}

id __76__DAEASOAuthMigrationActivity__sendAnalyticsForMigratingAccount_withStatus___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = [*(id *)(a1 + 32) identifier];
  [v2 setObject:v3 forKeyedSubscript:@"accountIdentifier"];

  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"migrationStatus"];
  if ([*(id *)(a1 + 48) _isExchangeBasicAccount:*(void *)(a1 + 32)]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  [v2 setObject:v4 forKeyedSubscript:@"accountIsExchangeBasic"];
  return v2;
}

- (id)_migrationDecisionString:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return @"Not basic account";
  }
  else {
    return off_26490AB60[a3 - 1];
  }
}

- (unint64_t)_migrateExchangeAccountToOAuthDecision:(id)a3 disallowedDomains:(id)a4 disallowedHosts:(id)a5
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![(DAEASOAuthMigrationActivity *)self _isExchangeBasicAccount:v9])
  {
    unint64_t v36 = 0;
    goto LABEL_32;
  }
  v60 = self;
  sel = a2;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v63 = v10;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v69;
    uint64_t v16 = *MEMORY[0x263F38E28];
    id v62 = v11;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v69 != v15) {
          objc_enumerationMutation(v12);
        }
        os_log_type_t v18 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        id v19 = objc_msgSend(v9, "username", v60);
        if ([v19 hasSuffix:v18])
        {

LABEL_26:
          v37 = DALoggingwithCategory();
          os_log_type_t v38 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
          if (os_log_type_enabled(v37, v38))
          {
            Name = sel_getName(sel);
            *(_DWORD *)buf = 136315394;
            v74 = Name;
            __int16 v75 = 2114;
            v76 = v18;
            _os_log_impl(&dword_22C076000, v37, v38, "In %s: No because it ends with %{public}@ domain (consumer account).", buf, 0x16u);
          }

          unint64_t v36 = 1;
          id v11 = v62;
          id v10 = v63;
          goto LABEL_32;
        }
        __int16 v20 = [v9 objectForKeyedSubscript:v16];
        int v21 = [v20 hasSuffix:v18];

        if (v21) {
          goto LABEL_26;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v68 objects:v77 count:16];
      id v11 = v62;
      if (v14) {
        continue;
      }
      break;
    }
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v22 = v11;
  id v23 = v11;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v65;
    uint64_t v27 = *MEMORY[0x263F38E30];
    while (2)
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v65 != v26) {
          objc_enumerationMutation(v23);
        }
        id v29 = *(void **)(*((void *)&v64 + 1) + 8 * j);
        uint64_t v30 = objc_msgSend(v9, "objectForKeyedSubscript:", v27, v60);
        int v31 = [v30 isEqualToString:v29];

        if (v31)
        {
          v40 = DALoggingwithCategory();
          os_log_type_t v41 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
          if (os_log_type_enabled(v40, v41))
          {
            v42 = sel_getName(sel);
            *(_DWORD *)buf = 136315394;
            v74 = v42;
            __int16 v75 = 2114;
            v76 = v29;
            _os_log_impl(&dword_22C076000, v40, v41, "In %s: No because the host is %{public}@ (consumer account).", buf, 0x16u);
          }

          unint64_t v36 = 2;
          id v10 = v63;
          id v11 = v22;
          goto LABEL_32;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v64 objects:v72 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  v32 = [v9 managingOwnerIdentifier];
  if (v32
    || ([v9 objectForKeyedSubscript:*MEMORY[0x263EFAD68]],
        (v32 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v33 = DALoggingwithCategory();
    os_log_type_t v34 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    id v10 = v63;
    id v11 = v22;
    if (os_log_type_enabled(v33, v34))
    {
      v35 = sel_getName(sel);
      *(_DWORD *)buf = 136315138;
      v74 = v35;
      _os_log_impl(&dword_22C076000, v33, v34, "In %s: No because it is being managed.", buf, 0xCu);
    }

    unint64_t v36 = 3;
    goto LABEL_32;
  }
  uint64_t v44 = *MEMORY[0x263F3B910];
  v45 = [v9 objectForKeyedSubscript:*MEMORY[0x263F3B910]];

  id v10 = v63;
  id v11 = v22;
  if (!v45) {
    goto LABEL_39;
  }
  v46 = (void *)MEMORY[0x263EFF910];
  v47 = [v9 objectForKeyedSubscript:v44];
  [v47 doubleValue];
  v48 = objc_msgSend(v46, "dateWithTimeIntervalSince1970:");

  LODWORD(v46) = [(id)objc_opt_class() profileMigrationEnabled];
  [v48 timeIntervalSinceNow];
  if (v46) {
    v50 = (double *)MEMORY[0x263F3B920];
  }
  else {
    v50 = (double *)MEMORY[0x263F3B918];
  }
  if (v49 < -*v50)
  {

LABEL_39:
    uint64_t v51 = objc_msgSend(v9, "migrationStatus", v60);
    unint64_t v36 = 7;
    if (v51 != 3)
    {
      uint64_t v52 = v51;
      if (v51 != 5)
      {
        v53 = DALoggingwithCategory();
        os_log_type_t v54 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
        if (os_log_type_enabled(v53, v54))
        {
          v55 = sel_getName(sel);
          v56 = [v9 migrationStatusString];
          *(_DWORD *)buf = 136315394;
          v74 = v55;
          __int16 v75 = 2112;
          v76 = v56;
          _os_log_impl(&dword_22C076000, v53, v54, "In %s: No because migration status is %@.", buf, 0x16u);
        }
        if (v52 == 1) {
          unint64_t v36 = 5;
        }
        else {
          unint64_t v36 = 6;
        }
      }
    }
    goto LABEL_32;
  }
  v57 = DALoggingwithCategory();
  os_log_type_t v58 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v57, v58))
  {
    v59 = sel_getName(sel);
    *(_DWORD *)buf = 136315394;
    v74 = v59;
    __int16 v75 = 2112;
    v76 = v48;
    _os_log_impl(&dword_22C076000, v57, v58, "In %s: No because last attempt was very recent: %@).", buf, 0x16u);
  }

  unint64_t v36 = 4;
LABEL_32:

  return v36;
}

- (id)_triggerAccountMigration
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__DAEASOAuthMigrationActivity__triggerAccountMigration__block_invoke;
  v4[3] = &unk_26490AB40;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x230F5DCD0](v4, a2);
  return v2;
}

void __55__DAEASOAuthMigrationActivity__triggerAccountMigration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C076000, v4, v5, "DAEASOAuthMigrationActivity: Starting.", buf, 2u);
  }

  if (![(id)objc_opt_class() profileMigrationDisabled])
  {
    os_log_type_t type = v5;
    id v7 = [*(id *)(a1 + 32) _serverMigrationStatus];
    id v8 = [v7 objectForKeyedSubscript:@"migrationEnabled"];
    int v9 = [v8 BOOLValue];

    id v10 = [v7 objectForKeyedSubscript:@"disallowedDomains"];
    id v11 = [v7 objectForKeyedSubscript:@"disallowedHosts"];
    id v12 = [*(id *)(a1 + 32) scheduler];
    if ([v12 shouldDefer])
    {
    }
    else
    {
      int v13 = [(id)objc_opt_class() profileMigrationEnabled] | v9;

      if (v13 == 1)
      {
        uint64_t v14 = objc_opt_new();
        uint64_t v15 = [v14 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAEB0]];
        uint64_t v16 = (void *)v15;
        os_log_type_t v17 = type;
        if (v15)
        {
          os_log_type_t v34 = v7;
          v35 = v3;
          v32 = (void *)v15;
          v33 = v14;
          [v14 accountsWithAccountType:v15];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v40 != v20) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8 * i);
                uint64_t v23 = [*(id *)(a1 + 32) _migrateExchangeAccountToOAuthDecision:v22 disallowedDomains:v10 disallowedHosts:v11];
                if (v23 == 7)
                {
                  v45 = @"DAEASRenewCredentialsShouldTriggerMigrationKey";
                  uint64_t v46 = MEMORY[0x263EFFA88];
                  uint64_t v24 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
                  uint64_t v25 = DALoggingwithCategory();
                  if (os_log_type_enabled(v25, v17))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v44 = v22;
                    _os_log_impl(&dword_22C076000, v25, v17, "DAEASOAuthMigrationActivity: Calling renewCredentialsForAccount for account: %@.", buf, 0xCu);
                  }

                  uint64_t v26 = sharedDAAccountStore();
                  v38[0] = MEMORY[0x263EF8330];
                  v38[1] = 3221225472;
                  v38[2] = __55__DAEASOAuthMigrationActivity__triggerAccountMigration__block_invoke_95;
                  v38[3] = &unk_26490AB18;
                  uint64_t v27 = *(void *)(a1 + 32);
                  v38[4] = v22;
                  v38[5] = v27;
                  [v26 renewCredentialsForAccount:v22 options:v24 completion:v38];
                }
                else
                {
                  uint64_t v24 = [*(id *)(a1 + 32) _migrationDecisionString:v23];
                  __int16 v28 = *(void **)(a1 + 32);
                  id v29 = [NSString stringWithFormat:@"Skipped: %@", v24];
                  [v28 _sendAnalyticsForMigratingAccount:v22 withStatus:v29];

                  os_log_type_t v17 = type;
                }
              }
              uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v19);
          }

          id v7 = v34;
          id v3 = v35;
          uint64_t v16 = v32;
          uint64_t v14 = v33;
        }
        uint64_t v30 = DALoggingwithCategory();
        if (os_log_type_enabled(v30, v17))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C076000, v30, v17, "DAEASOAuthMigrationActivity: Finished.", buf, 2u);
        }

        v3[2](v3, 1);
        goto LABEL_30;
      }
    }
    int v31 = DALoggingwithCategory();
    if (os_log_type_enabled(v31, type))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C076000, v31, type, "DAEASOAuthMigrationActivity: Deferred.", buf, 2u);
    }

    v3[2](v3, 2);
LABEL_30:

    goto LABEL_31;
  }
  id v6 = DALoggingwithCategory();
  if (os_log_type_enabled(v6, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C076000, v6, v5, "DAEASOAuthMigrationActivity: Profile says we should not proceed, exiting.", buf, 2u);
  }

  v3[2](v3, 1);
LABEL_31:
}

void __55__DAEASOAuthMigrationActivity__triggerAccountMigration__block_invoke_95(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) reload];
  id v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v4;
    _os_log_impl(&dword_22C076000, v2, v3, "DAEASOAuthMigrationActivity: Finished calling renewCredentialsForAccount for account: %@.", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = a1 + 32;
  os_log_type_t v5 = *(void **)(a1 + 32);
  id v6 = *(void **)(v7 + 8);
  id v8 = [v5 migrationStatusString];
  [v6 _sendAnalyticsForMigratingAccount:v5 withStatus:v8];
}

- (NSBackgroundActivityScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end