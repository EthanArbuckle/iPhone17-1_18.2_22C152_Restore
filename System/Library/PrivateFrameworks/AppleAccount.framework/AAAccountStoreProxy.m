@interface AAAccountStoreProxy
+ (BOOL)_isAccountDaemonConnectionError:(id)a3;
- (void)saveAccount:(id)a3 onAccountStore:(id)a4 withCompletionHandler:(id)a5;
- (void)saveAccount:(id)a3 onAccountStore:(id)a4 withDataclassActions:(id)a5 doVerify:(BOOL)a6 completion:(id)a7;
@end

@implementation AAAccountStoreProxy

+ (BOOL)_isAccountDaemonConnectionError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == 10002)
  {
    v4 = [v3 domain];
    char v5 = [v4 isEqualToString:*MEMORY[0x1E4F178F0]];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)saveAccount:(id)a3 onAccountStore:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = _AAAccountStoreLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AAAccountStoreProxy saveAccount:onAccountStore:withCompletionHandler:](v10, v11, v12, v13, v14, v15, v16, v17);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__AAAccountStoreProxy_saveAccount_onAccountStore_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E5A48510;
  id v22 = v8;
  id v23 = v7;
  id v24 = v9;
  id v18 = v9;
  id v19 = v7;
  id v20 = v8;
  [v20 saveAccount:v19 withCompletionHandler:v21];
}

void __72__AAAccountStoreProxy_saveAccount_onAccountStore_withCompletionHandler___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  char v5 = _AAAccountStoreLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __72__AAAccountStoreProxy_saveAccount_onAccountStore_withCompletionHandler___block_invoke_cold_2();
  }

  if (+[AAAccountStoreProxy _isAccountDaemonConnectionError:v4])
  {
    v6 = _AAAccountStoreLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __72__AAAccountStoreProxy_saveAccount_onAccountStore_withCompletionHandler___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    dispatch_time_t v14 = dispatch_time(0, 333000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__AAAccountStoreProxy_saveAccount_onAccountStore_withCompletionHandler___block_invoke_22;
    block[3] = &unk_1E5A484C0;
    id v17 = a1[4];
    id v18 = a1[5];
    id v19 = a1[6];
    dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_after(v14, MEMORY[0x1E4F14428], v15);
  }
  else
  {
LABEL_8:
    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t __72__AAAccountStoreProxy_saveAccount_onAccountStore_withCompletionHandler___block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveAccount:*(void *)(a1 + 40) withCompletionHandler:*(void *)(a1 + 48)];
}

- (void)saveAccount:(id)a3 onAccountStore:(id)a4 withDataclassActions:(id)a5 doVerify:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  dispatch_block_t v15 = _AAAccountStoreLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[AAAccountStoreProxy saveAccount:onAccountStore:withDataclassActions:doVerify:completion:](v15, v16, v17, v18, v19, v20, v21, v22);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __91__AAAccountStoreProxy_saveAccount_onAccountStore_withDataclassActions_doVerify_completion___block_invoke;
  v27[3] = &unk_1E5A48560;
  id v28 = v12;
  id v29 = v11;
  BOOL v32 = v8;
  id v30 = v13;
  id v31 = v14;
  id v23 = v14;
  id v24 = v13;
  id v25 = v11;
  id v26 = v12;
  [v26 saveAccount:v25 withDataclassActions:v24 doVerify:v8 completion:v27];
}

void __91__AAAccountStoreProxy_saveAccount_onAccountStore_withDataclassActions_doVerify_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  char v5 = _AAAccountStoreLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __91__AAAccountStoreProxy_saveAccount_onAccountStore_withDataclassActions_doVerify_completion___block_invoke_cold_2();
  }

  if (+[AAAccountStoreProxy _isAccountDaemonConnectionError:v4])
  {
    v6 = _AAAccountStoreLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __91__AAAccountStoreProxy_saveAccount_onAccountStore_withDataclassActions_doVerify_completion___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    dispatch_time_t v14 = dispatch_time(0, 333000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__AAAccountStoreProxy_saveAccount_onAccountStore_withDataclassActions_doVerify_completion___block_invoke_25;
    block[3] = &unk_1E5A48538;
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    char v21 = *(unsigned char *)(a1 + 64);
    id v20 = *(id *)(a1 + 56);
    dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_after(v14, MEMORY[0x1E4F14428], v15);
  }
  else
  {
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __91__AAAccountStoreProxy_saveAccount_onAccountStore_withDataclassActions_doVerify_completion___block_invoke_25(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveAccount:*(void *)(a1 + 40) withDataclassActions:*(void *)(a1 + 48) doVerify:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)saveAccount:(uint64_t)a3 onAccountStore:(uint64_t)a4 withCompletionHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__AAAccountStoreProxy_saveAccount_onAccountStore_withCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__AAAccountStoreProxy_saveAccount_onAccountStore_withCompletionHandler___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A11D8000, v0, OS_LOG_TYPE_DEBUG, "Error while performing %s: %@", (uint8_t *)v1, 0x16u);
}

- (void)saveAccount:(uint64_t)a3 onAccountStore:(uint64_t)a4 withDataclassActions:(uint64_t)a5 doVerify:(uint64_t)a6 completion:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __91__AAAccountStoreProxy_saveAccount_onAccountStore_withDataclassActions_doVerify_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __91__AAAccountStoreProxy_saveAccount_onAccountStore_withDataclassActions_doVerify_completion___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A11D8000, v0, OS_LOG_TYPE_DEBUG, "Error while performing %s: %@", (uint8_t *)v1, 0x16u);
}

@end