@interface HMDeviceSetupOperationHandler
- (void)_handleReceivedRequest:(id)a3 responseHandler:(id)a4;
- (void)registerMessageHandlersForSession:(id)a3;
@end

@implementation HMDeviceSetupOperationHandler

- (void)_handleReceivedRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"TRRequestMessageHandler"];
  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    v12 = (void *)MEMORY[0x19F3A64A0]([v8 markWithReason:@"Received request"]);
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Received request: %@", buf, 0x16u);
    }
    uint64_t v16 = [v11 qualityOfService];
    objc_initWeak((id *)buf, v13);
    v17 = [(HMDeviceSetupOperationHandlerBase *)v13 setupSession];
    v18 = [v11 payload];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__HMDeviceSetupOperationHandler__handleReceivedRequest_responseHandler___block_invoke;
    v24[3] = &unk_1E5943100;
    id v25 = v8;
    id v26 = v7;
    objc_copyWeak(&v27, (id *)buf);
    [v17 sendExchangeData:v18 qualityOfService:v16 completionHandler:v24];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v19 = (void *)MEMORY[0x19F3A64A0]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v22;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Received an unexpected request: %@", buf, 0x16u);
    }
    if (v7)
    {
      v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
      (*((void (**)(id, void *, void))v7 + 2))(v7, v23, 0);
    }
  }
}

void __72__HMDeviceSetupOperationHandler__handleReceivedRequest_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) begin];
  if (*(void *)(a1 + 40))
  {
    id v7 = [[HMDeviceSetupResponseMessage alloc] initWithPayload:v5];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v9 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 32) markWithReason:@"Sending response"]);
    id v10 = WeakRetained;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v12;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Sending response: %@", (uint8_t *)&v13, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  [*(id *)(a1 + 32) end];
}

- (void)registerMessageHandlersForSession:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Registering the handlers", buf, 0xCu);
  }
  v12.receiver = v6;
  v12.super_class = (Class)HMDeviceSetupOperationHandler;
  [(HMDeviceSetupOperationHandlerBase *)&v12 configureSessionForMessages];
  objc_initWeak((id *)buf, v6);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__HMDeviceSetupOperationHandler_registerMessageHandlersForSession___block_invoke;
  aBlock[3] = &unk_1E593F4A8;
  objc_copyWeak(&v11, (id *)buf);
  id v9 = _Block_copy(aBlock);
  [v4 setRequestHandler:v9 forRequestClass:objc_opt_class()];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __67__HMDeviceSetupOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleReceivedRequest:v6 responseHandler:v5];
}

@end