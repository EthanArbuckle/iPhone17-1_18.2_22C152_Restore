@interface HMDAuthServer
+ (id)logCategory;
- (BOOL)resumeRetryIfPending;
- (HMDAuthServer)initWithDelegate:(id)a3;
- (HMDAuthServerDelegate)delegate;
- (HMFTimer)retryTimer;
- (MFAATokenManager)tokenManager;
- (NSData)token;
- (NSLocale)locale;
- (NSString)model;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)context;
- (int64_t)retryCount;
- (unint64_t)authFeatures;
- (unint64_t)currentOperation;
- (void)_handleResponseMetadata:(id)a3 ppid:(id)a4 locale:(id)a5 context:(id)a6 error:(id)a7;
- (void)_reportFailureWithContext:(id)a3 error:(id)a4;
- (void)getPPIDInfo:(id)a3 model:(id)a4 cert:(id)a5 context:(id)a6;
- (void)resetRetryOperation;
- (void)retryOrReportFailure:(id)a3 context:(id)a4;
- (void)saveRetryOperation:(unint64_t)a3 token:(id)a4 authFeatures:(unint64_t)a5 uuid:(id)a6 context:(id)a7 locale:(id)a8 model:(id)a9;
- (void)sendActivationConfirmation:(id)a3 uuid:(id)a4 context:(id)a5;
- (void)sendActivationRequest:(id)a3 uuid:(id)a4 context:(id)a5;
- (void)sendPPIDInfoRequest:(id)a3 model:(id)a4 token:(id)a5 authFeatures:(unint64_t)a6 uuid:(id)a7 context:(id)a8;
- (void)setAuthFeatures:(unint64_t)a3;
- (void)setContext:(id)a3;
- (void)setCurrentOperation:(unint64_t)a3;
- (void)setLocale:(id)a3;
- (void)setModel:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setRetryTimer:(id)a3;
- (void)setToken:(id)a3;
- (void)setUuid:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDAuthServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_tokenManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCurrentOperation:(unint64_t)a3
{
  self->_currentOperation = a3;
}

- (unint64_t)currentOperation
{
  return self->_currentOperation;
}

- (void)setAuthFeatures:(unint64_t)a3
{
  self->_authFeatures = a3;
}

- (unint64_t)authFeatures
{
  return self->_authFeatures;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setToken:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setContext:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void)setModel:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryTimer:(id)a3
{
}

- (HMFTimer)retryTimer
{
  return self->_retryTimer;
}

- (MFAATokenManager)tokenManager
{
  return (MFAATokenManager *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDAuthServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAuthServerDelegate *)WeakRetained;
}

- (void)sendActivationConfirmation:(id)a3 uuid:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMDAuthServer *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__HMDAuthServer_sendActivationConfirmation_uuid_context___block_invoke;
  v15[3] = &unk_264A2E610;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __57__HMDAuthServer_sendActivationConfirmation_uuid_context___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) saveRetryOperation:3 token:*(void *)(a1 + 40) authFeatures:0 uuid:*(void *)(a1 + 48) context:*(void *)(a1 + 56) locale:0 model:0];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) tokenManager];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) UUIDString];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__HMDAuthServer_sendActivationConfirmation_uuid_context___block_invoke_2;
  v5[3] = &unk_264A2CB70;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 56);
  [v2 confirmActivationForAuthToken:v3 withUUID:v4 completionHandler:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __57__HMDAuthServer_sendActivationConfirmation_uuid_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__HMDAuthServer_sendActivationConfirmation_uuid_context___block_invoke_3;
    block[3] = &unk_264A2F2F8;
    id v8 = v3;
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v6, block);
  }
}

void __57__HMDAuthServer_sendActivationConfirmation_uuid_context___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 40);
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 32);
      int v15 = 138543618;
      id v16 = v5;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@Activation confirmation with server failed with error: %@", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(a1 + 40) retryOrReportFailure:*(void *)(a1 + 32) context:*(void *)(a1 + 48)];
  }
  else
  {
    [*(id *)(a1 + 40) resetRetryOperation];
    id v7 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector())
    {
      [v7 didFinishActivation:0 context:*(void *)(a1 + 48)];
    }
    else
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 40);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = HMFGetLogIdentifier();
        int v15 = 138543362;
        id v16 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement didFinishActivation:context:", (uint8_t *)&v15, 0xCu);
      }
      id v13 = *(void **)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      id v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:-1 userInfo:0];
      [v13 _reportFailureWithContext:v12 error:v14];
    }
  }
}

