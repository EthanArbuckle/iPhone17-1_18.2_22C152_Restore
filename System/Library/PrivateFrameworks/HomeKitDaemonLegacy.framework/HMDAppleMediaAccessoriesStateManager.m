@interface HMDAppleMediaAccessoriesStateManager
+ (id)logCategory;
- (HMDAppleMediaAccessoriesStateManager)initWithIdentifier:(id)a3 messenger:(id)a4 metricsDispatcher:(id)a5;
- (HMDAppleMediaAccessoriesStateManagerDataSource)dataSource;
- (HMDAppleMediaAccessoriesStateManagerMetricsDispatcher)metricsDispatcher;
- (HMDAppleMediaAccessoriesStateMessenger)messenger;
- (NSUUID)identifier;
- (id)dataSourceAppleMediaAccessories;
- (id)logIdentifier;
- (id)remoteAppleMediaAccessories;
- (id)remoteAppleMediaAccessoriesByIdentifier;
- (id)sendModelIdentifierRequestMessageForAppleMediaAccessory:(id)a3 accessoryIdentifier:(id)a4;
- (void)_correctStateForMatchingIdentifier:(id)a3 appleMediaAccessories:(id)a4 sendList:(id)a5;
- (void)appleMediaAccessoriesStateMessenger:(id)a3 didReceiveModelIdentifierRequestMessage:(id)a4 withAccessoryIdentifier:(id)a5;
- (void)correctStateForMatchingAppleMediaAccessories:(id)a3 modelIdentifier:(id)a4;
- (void)correctStateForMatchingIdentifier:(id)a3 appleMediaAccessories:(id)a4;
- (void)run;
- (void)runMultipleIdentifierCorrectionSequence;
- (void)setDataSource:(id)a3;
@end

@implementation HMDAppleMediaAccessoriesStateManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (HMDAppleMediaAccessoriesStateManagerMetricsDispatcher)metricsDispatcher
{
  return (HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (HMDAppleMediaAccessoriesStateMessenger)messenger
{
  return (HMDAppleMediaAccessoriesStateMessenger *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDAppleMediaAccessoriesStateManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDAppleMediaAccessoriesStateManagerDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDAppleMediaAccessoriesStateManager *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)dataSourceAppleMediaAccessories
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAppleMediaAccessoriesStateManager *)self dataSource];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 appleMediaAccessoriesForStateManager:self];
  }
  else
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source apple media accessories due to no data source", (uint8_t *)&v11, 0xCu);
    }
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)remoteAppleMediaAccessories
{
  v2 = [(HMDAppleMediaAccessoriesStateManager *)self dataSourceAppleMediaAccessories];
  v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_850);

  return v3;
}

uint64_t __67__HMDAppleMediaAccessoriesStateManager_remoteAppleMediaAccessories__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentAccessory] ^ 1;
}

- (id)remoteAppleMediaAccessoriesByIdentifier
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [(HMDAppleMediaAccessoriesStateManager *)self remoteAppleMediaAccessories];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v25;
    *(void *)&long long v5 = 138543618;
    long long v21 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier", v21);
        if (v10)
        {
          uint64_t v11 = [v3 objectForKey:v10];
          v12 = (void *)v11;
          uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
          if (v11) {
            uint64_t v13 = (void *)v11;
          }
          id v14 = v13;

          v15 = [v14 arrayByAddingObject:v9];

          [v3 setObject:v15 forKey:v10];
        }
        else
        {
          v16 = (void *)MEMORY[0x1D9452090]();
          v17 = self;
          v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v21;
            v29 = v19;
            __int16 v30 = 2112;
            v31 = v9;
            _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get identifier for apple media accessory: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)correctStateForMatchingAppleMediaAccessories:(id)a3 modelIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Correcting state for matching apple media accessories: %@ model identifier: %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  id v21 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __101__HMDAppleMediaAccessoriesStateManager_correctStateForMatchingAppleMediaAccessories_modelIdentifier___block_invoke;
  v17 = &unk_1E6A052C8;
  id v12 = v7;
  id v18 = v12;
  v19 = buf;
  objc_msgSend(v6, "na_each:", &v14);
  if (*(void *)(*(void *)&buf[8] + 24))
  {
    uint64_t v13 = [(HMDAppleMediaAccessoriesStateManager *)v9 metricsDispatcher];
    [v13 submitMatchingIdentifierRemovalEventWithRemovalCount:*(void *)(*(void *)&buf[8] + 24)];
  }
  _Block_object_dispose(buf, 8);
}

