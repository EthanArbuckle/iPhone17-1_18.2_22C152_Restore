@interface DMCAccountUtilities
+ (id)_appleAccountWithPersonaID:(id)a3;
+ (id)accountIdentifierForAppleAccountWithPersonaID:(id)a3;
+ (id)appStoreAccountIdentifierForPersona:(id)a3;
+ (id)managedAppleIDNameWithPersonaID:(id)a3;
- (BOOL)_signIniCloudAccountWithAuthenticationResult:(id)a3 personaID:(id)a4 baseViewController:(id)a5 outError:(id *)a6;
- (BOOL)_signIniTunesAccountWithAuthenticationResult:(id)a3 personaID:(id)a4 canMakeAccountActive:(BOOL)a5 baseViewController:(id)a6 outError:(id *)a7;
- (CDPUIController)cdpUIController;
- (DMCHangDetectionQueue)signInQueue;
- (void)setCdpUIController:(id)a3;
- (void)setSignInQueue:(id)a3;
- (void)signInAccountsWithTypes:(id)a3 authenticationResult:(id)a4 personaID:(id)a5 canMakeAccountActive:(BOOL)a6 baseViewController:(id)a7 completionHandler:(id)a8;
- (void)signOutAllPrimaryAccounts;
@end

@implementation DMCAccountUtilities

+ (id)appStoreAccountIdentifierForPersona:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = +[DMCAccountUtilities _appleAccountWithPersonaID:v3];
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "ams_DSID");
      v7 = *DMCLogObjects();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543618;
        id v11 = v3;
        __int16 v12 = 2114;
        v13 = v6;
        _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_DEFAULT, "appStoreAccountIdentifierForPersona FOUND persona:%{public}@ -> accountIdentifier:%{public}@", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      v8 = *DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = v3;
        _os_log_impl(&dword_1A7863000, v8, OS_LOG_TYPE_DEFAULT, "appStoreAccountIdentifierForPersona NOT FOUND persona:%{public}@", (uint8_t *)&v10, 0xCu);
      }
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)managedAppleIDNameWithPersonaID:(id)a3
{
  id v3 = +[DMCAccountUtilities _appleAccountWithPersonaID:a3];
  v4 = [v3 username];

  return v4;
}

+ (id)accountIdentifierForAppleAccountWithPersonaID:(id)a3
{
  id v3 = +[DMCAccountUtilities _appleAccountWithPersonaID:a3];
  v4 = [v3 identifier];

  return v4;
}

+ (id)_appleAccountWithPersonaID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F179C8] defaultStore];
  v5 = [v4 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17750]];
  [v4 accountsWithAccountType:v5];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v16 = v5;
    uint64_t v9 = *(void *)v18;
    uint64_t v10 = *MEMORY[0x1E4F176E8];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = [v12 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v13 isEqualToString:v3])
        {
          id v14 = v12;

          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    id v14 = 0;
LABEL_12:
    v5 = v16;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)signInAccountsWithTypes:(id)a3 authenticationResult:(id)a4 personaID:(id)a5 canMakeAccountActive:(BOOL)a6 baseViewController:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  long long v19 = [(DMCAccountUtilities *)self signInQueue];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __136__DMCAccountUtilities_signInAccountsWithTypes_authenticationResult_personaID_canMakeAccountActive_baseViewController_completionHandler___block_invoke;
  v25[3] = &unk_1E5CFD5C0;
  id v26 = v14;
  v27 = self;
  id v28 = v15;
  id v29 = v16;
  id v30 = v17;
  id v31 = v18;
  BOOL v32 = a6;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v18;
  id v24 = v14;
  [v19 queueBlock:v25];
}