- (void)sendActivationRequest:(id)a3 uuid:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMDAuthServer *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__HMDAuthServer_sendActivationRequest_uuid_context___block_invoke;
  v15[3] = &unk_264A2E610;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __52__HMDAuthServer_sendActivationRequest_uuid_context___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) saveRetryOperation:2 token:*(void *)(a1 + 40) authFeatures:0 uuid:*(void *)(a1 + 48) context:*(void *)(a1 + 56) locale:0 model:0];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) tokenManager];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) UUIDString];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__HMDAuthServer_sendActivationRequest_uuid_context___block_invoke_2;
  v5[3] = &unk_264A1E640;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 56);
  [v2 requestActivationForAuthToken:v3 withUUID:v4 completionHandler:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__HMDAuthServer_sendActivationRequest_uuid_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained workQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__HMDAuthServer_sendActivationRequest_uuid_context___block_invoke_3;
    v10[3] = &unk_264A2E610;
    id v11 = v6;
    id v12 = v8;
    id v13 = v5;
    id v14 = *(id *)(a1 + 32);
    dispatch_async(v9, v10);
  }
}

void __52__HMDAuthServer_sendActivationRequest_uuid_context___block_invoke_3(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) resetRetryOperation];
    id v7 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector())
    {
      if ([*(id *)(a1 + 48) length])
      {
        [v7 handleActivationResponse:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
LABEL_14:

        return;
      }
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 40);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        uint64_t v15 = *(void *)(a1 + 48);
        int v19 = 138543618;
        v20 = v11;
        __int16 v21 = 2112;
        uint64_t v22 = v15;
        id v12 = "%{public}@Invalid tokens in activation response: %@";
        id v13 = v10;
        uint32_t v14 = 22;
        goto LABEL_12;
      }
    }
    else
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 40);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        int v19 = 138543362;
        v20 = v11;
        id v12 = "%{public}@Delegate does not implement handleActivationResponse:context:";
        id v13 = v10;
        uint32_t v14 = 12;
LABEL_12:
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v19, v14);
      }
    }

    id v16 = *(void **)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 56);
    id v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:-1 userInfo:0];
    [v16 _reportFailureWithContext:v17 error:v18];

    goto LABEL_14;
  }
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 40);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 32);
    int v19 = 138543618;
    v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@Activation with server failed with error: %@", (uint8_t *)&v19, 0x16u);
  }
  [*(id *)(a1 + 40) retryOrReportFailure:*(void *)(a1 + 32) context:*(void *)(a1 + 56)];
}

