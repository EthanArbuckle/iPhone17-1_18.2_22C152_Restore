@interface HMDAccessorySetupManager
+ (NSString)accessorySetupHostBundleIdentifier;
+ (id)logCategory;
- (HMDAccessorySetupCoordinator)accessorySetupCoordinator;
- (HMDAccessorySetupManager)initWithWorkQueue:(id)a3 homeManager:(id)a4;
- (HMDAccessorySetupManager)initWithWorkQueue:(id)a3 homeManager:(id)a4 xpcMessageTransport:(id)a5 messageDispatcher:(id)a6 alertHandleProvider:(id)a7;
- (HMDHomeManager)homeManager;
- (HMDSBSRemoteAlertHandle)alertHandle;
- (HMDSBSRemoteAlertHandleProvider)alertHandleProvider;
- (HMDXPCClientConnection)accessorySetupHostClientConnection;
- (HMDXPCMessageTransport)xpcMessageTransport;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (double)activationStartTime;
- (id)_accessorySetupResultFromCompletedInfo:(id)a3 clientIdentifierSalt:(id)a4;
- (id)_createSetupAccessoryPayloadWithSetupPayloadURL:(id)a3 error:(id *)a4;
- (id)_setupRequestBlockingPairedAccessoriesForHome:(id)a3;
- (id)pendingAccessorySetupCompletionHandler;
- (void)_finishAccessorySetupWithSetupCompletedInfo:(id)a3 setupError:(id)a4;
- (void)_handleFailAccessorySetupMessage:(id)a3;
- (void)_handleFinishAccessorySetupMessage:(id)a3;
- (void)_handlePerformAccessorySetupMessage:(id)a3;
- (void)_handleResumeAccessorySetupMessage:(id)a3;
- (void)_launchHUISWithNFCProxSetupURL:(id)a3;
- (void)_launchHUISWithRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5;
- (void)_launchHUISWithSetupAccessoryDescription:(id)a3 deviceSetupRequest:(id)a4 resumeSetupUserInfo:(id)a5 completionHandler:(id)a6;
- (void)_updateAccessoryDescription:(id)a3 usingConnection:(id)a4;
- (void)configure;
- (void)handleNFCProxSetupNotification:(id)a3;
- (void)launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest:(id)a3 clientProxy:(id)a4 completionHandler:(id)a5;
- (void)launchAccessorySetupHostToRequestSetupCodeForAccessoryWithUUID:(id)a3 accessoryName:(id)a4 homeUUID:(id)a5 clientConnection:(id)a6 completionHandler:(id)a7;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setAccessorySetupCoordinator:(id)a3;
- (void)setAccessorySetupHostClientConnection:(id)a3;
- (void)setActivationStartTime:(double)a3;
- (void)setAlertHandle:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setPendingAccessorySetupCompletionHandler:(id)a3;
@end

@implementation HMDAccessorySetupManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong(&self->_pendingAccessorySetupCompletionHandler, 0);
  objc_storeStrong((id *)&self->_alertHandleProvider, 0);
  objc_storeStrong((id *)&self->_xpcMessageTransport, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accessorySetupCoordinator, 0);
  objc_storeStrong((id *)&self->_accessorySetupHostClientConnection, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
}

- (void)setActivationStartTime:(double)a3
{
  self->_activationStartTime = a3;
}

- (double)activationStartTime
{
  return self->_activationStartTime;
}

- (void)setAlertHandle:(id)a3
{
}

- (HMDSBSRemoteAlertHandle)alertHandle
{
  return (HMDSBSRemoteAlertHandle *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPendingAccessorySetupCompletionHandler:(id)a3
{
}

- (id)pendingAccessorySetupCompletionHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (HMDSBSRemoteAlertHandleProvider)alertHandleProvider
{
  return (HMDSBSRemoteAlertHandleProvider *)objc_getProperty(self, a2, 64, 1);
}

- (HMDXPCMessageTransport)xpcMessageTransport
{
  return (HMDXPCMessageTransport *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccessorySetupCoordinator:(id)a3
{
}

- (HMDAccessorySetupCoordinator)accessorySetupCoordinator
{
  return self->_accessorySetupCoordinator;
}

- (void)setAccessorySetupHostClientConnection:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)[MEMORY[0x263F0E088] UUID];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDAccessorySetupManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HMDAccessorySetupManager_remoteAlertHandle_didInvalidateWithError___block_invoke;
  block[3] = &unk_264A2F2F8;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __69__HMDAccessorySetupManager_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) alertHandle];

  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v2 == v3)
  {
    if (v7)
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 48);
      int v17 = 138543874;
      v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Alert handle %@ did invalidate: %@", (uint8_t *)&v17, 0x20u);
    }
    id v14 = [*(id *)(a1 + 40) pendingAccessorySetupCompletionHandler];

    if (v14)
    {
      v15 = *(void **)(a1 + 40);
      v16 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
      [v15 _finishAccessorySetupWithSetupCompletedInfo:0 setupError:v16];
    }
    [*(id *)(a1 + 40) setAlertHandle:0];
  }
  else
  {
    if (v7)
    {
      v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 48);
      int v17 = 138543874;
      v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Received alert handle did invalidate for unexpected handle %@: %@", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessorySetupManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HMDAccessorySetupManager_remoteAlertHandleDidDeactivate___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__HMDAccessorySetupManager_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) alertHandle];

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = v6;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 32);
      int v16 = 138543618;
      int v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Alert handle %@ did deactivate. This can happen when screen is turned off by user", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v12 = [*(id *)(a1 + 40) pendingAccessorySetupCompletionHandler];

    if (v12)
    {
      uint64_t v13 = *(void **)(a1 + 40);
      id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
      [v13 _finishAccessorySetupWithSetupCompletedInfo:0 setupError:v14];
    }
    v15 = [*(id *)(a1 + 40) alertHandle];
    [v15 invalidate];

    [*(id *)(a1 + 40) setAlertHandle:0];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 32);
      int v16 = 138543618;
      int v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received alert handle did deactivate for unexpected handle %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessorySetupManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMDAccessorySetupManager_remoteAlertHandleDidActivate___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__HMDAccessorySetupManager_remoteAlertHandleDidActivate___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) alertHandle];

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = v6;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138543618;
      v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      uint64_t v10 = "%{public}@Alert handle %@ did activate";
      uint64_t v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      goto LABEL_6;
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 32);
    int v14 = 138543618;
    v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    uint64_t v10 = "%{public}@Received alert handle did activate for unexpected handle %@";
    uint64_t v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_6:
    _os_log_impl(&dword_22F52A000, v11, v12, v10, (uint8_t *)&v14, 0x16u);
  }
}

