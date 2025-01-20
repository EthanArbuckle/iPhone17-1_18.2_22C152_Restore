@interface LNExtensionMediator
+ (id)sharedQueue;
+ (void)getConnectionHostInterfaceForBundleIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)getWidgetKitXPCListenerEndpointForBundleIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)getXPCListenerEndpointForBundleIdentifier:(id)a3 extensionMediatorBundleIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation LNExtensionMediator

void __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke(id *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = getLNLogCategoryExtensionMediator();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138543362;
    id v31 = v3;
  }

  id v4 = objc_alloc(MEMORY[0x1E4F223A0]);
  id v5 = a1[4];
  id v29 = 0;
  v6 = (void *)[v4 initWithBundleIdentifier:v5 error:&v29];
  id v7 = v29;
  if (v6)
  {
    v8 = [v6 entitlements];
    v9 = [v8 objectForKey:@"com.apple.private.appintents.extension-mediator.bundle-identifier" ofClass:objc_opt_class()];

    if (v9)
    {
      [a1[6] getXPCListenerEndpointForBundleIdentifier:a1[4] extensionMediatorBundleIdentifier:v9 completionHandler:a1[5]];
    }
    else
    {
      id v27 = v7;
      uint64_t v28 = 0;
      v10 = +[LNExtensionHostConfigurator extensionProcessWithExtensionRecord:v6 extensionType:&v28 error:&v27];
      id v11 = v27;

      if (v28 == 1)
      {
        [a1[6] getWidgetKitXPCListenerEndpointForBundleIdentifier:a1[4] completionHandler:a1[5]];
      }
      else if (v11)
      {
        (*((void (**)(void))a1[5] + 2))();
      }
      else
      {
        id v26 = 0;
        v12 = (void *)[v10 newXPCConnectionWithError:&v26];
        id v11 = v26;
        if (v11)
        {
          (*((void (**)(void))a1[5] + 2))();
        }
        else
        {
          id v13 = a1[4];
          v14 = LNConnectionHostXPCInterface();
          objc_msgSend(v12, "ln_configureWithBundleIdentifier:interface:", v13, v14);

          [v12 setInterruptionHandler:&__block_literal_global_8719];
          [v12 setInvalidationHandler:&__block_literal_global_19_8720];
          [v12 resume];
          v15 = getLNLogCategoryExtensionMediator();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            id v16 = a1[4];
            *(_DWORD *)buf = 138543362;
            id v31 = v16;
          }

          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_20;
          v24[3] = &unk_1E5B3A550;
          id v25 = a1[5];
          v17 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v24];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_22;
          v18[3] = &unk_1E5B39568;
          id v23 = a1[6];
          id v19 = a1[4];
          id v20 = v10;
          id v21 = v12;
          id v22 = a1[5];
          [v17 getListenerEndpointWithCompletionHandler:v18];
        }
      }

      id v7 = v11;
    }
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

void __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = getLNLogCategoryExtensionMediator();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1A4419000, v2, OS_LOG_TYPE_INFO, "Successfully fetched XPC listener endpoint for %{public}@", buf, 0xCu);
  }

  [*(id *)(a1 + 40) invalidate];
  [*(id *)(a1 + 48) invalidate];
  id v4 = getLNLogCategoryExtensionMediator();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "Invalidated extension process and XPC connection for %{public}@", buf, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 56);
  v8 = (void *)MEMORY[0x1E4F1C9B8];
  v9 = *(void **)(a1 + 40);
  if (v9) {
    [v9 auditToken];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  v10 = objc_msgSend(v8, "if_dataWithAuditToken:", v11);
  (*(void (**)(uint64_t, uint64_t, void *, void))(v6 + 16))(v6, v7, v10, *(void *)(a1 + 64));
}

void __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_22(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v8 = [a1[8] sharedQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5B39540;
  id v13 = a1[4];
  id v14 = a1[5];
  id v15 = a1[6];
  id v9 = a1[7];
  id v17 = v7;
  id v18 = v9;
  id v16 = v6;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, v12);
}

+ (void)getConnectionHostInterfaceForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 sharedQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5B39590;
  id v12 = v6;
  id v13 = v7;
  id v14 = a1;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken != -1) {
    dispatch_once(&sharedQueue_onceToken, &__block_literal_global_29_8688);
  }
  v2 = (void *)sharedQueue_queue;
  return v2;
}