void __136__DMCAccountUtilities_signInAccountsWithTypes_authenticationResult_personaID_canMakeAccountActive_baseViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v3)
    {
      uint64_t v5 = v3;
      char v6 = 0;
      uint64_t v7 = *(void *)v33;
      uint64_t v8 = *MEMORY[0x1E4F17750];
      uint64_t v9 = *MEMORY[0x1E4F17890];
      uint64_t v29 = *MEMORY[0x1E4F178F0];
      *(void *)&long long v4 = 138412290;
      long long v28 = v4;
      while (1)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v33 != v7) {
            objc_enumerationMutation(v2);
          }
          id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v8, v28))
          {
            __int16 v12 = *(void **)(a1 + 40);
            uint64_t v13 = *(void *)(a1 + 48);
            uint64_t v14 = *(void *)(a1 + 56);
            uint64_t v15 = *(void *)(a1 + 64);
            id v31 = 0;
            char v6 = [v12 _signIniCloudAccountWithAuthenticationResult:v13 personaID:v14 baseViewController:v15 outError:&v31];
            id v16 = v31;
LABEL_11:
            id v22 = v16;
            goto LABEL_15;
          }
          if ([v11 isEqualToString:v9])
          {
            id v17 = *(void **)(a1 + 40);
            uint64_t v18 = *(void *)(a1 + 48);
            uint64_t v19 = *(unsigned __int8 *)(a1 + 80);
            uint64_t v20 = *(void *)(a1 + 56);
            uint64_t v21 = *(void *)(a1 + 64);
            id v30 = 0;
            char v6 = [v17 _signIniTunesAccountWithAuthenticationResult:v18 personaID:v20 canMakeAccountActive:v19 baseViewController:v21 outError:&v30];
            id v16 = v30;
            goto LABEL_11;
          }
          id v23 = *DMCLogObjects();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v28;
            v37 = v11;
            _os_log_impl(&dword_1A7863000, v23, OS_LOG_TYPE_ERROR, "DMCAccountUtilities: Unsupported account type: %@", buf, 0xCu);
          }
          id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:v29 code:4 userInfo:0];
LABEL_15:
          id v24 = v22;
          if (v22 || (v6 & 1) == 0) {
            goto LABEL_25;
          }
          char v6 = 1;
        }
        uint64_t v5 = [v2 countByEnumeratingWithState:&v32 objects:v38 count:16];
        if (!v5)
        {
          id v24 = 0;
          goto LABEL_25;
        }
      }
    }
    id v24 = 0;
    char v6 = 0;
LABEL_25:

    uint64_t v27 = *(void *)(a1 + 72);
    if (v27) {
      (*(void (**)(uint64_t, void, void *))(v27 + 16))(v27, v6 & 1, v24);
    }
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 72);
    if (v25)
    {
      id v26 = *(void (**)(void))(v25 + 16);
      v26();
    }
  }
}

- (BOOL)_signIniCloudAccountWithAuthenticationResult:(id)a3 personaID:(id)a4 baseViewController:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3032000000;
  long long v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__DMCAccountUtilities__signIniCloudAccountWithAuthenticationResult_personaID_baseViewController_outError___block_invoke;
  v22[3] = &unk_1E5CFD5E8;
  id v13 = v10;
  id v23 = v13;
  id v14 = v12;
  id v24 = v14;
  uint64_t v25 = self;
  id v26 = &v28;
  uint64_t v27 = &v32;
  uint64_t v15 = MEMORY[0x1AD0D2220](v22);
  id v16 = (void *)v15;
  if (v11)
  {
    id v17 = *DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1A7863000, v17, OS_LOG_TYPE_DEBUG, "DMCAccountUtilities: Has enterprise persona, will sign in iCloud under enterprise persona", v21, 2u);
    }
    id v18 = +[DMCPersonaHelper performBlockUnderPersona:v11 block:v16];
  }
  else
  {
    (*(void (**)(uint64_t))(v15 + 16))(v15);
  }
  if (a6) {
    *a6 = (id) v33[5];
  }
  char v19 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v19;
}

