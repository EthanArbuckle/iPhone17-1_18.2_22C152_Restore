@interface ASDRestoreService
+ (ASDRestoreService)sharedInstance;
+ (id)interface;
- (ASDRestoreService)init;
- (void)clearFollowupsForAccountID:(id)a3 withCompletionHandler:(id)a4;
- (void)estimateTotalDownloadSizeWithCompletionHandler:(id)a3;
- (void)prioritizeBundleIDs:(id)a3 userInitiated:(BOOL)a4 withCompletionHandler:(id)a5;
@end

@implementation ASDRestoreService

+ (id)interface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C878];
}

+ (ASDRestoreService)sharedInstance
{
  if (_MergedGlobals_56 != -1) {
    dispatch_once(&_MergedGlobals_56, &__block_literal_global_31);
  }
  v2 = (void *)qword_1EB4D6648;
  return (ASDRestoreService *)v2;
}

uint64_t __35__ASDRestoreService_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ASDRestoreService);
  uint64_t v1 = qword_1EB4D6648;
  qword_1EB4D6648 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (ASDRestoreService)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASDRestoreService;
  v2 = [(ASDRestoreService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ASDServiceBroker defaultBroker];
    serviceBroker = v2->_serviceBroker;
    v2->_serviceBroker = (ASDServiceBroker *)v3;
  }
  return v2;
}

- (void)clearFollowupsForAccountID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__ASDRestoreService_clearFollowupsForAccountID_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E58B5118;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(ASDServiceBroker *)serviceBroker getRestoreServiceWithCompletionHandler:v11];
}

void __70__ASDRestoreService_clearFollowupsForAccountID_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__ASDRestoreService_clearFollowupsForAccountID_withCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E58B2CB8;
    id v12 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__ASDRestoreService_clearFollowupsForAccountID_withCompletionHandler___block_invoke_4;
    v9[3] = &unk_1E58B2CE0;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v6 clearFollowupsForAccountID:v7 replyHandler:v9];
  }
  else
  {
    v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[RestoreService] Prioritize failed, service unavailable: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __70__ASDRestoreService_clearFollowupsForAccountID_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[RestoreService] Clear followups failed, request failed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__ASDRestoreService_clearFollowupsForAccountID_withCompletionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = ASDLogHandleForCategory(13);
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[RestoreService] Clear followups, error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 67109120;
    LODWORD(v9) = a2;
    _os_log_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_INFO, "[RestoreService] Clear followups returned: %d", (uint8_t *)&v8, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)estimateTotalDownloadSizeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__ASDRestoreService_estimateTotalDownloadSizeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B5168;
  id v8 = v4;
  id v6 = v4;
  [(ASDServiceBroker *)serviceBroker getRestoreServiceWithCompletionHandler:v7];
}

void __68__ASDRestoreService_estimateTotalDownloadSizeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__ASDRestoreService_estimateTotalDownloadSizeWithCompletionHandler___block_invoke_7;
    v10[3] = &unk_1E58B2CB8;
    id v11 = *(id *)(a1 + 32);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__ASDRestoreService_estimateTotalDownloadSizeWithCompletionHandler___block_invoke_8;
    v8[3] = &unk_1E58B5140;
    id v9 = *(id *)(a1 + 32);
    [v6 estimateTotalDownloadSizeWithReplyHandler:v8];
  }
  else
  {
    uint64_t v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[RestoreService] Download size estimate failed, service unavailable: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __68__ASDRestoreService_estimateTotalDownloadSizeWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[RestoreService] Download size estimate failed, request failed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__ASDRestoreService_estimateTotalDownloadSizeWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = ASDLogHandleForCategory(13);
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[RestoreService] Download size estimate failed, error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = a2;
    _os_log_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_INFO, "[RestoreService] Download size estimate returned: %{iec-bytes}lu", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prioritizeBundleIDs:(id)a3 userInitiated:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__ASDRestoreService_prioritizeBundleIDs_userInitiated_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E58B5190;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  [(ASDServiceBroker *)serviceBroker getRestoreServiceWithCompletionHandler:v13];
}

void __77__ASDRestoreService_prioritizeBundleIDs_userInitiated_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__ASDRestoreService_prioritizeBundleIDs_userInitiated_withCompletionHandler___block_invoke_10;
    v12[3] = &unk_1E58B2CB8;
    id v13 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v12];
    uint64_t v7 = *(unsigned __int8 *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__ASDRestoreService_prioritizeBundleIDs_userInitiated_withCompletionHandler___block_invoke_11;
    v10[3] = &unk_1E58B2CE0;
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v6 prioritizeBundleIDs:v8 userInitiated:v7 replyHandler:v10];
  }
  else
  {
    id v9 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v5;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "[RestoreService] Prioritize failed, service unavailable: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __77__ASDRestoreService_prioritizeBundleIDs_userInitiated_withCompletionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[RestoreService] Prioritize failed, request failed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__ASDRestoreService_prioritizeBundleIDs_userInitiated_withCompletionHandler___block_invoke_11(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = ASDLogHandleForCategory(13);
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[RestoreService] Prioritize, error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 67109120;
    LODWORD(v9) = a2;
    _os_log_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_INFO, "[RestoreService] Prioritize returned: %d", (uint8_t *)&v8, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end