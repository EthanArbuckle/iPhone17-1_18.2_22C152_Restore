@interface FLContainerStorePathManager
- (FLContainerStorePathManager)init;
- (FeedbackLoggerFBFClient)fbf;
- (NSMutableArray)sandboxExtensionTokens;
- (NSMutableDictionary)storeIdToContainerPathMap;
- (NSMutableDictionary)storeIdToLastSandboxExtensionRequestMap;
- (OS_os_log)log;
- (id)containerPathForStoreId:(id)a3;
- (void)dealloc;
- (void)setFbf:(id)a3;
- (void)setLog:(id)a3;
- (void)setSandboxExtensionTokens:(id)a3;
- (void)setStoreIdToContainerPathMap:(id)a3;
- (void)setStoreIdToLastSandboxExtensionRequestMap:(id)a3;
@end

@implementation FLContainerStorePathManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_fbf, 0);
  objc_storeStrong((id *)&self->_storeIdToLastSandboxExtensionRequestMap, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionTokens, 0);
  objc_storeStrong((id *)&self->_storeIdToContainerPathMap, 0);
}

- (void)setLog:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setFbf:(id)a3
{
}

- (FeedbackLoggerFBFClient)fbf
{
  return self->_fbf;
}

- (void)setStoreIdToLastSandboxExtensionRequestMap:(id)a3
{
}

- (NSMutableDictionary)storeIdToLastSandboxExtensionRequestMap
{
  return self->_storeIdToLastSandboxExtensionRequestMap;
}

- (void)setSandboxExtensionTokens:(id)a3
{
}

- (NSMutableArray)sandboxExtensionTokens
{
  return self->_sandboxExtensionTokens;
}

- (void)setStoreIdToContainerPathMap:(id)a3
{
}

- (NSMutableDictionary)storeIdToContainerPathMap
{
  return self->_storeIdToContainerPathMap;
}

- (id)containerPathForStoreId:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__413;
  v24 = __Block_byref_object_dispose__414;
  v5 = [(FLContainerStorePathManager *)self storeIdToContainerPathMap];
  id v25 = [v5 objectForKeyedSubscript:v4];

  v6 = (void *)v21[5];
  if (v6) {
    goto LABEL_8;
  }
  v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = [(FLContainerStorePathManager *)self storeIdToLastSandboxExtensionRequestMap];
  v9 = [v8 objectForKeyedSubscript:v4];

  if (!v9 || ([v7 timeIntervalSinceDate:v9], v10 >= 1.0))
  {
    v13 = [(FLContainerStorePathManager *)self storeIdToLastSandboxExtensionRequestMap];
    [v13 setObject:v7 forKeyedSubscript:v4];

    v14 = objc_alloc_init(FeedbackLoggerFBFClient);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __55__FLContainerStorePathManager_containerPathForStoreId___block_invoke;
    v16[3] = &unk_1E6208958;
    v16[4] = self;
    v18 = &v20;
    id v17 = v4;
    [(FeedbackLoggerFBFClient *)v14 requestSandboxExtensionForBundleID:v17 completion:v16];

    v6 = (void *)v21[5];
LABEL_8:
    id v12 = v6;
    goto LABEL_9;
  }
  v11 = [(FLContainerStorePathManager *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BA2B8000, v11, OS_LOG_TYPE_ERROR, "Throttling repeat request for group container sandbox extension.", buf, 2u);
  }

  id v12 = 0;
LABEL_9:
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __55__FLContainerStorePathManager_containerPathForStoreId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || !v6)
  {
    v18 = [*(id *)(a1 + 32) log];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)uint64_t v20 = 0;
    v19 = "Unable to obtain group container sandbox extension.";
LABEL_10:
    _os_log_error_impl(&dword_1BA2B8000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_8;
  }
  [v5 UTF8String];
  uint64_t v8 = sandbox_extension_consume();
  v9 = *(void **)(a1 + 32);
  if (v8 == -1)
  {
    v18 = [v9 log];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)uint64_t v20 = 0;
    v19 = "Unable to consume group container sandbox extension.";
    goto LABEL_10;
  }
  double v10 = [v9 sandboxExtensionTokens];
  v11 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v8];
  [v10 addObject:v11];

  id v12 = NSString;
  v21[0] = v7;
  v21[1] = @"data.sqlite";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  uint64_t v14 = [v12 pathWithComponents:v13];
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v18 = [*(id *)(a1 + 32) storeIdToContainerPathMap];
  [v18 setObject:v17 forKeyedSubscript:*(void *)(a1 + 40)];
LABEL_8:
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(FLContainerStorePathManager *)self sandboxExtensionTokens];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7) intValue];
        sandbox_extension_release();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)FLContainerStorePathManager;
  [(FLContainerStorePathManager *)&v8 dealloc];
}

- (FLContainerStorePathManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)FLContainerStorePathManager;
  v2 = [(FLContainerStorePathManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storeIdToContainerPathMap = v2->_storeIdToContainerPathMap;
    v2->_storeIdToContainerPathMap = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    sandboxExtensionTokens = v2->_sandboxExtensionTokens;
    v2->_sandboxExtensionTokens = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    storeIdToLastSandboxExtensionRequestMap = v2->_storeIdToLastSandboxExtensionRequestMap;
    v2->_storeIdToLastSandboxExtensionRequestMap = (NSMutableDictionary *)v7;

    uint64_t v9 = flLogForObject(v2);
    log = v2->_log;
    v2->_log = (OS_os_log *)v9;
  }
  return v2;
}

@end