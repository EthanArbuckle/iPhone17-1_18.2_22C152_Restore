@interface FPDExtension
+ (id)allocForIdentifier:(id)a3;
+ (id)instanceWithExtension:(id)a3 queue:(id)a4 server:(id)a5;
+ (id)instanceWithExtension:(id)a3 queue:(id)a4 volumeManager:(id)a5;
+ (id)instanceWithExtensionRecord:(id)a3 queue:(id)a4 server:(id)a5;
+ (id)instanceWithExtensionRecord:(id)a3 queue:(id)a4 volumeManager:(id)a5;
- (BOOL)isAppExtensionReachable;
- (BOOL)isEqual:(id)a3;
- (FPDExtension)initWithExtension:(id)a3 extensionRecord:(id)a4 queue:(id)a5 server:(id)a6 volumeManager:(id)a7;
- (LSApplicationExtensionRecord)extensionRecord;
- (NSExtension)extension;
- (OS_dispatch_queue)sharedSessionQueue;
- (id)customPushTopics;
- (void)_test_callFileProviderManagerAPIs:(id)a3;
- (void)didReceiveMessage:(id)a3 completionHandler:(id)a4;
- (void)removeTrashedItemsOlderThanDate:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)setExtension:(id)a3;
@end

@implementation FPDExtension

- (BOOL)isAppExtensionReachable
{
  return 1;
}

- (LSApplicationExtensionRecord)extensionRecord
{
  extensionRecord = self->_extensionRecord;
  if (extensionRecord)
  {
    v3 = extensionRecord;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F223A0]);
    v6 = [(FPDProvider *)self descriptor];
    v7 = [v6 extensionBundleURL];
    v3 = (LSApplicationExtensionRecord *)[v5 initWithURL:v7 error:0];
  }
  return v3;
}

+ (id)allocForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.FileProvider.LocalStorage"])
  {
    id v5 = FPDLocalStorageExtension;
  }
  else if (objc_msgSend(v4, "fp_isiCloudDriveOrCloudDocsIdentifier"))
  {
    id v5 = FPDCloudDocsExtension;
  }
  else
  {
    id v5 = (__objc2_class *)a1;
  }
  id v6 = [v5 alloc];

  return v6;
}

+ (id)instanceWithExtension:(id)a3 queue:(id)a4 server:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 identifier];
  v12 = objc_msgSend((id)objc_msgSend(a1, "allocForIdentifier:", v11), "initWithExtension:extensionRecord:queue:server:volumeManager:", v10, 0, v9, v8, 0);

  return v12;
}

+ (id)instanceWithExtension:(id)a3 queue:(id)a4 volumeManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 identifier];
  v12 = objc_msgSend((id)objc_msgSend(a1, "allocForIdentifier:", v11), "initWithExtension:extensionRecord:queue:server:volumeManager:", v10, 0, v9, 0, v8);

  return v12;
}

+ (id)instanceWithExtensionRecord:(id)a3 queue:(id)a4 server:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 bundleIdentifier];
  v12 = objc_msgSend((id)objc_msgSend(a1, "allocForIdentifier:", v11), "initWithExtension:extensionRecord:queue:server:volumeManager:", 0, v10, v9, v8, 0);

  return v12;
}

+ (id)instanceWithExtensionRecord:(id)a3 queue:(id)a4 volumeManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 bundleIdentifier];
  v12 = objc_msgSend((id)objc_msgSend(a1, "allocForIdentifier:", v11), "initWithExtension:extensionRecord:queue:server:volumeManager:", 0, v10, v9, 0, v8);

  return v12;
}

- (FPDExtension)initWithExtension:(id)a3 extensionRecord:(id)a4 queue:(id)a5 server:(id)a6 volumeManager:(id)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = v17;
  if (v16 && v17)
  {
    v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FPDExtension initWithExtension:extensionRecord:queue:server:volumeManager:](v19);
    }
