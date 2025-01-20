@interface AAPersonaUtility
+ (BOOL)isDataSeparatedAccount:(id)a3;
+ (BOOL)personaConsistencyCheck:(id)a3;
+ (id)findEnterprisePersonaIdentifier;
+ (void)findEnterprisePersonaIdentifier;
+ (void)verifyAndFixPersonaIfNeeded:(id)a3 desiredContext:(id)a4;
@end

@implementation AAPersonaUtility

+ (id)findEnterprisePersonaIdentifier
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  v3 = [v2 listAllPersonaWithAttributes];

  v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[AAPersonaUtility findEnterprisePersonaIdentifier];
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    v9 = 0;
    uint64_t v10 = *(void *)v18;
    *(void *)&long long v7 = 138412290;
    long long v16 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEnterprisePersona", v16, (void)v17))
        {
          uint64_t v13 = [v12 userPersonaUniqueString];

          v14 = _AALogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v13;
            _os_log_debug_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEBUG, "Found the enterprise persona (%@)!", buf, 0xCu);
          }

          v9 = (void *)v13;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)personaConsistencyCheck:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v5 = [v4 currentPersona];

  char v6 = [v3 isEqualToPersona:v5];
  long long v7 = _AALogSystem();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[AAPersonaUtility personaConsistencyCheck:]();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    +[AAPersonaUtility personaConsistencyCheck:]();
  }

  return v6;
}

+ (void)verifyAndFixPersonaIfNeeded:(id)a3 desiredContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4FB36F8] sharedManager];
  v9 = [v8 currentPersona];

  char v10 = [v6 isEqualToPersona:v9];
  v11 = _AALogSystem();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[AAPersonaUtility verifyAndFixPersonaIfNeeded:desiredContext:]();
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[AAPersonaUtility verifyAndFixPersonaIfNeeded:desiredContext:]();
    }

    uint64_t v13 = [MEMORY[0x1E4FB36F8] sharedManager];
    v14 = [v13 currentPersona];
    id v15 = (id)[v14 restorePersonaWithSavedPersonaContext:v7];

    long long v16 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v17 = [v16 currentPersona];

    [a1 personaConsistencyCheck:v6];
    v9 = (void *)v17;
  }
}

+ (BOOL)isDataSeparatedAccount:(id)a3
{
  return [a3 isDataSeparatedAccount];
}

+ (void)findEnterprisePersonaIdentifier
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_DEBUG, "personaAttributes: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)personaConsistencyCheck:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  [v3 userPersonaNickName];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_1() userPersonaUniqueString];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_4_0() userPersonaNickName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_2() userPersonaUniqueString];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_5_1(&dword_1A11D8000, v5, v6, "%s Desired persona (%@, %@) is equal to current persona (%@, %@)", v7, v8, v9, v10, 2u);
}

+ (void)personaConsistencyCheck:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [v4 userPersonaNickName];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_1() userPersonaUniqueString];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_4_0() userPersonaNickName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_2() userPersonaUniqueString];
  v6[0] = 136316162;
  OUTLINED_FUNCTION_0_5();
  _os_log_fault_impl(&dword_1A11D8000, v1, OS_LOG_TYPE_FAULT, "%s Desired persona (%@, %@) is not equal to current persona (%@, %@)", (uint8_t *)v6, 0x34u);
}

+ (void)verifyAndFixPersonaIfNeeded:desiredContext:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  [v3 userPersonaUniqueString];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_1() userPersonaNickName];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_4_0() userPersonaUniqueString];
  objc_claimAutoreleasedReturnValue();
  id v4 = [(id)OUTLINED_FUNCTION_2() userPersonaNickName];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_5_1(&dword_1A11D8000, v5, v6, "%s Desired persona (%@, %@) is equal to (%@, %@)", v7, v8, v9, v10, 2u);
}

+ (void)verifyAndFixPersonaIfNeeded:desiredContext:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [v4 userPersonaUniqueString];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_1() userPersonaNickName];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_4_0() userPersonaUniqueString];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_2() userPersonaNickName];
  v6[0] = 136316162;
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(&dword_1A11D8000, v1, OS_LOG_TYPE_ERROR, "%s Desired persona (%@, %@) is not equal current persona (%@, %@). Will attempt to correct", (uint8_t *)v6, 0x34u);
}

@end