@interface HMTRSession
- (HMTRSession)initWithSession:(id)a3;
- (TRSession)session;
- (void)sendRequestData:(id)a3 qualityOfService:(int64_t)a4 responseHandler:(id)a5;
@end

@implementation HMTRSession

- (void).cxx_destruct
{
}

- (TRSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (TRSession *)WeakRetained;
}

- (void)sendRequestData:(id)a3 qualityOfService:(int64_t)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [[HMDeviceSetupRequestMessage alloc] initWithPayload:v8];
  [(HMDeviceSetupRequestMessage *)v10 setQualityOfService:a4];
  objc_initWeak(&location, self);
  v11 = [(HMTRSession *)self session];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__HMTRSession_sendRequestData_qualityOfService_responseHandler___block_invoke;
  v14[3] = &unk_1E5940BC0;
  objc_copyWeak(&v17, &location);
  v12 = v10;
  v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [v11 sendRequest:v12 withResponseHandler:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __64__HMTRSession_sendRequestData_qualityOfService_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v8 = (unint64_t)v5;
  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  unint64_t v11 = v10;

  v12 = (void *)v8;
  if (!(v8 | v11))
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = WeakRetained;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = *(void *)(a1 + 32);
      int v20 = 138543874;
      v21 = v16;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Received an unexpected request: %@ response: %@", (uint8_t *)&v20, 0x20u);
    }
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
  }
  uint64_t v18 = *(void *)(a1 + 40);
  v19 = [(id)v11 payload];
  (*(void (**)(uint64_t, void *, void *))(v18 + 16))(v18, v12, v19);
}

- (HMTRSession)initWithSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMTRSession;
  id v5 = [(HMTRSession *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_session, v4);
  }

  return v6;
}

@end