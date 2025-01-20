@interface ATProvisioningHandler
- (id)_paramsForRequest:(id)a3;
- (id)initAsEndpointType:(int)a3;
- (void)_processProvisioningRequest:(id)a3 withParams:(id)a4 onMessageLink:(id)a5 withCompletion:(id)a6;
- (void)_processProvisioningResponse:(id)a3 toCommand:(id)a4 onMessageLink:(id)a5;
- (void)_processProvisioningResponse:(id)a3 withParams:(id)a4 onMessageLink:(id)a5 withCompletion:(id)a6;
- (void)_sendProvisioningRequest:(id)a3 OnMessageLink:(id)a4;
- (void)messageLink:(id)a3 didReceiveRequest:(id)a4;
- (void)messageLinkWasOpened:(id)a3;
@end

@implementation ATProvisioningHandler

- (void).cxx_destruct
{
}

- (id)_paramsForRequest:(id)a3
{
  return 0;
}

- (void)_processProvisioningResponse:(id)a3 withParams:(id)a4 onMessageLink:(id)a5 withCompletion:(id)a6
{
}

- (void)_processProvisioningRequest:(id)a3 withParams:(id)a4 onMessageLink:(id)a5 withCompletion:(id)a6
{
}

- (void)_processProvisioningResponse:(id)a3 toCommand:(id)a4 onMessageLink:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 parameters];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__ATProvisioningHandler__processProvisioningResponse_toCommand_onMessageLink___block_invoke;
  v13[3] = &unk_1E6B8BD40;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  [(ATProvisioningHandler *)self _processProvisioningResponse:v12 withParams:v10 onMessageLink:v11 withCompletion:v13];
}

void __78__ATProvisioningHandler__processProvisioningResponse_toCommand_onMessageLink___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 48);
      int v10 = 138543874;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_ERROR, "failed to process provisioning response to command %{public}@ on %{public}@ - closing. err=%{public}@", (uint8_t *)&v10, 0x20u);
    }

    [*(id *)(a1 + 48) close];
  }
  else
  {
    if ([*(id *)(a1 + 32) isEqualToString:@"ProvisioningRegisterEndpoint"])
    {
      v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = @"ProvisioningCreateSession";
    }
    else
    {
      if (![*(id *)(a1 + 32) isEqualToString:@"ProvisioningCreateSession"])
      {
        [*(id *)(a1 + 48) setInitialized:1];
        goto LABEL_11;
      }
      v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = @"ProvisioningBeginSession";
    }
    [v7 _sendProvisioningRequest:v9 OnMessageLink:v8];
  }
LABEL_11:
}

- (void)_sendProvisioningRequest:(id)a3 OnMessageLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F4A2D0]);
  id v9 = [(ATProvisioningHandler *)self _paramsForRequest:v6];
  int v10 = (void *)[v8 initWithCommand:v6 dataClass:@"Provisioning" parameters:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__ATProvisioningHandler__sendProvisioningRequest_OnMessageLink___block_invoke;
  v13[3] = &unk_1E6B8BD18;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v11 sendRequest:v10 withCompletion:v13];
}

void __64__ATProvisioningHandler__sendProvisioningRequest_OnMessageLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v5 isPartial] & 1) == 0)
  {
    if (v6)
    {
      id v7 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 48);
        int v9 = 138543618;
        uint64_t v10 = v8;
        __int16 v11 = 2114;
        id v12 = v6;
        _os_log_impl(&dword_1D9BC7000, v7, OS_LOG_TYPE_ERROR, "failed to send provisioning request on %{public}@ - closing. err=%{public}@", (uint8_t *)&v9, 0x16u);
      }

      [*(id *)(a1 + 48) close];
    }
    else
    {
      [*(id *)(a1 + 32) _processProvisioningResponse:v5 toCommand:*(void *)(a1 + 40) onMessageLink:*(void *)(a1 + 48)];
    }
  }
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isInitialized] & 1) != 0
    || ([v7 command],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqualToString:self->_expectedRequestCommand],
        v8,
        (v9 & 1) == 0))
  {
    uint64_t v10 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [v7 command];
      expectedRequestCommand = self->_expectedRequestCommand;
      *(_DWORD *)buf = 138543874;
      v22 = v11;
      __int16 v23 = 2114;
      v24 = expectedRequestCommand;
      __int16 v25 = 1024;
      int v26 = [v6 isInitialized];
      _os_log_impl(&dword_1D9BC7000, v10, OS_LOG_TYPE_DEFAULT, "received unexpected provisioning request %{public}@. expected %{public}@, isInitialized=%d", buf, 0x1Cu);
    }
    [v6 close];
  }
  uint64_t v13 = [v7 command];
  id v14 = [v7 parameters];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__ATProvisioningHandler_messageLink_didReceiveRequest___block_invoke;
  v17[3] = &unk_1E6B8BCF0;
  id v18 = v6;
  id v19 = v7;
  v20 = self;
  id v15 = v7;
  id v16 = v6;
  [(ATProvisioningHandler *)self _processProvisioningRequest:v13 withParams:v14 onMessageLink:v16 withCompletion:v17];
}

