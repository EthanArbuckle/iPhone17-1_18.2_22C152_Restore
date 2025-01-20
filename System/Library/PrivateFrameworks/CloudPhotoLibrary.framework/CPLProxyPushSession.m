@interface CPLProxyPushSession
+ (void)beginSessionForProxy:(id)a3 knownVersion:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)commitChangeBatch:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation CPLProxyPushSession

+ (void)beginSessionForProxy:(id)a3 knownVersion:(id)a4 context:(id)a5 completionHandler:(id)a6
{
}

- (void)commitChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!_CPLSilentLogging)
  {
    v8 = __CPLProxyPushSessionOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "Comitting %@", buf, 0xCu);
    }

    if (!_CPLSilentLogging)
    {
      v9 = __CPLProxyPushSessionOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Sending commit message to connection", buf, 2u);
      }
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__CPLProxyPushSession_commitChangeBatch_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E60A6078;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [(CPLProxySession *)self dispatchBlockWhenLibraryIsOpen:v12];
}

void __63__CPLProxyPushSession_commitChangeBatch_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__CPLProxyPushSession_commitChangeBatch_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E60A69E8;
  id v15 = *(id *)(a1 + 48);
  v3 = [v2 proxyWithErrorHandler:v14];
  if (v3)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__CPLProxyPushSession_commitChangeBatch_withCompletionHandler___block_invoke_1;
    v12[3] = &unk_1E60A6A88;
    uint64_t v4 = *(void *)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    [v3 commitChangeBatch:v4 withCompletionHandler:v12];
    v5 = v13;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) proxyLibraryManager];
    id v7 = [v6 queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__CPLProxyPushSession_commitChangeBatch_withCompletionHandler___block_invoke_8;
    v10[3] = &unk_1E60A6978;
    id v11 = *(id *)(a1 + 48);
    v8 = v10;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_1;
    block[3] = &unk_1E60A6978;
    id v17 = v8;
    dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v7, v9);

    v5 = v11;
  }
}

void __63__CPLProxyPushSession_commitChangeBatch_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLProxyPushSessionOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Commiting failed with error %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__CPLProxyPushSession_commitChangeBatch_withCompletionHandler___block_invoke_1(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  v12 = [*(id *)(a1 + 32) proxyLibraryManager];
  id v13 = [v12 queue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__CPLProxyPushSession_commitChangeBatch_withCompletionHandler___block_invoke_2_2;
  v20[3] = &unk_1E60A6A60;
  id v21 = v9;
  id v14 = *(id *)(a1 + 40);
  id v22 = v10;
  id v23 = v11;
  id v24 = v14;
  uint64_t v25 = a3;
  id v15 = v20;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1;
  block[3] = &unk_1E60A6978;
  id v27 = v15;
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v19);
}

uint64_t __63__CPLProxyPushSession_commitChangeBatch_withCompletionHandler___block_invoke_2_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    if (!_CPLSilentLogging)
    {
      v2 = __CPLProxyPushSessionOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = a1[4];
        int v8 = 138412290;
        uint64_t v9 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Commiting failed with error %@", (uint8_t *)&v8, 0xCu);
      }
    }
    uint64_t v4 = *(uint64_t (**)(void))(a1[7] + 16);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v5 = __CPLProxyPushSessionOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = a1[6];
        int v8 = 138412290;
        uint64_t v9 = v6;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Committing succeeded with new library version: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    uint64_t v4 = *(uint64_t (**)(void))(a1[7] + 16);
  }
  return v4();
}

void __63__CPLProxyPushSession_commitChangeBatch_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = +[CPLErrors cplErrorWithCode:150, @"Exception raised while trying to send a batch to the daemon: %@", *(void *)(a1 + 32) description];
  if (!_CPLSilentLogging)
  {
    uint64_t v3 = __CPLProxyPushSessionOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v2;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Commiting failed with error %@", buf, 0xCu);
    }

    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLProxyPushSessionOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = *(void **)(a1 + 32);
        uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(*(id *)(a1 + 40), "estimatedBatchSize"), 1);
        uint64_t v7 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v9 = v5;
        __int16 v10 = 2112;
        id v11 = v6;
        __int16 v12 = 2112;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Unable to send batch to daemon for commit: %@\nBatch (estimated size: %@): %@", buf, 0x20u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __63__CPLProxyPushSession_commitChangeBatch_withCompletionHandler___block_invoke_8(uint64_t a1)
{
  if (!_CPLSilentLogging)
  {
    v2 = __CPLProxyPushSessionOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Proxy has disappeared", v5, 2u);
    }
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = +[CPLErrors libraryClosedError];
  (*(void (**)(uint64_t, void *, void, void, void))(v3 + 16))(v3, v4, 0, 0, 0);
}

@end