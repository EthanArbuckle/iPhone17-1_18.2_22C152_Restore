@interface ACDTCCUtilities
+ (BOOL)TCCSupportedForAccountTypeID:(id)a3;
+ (BOOL)clearAllTCCStatesForAccountTypeID:(id)a3;
+ (BOOL)clearTCCStateForClient:(id)a3 accountTypeID:(id)a4;
+ (BOOL)setTCCStateForClient:(id)a3 accountTypeID:(id)a4 toGranted:(BOOL)a5;
+ (__CFString)_TCCServiceForAccountTypeID:(id)a3;
+ (id)allTCCStatesForAccountTypeID:(id)a3;
+ (int)TCCStateForClient:(id)a3 accountTypeID:(id)a4;
@end

@implementation ACDTCCUtilities

+ (BOOL)TCCSupportedForAccountTypeID:(id)a3
{
  return [a1 _TCCServiceForAccountTypeID:a3] != 0;
}

+ (int)TCCStateForClient:(id)a3 accountTypeID:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([a1 _TCCServiceForAccountTypeID:v7])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v8 = (id)TCCAccessCopyInformation();
    v9 = (void *)[v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v19 = v7;
      uint64_t v10 = *(void *)v21;
      v11 = (void *)MEMORY[0x263F7C4C8];
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v14 = [v13 objectForKeyedSubscript:*v11];

          if (v14)
          {
            v15 = CFBundleGetIdentifier((CFBundleRef)v14);
            v16 = [v6 bundleID];
            int v17 = [v15 isEqualToString:v16];

            if (v17)
            {
              v9 = [v13 objectForKeyedSubscript:*MEMORY[0x263F7C4D8]];

              if (v9)
              {
                if (CFBooleanGetValue((CFBooleanRef)v9)) {
                  LODWORD(v9) = 1;
                }
                else {
                  LODWORD(v9) = 2;
                }
              }
              id v7 = v19;

              goto LABEL_21;
            }
          }
        }
        v9 = (void *)[v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      id v7 = v19;
    }
LABEL_21:
  }
  else
  {
    v8 = _ACDLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ACDTCCUtilities TCCStateForClient:accountTypeID:]();
    }
    LODWORD(v9) = 0;
  }

  return (int)v9;
}

+ (BOOL)setTCCStateForClient:(id)a3 accountTypeID:(id)a4 toGranted:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (![a1 _TCCServiceForAccountTypeID:v8])
  {
    v12 = _ACDLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ACDTCCUtilities setTCCStateForClient:accountTypeID:toGranted:]();
    }
    goto LABEL_10;
  }
  if (![v7 bundle])
  {
    v12 = _ACDLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ACDTCCUtilities setTCCStateForClient:accountTypeID:toGranted:]();
    }
LABEL_10:

    BOOL v11 = 0;
    goto LABEL_11;
  }
  int v9 = TCCAccessSetForBundle();
  uint64_t v10 = _ACDLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[ACDTCCUtilities setTCCStateForClient:accountTypeID:toGranted:](v9, v10);
  }

  BOOL v11 = v9 != 0;
LABEL_11:

  return v11;
}

+ (BOOL)clearTCCStateForClient:(id)a3 accountTypeID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![a1 _TCCServiceForAccountTypeID:v7])
  {
    int v9 = _ACDLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ACDTCCUtilities clearTCCStateForClient:accountTypeID:]();
    }
    goto LABEL_8;
  }
  if (![v6 bundle])
  {
    int v9 = _ACDLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ACDTCCUtilities clearTCCStateForClient:accountTypeID:]();
    }
LABEL_8:

    BOOL v8 = 0;
    goto LABEL_9;
  }
  [a1 _TCCServiceForAccountTypeID:v7];
  [v6 bundle];
  BOOL v8 = TCCAccessResetForBundle() != 0;
LABEL_9:

  return v8;
}

+ (id)allTCCStatesForAccountTypeID:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 _TCCServiceForAccountTypeID:v4])
  {
    v5 = (void *)TCCAccessCopyInformation();
    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v21 = v5;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        BOOL v11 = (void *)MEMORY[0x263F7C4C8];
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            v14 = objc_msgSend(v13, "objectForKeyedSubscript:", *v11, v21);

            if (v14)
            {
              v15 = CFBundleGetIdentifier((CFBundleRef)v14);
              v16 = [v13 objectForKeyedSubscript:*MEMORY[0x263F7C4D8]];

              int v17 = [NSNumber numberWithUnsignedChar:CFBooleanGetValue((CFBooleanRef)v16)];
              [v6 setObject:v17 forKey:v15];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v9);
      }

      v5 = v21;
    }
    else
    {
      id v6 = 0;
    }
    v18 = v6;

    id v19 = v18;
  }
  else
  {
    v18 = _ACDLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[ACDTCCUtilities TCCStateForClient:accountTypeID:]();
    }
    id v19 = 0;
  }

  return v19;
}

+ (BOOL)clearAllTCCStatesForAccountTypeID:(id)a3
{
  id v4 = a3;
  if ([a1 _TCCServiceForAccountTypeID:v4])
  {
    BOOL v5 = TCCAccessReset() != 0;
  }
  else
  {
    id v6 = _ACDLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ACDTCCUtilities TCCStateForClient:accountTypeID:]();
    }

    BOOL v5 = 0;
  }

  return v5;
}

+ (__CFString)_TCCServiceForAccountTypeID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263EFAEC0]])
  {
    id v4 = (__CFString **)MEMORY[0x263F7C558];
LABEL_7:
    BOOL v5 = *v4;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:*MEMORY[0x263EFAFD0]])
  {
    id v4 = (__CFString **)MEMORY[0x263F7C650];
    goto LABEL_7;
  }
  if ([v3 isEqualToString:*MEMORY[0x263EFAFA0]])
  {
    id v4 = (__CFString **)MEMORY[0x263F7C630];
    goto LABEL_7;
  }
  if ([v3 isEqualToString:*MEMORY[0x263EFAFB8]]) {
    BOOL v5 = (__CFString *)*MEMORY[0x263F7C648];
  }
  else {
    BOOL v5 = 0;
  }
LABEL_8:

  return v5;
}

+ (void)TCCStateForClient:accountTypeID:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Cannot check access to a private account type: %@\"", v2, v3, v4, v5, v6);
}

+ (void)setTCCStateForClient:accountTypeID:toGranted:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2183AD000, v1, OS_LOG_TYPE_ERROR, "\"%@ is requesting access to a private account type: %@\"", v2, 0x16u);
}

+ (void)setTCCStateForClient:accountTypeID:toGranted:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"%@ seems to have a NULL bundle. Sorry can't work with that.\"", v2, v3, v4, v5, v6);
}

+ (void)setTCCStateForClient:(unsigned __int8)a1 accountTypeID:(NSObject *)a2 toGranted:.cold.3(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithUnsignedChar:a1];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_2183AD000, a2, OS_LOG_TYPE_DEBUG, "\"Setting TCC access bit returned: %@\"", v4, 0xCu);
}

+ (void)clearTCCStateForClient:accountTypeID:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Cannot clear access for account type %@, which has no backing TCC service.\"", v2, v3, v4, v5, v6);
}

+ (void)clearTCCStateForClient:accountTypeID:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Cannot reset TCC Access with nil bundle: %@\"", v2, v3, v4, v5, v6);
}

@end