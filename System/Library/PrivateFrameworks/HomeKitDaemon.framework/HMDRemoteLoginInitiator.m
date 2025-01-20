@interface HMDRemoteLoginInitiator
+ (id)logCategory;
- (HMDRemoteLoginAnisetteDataProviderBridge)anisetteProviderBridge;
- (HMDRemoteLoginInitiator)initWithUUID:(id)a3 accessory:(id)a4 remoteLoginHandler:(id)a5;
- (HMDRemoteLoginInitiatorSession)loginSession;
- (HMDRemoteLoginMessageSender)remoteMessageSender;
- (void)_callCompletion:(id)a3 loggedInAccount:(id)a4 authSession:(id)a5;
- (void)_companionLoginWithSessionID:(id)a3 account:(id)a4 remoteDevice:(id)a5 completion:(id)a6;
- (void)_handleProxyDeviceResponse:(id)a3 error:(id)a4 message:(id)a5;
- (void)_handleRemoteLoginCompanionAuthentication:(id)a3;
- (void)_handleRemoteLoginProxiedDevice:(id)a3;
- (void)_handleRemoteLoginProxyAuthentication:(id)a3;
- (void)_handleRemoteLoginSignout:(id)a3;
- (void)_handleSignoutResponse:(id)a3 error:(id)a4 message:(id)a5;
- (void)_proxyLoginWithSessionID:(id)a3 authResults:(id)a4 remoteDevice:(id)a5 completion:(id)a6;
- (void)_resetCurrentSession:(id)a3;
- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4;
- (void)didCompleteAuthentication:(id)a3 error:(id)a4 loggedInAccount:(id)a5;
- (void)registerForMessages;
- (void)setAnisetteProviderBridge:(id)a3;
- (void)setLoginSession:(id)a3;
- (void)setRemoteMessageSender:(id)a3;
@end

@implementation HMDRemoteLoginInitiator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMessageSender, 0);
  objc_storeStrong((id *)&self->_anisetteProviderBridge, 0);
  objc_storeStrong((id *)&self->_loginSession, 0);
}

- (void)setRemoteMessageSender:(id)a3
{
}

- (HMDRemoteLoginMessageSender)remoteMessageSender
{
  return self->_remoteMessageSender;
}

- (void)setAnisetteProviderBridge:(id)a3
{
}

- (HMDRemoteLoginAnisetteDataProviderBridge)anisetteProviderBridge
{
  return self->_anisetteProviderBridge;
}

- (void)setLoginSession:(id)a3
{
}

- (HMDRemoteLoginInitiatorSession)loginSession
{
  return self->_loginSession;
}

- (void)didCompleteAuthentication:(id)a3 error:(id)a4 loggedInAccount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMDRemoteLoginBase *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__HMDRemoteLoginInitiator_didCompleteAuthentication_error_loggedInAccount___block_invoke;
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

void __75__HMDRemoteLoginInitiator_didCompleteAuthentication_error_loggedInAccount___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) loginSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  v5 = [v4 remoteAuthentication];
  v6 = *(void **)(a1 + 40);

  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5 == v6)
  {
    if (v10)
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      int v16 = 138543874;
      id v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@%@ has completed with error %@", (uint8_t *)&v16, 0x20u);
    }
    [*(id *)(a1 + 32) _callCompletion:*(void *)(a1 + 48) loggedInAccount:*(void *)(a1 + 56) authSession:v4];
  }
  else
  {
    if (v10)
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 48);
      int v16 = 138543618;
      id v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Received completion from unknown remote authentication with error %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)_resetCurrentSession:(id)a3
{
}

- (void)_callCompletion:(id)a3 loggedInAccount:(id)a4 authSession:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v15 = [(HMDRemoteLoginInitiator *)v12 loginSession];
    int v25 = 138543874;
    v26 = v14;
    __int16 v27 = 2112;
    v28 = v15;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Login session %@ has ended with error %@", (uint8_t *)&v25, 0x20u);
  }
  int v16 = [v10 completion];

  if (v16)
  {
    id v17 = [v10 completion];
    ((void (**)(void, id, id))v17)[2](v17, v8, v9);
  }
  if (v9)
  {
    __int16 v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = v12;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      uint64_t v22 = [(HMDRemoteLoginBase *)v19 remoteLoginHandler];
      v23 = [v22 loggedInAccount];
      int v25 = 138543874;
      v26 = v21;
      __int16 v27 = 2112;
      v28 = v23;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating the logged in account from %@ to %@", (uint8_t *)&v25, 0x20u);
    }
    v24 = [(HMDRemoteLoginBase *)v19 remoteLoginHandler];
    [v24 _updateLoggedInAccount:v9];
  }
  [(HMDRemoteLoginInitiator *)v12 _resetCurrentSession:v8];
}

