@interface AIDAAccountNotification
- (id)_appleIDAuthenticationAccountsMatchingAppleAccount:(id)a3 inStore:(id)a4;
- (id)_supportedServiceIDs;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation AIDAAccountNotification

- (id)_supportedServiceIDs
{
  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F26D68];
  v6[0] = *MEMORY[0x263F26D50];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x263F26D58];
  v6[2] = *MEMORY[0x263F26D60];
  v6[3] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  return v4;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v37 = a6;
  v10 = _AIDALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24056E000, v10, OS_LOG_TYPE_DEFAULT, "AIDA Notification plugin running", buf, 2u);
  }

  if (a4 == 3)
  {
    v11 = [v37 accountType];
    v12 = [v11 identifier];
    int v13 = [v12 isEqualToString:*MEMORY[0x263EFAE68]];

    if (v13)
    {
      id v35 = v9;
      v14 = _AIDALogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24056E000, v14, OS_LOG_TYPE_DEFAULT, "An Apple ID account was deleted", buf, 2u);
      }

      long long v45 = 0u;
      long long v46 = 0u;
      long long v44 = 0u;
      long long v43 = 0u;
      v15 = [(AIDAAccountNotification *)self _supportedServiceIDs];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v50 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v44 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            v21 = _AIDALogSystem();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v49 = v20;
              _os_log_impl(&dword_24056E000, v21, OS_LOG_TYPE_DEFAULT, "Deleting %@ service token", buf, 0xCu);
            }

            id v42 = 0;
            [MEMORY[0x263F230F0] removeCredentialForAccount:v37 clientID:v20 error:&v42];
            id v22 = v42;
            if (v22)
            {
              v23 = _AIDALogSystem();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v49 = v20;
                _os_log_impl(&dword_24056E000, v23, OS_LOG_TYPE_DEFAULT, "Error: Couldn't delete %@ credentials", buf, 0xCu);
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v50 count:16];
        }
        while (v17);
      }

      id v9 = v35;
    }
    v24 = [v37 accountType];
    v25 = [v24 identifier];
    int v26 = [v25 isEqual:*MEMORY[0x263EFAE58]];

    if (v26)
    {
      v27 = [(AIDAAccountNotification *)self _appleIDAuthenticationAccountsMatchingAppleAccount:v37 inStore:v9];
      if ([v27 count])
      {
        id v36 = v9;
        v28 = _AIDALogSystem();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24056E000, v28, OS_LOG_TYPE_DEFAULT, "iCloud account deleted, so removing all related AIDA accounts...", buf, 2u);
        }

        id v29 = objc_alloc_init(MEMORY[0x263EFB210]);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v30 = v27;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v39 != v33) {
                objc_enumerationMutation(v30);
              }
              objc_msgSend(v29, "removeAccount:withCompletionHandler:");
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v32);
        }

        id v9 = v36;
      }
    }
  }
}

- (id)_appleIDAuthenticationAccountsMatchingAppleAccount:(id)a3 inStore:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v19 = [v6 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAE68]];
  uint64_t v20 = v6;
  v7 = objc_msgSend(v6, "_accountsWithAcountType:error:");
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v13 = objc_msgSend(v12, "aida_alternateDSID");
        v14 = objc_msgSend(v5, "aida_alternateDSID");
        if ([v13 isEqualToString:v14])
        {
        }
        else
        {
          v15 = [v12 username];
          uint64_t v16 = [v5 username];
          int v17 = [v15 isEqualToString:v16];

          if (!v17) {
            continue;
          }
        }
        [v22 addObject:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  return v22;
}

@end