void __106__DMCAccountUtilities__signIniCloudAccountWithAuthenticationResult_personaID_baseViewController_outError___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = +[DMCPersonaHelper currentPersonaID];
    uint64_t v3 = +[DMCPersonaHelper currentPersonaTypeString];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[DMCAccountUtilities _signIniCloudAccountWithAuthenticationResult:personaID:baseViewController"
                         ":outError:]_block_invoke";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 132;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v2;
    *(_WORD *)&buf[28] = 2114;
    *(void *)&buf[30] = v3;
    _os_log_impl(&dword_1A7863000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s (L: %d): Current persona ID: %{public}@, type: %{public}@", buf, 0x26u);
  }
  id v4 = objc_alloc_init((Class)DMCAIDAMutableServiceContextClass());
  [v4 setAuthenticationResults:*(void *)(a1 + 32)];
  [v4 setViewController:*(void *)(a1 + 40)];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2050000000;
  uint64_t v5 = (void *)getCDPUIControllerClass_softClass;
  uint64_t v20 = getCDPUIControllerClass_softClass;
  if (!getCDPUIControllerClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCDPUIControllerClass_block_invoke;
    *(void *)&buf[24] = &unk_1E5CFD440;
    *(void *)&buf[32] = &v17;
    __getCDPUIControllerClass_block_invoke((uint64_t)buf);
    uint64_t v5 = (void *)v18[3];
  }
  char v6 = v5;
  _Block_object_dispose(&v17, 8);
  uint64_t v7 = (void *)[[v6 alloc] initWithPresentingViewController:*(void *)(a1 + 40)];
  [v7 setForceInlinePresentation:1];
  [v4 setCdpUiProvider:v7];
  [*(id *)(a1 + 48) setCdpUIController:v7];
  id v8 = objc_alloc((Class)DMCAIDAServiceOwnersManagerClass());
  uint64_t v9 = [MEMORY[0x1E4F179C8] defaultStore];
  id v10 = (void *)[v8 initWithAccountStore:v9];

  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v12 = DMCAIDAServiceTypeCloud();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__DMCAccountUtilities__signIniCloudAccountWithAuthenticationResult_personaID_baseViewController_outError___block_invoke_21;
  v14[3] = &unk_1E5CFD4D0;
  long long v16 = *(_OWORD *)(a1 + 56);
  dispatch_semaphore_t v15 = v11;
  id v13 = v11;
  [v10 signInService:v12 withContext:v4 completion:v14];

  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
}

void __106__DMCAccountUtilities__signIniCloudAccountWithAuthenticationResult_personaID_baseViewController_outError___block_invoke_21(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = *DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_1A7863000, v6, OS_LOG_TYPE_DEFAULT, "DMCAccountUtilities: Signing in iCloud account finished with result: %d, error: %{public}@", (uint8_t *)v10, 0x12u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_signIniTunesAccountWithAuthenticationResult:(id)a3 personaID:(id)a4 canMakeAccountActive:(BOOL)a5 baseViewController:(id)a6 outError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v30 = a6;
  uint64_t v13 = DMCAKAuthenticationUsernameKey();
  uint64_t v29 = [v11 objectForKeyedSubscript:v13];

  id v14 = DMCAKAuthenticationPasswordKey();
  dispatch_semaphore_t v15 = [v11 objectForKeyedSubscript:v14];

  long long v16 = DMCAKAuthenticationAlternateDSIDKey();
  uint64_t v17 = [v11 objectForKeyedSubscript:v16];

  id v18 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v19 = objc_msgSend(v18, "ams_activeiTunesAccount");
  uint64_t v20 = v19;
  if (v19
    && (objc_msgSend(v19, "dmc_altDSID", v29, v30),
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        int v22 = [v21 isEqualToString:v17],
        v21,
        v22))
  {
    if (a7)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F178F0] code:5 userInfo:0];
      BOOL v23 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  else
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__1;
    v48 = __Block_byref_object_dispose__1;
    id v49 = 0;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __127__DMCAccountUtilities__signIniTunesAccountWithAuthenticationResult_personaID_canMakeAccountActive_baseViewController_outError___block_invoke;
    v32[3] = &unk_1E5CFD638;
    BOOL v39 = a5;
    id v33 = v30;
    id v34 = v29;
    id v35 = v17;
    id v36 = v15;
    id v37 = &v40;
    v38 = &v44;
    uint64_t v24 = MEMORY[0x1AD0D2220](v32);
    uint64_t v25 = (void *)v24;
    if (v12)
    {
      id v26 = *DMCLogObjects();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7863000, v26, OS_LOG_TYPE_DEBUG, "DMCAccountUtilities: Has enterprise persona, will sign in iTunes under enterprise persona", buf, 2u);
      }
      id v27 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v12, v25, v29);
    }
    else
    {
      (*(void (**)(uint64_t))(v24 + 16))(v24);
    }
    if (a7) {
      *a7 = (id) v45[5];
    }
    BOOL v23 = *((unsigned char *)v41 + 24) != 0;

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
  }
  return v23;
}

