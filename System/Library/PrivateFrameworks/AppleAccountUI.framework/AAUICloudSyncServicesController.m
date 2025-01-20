@interface AAUICloudSyncServicesController
+ (id)_domainFromAddress:(id)a3;
+ (id)_usernameFromAddress:(id)a3;
- (AAUICloudSyncServicesController)init;
- (id)_account;
- (void)_addMailAccount:(id)a3;
- (void)_presentMergeConfirmationForDataclasses:(id)a3 account:(id)a4;
- (void)_validateMailAccount:(id)a3;
- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5;
- (void)completeEnablingCloudServicesWithCompletion:(id)a3;
- (void)setBackupEnabled:(BOOL)a3 completion:(id)a4;
- (void)setCloudServicesEnabled:(BOOL)a3 completion:(id)a4;
- (void)setDeviceLocatorEnabled:(BOOL)a3;
- (void)verifyAccountWithAppleID:(id)a3 completion:(id)a4;
@end

@implementation AAUICloudSyncServicesController

- (AAUICloudSyncServicesController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AAUICloudSyncServicesController;
  v2 = [(AAUICloudSyncServicesController *)&v8 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    queuedDataclassStates = v2->_queuedDataclassStates;
    v2->_queuedDataclassStates = v5;
  }
  return v2;
}

- (id)_account
{
  account = self->_account;
  if (!account)
  {
    v4 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
    v5 = self->_account;
    self->_account = v4;

    account = self->_account;
  }
  return account;
}

- (void)setCloudServicesEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v69 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, uint64_t, void))a4;
  v52 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
  v7 = _AAUILogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    v48 = v6;
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "User chose to use iCloud", buf, 2u);
    }

    v9 = [v52 provisionedDataclasses];
    v10 = (void *)[v9 mutableCopy];

    v11 = [v52 enabledDataclasses];
    [v10 minusSet:v11];

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obuint64_t j = v10;
    uint64_t v12 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v62;
      uint64_t v15 = MEMORY[0x263EFFA88];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v62 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          v18 = objc_msgSend(MEMORY[0x263F25810], "sharedManager", v48);
          int v19 = [v18 canAutoEnableDataclass:v17 forAccount:v52];

          if (v19)
          {
            [v52 setEnabled:1 forDataclass:v17];
            [(NSMutableDictionary *)self->_queuedDataclassStates setObject:v15 forKeyedSubscript:v17];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
      }
      while (v13);
    }

    if (!self->_queuedDataclassActions)
    {
      v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      queuedDataclassActions = self->_queuedDataclassActions;
      self->_queuedDataclassActions = v20;
    }
    if (!self->_dataclassesRequiringMergeDecision)
    {
      v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      dataclassesRequiringMergeDecision = self->_dataclassesRequiringMergeDecision;
      self->_dataclassesRequiringMergeDecision = v22;
    }
    v24 = -[ACAccountStore dataclassActionsForAccountSave:](self->_accountStore, "dataclassActionsForAccountSave:", v52, v48);
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v25 = [v24 allKeys];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v57 objects:v67 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v58;
      v50 = v25;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v58 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v57 + 1) + 8 * j);
          v31 = [v24 objectForKeyedSubscript:v30];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ((unint64_t)[v31 count] < 2)
            {
              if ([v31 count] == 1)
              {
                uint64_t v32 = v28;
                v33 = v24;
                v34 = self->_queuedDataclassActions;
                v35 = [v31 lastObject];
                v36 = v34;
                v24 = v33;
                uint64_t v28 = v32;
                [(NSMutableDictionary *)v36 setObject:v35 forKey:v30];

                v25 = v50;
              }
            }
            else
            {
              [(NSMutableArray *)self->_dataclassesRequiringMergeDecision addObject:v30];
            }
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v57 objects:v67 count:16];
      }
      while (v27);
    }

    if ([(NSMutableArray *)self->_dataclassesRequiringMergeDecision count])
    {
      v6 = v49;
      if (self->_handler != v49)
      {
        v37 = (void *)[v49 copy];
        id handler = self->_handler;
        self->_id handler = v37;
      }
      [(AAUICloudSyncServicesController *)self _presentMergeConfirmationForDataclasses:self->_dataclassesRequiringMergeDecision account:v52];
    }
    else
    {
      v6 = v49;
      v49[2](v49, 1, 0);
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "User chose not to use iCloud", buf, 2u);
    }

    v39 = [v52 enabledDataclasses];
    v40 = (void *)[v39 copy];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    obuint64_t j = v40;
    uint64_t v41 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v54;
      uint64_t v44 = MEMORY[0x263EFFA80];
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v54 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v46 = *(void *)(*((void *)&v53 + 1) + 8 * k);
          [v52 setEnabled:0 forDataclass:v46];
          [(NSMutableDictionary *)self->_queuedDataclassStates setObject:v44 forKeyedSubscript:v46];
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
      }
      while (v42);
    }

    v47 = self->_queuedDataclassActions;
    if (v47)
    {
      self->_queuedDataclassActions = 0;
    }
    v6[2](v6, 1, 0);
  }
}

