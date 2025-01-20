@interface CacheDeleteRemoteExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (CacheDeleteRemoteExtensionContext)init;
- (void)serviceCallback:(id)a3 replyBlock:(id)a4;
- (void)serviceCancelPurge:(id)a3;
- (void)serviceNotify:(id)a3 replyBlock:(id)a4;
- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)servicePing:(id)a3;
- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5;
@end

@implementation CacheDeleteRemoteExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_9 != -1) {
    dispatch_once(&_MergedGlobals_9, &__block_literal_global_11);
  }
  v2 = (void *)qword_1EB30C510;
  return v2;
}

uint64_t __68__CacheDeleteRemoteExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  qword_1EB30C510 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFB32370];
  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1EB30C518 != -1) {
    dispatch_once(&qword_1EB30C518, &__block_literal_global_42_0);
  }
  v2 = (void *)qword_1EB30C520;
  return v2;
}

uint64_t __70__CacheDeleteRemoteExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  qword_1EB30C520 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFB32F28];
  return MEMORY[0x1F41817F8]();
}

- (CacheDeleteRemoteExtensionContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)CacheDeleteRemoteExtensionContext;
  v2 = [(CacheDeleteRemoteExtensionContext *)&v6 init];
  if (v2)
  {
    v3 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A63D1000, v3, OS_LOG_TYPE_DEFAULT, "ENTRY", v5, 2u);
    }
  }
  return v2;
}

- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = v6;
    _os_log_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_DEFAULT, "purgeable, urgency: %d", buf, 8u);
  }

  v10 = +[CacheDeleteServiceListener cacheDeleteServiceListener:0 options:0];
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__CacheDeleteRemoteExtensionContext_servicePurgeable_info_replyBlock___block_invoke;
    v12[3] = &unk_1E5C51D88;
    id v14 = v8;
    id v13 = v10;
    [v13 servicePurgeable:v6 info:v7 replyBlock:v12];
  }
  else
  {
    v11 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A63D1000, v11, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    (*((void (**)(id, void *))v8 + 2))(v8, &unk_1EFB2F1C0);
  }
}

void __70__CacheDeleteRemoteExtensionContext_servicePurgeable_info_replyBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_DEFAULT, "result: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v5 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1A63D1000, v5, OS_LOG_TYPE_DEFAULT, "calling completeRequestReturningItems", (uint8_t *)&v8, 2u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) serviceInfo];
  id v7 = [v6 extensionContext];
  [v7 completeRequestReturningItems:0 completionHandler:&__block_literal_global_64];
}

void __70__CacheDeleteRemoteExtensionContext_servicePurgeable_info_replyBlock___block_invoke_61(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2) {
      v4 = "YES";
    }
    int v5 = 136315138;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1A63D1000, v3, OS_LOG_TYPE_DEFAULT, "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s", (uint8_t *)&v5, 0xCu);
  }
}

- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = v6;
    _os_log_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_DEFAULT, "purge, urgency: %d", buf, 8u);
  }

  uint64_t v10 = +[CacheDeleteServiceListener cacheDeleteServiceListener:0 options:0];
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__CacheDeleteRemoteExtensionContext_servicePurge_info_replyBlock___block_invoke;
    v12[3] = &unk_1E5C51D88;
    id v14 = v8;
    id v13 = v10;
    [v13 servicePurge:v6 info:v7 replyBlock:v12];
  }
  else
  {
    v11 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A63D1000, v11, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    (*((void (**)(id, void *))v8 + 2))(v8, &unk_1EFB2F1E8);
  }
}

void __66__CacheDeleteRemoteExtensionContext_servicePurge_info_replyBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_DEFAULT, "result: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v5 = [*(id *)(a1 + 32) serviceInfo];
  uint64_t v6 = [v5 extensionContext];
  [v6 completeRequestReturningItems:0 completionHandler:&__block_literal_global_75];
}

void __66__CacheDeleteRemoteExtensionContext_servicePurge_info_replyBlock___block_invoke_73(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2) {
      v4 = "YES";
    }
    int v5 = 136315138;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1A63D1000, v3, OS_LOG_TYPE_DEFAULT, "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s", (uint8_t *)&v5, 0xCu);
  }
}