void __127__DMCAccountUtilities__signIniTunesAccountWithAuthenticationResult_personaID_canMakeAccountActive_baseViewController_outError___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = +[DMCPersonaHelper currentPersonaID];
    uint64_t v3 = +[DMCPersonaHelper currentPersonaTypeString];
    *(_DWORD *)buf = 136315906;
    *(void *)id v18 = "-[DMCAccountUtilities _signIniTunesAccountWithAuthenticationResult:personaID:canMakeAccountActive:b"
                     "aseViewController:outError:]_block_invoke";
    *(_WORD *)&v18[8] = 1024;
    *(_DWORD *)&v18[10] = 188;
    __int16 v19 = 2114;
    uint64_t v20 = v2;
    __int16 v21 = 2114;
    int v22 = v3;
    _os_log_impl(&dword_1A7863000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s (L: %d): Current persona ID: %{public}@, type: %{public}@", buf, 0x26u);
  }
  id v4 = objc_alloc_init((Class)DMCAMSAuthenticateOptionsClass());
  [v4 setAuthenticationType:0];
  [v4 setCanMakeAccountActive:*(unsigned __int8 *)(a1 + 80)];
  id v5 = (void *)[objc_alloc((Class)DMCAMSUIAuthenticateTaskClass()) initWithAccount:0 presentingViewController:*(void *)(a1 + 32) options:v4];
  [v5 setUsername:*(void *)(a1 + 40)];
  [v5 setAltDSID:*(void *)(a1 + 48)];
  [v5 setPassword:*(void *)(a1 + 56)];
  char v6 = [v5 performAuthentication];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = +[DMCPersonaHelper currentPersonaID];
    id v8 = +[DMCPersonaHelper currentPersonaTypeString];
    *(_DWORD *)buf = 136315906;
    *(void *)id v18 = "-[DMCAccountUtilities _signIniTunesAccountWithAuthenticationResult:personaID:canMakeAccountActive:b"
                     "aseViewController:outError:]_block_invoke";
    *(_WORD *)&v18[8] = 1024;
    *(_DWORD *)&v18[10] = 198;
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    __int16 v21 = 2114;
    int v22 = v8;
    _os_log_impl(&dword_1A7863000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s (L: %d): Current persona ID: %{public}@, type: %{public}@", buf, 0x26u);
  }
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __127__DMCAccountUtilities__signIniTunesAccountWithAuthenticationResult_personaID_canMakeAccountActive_baseViewController_outError___block_invoke_23;
  v14[3] = &unk_1E5CFD610;
  long long v16 = *(_OWORD *)(a1 + 64);
  id v10 = v9;
  dispatch_semaphore_t v15 = v10;
  [v6 resultWithCompletion:v14];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = *DMCLogObjects();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)id v18 = v12;
    *(_WORD *)&v18[4] = 2114;
    *(void *)&v18[6] = v13;
    _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_DEFAULT, "DMCAccountUtilities: Signing in iTunes account finished with result: %d, error: %{public}@", buf, 0x12u);
  }
}

