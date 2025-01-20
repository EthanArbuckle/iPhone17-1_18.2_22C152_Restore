@interface AAFollowUpUtilities
+ (BOOL)hasValidIDMSAccountForUserInfo:(id)a3;
@end

@implementation AAFollowUpUtilities

+ (BOOL)hasValidIDMSAccountForUserInfo:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F179C8] defaultStore];
  v5 = [v3 objectForKeyedSubscript:AAFollowUpUserInfoAccountIdentifier[0]];
  v6 = _AALogSystem();
  v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:](v7);
    }
    goto LABEL_32;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:].cold.7();
  }

  v7 = [v4 accountWithIdentifier:v5];
  if (!v7)
  {
LABEL_32:
    BOOL v30 = 0;
    goto LABEL_38;
  }
  v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:].cold.6();
  }

  unint64_t v9 = 0x1E4F4E000uLL;
  v10 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v11 = [v10 allAuthKitAccounts];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v12 = v11;
  uint64_t v38 = [v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v47;
    v34 = v5;
    v35 = v4;
    id v36 = v3;
    v37 = v12;
    while (2)
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v47 != v39) {
          objc_enumerationMutation(v12);
        }
        v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v15 = [v14 username];
        v16 = [v7 username];
        int v17 = [v15 isEqualToString:v16];

        if (v17)
        {
          v33 = _AALogSystem();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:]();
          }

          BOOL v30 = 1;
LABEL_36:
          v29 = v12;
          v4 = v35;
          id v3 = v36;
          v5 = v34;
          goto LABEL_37;
        }
        v18 = [*(id *)(v9 + 3904) sharedInstance];
        v19 = [v18 aliasesForAccount:v14];

        if (v19)
        {
          v20 = _AALogSystem();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:v20];
          }

          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v21 = v19;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v50 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v41;
            while (2)
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v41 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v40 + 1) + 8 * j);
                v27 = [v7 username];
                int v28 = [v27 isEqualToString:v26];

                if (v28)
                {
                  v31 = _AALogSystem();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
                    +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:].cold.4();
                  }

                  BOOL v30 = 1;
                  v12 = v37;
                  goto LABEL_36;
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v50 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          v12 = v37;
          unint64_t v9 = 0x1E4F4E000;
        }
      }
      v4 = v35;
      id v3 = v36;
      v5 = v34;
      uint64_t v38 = [v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v38) {
        continue;
      }
      break;
    }
  }

  v29 = _AALogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
    +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:](v7, v29);
  }
  BOOL v30 = 0;
LABEL_37:

LABEL_38:
  return v30;
}

+ (void)hasValidIDMSAccountForUserInfo:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A11D8000, log, OS_LOG_TYPE_ERROR, "No account identifier found in userInfo!", v1, 2u);
}

+ (void)hasValidIDMSAccountForUserInfo:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 accountType];
  v4 = [v3 identifier];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_FAULT, "AAFollowUpUtilities: Unable to find valid account for followup with account type %{public}@. Clearing item.", v5, 0xCu);
}

+ (void)hasValidIDMSAccountForUserInfo:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "AAFollowUpUtilities: Found valid IDMS account for %@", v2, v3, v4, v5, v6);
}

+ (void)hasValidIDMSAccountForUserInfo:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "AAFollowUpUtilities: alias %@ found!", v2, v3, v4, v5, v6);
}

+ (void)hasValidIDMSAccountForUserInfo:(os_log_t)log .cold.5(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "AAFollowUpUtilities: Checking aliases...", buf, 2u);
}

+ (void)hasValidIDMSAccountForUserInfo:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "AAFollowUpUtilities: Found account %@", v2, v3, v4, v5, v6);
}

+ (void)hasValidIDMSAccountForUserInfo:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "AAFollowUpUtilities: Follow up has account identifier %@ in userInfo", v2, v3, v4, v5, v6);
}

@end