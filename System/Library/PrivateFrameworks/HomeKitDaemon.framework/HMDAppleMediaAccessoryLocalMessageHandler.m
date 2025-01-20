@interface HMDAppleMediaAccessoryLocalMessageHandler
+ (id)logCategory;
- (HMDAppleMediaAccessoryLocalMessageHandler)initWithIdentifier:(id)a3 assistantSettingsConnection:(id)a4;
- (HMDAppleMediaAccessoryLocalMessageHandlerDataSource)dataSource;
- (HMDAssistantSettingsConnection)assistantSettingsConnection;
- (NSUUID)identifier;
- (id)dataSourceAccessoryWithUUID:(id)a3;
- (id)logIdentifier;
- (void)handleSiriEndpointDeleteSiriHistoryMessage:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation HMDAppleMediaAccessoryLocalMessageHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantSettingsConnection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (HMDAssistantSettingsConnection)assistantSettingsConnection
{
  return (HMDAssistantSettingsConnection *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDAppleMediaAccessoryLocalMessageHandlerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDAppleMediaAccessoryLocalMessageHandlerDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDAppleMediaAccessoryLocalMessageHandler *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)dataSourceAccessoryWithUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAppleMediaAccessoryLocalMessageHandler *)self dataSource];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 accessoryWithUUID:v4 forAppleMediaAccessoryLocalMessageHandler:self];
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get accessory with uuid: %@ due to no data source", (uint8_t *)&v13, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)handleSiriEndpointDeleteSiriHistoryMessage:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v38 = v8;
    __int16 v39 = 2112;
    id v40 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling siri endpoint delete siri history message: %@", buf, 0x16u);
  }
  v9 = [v4 messagePayload];
  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F0E7A8]) initWithPayload:v9];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 accessoryUUID];
      int v13 = [(HMDAppleMediaAccessoryLocalMessageHandler *)v6 dataSourceAccessoryWithUUID:v12];
      v14 = v13;
      if (v13)
      {
        __int16 v15 = [v13 endpointIdentifier];
        if (v15)
        {
          id v16 = [(HMDAppleMediaAccessoryLocalMessageHandler *)v6 assistantSettingsConnection];
          v35[0] = MEMORY[0x263EF8330];
          v35[1] = 3221225472;
          v35[2] = __88__HMDAppleMediaAccessoryLocalMessageHandler_handleSiriEndpointDeleteSiriHistoryMessage___block_invoke;
          v35[3] = &unk_264A2F3E8;
          id v36 = v4;
          [v16 deleteSiriHistoryWithEndpointUUID:v15 completionHandler:v35];

          uint64_t v17 = v36;
        }
        else
        {
          uint64_t v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
          v30 = (void *)MEMORY[0x230FBD990]();
          v31 = v6;
          v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v33 = v34 = v30;
            *(_DWORD *)buf = 138544130;
            v38 = v33;
            __int16 v39 = 2112;
            id v40 = v14;
            __int16 v41 = 2112;
            id v42 = v4;
            __int16 v43 = 2112;
            v44 = v17;
            _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to get endpoint identifier for accessory: %@ for delete siri history message: %@ error: %@", buf, 0x2Au);

            v30 = v34;
          }

          [v4 respondWithError:v17];
        }
      }
      else
      {
        __int16 v15 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
        v26 = (void *)MEMORY[0x230FBD990]();
        v27 = v6;
        v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v38 = v29;
          __int16 v39 = 2112;
          id v40 = v12;
          __int16 v41 = 2112;
          id v42 = v4;
          __int16 v43 = 2112;
          v44 = v15;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to get accessory with uuid: %@ for delete siri history message: %@ error: %@", buf, 0x2Au);
        }
        [v4 respondWithError:v15];
      }
    }
    else
    {
      v12 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      v22 = (void *)MEMORY[0x230FBD990]();
      v23 = v6;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v38 = v25;
        __int16 v39 = 2112;
        id v40 = v9;
        __int16 v41 = 2112;
        id v42 = v12;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode message payload from delete siri history message payload: %@ error: %@", buf, 0x20u);
      }
      [v4 respondWithError:v12];
    }
  }
  else
  {
    v11 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
    v18 = (void *)MEMORY[0x230FBD990]();
    v19 = v6;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v38 = v21;
      __int16 v39 = 2112;
      id v40 = v4;
      __int16 v41 = 2112;
      id v42 = v11;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get message payload from delete siri history message: %@ error: %@", buf, 0x20u);
    }
    [v4 respondWithError:v11];
  }
}

uint64_t __88__HMDAppleMediaAccessoryLocalMessageHandler_handleSiriEndpointDeleteSiriHistoryMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) respondWithError:a2];
  }
  v3 = *(void **)(a1 + 32);
  return [v3 respondWithSuccess];
}

- (HMDAppleMediaAccessoryLocalMessageHandler)initWithIdentifier:(id)a3 assistantSettingsConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    int v13 = (void *)_HMFPreconditionFailure();
    return (HMDAppleMediaAccessoryLocalMessageHandler *)+[HMDAppleMediaAccessoryLocalMessageHandler logCategory];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDAppleMediaAccessoryLocalMessageHandler;
  v10 = [(HMDAppleMediaAccessoryLocalMessageHandler *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_storeStrong((id *)&v11->_assistantSettingsConnection, a4);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_61063 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_61063, &__block_literal_global_61064);
  }
  v2 = (void *)logCategory__hmf_once_v7_61065;
  return v2;
}

void __56__HMDAppleMediaAccessoryLocalMessageHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v7_61065;
  logCategory__hmf_once_v7_61065 = v0;
}

@end