@interface ASCWorkspace
+ (ASCWorkspace)sharedWorkspace;
+ (OS_os_log)log;
+ (void)withSharedWorkspace:(id)a3 perform:(id)a4;
- (BOOL)isExtension;
- (NSMutableDictionary)pendingResults;
- (NSOperationQueue)openApplicationOperationQueue;
- (NSRecursiveLock)stateLock;
- (id)_init;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5;
- (id)openProductURL:(id)a3;
- (id)openSensitiveURL:(id)a3;
- (id)openSensitiveURL:(id)a3 frontBoardOptions:(id)a4;
- (id)openURL:(id)a3;
- (id)openURL:(id)a3 frontBoardOptions:(id)a4;
- (id)popPendingResultForOperationName:(id)a3;
- (void)enqueueOpenApplicationOperation:(id)a3 pendingResult:(id)a4;
- (void)openApplicationWithBundleIdentifier:(id)a3 configuration:(id)a4 pendingResult:(id)a5;
- (void)openApplicationWithBundleIdentifier:(id)a3 usingOpenResourceOperationWithPayloadURL:(id)a4 options:(id)a5 pendingResult:(id)a6;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)openResourceOperationDidComplete:(id)a3;
- (void)setOpenApplicationOperationQueue:(id)a3;
@end

@implementation ASCWorkspace

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4
{
  return [(ASCWorkspace *)self openApplicationWithBundleIdentifier:a3 payloadURL:a4 universalLinkRequired:0];
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F4DDA0]);
  uint64_t v11 = *MEMORY[0x1E4F626A0];
  v25[0] = *MEMORY[0x1E4F62688];
  v25[1] = v11;
  v26[0] = MEMORY[0x1E4F1CC38];
  v26[1] = MEMORY[0x1E4F1CC38];
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  if (v9)
  {
    v13 = (void *)MEMORY[0x1E4F22398];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke;
    v18[3] = &unk_1E645ECA0;
    id v19 = v8;
    id v20 = v12;
    id v21 = v10;
    v22 = self;
    id v23 = v9;
    BOOL v24 = a5;
    [v13 getAppLinksWithURL:v23 completionHandler:v18];

    id v14 = v19;
  }
  else
  {
    v15 = +[ASCWorkspace log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1C2B8D000, v15, OS_LOG_TYPE_INFO, "No payload URL; opening application.", v17, 2u);
    }

    id v14 = objc_alloc_init(MEMORY[0x1E4F224A0]);
    [v14 setFrontBoardOptions:v12];
    [(ASCWorkspace *)self openApplicationWithBundleIdentifier:v8 configuration:v14 pendingResult:v10];
  }

  return v10;
}

void __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    id v27 = v6;
    id v8 = +[ASCWorkspace log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_cold_3(v5, v8);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v36;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v35 + 1) + 8 * v13);
        v15 = [v14 targetApplicationRecord];
        v16 = [v15 bundleIdentifier];
        char v17 = [v16 isEqualToString:*(void *)(a1 + 32)];

        if (v17) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v11) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      id v18 = v14;

      if (!v18) {
        goto LABEL_17;
      }
      id v19 = +[ASCWorkspace log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2B8D000, v19, OS_LOG_TYPE_INFO, "Found valid universal link, attempting to open", buf, 2u);
      }

      id v20 = objc_alloc_init(MEMORY[0x1E4F224A0]);
      [v20 setFrontBoardOptions:*(void *)(a1 + 40)];
      [v20 setIgnoreAppLinkEnabledProperty:1];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_5;
      v28[3] = &unk_1E645EC78;
      id v21 = *(id *)(a1 + 48);
      uint64_t v22 = *(void *)(a1 + 56);
      id v29 = v21;
      uint64_t v30 = v22;
      id v31 = *(id *)(a1 + 32);
      id v32 = *(id *)(a1 + 64);
      id v33 = *(id *)(a1 + 40);
      [v18 openWithConfiguration:v20 completionHandler:v28];
    }
    else
    {
LABEL_12:

LABEL_17:
      id v23 = +[ASCWorkspace log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_cold_2(a1, v23);
      }

      id v18 = objc_alloc_init(MEMORY[0x1E4F224A0]);
      [v18 setFrontBoardOptions:*(void *)(a1 + 40)];
      [*(id *)(a1 + 56) openApplicationWithBundleIdentifier:*(void *)(a1 + 32) configuration:v18 pendingResult:*(void *)(a1 + 48)];
    }
    v7 = v27;
    goto LABEL_25;
  }
  int v24 = *(unsigned __int8 *)(a1 + 72);
  v25 = +[ASCWorkspace log];
  v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_cold_1(v26);
    }

    id v18 = objc_alloc_init(MEMORY[0x1E4F224A0]);
    [v18 setFrontBoardOptions:*(void *)(a1 + 40)];
    [*(id *)(a1 + 56) openApplicationWithBundleIdentifier:*(void *)(a1 + 32) configuration:v18 pendingResult:*(void *)(a1 + 48)];
