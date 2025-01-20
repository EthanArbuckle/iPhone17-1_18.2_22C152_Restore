@interface AKPasswordGeneratorHook
- (AKPasswordGeneratorHook)init;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (SFStrongPasswordGenerator)passwordGenerator;
- (id)_fetchAndPopulatePasswordRows:(id)a3 objectModel:(id)a4 password:(id)a5;
- (id)_generatePasswordForAppWithAppID:(id)a3 passwordRules:(id)a4;
- (id)_tableViewRowWithID:(id)a3 inObjectModel:(id)a4;
- (void)_autogeneratePasswordForObjectModel:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setPasswordGenerator:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation AKPasswordGeneratorHook

- (AKPasswordGeneratorHook)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKPasswordGeneratorHook;
  v2 = [(AKPasswordGeneratorHook *)&v6 init];
  if (v2)
  {
    v3 = (SFStrongPasswordGenerator *)objc_alloc_init((Class)getSFStrongPasswordGeneratorClass());
    passwordGenerator = v2->_passwordGenerator;
    v2->_passwordGenerator = v3;
  }
  return v2;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8 = a6;
  v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AKPasswordGeneratorHook processElement:attributes:objectModel:completion:]((uint64_t)self, a2, v9);
  }

  (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
}

- (BOOL)shouldMatchElement:(id)a3
{
  return 0;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3 = a3;
  v4 = [v3 clientInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F95F88]];
  if ([@"password:generate" isEqualToString:v5])
  {
    objc_super v6 = [v3 clientInfo];
    v7 = [v6 objectForKeyedSubscript:@"passwordFieldId"];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_autogeneratePasswordForObjectModel:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 clientInfo];
  v9 = [v8 objectForKeyedSubscript:@"passwordFieldId"];
  v10 = [v9 componentsSeparatedByString:@","];

  if ([v10 count])
  {
    v11 = [v6 clientInfo];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"passwordRules"];

    if (v12) {
      v13 = v12;
    }
    else {
      v13 = @"minlength: 8; maxlength: 63; required: lower; required: upper; required: digit; allowed: ascii-printable;";
    }
    v14 = [MEMORY[0x1E4F28B50] mainBundle];
    v15 = [v14 bundleIdentifier];
    v16 = [(AKPasswordGeneratorHook *)self _generatePasswordForAppWithAppID:v15 passwordRules:v13];

    v17 = _AKLogSystem();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[AKPasswordGeneratorHook _autogeneratePasswordForObjectModel:completion:].cold.4();
      }

      v18 = [(AKPasswordGeneratorHook *)self _fetchAndPopulatePasswordRows:v10 objectModel:v6 password:v16];
      if (![v18 count])
      {
        v27 = self;
        id v28 = v7;
        v19 = _AKLogSystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[AKPasswordGeneratorHook _autogeneratePasswordForObjectModel:completion:]();
        }

        id v26 = objc_alloc_init(MEMORY[0x1E4F95F60]);
        v20 = objc_opt_new();
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v21 = v10;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v30;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v30 != v24) {
                objc_enumerationMutation(v21);
              }
              [v20 setObject:v16 forKey:*(void *)(*((void *)&v29 + 1) + 8 * v25++)];
            }
            while (v23 != v25);
            uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v23);
        }

        [v26 setAdditionalPayload:v20];
        [(AKPasswordGeneratorHook *)v27 setServerHookResponse:v26];
        id v7 = v28;
        (*((void (**)(id, uint64_t, void))v28 + 2))(v28, 1, 0);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[AKPasswordGeneratorHook _autogeneratePasswordForObjectModel:completion:]();
    }
  }
  else
  {
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AKPasswordGeneratorHook _autogeneratePasswordForObjectModel:completion:]();
    }
  }
}

- (id)_fetchAndPopulatePasswordRows:(id)a3 objectModel:(id)a4 password:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v28 = a5;
  id v27 = [MEMORY[0x1E4F1CA48] array];
  v10 = [v9 updateInfo];
  id v11 = (id)[v10 mutableCopy];

  if (!v11) {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v30;
    *(void *)&long long v14 = 138412290;
    long long v26 = v14;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v19 = -[AKPasswordGeneratorHook _tableViewRowWithID:inObjectModel:](self, "_tableViewRowWithID:inObjectModel:", v18, v9, v26);
        v20 = v19;
        if (v19)
        {
          [v19 setValueFromString:v28];
          [v27 addObject:v20];
        }
        else
        {
          id v21 = v12;
          uint64_t v22 = v11;
          uint64_t v23 = _AKLogSystem();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v26;
            uint64_t v34 = v18;
            _os_log_debug_impl(&dword_1C38C1000, v23, OS_LOG_TYPE_DEBUG, "Row with row id: %@ does not exist, adding it to updateInfo", buf, 0xCu);
          }

          id v11 = v22;
          [v22 setObject:v28 forKey:v18];
          id v12 = v21;
        }
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v15);
  }

  [v9 setUpdateInfo:v11];
  uint64_t v24 = _AKLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[AKPasswordGeneratorHook _fetchAndPopulatePasswordRows:objectModel:password:]((uint64_t)v11, v24);
  }

  return v27;
}

- (id)_generatePasswordForAppWithAppID:(id)a3 passwordRules:(id)a4
{
  return (id)[(SFStrongPasswordGenerator *)self->_passwordGenerator generatedPasswordForAppWithAppID:a3 associatedDomains:0 passwordRules:a4 confirmPasswordRules:0];
}

- (id)_tableViewRowWithID:(id)a3 inObjectModel:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(a4, "allPages", 0);
  id v7 = (void *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 hasTableView])
        {
          id v11 = [v10 tableViewOM];
          id v7 = [v11 rowWithIdentifier:v5];

          goto LABEL_11;
        }
      }
      id v7 = (void *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
}

- (SFStrongPasswordGenerator)passwordGenerator
{
  return self->_passwordGenerator;
}

- (void)setPasswordGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordGenerator, 0);
  objc_storeStrong((id *)&self->_serverHookResponse, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)processElement:(NSObject *)a3 attributes:objectModel:completion:.cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  int v8 = 138412546;
  id v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_debug_impl(&dword_1C38C1000, a3, OS_LOG_TYPE_DEBUG, "%@: %@ is not supported.", (uint8_t *)&v8, 0x16u);
}

- (void)_autogeneratePasswordForObjectModel:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_ERROR, "Failed to parse password row ids from server response", v1, 2u);
}

- (void)_autogeneratePasswordForObjectModel:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_ERROR, "Failed to generate strong password", v1, 2u);
}

- (void)_autogeneratePasswordForObjectModel:completion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_DEBUG, "Failed to find any rowIDs returned from client info, postBack to server for silent auth", v1, 2u);
}

- (void)_autogeneratePasswordForObjectModel:completion:.cold.4()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_DEBUG, "Successfully generated strong password", v1, 2u);
}

- (void)_fetchAndPopulatePasswordRows:(uint64_t)a1 objectModel:(NSObject *)a2 password:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Object model updateInfo: %@", (uint8_t *)&v2, 0xCu);
}

@end