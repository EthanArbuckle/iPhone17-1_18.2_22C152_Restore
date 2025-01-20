@interface ACAccountStore
@end

@implementation ACAccountStore

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    v8 = os_log_GKDaemon;
    if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "NOT GRANTED ACCESS TO GAME CENTER ACCOUNTS DUE TO AN ACCOUNT INTERNAL ERROR", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_77;
    v10[3] = &unk_1E6470780;
    v10[4] = v9;
    id v11 = v5;
    id v13 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    [v9 requestAccessToAccountsWithType:v11 options:0 completion:v10];
  }
}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F177B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_2;
  v7[3] = &unk_1E64707A8;
  id v5 = *(void **)(a1 + 32);
  id v9 = v3;
  v7[4] = v5;
  id v10 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v6 = v3;
  [v5 accountTypeWithIdentifier:v4 completion:v7];
}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_77(uint64_t a1, char a2, void *a3)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) accountsWithAccountType:*(void *)(a1 + 40)];
    id v7 = [MEMORY[0x1E4F1CA48] array];
    id v58 = v5;
    if (![v6 count])
    {
      obuint64_t j = v6;
      goto LABEL_26;
    }
    id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"username" ascending:0];
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:v8];
    id v10 = [v6 sortedArrayUsingDescriptors:v9];

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v11 = v10;
    obuint64_t j = v11;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v79 objects:v87 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v56 = v9;
      v59 = v8;
      id v11 = 0;
      uint64_t v14 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v80 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          if (v11)
          {
            v17 = [*(id *)(*((void *)&v79 + 1) + 8 * i) username];
            v18 = [v11 username];
            char v19 = [v17 isEqual:v18];

            if (v19)
            {
              v20 = [v16 creationDate];
              v21 = [v11 creationDate];
              uint64_t v22 = [v20 compare:v21];

              v23 = *(void **)(a1 + 32);
              if (v22 == 1)
              {
                v77[0] = MEMORY[0x1E4F143A8];
                v77[1] = 3221225472;
                v77[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_83;
                v77[3] = &unk_1E6470730;
                id v78 = v11;
                id v24 = v11;
                [v23 removeAccount:v24 withCompletionHandler:v77];
                id v11 = v16;
              }
              else
              {
                v76[0] = MEMORY[0x1E4F143A8];
                v76[1] = 3221225472;
                v76[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_85;
                v76[3] = &unk_1E6470730;
                v76[4] = v16;
                [v23 removeAccount:v16 withCompletionHandler:v76];
              }
            }
            else
            {
              [v7 addObject:v11];
              id v25 = v16;

              id v11 = v25;
            }
          }
          else
          {
            id v11 = v16;
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
      }
      while (v13);

      id v8 = v59;
      id v9 = v56;
      if (!v11) {
        goto LABEL_20;
      }
      [v7 addObject:v11];
    }

LABEL_20:
    id v5 = v58;
LABEL_26:
    if ((unint64_t)objc_msgSend(v7, "count", v56) >= 2)
    {
      v28 = [MEMORY[0x1E4F1CA60] dictionary];
      id v61 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v57 = v7;
      id v29 = v7;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v86 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v73;
        v33 = @"playerID";
        uint64_t v60 = a1;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v73 != v32) {
              objc_enumerationMutation(v29);
            }
            v35 = *(void **)(*((void *)&v72 + 1) + 8 * j);
            v36 = objc_msgSend(v35, "accountPropertyForKey:", v33, v57);
            if ([v36 length])
            {
              v37 = [v28 objectForKeyedSubscript:v36];

              if (v37)
              {
                v38 = [v28 objectForKeyedSubscript:v36];
                [v38 addObject:v35];
              }
              else
              {
                v38 = [MEMORY[0x1E4F1CA48] arrayWithObject:v35];
                [v28 setObject:v38 forKeyedSubscript:v36];
              }
            }
            else
            {
              v38 = [v35 accountPropertyForKey:@"altDSID"];
              if (v38)
              {
                uint64_t v39 = v31;
                uint64_t v40 = v32;
                v41 = v28;
                id v42 = v29;
                v43 = v33;
                v44 = os_log_GKGeneral;
                if (!os_log_GKGeneral)
                {
                  id v45 = GKOSLoggers();
                  v44 = os_log_GKGeneral;
                }
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v85 = v38;
                  _os_log_debug_impl(&dword_1C2D22000, v44, OS_LOG_TYPE_DEBUG, "GKAuth:telling authkit account is not in use using altDSID:%@", buf, 0xCu);
                }
                [v61 setAppleIDWithAltDSID:v38 inUse:0 forService:6];
                v33 = v43;
                id v29 = v42;
                v28 = v41;
                uint64_t v32 = v40;
                uint64_t v31 = v39;
                a1 = v60;
              }
              [v29 removeObject:v35];
              v46 = *(void **)(a1 + 32);
              v71[0] = MEMORY[0x1E4F143A8];
              v71[1] = 3221225472;
              v71[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_87;
              v71[3] = &unk_1E6470730;
              v71[4] = v35;
              [v46 removeAccount:v35 withCompletionHandler:v71];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v72 objects:v86 count:16];
        }
        while (v31);
      }

      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_88;
      v67[3] = &unk_1E6470758;
      id v68 = v61;
      id v47 = v29;
      uint64_t v48 = *(void *)(a1 + 32);
      id v69 = v47;
      uint64_t v70 = v48;
      id v49 = v61;
      [v28 enumerateKeysAndObjectsUsingBlock:v67];

      id v7 = v57;
      id v5 = v58;
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v50 = v7;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v63 objects:v83 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v52; ++k)
        {
          if (*(void *)v64 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          if ([v55 count]) {
            [*(id *)(a1 + 48) addObjectsFromArray:v55];
          }
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v63 objects:v83 count:16];
      }
      while (v52);
    }

    goto LABEL_56;
  }
  if (!os_log_GKGeneral) {
    id v26 = GKOSLoggers();
  }
  v27 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v27, OS_LOG_TYPE_INFO, "NOT GRANTED ACCESS TO GAME CENTER ACCOUNTS", buf, 2u);
  }
