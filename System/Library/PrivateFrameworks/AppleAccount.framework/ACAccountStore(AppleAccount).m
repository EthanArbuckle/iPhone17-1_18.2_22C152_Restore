@interface ACAccountStore(AppleAccount)
- (BOOL)aa_isUsingiCloud;
- (id)aa_accountsEnabledForDataclass:()AppleAccount;
- (id)aa_accountsForAccountClass:()AppleAccount;
- (id)aa_appleAccountWithAltDSID:()AppleAccount;
- (id)aa_appleAccountWithPersonID:()AppleAccount;
- (id)aa_appleAccountWithUsername:()AppleAccount;
- (id)aa_appleAccounts;
- (id)aa_appleAccountsWithError:()AppleAccount;
- (id)aa_authKitAccountForAltDSID:()AppleAccount;
- (id)aa_dataSeparatedAccounts;
- (id)aa_grandSlamAccountForAltDSID:()AppleAccount;
- (id)aa_grandSlamAccountForiCloudAccount:()AppleAccount;
- (id)aa_primaryAppleAccount;
- (id)aa_primaryAppleAccountWithPreloadedDataclasses;
- (id)aa_recommendedAppleIDForAccountSignInWithTypeIdentifier:()AppleAccount;
- (uint64_t)aa_appleAccountType;
- (uint64_t)aa_updatePropertiesForAppleAccount:()AppleAccount completion:;
- (uint64_t)aa_updatePropertiesForAppleAccount:()AppleAccount options:completion:;
- (void)_performUpdateRequestWithAccount:()AppleAccount serverInfo:completion:;
- (void)aa_appleAccountsWithCompletion:()AppleAccount;
- (void)aa_loginAndUpdateiCloudAccount:()AppleAccount delegateParams:withCompletion:;
- (void)aa_loginAndUpdateiCloudAccount:()AppleAccount withCompletion:;
- (void)aa_primaryAppleAccountWithCompletion:()AppleAccount;
- (void)aa_registerAppleAccount:()AppleAccount withCompletion:;
- (void)aa_registerAppleAccountWithHSA:()AppleAccount completion:;
- (void)aa_updatePropertiesForAppleAccount:()AppleAccount options:serverInfo:completion:;
@end

@implementation ACAccountStore(AppleAccount)

- (void)aa_primaryAppleAccountWithCompletion:()AppleAccount
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__ACAccountStore_AppleAccount__aa_primaryAppleAccountWithCompletion___block_invoke;
  v9[3] = &unk_1E5A48D68;
  id v10 = v4;
  v11[0] = *MEMORY[0x1E4F17750];
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a1;
  id v7 = v4;
  v8 = [v5 arrayWithObjects:v11 count:1];
  [v6 accountsWithAccountTypeIdentifiers:v8 preloadedProperties:0 completion:v9];
}

- (BOOL)aa_isUsingiCloud
{
  v1 = objc_msgSend(a1, "aa_primaryAppleAccount");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)aa_appleAccounts
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F17750];
  v1 = (void *)MEMORY[0x1E4F1C978];
  id v2 = a1;
  v3 = [v1 arrayWithObjects:&v6 count:1];
  id v4 = objc_msgSend(v2, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v3, 0, 0, v6, v7);

  return v4;
}

- (id)aa_primaryAppleAccountWithPreloadedDataclasses
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F17958];
  v11[0] = *MEMORY[0x1E4F17960];
  v11[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v12[0] = *MEMORY[0x1E4F17750];
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a1;
  id v6 = v3;
  uint64_t v7 = [v4 arrayWithObjects:v12 count:1];
  v8 = [v5 accountsWithAccountTypeIdentifiers:v7 preloadedProperties:v6 error:0];

  v9 = objc_msgSend(v8, "aaf_firstObjectPassingTest:", &__block_literal_global_26);

  return v9;
}

- (id)aa_primaryAppleAccount
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F17750];
  v1 = (void *)MEMORY[0x1E4F1C978];
  id v2 = a1;
  v3 = [v1 arrayWithObjects:&v7 count:1];
  id v4 = objc_msgSend(v2, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v3, 0, 0, v7, v8);

  id v5 = objc_msgSend(v4, "aaf_firstObjectPassingTest:", &__block_literal_global_24_0);

  return v5;
}