void __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_17()
{
  v0 = getLNLogCategoryExtensionMediator();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4419000, v0, OS_LOG_TYPE_INFO, "Extension Mediator XPC connection has been invalidated", v1, 2u);
  }
}

void __34__LNExtensionMediator_sharedQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.appintents.extension-mediator.internal-queue", v2);
  v1 = (void *)sharedQueue_queue;
  sharedQueue_queue = (uint64_t)v0;
}

+ (void)getXPCListenerEndpointForBundleIdentifier:(id)a3 extensionMediatorBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 sharedQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = getLNLogCategoryExtensionMediator();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl(&dword_1A4419000, v12, OS_LOG_TYPE_INFO, "Fetching an XPC listener endpoint from an internal mediator (%@) for %@", buf, 0x16u);
  }

  id v13 = [LNConnection alloc];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F72630]) initWithType:1 bundleIdentifier:v9 url:0];
  id v21 = 0;
  id v15 = [(LNConnection *)v13 initWithEffectiveBundleIdentifier:v14 appBundleIdentifier:0 processInstanceIdentifier:0 appIntentsEnabledOnly:0 userIdentity:0 error:&v21];
  id v16 = v21;

  if (v15)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __117__LNExtensionMediator_getXPCListenerEndpointForBundleIdentifier_extensionMediatorBundleIdentifier_completionHandler___block_invoke;
    v18[3] = &unk_1E5B395B8;
    id v20 = v10;
    id v19 = v8;
    [(LNConnection *)v15 getListenerEndpointForBundleIdentifier:v19 action:0 completionHandler:v18];
  }
  else
  {
    id v17 = getLNLogCategoryExtensionMediator();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_impl(&dword_1A4419000, v17, OS_LOG_TYPE_ERROR, "Error fetching XPC listener endpoint from an internal mediator (%@) for %@: %@", buf, 0x20u);
    }

    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v16);
  }
}

void __117__LNExtensionMediator_getXPCListenerEndpointForBundleIdentifier_extensionMediatorBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = getLNLogCategoryExtensionMediator();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A4419000, v2, OS_LOG_TYPE_INFO, "Successfully fetched XPC listener endpoint for %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (void)getWidgetKitXPCListenerEndpointForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = getLNLogCategoryExtensionMediator();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1A4419000, v7, OS_LOG_TYPE_INFO, "Fetching an XPC listener endpoint from Chrono for %{public}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v8 = (void *)getCHSAppIntentsXPCListenerEndpointProviderClass_softClass;
  uint64_t v21 = getCHSAppIntentsXPCListenerEndpointProviderClass_softClass;
  if (!getCHSAppIntentsXPCListenerEndpointProviderClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v23 = __getCHSAppIntentsXPCListenerEndpointProviderClass_block_invoke;
    __int16 v24 = &unk_1E5B39E50;
    id v25 = &v18;
    __getCHSAppIntentsXPCListenerEndpointProviderClass_block_invoke((uint64_t)&buf);
    id v8 = (void *)v19[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v18, 8);
  id v10 = (void *)[[v9 alloc] initWithBundleIdentifier:v5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__LNExtensionMediator_getWidgetKitXPCListenerEndpointForBundleIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E5B39FC8;
  id v16 = v10;
  id v17 = v6;
  id v15 = v5;
  id v11 = v10;
  id v12 = v6;
  id v13 = v5;
  [v11 getAppIntentsXPCListenerEndpointWithCompletion:v14];
}

void __92__LNExtensionMediator_getWidgetKitXPCListenerEndpointForBundleIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v7 = getLNLogCategoryExtensionMediator();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1A4419000, v7, OS_LOG_TYPE_INFO, "Successfully fetched XPC listener endpoint for %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    id v9 = getLNLogCategoryExtensionMediator();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_ERROR, "Error fetching XPC listener endpoint for %{public}@: %@", (uint8_t *)&v11, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = getLNLogCategoryExtensionMediator();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_ERROR, "Unable to get synchronousRemoteObjectProxy, error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_15()
{
  dispatch_queue_t v0 = getLNLogCategoryExtensionMediator();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4419000, v0, OS_LOG_TYPE_INFO, "Extension Mediator XPC connection has been interrupted", v1, 2u);
  }
}

@end