LABEL_56:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_83(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v7 = GKOSLoggers();
    id v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_DEBUG, "DELETE ACCOUNT(%@): success:%d error:%@", (uint8_t *)&v9, 0x1Cu);
  }
}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_85(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v7 = GKOSLoggers();
    id v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_DEBUG, "DELETE ACCOUNT(%@): success:%d error:%@", (uint8_t *)&v9, 0x1Cu);
  }
}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_87(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v6 = GKOSLoggers();
    id v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_87_cold_1(a1, v5, v7, v8, v9, v10, v11, v12);
  }
}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_88(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v14 = v4;
    obuint64_t j = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v10 = [v9 accountPropertyForKey:@"altDSID"];
          if (v10)
          {
            uint64_t v11 = os_log_GKGeneral;
            if (!os_log_GKGeneral)
            {
              id v12 = GKOSLoggers();
              uint64_t v11 = os_log_GKGeneral;
            }
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v22 = v10;
              _os_log_debug_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_DEBUG, "GKAuth:telling authkit account is not in use using altDSID:%@", buf, 0xCu);
            }
            [*(id *)(a1 + 32) setAppleIDWithAltDSID:v10 inUse:0 forService:6];
          }
          [*(id *)(a1 + 40) removeObject:v9];
          __int16 v13 = *(void **)(a1 + 48);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_89;
          v16[3] = &unk_1E6470730;
          v16[4] = v9;
          [v13 removeAccount:v9 withCompletionHandler:v16];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v6);
    }

    id v4 = v14;
  }
}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_89(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v6 = GKOSLoggers();
    uint64_t v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_89_cold_1(a1, v5, v7, v8, v9, v10, v11, v12);
  }
}

