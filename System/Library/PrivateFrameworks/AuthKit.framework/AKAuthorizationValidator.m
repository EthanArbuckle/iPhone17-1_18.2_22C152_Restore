@interface AKAuthorizationValidator
+ (BOOL)_requirePasscodeSet;
+ (BOOL)canPerformAuthorizationRequest:(id)a3 error:(id *)a4;
+ (BOOL)canPerformCredentialRequest:(id)a3 error:(id *)a4;
+ (BOOL)canPerformPasswordRequest:(id)a3 error:(id *)a4;
+ (BOOL)shouldContinueWithResponse:(id)a3 error:(id *)a4;
@end

@implementation AKAuthorizationValidator

+ (BOOL)canPerformCredentialRequest:(id)a3 error:(id *)a4
{
  id v15 = 0;
  id v6 = a3;
  char v7 = [a1 canPerformAuthorizationRequest:v6 error:&v15];
  id v8 = v15;
  id v14 = 0;
  LOBYTE(a1) = [a1 canPerformPasswordRequest:v6 error:&v14];

  id v9 = v14;
  v10 = v9;
  char v11 = v7 | a1;
  if ((v11 & 1) == 0)
  {
    if (v8)
    {
      if (a4)
      {
        id v9 = v8;
        goto LABEL_7;
      }
    }
    else
    {
      if (!v9)
      {
        if (!a4) {
          goto LABEL_9;
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7001);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      if (a4)
      {
LABEL_7:
        id v12 = v9;
LABEL_8:
        *a4 = v12;
      }
    }
  }
LABEL_9:

  return v11;
}

+ (BOOL)canPerformAuthorizationRequest:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [v6 authorizationRequest];
  if (!v7)
  {
    char v11 = _AKLogSiwa();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[AKAuthorizationValidator canPerformAuthorizationRequest:error:]();
    }

    if (a4)
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = -7044;
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (![a1 _requirePasscodeSet])
  {
    id v12 = [v7 authkitAccount];

    if (v12)
    {
      v13 = +[AKAccountManager sharedInstance];
      id v14 = [v7 altDSID];
      id v15 = [v13 iCloudAccountForAltDSID:v14];

      v16 = [v7 authkitAccount];
      if (([v6 _isItunesLogin] & 1) == 0 && !v15)
      {
        v17 = _AKLogSiwa();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.9();
        }

        if (a4)
        {
          uint64_t v18 = -7022;
LABEL_33:
          objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", v18);
          BOOL v20 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:

          goto LABEL_60;
        }
        goto LABEL_58;
      }
      if ([v13 securityLevelForAccount:v16] == 5)
      {
        v21 = +[AKDevice currentDevice];
        int v22 = [v21 isMultiUserMode];

        if (v22)
        {
          v23 = _AKLogSiwa();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.4();
          }
          goto LABEL_31;
        }
      }
      else
      {
        if ([v13 authenticationModeForAccount:v16] == 2)
        {
          v23 = _AKLogSiwa();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.5();
          }
LABEL_31:

          if (a4)
          {
            uint64_t v18 = -7027;
            goto LABEL_33;
          }
LABEL_58:
          BOOL v20 = 0;
          goto LABEL_59;
        }
        if ([v13 userUnderAgeForAccount:v16]
          && ([v6 _isFirstPartyLogin] & 1) == 0)
        {
          v24 = +[AKFeatureManager sharedManager];
          int v25 = [v24 isTiburonU13Enabled];

          if (!v25)
          {
            v34 = _AKLogSiwa();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.8();
            }

            if (a4)
            {
              uint64_t v18 = -7076;
              goto LABEL_33;
            }
            goto LABEL_58;
          }
          v26 = _AKLogSystem();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int v36 = 138477827;
            v37 = @"Allowing underage user to perform request";
            _os_log_impl(&dword_193494000, v26, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v36, 0xCu);
          }
        }
        if ([v13 securityLevelForAccount:v16] != 4)
        {
          v33 = _AKLogSiwa();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.7();
          }

          if (a4)
          {
            uint64_t v18 = -7070;
            goto LABEL_33;
          }
          goto LABEL_58;
        }
        v27 = [v7 requestedScopes];
        int v28 = [v27 containsObject:@"email"];

        if (v28)
        {
          char v29 = [v13 isPrimaryiCloudAccountEmailVerified:v15];
          char v30 = [v13 verifiedPrimaryEmailForAccount:v16];
          char v31 = [v13 phoneAsAppleIDForAccount:v16];
          BOOL v20 = 1;
          if (v29 & 1) != 0 || (v30 & 1) != 0 || (v31) {
            goto LABEL_59;
          }
          v32 = _AKLogSiwa();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.6();
          }

          if (a4)
          {
            uint64_t v18 = -7072;
            goto LABEL_33;
          }
          goto LABEL_58;
        }
      }
      BOOL v20 = 1;
      goto LABEL_59;
    }
    v19 = _AKLogSiwa();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[AKAuthorizationValidator canPerformAuthorizationRequest:error:]();
    }

    if (a4)
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = -7022;
      goto LABEL_22;
    }
