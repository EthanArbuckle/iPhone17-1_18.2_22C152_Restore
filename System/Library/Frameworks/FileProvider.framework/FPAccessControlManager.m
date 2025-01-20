@interface FPAccessControlManager
- (BOOL)revokeAccessToAllBundles;
- (void)_killBundle:(id)a3 completionHandler:(id)a4;
- (void)bundleIdentifiersWithAccessToAnyItemCompletionHandler:(id)a3;
- (void)collectionForItemsAccessibleByBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)revokeAccessToAllBundlesCompletionHandler:(id)a3;
- (void)revokeAccessToAllItemsForBundle:(id)a3 completionHandler:(id)a4;
@end

@implementation FPAccessControlManager

- (void)collectionForItemsAccessibleByBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  FPNotSupportedError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void)bundleIdentifiersWithAccessToAnyItemCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = +[FPDaemonConnection sharedConnectionProxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__FPAccessControlManager_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke;
  v6[3] = &unk_1E5AF4700;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchAccessServicer:v6];
}

void __80__FPAccessControlManager_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__FPAccessControlManager_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E5AF0790;
    id v8 = *(id *)(a1 + 32);
    id v5 = [a2 remoteObjectProxyWithErrorHandler:v7];
    [v5 bundleIdentifiersWithAccessToAnyItemCompletionHandler:*(void *)(a1 + 32)];
  }
}

uint64_t __80__FPAccessControlManager_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_killBundle:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v9 = (void *)getFBSSystemServiceClass_softClass;
  uint64_t v23 = getFBSSystemServiceClass_softClass;
  if (!getFBSSystemServiceClass_softClass)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __getFBSSystemServiceClass_block_invoke;
    v19[3] = &unk_1E5AF1950;
    v19[4] = &v20;
    __getFBSSystemServiceClass_block_invoke((uint64_t)v19);
    v9 = (void *)v21[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v20, 8);
  v11 = [v10 sharedService];
  if (!v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"FPAccessControlManager.m" lineNumber:48 description:@"-[FBSSystemService sharedService] returned nil"];
  }
  v12 = [NSString stringWithFormat:@"Terminating %@ to revoke access to files.", v7];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__FPAccessControlManager__killBundle_completionHandler___block_invoke;
  v16[3] = &unk_1E5AF09B8;
  id v17 = v7;
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  [v11 terminateApplication:v14 forReason:3 andReport:0 withDescription:v12 completion:v16];
}

void __56__FPAccessControlManager__killBundle_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __56__FPAccessControlManager__killBundle_completionHandler___block_invoke_cold_1((uint64_t)v4, a1, v5);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

- (void)revokeAccessToAllItemsForBundle:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[FPDaemonConnection sharedConnectionProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__FPAccessControlManager_revokeAccessToAllItemsForBundle_completionHandler___block_invoke;
  v11[3] = &unk_1E5AF4750;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 fetchAccessServicer:v11];
}

void __76__FPAccessControlManager_revokeAccessToAllItemsForBundle_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v8();
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__FPAccessControlManager_revokeAccessToAllItemsForBundle_completionHandler___block_invoke_2;
    v13[3] = &unk_1E5AF0790;
    id v14 = *(id *)(a1 + 48);
    id v5 = [a2 remoteObjectProxyWithErrorHandler:v13];
    uint64_t v6 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__FPAccessControlManager_revokeAccessToAllItemsForBundle_completionHandler___block_invoke_3;
    v10[3] = &unk_1E5AF4728;
    id v12 = *(id *)(a1 + 48);
    int8x16_t v9 = *(int8x16_t *)(a1 + 32);
    id v7 = (id)v9.i64[0];
    int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
    [v5 revokeAccessToAllItemsForBundle:v6 completionHandler:v10];
  }
}

uint64_t __76__FPAccessControlManager_revokeAccessToAllItemsForBundle_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__FPAccessControlManager_revokeAccessToAllItemsForBundle_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _killBundle:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
}

- (BOOL)revokeAccessToAllBundles
{
  return 0;
}

- (void)revokeAccessToAllBundlesCompletionHandler:(id)a3
{
  id v4 = a3;
  FPNotSupportedError();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

void __56__FPAccessControlManager__killBundle_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] Encountered an error [%{public}@] while terminating application with bundle ID [%{public}@] using FrontBoardServices", (uint8_t *)&v4, 0x16u);
}

@end