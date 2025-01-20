@interface ASDManagedApplicationRequest
- (ASDManagedApplicationRequest)initWithOptions:(id)a3;
- (void)dealloc;
- (void)sendRequestWithCompletionBlock:(id)a3;
@end

@implementation ASDManagedApplicationRequest

- (ASDManagedApplicationRequest)initWithOptions:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASDManagedApplicationRequest;
  v5 = [(ASDManagedApplicationRequest *)&v15 init];
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
    v5->_options = (ASDManagedApplicationRequestOptions *)v12;
  }
  return v5;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ASDManagedApplicationRequest;
  [(ASDManagedApplicationRequest *)&v3 dealloc];
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
  block[2] = __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke;
  block[3] = &unk_1E58B3510;
  block[4] = self;
  v8 = v5;
  v11 = v8;
  id v9 = v6;
  id v12 = v9;
  dispatch_async(accessQueue, block);
}

void __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke(uint64_t a1)
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
      [*(id *)(v2 + 24) setInvalidationHandler:&__block_literal_global_5];
      [*(id *)(v2 + 24) setInterruptionHandler:&__block_literal_global_73_0];
      [*(id *)(v2 + 24) _setQueue:*(void *)(v2 + 8)];
      [*(id *)(v2 + 24) resume];
    }
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 24);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke_2;
  v12[3] = &unk_1E58B34E8;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = *(id *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke_6;
  v10[3] = &unk_1E58B3040;
  v10[4] = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  [(id)v2 _call:v3 run:v12 error:v10];
}

void __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke_2(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke_3;
  v5[3] = &unk_1E58B3910;
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  [a2 managedApplicationRequestWithOptions:v3 completionBlock:v5];
}

void __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke_3(uint64_t a1, char a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke_4;
    v24[3] = &unk_1E58B3068;
    id v12 = &v27;
    id v27 = *(id *)(a1 + 40);
    id v13 = &v25;
    id v25 = v9;
    uint64_t v14 = &v26;
    id v26 = v10;
    id v15 = v24;
    v16 = v11;
  }
  else
  {
    id v17 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke_5;
    v19[3] = &unk_1E58B38E8;
    id v12 = (id *)v22;
    v22[0] = *(id *)(a1 + 40);
    char v23 = a2;
    id v13 = &v20;
    id v18 = v9;
    v22[1] = a4;
    uint64_t v14 = (id *)&v21;
    id v20 = v18;
    uint64_t v21 = 0;
    id v15 = v19;
    v16 = v17;
  }
  dispatch_async(v16, v15);
}

uint64_t __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[6] + 16))(a1[6], 0, a1[4], 0, a1[5]);
}

uint64_t __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 56), *(void *)(a1 + 40));
}

void __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke_7;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __82__ASDManagedApplicationRequest__sendRequestCompletionWithOptions_completionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, MEMORY[0x1E4F1CC08], 0, *(void *)(a1 + 32));
}

void __48__ASDManagedApplicationRequest__setupConnection__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Invalidate", v0, 2u);
  }
}

void __48__ASDManagedApplicationRequest__setupConnection__block_invoke_71()
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