- (void)handleNFCProxSetupNotification:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v26 = v8;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling %@", buf, 0x16u);
  }
  uint64_t v9 = [v4 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F35668]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F0E080] setupPayloadURLFromSetupPayloadURLString:v12];
    if (v13)
    {
      int v14 = [(HMDAccessorySetupManager *)v6 workQueue];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __59__HMDAccessorySetupManager_handleNFCProxSetupNotification___block_invoke;
      v23[3] = &unk_264A2F820;
      v23[4] = v6;
      id v24 = v13;
      dispatch_async(v14, v23);
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x230FBD990]();
      uint64_t v20 = v6;
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v26 = v22;
        __int16 v27 = 2112;
        id v28 = v12;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert URL string to URL: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    __int16 v16 = v6;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v26 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Prox setup notification did not have expected URL string", buf, 0xCu);
    }
  }
}

uint64_t __59__HMDAccessorySetupManager_handleNFCProxSetupNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchHUISWithNFCProxSetupURL:*(void *)(a1 + 40)];
}

- (void)_handleFailAccessorySetupMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 errorForKey:*MEMORY[0x263F0B6A8]];
  BOOL v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = 138543618;
      __int16 v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Failing accessory setup with setupError: %@", (uint8_t *)&v15, 0x16u);
    }
    [(HMDAccessorySetupManager *)v8 _finishAccessorySetupWithSetupCompletedInfo:0 setupError:v6];
    [v4 respondWithSuccess];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 messagePayload];
      int v15 = 138543618;
      __int16 v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find setup error in message payload: %@", (uint8_t *)&v15, 0x16u);
    }
    int v14 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v4 respondWithError:v14];
  }
}

- (void)_handleFinishAccessorySetupMessage:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *MEMORY[0x263F0B6A0];
  v17[0] = objc_opt_class();
  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  id v8 = [v4 unarchivedObjectForKey:v6 ofClasses:v7];

  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  uint64_t v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    int v14 = v12;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Finishing accessory setup with accessorySetupCompletedInfo: %@", (uint8_t *)&v13, 0x16u);
  }
  [(HMDAccessorySetupManager *)v10 _finishAccessorySetupWithSetupCompletedInfo:v8 setupError:0];
  [v4 respondWithSuccess];
}

- (void)_handleResumeAccessorySetupMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 dictionaryForKey:*MEMORY[0x263F0B6C0]];
  if (v6)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __63__HMDAccessorySetupManager__handleResumeAccessorySetupMessage___block_invoke;
    v13[3] = &unk_264A15790;
    id v14 = v4;
    [(HMDAccessorySetupManager *)self _launchHUISWithSetupAccessoryDescription:0 deviceSetupRequest:0 resumeSetupUserInfo:v6 completionHandler:v13];
    BOOL v7 = v14;
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find resume accessory setup user info in message payload: %@", buf, 0x16u);
    }
    BOOL v7 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v4 respondWithError:v7];
  }
}

uint64_t __63__HMDAccessorySetupManager__handleResumeAccessorySetupMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithSuccess];
  }
  else {
    return objc_msgSend(v2, "respondWithError:");
  }
}

- (void)_handlePerformAccessorySetupMessage:(id)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  BOOL v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v28 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Performing accessory setup", buf, 0xCu);
  }
  uint64_t v10 = *MEMORY[0x263F0B6B0];
  v31[0] = objc_opt_class();
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
  id v12 = [v4 unarchivedObjectForKey:v10 ofClasses:v11];

  if (v12)
  {
    uint64_t v13 = [v4 proxyConnection];
    if (v13)
    {
      id v14 = (void *)v13;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __64__HMDAccessorySetupManager__handlePerformAccessorySetupMessage___block_invoke;
      v25[3] = &unk_264A15768;
      v25[4] = v7;
      id v26 = v4;
      [(HMDAccessorySetupManager *)v7 _launchHUISWithRequest:v12 connection:v14 completionHandler:v25];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x230FBD990]();
      __int16 v21 = v7;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v28 = v23;
        __int16 v29 = 2112;
        id v30 = v4;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not find proxy connection for message: %@", buf, 0x16u);
      }
      id v24 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      [v4 respondWithError:v24];

      id v14 = 0;
    }
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    __int16 v16 = v7;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      uint64_t v19 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      id v28 = v18;
      __int16 v29 = 2112;
      id v30 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not find request in message payload: %@", buf, 0x16u);
    }
    id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v4 respondWithError:v14];
  }
}

void __64__HMDAccessorySetupManager__handlePerformAccessorySetupMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v13 = *MEMORY[0x263F0B6B8];
    BOOL v7 = encodeRootObject();
    id v14 = v7;
    id v8 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v8, v13);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform accessory setup: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v6];
  }
}

