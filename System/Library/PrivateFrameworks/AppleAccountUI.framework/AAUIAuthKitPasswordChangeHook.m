@interface AAUIAuthKitPasswordChangeHook
- (AAUIAuthKitPasswordChangeHook)initWithAltDSID:(id)a3;
- (ACAccount)appleAccount;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (id)_tableViewRowWithID:(id)a3 inObjectModel:(id)a4;
- (void)_handleChangeForObjectModel:(id)a3 completion:(id)a4;
- (void)_harvestDataFromServerHTTPResponse:(id)a3;
- (void)_updateiCloudAccountWithCompletion:(id)a3;
- (void)harvestDataFromResponse:(id)a3;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)setAppleAccount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)textFieldEditingDidEnd:(id)a3;
@end

@implementation AAUIAuthKitPasswordChangeHook

- (AAUIAuthKitPasswordChangeHook)initWithAltDSID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AAUIAuthKitPasswordChangeHook;
  v5 = [(AAUIAuthKitPasswordChangeHook *)&v10 init];
  if (v5)
  {
    v6 = [MEMORY[0x263EFB210] defaultStore];
    uint64_t v7 = objc_msgSend(v6, "aa_appleAccountWithAltDSID:", v4);
    appleAccount = v5->_appleAccount;
    v5->_appleAccount = (ACAccount *)v7;
  }
  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8 = a6;
  v9 = _AALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    -[AAUIAuthKitPasswordChangeHook processElement:attributes:objectModel:completion:]((uint64_t)self, a2, v9);
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
  id v4 = [v3 clientInfo];
  v5 = [v4 objectForKeyedSubscript:@"newPasswordRowId"];
  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [v3 clientInfo];
    id v8 = [v7 objectForKeyedSubscript:@"currentPasswordRowId"];
    if (v8)
    {
      char v6 = 1;
    }
    else
    {
      objc_opt_class();
      v9 = [v3 clientInfo];
      id v10 = [v9 objectForKeyedSubscript:@"passwordUpdated"];
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }

      char v6 = [v11 BOOLValue];
    }
  }
  return v6;
}

- (void)harvestDataFromResponse:(id)a3
{
  id v4 = a3;
  if ([v4 statusCode] != 401) {
    [(AAUIAuthKitPasswordChangeHook *)self _harvestDataFromServerHTTPResponse:v4];
  }
}

- (void)textFieldEditingDidEnd:(id)a3
{
  id v4 = a3;
  id v5 = [(RUITableViewRow *)self->_oldPasswordRow control];

  if (v5 == v4)
  {
    v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "User has entered their old password.", buf, 2u);
    }

    id v10 = [v4 text];
    oldPassword = self->_oldPassword;
    self->_oldPassword = v10;
  }
  else
  {
    id v6 = [(RUITableViewRow *)self->_newPasswordRow control];

    oldPassword = _AAUILogSystem();
    BOOL v8 = os_log_type_enabled(oldPassword, OS_LOG_TYPE_DEFAULT);
    if (v6 == v4)
    {
      if (v8)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_209754000, oldPassword, OS_LOG_TYPE_DEFAULT, "User has entered a new password. Will not commit just yet.", v13, 2u);
      }

      id v11 = [v4 text];
      oldPassword = self->_newPassword;
      self->_newPassword = v11;
    }
    else if (v8)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_209754000, oldPassword, OS_LOG_TYPE_DEFAULT, "Received delegate callback from unknown textField, ignoring...", v12, 2u);
    }
  }
}

