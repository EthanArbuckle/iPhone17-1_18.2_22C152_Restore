@interface CPLProxyPullSession
+ (void)beginSessionForProxy:(id)a3 knownVersion:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4;
- (void)getChangeBatchWithCompletionHandler:(id)a3;
@end

@implementation CPLProxyPullSession

+ (void)beginSessionForProxy:(id)a3 knownVersion:(id)a4 context:(id)a5 completionHandler:(id)a6
{
}

- (void)getChangeBatchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    v5 = __CPLProxyPullSessionOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Getting next change batch", buf, 2u);
    }

    if (!_CPLSilentLogging)
    {
      v6 = __CPLProxyPullSessionOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Sending Get Change Batch message to connection", buf, 2u);
      }
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E60A5EE8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(CPLProxySession *)self dispatchBlockWhenLibraryIsOpen:v8];
}

void __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E60A69E8;
  v2 = *(void **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  v3 = [v2 proxyWithErrorHandler:v14];
  if (v3)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_1;
    v12[3] = &unk_1E60A6A10;
    id v4 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v4;
    [v3 getChangeBatchWithCompletionHandler:v12];
    v5 = v13;
  }
  else
  {
    v6 = [*(id *)(a1 + 32) proxyLibraryManager];
    id v7 = [v6 queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_5;
    v10[3] = &unk_1E60A6978;
    id v11 = *(id *)(a1 + 40);
    v8 = v10;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_0;
    block[3] = &unk_1E60A6978;
    id v17 = v8;
    dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v7, v9);

    v5 = v11;
  }
}

void __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLProxyPullSessionOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Getting batch failed with error %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) proxyLibraryManager];
  v8 = [v7 queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_2_2;
  v14[3] = &unk_1E60A6078;
  id v15 = v5;
  id v9 = *(id *)(a1 + 40);
  id v16 = v6;
  id v17 = v9;
  v10 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_0;
  block[3] = &unk_1E60A6978;
  id v19 = v10;
  id v11 = v6;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v13);
}

uint64_t __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_2_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    if (!_CPLSilentLogging)
    {
      v2 = __CPLProxyPullSessionOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = a1[4];
        int v8 = 138412290;
        uint64_t v9 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Getting batch failed with error %@", (uint8_t *)&v8, 0xCu);
      }
    }
    id v4 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLProxyPullSessionOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = a1[5];
        int v8 = 138412290;
        uint64_t v9 = v6;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Got batch: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    id v4 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v4();
}

void __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  if (!_CPLSilentLogging)
  {
    v2 = __CPLProxyPullSessionOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Proxy has disappeared", v5, 2u);
    }
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = +[CPLErrors libraryClosedError];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
}

- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!_CPLSilentLogging)
  {
    int v8 = __CPLProxyPullSessionOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "Acknowledging %@", buf, 0xCu);
    }

    if (!_CPLSilentLogging)
    {
      uint64_t v9 = __CPLProxyPullSessionOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Sending Acknowledging message to connection", buf, 2u);
      }
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E60A6078;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [(CPLProxySession *)self dispatchBlockWhenLibraryIsOpen:v12];
}

void __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E60A69E8;
  id v15 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 proxyWithErrorHandler:v14];
  if (v3)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_6;
    v12[3] = &unk_1E60A6A38;
    uint64_t v4 = *(void *)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    [v3 acknowledgeChangeBatch:v4 withCompletionHandler:v12];
    id v5 = v13;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) proxyLibraryManager];
    id v7 = [v6 queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_12;
    v10[3] = &unk_1E60A6978;
    id v11 = *(id *)(a1 + 48);
    int v8 = v10;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_0;
    block[3] = &unk_1E60A6978;
    id v17 = v8;
    dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v7, v9);

    id v5 = v11;
  }
}

void __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLProxyPullSessionOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Acknowledging failed with error %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) proxyLibraryManager];
  int v8 = [v7 queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_2_7;
  v14[3] = &unk_1E60A6078;
  id v15 = v5;
  id v9 = *(id *)(a1 + 40);
  id v16 = v6;
  id v17 = v9;
  id v10 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_0;
  block[3] = &unk_1E60A6978;
  id v19 = v10;
  id v11 = v6;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v13);
}

uint64_t __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_2_7(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    if (!_CPLSilentLogging)
    {
      v2 = __CPLProxyPullSessionOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = a1[4];
        int v8 = 138412290;
        uint64_t v9 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Acknowledging failed with error %@", (uint8_t *)&v8, 0xCu);
      }
    }
    uint64_t v4 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLProxyPullSessionOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = a1[5];
        int v8 = 138412290;
        uint64_t v9 = v6;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Acknowledging succeeded with new library version: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    uint64_t v4 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v4();
}

void __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = +[CPLErrors cplErrorWithCode:150, @"Exception raised while trying to send a batch to the daemon: %@", *(void *)(a1 + 32) description];
  if (!_CPLSilentLogging)
  {
    uint64_t v3 = __CPLProxyPullSessionOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v2;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Acknowledgement failed with error %@", buf, 0xCu);
    }

    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLProxyPullSessionOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v5 = *(void **)(a1 + 32);
        uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(*(id *)(a1 + 40), "estimatedBatchSize"), 1);
        uint64_t v7 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v9 = v5;
        __int16 v10 = 2112;
        id v11 = v6;
        __int16 v12 = 2112;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Unable to send batch to daemon for ack: %@\nBatch (estimated size: %@): %@", buf, 0x20u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_12(uint64_t a1)
{
  if (!_CPLSilentLogging)
  {
    v2 = __CPLProxyPullSessionOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Proxy has disappeared", v5, 2u);
    }
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = +[CPLErrors libraryClosedError];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
}

@end