- (uint64_t)aa_appleAccountType
{
  return [a1 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17750] error:0];
}

- (id)aa_dataSeparatedAccounts
{
  v1 = objc_msgSend(a1, "aa_appleAccounts");
  id v2 = objc_msgSend(v1, "aaf_filter:", &__block_literal_global_20);

  return v2;
}

- (id)aa_appleAccountsWithError:()AppleAccount
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F17750];
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a1;
  id v6 = [v4 arrayWithObjects:&v9 count:1];
  uint64_t v7 = objc_msgSend(v5, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v6, 0, a3, v9, v10);

  return v7;
}

- (id)aa_accountsForAccountClass:()AppleAccount
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14[0] = *MEMORY[0x1E4F17750];
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a1;
  uint64_t v7 = [v5 arrayWithObjects:v14 count:1];
  uint64_t v8 = [v6 accountsWithAccountTypeIdentifiers:v7 preloadedProperties:0 error:0];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __59__ACAccountStore_AppleAccount__aa_accountsForAccountClass___block_invoke;
  v12[3] = &unk_1E5A4A0F8;
  id v13 = v4;
  id v9 = v4;
  uint64_t v10 = objc_msgSend(v8, "aaf_filter:", v12);

  return v10;
}

- (void)aa_appleAccountsWithCompletion:()AppleAccount
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F17750];
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = [v4 arrayWithObjects:&v8 count:1];
  objc_msgSend(v5, "accountsWithAccountTypeIdentifiers:preloadedProperties:completion:", v7, 0, v6, v8, v9);
}

- (id)aa_appleAccountWithUsername:()AppleAccount
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v20[0] = *MEMORY[0x1E4F17750];
    id v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a1;
    uint64_t v7 = [v5 arrayWithObjects:v20 count:1];
    uint64_t v8 = [v6 accountsWithAccountTypeIdentifiers:v7 preloadedProperties:0 error:0];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__ACAccountStore_AppleAccount__aa_appleAccountWithUsername___block_invoke;
    v18[3] = &unk_1E5A4A0F8;
    id v19 = v4;
    uint64_t v9 = [v8 aaf_firstObjectPassingTest:v18];
  }
  else
  {
    uint64_t v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACAccountStore(AppleAccount) aa_appleAccountWithUsername:](v8, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)aa_appleAccountWithPersonID:()AppleAccount
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v20[0] = *MEMORY[0x1E4F17750];
    id v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a1;
    uint64_t v7 = [v5 arrayWithObjects:v20 count:1];
    uint64_t v8 = [v6 accountsWithAccountTypeIdentifiers:v7 preloadedProperties:0 error:0];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__ACAccountStore_AppleAccount__aa_appleAccountWithPersonID___block_invoke;
    v18[3] = &unk_1E5A4A0F8;
    id v19 = v4;
    uint64_t v9 = [v8 aaf_firstObjectPassingTest:v18];
  }
  else
  {
    uint64_t v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACAccountStore(AppleAccount) aa_appleAccountWithPersonID:](v8, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)aa_appleAccountWithAltDSID:()AppleAccount
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v20[0] = *MEMORY[0x1E4F17750];
    id v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a1;
    uint64_t v7 = [v5 arrayWithObjects:v20 count:1];
    uint64_t v8 = [v6 accountsWithAccountTypeIdentifiers:v7 preloadedProperties:0 error:0];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__ACAccountStore_AppleAccount__aa_appleAccountWithAltDSID___block_invoke;
    v18[3] = &unk_1E5A4A0F8;
    id v19 = v4;
    uint64_t v9 = [v8 aaf_firstObjectPassingTest:v18];
  }
  else
  {
    uint64_t v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACAccountStore(AppleAccount) aa_appleAccountWithAltDSID:](v8, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)aa_accountsEnabledForDataclass:()AppleAccount
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = [a1 accountIdentifiersEnabledForDataclass:v4];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v22 = v4;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v12 = [a1 accountWithIdentifier:v11 error:0];
          if (v12)
          {
            [v5 addObject:v12];
          }
          else
          {
            uint64_t v13 = _AALogSystem();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v28 = v11;
              _os_log_error_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch enabled account with identifier: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v8);
      id v4 = v22;
    }
  }
  else
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACAccountStore(AppleAccount) aa_accountsEnabledForDataclass:](v6, v14, v15, v16, v17, v18, v19, v20);
    }
    id v5 = 0;
  }

  return v5;
}

