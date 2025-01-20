@interface HMDSiriEndpointProfileMessageHandler
+ (id)logCategory;
- (HMDSiriEndpointProfileMessageHandler)initWithHomeUUID:(id)a3;
- (HMDSiriEndpointProfileMessageHandlerDataSource)dataSource;
- (NSUUID)homeUUID;
- (id)dataSourceHubAccessories;
- (id)dataSourceSiriEndpointOnboardingManager;
- (id)deleteHistoryForAccessoryUUID:(id)a3 onHubAccessories:(id)a4;
- (id)deleteHistoryForAccessoryUUID:(id)a3 onHubAccessory:(id)a4;
- (id)logIdentifier;
- (void)handleSiriEndpointApplyOnboardingSelectionsRequestMessage:(id)a3;
- (void)handleSiriEndpointDeleteSiriHistoryRequestMessage:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation HMDSiriEndpointProfileMessageHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDSiriEndpointProfileMessageHandlerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDSiriEndpointProfileMessageHandlerDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDSiriEndpointProfileMessageHandler *)self homeUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)dataSourceHubAccessories
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [(HMDSiriEndpointProfileMessageHandler *)self dataSource];
  if (v3)
  {
    v4 = [(HMDSiriEndpointProfileMessageHandler *)self homeUUID];
    v5 = [v3 hubAccessoriesWithHomeUUID:v4 forSiriEndpointProfileMessageHandler:self];
  }
  else
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source hub accessories due to no data source", (uint8_t *)&v11, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (id)dataSourceSiriEndpointOnboardingManager
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [(HMDSiriEndpointProfileMessageHandler *)self dataSource];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 siriEndpointOnboardingManagerForSiriEndpointProfileMessageHandler:self];
  }
  else
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source Siri Endpoint Onboarding Manager due to no data source", (uint8_t *)&v11, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (id)deleteHistoryForAccessoryUUID:(id)a3 onHubAccessory:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F58190];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessory___block_invoke;
  v11[3] = &unk_264A2F3E8;
  id v9 = v8;
  id v12 = v9;
  [v6 deleteSiriHistoryForAccessoryWithUUID:v7 completionHandler:v11];

  return v9;
}

uint64_t __85__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessory___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

- (id)deleteHistoryForAccessoryUUID:(id)a3 onHubAccessories:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v28 = v11;
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Deleting siri history for accessory UUID: %@ on hub accessories: %@", buf, 0x20u);
  }
  id v12 = objc_alloc_init(MEMORY[0x263F58190]);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke;
  v24[3] = &unk_264A18818;
  v24[4] = v9;
  id v25 = v6;
  id v13 = v12;
  id v26 = v13;
  id v14 = v6;
  v15 = objc_msgSend(v7, "na_map:", v24);
  v16 = [MEMORY[0x263F58190] chainFutures:v15];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke_4;
  v22[3] = &unk_264A2D1D0;
  id v17 = v13;
  id v23 = v17;
  id v18 = (id)[v16 addCompletionBlock:v22];
  v19 = v23;
  id v20 = v17;

  return v20;
}

id __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F58190];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = [*(id *)(a1 + 32) deleteHistoryForAccessoryUUID:*(void *)(a1 + 40) onHubAccessory:v4];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke_2;
  v15[3] = &unk_264A2F398;
  id v16 = *(id *)(a1 + 48);
  id v7 = (id)[v6 addSuccessBlock:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke_3;
  v13[3] = &unk_264A2D1D0;
  id v8 = v5;
  id v14 = v8;
  id v9 = (id)[v6 addCompletionBlock:v13];
  v10 = v14;
  id v11 = v8;

  return v11;
}

void __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke_4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    id v2 = [MEMORY[0x263F087E8] hmfErrorWithCode:18];
    [*(id *)(a1 + 32) finishWithError:v2];
  }
}

uint64_t __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

uint64_t __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

- (void)handleSiriEndpointDeleteSiriHistoryRequestMessage:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v39 = v8;
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handle siri endpoint delete siri history request message: %@", buf, 0x16u);
  }
  id v9 = [v4 messagePayload];
  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F0E7A8]) initWithPayload:v9];
    if (v10)
    {
      id v11 = [(HMDSiriEndpointProfileMessageHandler *)v6 dataSourceHubAccessories];
      if (v11)
      {
        id v12 = [v10 accessoryUUID];
        id v13 = [(HMDSiriEndpointProfileMessageHandler *)v6 deleteHistoryForAccessoryUUID:v12 onHubAccessories:v11];
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __90__HMDSiriEndpointProfileMessageHandler_handleSiriEndpointDeleteSiriHistoryRequestMessage___block_invoke;
        v34[3] = &unk_264A28C88;
        v34[4] = v6;
        id v14 = v12;
        id v35 = v14;
        id v36 = v11;
        id v15 = v4;
        id v37 = v15;
        id v16 = (id)[v13 addFailureBlock:v34];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __90__HMDSiriEndpointProfileMessageHandler_handleSiriEndpointDeleteSiriHistoryRequestMessage___block_invoke_6;
        v31[3] = &unk_264A220F0;
        v31[4] = v6;
        id v32 = v14;
        id v33 = v15;
        id v17 = v14;
        id v18 = (id)[v13 addSuccessBlock:v31];
      }
      else
      {
        id v13 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
        v27 = (void *)MEMORY[0x230FBD990]();
        v28 = v6;
        __int16 v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          id v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v39 = v30;
          __int16 v40 = 2112;
          id v41 = v4;
          __int16 v42 = 2112;
          v43 = v13;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to get hub accessories to handle delete siri history request message: %@ error: %@", buf, 0x20u);
        }
        [v4 respondWithError:v13];
      }
    }
    else
    {
      id v11 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      id v23 = (void *)MEMORY[0x230FBD990]();
      v24 = v6;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v39 = v26;
        __int16 v40 = 2112;
        id v41 = v9;
        __int16 v42 = 2112;
        v43 = v11;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode message payload from delete siri history message payload: %@ error: %@", buf, 0x20u);
      }
      [v4 respondWithError:v11];
    }
  }
  else
  {
    v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
    v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = v6;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v39 = v22;
      __int16 v40 = 2112;
      id v41 = v4;
      __int16 v42 = 2112;
      v43 = v10;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get message payload from delete siri history message: %@ error: %@", buf, 0x20u);
    }
    [v4 respondWithError:v10];
  }
}

