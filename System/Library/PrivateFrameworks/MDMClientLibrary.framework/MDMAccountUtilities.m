@interface MDMAccountUtilities
+ (BOOL)updateOrganizationName:(id)a3 rmAccountIdentifier:(id)a4 personaID:(id)a5 error:(id *)a6;
+ (id)_createMissingBearerTokenError;
+ (id)_createMissingRMAccountError;
+ (id)_longLivedTokenFromRMAccount:(id)a3 inStore:(id)a4;
+ (id)_shortLivedTokenFromRMAccount:(id)a3 inStore:(id)a4;
+ (id)authenticatorForRMAccountID:(id)a3;
+ (id)bearerTokenForRMAccountID:(id)a3 error:(id *)a4;
+ (id)maidPropertiesForRMAccountID:(id)a3;
+ (id)rmAccountWithIdentifier:(id)a3 fromStore:(id)a4 error:(id *)a5;
+ (void)removeMAIDShortLivedTokenWithAccount:(id)a3;
+ (void)stashMAIDShortLivedTokenWithAccount:(id)a3 authenticationResults:(id)a4;
@end

@implementation MDMAccountUtilities

+ (id)rmAccountWithIdentifier:(id)a3 fromStore:(id)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F179C8] defaultStore];
  }
  v10 = objc_msgSend(v9, "dmc_remoteManagementAccountForIdentifier:", v8);
  if (!v10)
  {
    v11 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      id v14 = v8;
      _os_log_impl(&dword_1DD340000, v11, OS_LOG_TYPE_ERROR, "No RMAccount with ID: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    if (a5)
    {
      *a5 = [a1 _createMissingRMAccountError];
    }
  }

  return v10;
}

+ (void)stashMAIDShortLivedTokenWithAccount:(id)a3 authenticationResults:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = DMCAKAuthenticationIDMSTokenKey();
  id v8 = [v6 objectForKeyedSubscript:v7];

  id v9 = [v8 objectForKeyedSubscript:@"com.apple.gs.mdm.auth"];
  v10 = *(NSObject **)(DMCLogObjects() + 8);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11)
    {
      v12 = v10;
      int v13 = [v5 identifier];
      int v17 = 138543618;
      v18 = @"com.apple.gs.mdm.auth";
      __int16 v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_1DD340000, v12, OS_LOG_TYPE_DEBUG, "Stashing %{public}@ token on RMAccount with ID: %{public}@", (uint8_t *)&v17, 0x16u);
    }
    id v14 = [v8 objectForKeyedSubscript:@"com.apple.gs.mdm.auth"];
    [v5 setObject:v14 forKeyedSubscript:@"MAIDShortLivedTokenField"];
  }
  else if (v11)
  {
    uint64_t v15 = v10;
    v16 = [v5 identifier];
    int v17 = 138543618;
    v18 = @"com.apple.gs.mdm.auth";
    __int16 v19 = 2114;
    v20 = v16;
    _os_log_impl(&dword_1DD340000, v15, OS_LOG_TYPE_DEBUG, "No %{public}@ token to stash on RMAccount with ID: %{public}@", (uint8_t *)&v17, 0x16u);
  }
}

+ (void)removeMAIDShortLivedTokenWithAccount:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = v4;
    id v6 = [v3 identifier];
    int v7 = 138543618;
    id v8 = @"com.apple.gs.mdm.auth";
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_DEBUG, "Removing stashed %{public}@ token from RMAccount with ID: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [v3 setObject:0 forKeyedSubscript:@"MAIDShortLivedTokenField"];
}

+ (id)authenticatorForRMAccountID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v12 = 0;
  id v5 = [a1 rmAccountWithIdentifier:v4 fromStore:0 error:&v12];
  id v6 = v12;
  if (v5)
  {
    int v7 = 0;
    switch(objc_msgSend(v5, "dmc_enrollmentMethod"))
    {
      case 0:
      case 3:
      case 4:
        break;
      case 1:
        id v8 = MDMMAIDBearerTokenAuthenticator;
        goto LABEL_12;
      case 2:
        id v8 = MDMBearerTokenAuthenticator;
        goto LABEL_12;
      case 5:
        id v8 = MDMOAuth2Authenticator;
LABEL_12:
        int v7 = (void *)[[v8 alloc] initWithRMAccountID:v4];
        break;
      default:
        __int16 v9 = *(NSObject **)(DMCLogObjects() + 8);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_7;
        }
        *(_DWORD *)buf = 138543362;
        id v14 = v4;
        v10 = "Failed to match RM account enrollment method: %{public}@";
        goto LABEL_6;
    }
  }
  else
  {
    __int16 v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v4;
      v10 = "Failed to find RM account: %{public}@";
LABEL_6:
      _os_log_impl(&dword_1DD340000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    }
LABEL_7:
    int v7 = 0;
  }

  return v7;
}