- (void)sendPPIDInfoRequest:(id)a3 model:(id)a4 token:(id)a5 authFeatures:(unint64_t)a6 uuid:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  int v19 = [(HMDAuthServer *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__HMDAuthServer_sendPPIDInfoRequest_model_token_authFeatures_uuid_context___block_invoke;
  block[3] = &unk_264A2BAA0;
  void block[4] = self;
  id v26 = v16;
  id v30 = v15;
  unint64_t v31 = a6;
  id v27 = v17;
  id v28 = v18;
  id v29 = v14;
  id v20 = v15;
  id v21 = v14;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  dispatch_async(v19, block);
}

void __75__HMDAuthServer_sendPPIDInfoRequest_model_token_authFeatures_uuid_context___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) saveRetryOperation:1 token:*(void *)(a1 + 40) authFeatures:*(void *)(a1 + 80) uuid:*(void *)(a1 + 48) context:*(void *)(a1 + 56) locale:*(void *)(a1 + 64) model:*(void *)(a1 + 72)];
  id inited = objc_initWeak(&location, *v2);
  v4 = (void *)MEMORY[0x230FBD990](inited);
  id v5 = *v2;
  HMFGetOSLogHandle();
  uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v38 = v4;
    HMFGetLogIdentifier();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = *(void **)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    id v10 = [v9 languageCode];
    id v11 = [*(id *)(a1 + 64) countryCode];
    id v12 = [*(id *)(a1 + 64) localeIdentifier];
    id v13 = HMDSWAuthFeaturesToString(*(void *)(a1 + 80));
    *(_DWORD *)buf = 138544898;
    id v46 = v7;
    __int16 v47 = 2112;
    v48 = v9;
    __int16 v49 = 2112;
    uint64_t v50 = v8;
    __int16 v51 = 2112;
    v52 = v10;
    __int16 v53 = 2112;
    v54 = v11;
    __int16 v55 = 2112;
    v56 = v12;
    __int16 v57 = 2112;
    v58 = v13;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Requesting metadata for locale: %@, Model: %@, Language Code: %@, Country Code: %@ Identifier: %@, swAuthFeatures: %@", buf, 0x48u);

    v4 = v38;
  }

  uint64_t v14 = *(void *)(a1 + 72);
  if (v14)
  {
    v43 = @"model";
    uint64_t v44 = v14;
    id v15 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v16 = *(void *)(a1 + 80);
  if ((v16 & 1) == 0)
  {
    uint64_t v17 = 0;
    if ((v16 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  id v18 = (void *)MEMORY[0x230FBD990]();
  id v19 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    id v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v46 = v21;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Checking token for HomeKit", buf, 0xCu);
  }
  uint64_t v17 = 1;
  if ((*(void *)(a1 + 80) & 2) != 0)
  {
LABEL_12:
    id v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v46 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Checking token for AirPlayAudio", buf, 0xCu);
    }
    v17 |= 2uLL;
  }
LABEL_15:
  if ([MEMORY[0x263F52F50] isTokenValidForFeatures:v17 token:*(void *)(a1 + 40)])
  {
    id v26 = [*(id *)(a1 + 32) tokenManager];
    uint64_t v27 = *(void *)(a1 + 40);
    id v28 = [*(id *)(a1 + 48) UUIDString];
    uint64_t v29 = *(void *)(a1 + 64);
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __75__HMDAuthServer_sendPPIDInfoRequest_model_token_authFeatures_uuid_context___block_invoke_76;
    v39[3] = &unk_264A1E618;
    objc_copyWeak(&v41, &location);
    id v40 = *(id *)(a1 + 56);
    [v26 requestMetadataForAuthToken:v27 withUUID:v28 requestedLocale:v29 requestInfo:v15 completionHandler:v39];

    objc_destroyWeak(&v41);
  }
  else
  {
    id v30 = (void *)MEMORY[0x230FBD990]();
    id v31 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v32 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = HMDSWAuthFeaturesToString(*(void *)(a1 + 80));
      *(_DWORD *)buf = 138543618;
      id v46 = v33;
      __int16 v47 = 2112;
      v48 = v34;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Token validation failed for auth features: %@", buf, 0x16u);
    }
    v35 = *(void **)(a1 + 32);
    uint64_t v36 = *(void *)(a1 + 56);
    v37 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:-1 userInfo:0];
    [v35 _handleResponseMetadata:0 ppid:0 locale:0 context:v36 error:v37];
  }
  objc_destroyWeak(&location);
}

void __75__HMDAuthServer_sendPPIDInfoRequest_model_token_authFeatures_uuid_context___block_invoke_76(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleResponseMetadata:v10 ppid:v14 locale:v9 context:*(void *)(a1 + 32) error:v11];
  }
}

