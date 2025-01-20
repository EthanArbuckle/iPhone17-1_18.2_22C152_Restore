@interface HMFCFHTTPServerConnection
@end

@implementation HMFCFHTTPServerConnection

void __66___HMFCFHTTPServerConnection__sendStatusCode_forRequest_bodyData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    v6 = (void *)MEMORY[0x19F3A87A0]();
    id v7 = WeakRetained;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = HMFGetLogIdentifier(v7);
      int v10 = 138543874;
      v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Failed to send internal response, %@, with error: %@", (uint8_t *)&v10, 0x20u);
    }
  }
}

void __43___HMFCFHTTPServerConnection_sendResponse___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) request];
  id v3 = (void *)MEMORY[0x19F3A87A0]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier(v4);
      uint64_t v8 = *(void *)(a1 + 32);
      int v16 = 138543618;
      v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending response: %@", (uint8_t *)&v16, 0x16u);
    }
    v9 = [v2 activity];
    [v9 markWithReason:@"Sending"];

    int v10 = [*(id *)(a1 + 40) pendingRespones];
    [v10 addObject:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) responseRef];
    _CFHTTPServerResponseEnqueue();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier(v4);
      uint64_t v12 = *(void *)(a1 + 32);
      int v16 = 138543618;
      v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_ERROR, "%{public}@The response is invalid: %@", (uint8_t *)&v16, 0x16u);
    }
    id v13 = [*(id *)(a1 + 32) completionHandler];

    if (v13)
    {
      __int16 v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      id v15 = [*(id *)(a1 + 32) completionHandler];
      ((void (**)(void, void *))v15)[2](v15, v14);

      [*(id *)(a1 + 32) setCompletionHandler:0];
    }
  }
}

uint64_t __41___HMFCFHTTPServerConnection_logCategory__block_invoke()
{
  qword_1EB4EEAC0 = HMFCreateOSLogHandle(@"Networking.HTTP.Server.Connection.Internal", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

@end