- (void)_handleChangeForObjectModel:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  BOOL v8 = [v6 clientInfo];
  id v9 = [v8 objectForKeyedSubscript:@"currentPasswordRowId"];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v10)
  {
    id v11 = [(AAUIAuthKitPasswordChangeHook *)self _tableViewRowWithID:v10 inObjectModel:v6];
    oldPasswordRow = self->_oldPasswordRow;
    self->_oldPasswordRow = v11;

    [(RUITableViewRow *)self->_oldPasswordRow setTextFieldChangeObserver:self];
    v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_oldPasswordRow;
      int v29 = 138412546;
      v30 = v14;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Found old password row %@ for identifier %@.", (uint8_t *)&v29, 0x16u);
    }
  }
  else
  {
    v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "Server did not provide an old password row identifier.", (uint8_t *)&v29, 2u);
    }

    v13 = self->_oldPasswordRow;
    self->_oldPasswordRow = 0;
  }

  objc_opt_class();
  v16 = [v6 clientInfo];
  id v17 = [v16 objectForKeyedSubscript:@"newPasswordRowId"];
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  v19 = _AAUILogSystem();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      newPasswordRow = self->_newPasswordRow;
      int v29 = 138412546;
      v30 = newPasswordRow;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_impl(&dword_209754000, v19, OS_LOG_TYPE_DEFAULT, "Found new password row %@ for identifier %@.", (uint8_t *)&v29, 0x16u);
    }

    v22 = [(AAUIAuthKitPasswordChangeHook *)self _tableViewRowWithID:v18 inObjectModel:v6];
    v23 = self->_newPasswordRow;
    self->_newPasswordRow = v22;

    [(RUITableViewRow *)self->_newPasswordRow setTextFieldChangeObserver:self];
  }
  else
  {
    if (v20)
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_209754000, v19, OS_LOG_TYPE_DEFAULT, "Server did not provide a new password row identifier.", (uint8_t *)&v29, 2u);
    }

    v24 = self->_newPasswordRow;
    self->_newPasswordRow = 0;
  }
  objc_opt_class();
  v25 = [v6 clientInfo];
  id v26 = [v25 objectForKeyedSubscript:@"passwordUpdated"];
  if (objc_opt_isKindOfClass()) {
    id v27 = v26;
  }
  else {
    id v27 = 0;
  }

  int v28 = [v27 BOOLValue];
  if (v28) {
    [(AAUIAuthKitPasswordChangeHook *)self _updateiCloudAccountWithCompletion:v7];
  }
  else {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_harvestDataFromServerHTTPResponse:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138477827;
    id v11 = v4;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Harvesting data from response: %{private}@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [v4 allHeaderFields];
  id v7 = [v6 objectForKeyedSubscript:@"X-Apple-I-Password-Updated"];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Found password update singal in the HTTP response.", (uint8_t *)&v10, 2u);
    }

    [(AAUIAuthKitPasswordChangeHook *)self _updateiCloudAccountWithCompletion:0];
  }
}

- (void)_updateiCloudAccountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AAUIAuthKitPasswordChangeHook *)self appleAccount];

  if (v5)
  {
    NSUInteger v6 = [(NSString *)self->_newPassword length];
    id v7 = _AAUILogSystem();
    int v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Committing new password locally.", buf, 2u);
      }

      id v9 = [(AAUIAuthKitPasswordChangeHook *)self appleAccount];
      objc_msgSend(v9, "_aa_setRawPassword:", self->_newPassword);

      NSUInteger v10 = [(NSString *)self->_oldPassword length];
      id v11 = _AAUILogSystem();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Setting old password on account credentials.", buf, 2u);
        }

        id v11 = [(AAUIAuthKitPasswordChangeHook *)self appleAccount];
        v13 = [v11 credential];
        [v13 setCredentialItem:self->_oldPassword forKey:*MEMORY[0x263EFB0F0]];
      }
      else if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Server UI flow did not provide an old password.", buf, 2u);
      }

      v15 = [MEMORY[0x263EFB210] defaultStore];
      v16 = [(AAUIAuthKitPasswordChangeHook *)self appleAccount];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __68__AAUIAuthKitPasswordChangeHook__updateiCloudAccountWithCompletion___block_invoke;
      v17[3] = &unk_263F946E0;
      id v18 = v4;
      [v15 renewCredentialsForAccount:v16 completion:v17];

      goto LABEL_20;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AAUIAuthKitPasswordChangeHook _updateiCloudAccountWithCompletion:](v8);
    }

    if (v4) {
LABEL_16:
    }
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
  else
  {
    v14 = _AAUILogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AAUIAuthKitPasswordChangeHook _updateiCloudAccountWithCompletion:](v14);
    }

    if (v4) {
      goto LABEL_16;
    }
  }