- (void)getPPIDInfo:(id)a3 model:(id)a4 cert:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDAuthServer *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HMDAuthServer_getPPIDInfo_model_cert_context___block_invoke;
  block[3] = &unk_264A2E908;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __48__HMDAuthServer_getPPIDInfo_model_cert_context___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  id inited = objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = (void *)MEMORY[0x230FBD990](inited);
  id v5 = *v2;
  HMFGetOSLogHandle();
  uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [v8 languageCode];
    id v11 = [*(id *)(a1 + 40) countryCode];
    id v12 = [*(id *)(a1 + 40) localeIdentifier];
    *(_DWORD *)buf = 138544642;
    id v25 = v7;
    __int16 v26 = 2112;
    uint64_t v27 = v8;
    __int16 v28 = 2112;
    uint64_t v29 = v9;
    __int16 v30 = 2112;
    id v31 = v10;
    __int16 v32 = 2112;
    id v33 = v11;
    __int16 v34 = 2112;
    v35 = v12;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Requesting Cert metadata for locale: %@, Model: %@, Language Code: %@, Country Code: %@ Identifier: %@", buf, 0x3Eu);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    id v22 = @"model";
    uint64_t v23 = v13;
    id v14 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  }
  else
  {
    id v14 = 0;
  }
  id v15 = [MEMORY[0x263F52F48] sharedManager];
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 40);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__HMDAuthServer_getPPIDInfo_model_cert_context___block_invoke_74;
  v18[3] = &unk_264A1E618;
  objc_copyWeak(&v20, &location);
  id v19 = *(id *)(a1 + 64);
  [v15 requestMetadataForCertificate:v16 requestedLocale:v17 requestInfo:v14 completionHandler:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __48__HMDAuthServer_getPPIDInfo_model_cert_context___block_invoke_74(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v13 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleResponseMetadata:v10 ppid:v14 locale:v9 context:*(void *)(a1 + 32) error:v11];
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    unint64_t v9 = [(HMDAuthServer *)v6 currentOperation];
    if (v9 > 3) {
      id v10 = @"HMDAuthServerOperationPPIDInfo";
    }
    else {
      id v10 = off_264A1E660[v9];
    }
    int v28 = 138543618;
    uint64_t v29 = v8;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Retry timer expired for operation: %@", (uint8_t *)&v28, 0x16u);
  }
  id v11 = [(HMDAuthServer *)v6 retryTimer];

  if (v11 == v4)
  {
    uint64_t v12 = [(HMDAuthServer *)v6 currentOperation];
    if (v12 != 3)
    {
      if (v12 != 2)
      {
        if (v12 != 1)
        {
          id v22 = (void *)MEMORY[0x230FBD990]();
          uint64_t v23 = v6;
          id v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            id v25 = HMFGetLogIdentifier();
            unint64_t v26 = [(HMDAuthServer *)v23 currentOperation];
            if (v26 > 3) {
              uint64_t v27 = @"HMDAuthServerOperationPPIDInfo";
            }
            else {
              uint64_t v27 = off_264A1E660[v26];
            }
            int v28 = 138543618;
            uint64_t v29 = v25;
            __int16 v30 = 2112;
            id v31 = v27;
            _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Invalid retry operation: %@", (uint8_t *)&v28, 0x16u);
          }
          [(HMDAuthServer *)v23 resetRetryOperation];
          uint64_t v13 = [(HMDAuthServer *)v23 context];
          id v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:-1 userInfo:0];
          [(HMDAuthServer *)v23 _reportFailureWithContext:v13 error:v14];
          goto LABEL_20;
        }
        uint64_t v13 = [(HMDAuthServer *)v6 locale];
        id v14 = [(HMDAuthServer *)v6 model];
        id v15 = [(HMDAuthServer *)v6 token];
        uint64_t v16 = [(HMDAuthServer *)v6 authFeatures];
        uint64_t v17 = [(HMDAuthServer *)v6 uuid];
        id v18 = [(HMDAuthServer *)v6 context];
        [(HMDAuthServer *)v6 sendPPIDInfoRequest:v13 model:v14 token:v15 authFeatures:v16 uuid:v17 context:v18];

LABEL_13:
LABEL_20:

        goto LABEL_21;
      }
      id v19 = [(HMDAuthServer *)v6 token];
      id v20 = [(HMDAuthServer *)v6 uuid];
      id v21 = [(HMDAuthServer *)v6 context];
      [(HMDAuthServer *)v6 sendActivationRequest:v19 uuid:v20 context:v21];
    }
    uint64_t v13 = [(HMDAuthServer *)v6 token];
    id v14 = [(HMDAuthServer *)v6 uuid];
    id v15 = [(HMDAuthServer *)v6 context];
    [(HMDAuthServer *)v6 sendActivationConfirmation:v13 uuid:v14 context:v15];
    goto LABEL_13;
  }