- (id)aa_recommendedAppleIDForAccountSignInWithTypeIdentifier:()AppleAccount
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v4;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier %@", buf, 0xCu);
  }

  id v6 = objc_msgSend(a1, "aa_appleAccounts");
  if ([v6 count] && objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E4F17750]))
  {
    uint64_t v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v8 = "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier recommending nothing for an iCloud account because we"
           " already have one or more iCloud accounts.";
LABEL_14:
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if ([v6 count] != 1)
  {
    unint64_t v11 = [v6 count];
    uint64_t v7 = _AALogSystem();
    BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v11 >= 2)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        uint64_t v8 = "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier found > 1 iCloud account. Recommending nothing.";
        goto LABEL_14;
      }
LABEL_15:

      uint64_t v10 = 0;
      goto LABEL_24;
    }
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier found zero iCloud accounts. Checking other account types...", buf, 2u);
    }

    uint64_t v13 = *MEMORY[0x1E4F177B8];
    v58[0] = *MEMORY[0x1E4F17808];
    v58[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
    id v52 = 0;
    uint64_t v15 = [a1 accountsWithAccountTypeIdentifiers:v14 error:&v52];
    id v16 = v52;
    if (v16)
    {
      uint64_t v17 = _AALogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v16;
        uint64_t v18 = "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier recommending nothing after receiving error: %@";
        uint64_t v19 = v17;
        uint32_t v20 = 12;
LABEL_21:
        _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
    else
    {
      if ([v15 count])
      {
        uint64_t v25 = [v15 count];
        long long v26 = _AALogSystem();
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        if (v25 == 1)
        {
          if (v27)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier found exactly one IS/GC account. Using it.", buf, 2u);
          }

          uint64_t v10 = [v15 objectAtIndexedSubscript:0];
        }
        else
        {
          if (v27)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier found several IS/GC accounts. Checking their usernames...", buf, 2u);
          }

          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id obj = v15;
          uint64_t v28 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = 0;
            uint64_t v31 = *(void *)v49;
            v45 = v15;
            v46 = v14;
            v44 = 0;
LABEL_40:
            uint64_t v32 = 0;
            while (1)
            {
              if (*(void *)v49 != v31) {
                objc_enumerationMutation(obj);
              }
              v33 = *(void **)(*((void *)&v48 + 1) + 8 * v32);
              uint64_t v34 = objc_msgSend(v33, "username", v44, v45, v46);
              v35 = (void *)v34;
              if (v30)
              {
                char v36 = [v30 isEqualToString:v34];

                if ((v36 & 1) == 0)
                {
                  v42 = _AALogSystem();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1A11D8000, v42, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier IS/GC accounts contain several usernames. Recommending nothing.", buf, 2u);
                  }
LABEL_59:
                  uint64_t v15 = v45;
                  uint64_t v14 = v46;
                  id v16 = v44;

                  uint64_t v10 = 0;
                  goto LABEL_60;
                }
              }
              else
              {
                uint64_t v30 = (void *)v34;
              }
              v37 = [v33 accountType];
              v38 = [v37 identifier];
              int v39 = [v4 isEqualToString:v38];

              if (v39)
              {
                v42 = _AALogSystem();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  v41 = [v33 accountType];
                  *(_DWORD *)buf = 138412290;
                  id v54 = v41;
                  _os_log_impl(&dword_1A11D8000, v42, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier can't recommend a username that already has an account of type %@. Recommending nothing.", buf, 0xCu);
                }
                goto LABEL_59;
              }
              if (v29 == ++v32)
              {
                uint64_t v29 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
                uint64_t v15 = v45;
                uint64_t v14 = v46;
                id v16 = v44;
                if (v29) {
                  goto LABEL_40;
                }
                goto LABEL_52;
              }
            }
          }
          uint64_t v30 = 0;
LABEL_52:

          v40 = _AALogSystem();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A11D8000, v40, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier all IS/GC usernames are identical. Using that.", buf, 2u);
          }

          uint64_t v10 = [obj firstObject];
