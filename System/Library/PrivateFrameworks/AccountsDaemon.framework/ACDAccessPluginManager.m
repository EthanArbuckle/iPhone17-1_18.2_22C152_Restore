@interface ACDAccessPluginManager
- (ACDAccessPluginManager)init;
- (id)_authorizationPluginForAccountType:(id)a3;
- (void)authorizeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6;
- (void)handleAccessRequestToAccountsOfType:(id)a3 forClient:(id)a4 withOptions:(id)a5 store:(id)a6 allowUserInteraction:(BOOL)a7 completion:(id)a8;
- (void)revokeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6;
- (void)revokeAllAccessToAccountsOfType:(id)a3 store:(id)a4 withCompletion:(id)a5;
@end

@implementation ACDAccessPluginManager

- (id)_authorizationPluginForAccountType:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  accessPlugins = v5->_accessPlugins;
  if (!accessPlugins)
  {
    uint64_t v7 = +[ACPluginLoader pluginBundlesAtSubpath:@"Access"];
    v8 = v5->_accessPlugins;
    v5->_accessPlugins = (NSSet *)v7;

    accessPlugins = v5->_accessPlugins;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v9 = accessPlugins;
  id v10 = (id)[(NSSet *)v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v25;
    *(void *)&long long v11 = 138412546;
    long long v21 = v11;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v15 = (objc_class *)objc_msgSend(v14, "principalClass", v21);
        v16 = _ACDLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v18 = [v14 bundleURL];
          *(_DWORD *)buf = v21;
          v29 = v18;
          __int16 v30 = 2112;
          id v31 = v4;
          _os_log_debug_impl(&dword_2183AD000, v16, OS_LOG_TYPE_DEBUG, "\"Testing if plugin %@ supports account type %@\"", buf, 0x16u);
        }
        if ([(objc_class *)v15 supportsAccountTypeWithIdentifier:v4])
        {
          v19 = _ACDLogSystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            -[ACDAccessPluginManager _authorizationPluginForAccountType:]();
          }

          id v10 = objc_alloc_init(v15);
          goto LABEL_19;
        }
        v17 = _ACDLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          [(ACDAccessPluginManager *)&v22 _authorizationPluginForAccountType:v17];
        }
      }
      id v10 = (id)[(NSSet *)v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  objc_sync_exit(v5);

  return v10;
}

intptr_t __122__ACDAccessPluginManager_handleAccessRequestToAccountsOfType_forClient_withOptions_store_allowUserInteraction_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

void __122__ACDAccessPluginManager_handleAccessRequestToAccountsOfType_forClient_withOptions_store_allowUserInteraction_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 80);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __122__ACDAccessPluginManager_handleAccessRequestToAccountsOfType_forClient_withOptions_store_allowUserInteraction_completion___block_invoke_2;
  v12[3] = &unk_2643219F0;
  uint64_t v8 = *(void *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  dispatch_semaphore_t v13 = v2;
  id v14 = v9;
  id v10 = v2;
  [v3 handleAccessRequestToAccountsOfType:v4 forClient:v5 withOptions:v6 store:v8 allowUserInteraction:v7 completion:v12];
  long long v11 = _ACDLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __122__ACDAccessPluginManager_handleAccessRequestToAccountsOfType_forClient_withOptions_store_allowUserInteraction_completion___block_invoke_cold_1();
  }

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)handleAccessRequestToAccountsOfType:(id)a3 forClient:(id)a4 withOptions:(id)a5 store:(id)a6 allowUserInteraction:(BOOL)a7 completion:(id)a8
{
  v48[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v36 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = (void (**)(id, void, void *))a8;
  v18 = [v14 identifier];
  v19 = [MEMORY[0x263EFB210] _obsoleteAccountTypeIDsToRemove];
  int v20 = [v19 containsObject:v18];

  long long v21 = _ACDLogSystem();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v20)
  {
    if (v22) {
      -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:]();
    }

    id v23 = [NSString stringWithFormat:@"No accounts found for account type %@", v18];
    if ([v18 isEqualToString:*MEMORY[0x263EFAEC0]]) {
      uint64_t v24 = 6;
    }
    else {
      uint64_t v24 = 7;
    }
    long long v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263EFB070];
    uint64_t v47 = *MEMORY[0x263F08320];
    v48[0] = v23;
    long long v27 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
    v28 = [v25 errorWithDomain:v26 code:v24 userInfo:v27];

    v17[2](v17, 0, v28);
    goto LABEL_15;
  }
  if (v22) {
    -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:]();
  }

  id v23 = [(ACDAccessPluginManager *)self _authorizationPluginForAccountType:v18];
  if (!v23)
  {
    v28 = [NSString stringWithFormat:@"No access plugin was found that supports the account type %@", v18];
    v32 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263EFB070];
    uint64_t v45 = *MEMORY[0x263F08320];
    v46 = v28;
    v34 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v35 = [v32 errorWithDomain:v33 code:1 userInfo:v34];

    v17[2](v17, 0, v35);
