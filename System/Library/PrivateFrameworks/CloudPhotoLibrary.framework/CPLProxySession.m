@interface CPLProxySession
+ (void)beginSessionForProxy:(id)a3 knownVersion:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (id)proxyLibraryManager;
- (id)proxyWithErrorHandler:(id)a3;
- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)dispatchBlockWhenLibraryIsOpen:(id)a3;
- (void)finalizeWithCompletionHandler:(id)a3;
- (void)tearDownWithCompletionHandler:(id)a3;
@end

@implementation CPLProxySession

- (id)proxyLibraryManager
{
  v2 = [(CPLPlatformObject *)self abstractObject];
  v3 = [v2 libraryManager];
  v4 = [v3 platformObject];

  return v4;
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CPLProxySession *)self proxyLibraryManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__CPLProxySession_proxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1E60A5F88;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 proxyWithErrorHandler:v9];

  return v7;
}

uint64_t __41__CPLProxySession_proxyWithErrorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)beginSessionForProxy:(id)a3 knownVersion:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxySession.m"];
  v17 = NSStringFromSelector(a2);
  [v15 handleFailureInMethod:a2, a1, v16, 32, @"%@ should be implemented by subclasses", v17 object file lineNumber description];

  abort();
}

- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!_CPLSilentLogging)
  {
    id v11 = __CPLSessionOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEBUG, "Beginning %@", buf, 0xCu);
    }

    if (!_CPLSilentLogging)
    {
      id v12 = __CPLSessionOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "Sending begin session message to connection", buf, 2u);
      }
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke;
  v16[3] = &unk_1E60A62F8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  [(CPLProxySession *)self dispatchBlockWhenLibraryIsOpen:v16];
}

void __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_2;
  v16[3] = &unk_1E60A6AB0;
  v16[4] = v2;
  id v17 = *(id *)(a1 + 56);
  v3 = [v2 proxyWithErrorHandler:v16];
  if (v3)
  {
    id v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_5;
    v14[3] = &unk_1E60A6AB0;
    v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 56);
    [v4 beginSessionForProxy:v3 knownVersion:v5 context:v6 completionHandler:v14];
    v7 = v15;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) proxyLibraryManager];
    id v9 = [v8 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_8;
    v12[3] = &unk_1E60A6978;
    id v13 = *(id *)(a1 + 56);
    id v10 = v12;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_2;
    block[3] = &unk_1E60A6978;
    id v19 = v10;
    dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v9, v11);

    v7 = v13;
  }
}

void __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLSessionOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Beginning %@ failed with error %@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) proxyLibraryManager];
  uint64_t v5 = [v4 queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_2_6;
  v11[3] = &unk_1E60A6868;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = v6;
  id v14 = v7;
  __int16 v8 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_2;
  block[3] = &unk_1E60A6978;
  id v16 = v8;
  id v9 = v3;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v10);
}

uint64_t __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_2_6(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    if (!_CPLSilentLogging)
    {
      v2 = __CPLSessionOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v4 = a1[4];
        uint64_t v3 = a1[5];
        int v9 = 138412546;
        uint64_t v10 = v3;
        __int16 v11 = 2112;
        uint64_t v12 = v4;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Beginning %@ failed with error %@", (uint8_t *)&v9, 0x16u);
      }
    }
    uint64_t v5 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLSessionOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = a1[5];
        int v9 = 138412290;
        uint64_t v10 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Beginning %@  succeeded", (uint8_t *)&v9, 0xCu);
      }
    }
    uint64_t v5 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v5();
}

void __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_8(uint64_t a1)
{
  if (!_CPLSilentLogging)
  {
    v2 = __CPLSessionOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Proxy has disappeared", v5, 2u);
    }
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = +[CPLErrors libraryClosedError];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)finalizeWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v5 = __CPLSessionOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = self;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Finalizing %@", buf, 0xCu);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60A5EE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CPLProxySession *)self dispatchBlockWhenLibraryIsOpen:v7];
}

void __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  if (!_CPLSilentLogging)
  {
    v2 = __CPLSessionOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Sending finalize message to connection", buf, 2u);
    }
  }
  uint64_t v3 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_10;
  v15[3] = &unk_1E60A6AB0;
  v15[4] = v3;
  id v16 = *(id *)(a1 + 40);
  id v4 = [v3 proxyWithErrorHandler:v15];
  if (v4)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_11;
    v13[3] = &unk_1E60A6AB0;
    uint64_t v5 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v5;
    [v4 finalizeSessionWithCompletionHandler:v13];
    id v6 = v14;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) proxyLibraryManager];
    id v8 = [v7 queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_12;
    v11[3] = &unk_1E60A6978;
    id v12 = *(id *)(a1 + 40);
    int v9 = v11;
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __cpl_dispatch_async_block_invoke_2;
    v20 = &unk_1E60A6978;
    id v21 = v9;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
    dispatch_async(v8, v10);

    id v6 = v12;
  }
}

void __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLSessionOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Finalizing %@ failed with error %@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) proxyLibraryManager];
  uint64_t v5 = [v4 queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E60A6868;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = v6;
  id v14 = v7;
  __int16 v8 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_2;
  block[3] = &unk_1E60A6978;
  id v16 = v8;
  id v9 = v3;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v10);
}

uint64_t __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_2(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    if (!_CPLSilentLogging)
    {
      v2 = __CPLSessionOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v4 = a1[4];
        uint64_t v3 = a1[5];
        int v9 = 138412546;
        uint64_t v10 = v3;
        __int16 v11 = 2112;
        uint64_t v12 = v4;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Finalizing %@ failed with error %@", (uint8_t *)&v9, 0x16u);
      }
    }
    uint64_t v5 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLSessionOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = a1[5];
        int v9 = 138412290;
        uint64_t v10 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Finalizing %@ succeeded", (uint8_t *)&v9, 0xCu);
      }
    }
    uint64_t v5 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v5();
}

void __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_12(uint64_t a1)
{
  if (!_CPLSilentLogging)
  {
    v2 = __CPLSessionOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Proxy has disappeared", v5, 2u);
    }
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = +[CPLErrors libraryClosedError];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)tearDownWithCompletionHandler:(id)a3
{
}

- (void)dispatchBlockWhenLibraryIsOpen:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLProxySession *)self proxyLibraryManager];
  [v5 dispatchBlockWhenLibraryIsOpen:v4];
}

@end