- (id)_accessorySetupResultFromCompletedInfo:(id)a3 clientIdentifierSalt:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263F08C38];
  id v7 = a3;
  id v8 = [v6 alloc];
  uint64_t v9 = [v7 homeUUID];
  id v10 = (void *)[v8 initWithUUIDString:v9];
  uint64_t v11 = [(objc_class *)v6 hm_deriveUUIDFromBaseUUID:v10 identifierSalt:v5];

  id v12 = [v7 addedAccessoryUUIDs];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __88__HMDAccessorySetupManager__accessorySetupResultFromCompletedInfo_clientIdentifierSalt___block_invoke;
  v17[3] = &unk_264A15740;
  id v18 = v5;
  id v13 = v5;
  id v14 = objc_msgSend(v12, "na_map:", v17);

  __int16 v15 = (void *)[objc_alloc(MEMORY[0x263F0E098]) initWithHomeUniqueIdentifier:v11 accessoryUniqueIdentifiers:v14];
  return v15;
}

id __88__HMDAccessorySetupManager__accessorySetupResultFromCompletedInfo_clientIdentifierSalt___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:v4];

  id v6 = objc_msgSend(MEMORY[0x263F08C38], "hm_deriveUUIDFromBaseUUID:identifierSalt:", v5, *(void *)(a1 + 32));

  return v6;
}

- (void)_finishAccessorySetupWithSetupCompletedInfo:(id)a3 setupError:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessorySetupManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDAccessorySetupManager *)self pendingAccessorySetupCompletionHandler];
  if (v9)
  {
    id v10 = (void *)MEMORY[0x230FBD990]([(HMDAccessorySetupManager *)self setPendingAccessorySetupCompletionHandler:0]);
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [(HMDAccessorySetupManager *)v11 alertHandle];
      int v21 = 138543618;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Invalidating remote alert: %@", (uint8_t *)&v21, 0x16u);
    }
    __int16 v15 = [(HMDAccessorySetupManager *)v11 alertHandle];
    [v15 unregisterObserver:v11];

    __int16 v16 = [(HMDAccessorySetupManager *)v11 alertHandle];
    [v16 invalidate];

    [(HMDAccessorySetupManager *)v11 setAlertHandle:0];
    ((void (**)(void, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v21 = 138543362;
      uint64_t v22 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot finish accessory setup because no pending completion handler exists", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)_launchHUISWithSetupAccessoryDescription:(id)a3 deviceSetupRequest:(id)a4 resumeSetupUserInfo:(id)a5 completionHandler:(id)a6
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = [(HMDAccessorySetupManager *)self workQueue];
  dispatch_assert_queue_V2(v14);

  if (!v10 && !v11 && !v12) {
    _HMFPreconditionFailure();
  }
  __int16 v15 = (void *)MEMORY[0x230FBD990]();
  __int16 v16 = self;
  __int16 v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    int v62 = 138544130;
    v63 = v18;
    __int16 v64 = 2112;
    uint64_t v65 = (uint64_t)v10;
    __int16 v66 = 2112;
    double v67 = *(double *)&v11;
    __int16 v68 = 2112;
    id v69 = v12;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Launching HomeUIService with setupAccessoryDescription: %@ deviceSetupRequest: %@ resumeSetupUserInfo: %@", (uint8_t *)&v62, 0x2Au);
  }
  objc_msgSend(v10, "setDoNetworkScan:", objc_msgSend(v11, "shouldScanNetworks"));
  uint64_t v19 = [(HMDAccessorySetupManager *)v16 alertHandle];
  int v20 = [v19 isActive];

  int v21 = [(HMDAccessorySetupManager *)v16 alertHandle];
  int v22 = [v21 isValid];

  if (v20)
  {
    uint64_t v23 = MEMORY[0x230FBD990]();
    id v24 = v16;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      int v62 = 138543362;
      v63 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot launch HomeUIService because it is already active", (uint8_t *)&v62, 0xCu);
    }
    __int16 v27 = (void *)v23;
LABEL_10:
    id v28 = [MEMORY[0x263F087E8] hmErrorWithCode:15];
    v13[2](v13, 0, v28);
    goto LABEL_31;
  }
  mach_absolute_time();
  uint64_t v29 = UpTicksToSeconds();
  if (v22)
  {
    double v30 = (double)(unint64_t)v29;
    uint64_t v31 = [(HMDAccessorySetupManager *)v16 activationStartTime];
    double v33 = v30 - v32;
    v34 = (void *)MEMORY[0x230FBD990](v31);
    v35 = v16;
    v36 = HMFGetOSLogHandle();
    v37 = v36;
    if (v33 < 2.0)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v38 = HMFGetLogIdentifier();
        [(HMDAccessorySetupManager *)v35 activationStartTime];
        int v62 = 138544130;
        v63 = v38;
        __int16 v64 = 2048;
        uint64_t v65 = 0x4000000000000000;
        __int16 v66 = 2048;
        double v67 = v30;
        __int16 v68 = 2048;
        id v69 = v39;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Not launching HomeUIService because a valid launch was attempted within the last %f seconds. Current time: %f, activationStartTime: %f", (uint8_t *)&v62, 0x2Au);
      }
      __int16 v27 = v34;
      goto LABEL_10;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v40 = HMFGetLogIdentifier();
      [(HMDAccessorySetupManager *)v35 activationStartTime];
      v42 = v41;
      v43 = [(HMDAccessorySetupManager *)v35 alertHandle];
      int v62 = 138544386;
      v63 = v40;
      __int16 v64 = 2048;
      uint64_t v65 = 0x4000000000000000;
      __int16 v66 = 2048;
      double v67 = v30;
      __int16 v68 = 2048;
      id v69 = v42;
      __int16 v70 = 2112;
      v71 = v43;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Alert is valid but not active and it has been more than %f seconds. Current time: %f, activationStartTime: %f. Invalidating remote alert: %@", (uint8_t *)&v62, 0x34u);
    }
    v44 = [(HMDAccessorySetupManager *)v35 alertHandle];
    [v44 unregisterObserver:v35];

    v45 = [(HMDAccessorySetupManager *)v35 alertHandle];
    [v45 invalidate];

    [(HMDAccessorySetupManager *)v35 setAlertHandle:0];
  }
  id v28 = [MEMORY[0x263EFF9A0] dictionary];
  if (v10)
  {
    v46 = [v10 dictionaryRepresentation];
    [v28 addEntriesFromDictionary:v46];
  }
  if (v11)
  {
    v47 = [v11 dictionaryRepresentation];
    [v28 addEntriesFromDictionary:v47];
  }
  if (v12) {
    [v28 addEntriesFromDictionary:v12];
  }
  v48 = [(HMDAccessorySetupManager *)v16 alertHandleProvider];
  v49 = [v48 createRemoteAlertHandleWithServiceName:*MEMORY[0x263F0CEB8] viewControllerClassName:@"HSProximityCardHostViewController" userInfo:v28];
  [(HMDAccessorySetupManager *)v16 setAlertHandle:v49];

  v50 = [(HMDAccessorySetupManager *)v16 alertHandle];
  [v50 registerObserver:v16];

  v51 = (void *)MEMORY[0x230FBD990]();
  v52 = v16;
  v53 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    v54 = HMFGetLogIdentifier();
    v55 = [(HMDAccessorySetupManager *)v52 alertHandle];
    int v62 = 138543618;
    v63 = v54;
    __int16 v64 = 2112;
    uint64_t v65 = (uint64_t)v55;
    _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@Activating remote alert: %@", (uint8_t *)&v62, 0x16u);
  }
  v56 = [(HMDAccessorySetupManager *)v52 alertHandle];
  [v56 activate];

  mach_absolute_time();
  uint64_t v57 = [(HMDAccessorySetupManager *)v52 setActivationStartTime:(double)(unint64_t)UpTicksToSeconds()];
  if (v10)
  {
    v58 = (void *)MEMORY[0x230FBD990](v57);
    v59 = v52;
    v60 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      v61 = HMFGetLogIdentifier();
      int v62 = 138543618;
      v63 = v61;
      __int16 v64 = 2112;
      uint64_t v65 = (uint64_t)v10;
      _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_INFO, "%{public}@Updating pending setup accessory description to %@", (uint8_t *)&v62, 0x16u);
    }
    [(HMDAccessorySetupManager *)v59 setPendingAccessorySetupCompletionHandler:v13];
  }
