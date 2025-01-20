@interface ASDClaimApplicationsRequest
- (ASDClaimApplicationsRequest)initWithOptions:(id)a3;
- (void)dealloc;
- (void)sendRequestWithCompletionBlock:(id)a3;
@end

@implementation ASDClaimApplicationsRequest

- (ASDClaimApplicationsRequest)initWithOptions:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASDClaimApplicationsRequest;
  v5 = [(ASDClaimApplicationsRequest *)&v15 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDClaimApplicationsRequest.access", v6);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDClaimApplicationsRequest.callout", v9);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [v4 copy];
    options = v5->_options;
    v5->_options = (ASDClaimApplicationsRequestOptions *)v12;
  }
  return v5;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ASDClaimApplicationsRequest;
  [(ASDClaimApplicationsRequest *)&v3 dealloc];
}

- (void)sendRequestWithCompletionBlock:(id)a3
{
  v5 = self->_options;
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke;
  block[3] = &unk_1E58B3510;
  block[4] = self;
  v8 = v5;
  v11 = v8;
  id v9 = v6;
  id v12 = v9;
  dispatch_async(accessQueue, block);
}

void __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  if (!v3)
  {
    if (-[ASDBaseClient _clientHasEntitlement:](*(void *)(a1 + 32), @"com.apple.appstored.private")
      || -[ASDBaseClient _clientHasEntitlement:](v2, @"com.apple.appstored.install-apps"))
    {
      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = (id)objc_opt_class();
      id v9 = v17;
      _os_log_error_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%@]: Treating as legacy client", buf, 0xCu);
    }
    if (-[ASDBaseClient _clientHasEntitlement:](v2, @"com.apple.itunesstored.private"))
    {
LABEL_7:
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.appstored.xpc.storequeue" options:0];
      v5 = *(void **)(v2 + 24);
      *(void *)(v2 + 24) = v4;

      id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6BE58];
      [*(id *)(v2 + 24) setRemoteObjectInterface:v6];
      [*(id *)(v2 + 24) setInvalidationHandler:&__block_literal_global_3];
      [*(id *)(v2 + 24) setInterruptionHandler:&__block_literal_global_73];
      [*(id *)(v2 + 24) _setQueue:*(void *)(v2 + 8)];
      [*(id *)(v2 + 24) resume];
    }
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 24);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_2;
  v12[3] = &unk_1E58B34E8;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = *(id *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_6;
  v10[3] = &unk_1E58B3040;
  v10[4] = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  [(id)v2 _call:v3 run:v12 error:v10];
}

void __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_2(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_3;
  v5[3] = &unk_1E58B34C0;
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  [a2 claimApplicationsWithOptions:v3 completionBlock:v5];
}

void __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_4;
    block[3] = &unk_1E58B2E18;
    dispatch_queue_t v10 = &v20;
    id v20 = *(id *)(a1 + 40);
    id v11 = &v19;
    id v19 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_5;
    v13[3] = &unk_1E58B3498;
    dispatch_queue_t v10 = &v16;
    id v16 = *(id *)(a1 + 40);
    char v17 = a2;
    id v11 = &v14;
    id v14 = v7;
    id v15 = 0;
    dispatch_async(v12, v13);
  }
}

uint64_t __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

uint64_t __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_7;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

void __47__ASDClaimApplicationsRequest__setupConnection__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Invalidate", v0, 2u);
  }
}

void __47__ASDClaimApplicationsRequest__setupConnection__block_invoke_71()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Interrupt", v0, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end