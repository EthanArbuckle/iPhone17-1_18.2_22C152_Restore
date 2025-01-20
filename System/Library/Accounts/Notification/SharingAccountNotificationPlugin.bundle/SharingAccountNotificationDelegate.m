@interface SharingAccountNotificationDelegate
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation SharingAccountNotificationDelegate

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a6;
  v10 = v9;
  if (a4 == 3) {
    v11 = v9;
  }
  else {
    v11 = v8;
  }
  id v12 = v11;
  v13 = [v12 accountType];
  v14 = [v13 identifier];

  uint64_t v15 = *MEMORY[0x263F25618];
  int v16 = objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x263F25618]);
  int v17 = objc_msgSend(v8, "aa_isAccountClass:", v15);
  v18 = sub_2405EA688();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v35 = @"NO";
    int v37 = 67110402;
    *(_DWORD *)v38 = a4;
    if (v17) {
      v36 = @"YES";
    }
    else {
      v36 = @"NO";
    }
    if (v16) {
      v35 = @"YES";
    }
    *(_WORD *)&v38[4] = 2112;
    *(void *)&v38[6] = v14;
    __int16 v39 = 2112;
    v40 = v36;
    __int16 v41 = 2112;
    v42 = v35;
    __int16 v43 = 2112;
    v44 = v10;
    __int16 v45 = 2112;
    id v46 = v8;
    _os_log_debug_impl(&dword_2405E9000, v18, OS_LOG_TYPE_DEBUG, "Account change with parameters (type: %d, identifier: %@, newIsPrimary: %@, oldIsPrimary: %@, old account: %@, account: %@)", (uint8_t *)&v37, 0x3Au);
  }

  if ([v14 isEqualToString:*MEMORY[0x263EFAE58]])
  {
    if (v8) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v10 == 0;
    }
    if (!v19 && a4 == 3) {
      int v21 = v16;
    }
    else {
      int v21 = 0;
    }
    if (v21 == 1)
    {
      v22 = sub_2405EA688();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

        [MEMORY[0x263F6C1A8] appleAccountSignedOut];
        goto LABEL_49;
      }
      int v37 = 138412290;
      *(void *)v38 = v10;
      v23 = "Primary account deleted (old account: %@)";
LABEL_18:
      _os_log_impl(&dword_2405E9000, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v37, 0xCu);
      goto LABEL_19;
    }
    if (v16)
    {
      if (v17)
      {
        if (!v8 || a4 != 1 || v10) {
          goto LABEL_49;
        }
        goto LABEL_36;
      }
      v29 = [v10 identifier];
      v30 = [v8 identifier];
      int v31 = [v29 isEqualToString:v30];

      if (a4 == 2 && v31)
      {
        v22 = sub_2405EA688();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        int v37 = 138412290;
        *(void *)v38 = v8;
        v23 = "Primary account demoted to secondary (account: %@)";
        goto LABEL_18;
      }
    }
    else
    {
      if (a4 != 1 || v10 != 0 || v8 == 0) {
        char v26 = 0;
      }
      else {
        char v26 = v17;
      }
      if (v26)
      {
LABEL_36:
        v27 = sub_2405EA688();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
LABEL_39:

          [MEMORY[0x263F6C1A8] appleAccountSignedIn];
          goto LABEL_49;
        }
        int v37 = 138412290;
        *(void *)v38 = v8;
        v28 = "Primary account added (account: %@)";
LABEL_38:
        _os_log_impl(&dword_2405E9000, v27, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v37, 0xCu);
        goto LABEL_39;
      }
      if (v17)
      {
        v32 = [v10 identifier];
        v33 = [v8 identifier];
        int v34 = [v32 isEqualToString:v33];

        if (a4 == 2)
        {
          if (v34)
          {
            v27 = sub_2405EA688();
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_39;
            }
            int v37 = 138412290;
            *(void *)v38 = v8;
            v28 = "Account promoted to primary (account: %@)";
            goto LABEL_38;
          }
        }
      }
    }
  }
LABEL_49:
}

@end