LABEL_30:
    v34 = 0;
    goto LABEL_31;
  }
  if (v13 && v14)
  {
    v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FPDExtension initWithExtension:extensionRecord:queue:server:volumeManager:](v19);
    }
    goto LABEL_30;
  }
  v20 = [FPDProviderDescriptor alloc];
  if (v13) {
    uint64_t v21 = [(FPDProviderDescriptor *)v20 initWithExtension:v13];
  }
  else {
    uint64_t v21 = [(FPDProviderDescriptor *)v20 initWithExtensionRecord:v14];
  }
  v19 = v21;
  if (!v21)
  {
    v35 = fp_current_or_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      if (v13) {
        id v36 = v13;
      }
      else {
        id v36 = v14;
      }
      *(_DWORD *)buf = 138412290;
      v45 = v36;
      _os_log_impl(&dword_1D744C000, v35, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to create descriptor for extension %@", buf, 0xCu);
    }

    goto LABEL_30;
  }
  v43.receiver = self;
  v43.super_class = (Class)FPDExtension;
  v22 = [(FPDProvider *)&v43 initWithDescriptor:v21 server:v16];
  self = v22;
  if (!v22) {
    goto LABEL_23;
  }
  id v39 = v15;
  id v40 = v14;
  v23 = [(FPDProvider *)v22 extensionStorageURLs];
  uint64_t v24 = [v23 count];

  if (v24)
  {
LABEL_19:
    objc_storeStrong((id *)&self->_sharedSessionQueue, a5);
    objc_storeStrong((id *)&self->_extension, a3);
    objc_storeStrong((id *)&self->_extensionRecord, a4);
    uint64_t v29 = [v16 volumeManager];
    v30 = (void *)v29;
    if (v29) {
      v31 = (void *)v29;
    }
    else {
      v31 = v18;
    }
    id v32 = v31;

    v33 = [v19 personaIdentifier];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __77__FPDExtension_initWithExtension_extensionRecord_queue_server_volumeManager___block_invoke;
    v41[3] = &unk_1E6A73508;
    v42 = self;
    [v32 enumerateLibrariesForPersona:v33 withBlock:v41];

    id v15 = v39;
    id v14 = v40;
LABEL_23:
    self = self;
    v34 = self;
    goto LABEL_31;
  }
  BOOL v25 = [(FPDProvider *)self supportsFPFS];
  v26 = fp_current_or_default_log();
  v27 = v26;
  if (v25)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v28 = [v13 identifier];
      *(_DWORD *)buf = 138412546;
      v45 = v28;
      __int16 v46 = 2112;
      v47 = @"NSExtensionFileProviderDocumentGroup";
      _os_log_impl(&dword_1D744C000, v27, OS_LOG_TYPE_INFO, "[INFO] \"%@\" key not found in Info.plist of %@. The documentStorageURL property on NSFileProviderManager will not be available.", buf, 0x16u);
    }
    goto LABEL_19;
  }
  v38 = v26;
  id v15 = v39;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[FPDExtension initWithExtension:extensionRecord:queue:server:volumeManager:](v13);
  }

  v34 = 0;
  id v14 = v40;
LABEL_31:

  return v34;
}

uint64_t __77__FPDExtension_initWithExtension_extensionRecord_queue_server_volumeManager___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = (id)[*(id *)(a1 + 32) importDomainsFromLibrary:a2 updatePlist:1];
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FPDExtension *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = [(FPDProvider *)self descriptor];
      id v8 = [(FPDProvider *)v4 descriptor];
      char v6 = [v7 isEqual:v8];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)removeTrashedItemsOlderThanDate:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[FPDExtension removeTrashedItemsOlderThanDate:request:completionHandler:](v11);
  }

  dispatch_group_t v12 = dispatch_group_create();
  id v13 = [(FPDProvider *)self relevantDomainsByID];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __74__FPDExtension_removeTrashedItemsOlderThanDate_request_completionHandler___block_invoke;
  uint64_t v21 = &unk_1E6A73558;
  dispatch_group_t v22 = v12;
  id v23 = v9;
  id v24 = v8;
  BOOL v25 = self;
  id v14 = v8;
  id v15 = v9;
  id v16 = v12;
  [v13 enumerateKeysAndObjectsUsingBlock:&v18];

  id v17 = [(FPDProvider *)self queue];
  dispatch_group_notify(v16, v17, v10);
}

