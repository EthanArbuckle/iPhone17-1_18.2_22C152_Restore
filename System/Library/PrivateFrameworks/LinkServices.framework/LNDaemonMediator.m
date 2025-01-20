@interface LNDaemonMediator
+ (void)getConnectionHostInterfaceForBundleIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation LNDaemonMediator

+ (void)getConnectionHostInterfaceForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = getLNLogCategoryDaemonMediator();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v5;
  }

  id v8 = objc_alloc(MEMORY[0x1E4F29268]);
  v9 = [NSString stringWithFormat:@"com.apple.private.appintents.delegate.%@", v5];
  v10 = (void *)[v8 initWithMachServiceName:v9 options:0];

  v11 = LNConnectionHostXPCListenerEndpointVendingInterface();
  [v10 setRemoteObjectInterface:v11];

  [v10 setInterruptionHandler:&__block_literal_global_11958];
  [v10 setInvalidationHandler:&__block_literal_global_11];
  [v10 resume];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_12;
  v21[3] = &unk_1E5B3A550;
  id v12 = v6;
  id v22 = v12;
  v13 = [v10 remoteObjectProxyWithErrorHandler:v21];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_14;
  v17[3] = &unk_1E5B39FC8;
  id v19 = v5;
  id v20 = v12;
  id v18 = v10;
  id v14 = v5;
  id v15 = v12;
  id v16 = v10;
  [v13 getListenerEndpointWithCompletionHandler:v17];
}

void __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = getLNLogCategoryDaemonMediator();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_ERROR, "Unable to get remoteObjectProxyWithErrorHandler, error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_14(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E5B3A0B0;
  id v15 = *(id *)(a1 + 32);
  v10 = (void (**)(void))_Block_copy(aBlock);
  v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  if (v7)
  {
    v11();
    id v12 = getLNLogCategoryDaemonMediator();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v13;
      _os_log_impl(&dword_1A4419000, v12, OS_LOG_TYPE_INFO, "Successfully fetched XPC listener endpoint for %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v11();
  }
  v10[2](v10);
}

uint64_t __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_9()
{
  v0 = getLNLogCategoryDaemonMediator();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4419000, v0, OS_LOG_TYPE_INFO, "Daemon Mediator XPC connection has been invalidated", v1, 2u);
  }
}

void __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke()
{
  v0 = getLNLogCategoryDaemonMediator();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4419000, v0, OS_LOG_TYPE_INFO, "Daemon Mediator XPC connection has been interrupted", v1, 2u);
  }
}

@end