LABEL_25:

    goto LABEL_26;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2B8D000, v26, OS_LOG_TYPE_INFO, "Found non-universal link, opening via open resource operation", buf, 2u);
  }

  [*(id *)(a1 + 56) openApplicationWithBundleIdentifier:*(void *)(a1 + 32) usingOpenResourceOperationWithPayloadURL:*(void *)(a1 + 64) options:*(void *)(a1 + 40) pendingResult:*(void *)(a1 + 48)];
LABEL_26:
}

void __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = +[ASCWorkspace log];
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1C2B8D000, v7, OS_LOG_TYPE_INFO, "Successfully opened universal link", v8, 2u);
    }

    [*(id *)(a1 + 32) finishWithSuccess];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_5_cold_1();
    }

    [*(id *)(a1 + 40) openApplicationWithBundleIdentifier:*(void *)(a1 + 48) usingOpenResourceOperationWithPayloadURL:*(void *)(a1 + 56) options:*(void *)(a1 + 64) pendingResult:*(void *)(a1 + 32)];
  }
}

- (void)openApplicationWithBundleIdentifier:(id)a3 usingOpenResourceOperationWithPayloadURL:(id)a4 options:(id)a5 pendingResult:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x1E4F223E0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [v10 defaultWorkspace];
  v16 = [v15 operationToOpenResource:v13 usingApplication:v14 uniqueDocumentIdentifier:0 isContentManaged:0 sourceAuditToken:0 userInfo:0 options:v12 delegate:self];

  char v17 = +[ASCWorkspace log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2B8D000, v17, OS_LOG_TYPE_INFO, "Enqueuing open resource URL operation", buf, 2u);
  }

  [(ASCWorkspace *)self enqueueOpenApplicationOperation:v16 pendingResult:v11];
}

- (void)openApplicationWithBundleIdentifier:(id)a3 configuration:(id)a4 pendingResult:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x1E4F223E0];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 defaultWorkspace];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __113__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_configuration_pendingResult___block_invoke;
  v13[3] = &unk_1E645D760;
  id v14 = v7;
  id v12 = v7;
  [v11 openApplicationWithBundleIdentifier:v10 configuration:v9 completionHandler:v13];
}

void __113__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_configuration_pendingResult___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = +[ASCWorkspace log];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1C2B8D000, v7, OS_LOG_TYPE_INFO, "Open application with bundle ID succeeded.", v8, 2u);
    }

    [*(id *)(a1 + 32) finishWithSuccess];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __113__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_configuration_pendingResult___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) finishWithError:v5];
  }
}

- (id)openProductURL:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F626A0];
  v10[0] = *MEMORY[0x1E4F62688];
  v10[1] = v4;
  v11[0] = MEMORY[0x1E4F1CC38];
  v11[1] = MEMORY[0x1E4F1CC38];
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v8 = [(ASCWorkspace *)self openURL:v6 frontBoardOptions:v7];

  return v8;
}

- (void)openResourceOperationDidComplete:(id)a3
{
  id v4 = a3;
  id v5 = +[ASCWorkspace log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1C2B8D000, v5, OS_LOG_TYPE_INFO, "Open resource URL operation completed", v8, 2u);
  }

  id v6 = [v4 name];

  id v7 = [(ASCWorkspace *)self popPendingResultForOperationName:v6];

  [v7 finishWithSuccess];
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[ASCWorkspace log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[ASCWorkspace(ASCAppLaunchTrampolineWorkspace) openResourceOperation:didFailWithError:]();
  }

  id v9 = [v7 name];

  id v10 = [(ASCWorkspace *)self popPendingResultForOperationName:v9];

  [v10 finishWithError:v6];
}

+ (OS_os_log)log
{
  if (log_onceToken_9 != -1) {
    dispatch_once(&log_onceToken_9, &__block_literal_global_31);
  }
  v2 = (void *)log_log_9;

  return (OS_os_log *)v2;
}

uint64_t __19__ASCWorkspace_log__block_invoke()
{
  log_log_9 = (uint64_t)os_log_create("com.apple.AppStoreComponents", "ASCWorkspace");

  return MEMORY[0x1F41817F8]();
}

+ (ASCWorkspace)sharedWorkspace
{
  v2 = (void *)ASCWorkspace_testingWorkspace;
  if (!ASCWorkspace_testingWorkspace)
  {
    if (sharedWorkspace_onceToken != -1) {
      dispatch_once(&sharedWorkspace_onceToken, &__block_literal_global_4_2);
    }
    v2 = (void *)sharedWorkspace_sharedWorkspace;
  }
  id v3 = v2;

  return (ASCWorkspace *)v3;
}