- (void)_presentMergeConfirmationForDataclasses:(id)a3 account:(id)a4
{
  v5 = NSString;
  v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a3;
  BOOL v8 = [v6 bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"BATCH_MERGE_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  v20 = objc_msgSend(v5, "stringWithFormat:", v9, @"iCloud");

  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"BATCH_MERGE_FORMAT"];
  uint64_t v12 = [v10 localizedStringForKey:v11 value:&stru_26BD39CD8 table:@"Localizable"];

  uint64_t v13 = [MEMORY[0x263F23150] localizedTextForDataclasses:v7 usedAtBeginningOfSentence:0];

  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", v12, v13, @"iCloud");
  uint64_t v15 = (void *)MEMORY[0x263F259E0];
  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v17 = [v16 localizedStringForKey:@"BATCH_MERGE_CANCEL_BUTTON" value:&stru_26BD39CD8 table:@"Localizable"];
  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v19 = [v18 localizedStringForKey:@"BATCH_MERGE_OK_BUTTON" value:&stru_26BD39CD8 table:@"Localizable"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __83__AAUICloudSyncServicesController__presentMergeConfirmationForDataclasses_account___block_invoke;
  v21[3] = &unk_263F93AD0;
  v21[4] = self;
  [v15 showUserNotificationWithTitle:v20 message:v14 cancelButtonTitle:v17 otherButtonTitle:v19 withCompletionBlock:v21];
}

uint64_t __83__AAUICloudSyncServicesController__presentMergeConfirmationForDataclasses_account___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a3)
  {
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    long long v17 = 0uLL;
    long long v18 = 0uLL;
    id v4 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      uint64_t v8 = MEMORY[0x263EFFA80];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v8, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v6);
    }
  }
  else
  {
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    id v4 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v10 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v4);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * j);
          uint64_t v15 = [MEMORY[0x263EFB238] actionWithType:5];
          [*(id *)(*(void *)(a1 + 32) + 24) setObject:v15 forKey:v14];
        }
        uint64_t v11 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v11);
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 72) + 16))();
}

- (void)setDeviceLocatorEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "AASetupAssistantServiceDelegate setDeviceLocatorEnabled:%d.", (uint8_t *)v6, 8u);
  }

  if (v3)
  {
    uint64_t v5 = +[AAUIDeviceLocatorService sharedInstance];
    [v5 enableInContext:5];
  }
}

- (void)setBackupEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
  uint64_t v8 = v7;
  if (v4)
  {
    if (objc_msgSend(v7, "aa_isPrimaryEmailVerified"))
    {
      v9 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__AAUICloudSyncServicesController_setBackupEnabled_completion___block_invoke;
      block[3] = &unk_263F92048;
      block[4] = self;
      id v14 = v6;
      dispatch_async(v9, block);
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F08320];
      v16[0] = @"Primary email not verified.";
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      uint64_t v12 = objc_msgSend(v10, "aa_errorWithCode:userInfo:", 0, v11);
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v12);
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_queuedDataclassStates setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263EFB3B8]];
    (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
  }
}