void __74__ACAccountStore_GameCenter___gkSetScope_forCredential_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    uint64_t v7 = (void *)os_log_GKAccount;
    if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
      __74__ACAccountStore_GameCenter___gkSetScope_forCredential_completionHandler___block_invoke_cold_1(a1, v7, (uint64_t)v5);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);
  }
}

uint64_t __47__ACAccountStore_GameCenter___gkAllCredentials__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _gkCredentials];
}

uint64_t __62__ACAccountStore_GameCenter___gkAllCredentialsForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _gkCredentialsForEnvironment:*(void *)(a1 + 32)];
}

uint64_t __65__ACAccountStore_GameCenter___gkPrimaryCredentialForEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 scopeModificationDate];
  id v6 = [v4 scopeModificationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __65__ACAccountStore_GameCenter___gkPrimaryCredentialForEnvironment___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (([v7 scope] & 4) != 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

id __51__ACAccountStore_GameCenter___gkAccountForAppleID___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 username];
  LODWORD(a1) = [v4 isEqual:*(void *)(a1 + 32)];

  if (a1)
  {
    v7[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F177E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_2;
  v8[3] = &unk_1E64708D0;
  id v6 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v11 = v3;
  v8[4] = v6;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v7 = v3;
  [v6 accountTypeWithIdentifier:v4 completion:v8];
}

void __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_2_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_103;
    v11[3] = &unk_1E64708A8;
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = v9;
    uint64_t v13 = v10;
    id v14 = v5;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    [v8 requestAccessToAccountsWithType:v14 options:0 completion:v11];
  }
}

uint64_t __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_103(uint64_t a1, char a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setResult:0];
  if (a2)
  {
    uint64_t v4 = [*(id *)(a1 + 40) accountsWithAccountType:*(void *)(a1 + 48)];
    if ([v4 count])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v18 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            id v11 = objc_msgSend(v10, "username", (void)v17);
            id v12 = [*(id *)(a1 + 56) accountName];
            int v13 = [v11 isEqualToString:v12];

            if (v13)
            {
              id v15 = objc_msgSend(v10, "aa_altDSID");
              [*(id *)(a1 + 32) setResult:v15];

              goto LABEL_17;
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v14 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_103_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_104(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) result];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

void __78__ACAccountStore_GameCenter___gkRenewCredentialForUsername_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _gkAccountForAppleID:*(void *)(a1 + 40)];
  v11[0] = *MEMORY[0x1E4F17A30];
  v11[1] = @"AARenewShouldPostFollowUp";
  v12[0] = MEMORY[0x1E4F1CC38];
  v12[1] = MEMORY[0x1E4F1CC38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__ACAccountStore_GameCenter___gkRenewCredentialForUsername_completionHandler___block_invoke_2;
  v8[3] = &unk_1E646EE60;
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v7 = v3;
  [v6 renewCredentialsForAccount:v4 options:v5 completion:v8];
}

uint64_t __78__ACAccountStore_GameCenter___gkRenewCredentialForUsername_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:");
  id v4 = [NSNumber numberWithInteger:a2];
  [*(id *)(a1 + 32) setResult:v4];

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

void __78__ACAccountStore_GameCenter___gkRenewCredentialForUsername_completionHandler___block_invoke_3(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) error];

  if (!v3)
  {
    id v9 = [*v2 result];
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_DEBUG))
    {
      __78__ACAccountStore_GameCenter___gkRenewCredentialForUsername_completionHandler___block_invoke_3_cold_1();
      if (!v9) {
        goto LABEL_13;
      }
    }
    else if (!v9)
    {
      goto LABEL_13;
    }
    uint64_t v12 = [v9 integerValue];
    if ((unint64_t)(v12 - 1) >= 2)
    {
      if (v12) {
        goto LABEL_14;
      }
      id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_7;
    }
