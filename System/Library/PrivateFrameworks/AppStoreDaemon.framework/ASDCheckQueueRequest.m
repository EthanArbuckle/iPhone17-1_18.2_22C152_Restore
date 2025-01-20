@interface ASDCheckQueueRequest
- (ASDCheckQueueRequest)initWithOptions:(id)a3;
- (void)dealloc;
- (void)sendRequestCompletionBlock:(id)a3;
@end

@implementation ASDCheckQueueRequest

- (ASDCheckQueueRequest)initWithOptions:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASDCheckQueueRequest;
  v5 = [(ASDCheckQueueRequest *)&v15 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDCheckQueueRequest.access", v6);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDCheckQueueRequest.callout", v9);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [v4 copy];
    options = v5->_options;
    v5->_options = (ASDCheckQueueRequestOptions *)v12;
  }
  return v5;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ASDCheckQueueRequest;
  [(ASDCheckQueueRequest *)&v3 dealloc];
}

- (void)sendRequestCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self)
  {
    if (!v4) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
    }
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke;
    v7[3] = &unk_1E58B33D0;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(accessQueue, v7);
  }
}

void __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  if (!v3)
  {
    if (-[ASDBaseClient _clientHasEntitlement:](*(void *)(a1 + 32), @"com.apple.appstored.private")
      || -[ASDBaseClient _clientHasEntitlement:](v2, @"com.apple.appstored.install-apps")
      || -[ASDBaseClient _clientHasASDEntitlement:](v2, @"Queue"))
    {
      goto LABEL_8;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = (id)objc_opt_class();
      id v8 = v14;
      _os_log_error_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%@]: Treating as legacy client", buf, 0xCu);
    }
    if (-[ASDBaseClient _clientHasEntitlement:](v2, @"com.apple.itunesstored.private"))
    {
LABEL_8:
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.appstored.xpc.storequeue" options:0];
      v5 = *(void **)(v2 + 24);
      *(void *)(v2 + 24) = v4;

      v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6BE58];
      [*(id *)(v2 + 24) setRemoteObjectInterface:v6];
      [*(id *)(v2 + 24) setInvalidationHandler:&__block_literal_global_2];
      [*(id *)(v2 + 24) setInterruptionHandler:&__block_literal_global_76];
      [*(id *)(v2 + 24) _setQueue:*(void *)(v2 + 8)];
      [*(id *)(v2 + 24) resume];
    }
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 24);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_2;
  v11[3] = &unk_1E58B3380;
  v11[4] = v2;
  id v12 = *(id *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_5;
  v9[3] = &unk_1E58B33A8;
  id v7 = *(id *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v7;
  [(id)v2 _call:v3 run:v11 error:v9];
}

void __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_3;
  v6[3] = &unk_1E58B3358;
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [a2 checkQueueWithOptions:v4 completionBlock:v6];
}

void __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_4;
    block[3] = &unk_1E58B30B8;
    id v10 = v6;
    id v9 = v5;
    char v11 = a2;
    dispatch_async(v7, block);
  }
}

uint64_t __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = *(unsigned __int8 *)(a1 + 48) != 0;
  }
  return (*(uint64_t (**)(uint64_t, BOOL))(v2 + 16))(v2, v3);
}

void __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_6;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __40__ASDCheckQueueRequest__setupConnection__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Invalidate", v0, 2u);
  }
}

void __40__ASDCheckQueueRequest__setupConnection__block_invoke_74()
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