void __63__AAUICloudSyncServicesController_setBackupEnabled_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F559D8]);
  id v5 = 0;
  int v3 = [v2 setupBackupWithPasscode:0 error:&v5];
  id v4 = v5;
  if (v3) {
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFB3B8]];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)completeEnablingCloudServicesWithCompletion:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "complete enabling cloud services", buf, 2u);
  }

  id v6 = [(AAUICloudSyncServicesController *)self _account];
  [v6 refresh];
  if (objc_msgSend(v6, "aa_isPrimaryEmailVerified"))
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v7 = self->_queuedDataclassStates;
    uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v13 = [(NSMutableDictionary *)self->_queuedDataclassStates objectForKeyedSubscript:v12];
          objc_msgSend(v6, "setEnabled:forDataclass:", objc_msgSend(v13, "BOOLValue"), v12);
        }
        uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v9);
    }

    accountStore = self->_accountStore;
    queuedDataclassActions = self->_queuedDataclassActions;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __79__AAUICloudSyncServicesController_completeEnablingCloudServicesWithCompletion___block_invoke;
    v33[3] = &unk_263F92B30;
    id v34 = v4;
    [(ACAccountStore *)accountStore saveAccount:v6 withDataclassActions:queuedDataclassActions completion:v33];
    id v16 = v34;
  }
  else if (v6)
  {
    long long v17 = [v6 enabledDataclasses];
    long long v18 = (void *)[v17 copy];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v18;
    uint64_t v19 = [v16 countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      uint64_t v22 = *MEMORY[0x263EFB3B8];
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v16);
          }
          long long v24 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if (([v24 isEqualToString:v22] & 1) == 0) {
            [v6 setEnabled:0 forDataclass:v24];
          }
        }
        uint64_t v20 = [v16 countByEnumeratingWithState:&v29 objects:v40 count:16];
      }
      while (v20);
    }

    v25 = self->_accountStore;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __79__AAUICloudSyncServicesController_completeEnablingCloudServicesWithCompletion___block_invoke_96;
    v27[3] = &unk_263F92B30;
    id v28 = v4;
    [(ACAccountStore *)v25 saveAccount:v6 withCompletionHandler:v27];
  }
  else
  {
    uint64_t v26 = _AALogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      -[AAUICloudSyncServicesController completeEnablingCloudServicesWithCompletion:](v26);
    }

    objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -4404);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v16);
  }
}

void __79__AAUICloudSyncServicesController_completeEnablingCloudServicesWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Failed to save iCloud account:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__AAUICloudSyncServicesController_completeEnablingCloudServicesWithCompletion___block_invoke_96(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Failed to save iCloud account:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifyAccountWithAppleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AAUICloudSyncServicesController *)self _account];
  uint64_t v9 = [v8 username];
  int v10 = [v9 isEqualToString:v7];

  if (v10)
  {
    uint64_t v11 = (AAAutoAccountVerifier *)[objc_alloc(MEMORY[0x263F25798]) initWithAccount:v8];
    verifier = self->_verifier;
    self->_verifier = v11;

    [(AAAutoAccountVerifier *)self->_verifier sendVerificationEmail];
    uint64_t v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Verifying iCloud primary email", buf, 2u);
    }

    id v14 = self->_verifier;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __71__AAUICloudSyncServicesController_verifyAccountWithAppleID_completion___block_invoke;
    v17[3] = &unk_263F93150;
    id v18 = v8;
    uint64_t v19 = self;
    id v20 = v6;
    [(AAAutoAccountVerifier *)v14 verifyWithHandler:v17];

    uint64_t v15 = v18;
  }
  else
  {
    id v16 = _AAUILogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "ERROR: Trying to verify the email for an iCloud we're not familiar with. That's bad.", buf, 2u);
    }

    uint64_t v15 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:userInfo:", 111, 0);
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v15);
  }
}