LABEL_31:
}

- (void)_updateAccessoryDescription:(id)a3 usingConnection:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v9 = a3;
    id v6 = [v5 processInfo];
    id v7 = [v6 mainBundleURL];
    [v9 setAppBundleURL:v7];

    objc_msgSend(v9, "setEntitledForHomeKitSPI:", objc_msgSend(v5, "isEntitledForSPIAccess"));
    objc_msgSend(v9, "setEntitledForThirdPartySetupAccessoryPayload:", objc_msgSend(v5, "isEntitledToProvideAccessorySetupPayload"));
    uint64_t v8 = [v5 isEntitledToProvideMatterSetupPayload];

    [v9 setEntitledForThirdPartyMatterSetupPayload:v8];
  }
}

- (id)_setupRequestBlockingPairedAccessoriesForHome:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v44 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263EFF980] array];
  if (v3)
  {
    id v5 = [v3 name];
    [v4 addObject:v5];
  }
  v36 = v4;
  v37 = v3;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v6 = [v3 accessories];
  id v7 = (void *)[v6 copy];

  id obj = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v50;
    uint64_t v38 = *(void *)v50;
    do
    {
      uint64_t v11 = 0;
      uint64_t v39 = v9;
      do
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v49 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }
        id v14 = v13;

        if ([v14 supportsCHIP])
        {
          id v41 = v14;
          uint64_t v42 = v11;
          __int16 v15 = [v14 chipStorage];
          __int16 v16 = [v15 pairings];

          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v17 = v16;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v57 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v46 != v20) {
                  objc_enumerationMutation(v17);
                }
                int v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                uint64_t v23 = (void *)MEMORY[0x230FBD990]();
                id v24 = self;
                uint64_t v25 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  id v26 = HMFGetLogIdentifier();
                  __int16 v27 = [v22 operationalIdentity];
                  *(_DWORD *)buf = 138543618;
                  v54 = v26;
                  __int16 v55 = 2112;
                  v56 = v27;
                  _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Adding Matter operational identity to device setup request blocking paired accessories: %@", buf, 0x16u);
                }
                id v28 = objc_alloc(MEMORY[0x263F11050]);
                uint64_t v29 = [v22 operationalIdentity];
                double v30 = [v29 rootPublicKey];
                uint64_t v31 = [v22 operationalIdentity];
                double v32 = [v31 nodeID];
                double v33 = (void *)[v28 initWithRootPublicKey:v30 nodeID:v32];
                [v44 addObject:v33];
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v57 count:16];
            }
            while (v19);
          }

          uint64_t v10 = v38;
          uint64_t v9 = v39;
          id v14 = v41;
          uint64_t v11 = v42;
        }

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v9);
  }

  v34 = (void *)[objc_alloc(MEMORY[0x263F11048]) initWithEcosystemName:&stru_26E2EB898 homeNames:v36 blockedDevicePairings:v44];
  return v34;
}