LABEL_15:
    id v31 = v36;
    goto LABEL_16;
  }
  v29 = _ACDLogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:]();
  }

  accessPluginQueue = self->_accessPluginQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __122__ACDAccessPluginManager_handleAccessRequestToAccountsOfType_forClient_withOptions_store_allowUserInteraction_completion___block_invoke;
  block[3] = &unk_264321A18;
  id v23 = v23;
  id v38 = v23;
  id v39 = v14;
  id v31 = v36;
  id v40 = v36;
  id v41 = v15;
  id v42 = v16;
  BOOL v44 = a7;
  v43 = v17;
  dispatch_async(accessPluginQueue, block);

  v28 = v38;
LABEL_16:
}

- (ACDAccessPluginManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)ACDAccessPluginManager;
  dispatch_semaphore_t v2 = [(ACDAccessPluginManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ACDAccessPluginQueue", v3);
    accessPluginQueue = v2->_accessPluginQueue;
    v2->_accessPluginQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)authorizeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6
{
  v31[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 identifier];
  id v15 = _ACDLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:]();
  }

  id v16 = [(ACDAccessPluginManager *)self _authorizationPluginForAccountType:v14];
  if (v16)
  {
    v17 = _ACDLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:]();
    }

    accessPluginQueue = self->_accessPluginQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke;
    block[3] = &unk_2643210A8;
    id v25 = v16;
    id v26 = v10;
    id v27 = v11;
    id v28 = v12;
    id v29 = v13;
    dispatch_async(accessPluginQueue, block);

    v19 = v25;
  }
  else
  {
    v19 = [NSString stringWithFormat:@"No access plugin was found that supports the account type %@", v14];
    int v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263EFB070];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31[0] = v19;
    BOOL v22 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v23 = [v20 errorWithDomain:v21 code:1 userInfo:v22];

    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v23);
  }
}

void __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_2;
  v10[3] = &unk_2643219F0;
  id v7 = *(id *)(a1 + 64);
  dispatch_semaphore_t v11 = v2;
  id v12 = v7;
  uint64_t v8 = v2;
  [v3 authorizeAccessToAccountsOfType:v4 forClient:v5 store:v6 completion:v10];
  id v9 = _ACDLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_cold_1();
  }

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _ACDLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_2_cold_1(a2);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)revokeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6
{
  v31[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 identifier];
  id v15 = _ACDLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccessPluginManager revokeAccessToAccountsOfType:forClient:store:completion:]();
  }

  id v16 = [(ACDAccessPluginManager *)self _authorizationPluginForAccountType:v14];
  if (v16)
  {
    v17 = _ACDLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:]();
    }

    accessPluginQueue = self->_accessPluginQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__ACDAccessPluginManager_revokeAccessToAccountsOfType_forClient_store_completion___block_invoke;
    block[3] = &unk_2643210A8;
    id v25 = v16;
    id v26 = v10;
    id v27 = v11;
    id v28 = v12;
    id v29 = v13;
    dispatch_async(accessPluginQueue, block);

    v19 = v25;
  }
  else
  {
    v19 = [NSString stringWithFormat:@"No access plugin was found that supports the account type %@", v14];
    int v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263EFB070];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31[0] = v19;
    BOOL v22 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v23 = [v20 errorWithDomain:v21 code:1 userInfo:v22];

    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v23);
  }
}