- (void)serviceCancelPurge:(id)a3
{
  id v3 = (void (**)(void))a3;
  v4 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_DEFAULT, "cancelPurge", buf, 2u);
  }

  int v5 = +[CacheDeleteServiceListener cacheDeleteServiceListener:0 options:0];
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__CacheDeleteRemoteExtensionContext_serviceCancelPurge___block_invoke;
    v7[3] = &unk_1E5C51DB0;
    uint64_t v9 = v3;
    id v8 = v5;
    [v8 serviceCancelPurge:v7];
  }
  else
  {
    uint64_t v6 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A63D1000, v6, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    v3[2](v3);
  }
}

void __56__CacheDeleteRemoteExtensionContext_serviceCancelPurge___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = [*(id *)(a1 + 32) serviceInfo];
  v2 = [v3 extensionContext];
  [v2 completeRequestReturningItems:0 completionHandler:&__block_literal_global_81];
}

void __56__CacheDeleteRemoteExtensionContext_serviceCancelPurge___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2) {
      v4 = "YES";
    }
    int v5 = 136315138;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1A63D1000, v3, OS_LOG_TYPE_DEFAULT, "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s", (uint8_t *)&v5, 0xCu);
  }
}

- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = v6;
    _os_log_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_DEFAULT, "periodic, urgency: %d", buf, 8u);
  }

  uint64_t v10 = +[CacheDeleteServiceListener cacheDeleteServiceListener:0 options:0];
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__CacheDeleteRemoteExtensionContext_servicePeriodic_info_replyBlock___block_invoke;
    v12[3] = &unk_1E5C51D88;
    id v14 = v8;
    id v13 = v10;
    [v13 servicePeriodic:v6 info:v7 replyBlock:v12];
  }
  else
  {
    v11 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A63D1000, v11, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    (*((void (**)(id, void *))v8 + 2))(v8, &unk_1EFB2F210);
  }
}

void __69__CacheDeleteRemoteExtensionContext_servicePeriodic_info_replyBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_DEFAULT, "result: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v5 = [*(id *)(a1 + 32) serviceInfo];
  uint64_t v6 = [v5 extensionContext];
  [v6 completeRequestReturningItems:0 completionHandler:&__block_literal_global_84];
}

void __69__CacheDeleteRemoteExtensionContext_servicePeriodic_info_replyBlock___block_invoke_82(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2) {
      v4 = "YES";
    }
    int v5 = 136315138;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1A63D1000, v3, OS_LOG_TYPE_DEFAULT, "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s", (uint8_t *)&v5, 0xCu);
  }
}

- (void)serviceCallback:(id)a3 replyBlock:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v7 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1A63D1000, v7, OS_LOG_TYPE_DEFAULT, "callback, urgency: %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = (void *)[v5 mutableCopy];
  [v8 setObject:@"Unsupported callback" forKeyedSubscript:@"CACHE_DELETE_ERROR"];
  v6[2](v6, v8);
}

- (void)serviceNotify:(id)a3 replyBlock:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(void))a4;
  uint64_t v7 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_1A63D1000, v7, OS_LOG_TYPE_DEFAULT, "notify: %@", buf, 0xCu);
  }

  id v8 = +[CacheDeleteServiceListener cacheDeleteServiceListener:0 options:0];
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__CacheDeleteRemoteExtensionContext_serviceNotify_replyBlock___block_invoke;
    v10[3] = &unk_1E5C51DB0;
    v12 = v6;
    id v11 = v8;
    [v11 serviceNotify:v5 replyBlock:v10];
  }
  else
  {
    int v9 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    v6[2](v6);
  }
}

void __62__CacheDeleteRemoteExtensionContext_serviceNotify_replyBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = [*(id *)(a1 + 32) serviceInfo];
  v2 = [v3 extensionContext];
  [v2 completeRequestReturningItems:0 completionHandler:&__block_literal_global_93];
}

void __62__CacheDeleteRemoteExtensionContext_serviceNotify_replyBlock___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2) {
      v4 = "YES";
    }
    int v5 = 136315138;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1A63D1000, v3, OS_LOG_TYPE_DEFAULT, "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s", (uint8_t *)&v5, 0xCu);
  }
}

- (void)servicePing:(id)a3
{
  id v3 = (void (**)(void))a3;
  v4 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_DEFAULT, "PING", v5, 2u);
  }

  v3[2](v3);
}

@end