LABEL_23:
    BOOL v20 = 0;
    goto LABEL_60;
  }
  id v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[AKAuthorizationValidator canPerformAuthorizationRequest:error:]();
  }

  if (!a4) {
    goto LABEL_23;
  }
  id v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = -7080;
LABEL_22:
  objc_msgSend(v9, "ak_errorWithCode:", v10);
  BOOL v20 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_60:

  return v20;
}

+ (BOOL)canPerformPasswordRequest:(id)a3 error:(id *)a4
{
  id v6 = [a3 passwordRequest];
  if (!v6)
  {
    id v9 = _AKLogSiwa();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[AKAuthorizationValidator canPerformPasswordRequest:error:]();
    }

    if (a4)
    {
      uint64_t v8 = -7026;
      goto LABEL_11;
    }
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_14;
  }
  if (![a1 _requirePasscodeSet])
  {
    BOOL v10 = 1;
    goto LABEL_14;
  }
  char v7 = _AKLogSiwa();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    +[AKAuthorizationValidator canPerformAuthorizationRequest:error:]();
  }

  if (!a4) {
    goto LABEL_13;
  }
  uint64_t v8 = -7080;
LABEL_11:
  objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", v8);
  BOOL v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v10;
}

+ (BOOL)shouldContinueWithResponse:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 userSelection];
  char v7 = [v5 selectedRequest];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 && ([v5 hasSelectedSharedAccountForLogin] & 1) == 0)
  {
    BOOL v10 = [v5 selectedRequest];
    char v11 = [v10 requestedScopes];
    int v12 = [v11 containsObject:@"name"];

    if (v12)
    {
      v13 = [v6 userInformation];
      id v14 = [v13 givenName];
      if ([v14 length])
      {
      }
      else
      {
        id v15 = [v6 userInformation];
        v16 = [v15 familyName];
        uint64_t v17 = [v16 length];

        if (!v17)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7012);
            char v9 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            char v9 = 0;
          }
          goto LABEL_17;
        }
      }
    }
    uint64_t v18 = [v10 requestedScopes];
    int v19 = [v18 containsObject:@"email"];

    if (v19)
    {
      BOOL v20 = +[AKAccountManager sharedInstance];
      v21 = [v10 authkitAccount];
      char v9 = [v20 isManagedAppleIDForAccount:v21];

      if (v9)
      {
LABEL_14:

LABEL_17:
        goto LABEL_18;
      }
      int v22 = [v10 authkitAccount];
      char v23 = [v20 phoneAsAppleIDForAccount:v22];

      v24 = [v6 userInformation];
      int v25 = [v24 selectedEmail];
      uint64_t v26 = [v25 length];

      if (!v26 && (v23 & 1) == 0)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7012);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_14;
      }
    }
    char v9 = 1;
    goto LABEL_17;
  }
  char v9 = 1;
LABEL_18:

  return v9;
}

+ (BOOL)_requirePasscodeSet
{
  return 0;
}

+ (void)canPerformAuthorizationRequest:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Cannot perform request - Missing authorization request", v2, v3, v4, v5, v6);
}

+ (void)canPerformAuthorizationRequest:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Cannot perform request - Current platform require passcode setup", v2, v3, v4, v5, v6);
}

+ (void)canPerformAuthorizationRequest:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Cannot perform request - Missing account", v2, v3, v4, v5, v6);
}

+ (void)canPerformAuthorizationRequest:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Cannot perform request - Managed Accounts Not Permitted on Shared iPad", v2, v3, v4, v5, v6);
}

+ (void)canPerformAuthorizationRequest:error:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Cannot perform request - FedAuth Accounts Not Permitted", v2, v3, v4, v5, v6);
}

+ (void)canPerformAuthorizationRequest:error:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Cannot perform request - Account not verified.", v2, v3, v4, v5, v6);
}

+ (void)canPerformAuthorizationRequest:error:.cold.7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Cannot perform request - Insufficient security level", v2, v3, v4, v5, v6);
}

+ (void)canPerformAuthorizationRequest:error:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Cannot perform request - Invalid age", v2, v3, v4, v5, v6);
}

+ (void)canPerformAuthorizationRequest:error:.cold.9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Cannot perform request - Missing AppleAccount", v2, v3, v4, v5, v6);
}

+ (void)canPerformPasswordRequest:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Cannot perform password request without password request.", v2, v3, v4, v5, v6);
}

@end