- (void)_launchHUISWithRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = [(HMDAccessorySetupManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v99 = [v9 clientIdentifier];
  id v12 = [v9 processInfo];
  id v106 = 0;
  id v13 = [v12 clientIdentifierSalt:&v106];
  id v14 = v106;

  if (v13)
  {
    __int16 v15 = [(HMDAccessorySetupManager *)self homeManager];
    if (v15)
    {
      v97 = [v8 homeUniqueIdentifier];
      v92 = v13;
      if (v97)
      {
        __int16 v16 = [v15 _homeWithUniqueIdentifier:v97 forClientIdentifierSalt:v13];
        if (!v16)
        {
          id v17 = (void *)MEMORY[0x230FBD990]();
          uint64_t v18 = self;
          uint64_t v19 = HMFGetOSLogHandle();
          id v13 = v92;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v20 = v89 = v14;
            *(_DWORD *)buf = 138543874;
            v108 = v20;
            __int16 v109 = 2112;
            id v110 = v97;
            __int16 v111 = 2112;
            v112 = v92;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find home with unique identifier %@ for client identifier salt: %@", buf, 0x20u);

            id v14 = v89;
          }

          int v21 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
          v10[2](v10, 0, v21);
          goto LABEL_46;
        }
      }
      else
      {
        __int16 v16 = 0;
      }
      uint64_t v31 = [v8 matterPayload];

      id v90 = v14;
      v91 = v16;
      if (v31)
      {
        if (([v9 isEntitledForSPIAccess] & 1) == 0
          && ([v9 isEntitledToProvideMatterSetupPayload] & 1) == 0)
        {
          long long v52 = (void *)MEMORY[0x230FBD990]();
          v53 = self;
          v54 = HMFGetOSLogHandle();
          id v13 = v92;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v56 = id v55 = v14;
            *(_DWORD *)buf = 138543362;
            v108 = v56;
            _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Client provided a matter setup payload but is not entitled to do so", buf, 0xCu);

            id v14 = v55;
          }

          v95 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
          ((void (*)(void (**)(id, void, void *), void))v10[2])(v10, 0);
          int v21 = v91;

          goto LABEL_46;
        }
        double v32 = [(HMDAccessorySetupManager *)self accessorySetupCoordinator];
        double v33 = [v8 matterPayload];
        id v105 = 0;
        uint64_t v34 = [v32 createSetupAccessoryPayloadWithCHIPSetupPayload:v33 error:&v105];
        id v35 = v105;

        v93 = (void *)v34;
        if (!v34 || v35)
        {
          long long v47 = (void *)MEMORY[0x230FBD990]();
          long long v48 = self;
          long long v49 = HMFGetOSLogHandle();
          id v13 = v92;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            long long v50 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v108 = v50;
            __int16 v109 = 2112;
            id v110 = v35;
            _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed to create Setup Payload from input matter payload with error %@", buf, 0x16u);
          }
          long long v51 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
          v10[2](v10, 0, v51);

          id v14 = v90;
          int v21 = v91;
          goto LABEL_45;
        }
        id v36 = objc_alloc(MEMORY[0x263F0E768]);
        __int16 v16 = v91;
        v37 = [v91 uuid];
        uint64_t v38 = v36;
        uint64_t v39 = v93;
        uint64_t v40 = [v38 initWithSetupAccessoryPayload:v93 appID:v99 homeUUID:v37 ownershipToken:0];

        v93 = (void *)v40;
        id v14 = v90;
      }
      else
      {
        id v41 = [v8 payload];

        if (v41)
        {
          if (([v9 isEntitledForSPIAccess] & 1) == 0
            && ([v9 isEntitledToProvideAccessorySetupPayload] & 1) == 0)
          {
            v80 = (void *)MEMORY[0x230FBD990]();
            v81 = self;
            v82 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v84 = id v83 = v14;
              *(_DWORD *)buf = 138543362;
              v108 = v84;
              _os_log_impl(&dword_22F52A000, v82, OS_LOG_TYPE_ERROR, "%{public}@Client provided an accessory setup payload but is not entitled to do so", buf, 0xCu);

              id v14 = v83;
            }

            v96 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
            ((void (*)(void (**)(id, void, void *), void))v10[2])(v10, 0);
            int v21 = v16;
            id v13 = v92;

            goto LABEL_46;
          }
          id v94 = objc_alloc(MEMORY[0x263F0E768]);
          uint64_t v39 = [v8 payload];
          uint64_t v42 = [v39 internalSetupPayload];
          [v16 uuid];
          v43 = v86 = v15;
          [v8 payload];
          v44 = id v88 = v8;
          [v44 ownershipToken];
          v46 = id v45 = v14;
          v93 = (void *)[v94 initWithSetupAccessoryPayload:v42 appID:v99 homeUUID:v43 ownershipToken:v46];

          id v14 = v45;
          id v8 = v88;

          __int16 v15 = v86;
        }
        else
        {
          id v57 = objc_alloc(MEMORY[0x263F0E768]);
          uint64_t v39 = [v16 uuid];
          v93 = (void *)[v57 initWithAppIdentifier:v99 homeUUID:v39];
        }
      }

      v58 = [v8 suggestedRoomUniqueIdentifier];
      uint64_t v59 = v16;
      id v13 = v92;
      v87 = v58;
      if (v59 && v58)
      {
        v60 = [v59 roomWithUniqueIdentifier:v58 forClientIdentifierSalt:v92];
        if (!v60)
        {
          v76 = (void *)MEMORY[0x230FBD990]();
          v77 = self;
          v78 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            v79 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v108 = v79;
            __int16 v109 = 2112;
            id v110 = v87;
            __int16 v111 = 2112;
            v112 = v92;
            _os_log_impl(&dword_22F52A000, v78, OS_LOG_TYPE_ERROR, "%{public}@Could not find room with unique identifier %@ for client identifier salt: %@", buf, 0x20u);

            id v14 = v90;
          }

          v75 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
          v10[2](v10, 0, v75);
          int v21 = v91;
          v58 = v87;
          goto LABEL_44;
        }
        v61 = v60;
        int v62 = [v60 uuid];
        [v93 setSuggestedRoomUUID:v62];

        v58 = v87;
      }
      v63 = [v8 suggestedAccessoryName];
      v85 = v63;
      if (v63)
      {
        __int16 v64 = v63;
        unint64_t v65 = [v63 length];
        if (v65 > HMMaxLengthForNaming())
        {
          __int16 v66 = (void *)MEMORY[0x230FBD990]();
          double v67 = self;
          __int16 v68 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            id v69 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v108 = v69;
            _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_ERROR, "%{public}@Suggested accessory name is longer than the maximum allowed length", buf, 0xCu);
          }
          __int16 v70 = [MEMORY[0x263F087E8] hmErrorWithCode:46];
          v10[2](v10, 0, v70);
          goto LABEL_43;
        }
        [v93 setSuggestedAccessoryName:v64];
      }
      [(HMDAccessorySetupManager *)self _updateAccessoryDescription:v93 usingConnection:v9];
      v71 = [v15 accessoryBrowser];
      uint64_t v72 = [v71 chipAccessoryServerBrowser];

      __int16 v70 = [v91 matterFabricID];
      objc_msgSend(v72, "setPreWarmTargetToFabricWithID:isOwner:", v70, objc_msgSend(v91, "isOwnerUser"));
      v73 = [(HMDAccessorySetupManager *)self _setupRequestBlockingPairedAccessoriesForHome:v91];
      v100[0] = MEMORY[0x263EF8330];
      v100[1] = 3221225472;
      v100[2] = __80__HMDAccessorySetupManager__launchHUISWithRequest_connection_completionHandler___block_invoke;
      v100[3] = &unk_264A15718;
      id v101 = v72;
      v102 = self;
      v104 = v10;
      id v103 = v92;
      id v74 = v72;
      v58 = v87;
      [(HMDAccessorySetupManager *)self _launchHUISWithSetupAccessoryDescription:v93 deviceSetupRequest:v73 resumeSetupUserInfo:0 completionHandler:v100];