void __90__HMDSiriEndpointProfileMessageHandler_handleSiriEndpointDeleteSiriHistoryRequestMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138544130;
    id v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history failed for accessory uuid: %@ using hub accessories: %@ error: %@", (uint8_t *)&v10, 0x2Au);
  }
  [*(id *)(a1 + 56) respondWithError:v3];
}

void __90__HMDSiriEndpointProfileMessageHandler_handleSiriEndpointDeleteSiriHistoryRequestMessage___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Delete siri history succeeded for accessory uuid: %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 48) respondWithSuccess];
}

- (void)handleSiriEndpointApplyOnboardingSelectionsRequestMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling siri endpoint apply onboarding selections request message: %@", buf, 0x16u);
  }
  int v9 = [v4 messagePayload];
  if (v9)
  {
    int v10 = (void *)[objc_alloc(MEMORY[0x263F0E798]) initWithPayload:v9];
    if (v10)
    {
      __int16 v11 = [(HMDSiriEndpointProfileMessageHandler *)v6 dataSourceSiriEndpointOnboardingManager];
      if (v11)
      {
        uint64_t v12 = objc_msgSend(MEMORY[0x263F08C38], "hmf_zeroUUID");
        uint64_t v13 = [(HMDSiriEndpointProfileMessageHandler *)v6 dataSource];
        __int16 v14 = [(HMDSiriEndpointProfileMessageHandler *)v6 homeUUID];
        uint64_t v15 = [v13 userUUIDForMessage:v4 homeUUID:v14];

        __int16 v16 = [v10 onboardingSelections];
        id v17 = [v10 accessoryUUID];
        uint64_t v18 = [(HMDSiriEndpointProfileMessageHandler *)v6 homeUUID];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __98__HMDSiriEndpointProfileMessageHandler_handleSiriEndpointApplyOnboardingSelectionsRequestMessage___block_invoke;
        v27[3] = &unk_264A187F0;
        v27[4] = v6;
        id v28 = v4;
        [v11 applyOnboardingSelections:v16 accessoryUUID:v17 homeUUID:v18 userUUID:v15 completion:v27];
      }
      else
      {
        uint64_t v15 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
        [v4 respondWithError:v15];
      }
    }
    else
    {
      id v23 = (void *)MEMORY[0x230FBD990]();
      v24 = v6;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v30 = v26;
        __int16 v31 = 2112;
        id v32 = v9;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode onboarding message payload: %@", buf, 0x16u);
      }
      __int16 v11 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
      [v4 respondWithError:v11];
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = v6;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v22;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get onboarding message payload on message: %@", buf, 0x16u);
    }
    int v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
    [v4 respondWithError:v10];
  }
}

void __98__HMDSiriEndpointProfileMessageHandler_handleSiriEndpointApplyOnboardingSelectionsRequestMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      int v10 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Apply onboarding selections failed with error: %@", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v5];
  }
  else
  {
    if (v9)
    {
      __int16 v11 = HMFGetLogIdentifier();
      uint64_t v12 = HMSiriEndpointOnboardingResultAsString();
      int v16 = 138543618;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Apply result received from onboarding manager: %@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F0E7A0]) initWithOnboardingResult:a3];
    __int16 v14 = *(void **)(a1 + 40);
    uint64_t v15 = [v13 payloadCopy];
    [v14 respondWithPayload:v15];
  }
}

- (HMDSiriEndpointProfileMessageHandler)initWithHomeUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSiriEndpointProfileMessageHandler;
  id v6 = [(HMDSiriEndpointProfileMessageHandler *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_homeUUID, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14 != -1) {
    dispatch_once(&logCategory__hmf_once_t14, &__block_literal_global_29828);
  }
  id v2 = (void *)logCategory__hmf_once_v15;
  return v2;
}

void __51__HMDSiriEndpointProfileMessageHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v15;
  logCategory__hmf_once_uint64_t v15 = v0;
}

@end