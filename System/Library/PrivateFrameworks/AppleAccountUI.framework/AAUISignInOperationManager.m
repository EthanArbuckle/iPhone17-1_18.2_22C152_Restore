@interface AAUISignInOperationManager
- (AAUISignInOperationDelegate)delegate;
- (AAUISignInOperationManager)init;
- (AAUISignInOperationManager)initWithPresentingViewController:(id)a3;
- (UIViewController)presentingViewController;
- (id)_alertControllerForPicker:(id)a3 completion:(id)a4;
- (id)_dataclassMergeActionPickerFromPicker:(id)a3;
- (id)operationsHelper:(id)a3 desiredDataclassActionFromPicker:(id)a4;
- (void)_delegate_signInOperationManagerDidSaveAccount:(id)a3 error:(id)a4;
- (void)_disableDataclasses:(id)a3 forAccount:(id)a4 completion:(id)a5;
- (void)_mainQueue_dataclassActionsForPicker:(id)a3 completion:(id)a4;
- (void)_refreshEnabledDataclassesForAccount:(id)a3;
- (void)enableDataclasses:(id)a3 forAccount:(id)a4;
- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)operationsHelper:(id)a3 willRemoveAccount:(id)a4;
- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)signInAccount:(id)a3 enablingDataclasses:(BOOL)a4;
@end

@implementation AAUISignInOperationManager

- (AAUISignInOperationManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)AAUISignInOperationManager;
  v2 = [(AAUISignInOperationManager *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFB210]);
    uint64_t v4 = [objc_alloc(MEMORY[0x263F23128]) initWithAccountStore:v3];
    accountOperationsHelper = v2->_accountOperationsHelper;
    v2->_accountOperationsHelper = (ACUIAccountOperationsHelper *)v4;

    [(ACUIAccountOperationsHelper *)v2->_accountOperationsHelper setDelegate:v2];
  }
  return v2;
}

- (AAUISignInOperationManager)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v5 = [(AAUISignInOperationManager *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
  }

  return v6;
}

- (void)signInAccount:(id)a3 enablingDataclasses:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = v6;
  if (v4)
  {
    id v9 = [v6 provisionedDataclasses];
    [(AAUISignInOperationManager *)self enableDataclasses:v9 forAccount:v7];
  }
  else
  {
    v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Sign in operation about to call save, but not enabling dataclasses!", buf, 2u);
    }

    [(ACUIAccountOperationsHelper *)self->_accountOperationsHelper saveAccount:v7 requireVerification:1];
  }
}

- (void)enableDataclasses:(id)a3 forAccount:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to enable dataclasses (%@) for account (%@)", buf, 0x16u);
  }

  [(AAUISignInOperationManager *)self _refreshEnabledDataclassesForAccount:v7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        v15 = objc_msgSend(MEMORY[0x263F25810], "sharedManager", (void)v17);
        int v16 = [v15 canAutoEnableDataclass:v14 forAccount:v7];

        if (v16) {
          [v7 setEnabled:1 forDataclass:v14];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(ACUIAccountOperationsHelper *)self->_accountOperationsHelper saveAccount:v7 requireVerification:1];
}

- (void)_refreshEnabledDataclassesForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AAUISignInOperationManager _refreshEnabledDataclassesForAccount:]((uint64_t)v3, v4);
  }

  id v5 = objc_alloc_init(MEMORY[0x263EFB210]);
  id v6 = [v5 enabledDataclassesForAccount:v3];
  id v7 = (void *)[v6 mutableCopy];

  if (v7)
  {
    [v3 setEnabledDataclasses:v7];
  }
  else
  {
    v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AAUISignInOperationManager _refreshEnabledDataclassesForAccount:](v8);
    }
  }
}

- (void)_delegate_signInOperationManagerDidSaveAccount:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v7 = [(AAUISignInOperationManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 signInOperationManager:self didSaveAccount:v8 error:v6];
  }
}

- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "operationsHelper: %@ willSaveAccount: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = _AAUILogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v22 = v10;
    if (v7) {
      uint64_t v14 = @"YES";
    }
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2112;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "operationsHelper: %@ didSaveAccount: %@ withSuccess: %@ error: %@", buf, 0x2Au);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__AAUISignInOperationManager_operationsHelper_didSaveAccount_withSuccess_error___block_invoke;
  v17[3] = &unk_263F93418;
  BOOL v20 = v7;
  v17[4] = self;
  id v18 = v11;
  id v19 = v12;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(MEMORY[0x263EF83A0], v17);
}

uint64_t __80__AAUISignInOperationManager_operationsHelper_didSaveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v4 = *(void *)(a1 + 48);
  }
  return objc_msgSend(v3, "_delegate_signInOperationManagerDidSaveAccount:error:", v5, v4);
}

