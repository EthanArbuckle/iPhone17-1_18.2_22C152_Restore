@interface HMDRetailDemoModeRequestHandler
- (HMDHomeManager)homeManager;
- (HMDRelaunchHandling)relaunchHandler;
- (HMDRetailDemoModeRequestHandler)initWithHomeManager:(id)a3 messageDispatcher:(id)a4 relaunchHandler:(id)a5;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)identifier;
- (OS_dispatch_queue)workQueue;
- (void)_handleConfigRetailDemoModeMessage:(id)a3;
- (void)_handleConfigRetailDemoModeMessageForFinalize:(id)a3;
- (void)_handleConfigRetailDemoModeMessageForPrepare:(id)a3;
- (void)configure;
@end

@implementation HMDRetailDemoModeRequestHandler

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_relaunchHandler);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (HMDRelaunchHandling)relaunchHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relaunchHandler);
  return (HMDRelaunchHandling *)WeakRetained;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)_handleConfigRetailDemoModeMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 BOOLForKey:@"kFinalizeRetailDemoSetupKey"];
  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = HMFBooleanToString();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling config retail demo mode message with finalizeDemoSetup=%@", (uint8_t *)&v11, 0x16u);
  }
  if (v5) {
    [(HMDRetailDemoModeRequestHandler *)v7 _handleConfigRetailDemoModeMessageForFinalize:v4];
  }
  else {
    [(HMDRetailDemoModeRequestHandler *)v7 _handleConfigRetailDemoModeMessageForPrepare:v4];
  }
}

- (void)_handleConfigRetailDemoModeMessageForFinalize:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(HMDRetailDemoModeRequestHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 BOOLForKey:@"kAllowRetailDemoModeEditingKey"];
  v7 = [(HMDRetailDemoModeRequestHandler *)self homeManager];
  if (v7)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__HMDRetailDemoModeRequestHandler__handleConfigRetailDemoModeMessageForFinalize___block_invoke;
    v13[3] = &unk_1E6A14B50;
    id v14 = v4;
    uint64_t v15 = self;
    [v7 finalizeRetailDemoModeWithAllowEditing:v6 completionHandler:v13];
    v8 = v14;
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle message because home manager is nil", buf, 0xCu);
    }
    v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v4 respondWithError:v8];
  }
}

void __81__HMDRetailDemoModeRequestHandler__handleConfigRetailDemoModeMessageForFinalize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v9 = @"kEncryptedHomeDataBlobKey";
    v10[0] = a2;
    int v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = a2;
    v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v3 respondWithPayload:v7];

    v8 = [*(id *)(a1 + 40) relaunchHandler];

    [v8 relaunchAfterDelay:0.5];
  }
  else
  {
    [*(id *)(a1 + 32) respondWithError:a3];
    v8 = 0;
  }
}

- (void)_handleConfigRetailDemoModeMessageForPrepare:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(HMDRetailDemoModeRequestHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 dataForKey:@"kControllerKeyPairKey"];
  v7 = [v4 stringForKey:@"kControllerPairingNameKey"];
  uint64_t v8 = [v4 dictionaryForKey:@"kAccessoriesDataBlobKey"];
  v9 = (void *)v8;
  if (v6 && v7 && v8)
  {
    v10 = [(HMDRetailDemoModeRequestHandler *)self homeManager];
    if (v10)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __80__HMDRetailDemoModeRequestHandler__handleConfigRetailDemoModeMessageForPrepare___block_invoke;
      v21[3] = &unk_1E6A196E0;
      id v22 = v4;
      v23 = self;
      [v10 configureRetailDemoModeWithKeyPair:v6 controllerName:v7 demoAccessories:v9 completionHandler:v21];
      int v11 = v22;
    }
    else
    {
      v16 = (void *)MEMORY[0x1D9452090]();
      v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v25 = v19;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle message because home manager is nil", buf, 0xCu);
      }
      int v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [v4 respondWithError:v11];
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    __int16 v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      uint64_t v15 = v20 = v12;
      *(_DWORD *)buf = 138544898;
      v25 = v15;
      __int16 v26 = 2112;
      v27 = @"kControllerKeyPairKey";
      __int16 v28 = 2112;
      v29 = v6;
      __int16 v30 = 2112;
      v31 = @"kControllerPairingNameKey";
      __int16 v32 = 2112;
      v33 = v7;
      __int16 v34 = 2112;
      v35 = @"kAccessoriesDataBlobKey";
      __int16 v36 = 2112;
      v37 = v9;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle message because one or more arguments are nil: %@=%@, %@=%@, %@=%@", buf, 0x48u);

      v12 = v20;
    }

    v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v10];
  }
}

void __80__HMDRetailDemoModeRequestHandler__handleConfigRetailDemoModeMessageForPrepare___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 respondWithError:a2];
  }
  else
  {
    [v3 respondWithSuccess];
    id v4 = [*(id *)(a1 + 40) relaunchHandler];
    [v4 relaunchAfterDelay:1.0];
  }
}

- (void)configure
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDRetailDemoModeRequestHandler *)self messageDispatcher];
  id v4 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v6[0] = v4;
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 registerForMessage:@"kConfigRetailDemoMode" receiver:self policies:v5 selector:sel__handleConfigRetailDemoModeMessage_];
}

- (HMDRetailDemoModeRequestHandler)initWithHomeManager:(id)a3 messageDispatcher:(id)a4 relaunchHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDRetailDemoModeRequestHandler;
  int v11 = [(HMDRetailDemoModeRequestHandler *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_homeManager, v8);
    uint64_t v13 = [v8 uuid];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    uint64_t v15 = [v8 workQueue];
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v12->_messageDispatcher, a4);
    objc_storeWeak((id *)&v12->_relaunchHandler, v10);
  }

  return v12;
}

@end