- (void)_handleSignoutResponse:(id)a3 error:(id)a4 message:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v19 = 138543874;
    __int16 v20 = v14;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received proxy device response %@ and error %@", (uint8_t *)&v19, 0x20u);
  }
  if (v9)
  {
    id v15 = v9;
  }
  else
  {
    int v16 = [(HMDRemoteLoginBase *)v12 remoteLoginHandler];
    [v16 _updateLoggedInAccount:0];
  }
  id v17 = [v10 responseHandler];

  if (v17)
  {
    __int16 v18 = [v10 responseHandler];
    ((void (**)(void, id, void))v18)[2](v18, v9, 0);
  }
  [(HMDRemoteLoginInitiator *)v12 _resetCurrentSession:v9];
}

- (void)_handleRemoteLoginSignout:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 stringForKey:@"kRemoteLoginSessionID"];
  v6 = [(HMDRemoteLoginInitiatorSession *)[HMDRemoteLoginInitiatorSignoutSession alloc] initWithSessionID:v5];
  [(HMDRemoteLoginInitiator *)self setLoginSession:v6];
  v7 = [(HMRemoteLoginMessage *)[HMDRemoteLoginSignoutRequest alloc] initWithSessionID:v5];
  id v8 = [(HMDRemoteLoginSignoutRequest *)v7 messageName];
  __int16 v18 = v8;
  id v9 = encodeRootObject();
  v19[0] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  objc_initWeak(&location, self);
  v11 = [(HMDRemoteLoginInitiator *)self remoteMessageSender];
  uint64_t v12 = [(HMDRemoteLoginSignoutRequest *)v7 messageName];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__HMDRemoteLoginInitiator__handleRemoteLoginSignout___block_invoke;
  v14[3] = &unk_264A2D420;
  objc_copyWeak(&v16, &location);
  id v13 = v4;
  id v15 = v13;
  [v11 sendRemoteMessageWithName:v12 payload:v10 responseHandler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __53__HMDRemoteLoginInitiator__handleRemoteLoginSignout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleSignoutResponse:v6 error:v7 message:*(void *)(a1 + 32)];
}

- (void)_proxyLoginWithSessionID:(id)a3 authResults:(id)a4 remoteDevice:(id)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [HMDRemoteLoginInitiatorProxyAuthentication alloc];
  id v15 = [(HMDRemoteLoginBase *)self workQueue];
  id v16 = [(HMDRemoteLoginInitiator *)self remoteMessageSender];
  id v17 = [(HMDRemoteLoginInitiatorProxyAuthentication *)v14 initWithSessionID:v10 remoteDevice:v12 workQueue:v15 remoteMessageSender:v16 delegate:self authResults:v11];

  __int16 v18 = [[HMDRemoteLoginInitiatorAuthenticationSession alloc] initWithSessionID:v10 remoteAuthentication:v17 completion:v13];
  int v19 = (void *)MEMORY[0x230FBD990]([(HMDRemoteLoginInitiator *)self setLoginSession:v18]);
  __int16 v20 = self;
  __int16 v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = HMFGetLogIdentifier();
    int v24 = 138543618;
    uint64_t v25 = v22;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Created the proxy login with Session ID: %@", (uint8_t *)&v24, 0x16u);
  }
  __int16 v23 = [(HMDRemoteLoginInitiatorAuthenticationSession *)v18 remoteAuthentication];
  [v23 authenticate];
}

- (void)_handleRemoteLoginProxyAuthentication:(id)a3
{
  v30[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 stringForKey:@"kRemoteLoginSessionID"];
  id v6 = [v4 dataForKey:@"kRemoteLoginAuthResults"];
  id v7 = (void *)MEMORY[0x263F08928];
  id v8 = (void *)MEMORY[0x263EFFA08];
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  id v10 = [v8 setWithArray:v9];
  id v25 = 0;
  id v11 = [v7 unarchivedObjectOfClasses:v10 fromData:v6 error:&v25];
  id v12 = v25;

  if (!v11)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v16;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive authentication results from results data: %@", buf, 0x16u);
    }
  }
  id v17 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v18 = v17;
  }
  else {
    __int16 v18 = 0;
  }
  id v19 = v18;

  __int16 v20 = [(HMDRemoteLoginBase *)self accessory];
  __int16 v21 = [v20 device];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __65__HMDRemoteLoginInitiator__handleRemoteLoginProxyAuthentication___block_invoke;
  v23[3] = &unk_264A19B80;
  id v24 = v4;
  id v22 = v4;
  [(HMDRemoteLoginInitiator *)self _proxyLoginWithSessionID:v5 authResults:v19 remoteDevice:v21 completion:v23];
}

void __65__HMDRemoteLoginInitiator__handleRemoteLoginProxyAuthentication___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) responseHandler];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) responseHandler];
    id v8 = [v5 messagePayload];
    ((void (**)(void, id, void *))v7)[2](v7, v9, v8);
  }
}