void __55__ATProvisioningHandler_messageLink_didReceiveRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    id v25 = v8;
    _os_log_impl(&dword_1D9BC7000, v7, OS_LOG_TYPE_DEFAULT, "messageLink -> %{public}@", buf, 0xCu);
  }

  if (!v5)
  {
    uint64_t v10 = [*(id *)(a1 + 40) command];
    int v11 = [v10 isEqualToString:@"ProvisioningRegisterEndpoint"];

    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void **)(v12 + 16);
      id v14 = @"ProvisioningCreateSession";
    }
    else
    {
      id v15 = [*(id *)(a1 + 40) command];
      int v16 = [v15 isEqualToString:@"ProvisioningCreateSession"];

      if (!v16)
      {
LABEL_12:
        v17 = *(void **)(a1 + 32);
        id v18 = [*(id *)(a1 + 40) responseWithError:0 parameters:v6];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __55__ATProvisioningHandler_messageLink_didReceiveRequest___block_invoke_7;
        v21[3] = &unk_1E6B8BCC8;
        id v22 = *(id *)(a1 + 32);
        id v23 = *(id *)(a1 + 40);
        [v17 sendResponse:v18 withCompletion:v21];

        goto LABEL_13;
      }
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void **)(v12 + 16);
      id v14 = @"ProvisioningBeginSession";
    }
    *(void *)(v12 + 16) = v14;

    goto LABEL_12;
  }
  char v9 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v5;
    _os_log_impl(&dword_1D9BC7000, v9, OS_LOG_TYPE_ERROR, "failed to provision link - closing. err=%{public}@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) close];
LABEL_13:
  id v19 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    id v25 = v20;
    _os_log_impl(&dword_1D9BC7000, v19, OS_LOG_TYPE_DEFAULT, "messageLink -> %{public}@", buf, 0xCu);
  }
}

void __55__ATProvisioningHandler_messageLink_didReceiveRequest___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v3;
      _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_ERROR, "error sending response to provision message link. err=%{public}@", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 32) close];
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) command];
    char v6 = [v5 isEqualToString:@"ProvisioningRegisterEndpoint"];

    if ((v6 & 1) == 0)
    {
      id v7 = [*(id *)(a1 + 40) command];
      int v8 = [v7 isEqualToString:@"ProvisioningBeginSession"];

      if (v8) {
        [*(id *)(a1 + 32) setInitialized:1];
      }
    }
  }
}

- (void)messageLinkWasOpened:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int endpointType = self->_endpointType;
  char v6 = _ATLogCategoryFramework();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (endpointType == 1)
  {
    if (v7)
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_1D9BC7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ opened - starting provisioning", (uint8_t *)&v8, 0xCu);
    }

    [(ATProvisioningHandler *)self _sendProvisioningRequest:@"ProvisioningRegisterEndpoint" OnMessageLink:v4];
  }
  else
  {
    if (v7)
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_1D9BC7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ opened - waiting for provisioning message from server", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)initAsEndpointType:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ATProvisioningHandler;
  id v4 = [(ATProvisioningHandler *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    v4->_int endpointType = a3;
    expectedRequestCommand = v4->_expectedRequestCommand;
    v4->_expectedRequestCommand = (NSString *)@"ProvisioningRegisterEndpoint";
  }
  return v5;
}

@end