+ (id)bearerTokenForRMAccountID:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [a1 rmAccountWithIdentifier:v6 fromStore:0 error:a4];
  id v8 = v7;
  if (v7)
  {
    __int16 v9 = objc_msgSend(v7, "dmc_bearerToken");
    if (!v9)
    {
      v10 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138543362;
        id v13 = v6;
        _os_log_impl(&dword_1DD340000, v10, OS_LOG_TYPE_ERROR, "No bearer token in RMAccount with ID: %{public}@", (uint8_t *)&v12, 0xCu);
      }
      if (a4)
      {
        *a4 = [a1 _createMissingBearerTokenError];
      }
    }
  }
  else
  {
    __int16 v9 = 0;
  }

  return v9;
}

+ (id)maidPropertiesForRMAccountID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F179C8];
  id v5 = a3;
  id v6 = [v4 defaultStore];
  int v7 = [a1 rmAccountWithIdentifier:v5 fromStore:v6 error:0];

  if (v7)
  {
    id v8 = objc_opt_new();
    __int16 v9 = [v7 username];
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F5E708]];

    v10 = objc_msgSend(v7, "dmc_altDSID");
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F5E6E8]];

    uint64_t v11 = objc_msgSend(v7, "dmc_DSID");
    [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F5E6F0]];

    int v12 = [a1 _shortLivedTokenFromRMAccount:v7 inStore:v6];
    if (v12)
    {
      [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F5E700]];
    }
    else
    {
      id v13 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = v13;
        uint64_t v15 = objc_msgSend(v7, "dmc_altDSID");
        int v21 = 138543362;
        v22 = v15;
        _os_log_impl(&dword_1DD340000, v14, OS_LOG_TYPE_ERROR, "Unable to find short lived token for RM account: %{public}@", (uint8_t *)&v21, 0xCu);
      }
    }
    v16 = [a1 _longLivedTokenFromRMAccount:v7 inStore:v6];
    if (v16)
    {
      [v8 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F5E6F8]];
    }
    else
    {
      int v17 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = v17;
        __int16 v19 = objc_msgSend(v7, "dmc_altDSID");
        int v21 = 138543362;
        v22 = v19;
        _os_log_impl(&dword_1DD340000, v18, OS_LOG_TYPE_ERROR, "Unable to find long lived token for RM account: %{public}@", (uint8_t *)&v21, 0xCu);
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_shortLivedTokenFromRMAccount:(id)a3 inStore:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"MAIDShortLivedTokenField"];
  if (!v7)
  {
    id v13 = objc_msgSend(v5, "dmc_altDSID");
    uint64_t v14 = objc_msgSend(v6, "aida_accountForAltDSID:", v13);

    if (v14)
    {
      uint64_t v15 = objc_msgSend(v14, "aida_tokenForService:", @"com.apple.gs.mdm.auth");
      if (v15)
      {
LABEL_12:
        id v12 = v15;

        goto LABEL_13;
      }
      v16 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v17 = v16;
        v18 = objc_msgSend(v5, "dmc_altDSID");
        int v23 = 138543618;
        v24 = @"com.apple.gs.mdm.auth";
        __int16 v25 = 2114;
        v26 = v18;
        _os_log_impl(&dword_1DD340000, v17, OS_LOG_TYPE_DEBUG, "Unable to find %{public}@ token on idms account for RM account: %{public}@", (uint8_t *)&v23, 0x16u);
      }
    }
    else
    {
      __int16 v19 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = v19;
        objc_msgSend(v5, "dmc_altDSID");
        int v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v23 = 138543362;
        v24 = v21;
        _os_log_impl(&dword_1DD340000, v20, OS_LOG_TYPE_DEBUG, "Unable to find idms account for RM account: %{public}@", (uint8_t *)&v23, 0xCu);
      }
    }
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  id v8 = (void *)v7;
  __int16 v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = v9;
    uint64_t v11 = objc_msgSend(v5, "dmc_altDSID");
    int v23 = 138543618;
    v24 = @"com.apple.gs.mdm.auth";
    __int16 v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_1DD340000, v10, OS_LOG_TYPE_DEBUG, "Using stashed %{public}@ token on RM account: %{public}@", (uint8_t *)&v23, 0x16u);
  }
  id v12 = v8;
LABEL_13:

  return v12;
}

+ (id)_longLivedTokenFromRMAccount:(id)a3 inStore:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(v5, "dmc_altDSID");
  id v8 = objc_msgSend(v6, "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", v7);

  if (!v8)
  {
    __int16 v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      uint64_t v11 = objc_msgSend(v5, "dmc_altDSID");
      int v14 = 138543362;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1DD340000, v10, OS_LOG_TYPE_ERROR, "Unable to find iCloud account for RM account: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v12 = objc_msgSend(v8, "dmc_mdmServerToken");

  return v12;
}