LABEL_20:
}

void __68__AAUIAuthKitPasswordChangeHook__updateiCloudAccountWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  NSUInteger v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    uint64_t v10 = a2;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials to continue password change request: %ld. Error: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v5)
  {
    if (v7)
    {
      int v8 = *(void (**)(void))(v7 + 16);
LABEL_8:
      v8();
    }
  }
  else if (v7)
  {
    int v8 = *(void (**)(void))(v7 + 16);
    goto LABEL_8;
  }
}

- (id)_tableViewRowWithID:(id)a3 inObjectModel:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  NSUInteger v6 = [a4 allPages];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ([v11 hasTableView])
        {
          id v12 = [v11 tableViewOM];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          v35 = v12;
          uint64_t v13 = [v12 sections];
          uint64_t v31 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
          if (v31)
          {
            uint64_t v14 = *(void *)v41;
            uint64_t v33 = v13;
            v34 = v6;
            uint64_t v29 = v8;
            uint64_t v30 = v9;
            uint64_t v28 = *(void *)v41;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v41 != v14) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v32 = v15;
                v16 = *(void **)(*((void *)&v40 + 1) + 8 * v15);
                long long v36 = 0u;
                long long v37 = 0u;
                long long v38 = 0u;
                long long v39 = 0u;
                id v17 = objc_msgSend(v16, "rows", v28, v29, v30);
                uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v48 count:16];
                if (v18)
                {
                  uint64_t v19 = v18;
                  uint64_t v20 = *(void *)v37;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v19; ++j)
                    {
                      if (*(void *)v37 != v20) {
                        objc_enumerationMutation(v17);
                      }
                      v22 = *(void **)(*((void *)&v36 + 1) + 8 * j);
                      v23 = [v22 attributes];
                      v24 = [v23 objectForKeyedSubscript:@"id"];
                      char v25 = [v24 isEqual:v5];

                      if (v25)
                      {
                        id v26 = v22;

                        NSUInteger v6 = v34;
                        goto LABEL_28;
                      }
                    }
                    uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v48 count:16];
                    if (v19) {
                      continue;
                    }
                    break;
                  }
                }

                uint64_t v15 = v32 + 1;
                uint64_t v13 = v33;
                NSUInteger v6 = v34;
                uint64_t v8 = v29;
                uint64_t v9 = v30;
                uint64_t v14 = v28;
              }
              while (v32 + 1 != v31);
              uint64_t v31 = [v33 countByEnumeratingWithState:&v40 objects:v49 count:16];
            }
            while (v31);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v50 count:16];
      id v26 = 0;
    }
    while (v8);
  }
  else
  {
    id v26 = 0;
  }
LABEL_28:

  return v26;
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_oldPassword, 0);
  objc_storeStrong((id *)&self->_oldPasswordRow, 0);
  objc_storeStrong((id *)&self->_newPassword, 0);
  objc_storeStrong((id *)&self->_newPasswordRow, 0);
}

- (void)processElement:(NSObject *)a3 attributes:objectModel:completion:.cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = (objc_class *)objc_opt_class();
  NSUInteger v6 = NSStringFromClass(v5);
  uint64_t v7 = NSStringFromSelector(a2);
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  __int16 v11 = v7;
  _os_log_fault_impl(&dword_209754000, a3, OS_LOG_TYPE_FAULT, "%@: %@ is not supported.", (uint8_t *)&v8, 0x16u);
}

- (void)_updateiCloudAccountWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "User not signed in to an AppleAccount, not updating account", v1, 2u);
}

- (void)_updateiCloudAccountWithCompletion:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Error: asked to update iCloud password but we failed to get one from BML.", v1, 2u);
}

@end