void __82__ACDAccessPluginManager_revokeAccessToAccountsOfType_forClient_store_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__ACDAccessPluginManager_revokeAccessToAccountsOfType_forClient_store_completion___block_invoke_2;
  v10[3] = &unk_2643219F0;
  id v7 = *(id *)(a1 + 64);
  dispatch_semaphore_t v11 = v2;
  id v12 = v7;
  uint64_t v8 = v2;
  [v3 revokeAccessToAccountsOfType:v4 forClient:v5 store:v6 completion:v10];
  id v9 = _ACDLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __82__ACDAccessPluginManager_revokeAccessToAccountsOfType_forClient_store_completion___block_invoke_cold_1();
  }

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __82__ACDAccessPluginManager_revokeAccessToAccountsOfType_forClient_store_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_2_cold_1(a2);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)revokeAllAccessToAccountsOfType:(id)a3 store:(id)a4 withCompletion:(id)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_semaphore_t v11 = [v8 identifier];
  id v12 = _ACDLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccessPluginManager revokeAllAccessToAccountsOfType:store:withCompletion:]();
  }

  id v13 = [(ACDAccessPluginManager *)self _authorizationPluginForAccountType:v11];
  if (v13)
  {
    id v14 = _ACDLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:]();
    }

    accessPluginQueue = self->_accessPluginQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__ACDAccessPluginManager_revokeAllAccessToAccountsOfType_store_withCompletion___block_invoke;
    block[3] = &unk_264321080;
    id v22 = v13;
    id v23 = v8;
    id v24 = v9;
    id v25 = v10;
    dispatch_async(accessPluginQueue, block);

    id v16 = v22;
  }
  else
  {
    id v16 = [NSString stringWithFormat:@"No access plugin was found that supports the account type %@", v11];
    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263EFB070];
    uint64_t v26 = *MEMORY[0x263F08320];
    v27[0] = v16;
    v19 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    int v20 = [v17 errorWithDomain:v18 code:1 userInfo:v19];

    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v20);
  }
}

void __79__ACDAccessPluginManager_revokeAllAccessToAccountsOfType_store_withCompletion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__ACDAccessPluginManager_revokeAllAccessToAccountsOfType_store_withCompletion___block_invoke_2;
  v9[3] = &unk_2643219F0;
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_semaphore_t v10 = v2;
  id v11 = v6;
  id v7 = v2;
  [v3 revokeAllAccessToAccountsOfType:v4 store:v5 withCompletion:v9];
  id v8 = _ACDLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __79__ACDAccessPluginManager_revokeAllAccessToAccountsOfType_store_withCompletion___block_invoke_cold_1();
  }

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __79__ACDAccessPluginManager_revokeAllAccessToAccountsOfType_store_withCompletion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_2_cold_1(a2);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPluginQueue, 0);

  objc_storeStrong((id *)&self->_accessPlugins, 0);
}

- (void)handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "\"Account type %@ has been obsoleted and accounts and authorization plugins removed, returning no accounts error\"", v1, 0xCu);
}

- (void)handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Dispatching to access plugin queue...\"", v2, v3, v4, v5, v6);
}

- (void)handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "\"Looking for plugin to authorize access to account type %@ for %@\"");
}

void __122__ACDAccessPluginManager_handleAccessRequestToAccountsOfType_forClient_withOptions_store_allowUserInteraction_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Called out to plugin (handleAccessRequest), now waiting for signal from completion handler...\"", v2, v3, v4, v5, v6);
}

void __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Called out to plugin (authorizeAccess), now waiting for signal from completion handler...\"", v2, v3, v4, v5, v6);
}

void __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_2_cold_1(char a1)
{
  uint64_t v1 = [NSNumber numberWithBool:a1 & 1];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_28(&dword_2183AD000, v2, v3, "\"Plugin result handler called with result %@.\"", v4, v5, v6, v7, v8);
}

- (void)revokeAccessToAccountsOfType:forClient:store:completion:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "\"Looking for plugin to revoke access to account type %@ for %@\"");
}

void __82__ACDAccessPluginManager_revokeAccessToAccountsOfType_forClient_store_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Called out to plugin (revokeAccess), now waiting for signal from completion handler...\"", v2, v3, v4, v5, v6);
}

- (void)revokeAllAccessToAccountsOfType:store:withCompletion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "\"Looking for plugin to revoke ALL access to account type %@\"", v1, 0xCu);
}

void __79__ACDAccessPluginManager_revokeAllAccessToAccountsOfType_store_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Called out to plugin (revokeAllAccess), now waiting for signal from completion handler...\"", v2, v3, v4, v5, v6);
}

- (void)_authorizationPluginForAccountType:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Account type supported!\"", v2, v3, v4, v5, v6);
}

- (void)_authorizationPluginForAccountType:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "\"Account type not supported!\"", buf, 2u);
}

@end