LABEL_43:
      id v14 = v90;
      int v21 = v91;
      v75 = v85;
LABEL_44:

LABEL_45:
LABEL_46:

      goto LABEL_48;
    }
    id v26 = (void *)MEMORY[0x230FBD990]();
    __int16 v27 = self;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = id v29 = v14;
      *(_DWORD *)buf = 138543362;
      v108 = v30;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@home manager is no longer available", buf, 0xCu);

      id v14 = v29;
    }

    v98 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    ((void (*)(void (**)(id, void, void *), void))v10[2])(v10, 0);
  }
  else
  {
    int v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v108 = v25;
      __int16 v109 = 2112;
      id v110 = v14;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine client identifier salt for accessory setup client: %@", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v10[2](v10, 0, v15);
  }
LABEL_48:
}

void __80__HMDAccessorySetupManager__launchHUISWithRequest_connection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) clearPreWarmTarget];
  if (v5)
  {
    id v8 = [*(id *)(a1 + 40) _accessorySetupResultFromCompletedInfo:v5 clientIdentifierSalt:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990](v7);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform accessory setup: %@", (uint8_t *)&v13, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_launchHUISWithNFCProxSetupURL:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Launching HomeUIService with NFC prox setup URL: %@", buf, 0x16u);
  }
  id v26 = 0;
  id v10 = [(HMDAccessorySetupManager *)v7 _createSetupAccessoryPayloadWithSetupPayloadURL:v4 error:&v26];
  id v11 = v26;
  if (v10)
  {
    id v12 = objc_alloc(MEMORY[0x263F0E768]);
    int v13 = [MEMORY[0x263F086E0] mainBundle];
    id v14 = [v13 bundleIdentifier];
    __int16 v15 = (void *)[v12 initWithSetupAccessoryPayload:v10 appID:v14 homeUUID:0 ownershipToken:0];

    id v16 = (void *)MEMORY[0x230FBD990]([v15 setEntitledForHomeKitSPI:1]);
    uint64_t v17 = v7;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v19;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Launching HomeUIService with NFC prox setup accessory description: %@", buf, 0x16u);
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __59__HMDAccessorySetupManager__launchHUISWithNFCProxSetupURL___block_invoke;
    v24[3] = &unk_264A156F0;
    v24[4] = v17;
    id v25 = v11;
    [(HMDAccessorySetupManager *)v17 _launchHUISWithSetupAccessoryDescription:v15 deviceSetupRequest:0 resumeSetupUserInfo:0 completionHandler:v24];
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    int v21 = v7;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v28 = v23;
      __int16 v29 = 2112;
      id v30 = v4;
      __int16 v31 = 2112;
      id v32 = v11;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate HMSetupAccessoryPayload with url %@: %@", buf, 0x20u);
    }
  }
}

void __59__HMDAccessorySetupManager__launchHUISWithNFCProxSetupURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v14 = 138543618;
      __int16 v15 = v11;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully set up accessories with NFC prox setup completed info: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = *(void **)(a1 + 40);
    int v14 = 138543618;
    __int16 v15 = v12;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to set up accessories with NFC prox: %@", (uint8_t *)&v14, 0x16u);
  }
}

