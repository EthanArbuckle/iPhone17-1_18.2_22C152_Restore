@interface ACRemoteUtilities
+ (id)localAccountMatchingRemoteAccount:(id)a3 inAccountStore:(id)a4;
@end

@implementation ACRemoteUtilities

+ (id)localAccountMatchingRemoteAccount:(id)a3 inAccountStore:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 identifier];
  v8 = [v6 accountWithIdentifier:v7];

  if (v8)
  {
    v9 = _ACLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[ACRemoteUtilities localAccountMatchingRemoteAccount:inAccountStore:]((uint64_t)v5, (uint64_t)v8, v9);
    }

    id v10 = v8;
    goto LABEL_33;
  }
  v11 = [v5 accountType];
  v12 = v11;
  if (!v11
    || ([v11 identifier], v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    id v10 = 0;
    goto LABEL_32;
  }
  v14 = [v12 identifier];
  v15 = [v6 accountTypeWithAccountTypeIdentifier:v14];

  if (!v15)
  {
    id v10 = 0;
    goto LABEL_31;
  }
  [v6 accountsWithAccountType:v15];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v16)
  {
    id v10 = 0;
    goto LABEL_30;
  }
  uint64_t v17 = v16;
  v37 = v15;
  id v38 = v6;
  uint64_t v18 = *(void *)v42;
  uint64_t v19 = *MEMORY[0x263EFB000];
  while (2)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v42 != v18) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      v22 = [v12 identifier];
      if ([v22 isEqualToString:v19])
      {
        v23 = [v21 objectForKeyedSubscript:@"dsid"];
        [v5 objectForKeyedSubscript:@"dsid"];
        v24 = v21;
        id v25 = v5;
        uint64_t v26 = v17;
        uint64_t v27 = v19;
        uint64_t v28 = v18;
        v30 = v29 = v12;
        int v40 = [v23 isEqual:v30];

        v12 = v29;
        uint64_t v18 = v28;
        uint64_t v19 = v27;
        uint64_t v17 = v26;
        id v5 = v25;
        v21 = v24;

        if (v40)
        {
          v34 = _ACLogSystem();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            +[ACRemoteUtilities localAccountMatchingRemoteAccount:inAccountStore:]();
          }
LABEL_28:
          v15 = v37;

          id v10 = v21;
          id v6 = v38;
          goto LABEL_29;
        }
      }
      else
      {
      }
      v31 = [v21 username];
      v32 = [v5 username];
      int v33 = [v31 isEqualToString:v32];

      if (v33)
      {
        v34 = _ACLogSystem();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          +[ACRemoteUtilities localAccountMatchingRemoteAccount:inAccountStore:]();
        }
        goto LABEL_28;
      }
    }
    uint64_t v17 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v17) {
      continue;
    }
    break;
  }
  id v10 = 0;
  id v6 = v38;
  v15 = v37;
LABEL_29:
  v8 = 0;
LABEL_30:

LABEL_31:
LABEL_32:

LABEL_33:

  return v10;
}

+ (void)localAccountMatchingRemoteAccount:inAccountStore:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_5();
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "\"Remote account '%@' matched local iTunes account '%@' dsid\"", v1, 0x16u);
}

+ (void)localAccountMatchingRemoteAccount:inAccountStore:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_5();
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "\"Remote account '%@' matched local account '%@' by accountType and username\"", v1, 0x16u);
}

+ (void)localAccountMatchingRemoteAccount:(os_log_t)log inAccountStore:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "\"Remote account '%@' matched local account '%@' by identifier\"", (uint8_t *)&v3, 0x16u);
}

@end