- (void)_handleProxyDeviceResponse:(id)a3 error:(id)a4 message:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v17 = +[HMDRemoteLoginProxyDeviceResponse objWithDict:v8];
    __int16 v18 = v17;
    if (v17)
    {
      id v19 = [v17 error];

      if (!v19)
      {
        id v29 = [v18 proxyDevice];
        id v30 = (void *)MEMORY[0x230FBD990]();
        uint64_t v31 = self;
        v32 = HMFGetOSLogHandle();
        v33 = v32;
        if (v29)
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v34 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v42 = v34;
            __int16 v43 = 2112;
            id v44 = v29;
            _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Received proxy device response with device: %@", buf, 0x16u);
          }
          v39 = @"kRemoteLoginProxiedDevice";
          v35 = encodeRootObject();
          v40 = v35;
          id v16 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

          id v15 = 0;
        }
        else
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v42 = v36;
            _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Received proxy device response with no device", buf, 0xCu);
          }
          id v15 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
          id v16 = 0;
        }

        goto LABEL_22;
      }
      __int16 v20 = (void *)MEMORY[0x230FBD990]();
      __int16 v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v42 = v23;
        __int16 v43 = 2112;
        id v44 = 0;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received proxy device response with response error: %@", buf, 0x16u);
      }
      uint64_t v24 = [v18 error];
    }
    else
    {
      id v25 = (void *)MEMORY[0x230FBD990]();
      __int16 v26 = self;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v42 = v28;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Received proxy device response with invalid payload", buf, 0xCu);
      }
      uint64_t v24 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
    }
    id v15 = (id)v24;
    id v16 = 0;
LABEL_22:

    goto LABEL_23;
  }
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v42 = v14;
    __int16 v43 = 2112;
    id v44 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Received proxy device response with error %@", buf, 0x16u);
  }
  id v15 = v9;
  id v16 = 0;
LABEL_23:
  v37 = objc_msgSend(v10, "responseHandler", v39);

  if (v37)
  {
    v38 = [v10 responseHandler];
    ((void (**)(void, id, void *))v38)[2](v38, v15, v16);
  }
  [(HMDRemoteLoginInitiator *)self _resetCurrentSession:v15];
}

- (void)_handleRemoteLoginProxiedDevice:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 stringForKey:@"kRemoteLoginSessionID"];
  id v6 = [[HMDRemoteLoginInitiatorSession alloc] initWithSessionID:v5];
  [(HMDRemoteLoginInitiator *)self setLoginSession:v6];
  id v7 = [(HMRemoteLoginMessage *)[HMDRemoteLoginProxyDeviceRequest alloc] initWithSessionID:v5];
  id v8 = [(HMDRemoteLoginProxyDeviceRequest *)v7 messageName];
  __int16 v18 = v8;
  id v9 = encodeRootObject();
  v19[0] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  objc_initWeak(&location, self);
  id v11 = [(HMDRemoteLoginInitiator *)self remoteMessageSender];
  id v12 = [(HMDRemoteLoginProxyDeviceRequest *)v7 messageName];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__HMDRemoteLoginInitiator__handleRemoteLoginProxiedDevice___block_invoke;
  v14[3] = &unk_264A2D420;
  objc_copyWeak(&v16, &location);
  id v13 = v4;
  id v15 = v13;
  [v11 sendRemoteMessageWithName:v12 payload:v10 responseHandler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __59__HMDRemoteLoginInitiator__handleRemoteLoginProxiedDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleProxyDeviceResponse:v6 error:v7 message:*(void *)(a1 + 32)];
}

- (void)_companionLoginWithSessionID:(id)a3 account:(id)a4 remoteDevice:(id)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [HMDRemoteLoginInitiatorCompanionAuthentication alloc];
  id v15 = [(HMDRemoteLoginBase *)self workQueue];
  id v16 = [(HMDRemoteLoginInitiator *)self remoteMessageSender];
  id v17 = [(HMDRemoteLoginInitiatorCompanionAuthentication *)v14 initWithSessionID:v10 remoteDevice:v12 workQueue:v15 remoteMessageSender:v16 delegate:self account:v11];

  __int16 v18 = [[HMDRemoteLoginInitiatorAuthenticationSession alloc] initWithSessionID:v10 remoteAuthentication:v17 completion:v13];
  id v19 = (void *)MEMORY[0x230FBD990]([(HMDRemoteLoginInitiator *)self setLoginSession:v18]);
  __int16 v20 = self;
  __int16 v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = HMFGetLogIdentifier();
    int v24 = 138543618;
    id v25 = v22;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Created the companion login with Session ID: %@", (uint8_t *)&v24, 0x16u);
  }
  __int16 v23 = [(HMDRemoteLoginInitiatorAuthenticationSession *)v18 remoteAuthentication];
  [v23 authenticate];
}