+ (BOOL)updateOrganizationName:(id)a3 rmAccountIdentifier:(id)a4 personaID:(id)a5 error:(id *)a6
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [MEMORY[0x1E4F179C8] defaultStore];
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke;
  v77[3] = &unk_1E6CBC708;
  id v14 = v10;
  id v78 = v14;
  v48 = (void *)MEMORY[0x1E01B2E10](v77);
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy_;
  v75 = __Block_byref_object_dispose_;
  id v76 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  char v70 = 1;
  uint64_t v15 = objc_msgSend(v13, "dmc_remoteManagementAccountForIdentifier:", v11);
  uint64_t v16 = v15;
  if (v15)
  {
    int v17 = [v15 accountDescription];
    int v18 = [v17 isEqualToString:v14];

    if (v18)
    {
      __int16 v19 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v80 = v11;
        _os_log_impl(&dword_1DD340000, v19, OS_LOG_TYPE_DEFAULT, "RM account organization name does not need to be changed: %{public}@", buf, 0xCu);
      }
      BOOL v20 = 1;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E4F5E7B0];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke_7;
      v61[3] = &unk_1E6CBC730;
      v65 = &v67;
      id v25 = v13;
      id v62 = v25;
      id v63 = v11;
      v66 = &v71;
      id v26 = v48;
      id v64 = v26;
      id v27 = (id)[v24 performBlockUnderPersona:v12 block:v61];
      if (*((unsigned char *)v68 + 24))
      {
        v28 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DD340000, v28, OS_LOG_TYPE_DEFAULT, "RM Account Saved Successfully.", buf, 2u);
        }
        v29 = (void *)MEMORY[0x1E4F5E7B0];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke_9;
        v55[3] = &unk_1E6CBC730;
        v59 = &v67;
        id v30 = v25;
        id v56 = v30;
        id v31 = v16;
        id v57 = v31;
        v60 = &v71;
        id v32 = v26;
        id v58 = v32;
        id v33 = (id)[v29 performBlockUnderPersona:v12 block:v55];
        if (*((unsigned char *)v68 + 24))
        {
          v34 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DD340000, v34, OS_LOG_TYPE_DEFAULT, "iCloud Account Saved Successfully.", buf, 2u);
          }
          v35 = (void *)MEMORY[0x1E4F5E7B0];
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke_10;
          v49[3] = &unk_1E6CBC730;
          v53 = &v67;
          id v50 = v30;
          id v51 = v31;
          v54 = &v71;
          id v52 = v32;
          id v36 = (id)[v35 performBlockUnderPersona:v12 block:v49];
          BOOL v20 = *((unsigned char *)v68 + 24) != 0;
          if (*((unsigned char *)v68 + 24))
          {
            v37 = *(NSObject **)DMCLogObjects();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DD340000, v37, OS_LOG_TYPE_DEFAULT, "iTunes Account Saved Successfully.", buf, 2u);
            }
          }
          else
          {
            v44 = *(NSObject **)DMCLogObjects();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v45 = (void *)v72[5];
              *(_DWORD *)buf = 138543362;
              id v80 = v45;
              _os_log_impl(&dword_1DD340000, v44, OS_LOG_TYPE_ERROR, "Error Updating iTunes Account: %{public}@", buf, 0xCu);
            }
            if (a6)
            {
              v46 = (void *)v72[5];
              if (v46) {
                *a6 = v46;
              }
            }
          }
        }
        else
        {
          v41 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v42 = (void *)v72[5];
            *(_DWORD *)buf = 138543362;
            id v80 = v42;
            _os_log_impl(&dword_1DD340000, v41, OS_LOG_TYPE_ERROR, "Error Updating iCloud Account: %{public}@", buf, 0xCu);
          }
          if (a6 && (v43 = (void *)v72[5]) != 0)
          {
            BOOL v20 = 0;
            *a6 = v43;
          }
          else
          {
            BOOL v20 = 0;
          }
        }
      }
      else
      {
        v38 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = (void *)v72[5];
          *(_DWORD *)buf = 138543362;
          id v80 = v39;
          _os_log_impl(&dword_1DD340000, v38, OS_LOG_TYPE_ERROR, "Error Updating RM Account: %{public}@", buf, 0xCu);
        }
        if (a6 && (v40 = (void *)v72[5]) != 0)
        {
          BOOL v20 = 0;
          *a6 = v40;
        }
        else
        {
          BOOL v20 = 0;
        }
      }
    }
  }
  else
  {
    int v21 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v80 = v11;
      _os_log_impl(&dword_1DD340000, v21, OS_LOG_TYPE_ERROR, "Unable to find RM account: %{public}@", buf, 0xCu);
    }
    if (a6)
    {
      v22 = [a1 _createMissingRMAccountError];
      int v23 = v22;
      if (v22) {
        *a6 = v22;
      }
    }
    BOOL v20 = 0;
  }

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);

  return v20;
}

uint64_t __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAccountDescription:*(void *)(a1 + 32)];
}

void __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke_7(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v3, &obj, v4);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

void __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4F17750];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "dmc_altDSID");
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v5 + 40);
  LOBYTE(v2) = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, *(void *)(a1 + 48));
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2;
}

void __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4F17890];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "dmc_altDSID");
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v5 + 40);
  LOBYTE(v2) = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, *(void *)(a1 + 48));
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2;
}

+ (id)_createMissingRMAccountError
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E6B0];
  uint64_t v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15005, v4, 0, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

+ (id)_createMissingBearerTokenError
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E6B0];
  uint64_t v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15006, v4, 0, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

@end