LABEL_60:
        }
        goto LABEL_23;
      }
      uint64_t v17 = _AALogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v18 = "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier found no IS/GC accounts. Recommending nothing.";
        uint64_t v19 = v17;
        uint32_t v20 = 2;
        goto LABEL_21;
      }
    }

    uint64_t v10 = 0;
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v9 = _AALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier found exactly one iCloud account. Using it.", buf, 2u);
  }

  uint64_t v10 = [v6 objectAtIndexedSubscript:0];
LABEL_24:
  v21 = _AALogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [v10 username];
    *(_DWORD *)buf = 138412546;
    id v54 = v22;
    __int16 v55 = 2112;
    v56 = v10;
    _os_log_impl(&dword_1A11D8000, v21, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier returning appleID %@ from account %@", buf, 0x16u);
  }
  long long v23 = [v10 username];

  return v23;
}

- (uint64_t)aa_updatePropertiesForAppleAccount:()AppleAccount completion:
{
  return objc_msgSend(a1, "aa_updatePropertiesForAppleAccount:options:completion:", a3, 0, a4);
}

- (uint64_t)aa_updatePropertiesForAppleAccount:()AppleAccount options:completion:
{
  return objc_msgSend(a1, "aa_updatePropertiesForAppleAccount:options:serverInfo:completion:", a3, a4, 0, a5);
}

- (void)aa_updatePropertiesForAppleAccount:()AppleAccount options:serverInfo:completion:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 identifier];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    id v16 = objc_msgSend(v10, "aa_authToken");
    if (v16)
    {
    }
    else
    {
      uint64_t v17 = objc_msgSend(v10, "aa_password");

      if (!v17)
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __97__ACAccountStore_AppleAccount__aa_updatePropertiesForAppleAccount_options_serverInfo_completion___block_invoke;
        v18[3] = &unk_1E5A4A120;
        void v18[4] = a1;
        id v19 = v10;
        id v20 = v12;
        id v21 = v13;
        [a1 renewCredentialsForAccount:v19 options:v11 completion:v18];

        goto LABEL_6;
      }
    }
  }
  [a1 _performUpdateRequestWithAccount:v10 serverInfo:v12 completion:v13];
LABEL_6:
}

- (void)_performUpdateRequestWithAccount:()AppleAccount serverInfo:completion:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = _AASignpostLogSystem();
  os_signpost_id_t v11 = _AASignpostCreate(v10);
  uint64_t v13 = v12;

  uint64_t v14 = _AASignpostLogSystem();
  uint64_t v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    id v16 = [v7 accountType];
    uint64_t v17 = [v16 identifier];
    *(_DWORD *)buf = 138543362;
    os_signpost_id_t v30 = (os_signpost_id_t)v17;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "GetAccountSettings", " AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0xCu);
  }
  uint64_t v18 = _AASignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v7 accountType];
    id v20 = [v19 identifier];
    *(_DWORD *)buf = 134218242;
    os_signpost_id_t v30 = v11;
    __int16 v31 = 2114;
    uint64_t v32 = v20;
    _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GetAccountSettings  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x16u);
  }
  id v21 = [[AAUpdateProvisioningRequest alloc] initWithAccount:v7];
  [(AAUpdateProvisioningRequest *)v21 setServerInfo:v9];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __87__ACAccountStore_AppleAccount___performUpdateRequestWithAccount_serverInfo_completion___block_invoke;
  v24[3] = &unk_1E5A4A170;
  os_signpost_id_t v27 = v11;
  uint64_t v28 = v13;
  id v25 = v7;
  id v26 = v8;
  id v22 = v8;
  id v23 = v7;
  [(AARequest *)v21 performRequestWithHandler:v24];
}

- (void)aa_loginAndUpdateiCloudAccount:()AppleAccount withCompletion:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[AAiCloudLoginAccountRequester delegateParamsForiCloudOnly];
  objc_msgSend(a1, "aa_loginAndUpdateiCloudAccount:delegateParams:withCompletion:", v7, v8, v6);
}

