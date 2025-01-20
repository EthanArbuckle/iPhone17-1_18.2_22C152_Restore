@interface CDPTermsInfoBackupController
- (CDPDaemonConnection)daemonConn;
- (CDPTermsInfoBackupController)init;
- (void)fetchTermsAcceptanceForAccount:(id)a3 completion:(id)a4;
- (void)saveTermsAcceptance:(id)a3 completion:(id)a4;
- (void)setDaemonConn:(id)a3;
@end

@implementation CDPTermsInfoBackupController

- (CDPTermsInfoBackupController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDPTermsInfoBackupController;
  v2 = [(CDPTermsInfoBackupController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CDPDaemonConnection);
    daemonConn = v2->_daemonConn;
    v2->_daemonConn = v3;
  }
  return v2;
}

- (void)saveTermsAcceptance:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_2182AE000, "cdp/saveTermsAcceptance", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__CDPTermsInfoBackupController_saveTermsAcceptance_completion___block_invoke;
  v19[3] = &unk_264317090;
  id v9 = v7;
  id v20 = v9;
  v10 = (void *)MEMORY[0x21D4671C0](v19);
  v11 = [(CDPTermsInfoBackupController *)self daemonConn];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __63__CDPTermsInfoBackupController_saveTermsAcceptance_completion___block_invoke_17;
  v17 = &unk_264317090;
  id v12 = v10;
  id v18 = v12;
  v13 = [v11 synchronousDaemonWithErrorHandler:&v14];

  objc_msgSend(v13, "saveTermsAcceptance:completion:", v6, v12, v14, v15, v16, v17);
  os_activity_scope_leave(&state);
}

void __63__CDPTermsInfoBackupController_saveTermsAcceptance_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "Saving of terms acceptance completed with error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__CDPTermsInfoBackupController_saveTermsAcceptance_completion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__CDPTermsInfoBackupController_saveTermsAcceptance_completion___block_invoke_17_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTermsAcceptanceForAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_2182AE000, "cdp/fetchTermsAcceptance", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__CDPTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke;
  v19[3] = &unk_264317130;
  id v9 = v7;
  id v20 = v9;
  v10 = (void *)MEMORY[0x21D4671C0](v19);
  v11 = [(CDPTermsInfoBackupController *)self daemonConn];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __74__CDPTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_19;
  v17 = &unk_264317090;
  id v12 = v10;
  id v18 = v12;
  v13 = [v11 synchronousDaemonWithErrorHandler:&v14];

  objc_msgSend(v13, "fetchTermsAcceptanceForAccount:completion:", v6, v12, v14, v15, v16, v17);
  os_activity_scope_leave(&state);
}

void __74__CDPTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "Fetched terms acceptance completed with error %@ and result %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__CDPTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CDPTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_19_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CDPDaemonConnection)daemonConn
{
  return self->_daemonConn;
}

- (void)setDaemonConn:(id)a3
{
}

- (void).cxx_destruct
{
}

void __63__CDPTermsInfoBackupController_saveTermsAcceptance_completion___block_invoke_17_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "XPC Error while attempting to save terms info: %@", (uint8_t *)&v2, 0xCu);
}

void __74__CDPTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_19_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "XPC Error while attempting to fetch terms info: %@", (uint8_t *)&v2, 0xCu);
}

@end