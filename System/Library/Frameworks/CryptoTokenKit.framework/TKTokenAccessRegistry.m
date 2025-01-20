@interface TKTokenAccessRegistry
- (BOOL)_isPersistenceEnabled;
- (BOOL)_platformAllowsAllRequests;
- (BOOL)_shouldAutomaticallyAllowRequest:(id)a3;
- (BOOL)evaluateRequest:(id)a3 error:(id *)a4;
- (TKTokenAccessRegistry)init;
- (TKTokenAccessRegistry)initWithAccessDB:(id)a3 userPrompt:(id)a4;
- (int64_t)_fetchAccessForRequest:(id)a3;
- (int64_t)_promptUserToEvaluateRequest:(id)a3 error:(id *)a4;
- (void)_storeAccess:(int64_t)a3 forRequest:(id)a4;
- (void)setAccessDB:(id)a3;
- (void)setUserPrompt:(id)a3;
@end

@implementation TKTokenAccessRegistry

- (TKTokenAccessRegistry)initWithAccessDB:(id)a3 userPrompt:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TKTokenAccessRegistry;
  v9 = [(TKTokenAccessRegistry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessDB, a3);
    objc_storeStrong((id *)&v10->_prompt, a4);
  }

  return v10;
}

- (TKTokenAccessRegistry)init
{
  v3 = TKTokenAccessDBCreate();
  v4 = TKTokenAccessUserPromptCreate();
  v5 = [(TKTokenAccessRegistry *)self initWithAccessDB:v3 userPrompt:v4];

  return v5;
}

- (BOOL)evaluateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(TKTokenAccessRegistry *)self _shouldAutomaticallyAllowRequest:v6])
  {
    BOOL v7 = 1;
  }
  else
  {
    int64_t v8 = [(TKTokenAccessRegistry *)self _fetchAccessForRequest:v6];
    if (!v8)
    {
      int64_t v8 = [(TKTokenAccessRegistry *)self _promptUserToEvaluateRequest:v6 error:a4];
      [(TKTokenAccessRegistry *)self _storeAccess:v8 forRequest:v6];
    }
    BOOL v7 = v8 == 1;
  }

  return v7;
}

- (BOOL)_shouldAutomaticallyAllowRequest:(id)a3
{
  id v4 = a3;
  if ([(TKTokenAccessRegistry *)self _platformAllowsAllRequests])
  {
    v5 = TK_LOG_token_access_registry();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:]();
    }
  }
  else if ([v4 clientHasAccessTokenEntitlement])
  {
    v5 = TK_LOG_token_access_registry();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:]();
    }
  }
  else
  {
    id v6 = [v4 clientBundleID];

    if (!v6)
    {
      v5 = TK_LOG_token_access_registry();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:]();
      }
      goto LABEL_21;
    }
    BOOL v7 = [v4 clientBundleID];
    if ([v7 hasPrefix:@"com.apple"])
    {
      int64_t v8 = [v4 clientBundleID];
      char v9 = [v8 isEqualToString:@"com.apple.sear.SampleToken"];

      if ((v9 & 1) == 0)
      {
        v5 = TK_LOG_token_access_registry();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.6();
        }
        goto LABEL_21;
      }
    }
    else
    {
    }
    v10 = [v4 tokenID];
    v11 = [v10 classID];
    int v12 = [v11 isEqualToString:*MEMORY[0x1E4F3B8A0]];

    if (v12)
    {
      v5 = TK_LOG_token_access_registry();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.4();
      }
    }
    else
    {
      v13 = [v4 tokenID];
      v14 = [v13 classID];
      int v15 = [v14 isEqualToString:*MEMORY[0x1E4F3B8A8]];

      if (!v15)
      {
        BOOL v16 = 0;
        goto LABEL_22;
      }
      v5 = TK_LOG_token_access_registry();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.5();
      }
    }
  }
LABEL_21:

  BOOL v16 = 1;
