@interface ACDDataclassOwnersManager
- (ACDDataclassOwnersManager)init;
- (BOOL)isPerformingDataclassActionsForAccount:(id)a3;
- (BOOL)performDataclassActions:(id)a3 forAccount:(id)a4 withChildren:(id)a5 withError:(id *)a6;
- (id)_dataclassOwnersManagerConnection;
- (id)actionsForAddingAccount:(id)a3 affectingDataclass:(id)a4 withError:(id *)a5;
- (id)actionsForDeletingAccount:(id)a3 affectingDataclass:(id)a4 withError:(id *)a5;
- (id)actionsForDisablingDataclass:(id)a3 onAccount:(id)a4 withError:(id *)a5;
- (id)actionsForEnablingDataclass:(id)a3 onAccount:(id)a4 withError:(id *)a5;
- (void)_dataclassOwnersManagerConnection;
- (void)preloadDataclassOwnersWithError:(id *)a3;
@end

@implementation ACDDataclassOwnersManager

- (ACDDataclassOwnersManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACDDataclassOwnersManager;
  v2 = [(ACDDataclassOwnersManager *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    connectionLock = v2->_connectionLock;
    v2->_connectionLock = v3;
  }
  return v2;
}

- (void)preloadDataclassOwnersWithError:(id *)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__9;
  v13 = __Block_byref_object_dispose__9;
  id v14 = 0;
  v4 = [(ACDDataclassOwnersManager *)self _dataclassOwnersManagerConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke;
  v8[3] = &unk_264321E28;
  v8[4] = &v9;
  v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v8];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_1;
  v7[3] = &unk_264321E28;
  v7[4] = &v9;
  [v5 preloadDataclassOwnersWithCompletion:v7];
  if (a3)
  {
    objc_super v6 = (void *)v10[5];
    if (v6) {
      *a3 = v6;
    }
  }

  _Block_object_dispose(&v9, 8);
}

void __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_1(uint64_t a1, void *a2)
{
}

- (BOOL)isPerformingDataclassActionsForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v5 = [(ACDDataclassOwnersManager *)self _dataclassOwnersManagerConnection];
  objc_super v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_11];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__ACDDataclassOwnersManager_isPerformingDataclassActionsForAccount___block_invoke_2;
  v8[3] = &unk_264321E70;
  v8[4] = &v9;
  [v6 isPerformingDataclassActionsForAccount:v4 completion:v8];
  LOBYTE(v5) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v5;
}

void __68__ACDDataclassOwnersManager_isPerformingDataclassActionsForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _ACDLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();
  }
}