- (void)_handleRemoteLoginCompanionAuthentication:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 stringForKey:@"kRemoteLoginSessionID"];
  id v6 = [v4 dataForKey:@"kRemoteLoginAccount"];
  id v18 = 0;
  id v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v18];
  id v8 = v18;
  if (!v7)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v20 = v12;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive account from account data: %@", buf, 0x16u);
    }
  }
  id v13 = [(HMDRemoteLoginBase *)self accessory];
  uint64_t v14 = [v13 device];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__HMDRemoteLoginInitiator__handleRemoteLoginCompanionAuthentication___block_invoke;
  v16[3] = &unk_264A19B80;
  id v17 = v4;
  id v15 = v4;
  [(HMDRemoteLoginInitiator *)self _companionLoginWithSessionID:v5 account:v7 remoteDevice:v14 completion:v16];
}

void __69__HMDRemoteLoginInitiator__handleRemoteLoginCompanionAuthentication___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) responseHandler];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) responseHandler];
    id v8 = [v5 messagePayload];
    ((void (**)(void, id, void *))v7)[2](v7, v9, v8);
  }
}

- (void)registerForMessages
{
  void v19[2] = *MEMORY[0x263EF8340];
  v3 = [(HMDRemoteLoginBase *)self accessory];
  id v4 = [v3 home];
  id v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:4 remoteAccessRequired:0];

  id v6 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  id v7 = [(HMDRemoteLoginBase *)self msgDispatcher];
  v19[0] = v5;
  v19[1] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  [v7 registerForMessage:@"kRemoteLoginCompanionAuthentication" receiver:self policies:v8 selector:sel__handleRemoteLoginCompanionAuthentication_];

  id v9 = [(HMDRemoteLoginBase *)self msgDispatcher];
  v18[0] = v5;
  v18[1] = v6;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  [v9 registerForMessage:@"kRemoteLoginQueryProxiedDevice" receiver:self policies:v10 selector:sel__handleRemoteLoginProxiedDevice_];

  id v11 = [(HMDRemoteLoginBase *)self msgDispatcher];
  v17[0] = v5;
  v17[1] = v6;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  [v11 registerForMessage:@"kRemoteLoginProxyAuthentication" receiver:self policies:v12 selector:sel__handleRemoteLoginProxyAuthentication_];

  id v13 = [(HMDRemoteLoginBase *)self msgDispatcher];
  v16[0] = v5;
  v16[1] = v6;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  [v13 registerForMessage:@"kRemoteLoginSignout" receiver:self policies:v14 selector:sel__handleRemoteLoginSignout_];

  id v15 = [(HMDRemoteLoginInitiator *)self anisetteProviderBridge];
  [v15 registerForMessages];
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)HMDRemoteLoginInitiator;
  id v6 = a4;
  id v7 = a3;
  [(HMDRemoteLoginBase *)&v18 configureWithWorkQueue:v7 messageDispatcher:v6];
  id v8 = [(HMDRemoteLoginBase *)self accessory];
  id v9 = [v8 home];
  id v10 = [v9 homeManager];
  id v11 = [v10 messageDispatcher];

  id v12 = [HMDRemoteLoginMessageSender alloc];
  id v13 = [(HMDRemoteLoginBase *)self uuid];
  uint64_t v14 = [(HMDRemoteLoginBase *)self workQueue];
  id v15 = [(HMDRemoteLoginMessageSender *)v12 initWithTarget:v13 accessory:v8 device:0 workQueue:v14 messageDispatcher:v11];
  [(HMDRemoteLoginInitiator *)self setRemoteMessageSender:v15];

  id v16 = [(HMDRemoteLoginInitiator *)self anisetteProviderBridge];
  id v17 = [(HMDRemoteLoginInitiator *)self remoteMessageSender];
  [v16 configureWithWorkQueue:v7 messageDispatcher:v6 remoteMessageSender:v17];
}

- (HMDRemoteLoginInitiator)initWithUUID:(id)a3 accessory:(id)a4 remoteLoginHandler:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDRemoteLoginInitiator;
  id v9 = [(HMDRemoteLoginBase *)&v13 initWithUUID:v8 accessory:a4 remoteLoginHandler:a5];
  if (v9)
  {
    id v10 = [[HMDRemoteLoginAnisetteDataProviderBridge alloc] initWithUUID:v8];
    anisetteProviderBridge = v9->_anisetteProviderBridge;
    v9->_anisetteProviderBridge = v10;
  }
  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_45222 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_45222, &__block_literal_global_45223);
  }
  v2 = (void *)logCategory__hmf_once_v1_45224;
  return v2;
}

void __38__HMDRemoteLoginInitiator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_45224;
  logCategory__hmf_once_v1_45224 = v0;
}

@end