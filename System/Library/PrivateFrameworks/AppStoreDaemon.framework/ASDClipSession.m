@interface ASDClipSession
- (ASDClipSession)initWithRequest:(id)a3;
- (ASDClipSession)initWithRequest:(id)a3 delegate:(id)a4;
- (ASDClipSession)initWithRequest:(id)a3 delegate:(id)a4 usingBroker:(id)a5;
- (ASDClipSessionDelegate)delegate;
- (NSUUID)uniqueID;
- (void)_dispatchFailWithError:(uint64_t)a1;
- (void)_dispatchHandler:(void *)a3 withError:;
- (void)cancelInstallWithCompletionHandler:(id)a3;
- (void)channelNotifyDidComplete;
- (void)channelNotifyDidFailWithError:(id)a3;
- (void)channelNotifyDidInstallPlaceholder;
- (void)channelNotifyDidProgress:(double)a3;
- (void)continueInstallWithCompletionHandler:(id)a3;
- (void)installPlaceholderWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startDownloadWithCompletionHandler:(id)a3;
@end

@implementation ASDClipSession

- (ASDClipSession)initWithRequest:(id)a3
{
  return [(ASDClipSession *)self initWithRequest:a3 delegate:0];
}

- (ASDClipSession)initWithRequest:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[ASDServiceBroker defaultBroker];
  v9 = [(ASDClipSession *)self initWithRequest:v7 delegate:v6 usingBroker:v8];

  return v9;
}

- (ASDClipSession)initWithRequest:(id)a3 delegate:(id)a4 usingBroker:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)ASDClipSession;
  v12 = [(ASDClipSession *)&v27 init];
  if (v12)
  {
    v13 = NSString;
    v14 = [v9 uniqueID];
    v15 = [v13 stringWithFormat:@"com.apple.AppStoreDaemon.ASDClipSession.%@", v14];

    id v16 = v15;
    v17 = (const char *)[v16 UTF8String];
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    dispatchQueue = v12->_dispatchQueue;
    v12->_dispatchQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v12->_broker, a5);
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v12->_request, a3);
    v21 = v12->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__ASDClipSession_initWithRequest_delegate_usingBroker___block_invoke;
    block[3] = &unk_1E58B2EB8;
    v26 = v12;
    v22 = v21;
    dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v22, v23);
  }
  return v12;
}

void __55__ASDClipSession_initWithRequest_delegate_usingBroker___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 16));
    v2 = *(void **)(v1 + 8);
    id v9 = 0;
    v3 = [v2 getClipServiceWithError:&v9];
    id v4 = v9;
    if (v3)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __46__ASDClipSession__establishBoostingConnection__block_invoke;
      v8[3] = &unk_1E58B2F08;
      v8[4] = v1;
      v5 = [v3 remoteObjectProxyWithErrorHandler:v8];
      uint64_t v6 = *(void *)(v1 + 24);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __46__ASDClipSession__establishBoostingConnection__block_invoke_3;
      v7[3] = &unk_1E58B50F0;
      v7[4] = v1;
      [v5 boostSessionUsingChannel:v1 forRequest:v6 withReplyHandler:v7];
    }
  }
}

- (NSUUID)uniqueID
{
  return [(ASDClipRequest *)self->_request uniqueID];
}

- (void)startDownloadWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ASDClipSession_startDownloadWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  uint64_t v6 = dispatchQueue;
  id v7 = v4;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async(v6, v8);
}

void __53__ASDClipSession_startDownloadWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v13 = 0;
  v3 = [v2 getClipServiceWithError:&v13];
  id v4 = v13;
  if (v3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__ASDClipSession_startDownloadWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E58B3040;
    v5 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    uint64_t v6 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v11];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 24) uniqueID];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__ASDClipSession_startDownloadWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E58B4458;
    dispatch_block_t v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    [v6 startSessionID:v7 withReplyHandler:v9];
  }
  else
  {
    -[ASDClipSession _dispatchHandler:withError:](*(void *)(a1 + 32), *(void **)(a1 + 40), v4);
  }
}

void __53__ASDClipSession_startDownloadWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)_dispatchHandler:(void *)a3 withError:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = dispatch_get_global_queue(21, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__ASDClipSession__dispatchHandler_withError___block_invoke;
    v8[3] = &unk_1E58B2E18;
    id v10 = v5;
    id v9 = v6;
    dispatch_async(v7, v8);
  }
}

void __53__ASDClipSession_startDownloadWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
}

- (void)cancelInstallWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ASDClipSession_cancelInstallWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v6 = dispatchQueue;
  id v7 = v4;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async(v6, v8);
}