- (id)_createSetupAccessoryPayloadWithSetupPayloadURL:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([MEMORY[0x263F0E080] isHAPSetupPayloadURL:v6])
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F0E770]) initWithHAPSetupPayloadURL:v6 error:a4];
  }
  else if ([MEMORY[0x263F0E080] isCHIPSetupPayloadURL:v6])
  {
    id v8 = [(HMDAccessorySetupManager *)self accessorySetupCoordinator];
    uint64_t v7 = [v8 createCHIPSetupAccessoryPayloadWithSetupPayloadURL:v6 error:a4];
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = [v6 scheme];
      int v15 = 138543874;
      __int16 v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unsupported URL scheme %@ in setupPayloadURL: %@", (uint8_t *)&v15, 0x20u);
    }
    if (a4)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:3];
      uint64_t v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (void)launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest:(id)a3 clientProxy:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessorySetupManager *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __120__HMDAccessorySetupManager_launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest_clientProxy_completionHandler___block_invoke;
  v15[3] = &unk_264A2EE30;
  id v16 = v9;
  __int16 v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __120__HMDAccessorySetupManager_launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest_clientProxy_completionHandler___block_invoke(id *a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v2 = [a1[4] connection];
  id v3 = [v2 processInfo];
  id v4 = [v3 signingIdentifier];

  id v5 = [a1[5] accessorySetupCoordinator];

  if (v5)
  {
    id v6 = [a1[5] accessorySetupCoordinator];
    [v6 setCurrentBundleIdentifier:v4];
  }
  uint64_t v7 = [a1[6] setupPayload];

  if (!v7)
  {
    id v11 = (id)[objc_alloc(MEMORY[0x263F0E768]) initWithAppIdentifier:v4 homeUUID:0];
    goto LABEL_9;
  }
  if (([a1[4] hasPrivateHomeKitEntitlement] & 1) != 0
    || ([a1[4] hasMatterSetupPayloadEntitlement] & 1) != 0)
  {
    id v8 = [a1[5] accessorySetupCoordinator];
    id v9 = [a1[6] setupPayload];
    id v37 = 0;
    id v10 = [v8 createSetupAccessoryPayloadWithCHIPSetupPayload:v9 error:&v37];
    id v11 = v37;

    if (v10)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x263F0E768]) initWithSetupAccessoryPayload:v10 appID:v4 homeUUID:0 ownershipToken:0];

      id v11 = (id)v12;
LABEL_9:
      id v13 = [a1[4] connection];
      id v14 = [v13 processInfo];
      int v15 = [v14 mainBundleURL];
      [v11 setAppBundleURL:v15];

      objc_msgSend(v11, "setEntitledForHomeKitSPI:", objc_msgSend(a1[4], "hasPrivateHomeKitEntitlement"));
      objc_msgSend(v11, "setEntitledForThirdPartyMatterSetupPayload:", objc_msgSend(a1[4], "hasMatterSetupPayloadEntitlement"));
      [v11 setSetupInitiatedByOtherMatterEcosystem:1];
      objc_msgSend(v11, "setDoNetworkScan:", objc_msgSend(a1[6], "shouldScanNetworks"));
      id v16 = [a1[5] homeManager];
      __int16 v17 = [v16 accessoryBrowser];
      id v18 = [v17 chipAccessoryServerBrowser];

      [v18 setPreWarmTargetToSystemCommissionerFabric];
      id v19 = a1[5];
      id v20 = a1[6];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __120__HMDAccessorySetupManager_launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest_clientProxy_completionHandler___block_invoke_47;
      v33[3] = &unk_264A156C8;
      id v34 = v18;
      id v35 = v19;
      id v36 = a1[7];
      id v21 = v18;
      [v19 _launchHUISWithSetupAccessoryDescription:v11 deviceSetupRequest:v20 resumeSetupUserInfo:0 completionHandler:v33];

      goto LABEL_16;
    }
    int v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = a1[5];
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v39 = v25;
      __int16 v40 = 2112;
      id v41 = v11;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create setup accessory payload from input  %@", buf, 0x16u);
    }
    id v26 = (void (**)(id, void *))a1[7];
    __int16 v27 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    v26[2](v26, v27);
  }
  else
  {
    id v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = a1[5];
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v31;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Client provided a Matter setup payload but is not entitled to do so", buf, 0xCu);
    }
    id v32 = (void (**)(id, id))a1[7];
    id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
    v32[2](v32, v11);
  }
LABEL_16:
}

void __120__HMDAccessorySetupManager_launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest_clientProxy_completionHandler___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) clearPreWarmTarget];
  uint64_t v7 = [*(id *)(a1 + 40) accessorySetupCoordinator];
  [v7 stopMetricsForThirdPartyPairingWithError:v6];

  if (v5)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 40);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform accessory setup: %@", (uint8_t *)&v13, 0x16u);
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v8();
}

- (void)launchAccessorySetupHostToRequestSetupCodeForAccessoryWithUUID:(id)a3 accessoryName:(id)a4 homeUUID:(id)a5 clientConnection:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(HMDAccessorySetupManager *)self workQueue];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __149__HMDAccessorySetupManager_launchAccessorySetupHostToRequestSetupCodeForAccessoryWithUUID_accessoryName_homeUUID_clientConnection_completionHandler___block_invoke;
  v23[3] = &unk_264A2DF78;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v17, v23);
}