void __71__AAUICloudSyncServicesController_verifyAccountWithAppleID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AAUILogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Primary email verified!", buf, 2u);
    }

    id v8 = [*(id *)(a1 + 32) provisionedDataclasses];
    uint64_t v9 = (void *)[v8 copy];

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 8);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __71__AAUICloudSyncServicesController_verifyAccountWithAppleID_completion___block_invoke_98;
    v15[3] = &unk_263F93AF8;
    id v16 = v5;
    id v17 = *(id *)(a1 + 32);
    id v18 = v9;
    uint64_t v12 = *(void **)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 40);
    id v20 = v12;
    id v13 = v9;
    objc_msgSend(v11, "aa_updatePropertiesForAppleAccount:completion:", v10, v15);
  }
  else
  {
    if (v7)
    {
      id v14 = [v5 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v14;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Verification failed: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __71__AAUICloudSyncServicesController_verifyAccountWithAppleID_completion___block_invoke_98(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (*(void *)(a1 + 32))
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Account update failed: %@", buf, 0xCu);
    }
  }
  else
  {
    id v18 = v4;
    BOOL v7 = [*(id *)(a1 + 40) provisionedDataclasses];
    id v8 = (void *)[v7 mutableCopy];

    [v8 minusSet:*(void *)(a1 + 48)];
    uint64_t v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Now that we're verified we've got some new provisioned dataclasses: %@", buf, 0xCu);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v8;
    uint64_t v10 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      uint64_t v13 = *MEMORY[0x263EFB3B8];
      uint64_t v14 = MEMORY[0x263EFFA88];
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v6);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
          id v17 = [MEMORY[0x263F25810] sharedManager];
          LODWORD(v16) = [v17 canAutoEnableDataclass:v16 forAccount:*(void *)(a1 + 40)];

          if (v16) {
            [*(id *)(*(void *)(a1 + 56) + 40) setObject:v14 forKeyedSubscript:v13];
          }
          ++v15;
        }
        while (v11 != v15);
        uint64_t v11 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    id v5 = v18;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_validateMailAccount:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Verifying Email account.", v8, 2u);
  }

  id v6 = (MFAccountValidator *)objc_alloc_init(MEMORY[0x263F55330]);
  validator = self->_validator;
  self->_validator = v6;

  [(MFAccountValidator *)self->_validator setDelegate:self];
  [(MFAccountValidator *)self->_validator validateAccount:v4 useSSL:1];
}

- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([v7 accountIsValid])
  {
    uint64_t v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Email account has been verified.", (uint8_t *)&v21, 2u);
    }

    if (self->_isVerifyingExistingEmailAccount)
    {
      id handler = (void (**)(id, uint64_t, void))self->_handler;
      if (handler) {
        handler[2](handler, 1, 0);
      }
    }
    else
    {
      [(AAUICloudSyncServicesController *)self _addMailAccount:v8];
    }
  }
  else
  {
    uint64_t v11 = [v7 error];
    uint64_t v12 = [v11 code];
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = [v11 userInfo];
    if (v12 == 1032) {
      uint64_t v15 = 111;
    }
    else {
      uint64_t v15 = 112;
    }
    uint64_t v16 = objc_msgSend(v13, "aa_errorWithCode:userInfo:", v15, v14);

    id v17 = (void (**)(id, void, void *))self->_handler;
    if (v17) {
      v17[2](v17, 0, v16);
    }

    id v18 = _AAUILogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = [v11 localizedDescription];
      int v21 = 138412290;
      long long v22 = v19;
      _os_log_impl(&dword_209754000, v18, OS_LOG_TYPE_DEFAULT, "Email account verification failed: %@", (uint8_t *)&v21, 0xCu);
    }
  }
  validator = self->_validator;
  self->_validator = 0;
}

- (void)_addMailAccount:(id)a3
{
  id v4 = (void *)MEMORY[0x263F553B0];
  id v5 = a3;
  id v6 = [v4 mailAccounts];
  id v7 = [v6 arrayByAddingObject:v5];

  [MEMORY[0x263F553B0] setMailAccounts:v7];
  if (self->_handler)
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "IMAP: Email account added", v9, 2u);
    }

    (*((void (**)(void))self->_handler + 2))();
  }
}

+ (id)_domainFromAddress:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"@"];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [v3 substringFromIndex:v4 + 1];
    id v5 = [v6 lowercaseString];
  }
  return v5;
}

+ (id)_usernameFromAddress:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"+"];
  if (!v5) {
    uint64_t v4 = [v3 rangeOfString:@"@"];
  }
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v3 substringToIndex:v4];
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_queuedDataclassStates, 0);
  objc_storeStrong((id *)&self->_dataclassesRequiringMergeDecision, 0);
  objc_storeStrong((id *)&self->_queuedDataclassActions, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)completeEnablingCloudServicesWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[AAUICloudSyncServicesController completeEnablingCloudServicesWithCompletion:]";
  _os_log_fault_impl(&dword_209754000, log, OS_LOG_TYPE_FAULT, "%s: attempted to completeEnablingCloudServicesWithCompletion with a nil account", (uint8_t *)&v1, 0xCu);
}

@end