uint64_t __31__ASCWorkspace_sharedWorkspace__block_invoke()
{
  sharedWorkspace_sharedWorkspace = [[ASCWorkspace alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)ASCWorkspace;
  v2 = [(ASCWorkspace *)&v6 init];
  if (v2)
  {
    id v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    stateLock = v2->_stateLock;
    v2->_stateLock = v3;
  }
  return v2;
}

+ (void)withSharedWorkspace:(id)a3 perform:(id)a4
{
  id v9 = a3;
  objc_super v6 = (void (**)(void))a4;
  id v7 = (id)ASCWorkspace_testingWorkspace;
  objc_storeStrong((id *)&ASCWorkspace_testingWorkspace, a3);
  v6[2](v6);
  id v8 = (void *)ASCWorkspace_testingWorkspace;
  ASCWorkspace_testingWorkspace = (uint64_t)v7;
}

- (BOOL)isExtension
{
  return MEMORY[0x1F4166FA8](self, a2);
}

- (id)openURL:(id)a3
{
  return [(ASCWorkspace *)self openURL:a3 frontBoardOptions:0];
}

- (id)openURL:(id)a3 frontBoardOptions:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F4DDA0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  id v9 = objc_alloc_init(MEMORY[0x1E4F224A0]);
  [v9 setFrontBoardOptions:v6];

  id v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__ASCWorkspace_openURL_frontBoardOptions___block_invoke;
  v13[3] = &unk_1E645ECC8;
  id v11 = v8;
  id v14 = v11;
  [v10 openURL:v7 configuration:v9 completionHandler:v13];

  return v11;
}

uint64_t __42__ASCWorkspace_openURL_frontBoardOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithSuccess];
  }
  else {
    return objc_msgSend(v2, "finishWithError:");
  }
}

- (id)openSensitiveURL:(id)a3
{
  return [(ASCWorkspace *)self openSensitiveURL:a3 frontBoardOptions:0];
}

- (id)openSensitiveURL:(id)a3 frontBoardOptions:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F4DDA0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  id v9 = objc_alloc_init(MEMORY[0x1E4F224A0]);
  [v9 setSensitive:1];
  [v9 setFrontBoardOptions:v6];

  id v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__ASCWorkspace_openSensitiveURL_frontBoardOptions___block_invoke;
  v13[3] = &unk_1E645ECC8;
  id v11 = v8;
  id v14 = v11;
  [v10 openURL:v7 configuration:v9 completionHandler:v13];

  return v11;
}

uint64_t __51__ASCWorkspace_openSensitiveURL_frontBoardOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithSuccess];
  }
  else {
    return objc_msgSend(v2, "finishWithError:");
  }
}

- (void)enqueueOpenApplicationOperation:(id)a3 pendingResult:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [(ASCWorkspace *)self stateLock];
  [v7 lock];

  if (!self->_openApplicationOperationQueue)
  {
    id v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    openApplicationOperationQueue = self->_openApplicationOperationQueue;
    self->_openApplicationOperationQueue = v8;
  }
  if (!self->_pendingResults)
  {
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingResults = self->_pendingResults;
    self->_pendingResults = v10;
  }
  [(NSOperationQueue *)self->_openApplicationOperationQueue setSuspended:1];
  id v12 = [v18 name];

  if (!v12)
  {
    id v13 = [MEMORY[0x1E4F29128] UUID];
    id v14 = [v13 UUIDString];
    [v18 setName:v14];
  }
  [(NSOperationQueue *)self->_openApplicationOperationQueue addOperation:v18];
  v15 = [(ASCWorkspace *)self pendingResults];
  v16 = [v18 name];
  [v15 setObject:v6 forKey:v16];

  [(NSOperationQueue *)self->_openApplicationOperationQueue setSuspended:0];
  char v17 = [(ASCWorkspace *)self stateLock];
  [v17 unlock];
}

- (id)popPendingResultForOperationName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ASCWorkspace *)self stateLock];
    [v5 lock];

    id v6 = [(ASCWorkspace *)self pendingResults];
    id v7 = [v6 objectForKey:v4];

    if (v7)
    {
      id v8 = [(ASCWorkspace *)self pendingResults];
      [v8 removeObjectForKey:v4];
    }
    id v9 = [(ASCWorkspace *)self stateLock];
    [v9 unlock];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)pendingResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSOperationQueue)openApplicationOperationQueue
{
  return self->_openApplicationOperationQueue;
}

- (void)setOpenApplicationOperationQueue:(id)a3
{
}

- (NSRecursiveLock)stateLock
{
  return self->_stateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_openApplicationOperationQueue, 0);

  objc_storeStrong((id *)&self->_pendingResults, 0);
}

void __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C2B8D000, log, OS_LOG_TYPE_ERROR, "Found non-universal link, opening application", v1, 2u);
}

void __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [0 targetApplicationRecord];
  id v5 = [v4 bundleIdentifier];
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_1C2B8D000, a2, OS_LOG_TYPE_ERROR, "Found valid universal link with mismatching bundle ID, source %{public}@, target %{public}@", (uint8_t *)&v6, 0x16u);
}

void __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_cold_3(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C2B8D000, a2, OS_LOG_TYPE_DEBUG, "Found %lu matching apps for payload URL", v3, 0xCu);
}

void __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1C2B8D000, v0, v1, "Failed to open universal link, reason %{public}@", v2, v3, v4, v5, v6);
}

void __113__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_configuration_pendingResult___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1C2B8D000, v0, v1, "Open application with bundle ID failed, reason %{public}@", v2, v3, v4, v5, v6);
}

@end