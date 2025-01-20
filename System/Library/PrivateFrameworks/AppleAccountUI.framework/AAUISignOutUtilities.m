@interface AAUISignOutUtilities
- (void)signOutServiceAccountsWithServiceOwnersManager:(id)a3 forAltDSID:(id)a4 DSID:(id)a5 context:(id)a6 completion:(id)a7;
@end

@implementation AAUISignOutUtilities

- (void)signOutServiceAccountsWithServiceOwnersManager:(id)a3 forAltDSID:(id)a4 DSID:(id)a5 context:(id)a6 completion:(id)a7
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v37 = a5;
  id v36 = a6;
  id v34 = a7;
  v13 = _AAUILogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v49 = v12;
    _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Signing out service accounts with altDSID: %@", buf, 0xCu);
  }

  group = dispatch_group_create();
  v14 = [(id)objc_opt_class() supportedServices];
  v15 = (void *)[v14 mutableCopy];

  v33 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263F26D28], *MEMORY[0x263F26D48], 0);
  objc_msgSend(v15, "removeObjectsInArray:");
  v16 = _AAUILogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[AAUISignOutUtilities signOutServiceAccountsWithServiceOwnersManager:forAltDSID:DSID:context:completion:]((uint64_t)v15, v16);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
  v19 = v37;
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v45;
    id obj = v17;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v24 = [v11 accountForService:v23];
        if (v24)
        {
          v25 = [v11 altDSIDForAccount:v24 service:v23];
          v26 = v25;
          if (v12 && [v25 isEqualToString:v12])
          {
            v27 = _AAUILogSystem();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v49 = v23;
              _os_log_impl(&dword_209754000, v27, OS_LOG_TYPE_DEFAULT, "Service account for %@ has matching altDSID...", buf, 0xCu);
            }
LABEL_22:

            v31 = _AAUILogSystem();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v49 = v23;
              __int16 v50 = 2112;
              v51 = v24;
              _os_log_impl(&dword_209754000, v31, OS_LOG_TYPE_DEFAULT, "Signing out service %@ with account %@...", buf, 0x16u);
            }

            dispatch_group_enter(group);
            v42[0] = MEMORY[0x263EF8330];
            v42[1] = 3221225472;
            v42[2] = __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke;
            v42[3] = &unk_263F934B8;
            v42[4] = v23;
            v43 = group;
            [v11 signOutService:v23 withContext:v36 completion:v42];

            goto LABEL_30;
          }
          v28 = _AAUILogSystem();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v49 = v23;
            __int16 v50 = 2112;
            v51 = v26;
            _os_log_impl(&dword_209754000, v28, OS_LOG_TYPE_DEFAULT, "Service account for %@ has altDSID (%@) that does not match, checking DSID...", buf, 0x16u);
          }

          v29 = [v11 DSIDForAccount:v24 service:v23];
          v27 = v29;
          if (v19 && [v29 isEqualToString:v19])
          {
            v30 = _AAUILogSystem();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v49 = v23;
              _os_log_impl(&dword_209754000, v30, OS_LOG_TYPE_DEFAULT, "Service account for %@ has matching DSID...", buf, 0xCu);
            }

            v19 = v37;
            goto LABEL_22;
          }
          v32 = _AAUILogSystem();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v49 = v23;
            __int16 v50 = 2112;
            v51 = v27;
            _os_log_impl(&dword_209754000, v32, OS_LOG_TYPE_DEFAULT, "Service account for %@ has DSID (%@) that does not match, bailing!", buf, 0x16u);
          }

          v19 = v37;
        }
        else
        {
          v26 = _AAUILogSystem();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v23;
            _os_log_impl(&dword_209754000, v26, OS_LOG_TYPE_DEFAULT, "No service account found for %@, no sign out necessary.", buf, 0xCu);
          }
        }
LABEL_30:
      }
      id v17 = obj;
      uint64_t v20 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v20);
  }

  if (v34)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke_32;
    block[3] = &unk_263F92048;
    id v40 = v17;
    id v41 = v34;
    dispatch_group_notify(group, MEMORY[0x263EF83A0], block);
  }
}

void __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = @"NO";
    int v9 = 138412802;
    if (a2) {
      v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Signed out service %@ with success: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke_32(uint64_t a1)
{
  v2 = [MEMORY[0x263F290F0] sharedInstance];
  v3 = [v2 primaryAuthKitAccount];
  if (!v3)
  {
    id v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Primary AuthKit account is already removed. All retained services were likely removed.", v12, 2u);
    }
    goto LABEL_13;
  }
  v4 = [v2 servicesUsingAccount:v3];
  id v5 = [v4 mutableCopy];

  v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke_32_cold_2((uint64_t)v5, v6);
  }

  uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 32)];
  [v5 intersectSet:v7];

  uint64_t v8 = [v5 count];
  int v9 = _AAUILogSystem();
  uint64_t v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Removed set services as expected.", buf, 2u);
    }

LABEL_13:
    __int16 v11 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke_32_cold_1(v10);
  }

  __int16 v11 = [MEMORY[0x263F087E8] errorWithDomain:@"AAUISignOutErrorDomain" code:-11002 userInfo:0];
LABEL_14:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)signOutServiceAccountsWithServiceOwnersManager:(uint64_t)a1 forAltDSID:(NSObject *)a2 DSID:context:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Attempting to remove services %@", (uint8_t *)&v2, 0xCu);
}

void __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke_32_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Account still contains services that were attempted to be removed", v1, 2u);
}

void __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke_32_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Remaining services %@", (uint8_t *)&v2, 0xCu);
}

@end