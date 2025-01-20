@interface HMCUMessageSessionDeviceSetupOperationHandler
- (int)convertSetupErrorToOSStatus:(id)a3;
- (void)_handleReceivedRequestDictionary:(id)a3 responseHandler:(id)a4;
- (void)registerMessageHandlersForMessageSession:(id)a3;
@end

@implementation HMCUMessageSessionDeviceSetupOperationHandler

- (int)convertSetupErrorToOSStatus:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  char v5 = [v4 isEqualToString:@"HMErrorDomain"];

  if (v5)
  {
    unsigned __int16 v6 = -27480;
  }
  else
  {
    v7 = [v3 domain];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F64ED0]];

    if (!v8)
    {
      int v9 = -6700;
      goto LABEL_7;
    }
    unsigned __int16 v6 = -15080;
  }
  int v9 = (v6 | 0x40000) + [v3 code];
LABEL_7:

  return v9;
}

- (void)_handleReceivedRequestDictionary:(id)a3 responseHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"TRRequestMessageHandler"];
  int v9 = [v6 dataForKey:@"da"];
  v10 = objc_msgSend(v6, "hmf_numberForKey:", @"qos");
  v11 = v10;
  if (v9)
  {
    if (v10) {
      uint64_t v12 = [v10 integerValue];
    }
    else {
      uint64_t v12 = -1;
    }
    v20 = (void *)MEMORY[0x19F3A64A0]([v8 markWithReason:@"Received request"]);
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Received request: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v21);
    v24 = [(HMDeviceSetupOperationHandlerBase *)v21 setupSession];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __98__HMCUMessageSessionDeviceSetupOperationHandler__handleReceivedRequestDictionary_responseHandler___block_invoke;
    v25[3] = &unk_1E5943100;
    id v26 = v8;
    objc_copyWeak(&v28, (id *)buf);
    id v27 = v7;
    [v24 sendExchangeData:v9 qualityOfService:v12 completionHandler:v25];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v16;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Received an unexpected request with no data %@", buf, 0x16u);
    }
    v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:27];
    int v18 = [v17 code];
    v29 = @"err";
    v30 = v17;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, (v18 + 300200), 0, v19);
  }
}

void __98__HMCUMessageSessionDeviceSetupOperationHandler__handleReceivedRequestDictionary_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) begin];
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [v7 setObject:v5 forKeyedSubscript:@"da"];
  [v7 setObject:v6 forKeyedSubscript:@"err"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v9 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 32) markWithReason:@"Sending response"]);
  id v10 = WeakRetained;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v12;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Sending response payload: %@", (uint8_t *)&v13, 0x16u);
  }
  if (v6) {
    [v10 convertSetupErrorToOSStatus:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) end];
}

- (void)registerMessageHandlersForMessageSession:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v13 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Registering the handlers", buf, 0xCu);
  }
  v11.receiver = v6;
  v11.super_class = (Class)HMCUMessageSessionDeviceSetupOperationHandler;
  [(HMDeviceSetupOperationHandlerBase *)&v11 configureSessionForMessages];
  objc_initWeak((id *)buf, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__HMCUMessageSessionDeviceSetupOperationHandler_registerMessageHandlersForMessageSession___block_invoke;
  v9[3] = &unk_1E59430D8;
  objc_copyWeak(&v10, (id *)buf);
  [v4 registerRequestID:@"HMDSS.cu.rq" options:0 handler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __90__HMCUMessageSessionDeviceSetupOperationHandler_registerMessageHandlersForMessageSession___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleReceivedRequestDictionary:v7 responseHandler:v6];
}

@end