LABEL_21:
}

- (BOOL)resumeRetryIfPending
{
  id v3 = [(HMDAuthServer *)self retryTimer];

  if (v3)
  {
    id v4 = [(HMDAuthServer *)self retryTimer];
    [v4 resume];
  }
  return v3 != 0;
}

- (void)resetRetryOperation
{
  [(HMDAuthServer *)self setRetryCount:0];
  id v3 = [(HMDAuthServer *)self retryTimer];
  [v3 suspend];

  [(HMDAuthServer *)self setRetryTimer:0];
  [(HMDAuthServer *)self setCurrentOperation:0];
  [(HMDAuthServer *)self setLocale:0];
  [(HMDAuthServer *)self setModel:0];
  [(HMDAuthServer *)self setToken:0];
  [(HMDAuthServer *)self setUuid:0];
  [(HMDAuthServer *)self setContext:0];
}

- (void)saveRetryOperation:(unint64_t)a3 token:(id)a4 authFeatures:(unint64_t)a5 uuid:(id)a6 context:(id)a7 locale:(id)a8 model:(id)a9
{
  id v23 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = [(HMDAuthServer *)self retryTimer];

  if (v19)
  {
    if ([(HMDAuthServer *)self retryCount] < 1) {
      [(HMDAuthServer *)self resetRetryOperation];
    }
    else {
      [(HMDAuthServer *)self setRetryCount:[(HMDAuthServer *)self retryCount] - 1];
    }
  }
  else
  {
    id v20 = objc_alloc(MEMORY[0x263F42658]);
    id v21 = (void *)[v20 initWithTimeInterval:1 options:*(double *)&authServerRetryTimeIntervalInSeconds];
    [(HMDAuthServer *)self setRetryTimer:v21];

    id v22 = [(HMDAuthServer *)self retryTimer];
    [v22 setDelegate:self];

    [(HMDAuthServer *)self setLocale:v17];
    [(HMDAuthServer *)self setModel:v18];
    [(HMDAuthServer *)self setToken:v23];
    [(HMDAuthServer *)self setAuthFeatures:a5];
    [(HMDAuthServer *)self setUuid:v15];
    [(HMDAuthServer *)self setContext:v16];
    [(HMDAuthServer *)self setRetryCount:authServerRetryCount];
    [(HMDAuthServer *)self setCurrentOperation:a3];
  }
}

- (void)_handleResponseMetadata:(id)a3 ppid:(id)a4 locale:(id)a5 context:(id)a6 error:(id)a7
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v33 = a6;
  id v38 = a7;
  id v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v52 = v18;
    __int16 v53 = 2112;
    id v54 = v12;
    __int16 v55 = 2112;
    id v56 = v13;
    __int16 v57 = 2112;
    id v58 = v14;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Received metadata: %@ for PPID: %@, locale: %@", buf, 0x2Au);
  }
  uint64_t v36 = v13;
  v39 = v14;

  if (v12)
  {
    id v19 = objc_msgSend(v12, "hmf_stringForKey:", @"accessory_name");
    id v20 = objc_msgSend(v12, "hmf_stringForKey:", @"brand");
    id v21 = objc_msgSend(v12, "hmf_stringForKey:", @"model");
    id v22 = objc_msgSend(v12, "hmf_numberForKey:", @"category");
    id v23 = objc_msgSend(v12, "hmf_stringForKey:", @"certification_status");
    id v24 = objc_msgSend(v12, "hmf_stringForKey:", @"blacklisted_status");
  }
  else
  {
    id v19 = 0;
    id v20 = 0;
    id v21 = 0;
    id v22 = 0;
    id v23 = 0;
    id v24 = 0;
  }
  id v25 = [(HMDAuthServer *)v16 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HMDAuthServer__handleResponseMetadata_ppid_locale_context_error___block_invoke;
  block[3] = &unk_264A1E5F0;
  id v41 = v38;
  v42 = v16;
  id v43 = v19;
  id v44 = v20;
  id v45 = v21;
  id v46 = v22;
  id v47 = v23;
  id v48 = v24;
  id v49 = v36;
  id v50 = v34;
  id v35 = v34;
  id v26 = v36;
  id v27 = v24;
  id v37 = v23;
  id v28 = v22;
  id v29 = v21;
  id v30 = v20;
  id v31 = v19;
  id v32 = v38;
  dispatch_async(v25, block);
}