void __127__DMCAccountUtilities__signIniTunesAccountWithAuthenticationResult_personaID_canMakeAccountActive_baseViewController_outError___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 != 0;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;
  id v9 = a2;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)signOutAllPrimaryAccounts
{
  uint64_t v3 = [(DMCAccountUtilities *)self signInQueue];
  [v3 queueBlock:&__block_literal_global_0];

  id v4 = [(DMCAccountUtilities *)self signInQueue];
  [v4 waitUntilAllBlocksAreFinished];
}

void __48__DMCAccountUtilities_signOutAllPrimaryAccounts__block_invoke()
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F179C8] defaultStore];
  id v1 = objc_alloc((Class)DMCAIDAServiceOwnersManagerClass());
  id v2 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v3 = (void *)[v1 initWithAccountStore:v2];

  id v4 = objc_alloc_init((Class)DMCAIDAMutableServiceContextClass());
  id v5 = objc_msgSend(v0, "dmc_primaryiCloudAccount");
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = DMCAIDAServiceTypeMessages();
  v23[0] = v7;
  id v8 = DMCAIDAServiceTypeFaceTime();
  v23[1] = v8;
  id v9 = DMCAIDAServiceTypeStore();
  v23[2] = v9;
  id v10 = DMCAIDAServiceTypeGameCenter();
  v23[3] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __48__DMCAccountUtilities_signOutAllPrimaryAccounts__block_invoke_2;
  __int16 v19 = &unk_1E5CFD6A8;
  id v20 = v3;
  id v21 = v4;
  dispatch_semaphore_t v22 = v6;
  int v12 = v6;
  id v13 = v4;
  id v14 = v3;
  [v14 signOutOfServices:v11 usingContext:v13 completion:&v16];

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_t v15 = objc_msgSend(v5, "dmc_altDSID", v16, v17, v18, v19);
  objc_msgSend(v0, "dmc_removeAccountsWithAltDSID:asynchronous:", v15, 0);
}

void __48__DMCAccountUtilities_signOutAllPrimaryAccounts__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_semaphore_t v6 = *DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v15 = a2;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_1A7863000, v6, OS_LOG_TYPE_DEFAULT, "DMCAccountUtilities: signOutOfServices (except Cloud) finished with success: %d, result: %{public}@", buf, 0x12u);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = DMCAIDAServiceTypeCloud();
  id v13 = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__DMCAccountUtilities_signOutAllPrimaryAccounts__block_invoke_26;
  v11[3] = &unk_1E5CFD680;
  uint64_t v10 = *(void *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  [v7 signOutOfServices:v9 usingContext:v10 completion:v11];
}

void __48__DMCAccountUtilities_signOutAllPrimaryAccounts__block_invoke_26(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_semaphore_t v6 = *DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl(&dword_1A7863000, v6, OS_LOG_TYPE_DEFAULT, "DMCAccountUtilities: signOutOfCloud finished with success: %d, result: %{public}@", (uint8_t *)v7, 0x12u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (DMCHangDetectionQueue)signInQueue
{
  signInQueue = self->_signInQueue;
  if (!signInQueue)
  {
    id v4 = [DMCHangDetectionQueue alloc];
    +[DMCFeatureOverrides accountSignInTimeoutThresholdWithDefaultValue:20.0];
    double v6 = v5;
    uint64_t v7 = (objc_class *)objc_opt_class();
    __int16 v8 = NSStringFromClass(v7);
    id v9 = [(DMCHangDetectionQueue *)v4 initWithQoS:25 hangThreshold:v8 owner:v6];
    uint64_t v10 = self->_signInQueue;
    self->_signInQueue = v9;

    signInQueue = self->_signInQueue;
  }
  return signInQueue;
}

- (void)setSignInQueue:(id)a3
{
}

- (CDPUIController)cdpUIController
{
  return self->_cdpUIController;
}

- (void)setCdpUIController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpUIController, 0);
  objc_storeStrong((id *)&self->_signInQueue, 0);
}

@end