- (void)operationsHelper:(id)a3 willRemoveAccount:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "operationsHelper: %@ willRemoveAccount: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = _AAUILogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"NO";
    int v14 = 138413058;
    id v15 = v9;
    __int16 v16 = 2112;
    if (v7) {
      uint64_t v13 = @"YES";
    }
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v13;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_209754000, v12, OS_LOG_TYPE_DEFAULT, "operationsHelper: %@ didRemoveAccount: %@ withSuccess: %@ error: %@", (uint8_t *)&v14, 0x2Au);
  }
}

- (id)operationsHelper:(id)a3 desiredDataclassActionFromPicker:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "operationsHelper: %@ desiredDataclassActionFromPicker: %@", buf, 0x16u);
  }

  id v9 = MEMORY[0x263EF83A0];
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__8;
  id v21 = __Block_byref_object_dispose__8;
  id v22 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__AAUISignInOperationManager_operationsHelper_desiredDataclassActionFromPicker___block_invoke;
  v15[3] = &unk_263F93468;
  v15[4] = self;
  id v16 = v7;
  dispatch_semaphore_t v17 = v10;
  __int16 v18 = buf;
  id v11 = v10;
  id v12 = v7;
  dispatch_async(v9, v15);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  id v13 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v13;
}

void __80__AAUISignInOperationManager_operationsHelper_desiredDataclassActionFromPicker___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [v2 _dataclassMergeActionPickerFromPicker:*(void *)(a1 + 40)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__AAUISignInOperationManager_operationsHelper_desiredDataclassActionFromPicker___block_invoke_2;
  v6[3] = &unk_263F93440;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v7 = v5;
  objc_msgSend(v2, "_mainQueue_dataclassActionsForPicker:completion:", v3, v6);
}

void __80__AAUISignInOperationManager_operationsHelper_desiredDataclassActionFromPicker___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "User selected dataclass action: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_dataclassMergeActionPickerFromPicker:(id)a3
{
  id v3 = a3;
  if ([v3 hasActionOfType:5]
    && ![v3 hasDestructiveActions])
  {
    uint64_t v5 = [AAUIDataclassMergeActionPicker alloc];
    id v6 = [v3 actions];
    id v7 = [v3 affectedAccount];
    id v4 = [(ACUIDataclassActionPicker *)v5 initWithActions:v6 affectingAccount:v7];

    int v8 = [v3 affectedDataclasses];
    [(ACUIDataclassActionPicker *)v4 setAffectedDataclasses:v8];

    [(AAUIDataclassMergeActionPicker *)v4 setPerformingBatchMerge:1];
  }
  else
  {
    id v4 = (AAUIDataclassMergeActionPicker *)v3;
  }

  return v4;
}

- (void)_mainQueue_dataclassActionsForPicker:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v9 = [(AAUISignInOperationManager *)self _alertControllerForPicker:v7 completion:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [WeakRetained presentViewController:v9 animated:1 completion:0];
}

- (id)_alertControllerForPicker:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v24 = a4;
  id v6 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  int v8 = (void *)MEMORY[0x263F82418];
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v9 = [v5 title];
    uint64_t v10 = [v5 message];
    id v11 = [v8 alertWithTitle:v9 message:v10];
  }
  else
  {
    id v9 = [v5 message];
    id v11 = [v8 alertWithTitle:v9 message:0];
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [v5 actions];
  uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        dispatch_semaphore_t v17 = [v5 descriptionForDataclassAction:v16];
        if ([v16 isDestructive]) {
          uint64_t v18 = 2;
        }
        else {
          uint64_t v18 = 0;
        }
        id v19 = (void *)MEMORY[0x263F82400];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __67__AAUISignInOperationManager__alertControllerForPicker_completion___block_invoke;
        v25[3] = &unk_263F93490;
        v25[4] = v16;
        v25[5] = self;
        id v26 = v5;
        id v27 = v24;
        __int16 v20 = [v19 actionWithTitle:v17 style:v18 handler:v25];
        [v11 addAction:v20];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }

  return v11;
}

void __67__AAUISignInOperationManager__alertControllerForPicker_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) type])
  {
    int v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) affectedDataclasses];
    id v5 = [*(id *)(a1 + 48) affectedAccount];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __67__AAUISignInOperationManager__alertControllerForPicker_completion___block_invoke_2;
    v6[3] = &unk_263F920E8;
    id v7 = *(id *)(a1 + 56);
    [v3 _disableDataclasses:v4 forAccount:v5 completion:v6];
  }
}

void __67__AAUISignInOperationManager__alertControllerForPicker_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263EFB238] actionWithType:7];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_disableDataclasses:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v7);
        }
        [v8 setEnabled:0 forDataclass:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
  v9[2](v9);
}

- (AAUISignInOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISignInOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountOperationsHelper, 0);
}

- (void)_refreshEnabledDataclassesForAccount:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Failed to fetch persisted -enabledDataclasses, reusing cached value.", v1, 2u);
}

- (void)_refreshEnabledDataclassesForAccount:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Refreshing enabled dataclasses for account: %@", (uint8_t *)&v2, 0xCu);
}

@end