LABEL_22:

  return v16;
}

- (BOOL)_platformAllowsAllRequests
{
  return 0;
}

- (int64_t)_promptUserToEvaluateRequest:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [(TKTokenAccessUserPrompt *)self->_prompt preflightStatus];
  if (v8)
  {
    if (v8 == 1)
    {
      v13 = TK_LOG_token_access_registry();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenAccessRegistry _promptUserToEvaluateRequest:error:]();
      }

      int64_t v4 = 1;
    }
    else if (v8 == 2)
    {
      char v9 = TK_LOG_token_access_registry();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenAccessRegistry _promptUserToEvaluateRequest:error:]();
      }

      int64_t v4 = [(TKTokenAccessUserPrompt *)self->_prompt promptUserToEvaluateRequest:v7 error:a4];
    }
  }
  else
  {
    v10 = TK_LOG_token_access_registry();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenAccessRegistry _promptUserToEvaluateRequest:error:]();
    }

    if (a4)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28228];
      v16[0] = @"Operation not supported in this platform";
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      *a4 = [v11 errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:v12];
    }
    int64_t v4 = 2;
  }

  return v4;
}

- (int64_t)_fetchAccessForRequest:(id)a3
{
  id v4 = a3;
  if ([(TKTokenAccessRegistry *)self _isPersistenceEnabled])
  {
    int64_t v5 = [(TKTokenAccessDB *)self->_accessDB fetchAccessForRequest:v4];
  }
  else
  {
    id v6 = TK_LOG_token_access_registry();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenAccessRegistry _fetchAccessForRequest:]();
    }

    int64_t v5 = 0;
  }

  return v5;
}

- (void)_storeAccess:(int64_t)a3 forRequest:(id)a4
{
  id v6 = a4;
  if (![(TKTokenAccessRegistry *)self _isPersistenceEnabled]) {
    goto LABEL_5;
  }
  uint64_t v7 = [v6 clientBundleID];
  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = (void *)v7;
  char v9 = [v6 clientBundleID];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    [(TKTokenAccessDB *)self->_accessDB storeAccess:a3 forRequest:v6];
  }
  else
  {
LABEL_5:
    v11 = TK_LOG_token_access_registry();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenAccessRegistry _storeAccess:forRequest:]();
    }
  }
}

- (BOOL)_isPersistenceEnabled
{
  return 1;
}

- (void)setUserPrompt:(id)a3
{
}

- (void)setAccessDB:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prompt, 0);

  objc_storeStrong((id *)&self->_accessDB, 0);
}

- (void)_shouldAutomaticallyAllowRequest:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Platform rule matched", v2, v3, v4, v5, v6);
}

- (void)_shouldAutomaticallyAllowRequest:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Entitlement rule matched", v2, v3, v4, v5, v6);
}

- (void)_shouldAutomaticallyAllowRequest:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "BundleID rule matched", v2, v3, v4, v5, v6);
}

- (void)_shouldAutomaticallyAllowRequest:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Token class rule-1 matched", v2, v3, v4, v5, v6);
}

- (void)_shouldAutomaticallyAllowRequest:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Token class rule-2 matched", v2, v3, v4, v5, v6);
}

- (void)_shouldAutomaticallyAllowRequest:.cold.6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "BundleID prefix rule matched", v2, v3, v4, v5, v6);
}

- (void)_promptUserToEvaluateRequest:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Present user prompt", v2, v3, v4, v5, v6);
}

- (void)_promptUserToEvaluateRequest:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "User prompt not available", v2, v3, v4, v5, v6);
}

- (void)_promptUserToEvaluateRequest:error:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "User prompt not supported", v2, v3, v4, v5, v6);
}

- (void)_fetchAccessForRequest:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Fetch skipped", v2, v3, v4, v5, v6);
}

- (void)_storeAccess:forRequest:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Store skipped", v2, v3, v4, v5, v6);
}

@end