void __101__HMDAppleMediaAccessoriesStateManager_correctStateForMatchingAppleMediaAccessories_modelIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 uuid];
  char v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  if ((v4 & 1) == 0)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    [v5 sendRemovalRequest];
  }
}

- (id)sendModelIdentifierRequestMessageForAppleMediaAccessory:(id)a3 accessoryIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F7A0D8];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  v10 = [(HMDAppleMediaAccessoriesStateManager *)self messenger];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __116__HMDAppleMediaAccessoriesStateManager_sendModelIdentifierRequestMessageForAppleMediaAccessory_accessoryIdentifier___block_invoke;
  v16[3] = &unk_1E6A052A0;
  v16[4] = self;
  id v17 = v6;
  id v11 = v9;
  id v18 = v11;
  id v12 = v6;
  [v10 sendModelIdentifierRequestMessageToAppleMediaAccessory:v12 withAccessoryIdentifier:v8 completion:v16];

  uint64_t v13 = v18;
  id v14 = v11;

  return v14;
}

void __116__HMDAppleMediaAccessoriesStateManager_sendModelIdentifierRequestMessageForAppleMediaAccessory_accessoryIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 48) finishWithResult:v6];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543874;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch model identifier from apple media accessory: %@ error: %@", (uint8_t *)&v12, 0x20u);
    }
    if (!v5)
    {
      id v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    }
    [*(id *)(a1 + 48) finishWithError:v5];
  }
}

- (void)_correctStateForMatchingIdentifier:(id)a3 appleMediaAccessories:(id)a4 sendList:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 count])
  {
    uint64_t v11 = [v10 firstObject];
    [v10 removeObjectAtIndex:0];
    int v12 = [(HMDAppleMediaAccessoriesStateManager *)self sendModelIdentifierRequestMessageForAppleMediaAccessory:v11 accessoryIdentifier:v8];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __106__HMDAppleMediaAccessoriesStateManager__correctStateForMatchingIdentifier_appleMediaAccessories_sendList___block_invoke;
    v24[3] = &unk_1E6A0D6F0;
    v24[4] = self;
    id v13 = v9;
    id v25 = v13;
    id v14 = (id)[v12 addSuccessBlock:v24];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __106__HMDAppleMediaAccessoriesStateManager__correctStateForMatchingIdentifier_appleMediaAccessories_sendList___block_invoke_2;
    v20[3] = &unk_1E6A143D0;
    v20[4] = self;
    id v21 = v8;
    id v22 = v13;
    id v23 = v10;
    id v15 = (id)[v12 addFailureBlock:v20];
  }
  else
  {
    __int16 v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v27 = v19;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to correct matching identifier state for identifier %@", buf, 0x16u);
    }
  }
}

uint64_t __106__HMDAppleMediaAccessoriesStateManager__correctStateForMatchingIdentifier_appleMediaAccessories_sendList___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) correctStateForMatchingAppleMediaAccessories:*(void *)(a1 + 40) modelIdentifier:a2];
}

uint64_t __106__HMDAppleMediaAccessoriesStateManager__correctStateForMatchingIdentifier_appleMediaAccessories_sendList___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _correctStateForMatchingIdentifier:*(void *)(a1 + 40) appleMediaAccessories:*(void *)(a1 + 48) sendList:*(void *)(a1 + 56)];
}

- (void)correctStateForMatchingIdentifier:(id)a3 appleMediaAccessories:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v13 = 138543874;
    id v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Correcting state for matching identifier: %@ apple media accessories: %@", (uint8_t *)&v13, 0x20u);
  }
  int v12 = (void *)[v7 mutableCopy];
  [(HMDAppleMediaAccessoriesStateManager *)v9 _correctStateForMatchingIdentifier:v6 appleMediaAccessories:v7 sendList:v12];
}