void __74__FPDExtension_removeTrashedItemsOlderThanDate_request_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(NSObject **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  dispatch_group_enter(v5);
  id v8 = [v6 session];

  id v9 = objc_msgSend(v8, "newFileProviderProxyWithTimeout:pid:", objc_msgSend(*(id *)(a1 + 40), "pid"), 180.0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__FPDExtension_removeTrashedItemsOlderThanDate_request_completionHandler___block_invoke_2;
  v12[3] = &unk_1E6A73530;
  int8x16_t v11 = *(int8x16_t *)(a1 + 48);
  id v10 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  id v14 = *(id *)(a1 + 32);
  [v9 removeTrashedItemsOlderThanDate:v10 domainIdentifier:v7 completionHandler:v12];
}

void __74__FPDExtension_removeTrashedItemsOlderThanDate_request_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __74__FPDExtension_removeTrashedItemsOlderThanDate_request_completionHandler___block_invoke_2_cold_1(a1);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)didReceiveMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [v6 userInfo];
  id v9 = [v8 objectForKey:@"container-identifier"];

  id v10 = [v6 userInfo];
  uint64_t v11 = [v10 objectForKey:@"domain"];
  dispatch_group_t v12 = (void *)v11;
  int8x16_t v13 = (void *)*MEMORY[0x1E4F25C00];
  if (v11) {
    int8x16_t v13 = (void *)v11;
  }
  id v14 = v13;

  if (!v14)
  {
    uint64_t v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FPDExtension didReceiveMessage:completionHandler:](v6);
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FPDExtension didReceiveMessage:completionHandler:](v6);
    }
LABEL_11:

    v7[2](v7);
    goto LABEL_16;
  }
  id v15 = [(FPDProvider *)self domainForIdentifier:v14 reason:0];
  id v16 = v15;
  if (v15)
  {
    id v17 = [v15 defaultBackend];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke;
    v20[3] = &unk_1E6A735A8;
    id v21 = v9;
    v26 = v7;
    id v22 = v6;
    id v23 = self;
    id v24 = v14;
    id v25 = v16;
    [v17 wakeForPushWithCompletionHandler:v20];
  }
  else
  {
    uint64_t v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FPDExtension didReceiveMessage:completionHandler:]();
    }

    v7[2](v7);
  }

LABEL_16:
}

void __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_cold_3(v3);
    }
  }
  if (!*(void *)(a1 + 32)) {
    goto LABEL_13;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = fp_current_or_default_log();
  id v7 = v6;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_cold_2(a1);
    }

LABEL_13:
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_14;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), a1, v7);
  }

  id v8 = objc_alloc(MEMORY[0x1E4F25D30]);
  id v9 = [*(id *)(a1 + 48) identifier];
  id v10 = (void *)[v8 initWithProviderID:v9 domainIdentifier:*(void *)(a1 + 56) itemIdentifier:*(void *)(a1 + 32)];

  uint64_t v11 = *(void **)(a1 + 64);
  dispatch_group_t v12 = +[FPDRequest requestForSelf];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_23;
  v13[3] = &unk_1E6A73580;
  id v14 = v3;
  [v11 didChangeItemID:v10 request:v12 completionHandler:v13];

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_14:
}

void __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_23_cold_1(v3);
    }
  }
}

- (id)customPushTopics
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(FPDProvider *)v2 domainsByID];
  id v4 = [v3 allValues];
  uint64_t v5 = (void *)[v4 mutableCopy];

  objc_sync_exit(v2);
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v10 session];
        dispatch_group_t v12 = (void *)[v11 newFileProviderProxyWithTimeout:0 pid:180.0];
        int8x16_t v13 = [v12 synchronousRemoteObjectProxy];

        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __32__FPDExtension_customPushTopics__block_invoke;
        v17[3] = &unk_1E6A735D0;
        v17[4] = v10;
        id v18 = v6;
        [v13 fetchCustomPushTopicsWithCompletionHandler:v17];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  id v14 = [v6 allObjects];

  return v14;
}

void __32__FPDExtension_customPushTopics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __32__FPDExtension_customPushTopics__block_invoke_cold_2(a1, v6);
    }
  }
  else
  {
    if (v5)
    {
      [*(id *)(a1 + 40) addObjectsFromArray:v5];
      goto LABEL_7;
    }
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __32__FPDExtension_customPushTopics__block_invoke_cold_1(a1, v7);
    }
  }