- (void)aa_loginAndUpdateiCloudAccount:()AppleAccount delegateParams:withCompletion:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 accountType];
  os_signpost_id_t v11 = [v10 identifier];
  char v12 = [v11 isEqualToString:*MEMORY[0x1E4F17750]];

  if ((v12 & 1) == 0)
  {
    uint64_t v15 = _AALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ACAccountStore(AppleAccount) aa_loginAndUpdateiCloudAccount:delegateParams:withCompletion:](v7, v15);
    }

    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = -18;
    goto LABEL_10;
  }
  uint64_t v13 = [v8 objectForKey:@"com.apple.mobileme"];

  if (!v13)
  {
    uint64_t v18 = _AALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ACAccountStore(AppleAccount) aa_loginAndUpdateiCloudAccount:delegateParams:withCompletion:](v18);
    }

    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = -3;
LABEL_10:
    objc_msgSend(v16, "aa_errorWithCode:", v17);
    uint64_t v14 = (AAiCloudLoginAccountRequester *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, AAiCloudLoginAccountRequester *))v9 + 2))(v9, 0, 0, v14);
    goto LABEL_11;
  }
  uint64_t v14 = objc_alloc_init(AAiCloudLoginAccountRequester);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__ACAccountStore_AppleAccount__aa_loginAndUpdateiCloudAccount_delegateParams_withCompletion___block_invoke;
  v19[3] = &unk_1E5A4A198;
  id v21 = v9;
  id v20 = v7;
  [(AAiCloudLoginAccountRequester *)v14 loginWithAccount:v20 forDelegates:v8 completion:v19];

LABEL_11:
}

- (void)aa_registerAppleAccount:()AppleAccount withCompletion:
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[AARemoteServer sharedServer];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__ACAccountStore_AppleAccount__aa_registerAppleAccount_withCompletion___block_invoke;
  v9[3] = &unk_1E5A4A1C0;
  id v10 = v5;
  id v8 = v5;
  [v7 registerAccount:v6 withHSA:0 completion:v9];
}

- (void)aa_registerAppleAccountWithHSA:()AppleAccount completion:
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[AARemoteServer sharedServer];
  [v7 registerAccount:v6 withHSA:1 completion:v5];
}

- (id)aa_grandSlamAccountForiCloudAccount:()AppleAccount
{
  if (a3)
  {
    v3 = objc_msgSend(a1, "aida_accountForiCloudAccount:");
  }
  else
  {
    id v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ACAccountStore(AppleAccount) aa_grandSlamAccountForiCloudAccount:](v4, v5, v6, v7, v8, v9, v10, v11);
    }

    v3 = 0;
  }

  return v3;
}

- (id)aa_grandSlamAccountForAltDSID:()AppleAccount
{
  if (a3)
  {
    v3 = objc_msgSend(a1, "aida_accountForAltDSID:");
  }
  else
  {
    id v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ACAccountStore(AppleAccount) aa_grandSlamAccountForAltDSID:](v4, v5, v6, v7, v8, v9, v10, v11);
    }

    v3 = 0;
  }

  return v3;
}

- (id)aa_authKitAccountForAltDSID:()AppleAccount
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v18[0] = *MEMORY[0x1E4F177E0];
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    uint64_t v6 = [a1 accountsWithAccountTypeIdentifiers:v5 error:0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__ACAccountStore_AppleAccount__aa_authKitAccountForAltDSID___block_invoke;
    v16[3] = &unk_1E5A4A0F8;
    id v17 = v4;
    uint64_t v7 = objc_msgSend(v6, "aaf_firstObjectPassingTest:", v16);
  }
  else
  {
    uint64_t v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ACAccountStore(AppleAccount) aa_authKitAccountForAltDSID:](v5, v8, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)aa_appleAccountWithUsername:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)aa_appleAccountWithPersonID:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)aa_appleAccountWithAltDSID:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)aa_accountsEnabledForDataclass:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)aa_loginAndUpdateiCloudAccount:()AppleAccount delegateParams:withCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A11D8000, log, OS_LOG_TYPE_ERROR, "Rejecting attempt to call iCloud login without specifying iCloud delegate parameters", v1, 2u);
}

- (void)aa_loginAndUpdateiCloudAccount:()AppleAccount delegateParams:withCompletion:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [a1 accountType];
  id v4 = [v3 identifier];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Rejecting attempt to call iCloud login on non-iCloud account of type %@", (uint8_t *)&v5, 0xCu);
}

- (void)aa_grandSlamAccountForiCloudAccount:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)aa_grandSlamAccountForAltDSID:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)aa_authKitAccountForAltDSID:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end