uint64_t __68__ACDDataclassOwnersManager_isPerformingDataclassActionsForAccount___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)actionsForAddingAccount:(id)a3 affectingDataclass:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  v10 = [(ACDDataclassOwnersManager *)self _dataclassOwnersManagerConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__ACDDataclassOwnersManager_actionsForAddingAccount_affectingDataclass_withError___block_invoke;
  v16[3] = &unk_264321E28;
  v16[4] = &v23;
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v16];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __82__ACDDataclassOwnersManager_actionsForAddingAccount_affectingDataclass_withError___block_invoke_4;
  v15[3] = &unk_264321E98;
  v15[4] = &v17;
  v15[5] = &v23;
  [v11 actionsForAddingAccount:v8 affectingDataclass:v9 completion:v15];
  if (a5)
  {
    char v12 = (void *)v24[5];
    if (v12) {
      *a5 = v12;
    }
  }
  id v13 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __82__ACDDataclassOwnersManager_actionsForAddingAccount_affectingDataclass_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __82__ACDDataclassOwnersManager_actionsForAddingAccount_affectingDataclass_withError___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)actionsForDeletingAccount:(id)a3 affectingDataclass:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  v10 = [(ACDDataclassOwnersManager *)self _dataclassOwnersManagerConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__ACDDataclassOwnersManager_actionsForDeletingAccount_affectingDataclass_withError___block_invoke;
  v16[3] = &unk_264321E28;
  v16[4] = &v23;
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v16];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__ACDDataclassOwnersManager_actionsForDeletingAccount_affectingDataclass_withError___block_invoke_6;
  v15[3] = &unk_264321E98;
  v15[4] = &v17;
  v15[5] = &v23;
  [v11 actionsForDeletingAccount:v8 affectingDataclass:v9 completion:v15];
  if (a5)
  {
    char v12 = (void *)v24[5];
    if (v12) {
      *a5 = v12;
    }
  }
  id v13 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __84__ACDDataclassOwnersManager_actionsForDeletingAccount_affectingDataclass_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __84__ACDDataclassOwnersManager_actionsForDeletingAccount_affectingDataclass_withError___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)actionsForEnablingDataclass:(id)a3 onAccount:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  v10 = [(ACDDataclassOwnersManager *)self _dataclassOwnersManagerConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__ACDDataclassOwnersManager_actionsForEnablingDataclass_onAccount_withError___block_invoke;
  v16[3] = &unk_264321E28;
  v16[4] = &v23;
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v16];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__ACDDataclassOwnersManager_actionsForEnablingDataclass_onAccount_withError___block_invoke_7;
  v15[3] = &unk_264321E98;
  v15[4] = &v17;
  v15[5] = &v23;
  [v11 actionsForEnablingDataclass:v8 onAccount:v9 completion:v15];
  if (a5)
  {
    char v12 = (void *)v24[5];
    if (v12) {
      *a5 = v12;
    }
  }
  id v13 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __77__ACDDataclassOwnersManager_actionsForEnablingDataclass_onAccount_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __77__ACDDataclassOwnersManager_actionsForEnablingDataclass_onAccount_withError___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)actionsForDisablingDataclass:(id)a3 onAccount:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  v10 = [(ACDDataclassOwnersManager *)self _dataclassOwnersManagerConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __78__ACDDataclassOwnersManager_actionsForDisablingDataclass_onAccount_withError___block_invoke;
  v16[3] = &unk_264321E28;
  v16[4] = &v23;
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v16];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__ACDDataclassOwnersManager_actionsForDisablingDataclass_onAccount_withError___block_invoke_8;
  v15[3] = &unk_264321E98;
  v15[4] = &v17;
  v15[5] = &v23;
  [v11 actionsForDisablingDataclass:v8 onAccount:v9 completion:v15];
  if (a5)
  {
    char v12 = (void *)v24[5];
    if (v12) {
      *a5 = v12;
    }
  }
  id v13 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __78__ACDDataclassOwnersManager_actionsForDisablingDataclass_onAccount_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __78__ACDDataclassOwnersManager_actionsForDisablingDataclass_onAccount_withError___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)performDataclassActions:(id)a3 forAccount:(id)a4 withChildren:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 count])
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__9;
    uint64_t v23 = __Block_byref_object_dispose__9;
    id v24 = 0;
    id v13 = [(ACDDataclassOwnersManager *)self _dataclassOwnersManagerConnection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __87__ACDDataclassOwnersManager_performDataclassActions_forAccount_withChildren_withError___block_invoke;
    v18[3] = &unk_264321E28;
    v18[4] = &v19;
    id v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v18];

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __87__ACDDataclassOwnersManager_performDataclassActions_forAccount_withChildren_withError___block_invoke_9;
    v17[3] = &unk_264321EC0;
    v17[4] = &v25;
    v17[5] = &v19;
    [v14 performDataclassActions:v10 forAccount:v11 withChildren:v12 completion:v17];
    if (a6) {
      *a6 = (id) v20[5];
    }
    BOOL v15 = *((unsigned char *)v26 + 24) != 0;

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

void __87__ACDDataclassOwnersManager_performDataclassActions_forAccount_withChildren_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __87__ACDDataclassOwnersManager_performDataclassActions_forAccount_withChildren_withError___block_invoke_9(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)_dataclassOwnersManagerConnection
{
  [(NSLock *)self->_connectionLock lock];
  if (!self->_connection)
  {
    id v3 = _ACDLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ACDDataclassOwnersManager _dataclassOwnersManagerConnection](v3);
    }

    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.accounts.dom"];
    connection = self->_connection;
    self->_connection = v4;

    id v6 = +[ACDDataclassOwnersManagerInterface XPCInterface];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_15];
    [(NSXPCConnection *)self->_connection setInvalidationHandler:&__block_literal_global_18];
    [(NSXPCConnection *)self->_connection resume];
  }
  [(NSLock *)self->_connectionLock unlock];
  uint64_t v7 = self->_connection;

  return v7;
}

void __62__ACDDataclassOwnersManager__dataclassOwnersManagerConnection__block_invoke()
{
  v0 = _ACDLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __62__ACDDataclassOwnersManager__dataclassOwnersManagerConnection__block_invoke_cold_1(v0);
  }
}

void __62__ACDDataclassOwnersManager__dataclassOwnersManagerConnection__block_invoke_16()
{
  v0 = _ACDLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEFAULT, "\"Connection to remote DOM closed.\"", v1, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionLock, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Remote dataclass owners manager returned an error: %@\"", v2, v3, v4, v5, v6);
}

- (void)_dataclassOwnersManagerConnection
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "\"Client DOM is connecting to remote service.\"", v1, 2u);
}

void __62__ACDDataclassOwnersManager__dataclassOwnersManagerConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2183AD000, log, OS_LOG_TYPE_ERROR, "\"Connection to remote DOM interrupted!\"", v1, 2u);
}

@end