void __67__HMDAuthServer__handleResponseMetadata_ppid_locale_context_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to get PPID Info from server with error: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) retryOrReportFailure:*(void *)(a1 + 32) context:*(void *)(a1 + 104)];
  }
  else
  {
    [*(id *)(a1 + 40) resetRetryOperation];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F35868]) initWithName:*(void *)(a1 + 48) manufacturer:*(void *)(a1 + 56) modelName:*(void *)(a1 + 64) category:*(void *)(a1 + 72) certificationStatus:*(void *)(a1 + 80) denylisted:*(void *)(a1 + 88) ppid:*(void *)(a1 + 96)];
    uint64_t v8 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector())
    {
      [v8 handlePPIDInfoResponse:v7 context:*(void *)(a1 + 104) error:*(void *)(a1 + 32)];
    }
    else
    {
      unint64_t v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = *(id *)(a1 + 40);
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v17 = v12;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement handlePPIDInfoResponse:context:", buf, 0xCu);
      }
      id v13 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 104);
      id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:-1 userInfo:0];
      [v13 _reportFailureWithContext:v14 error:v15];
    }
  }
}

- (void)retryOrReportFailure:(id)a3 context:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 domain];
  if (![v8 isEqual:*MEMORY[0x263F52F40]])
  {

    goto LABEL_10;
  }
  uint64_t v9 = [v6 code];

  if (v9 != -5)
  {
LABEL_10:
    uint64_t v18 = 55;
LABEL_11:
    uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:v18 userInfo:0];
    [(HMDAuthServer *)self _reportFailureWithContext:v7 error:v19];

    goto LABEL_12;
  }
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = HMFGetLogIdentifier();
    int v20 = 138543362;
    id v21 = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Network unavailable", (uint8_t *)&v20, 0xCu);
  }
  if (![(HMDAuthServer *)v11 resumeRetryIfPending])
  {
    uint64_t v18 = 78;
    goto LABEL_11;
  }
  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = v11;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = HMFGetLogIdentifier();
    int v20 = 138543362;
    id v21 = v17;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Waiting to retry", (uint8_t *)&v20, 0xCu);
  }
LABEL_12:
}

- (void)_reportFailureWithContext:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failing activation", (uint8_t *)&v17, 0xCu);
  }
  id v12 = [(HMDAuthServer *)v9 delegate];
  if (objc_opt_respondsToSelector())
  {
    [v12 didFinishActivation:v7 context:v6];
  }
  else
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = v9;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      uint64_t v18 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement didFinishActivation:context:", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (HMDAuthServer)initWithDelegate:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v21 = v16;
      int v17 = "%{public}@A valid delegate is required.";
LABEL_10:
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
    }
LABEL_11:

    id v13 = 0;
    goto LABEL_12;
  }
  if (([v4 conformsToProtocol:&unk_26E586760] & 1) == 0)
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v21 = v16;
      int v17 = "%{public}@Delegate must confirm to the HMDAuthServerDelegate protocol";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDAuthServer;
  id v6 = [(HMDAuthServer *)&v19 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("HMDAuthServer", v7);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v8;

    objc_storeWeak((id *)&v6->_delegate, v5);
    uint64_t v10 = [MEMORY[0x263F52F50] sharedManager];
    tokenManager = v6->_tokenManager;
    v6->_tokenManager = (MFAATokenManager *)v10;
  }
  id v12 = v6;
  id v13 = v12;
LABEL_12:

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21_103680 != -1) {
    dispatch_once(&logCategory__hmf_once_t21_103680, &__block_literal_global_103681);
  }
  v2 = (void *)logCategory__hmf_once_v22_103682;
  return v2;
}

void __28__HMDAuthServer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v22_103682;
  logCategory__hmf_once_v22_103682 = v0;
}

@end