LABEL_7:
}

- (void)_test_callFileProviderManagerAPIs:(id)a3
{
  id v4 = a3;
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPDExtension _test_callFileProviderManagerAPIs:](v5);
  }

  id v6 = [(FPDProvider *)self domainForIdentifier:*MEMORY[0x1E4F25C00] reason:0];
  uint64_t v7 = [v6 session];

  uint64_t v8 = (void *)[v7 newFileProviderProxyWithTimeout:0 pid:180.0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__FPDExtension__test_callFileProviderManagerAPIs___block_invoke;
  v10[3] = &unk_1E6A735F8;
  id v11 = v4;
  id v9 = v4;
  objc_msgSend(v8, "_test_callFileProviderManagerAPIs:", v10);
}

void __50__FPDExtension__test_callFileProviderManagerAPIs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__FPDExtension__test_callFileProviderManagerAPIs___block_invoke_cold_1(v3);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (OS_dispatch_queue)sharedSessionQueue
{
  return self->_sharedSessionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedSessionQueue, 0);
  objc_storeStrong((id *)&self->_extensionRecord, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)initWithExtension:(os_log_t)log extensionRecord:queue:server:volumeManager:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] Inconsistent call with both a server and a volumeManager. Pick one", v1, 2u);
}

- (void)initWithExtension:(os_log_t)log extensionRecord:queue:server:volumeManager:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] Inconsistent call with both a extension and a extensionRecord. Pick one", v1, 2u);
}

- (void)initWithExtension:(void *)a1 extensionRecord:queue:server:volumeManager:.cold.3(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v2, v3, "[ERROR] \"%@\" key not found in Info.plist. Skipping provider %@.", v4, v5, v6, v7, 2u);
}

- (void)removeTrashedItemsOlderThanDate:(os_log_t)log request:completionHandler:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[FPDExtension removeTrashedItemsOlderThanDate:request:completionHandler:]";
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] %s", (uint8_t *)&v1, 0xCu);
}

void __74__FPDExtension_removeTrashedItemsOlderThanDate_request_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v2, v3, "[ERROR] can't ask extension %@ to remove trashed items older than %@", v4, v5, v6, v7, v8);
}

- (void)didReceiveMessage:(void *)a1 completionHandler:.cold.1(void *a1)
{
  int v1 = [a1 userInfo];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] received malformed file provider push (null container-identifier key), payload was %@", v4, v5, v6, v7, v8);
}

- (void)didReceiveMessage:completionHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] received file provider push for unknown domain %@", v1, 0xCu);
}

- (void)didReceiveMessage:(void *)a1 completionHandler:.cold.3(void *a1)
{
  int v1 = [a1 userInfo];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] received malformed file provider push (bad container-identifier key), payload was %@", v4, v5, v6, v7, v8);
}

void __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = [*(id *)(a2 + 48) identifier];
  int v6 = 138412546;
  uint64_t v7 = v4;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1D744C000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Received push on container %@ for provider %@", (uint8_t *)&v6, 0x16u);
}

void __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 40) userInfo];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] received malformed file provider push (bad container-identifier key), payload was %@", v4, v5, v6, v7, v8);
}

void __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_cold_3(void *a1)
{
  int v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] Error while waking up provider to handle push; %@",
    v4,
    v5,
    v6,
    v7,
    v8);
}

void __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_23_cold_1(void *a1)
{
  int v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] Error registering item change; %@", v4, v5, v6, v7, v8);
}

void __32__FPDExtension_customPushTopics__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] No custom topics received for %@", v4, 0xCu);
}

void __32__FPDExtension_customPushTopics__block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
  uint64_t v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v5, v6, "[ERROR] Could not fetch custom push topics for %@; %@",
    v7,
    v8,
    v9,
    v10,
    2u);
}

- (void)_test_callFileProviderManagerAPIs:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[FPDExtension _test_callFileProviderManagerAPIs:]";
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] %s", (uint8_t *)&v1, 0xCu);
}

void __50__FPDExtension__test_callFileProviderManagerAPIs___block_invoke_cold_1(void *a1)
{
  int v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] _test_callFileProviderManagerAPIs failed: %@", v4, v5, v6, v7, v8);
}

@end