LABEL_13:
    int v13 = (void *)MEMORY[0x1E4F28C58];
    long long v17 = @"GKCredentialRenewResult";
    id v14 = [*(id *)(a1 + 32) result];
    long long v18 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v16 = [v13 errorWithDomain:@"GKInternalErrorDomain" code:104 userInfo:v15];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_14;
  }
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = (void *)os_log_GKAccount;
  if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
    __78__ACAccountStore_GameCenter___gkRenewCredentialForUsername_completionHandler___block_invoke_3_cold_2(a1, v2, v5);
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v19 = *MEMORY[0x1E4F28A50];
  id v7 = [*(id *)(a1 + 32) error];
  v20[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v9 = [v6 errorWithDomain:@"GKInternalErrorDomain" code:104 userInfo:v8];

  id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_7:
  v10();
LABEL_14:
}

void __66__ACAccountStore_GameCenter___gkSaveCredential_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __66__ACAccountStore_GameCenter___gkSaveCredential_completionHandler___block_invoke_2;
  v7[3] = &unk_1E64708F8;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v6 = v3;
  [v4 saveVerifiedAccount:v5 withCompletionHandler:v7];
}

void __66__ACAccountStore_GameCenter___gkSaveCredential_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) setError:v5];
  }
  id v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v7 = GKOSLoggers();
    id v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_DEBUG, "SAVED ACCOUNT: %@ success:%d error:%@", (uint8_t *)&v9, 0x1Cu);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __66__ACAccountStore_GameCenter___gkSaveCredential_completionHandler___block_invoke_119(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __68__ACAccountStore_GameCenter___gkDeleteCredential_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __68__ACAccountStore_GameCenter___gkDeleteCredential_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6470920;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  id v11 = v3;
  id v6 = v3;
  [v4 removeAccount:v5 withCompletionHandler:v7];
}

void __68__ACAccountStore_GameCenter___gkDeleteCredential_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) setError:v5];
  }
  id v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v7 = GKOSLoggers();
    id v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138413058;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_debug_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_DEBUG, "DELETE ACCOUNT(%@): REMOVED:%@ success:%d error:%@", (uint8_t *)&v10, 0x26u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __68__ACAccountStore_GameCenter___gkDeleteCredential_completionHandler___block_invoke_120(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_87_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_89_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__ACAccountStore_GameCenter___gkSetScope_forCredential_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = *(const char **)(a1 + 48);
  id v5 = a2;
  id v6 = NSStringFromSelector(v4);
  OUTLINED_FUNCTION_0();
  __int16 v9 = 2112;
  uint64_t v10 = v7;
  __int16 v11 = 2112;
  uint64_t v12 = a3;
  _os_log_error_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_ERROR, "%@: Failed to save credential %@ (%@)", v8, 0x20u);
}

void __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "NOT GRANTED ACCESS TO IDMS ACCOUNTS DUE TO AN ACCOUNT INTERNAL ERROR - NOT FATAL", v2, v3, v4, v5, v6);
}

void __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_103_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "NOT GRANTED ACCESS TO IDMS ACCOUNTS. PLEASE VERIFY ENTITLEMENTS FOR CURRENT DAEMON", v2, v3, v4, v5, v6);
}

void __78__ACAccountStore_GameCenter___gkRenewCredentialForUsername_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_1(&dword_1C2D22000, v0, v1, "Renewal completed with result %@ for credential for: %@");
}

void __78__ACAccountStore_GameCenter___gkRenewCredentialForUsername_completionHandler___block_invoke_3_cold_2(uint64_t a1, void **a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *a2;
  uint64_t v5 = a3;
  uint8_t v6 = [v4 error];
  int v7 = 138412546;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_ERROR, "Received error while attempting to renew user: %@, error: %@", (uint8_t *)&v7, 0x16u);
}

@end