- (void)runMultipleIdentifierCorrectionSequence
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  char v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v22 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Running multiple identifier correction sequence", buf, 0xCu);
  }
  id v7 = [(HMDAppleMediaAccessoriesStateManager *)v4 remoteAppleMediaAccessoriesByIdentifier];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = objc_msgSend(v7, "allKeys", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v14 = [v7 objectForKey:v13];
        if ((unint64_t)[v14 count] >= 2)
        {
          __int16 v15 = [(HMDAppleMediaAccessoriesStateManager *)v4 metricsDispatcher];
          objc_msgSend(v15, "submitMatchingIdentifierEventWithMatchingCount:", objc_msgSend(v14, "count"));

          [(HMDAppleMediaAccessoriesStateManager *)v4 correctStateForMatchingIdentifier:v13 appleMediaAccessories:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)run
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  char v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Configuring apple media accessories state manager", (uint8_t *)&v7, 0xCu);
  }
  [(HMDAppleMediaAccessoriesStateManager *)v4 runMultipleIdentifierCorrectionSequence];
}

- (HMDAppleMediaAccessoriesStateManager)initWithIdentifier:(id)a3 messenger:(id)a4 metricsDispatcher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  int v12 = v11;
  if (!v11)
  {
LABEL_9:
    long long v16 = (void *)_HMFPreconditionFailure();
    return (HMDAppleMediaAccessoriesStateManager *)+[HMDAppleMediaAccessoriesStateManager logCategory];
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDAppleMediaAccessoriesStateManager;
  uint64_t v13 = [(HMDAppleMediaAccessoriesStateManager *)&v18 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_messenger, a4);
    objc_storeStrong((id *)&v14->_metricsDispatcher, a5);
  }

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8 != -1) {
    dispatch_once(&logCategory__hmf_once_t8, &__block_literal_global_16);
  }
  v2 = (void *)logCategory__hmf_once_v9;
  return v2;
}

uint64_t __51__HMDAppleMediaAccessoriesStateManager_logCategory__block_invoke()
{
  logCategory__hmf_once_id v9 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

- (void)appleMediaAccessoriesStateMessenger:(id)a3 didReceiveModelIdentifierRequestMessage:(id)a4 withAccessoryIdentifier:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(HMDAppleMediaAccessoriesStateManager *)self dataSourceAppleMediaAccessories];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = (HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)(id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [(HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v31 = v9;
    id v32 = v8;
    id v14 = 0;
    uint64_t v15 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v11);
        }
        SEL v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_super v18 = objc_msgSend(v17, "identifier", v31);
        if ([v18 isEqualToString:v10])
        {
          int v19 = [v17 isCurrentAccessory];

          if (v19)
          {
            if (v14)
            {
              long long v26 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12];
              id v9 = v31;
              [v31 respondWithError:v26];

              long long v24 = v11;
              id v8 = v32;
              goto LABEL_22;
            }
            id v14 = [v17 uuid];
          }
        }
        else
        {
        }
      }
      uint64_t v13 = [(HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    id v9 = v31;
    id v8 = v32;
    if (v14)
    {
      v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v38 = v23;
        __int16 v39 = 2112;
        id v40 = v14;
        __int16 v41 = 2112;
        id v42 = v10;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Responding with found model identifier: %@ for accessory identifier: %@", buf, 0x20u);
      }
      long long v24 = [[HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload alloc] initWithModelIdentifier:v14];
      id v25 = [(HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)v24 payloadCopy];
      [v31 respondWithPayload:v25];

      goto LABEL_22;
    }
  }
  else
  {
  }
  long long v27 = (void *)MEMORY[0x1D9452090]();
  __int16 v28 = self;
  id v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    uint64_t v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v38 = v30;
    __int16 v39 = 2112;
    id v40 = v10;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine the model identifier for a current accessory with identifier: %@", buf, 0x16u);
  }
  long long v24 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
  [v9 respondWithError:v24];
  id v14 = 0;
LABEL_22:
}

@end