void __53__ASDClipSession_cancelInstallWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v13 = 0;
  v3 = [v2 getClipServiceWithError:&v13];
  id v4 = v13;
  if (v3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__ASDClipSession_cancelInstallWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E58B3040;
    id v5 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    id v6 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v11];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 24) uniqueID];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__ASDClipSession_cancelInstallWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E58B4458;
    dispatch_block_t v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    [v6 cancelSessionID:v7 withReplyHandler:v9];
  }
  else
  {
    -[ASDClipSession _dispatchHandler:withError:](*(void *)(a1 + 32), *(void **)(a1 + 40), v4);
  }
}

void __53__ASDClipSession_cancelInstallWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
}

void __53__ASDClipSession_cancelInstallWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
}

- (void)continueInstallWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ASDClipSession_continueInstallWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v6 = dispatchQueue;
  id v7 = v4;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async(v6, v8);
}

void __55__ASDClipSession_continueInstallWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v13 = 0;
  v3 = [v2 getClipServiceWithError:&v13];
  id v4 = v13;
  if (v3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__ASDClipSession_continueInstallWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E58B3040;
    id v5 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    id v6 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v11];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 24) uniqueID];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__ASDClipSession_continueInstallWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E58B4458;
    dispatch_block_t v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    [v6 commitSessionID:v7 withReplyHandler:v9];
  }
  else
  {
    -[ASDClipSession _dispatchHandler:withError:](*(void *)(a1 + 32), *(void **)(a1 + 40), v4);
  }
}

void __55__ASDClipSession_continueInstallWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
}

void __55__ASDClipSession_continueInstallWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
}

- (void)installPlaceholderWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ASDClipSession_installPlaceholderWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v6 = dispatchQueue;
  id v7 = v4;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async(v6, v8);
}

void __58__ASDClipSession_installPlaceholderWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v13 = 0;
  v3 = [v2 getClipServiceWithError:&v13];
  id v4 = v13;
  if (v3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__ASDClipSession_installPlaceholderWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E58B3040;
    id v5 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    id v6 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v11];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 24) uniqueID];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__ASDClipSession_installPlaceholderWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E58B4458;
    dispatch_block_t v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    [v6 placeholderSessionID:v7 withReplyHandler:v9];
  }
  else
  {
    -[ASDClipSession _dispatchHandler:withError:](*(void *)(a1 + 32), *(void **)(a1 + 40), v4);
  }
}

void __58__ASDClipSession_installPlaceholderWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
}

void __58__ASDClipSession_installPlaceholderWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
}

- (void)channelNotifyDidComplete
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ASDClipRequest *)self->_request uniqueID];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session completed successfully", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(ASDClipSession *)self delegate];
  [v5 clipSessionDidCompleteSuccessfully:self];
}

- (void)channelNotifyDidFailWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v7 = [(ASDClipRequest *)self->_request uniqueID];
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_error_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Session failed with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  int v6 = [(ASDClipSession *)self delegate];
  [v6 clipSession:self didFailWithError:v4];
}

- (void)channelNotifyDidInstallPlaceholder
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ASDClipRequest *)self->_request uniqueID];
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session did install placeholder", (uint8_t *)&v8, 0xCu);
  }
  id v5 = [(ASDClipSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ASDClipSession *)self delegate];
    [v7 clipSessionDidInstallPlaceholder:self];
  }
}

- (void)channelNotifyDidProgress:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = [(ASDClipRequest *)self->_request uniqueID];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_INFO, "[%{public}@] Session received progress: %.2f", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(ASDClipSession *)self delegate];
  [v7 clipSession:self didUpdateProgress:a3];
}

- (void)_dispatchFailWithError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v5 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__ASDClipSession__dispatchFailWithError___block_invoke;
      block[3] = &unk_1E58B2FA8;
      id v7 = WeakRetained;
      uint64_t v8 = a1;
      id v9 = v3;
      dispatch_async(v5, block);
    }
  }
}

uint64_t __41__ASDClipSession__dispatchFailWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clipSession:*(void *)(a1 + 40) didFailWithError:*(void *)(a1 + 48)];
}

uint64_t __45__ASDClipSession__dispatchHandler_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __46__ASDClipSession__establishBoostingConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ASDClipSession__establishBoostingConnection__block_invoke_2;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __46__ASDClipSession__establishBoostingConnection__block_invoke_2(uint64_t a1)
{
}

void __46__ASDClipSession__establishBoostingConnection__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ASDClipSession__establishBoostingConnection__block_invoke_4;
  block[3] = &unk_1E58B50C8;
  char v11 = a2;
  void block[4] = v6;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __46__ASDClipSession__establishBoostingConnection__block_invoke_4(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 24) uniqueID];
    int v4 = 138543362;
    id v5 = v3;
    _os_log_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session boosting dropped", (uint8_t *)&v4, 0xCu);
  }
  if (!*(unsigned char *)(a1 + 48)) {
    -[ASDClipSession _dispatchFailWithError:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  }
}

- (ASDClipSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASDClipSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_broker, 0);
}

@end