void __149__HMDAccessorySetupManager_launchAccessorySetupHostToRequestSetupCodeForAccessoryWithUUID_accessoryName_homeUUID_clientConnection_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138544386;
    id v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    __int16 v24 = 2112;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v9;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Launching HomeUIService to request setup code for accessoryUUID: %@ accessoryName: %@ homeUUID: %@ clientConnection: %@", buf, 0x34u);
  }
  id v10 = objc_alloc(MEMORY[0x263F0E768]);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  id v13 = [*(id *)(a1 + 64) clientIdentifier];
  id v14 = (void *)[v10 initWithAccessoryUUID:v11 accessoryName:v12 appID:v13 homeUUID:*(void *)(a1 + 56)];

  [*(id *)(a1 + 32) _updateAccessoryDescription:v14 usingConnection:*(void *)(a1 + 64)];
  id v15 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __149__HMDAccessorySetupManager_launchAccessorySetupHostToRequestSetupCodeForAccessoryWithUUID_accessoryName_homeUUID_clientConnection_completionHandler___block_invoke_43;
  v16[3] = &unk_264A156A0;
  id v17 = *(id *)(a1 + 72);
  [v15 _launchHUISWithSetupAccessoryDescription:v14 deviceSetupRequest:0 resumeSetupUserInfo:0 completionHandler:v16];
}

uint64_t __149__HMDAccessorySetupManager_launchAccessorySetupHostToRequestSetupCodeForAccessoryWithUUID_accessoryName_homeUUID_clientConnection_completionHandler___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configure
{
  v23[1] = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessorySetupManager *)self messageDispatcher];
  uint64_t v4 = *MEMORY[0x263F0B6C8];
  id v5 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v23[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [v3 registerForMessage:v4 receiver:self policies:v6 selector:sel__handlePerformAccessorySetupMessage_];

  uint64_t v7 = [(HMDAccessorySetupManager *)self messageDispatcher];
  uint64_t v8 = *MEMORY[0x263F0B6D0];
  uint64_t v9 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  __int16 v22 = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  [v7 registerForMessage:v8 receiver:self policies:v10 selector:sel__handleResumeAccessorySetupMessage_];

  uint64_t v11 = [(HMDAccessorySetupManager *)self messageDispatcher];
  uint64_t v12 = *MEMORY[0x263F0B698];
  id v13 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  uint64_t v21 = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  [v11 registerForMessage:v12 receiver:self policies:v14 selector:sel__handleFinishAccessorySetupMessage_];

  id v15 = [(HMDAccessorySetupManager *)self messageDispatcher];
  uint64_t v16 = *MEMORY[0x263F0B690];
  id v17 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  __int16 v20 = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  [v15 registerForMessage:v16 receiver:self policies:v18 selector:sel__handleFailAccessorySetupMessage_];

  id v19 = [MEMORY[0x263F08A00] defaultCenter];
  [v19 addObserver:self selector:sel_handleNFCProxSetupNotification_ name:*MEMORY[0x263F35670] object:0];

  [MEMORY[0x263F35A48] start];
}

- (HMDXPCClientConnection)accessorySetupHostClientConnection
{
  id v3 = [(HMDAccessorySetupManager *)self xpcMessageTransport];
  uint64_t v4 = [v3 connections];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HMDAccessorySetupManager_accessorySetupHostClientConnection__block_invoke;
  v7[3] = &unk_264A15678;
  void v7[4] = self;
  id v5 = objc_msgSend(v4, "hmf_objectPassingTest:", v7);

  return (HMDXPCClientConnection *)v5;
}

uint64_t __62__HMDAccessorySetupManager_accessorySetupHostClientConnection__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 clientIdentifier];
  id v3 = [(id)objc_opt_class() accessorySetupHostBundleIdentifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (HMDAccessorySetupManager)initWithWorkQueue:(id)a3 homeManager:(id)a4 xpcMessageTransport:(id)a5 messageDispatcher:(id)a6 alertHandleProvider:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v14)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v15)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v16)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  id v18 = v17;
  if (!v17)
  {
LABEL_13:
    __int16 v22 = (HMDAccessorySetupManager *)_HMFPreconditionFailure();
    return [(HMDAccessorySetupManager *)v22 initWithWorkQueue:v24 homeManager:v25];
  }
  v26.receiver = self;
  v26.super_class = (Class)HMDAccessorySetupManager;
  id v19 = [(HMDAccessorySetupManager *)&v26 init];
  __int16 v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_workQueue, a3);
    objc_storeWeak((id *)&v20->_homeManager, v14);
    objc_storeStrong((id *)&v20->_xpcMessageTransport, a5);
    objc_storeStrong((id *)&v20->_messageDispatcher, a6);
    objc_storeStrong((id *)&v20->_alertHandleProvider, a7);
  }

  return v20;
}

- (HMDAccessorySetupManager)initWithWorkQueue:(id)a3 homeManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[HMDXPCMessageTransport accessorySetupTransport];
  id v9 = objc_alloc(MEMORY[0x263F42578]);
  id v10 = +[HMDXPCMessageTransport accessorySetupTransport];
  uint64_t v11 = (void *)[v9 initWithTransport:v10];
  uint64_t v12 = objc_alloc_init(HMDSBSRemoteAlertHandleProvider);
  id v13 = [(HMDAccessorySetupManager *)self initWithWorkQueue:v7 homeManager:v6 xpcMessageTransport:v8 messageDispatcher:v11 alertHandleProvider:v12];

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t48 != -1) {
    dispatch_once(&logCategory__hmf_once_t48, &__block_literal_global_7471);
  }
  v2 = (void *)logCategory__hmf_once_v49;
  return v2;
}

void __39__HMDAccessorySetupManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v49;
  logCategory__hmf_once_long long v49 = v0;
}

+ (NSString)accessorySetupHostBundleIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F0CEB8];
}

@end